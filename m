Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A001354E579
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 16:56:24 +0200 (CEST)
Received: from localhost ([::1]:55378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1qv1-0006XI-OP
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 10:56:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1o1qre-0002I9-0Y
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 10:52:54 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1o1qrb-0006Kl-Su
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 10:52:53 -0400
Received: from fraeml745-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LP4qf1qDSz67b2m;
 Thu, 16 Jun 2022 22:51:10 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml745-chm.china.huawei.com (10.206.15.226) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 16 Jun 2022 16:52:50 +0200
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 16 Jun 2022 15:52:49 +0100
To: <qemu-devel@nongnu.org>, "Michael S . Tsirkin" <mst@redhat.com>, "Ben
 Widawsky" <bwidawsk@kernel.org>
CC: Paolo Bonzini <pbonzini@redhat.com>, <linux-cxl@vger.kernel.org>,
 <linuxarm@huawei.com>, <alex.bennee@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>, Marcel Apfelbaum <marcel@redhat.com>, "Igor
 Mammedov" <imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>, "Mark
 Cave-Ayland" <mark.cave-ayland@ilande.co.uk>, Adam Manzanares
 <a.manzanares@samsung.com>, Tong Zhang <ztong0001@gmail.com>, "Shameerali
 Kolothum Thodi" <shameerali.kolothum.thodi@huawei.com>
Subject: [PATCH v11 3/3] docs/cxl: Add switch documentation
Date: Thu, 16 Jun 2022 15:51:26 +0100
Message-ID: <20220616145126.8002-4-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220616145126.8002-1-Jonathan.Cameron@huawei.com>
References: <20220616145126.8002-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml741-chm.china.huawei.com (10.201.108.191) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

Switches were already introduced, but now we support them update
the documentation to provide an example in diagram and
qemu command line parameter forms.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 docs/system/devices/cxl.rst | 88 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 86 insertions(+), 2 deletions(-)

diff --git a/docs/system/devices/cxl.rst b/docs/system/devices/cxl.rst
index bcbfe8c490..a57e4c4e5c 100644
--- a/docs/system/devices/cxl.rst
+++ b/docs/system/devices/cxl.rst
@@ -118,8 +118,6 @@ and associated component register access via PCI bars.
 
 CXL Switch
 ~~~~~~~~~~
-Not yet implemented in QEMU.
-
 Here we consider a simple CXL switch with only a single
 virtual hierarchy. Whilst more complex devices exist, their
 visibility to a particular host is generally the same as for
@@ -137,6 +135,10 @@ BARs.  The Upstream Port has the configuration interfaces for
 the HDM decoders which route incoming memory accesses to the
 appropriate downstream port.
 
+A CXL switch is created in a similar fashion to PCI switches
+by creating an upstream port (cxl-upstream) and a number of
+downstream ports on the internal switch bus (cxl-downstream).
+
 CXL Memory Devices - Type 3
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
 CXL type 3 devices use a PCI class code and are intended to be supported
@@ -240,6 +242,62 @@ Notes:
     they will take the Host Physical Addresses of accesses and map
     them to their own local Device Physical Address Space (DPA).
 
+Example topology involving a switch::
+
+  |<------------------SYSTEM PHYSICAL ADDRESS MAP (1)----------------->|
+  |    __________   __________________________________   __________    |
+  |   |          | |                                  | |          |   |
+  |   | CFMW 0   | |  CXL Fixed Memory Window 1       | | CFMW 1   |   |
+  |   | HB0 only | |  Configured to interleave memory | | HB1 only |   |
+  |   |          | |  memory accesses across HB0/HB1  | |          |   |
+  |   |____x_____| |__________________________________| |__________|   |
+           |             |                     |             |
+           |             |                     |             |
+           |             |                     |
+  Interleave Decoder     |                     |             |
+   Matches this HB       |                     |             |
+           \_____________|                     |_____________/
+               __________|__________      _____|_______________
+              |                     |    |                     |
+              | CXL HB 0            |    | CXL HB 1            |
+              | HB IntLv Decoders   |    | HB IntLv Decoders   |
+              | PCI/CXL Root Bus 0c |    | PCI/CXL Root Bus 0d |
+              |                     |    |                     |
+              |___x_________________|    |_____________________|
+                  |              |          |               |
+                  |
+       A HB 0 HDM Decoder
+       matches this Port
+       ___________|___
+      |  Root Port 0  |
+      |  Appears in   |
+      |  PCI topology |
+      |  As 0c:00.0   |
+      |___________x___|
+                  |
+                  |
+                  \_____________________
+                                        |
+                                        |
+            ---------------------------------------------------
+           |    Switch 0  USP as PCI 0d:00.0                   |
+           |    USP has HDM decoder which direct traffic to    |
+           |    appropiate downstream port                     |
+           |    Switch BUS appears as 0e                       |
+           |x__________________________________________________|
+            |                  |               |              |
+            |                  |               |              |
+       _____|_________   ______|______   ______|_____   ______|_______
+   (4)|     x         | |             | |            | |              |
+      | CXL Type3 0   | | CXL Type3 1 | | CXL type3 2| | CLX Type 3 3 |
+      |               | |             | |            | |              |
+      | PMEM0(Vol LSA)| | PMEM1 (...) | | PMEM2 (...)| | PMEM3 (...)  |
+      | Decoder to go | |             | |            | |              |
+      | from host PA  | | PCI 10:00.0 | | PCI 11:00.0| | PCI 12:00.0  |
+      | to device PA  | |             | |            | |              |
+      | PCI as 0f:00.0| |             | |            | |              |
+      |_______________| |_____________| |____________| |______________|
+
 Example command lines
 ---------------------
 A very simple setup with just one directly attached CXL Type 3 device::
@@ -279,6 +337,32 @@ the CXL Type3 device directly attached (no switches).::
   -device cxl-type3,bus=root_port16,memdev=cxl-mem4,lsa=cxl-lsa4,id=cxl-pmem3 \
   -M cxl-fmw.0.targets.0=cxl.1,cxl-fmw.0.targets.1=cxl.2,cxl-fmw.0.size=4G,cxl-fmw.0.interleave-granularity=8k
 
+An example of 4 devices below a switch suitable for 1, 2 or 4 way interleave::
+
+  qemu-system-aarch64 -M virt,gic-version=3,cxl=on -m 4g,maxmem=8G,slots=8 -cpu max \
+  ...
+  -object memory-backend-file,id=cxl-mem0,share=on,mem-path=/tmp/cxltest.raw,size=256M \
+  -object memory-backend-file,id=cxl-mem1,share=on,mem-path=/tmp/cxltest1.raw,size=256M \
+  -object memory-backend-file,id=cxl-mem2,share=on,mem-path=/tmp/cxltest2.raw,size=256M \
+  -object memory-backend-file,id=cxl-mem3,share=on,mem-path=/tmp/cxltest3.raw,size=256M \
+  -object memory-backend-file,id=cxl-lsa0,share=on,mem-path=/tmp/lsa0.raw,size=256M \
+  -object memory-backend-file,id=cxl-lsa1,share=on,mem-path=/tmp/lsa1.raw,size=256M \
+  -object memory-backend-file,id=cxl-lsa2,share=on,mem-path=/tmp/lsa2.raw,size=256M \
+  -object memory-backend-file,id=cxl-lsa3,share=on,mem-path=/tmp/lsa3.raw,size=256M \
+  -device pxb-cxl,bus_nr=12,bus=pcie.0,id=cxl.1 \
+  -device cxl-rp,port=0,bus=cxl.1,id=root_port0,chassis=0,slot=0 \
+  -device cxl-rp,port=1,bus=cxl.1,id=root_port1,chassis=0,slot=1 \
+  -device cxl-upstream,bus=root_port0,id=us0 \
+  -device cxl-downstream,port=0,bus=us0,id=swport0,chassis=0,slot=4 \
+  -device cxl-type3,bus=swport0,memdev=cxl-mem0,lsa=cxl-lsa0,id=cxl-pmem0,size=256M \
+  -device cxl-downstream,port=1,bus=us0,id=swport1,chassis=0,slot=5 \
+  -device cxl-type3,bus=swport1,memdev=cxl-mem1,lsa=cxl-lsa1,id=cxl-pmem1,size=256M \
+  -device cxl-downstream,port=2,bus=us0,id=swport2,chassis=0,slot=6 \
+  -device cxl-type3,bus=swport2,memdev=cxl-mem2,lsa=cxl-lsa2,id=cxl-pmem2,size=256M \
+  -device cxl-downstream,port=3,bus=us0,id=swport3,chassis=0,slot=7 \
+  -device cxl-type3,bus=swport3,memdev=cxl-mem3,lsa=cxl-lsa3,id=cxl-pmem3,size=256M \
+  -M cxl-fmw.0.targets.0=cxl.1,cxl-fmw.0.size=4G,cxl-fmw.0.interleave-granularity=4k
+
 Kernel Configuration Options
 ----------------------------
 
-- 
2.32.0


