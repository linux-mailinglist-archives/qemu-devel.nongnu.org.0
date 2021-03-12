Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 227FB338C14
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 12:58:25 +0100 (CET)
Received: from localhost ([::1]:36370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKgQu-0005nA-3R
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 06:58:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1lKgOf-0004qb-VG
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 06:56:01 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1lKgOd-0007wy-R4
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 06:56:01 -0500
Received: from fraeml701-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Dxkd970lMz67tbK;
 Fri, 12 Mar 2021 19:49:49 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml701-chm.china.huawei.com (10.206.15.50) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Fri, 12 Mar 2021 12:55:52 +0100
Received: from localhost (10.47.81.238) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Fri, 12 Mar
 2021 11:55:51 +0000
Date: Fri, 12 Mar 2021 11:54:37 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Chris Browy <cbrowy@avery-design.com>
Subject: Re: [RFC PATCH v3 cxl-2.0-doe 0/2] Version 3 patch series for PCIe
 DOE for PCIe and CXL 2.0
Message-ID: <20210312115437.00003667@Huawei.com>
In-Reply-To: <1615322029-13038-1-git-send-email-cbrowy@avery-design.com>
References: <1615322029-13038-1-git-send-email-cbrowy@avery-design.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.81.238]
X-ClientProxiedBy: lhreml754-chm.china.huawei.com (10.201.108.204) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: ben.widawsky@intel.com, david@redhat.com, vishal.l.verma@intel.com,
 jgroves@micron.com, qemu-devel@nongnu.org, linux-cxl@vger.kernel.org,
 armbru@redhat.com, mst@redhat.com, tyshao@avery-design.com.tw,
 hchkuo@avery-design.com.tw, imammedo@redhat.com, dan.j.williams@intel.com,
 ira.weiny@intel.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Mar 2021 15:33:49 -0500
Chris Browy <cbrowy@avery-design.com> wrote:

> Version 3 patch series for PCIe DOE for PCIe and CXL 2.0 implements
> all planned functionality.
> 
> Based on QEMU version:
> https://gitlab.com/bwidawsk/qemu/-/tree/cxl-2.0v4
> 
> Summary:
> 1: PCIe DOE support for Discovery
>    - Support multiple DOE instances for each own protocol set 
>    - MSI-X and polling supported
>    - Update error and interrupt status in DOE Status register
>    - Use static array to register callback function for DOE protocols 
>    - Deprecate DOE_SUCCESS and DOE_DISCARD
>    - Add license headers
> 2: CXL DOE for CDAT and Compliance Mode.
>    - Device supports pre-defined CDAT or user-provided CDAT.
>    - Support on reading the iASL aml file via specifying
>      "cdat=<filename.aml>" property to -device cxl-type3
> 	 skips over the ACPI header and writes only CDAT table entries
>    - Clean up CXL compliance structures
>    - DOE CDAT response returns one CDAT Structure instance based on
>      request EntryHandle value.
> 
> Example cdat.dat file: (compile with iasl -G cdat.dat)
> CDAT file may contain any mix and number of supported CDAT Structure types
> ----------------------
> /* Header */ 
> Signature : "CDAT"
> Table Length : 00000000
> Revision : 01
> Checksum : 00
> Oem ID : AVERY 
> Oem Table ID : 0 
> Oem Revision : 1 
> Asl Compiler ID : "INTL"
> Asl Compiler Revision : 20160527

I think this is a non starter because it's not an ACPI table and the header
of CDAT just doesn't look like this.

We 'might' be able to add some special handling to iASL as a convenient
tool for generating cdat, or we might just write something CDAT specific
(it's pretty simple after all!)

Normally iASL will convert a static table into it's raw binary representation
anyway, so we want to do something like that but end up with a valid
CDAT table.

Jonathan


> 
> /* CDAT structures */
> Label : DSMAS               // Field        Byte Length
> UINT8  : 0                  // Type             1
> UINT8  : 00                 // Reserved         1
> UINT16 : 0018               // Length           2
> UINT8  : 00                 // DSMADHandle      1
> UINT8  : 00                 // Flags            1
> UINT16 : 0000               // Reserved         2
> UINT64 : 0000000000000000   // DPA Base         8
> UINT64 : ffffffffffffffff   // DPA Length       8
> 
> Label : DSLBIS              // Field          Byte Length
> UINT8  : 01                 // Type             1
> UINT8  : 00                 // Reserved         1
> UINT16 : 0018               // Length           2
> UINT8  : 00                 // Handle           1
> UINT8  : 00                 // Flags            1
> UINT8  : 00                 // Data Type        1
> UINT8  : 00                 // Reserved         1
> UINT64 : 0000000000000000   // Entry Base Unit  8
> UINT16 : 0000               // Entry[0]         2
> UINT16 : 0000               // Entry[1]         2
> UINT16 : 0000               // Entry[2]         2
> UINT16 : 0000               // Reserved         2
> 
> Label: DSMSCIS              // Field        Byte Length
> UINT8  : 02                 // Type             1
> UINT8  : 00                 // Reserved         1
> UINT16 : 0014               // Length           2
> UINT8  : 00                 // DSMASHandle      1
> UINT24 : 000000             // Reserved         3
> UINT64 : 0000000000000000   // Memory Side Cache Size    8
> UINT32 : 00000000           // Cache Attributes 4 
> 
> Label : DSIS                // Field        Byte Length
> UINT8  : 03                 // Type             1
> UINT8  : 00                 // Reserved         1
> UINT16 : 0008               // Length           2
> UINT8  : 00                 // Flags            1
> UINT8  : 00                 // Handle           1
> UINT16 : 0000               // Reserved         2
> 
> Label : DSEMTS              // Field        Byte Length
> UINT8  : 04                 // Type             1
> UINT8  : 00                 // Reserved         1
> UINT16 : 0018               // Length           2
> UINT8  : 00                 // DSMAS Handle     1
> UINT8  : 00                 // EFI Memory Type and Attribute    1
> UINT16 : 0000               // Reserved         2
> UINT64 : 0000000000000000   // DPA Offset       8
> UINT64 : 0000000000000000   // DPA Length       8
> 
> Label : SSLBIS              // Field        Byte Length
> UINT8  : 05                 // Type             1
> UINT8  : 00                 // Reserved         1
> UINT16 : 0020               // Length           2
> UINT8  : 00                 // Data Type        1
> UINT24 : 000000             // Reserved         3
> UINT64 : 0000000000000000   // Entry Base Unit  8
> Label : SSLBE               // SSLBE[0]
> UINT16 : 0000               // Port X ID        2
> UINT16 : 0000               // Port Y ID        2
> UINT16 : 0000               // Latency or Bandwidth    2
> UINT16 : BBBB               // Reserved         2
> Label : SSLBE               // SSLBE[1]
> UINT16 : 0000               // Port X ID        2
> UINT16 : 0000               // Port Y ID        2
> UINT16 : 0000               // Latency or Bandwidth    2
> UINT16 : BBBC               // Reserved         2
> ----
> 
> References:
> 1. CXL 2.0 specification
> https://www.computeexpresslink.org/download-the-specification
> 2. PCI-SIG ECN: Data Object Exchange (DOE)
> http://www.pcisig.com
> 3. Coherent Device Attribute Table	CDAT 1.02
> https://uefi.org/sites/default/files/resources/Coherent%20Device%20Attribute%20Table_1.02.pdf
> 
> ---
> Chris Browy (2):
>   Basic PCIe DOE support
>   CXL DOE support for CDAT and Compliance Mode
> 
>  MAINTAINERS                               |  49 +--
>  hw/cxl/cxl-component-utils.c              |  93 +++++
>  hw/mem/cxl_type3.c                        | 184 ++++++++++
>  hw/pci/meson.build                        |   1 +
>  hw/pci/pci.c                              |  13 +-
>  hw/pci/pcie_doe.c                         | 416 ++++++++++++++++++++++
>  include/hw/cxl/cxl_cdat.h                 | 127 +++++++
>  include/hw/cxl/cxl_compl.h                | 252 +++++++++++++
>  include/hw/cxl/cxl_component.h            |  74 ++++
>  include/hw/cxl/cxl_device.h               |   4 +
>  include/hw/cxl/cxl_pci.h                  |   2 +
>  include/hw/pci/pci_ids.h                  |   5 +-
>  include/hw/pci/pcie.h                     |   1 +
>  include/hw/pci/pcie_doe.h                 | 142 ++++++++
>  include/hw/pci/pcie_regs.h                |   4 +
>  include/standard-headers/linux/pci_regs.h |   3 +-
>  16 files changed, 1327 insertions(+), 43 deletions(-)
>  create mode 100644 hw/pci/pcie_doe.c
>  create mode 100644 include/hw/cxl/cxl_cdat.h
>  create mode 100644 include/hw/cxl/cxl_compl.h
>  create mode 100644 include/hw/pci/pcie_doe.h
> 


