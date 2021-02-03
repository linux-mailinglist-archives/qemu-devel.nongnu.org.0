Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE8830D108
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 02:53:13 +0100 (CET)
Received: from localhost ([::1]:46342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l77M0-0002WH-5M
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 20:53:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@avery-design.com>)
 id 1l76NE-0002H7-Jm
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 19:50:25 -0500
Received: from server.avery-design.com ([198.57.169.184]:48542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@avery-design.com>)
 id 1l76NA-0004HT-2y
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 19:50:24 -0500
Received: from static-71-162-116-19.bstnma.fios.verizon.net
 ([71.162.116.19]:38754 helo=server4)
 by server.avery-design.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <chris@avery-design.com>)
 id 1l76Fn-0001K0-Q7; Wed, 03 Feb 2021 00:42:43 +0000
Date: Tue, 2 Feb 2021 19:48:56 -0500 (EST)
From: Chris Browy <chris@avery-design.com>
X-X-Sender: chris@server4
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v1 00/01] PCIe DOE for PCIe and CXL 2.0
In-Reply-To: <alpine.LRH.2.23.451.2102021236150.13496@server4>
Message-ID: <alpine.LRH.2.23.451.2102021944530.19717@server4>
References: <alpine.LRH.2.23.451.2102021236150.13496@server4>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="-1463770623-2131061259-1612313364=:19717"
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.avery-design.com
X-AntiAbuse: Original Domain - nongnu.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - avery-design.com
X-Get-Message-Sender-Via: server.avery-design.com: authenticated_id:
 avery_cxl@avery-design.com
X-Authenticated-Sender: server.avery-design.com: avery_cxl@avery-design.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Received-SPF: pass client-ip=198.57.169.184;
 envelope-from=chris@avery-design.com; helo=server.avery-design.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 02 Feb 2021 20:51:01 -0500
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463770623-2131061259-1612313364=:19717
Content-Type: text/plain; charset=ISO-8859-7; format=flowed
Content-Transfer-Encoding: 8BIT

  PCIe Data Object Exchange (DOE) protocol for PCIe and CXL is available
>
> https://gitlab.com/avery-qemu/cxl2.0-v3-doe/
>
> based on Ben Widawsky's CXL QEMU cxl2.0-v3 gitlab branch
>
> https://lore.kernel.org/qemu-devel/20210202005948.241655-1-ben.widawsky@intel.com
>
> which is located at
>
> https://gitlab.com/bwidawsk/qemu
>
> The changes from Ben¢s latest cxl-2.0v3 are:
>
>  MAINTAINERS                               |   7 +
>  hw/cxl/cxl-component-utils.c              | 151 +++++++++++
>  hw/mem/cxl_type3.c                        | 121 +++++++++
>  hw/pci/meson.build                        |   1 +
>  hw/pci/pcie.c                             |   4 +-
>  hw/pci/pcie_doe.c                         | 360 +++++++++++++++++++++++++
>  include/hw/cxl/cxl_component.h            | 120 +++++++++
>  include/hw/cxl/cxl_pci.h                  | 428
>  ++++++++++++++++++++++++++++++
>  include/hw/pci/pcie.h                     |   5 +
>  include/hw/pci/pcie_doe.h                 | 130 +++++++++
>  include/hw/pci/pcie_regs.h                |   4 +
>  include/standard-headers/linux/pci_regs.h |   3 +-
>  12 files changed, 1332 insertions(+), 2 deletions(-)
>
> The DOE protocol defines a mailbox method that allows either UEFI or OS 
> methods
> to read the device and do further setup of ACPI tables, etc.
>
> There are 2 PCIe DOE protocols (PCI-SIG ECN Data Object Exchange (DOE) March 
> 2020)
> - Discovery
> - Component Measurement (CMA)
>
> And 2 CXL specific ones:
> - Compliance Mode (Compute Express Link Specification September 2, 2020
>                   Revision: 2.0, Version 1.0)
> - CDAT (Coherent Device Attribute Table (CDAT) Specification
>                    October 2020 Revision 1.02)
>
> For CXL, the CDAT table defines the memory device so that UEFI or OS can read 
> it out of device using DOE and then can configure the system¢s ACPI SRAT/HMAT
> tables for system memory, and DEVSEC, Component, and Device registers in CXL
> device.
>
> Current version provides fixed CDAT table defined in the CXL Type3 device
> model. Updates are planned shortly to allow for user to provide CDAT tables
> through -device option property to vary from run to run.  The format will be
> ASCII with structure/field-values pairs that are read by the device during
> initialization as shown here:
>
> -device 
> cxl-type3,bus=rp0,memdev=cxl-mem1,id=cxl-pmem0,size=256M,cdat_file=<filename>
>
> For testing, a cxl_app.c user program is enhanced to test all supported DOE 
> protocols which are comprised of sequences of CFG RD/WR to various DOE cap
> registers.  The Linux kernel updates and CXL Type3 Device driver provide 
> sufficient ioctl() support to exercise the DOE protocol. See
>
> https://lore.kernel.org/linux-cxl/20210130002438.1872527-1-ben.widawsky@intel.com
>
> ======== cxl_app.c
> #include <stdio.h>
> #include <unistd.h>
> #include <sys/ioctl.h>
> #include <string.h>
> #include <fcntl.h>
>
> #include "cxl_mem_wrapper.h"
>
> const char* help= "\
> -h                           help message\n\
> -query                       IOCTL CXL_MEM_QUERY_COMMANDS\n\
> -cfg_rd [0xoffset]           IOCTL CXL_MEM_CONFIG_WR Read Hex\n\
> -cfg_wr [0xoffset] [0xaddr]  IOCTL CXL_MEM_CONFIG_WR Write Hex\n\
> -doe_discovery [0xindex=0-3] IOCTL CXL_MEM_CONFIG_WR Write Hex\n\
> -doe_cxl [0xprotocol=0 or 2] [0xreq_code=0,1 for protocol=0]\n\
> -doe_cma [0xnum = 0]         IOCTL CXL_MEM_CONFIG_WR Write Hex\n\
> example:\n\
> ./cxl_app.exe -cfg_rd 0x00\n\
> ./cxl_app.exe -cfg_wr 0x10 0x00ff0004\n\
> ./cxl_app.exe -doe_discovery 0\n\
> ./cxl_app.exe -doe_cxl 2\n\
> ./cxl_app.exe -doe_cxl 0 1\n\
> ./cxl_app.exe -doe_cma 0\n\
> ";
> #define READ  0 #define WRITE 1
>
> int FD;
> typedef struct cxl_pdev_config cxl_pdev_config;
>
> int cxl_query() {
>     typedef struct cxl_mem_query_commands cxl_mem_query_commands;
>     typedef struct cxl_command_info cxl_command_info;
>     int n_cmds= 0;
>     // QUERY with n_commands == 0 to get command size
>     ioctl(FD, CXL_MEM_QUERY_COMMANDS, &n_cmds);
>     printf("Querying\n");
>
>     cxl_mem_query_commands* cmds= malloc(sizeof(cxl_mem_query_commands)
>                                 + n_cmds * sizeof(cxl_command_info));
>     cmds->n_commands= n_cmds;
>     // QUERY with command size & pre-alloc memory
>     ioctl(FD, CXL_MEM_QUERY_COMMANDS, cmds);
>
>     for (int i= 0; i < (int)cmds->n_commands; i++) {
>         printf(" id %d", cmds->commands[i].id);
>         printf(" flags %d", cmds->commands[i].flags);
>         printf(" size_in %d", cmds->commands[i].size_in);
>         printf(" size_out %d\n", cmds->commands[i].size_out);
>     }
>
>    return 0;
> };
>
> int cxl_config(char* offset_s, char* data_s) {
>     int offset, data, is_write;
>     cxl_pdev_config* config_payload= malloc(sizeof(cxl_pdev_config));
>     if (data_s == NULL)
>     	is_write= 0;
>     else {
>         is_write= 1;
>         data= strtol(data_s, NULL, 16);
>     }
>     offset= strtol(offset_s, NULL, 16);
>
>     config_payload->offset= offset;
>     config_payload->data= data;
>     config_payload->is_write= is_write;
>     ioctl(FD, CXL_MEM_CONFIG_WR, config_payload);
>     printf("CONFIG_WR %s [%0x] ", (is_write)? "write" : "read",
>     		    config_payload->offset);
>     for (int i= 0; i < 32; i += 8) printf(" %02x", (config_payload->data >>
>     i) & 0xff);
>     printf("\n");
>
>    return 0;
> };
>
> void doe_config(cxl_pdev_config* config_payload, uint32_t offset, uint32_t 
> data, uint32_t is_write) {
>     config_payload->offset= offset;
>     config_payload->data= data;
>     config_payload->is_write= is_write;
>     ioctl(FD, CXL_MEM_CONFIG_WR, config_payload);
>     printf("CONFIG_%s [%0x] ", (is_write)? "WR": "RD",
>     		    config_payload->offset);
>     for (int i= 0; i < 32; i += 8) printf(" %02x", (config_payload->data >>
>     i) & 0xff);
>     printf("\n");
> };
>
> int cxl_doe_cxl(char* entry_s, char* data_s) {
>     cxl_pdev_config* config_payload= malloc(sizeof(cxl_pdev_config));
>     uint32_t data_obj[3];
>     int length;
>     uint32_t do_type;
>     uint32_t req_type;
>
>     do_type = strtol(entry_s, NULL, 16);
>     req_type = strtol(data_s, NULL, 16);
>     printf("DOE TYPE=%0x\n", do_type);
>     printf("REQ TYPE=%0x\n", req_type);
>     if (do_type == 0)
>     	data_obj[0] = 0x00001e98;
>     if (do_type == 2)
>     	data_obj[0] = 0x00021e98;
>     data_obj[1] = 0x3;
>     data_obj[2] = req_type;
>     printf("data_obj[0]=%x\n", data_obj[0]);
>     printf("data_obj[1]=%x\n", data_obj[1]);
>     printf("data_obj[2]=%x\n", data_obj[2]);
>
>    printf("DOE\n");
>
>     doe_config(config_payload, 0x170, data_obj[0], WRITE);
>     doe_config(config_payload, 0x170, data_obj[1], WRITE);
>     doe_config(config_payload, 0x170, data_obj[2], WRITE);
>
>     /* Set GO */
>     doe_config(config_payload, 0x168, 0x80000000, WRITE);
>     /* check status READY is set 16c */
>     doe_config(config_payload, 0x16c, 0, READ);
>
>     /* read cdat response */
>     doe_config(config_payload, 0x174, 0, READ);
>
>     /* write cdat response success */
>     doe_config(config_payload, 0x174, 0x00000001, WRITE);
>
>     /* read cdat response */
>     doe_config(config_payload, 0x174, 0, READ);
>
>     length = config_payload->data & 0x0000ffff;
>     printf("DOE RSP LENGTH = %0d\n", length);
>
>     /* write cdat response success */
>     doe_config(config_payload, 0x174, 0x00000001, WRITE);
>
>     for (int j= 0; j < length-2; j=j+1) {
>    	     /* read cdat response */
>    	 doe_config(config_payload, 0x174, 0, READ);
>
>    	     /* write cdat response success */
>     	doe_config(config_payload, 0x174, 0x00000001, WRITE);
>     }
>     return 0;
>
> };
>
>
> int cxl_doe_cma(char* entry_s, char* data_s) {
>     cxl_pdev_config* config_payload= malloc(sizeof(cxl_pdev_config));
>     uint32_t data_obj[3];
>
>     data_obj[0] = 0x00010001;
>     data_obj[1] = 0x3;
>     data_obj[2] = strtol(entry_s, NULL, 16);
>
>     printf("DOE\n");
>     doe_config(config_payload, 0x170, data_obj[0], WRITE);
>     doe_config(config_payload, 0x170, data_obj[1], WRITE);
>     doe_config(config_payload, 0x170, data_obj[2], WRITE);
>
>     /* Set GO */
>     doe_config(config_payload, 0x168, 0x80000000, WRITE);
>
>     /* check status READY is set 16c */
>     doe_config(config_payload, 0x16c, 0, READ);
>
>     /* read Discovery response */
>     doe_config(config_payload, 0x174, 0, READ);
>
>    doe_config(config_payload, 0x168, 0x1, WRITE);
>
>     /* check status READY is set 16c */
>     doe_config(config_payload, 0x16c, 0, READ);
> };
>
> int cxl_doe_discovery(char* entry_s, char* data_s) {
>     cxl_pdev_config* config_payload= malloc(sizeof(cxl_pdev_config));
>     uint32_t data_obj[3];
>
>     data_obj[0] = 0x00000001;
>     data_obj[1] = 0x3;
>     data_obj[2] = strtol(entry_s, NULL, 16);
>
>     printf("DOE\n");
>     doe_config(config_payload, 0x170, data_obj[0], WRITE);
>     doe_config(config_payload, 0x170, data_obj[1], WRITE);
>     doe_config(config_payload, 0x170, data_obj[2], WRITE);
>
>     /* Set GO */
>     doe_config(config_payload, 0x168, 0x80000000, WRITE);
>
>     /* check status READY is set 16c */
>     doe_config(config_payload, 0x16c, 0, READ);
>
>     /* read Discovery response */
>     doe_config(config_payload, 0x174, 0, READ);
>
>     /* write Discovery response success */
>     doe_config(config_payload, 0x174, 0x00000001, WRITE);
>
>    doe_config(config_payload, 0x174, 0, READ);
>
>     /* write Discovery response success */
>     doe_config(config_payload, 0x174, 0x00000002, WRITE);
>
>    doe_config(config_payload, 0x174, 0, READ);
>
>     /* write Discovery response success */
>     doe_config(config_payload, 0x174, 0x00000003, WRITE);
>
>    return 0;
> };
>
> int parse_input(int argc, char** argv) {
>     int idx;
>     if (argc < 2) return -1;
>     for (idx= 0; idx < argc; idx++) {
>         if (strcmp(argv[idx], "-h") == 0)
>             return -1;
>         if (strcmp(argv[idx], "-query") == 0)
>             return cxl_query();
>         if (strcmp(argv[idx], "-cfg_rd") == 0)
>             return cxl_config(argv[idx + 1], NULL);
>         if (strcmp(argv[idx], "-cfg_wr") == 0)
>             return cxl_config(argv[idx + 1], argv[idx + 2]);
>         if (strcmp(argv[idx], "-doe_discovery") == 0)
>             return cxl_doe_discovery(argv[idx + 1], NULL);
>         if (strcmp(argv[idx], "-doe_cxl") == 0)
>             return cxl_doe_cxl(argv[idx + 1], argv[idx + 2]);
>         if (strcmp(argv[idx], "-doe_cma") == 0)
>             return cxl_doe_cma(argv[idx + 1], NULL);
>     }
>     return 0;
> };
>
> int main(int argc, char** argv) {
>     int ret;
>     char* dev_path= "/dev/cxl/mem0";
>
>     if ((FD= open(dev_path, O_RDWR)) < 0) {
>         printf("Open error loc: %s\n", dev_path);
>         printf("Try sudo %s\n", argv[0]);
>         exit(0);
>     }
>
>     if ((ret= parse_input(argc, argv)) < 0) {
>         printf("Please specify input ");
>         for (int i= 0; i < argc; i++) printf(" %s", argv[i]);;
>           printf("\n%s\n", help);
>     }
>     printf("DOE\n");
>
>     close(FD);
>     exit(0);
> }
>
> ========
>
> The QEMU script to run is
>
> sudo $QEMU_HOME/qemu/build/x86_64-softmmu/qemu-system-x86_64 \
> -nic user,hostfwd=tcp::2222-:22,hostfwd=tcp::1234-:1234 \
> -machine q35,accel=kvm,nvdimm,cxl \
> -m 8192M,slots=4,maxmem=40964M \
> -smp 8,sockets=2,cores=2,threads=2 \
> -enable-kvm \
> -boot order=d \
> -k 'en-us' \
> -vga virtio \
> -drive 
> if=pflash,format=raw,readonly,file=$TIANOCORE_HOME/edk2/Build/OvmfX64/DEBUG_GCC5/FV/OVMF_CODE.fd 
> \
> -drive 
> if=pflash,format=raw,file=$TIANOCORE_HOME/edk2/Build/OvmfX64/DEBUG_GCC5/FV/OVMF_VARS.fd 
> \
> -drive file=$QCOW_HOME/ubuntu_20.qcow,format=qcow2 \
> -object memory-backend-file,id=cxl-mem1,share,mem-path=cxl-type3,size=512M \
> -object memory-backend-file,id=cxl-mem2,share,mem-path=cxl-mem2,size=512M" \
> -device 
> pxb-cxl,id=cxl.0,bus=pcie.0,bus_nr=52,uid=0,len-window-base=1,window-base[0]=0x4c0000000,memdev[0]=cxl-mem1 
> \
> -device cxl-rp,id=rp0,bus=cxl.0,addr=0.0,chassis=0,slot=0 \
> -device cxl-type3,bus=rp0,memdev=cxl-mem1,id=cxl-pmem0,size=256M,lsa=cxl-mem2 
> \
> -object memory-backend-ram,id=mem0,size=2048M \
> -numa node,nodeid=0,memdev=mem0, \
> -numa cpu,node-id=0,socket-id=0 \
> -object memory-backend-ram,id=mem1,size=2048M \
> -numa node,nodeid=1,memdev=mem1, \
> -numa cpu,node-id=1,socket-id=1 \
> -object memory-backend-ram,id=mem2,size=2048M \
> -numa node,nodeid=2,memdev=mem2, \
> -object memory-backend-ram,id=mem3,size=2048M \
> -numa node,nodeid=3,memdev=mem3, \
> -numa node,nodeid=4, \
> -object 
> memory-backend-file,id=nvmem0,share,mem-path=nvdimm-0,size=16384M,align=1G \
> -device nvdimm,memdev=nvmem0,id=nv0,label-size=2M,node=4 \
> -numa node,nodeid=5, \
> -object 
> memory-backend-file,id=nvmem1,share,mem-path=nvdimm-1,size=16384M,align=1G \
> -device nvdimm,memdev=nvmem1,id=nv1,label-size=2M,node=5 \
> -numa dist,src=0,dst=0,val=10 \
> -numa dist,src=0,dst=1,val=21 \
> -numa dist,src=0,dst=2,val=12 \
> -numa dist,src=0,dst=3,val=21 \
> -numa dist,src=0,dst=4,val=17 \
> -numa dist,src=0,dst=5,val=28 \
> -numa dist,src=1,dst=1,val=10 \
> -numa dist,src=1,dst=2,val=21 \
> -numa dist,src=1,dst=3,val=12 \
> -numa dist,src=1,dst=4,val=28 \
> -numa dist,src=1,dst=5,val=17 \
> -numa dist,src=2,dst=2,val=10 \
> -numa dist,src=2,dst=3,val=21 \
> -numa dist,src=2,dst=4,val=28 \
> -numa dist,src=2,dst=5,val=28 \ -numa dist,src=3,dst=3,val=10 \
> -numa dist,src=3,dst=4,val=28 \
> -numa dist,src=3,dst=5,val=28 \
> -numa dist,src=4,dst=4,val=10 \
> -numa dist,src=4,dst=5,val=28 \
> -numa dist,src=5,dst=5,val=10
>
>
---1463770623-2131061259-1612313364=:19717--

