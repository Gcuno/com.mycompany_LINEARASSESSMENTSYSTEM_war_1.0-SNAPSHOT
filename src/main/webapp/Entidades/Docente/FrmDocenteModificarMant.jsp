<%@page import="BEAN.DocenteBean" %>
<%@page import="BEAN.CarreraProfesionalBean"%>
<%@page import="java.util.ArrayList;" %>
<%!
    String  msj;
    DocenteBean  objDocenteBean = null;
    ArrayList<CarreraProfesionalBean>    listaCarreraProfesional=null;
%>
<% 
  objDocenteBean=(DocenteBean)request.getAttribute("datos");
  listaCarreraProfesional=(ArrayList<CarreraProfesionalBean>)request.getAttribute("listaCarreraProfesional");
%>

<!DOCTYPE html>
<html>
    <body onload="cargarFoco()">
                        <input type="hidden" name="op">
                        <input type="hidden" name="hddcodigo" value="<%=objDocenteBean.getCODDOCENTE()%>">
                        <div class="alert alert-info">
                            <h4><strong><center>Mantenimiento de la Tabla Docente<br><br>Modificar Docente</center></strong></h4>                            
                        </div>                         
			<div class="panel-body">                                              
				<div class="form-horizontal" role="form">    
                                     <%
                          if(request.getAttribute("mensaje")!=null){
                              msj=(String)request.getAttribute("mensaje");                            
                         
                       %>                                                  
                           <div class="alert alert-success">
                              <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                               <strong><%=msj%></strong>

                            </div>              
                       <%   }
                        %>                     
                                              <div class="form-group">
						<label for="Tipo" class="col-lg-3 control-label">Tipo :</label>
						<div class="col-lg-8">
							<select   name="cbocarrera" id="cbocarrera" class="form-control"  onchange="colocarFocoComboAlumno()" required="required">
                                                           
                                                            
                                                        
                                                          
                                                           <% 
                                                               
                                                             for(CarreraProfesionalBean obj:listaCarreraProfesional)
                                                             { 
                                                                if(objDocenteBean.getCODCARRERA()==obj.getCODCARRERA()) 
                                                                {
                                                             %>                                     
                                                                <option   selected   value="<%=obj.getCODCARRERA()%>"><%=obj.getNOMBCARRERA()%></option>

                                                             <% }else{ %>    

                                                                <option     value="<%=obj.getCODCARRERA()%>"><%=obj.getNOMBCARRERA()%></option>  

                                                            <%  } } %>
                                                          
                                                          
                                                          
                                                        </select>
						</div>
					       </div>      
                                                   
                                                <div class="form-group">
						<label for="codigo" class="col-lg-3 control-label">Codigo:</label>
						<div class="col-lg-8">
							<input type="text"   name="txtcodigo" disabled="false" value="<%=objDocenteBean.getCODDOCENTE()%>" class="form-control" >
						</div>
					</div>
					<div class="form-group">
						<label for="Nombre" class="col-lg-3 control-label">Nombre:</label>
						<div class="col-lg-8">
							<input type="text" id="txtnombre" placeholder="Ingrese nombre..."  class="form-control"  value="<%=objDocenteBean.getNOMBDOCENTE()%>">
						</div>
					</div>                                       
                                        <div class="form-group">
						<label for="Nombre" class="col-lg-3 control-label">Apellido Paterno :</label>
						<div class="col-lg-8">
							<input type="text" name="txtapelpate" id="txtapelpate" placeholder="Ingrese Apellido Paterno ..."  class="form-control" value="<%=objDocenteBean.getAPEPATERDOCENTE()%>" >
						</div>
					</div>
                                        <div class="form-group">
						<label for="Nombre" class="col-lg-3 control-label">Apellido Materno :</label>
						<div class="col-lg-8">
							<input type="text" name="txtapelmate" id="txtapelmate"  id="txtapelpate" placeholder="Ingrese Apellido Materno ..."  class="form-control"  value="<%=objDocenteBean.getAPEMATERDOCENTE()%>">
						</div>
					</div>
                                        <div class="form-group">
						<label for="Usuario" class="col-lg-3 control-label">Usuario :</label>
						<div class="col-lg-8">
							<input type="text" name="txtusuario"   id="txtusuario" placeholder="Ingrese Usuario ..."  class="form-control"  value="<%=objDocenteBean.getUSUARIO()%>">
						</div>
					</div>
                                        <div class="form-group">
						<label for="Clave" class="col-lg-3 control-label">Clave :</label>
						<div class="col-lg-8">
                                                    <input type="password" name="txtclave"  id="txtclave" placeholder="Ingrese Clave ..."  class="form-control"  value="<%=objDocenteBean.getCLAVE()%>">
						</div>
					</div>
                                                <div class="form-group">
						<label for="Tipo" class="col-lg-3 control-label">Tipo :</label>
						<div class="col-lg-8">
                                                    <%
                                                        String verA="";
                                                        String verI="";
                                                        if(objDocenteBean.getESTADO().equals("A")) verA="selected='selected'";
                                                        else verI="selected='selected'";
                                                        %>
							<select name="cboestado"  id="cboestado"  class="form-control" >
                                                            <option <%=verA%> value="A">HABILITADO</option>
                                                            <option <%=verI%> value="I">DESABILITADO</option>
                                                        </select>
						</div>
					       </div> 
					<hr>
					<div class="form-group text-center">						
						<button type="submit" class="btn btn-primary" onclick="ModificarDocente('<%=objDocenteBean.getCODDOCENTE()%>','<%=request.getContextPath()%>')" >
							<img src="<%=request.getContextPath()%>/imagenes/modificar.png"   width="20px" height="20px"  alt="Modificar">Mofidicar
						</button>
                                                <button type="submit" class="btn btn-primary" onclick="salir('<%=request.getContextPath()%>','Alumno',5,'')"  >
							<img src="<%=request.getContextPath()%>/imagenes/salirdatos.png"   width="20px" height="20px"  alt="Salir">Salir
						</button>
					</div>
				</div>
			</div>	
  </div>        
    </body>
</html>
            
