Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C253EB08D
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 08:45:13 +0200 (CEST)
Received: from localhost ([::1]:52156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEQwK-0003G5-8k
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 02:45:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Jianxian.Wen@verisilicon.com>)
 id 1mEQvT-0002be-Pk; Fri, 13 Aug 2021 02:44:20 -0400
Received: from shasxm03.verisilicon.com ([101.89.135.44]:12973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <Jianxian.Wen@verisilicon.com>)
 id 1mEQvQ-0006A1-DY; Fri, 13 Aug 2021 02:44:19 -0400
Content-Language: zh-CN
Content-Type: multipart/alternative;
 boundary="_000_4C23C17B8E87E74E906A25A3254A03F4F216C4FCSHASXM06verisil_"
DKIM-Signature: v=1; a=rsa-sha256; d=Verisilicon.com; s=default;
 c=simple/simple; t=1628837047; h=from:subject:to:date:message-id;
 bh=JK5UdAj553/f+El6izkKLHjTpl+ITYW2s+9zRZCYc/Q=;
 b=XEgjJdbumLBJ9IrppE3voWJXdRS9r7/qG0huc/lC9VyknyxHqT85LWBPin69rQOEgJqU4nDWk2j
 SPjg7r6RBhVwv8NiiDuQN1yCkeQSSo0Y26Y6Q/Q5n9RhDo08tqTrNDUo4fHfSr4HU8MDy6oFjeCwu
 bzMGTI5AVlk4VEaccnw=
Received: from SHASXM06.verisilicon.com ([fe80::59a8:ce34:dc14:ddda]) by
 SHASXM03.verisilicon.com ([fe80::938:4dda:a2f9:38aa%14]) with mapi id
 14.03.0408.000; Fri, 13 Aug 2021 14:44:07 +0800
From: "Wen, Jianxian" <Jianxian.Wen@verisilicon.com>
To: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "i.mitsyanko@gmail.com" <i.mitsyanko@gmail.com>, "edgar.iglesias@gmail.com"
 <edgar.iglesias@gmail.com>, "alistair@alistair23.me" <alistair@alistair23.me>
Subject: [PATCH] hw/dma/pl330: Add memory region to replace default
 address_space_memory
Thread-Topic: [PATCH] hw/dma/pl330: Add memory region to replace default
 address_space_memory
Thread-Index: AdeQDpubvwiIcCD2S3W55unV4KNvPA==
Date: Fri, 13 Aug 2021 06:44:06 +0000
Message-ID: <4C23C17B8E87E74E906A25A3254A03F4F216C4FC@SHASXM06.verisilicon.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.10.46.67]
x-tm-as-product-ver: SMEX-11.0.0.4179-8.100.1062-25628.004
x-tm-as-result: No--24.449300-0.000000-31
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
MIME-Version: 1.0
Received-SPF: pass client-ip=101.89.135.44;
 envelope-from=Jianxian.Wen@verisilicon.com; helo=shasxm03.verisilicon.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Liu,
 Renwei" <Renwei.Liu@verisilicon.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Li,
 Chunming" <Chunming.Li@verisilicon.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_4C23C17B8E87E74E906A25A3254A03F4F216C4FCSHASXM06verisil_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

From f780b0ee2ee36c562ab814915fff0e7217b25e63 Mon Sep 17 00:00:00 2001
From: Jianxian Wen <jianxian.wen@verisilicon.com>
Date: Tue, 3 Aug 2021 09:44:35 +0800
Subject: [PATCH] hw/dma/pl330: Add memory region to replace default
 address_space_memory

PL330 needs a memory region which can connect with SMMU translate IOMMU reg=
ion to support SMMU.

Signed-off-by: Jianxian Wen <jianxian.wen@verisilicon.com>
---
 hw/arm/exynos4210.c  |  3 +++
 hw/arm/xilinx_zynq.c |  2 ++
 hw/dma/pl330.c       | 24 ++++++++++++++++++++----
 3 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 5c7a51bba..af0e4820d 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -171,8 +171,11 @@ static DeviceState *pl330_create(uint32_t base, qemu_o=
r_irq *orgate,
     SysBusDevice *busdev;
     DeviceState *dev;
     int i;
+    MemoryRegion *sysmem =3D get_system_memory();

     dev =3D qdev_new("pl330");
+    object_property_set_link(OBJECT(dev), "memory",
+                                    OBJECT(sysmem), &error_fatal);
     qdev_prop_set_uint8(dev, "num_events", nevents);
     qdev_prop_set_uint8(dev, "num_chnls",  8);
     qdev_prop_set_uint8(dev, "num_periph_req",  nreq);
diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 245af81bb..e0b3a73b9 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -312,6 +312,8 @@ static void zynq_init(MachineState *machine)
     sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[39-IRQ_OFFSET]);

     dev =3D qdev_new("pl330");
+    object_property_set_link(OBJECT(dev), "memory",
+                                    OBJECT(address_space_mem), &error_fata=
l);
     qdev_prop_set_uint8(dev, "num_chnls",  8);
     qdev_prop_set_uint8(dev, "num_periph_req",  4);
     qdev_prop_set_uint8(dev, "num_events",  16);
diff --git a/hw/dma/pl330.c b/hw/dma/pl330.c
index 944ba296b..06747ca0b 100644
--- a/hw/dma/pl330.c
+++ b/hw/dma/pl330.c
@@ -269,6 +269,9 @@ struct PL330State {
     uint8_t num_faulting;
     uint8_t periph_busy[PL330_PERIPH_NUM];

+    /* Memory region that DMA operation access */
+    MemoryRegion *mem_mr;
+    AddressSpace mem_as;
 };

 #define TYPE_PL330 "pl330"
@@ -1108,7 +1111,8 @@ static inline const PL330InsnDesc *pl330_fetch_insn(P=
L330Chan *ch)
     uint8_t opcode;
     int i;

-    dma_memory_read(&address_space_memory, ch->pc, &opcode, 1);
+    address_space_read(&ch->parent->mem_as, ch->pc,
+                        MEMTXATTRS_UNSPECIFIED, &opcode, 1);
     for (i =3D 0; insn_desc[i].size; i++) {
         if ((opcode & insn_desc[i].opmask) =3D=3D insn_desc[i].opcode) {
             return &insn_desc[i];
@@ -1122,7 +1126,8 @@ static inline void pl330_exec_insn(PL330Chan *ch, con=
st PL330InsnDesc *insn)
     uint8_t buf[PL330_INSN_MAXSIZE];

     assert(insn->size <=3D PL330_INSN_MAXSIZE);
-    dma_memory_read(&address_space_memory, ch->pc, buf, insn->size);
+    address_space_read(&ch->parent->mem_as, ch->pc,
+                        MEMTXATTRS_UNSPECIFIED, buf, insn->size);
     insn->exec(ch, buf[0], &buf[1], insn->size - 1);
 }

@@ -1186,7 +1191,8 @@ static int pl330_exec_cycle(PL330Chan *channel)
     if (q !=3D NULL && q->len <=3D pl330_fifo_num_free(&s->fifo)) {
         int len =3D q->len - (q->addr & (q->len - 1));

-        dma_memory_read(&address_space_memory, q->addr, buf, len);
+        address_space_read(&s->mem_as, q->addr,
+                            MEMTXATTRS_UNSPECIFIED, buf, len);
         trace_pl330_exec_cycle(q->addr, len);
         if (trace_event_get_state_backends(TRACE_PL330_HEXDUMP)) {
             pl330_hexdump(buf, len);
@@ -1217,7 +1223,8 @@ static int pl330_exec_cycle(PL330Chan *channel)
             fifo_res =3D pl330_fifo_get(&s->fifo, buf, len, q->tag);
         }
         if (fifo_res =3D=3D PL330_FIFO_OK || q->z) {
-            dma_memory_write(&address_space_memory, q->addr, buf, len);
+            address_space_write(&s->mem_as, q->addr,
+                                MEMTXATTRS_UNSPECIFIED, buf, len);
             trace_pl330_exec_cycle(q->addr, len);
             if (trace_event_get_state_backends(TRACE_PL330_HEXDUMP)) {
                 pl330_hexdump(buf, len);
@@ -1562,6 +1569,12 @@ static void pl330_realize(DeviceState *dev, Error **=
errp)
                           "dma", PL330_IOMEM_SIZE);
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);

+    if (!s->mem_mr) {
+        error_setg(errp, "'mem_mr' link is not set");
+        return;
+    }
+    address_space_init(&s->mem_as, s->mem_mr, "pl330-memory");
+
     s->timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, pl330_exec_cycle_timer, =
s);

     s->cfg[0] =3D (s->mgr_ns_at_rst ? 0x4 : 0) |
@@ -1656,6 +1669,9 @@ static Property pl330_properties[] =3D {
     DEFINE_PROP_UINT8("rd_q_dep", PL330State, rd_q_dep, 16),
     DEFINE_PROP_UINT16("data_buffer_dep", PL330State, data_buffer_dep, 256=
),

+    DEFINE_PROP_LINK("memory", PL330State, mem_mr,
+                     TYPE_MEMORY_REGION, MemoryRegion *),
+
     DEFINE_PROP_END_OF_LIST(),
 };

--

--_000_4C23C17B8E87E74E906A25A3254A03F4F216C4FCSHASXM06verisil_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 12 (filtered medium)">
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
 /* Page Definitions */
 @page Section1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.Section1
	{page:Section1;}
-->
</style><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext=3D"edit">
  <o:idmap v:ext=3D"edit" data=3D"1" />
 </o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-CN" link=3D"blue" vlink=3D"purple" style=3D"text-justify-t=
rim:punctuation">
<div class=3D"Section1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">From f780b0ee2ee36c562ab814915f=
ff0e7217b25e63 Mon Sep 17 00:00:00 2001<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">From: Jianxian Wen &lt;jianxian=
.wen@verisilicon.com&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Date: Tue, 3 Aug 2021 09:44:35 =
&#43;0800<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Subject: [PATCH] hw/dma/pl330: =
Add memory region to replace default<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;address_space_memory<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">PL330 needs a memory region whi=
ch can connect with SMMU translate IOMMU region to support SMMU.<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Signed-off-by: Jianxian Wen &lt=
;jianxian.wen@verisilicon.com&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">---<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;hw/arm/exynos4210.c&nbsp;=
 |&nbsp; 3 &#43;&#43;&#43;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;hw/arm/xilinx_zynq.c |&nb=
sp; 2 &#43;&#43;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;hw/dma/pl330.c&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; | 24 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;----<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;3 files changed, 25 inser=
tions(&#43;), 4 deletions(-)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">diff --git a/hw/arm/exynos4210.=
c b/hw/arm/exynos4210.c<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">index 5c7a51bba..af0e4820d 1006=
44<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">--- a/hw/arm/exynos4210.c<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&#43;&#43; b/hw/arm/exynos=
4210.c<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">@@ -171,8 &#43;171,11 @@ static=
 DeviceState *pl330_create(uint32_t base, qemu_or_irq *orgate,<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; SysBus=
Device *busdev;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; Device=
State *dev;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; int i;=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; MemoryR=
egion *sysmem =3D get_system_memory();<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; dev =
=3D qdev_new(&quot;pl330&quot;);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; object_=
property_set_link(OBJECT(dev), &quot;memory&quot;,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OBJECT(sysmem), &amp;error_fatal);<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; qdev_p=
rop_set_uint8(dev, &quot;num_events&quot;, nevents);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; qdev_p=
rop_set_uint8(dev, &quot;num_chnls&quot;,&nbsp; 8);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp; &nbsp;&nbsp;qdev_p=
rop_set_uint8(dev, &quot;num_periph_req&quot;,&nbsp; nreq);<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">diff --git a/hw/arm/xilinx_zynq=
.c b/hw/arm/xilinx_zynq.c<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">index 245af81bb..e0b3a73b9 1006=
44<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">--- a/hw/arm/xilinx_zynq.c<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&#43;&#43; b/hw/arm/xilinx=
_zynq.c<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">@@ -312,6 &#43;312,8 @@ static =
void zynq_init(MachineState *machine)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; sysbus=
_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[39-IRQ_OFFSET]);<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; dev =
=3D qdev_new(&quot;pl330&quot;);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; object_=
property_set_link(OBJECT(dev), &quot;memory&quot;,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OBJECT(address_space_mem), &amp;error_fa=
tal);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; qdev_p=
rop_set_uint8(dev, &quot;num_chnls&quot;,&nbsp; 8);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; qdev_p=
rop_set_uint8(dev, &quot;num_periph_req&quot;,&nbsp; 4);<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; qdev_p=
rop_set_uint8(dev, &quot;num_events&quot;,&nbsp; 16);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">diff --git a/hw/dma/pl330.c b/h=
w/dma/pl330.c<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">index 944ba296b..06747ca0b 1006=
44<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">--- a/hw/dma/pl330.c<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&#43;&#43; b/hw/dma/pl330.=
c<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">@@ -269,6 &#43;269,9 @@ struct =
PL330State {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; uint8_=
t num_faulting;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; uint8_=
t periph_busy[PL330_PERIPH_NUM];<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; /* Memo=
ry region that DMA operation access */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; MemoryR=
egion *mem_mr;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; Address=
Space mem_as;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;};<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;#define TYPE_PL330 &quot;=
pl330&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">@@ -1108,7 &#43;1111,8 @@ stati=
c inline const PL330InsnDesc *pl330_fetch_insn(PL330Chan *ch)<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; uint8_=
t opcode;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; int i;=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">-&nbsp;&nbsp;&nbsp; dma_memory_=
read(&amp;address_space_memory, ch-&gt;pc, &amp;opcode, 1);<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; address=
_space_read(&amp;ch-&gt;parent-&gt;mem_as, ch-&gt;pc,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MEMTXATTRS_UNSPECIFIED, &amp;opcode, =
1);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; for (i=
 =3D 0; insn_desc[i].size; i&#43;&#43;) {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; if ((opcode &amp; insn_desc[i].opmask) =3D=3D insn_desc[i=
].opcode) {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return &amp;insn_desc[i];<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">@@ -1122,7 &#43;1126,8 @@ stati=
c inline void pl330_exec_insn(PL330Chan *ch, const PL330InsnDesc *insn)<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; uint8_=
t buf[PL330_INSN_MAXSIZE];<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; assert=
(insn-&gt;size &lt;=3D PL330_INSN_MAXSIZE);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">-&nbsp;&nbsp;&nbsp; dma_memory_=
read(&amp;address_space_memory, ch-&gt;pc, buf, insn-&gt;size);<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; address=
_space_read(&amp;ch-&gt;parent-&gt;mem_as, ch-&gt;pc,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MEMTXATTRS_UNSPECIFIED, buf, insn-&gt=
;size);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; insn-&=
gt;exec(ch, buf[0], &amp;buf[1], insn-&gt;size - 1);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;}<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">@@ -1186,7 &#43;1191,8 @@ stati=
c int pl330_exec_cycle(PL330Chan *channel)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; if (q =
!=3D NULL &amp;&amp; q-&gt;len &lt;=3D pl330_fifo_num_free(&amp;s-&gt;fifo)=
) {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; int len =3D q-&gt;len - (q-&gt;addr &amp; (q-&gt;len - 1)=
);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; dma_memory_read(&amp;address_space_memory, q-&gt;addr, buf, le=
n);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; address_space_read(&amp;s-&gt;mem_as, q-&gt;addr,<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MEMTXATTRS_UN=
SPECIFIED, buf, len);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; trace_pl330_exec_cycle(q-&gt;addr, len);<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; if (trace_event_get_state_backends(TRACE_PL330_HEXDUMP)) =
{<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pl330_hexdump(buf, len);<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">@@ -1217,7 &#43;1223,8 @@ stati=
c int pl330_exec_cycle(PL330Chan *channel)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fifo_res =3D pl330_fifo_get(&amp;=
s-&gt;fifo, buf, len, q-&gt;tag);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; }<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; if (fifo_res =3D=3D PL330_FIFO_OK || q-&gt;z) {<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dma_memory_write(&amp;address_space_me=
mory, q-&gt;addr, buf, len);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; address_space_write(&amp;s-&gt;mem=
_as, q-&gt;addr,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; MEMTXATTRS_UNSPECIFIED, buf, len);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; trace_pl330_exec_cycle(q-&gt;addr=
, len);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (trace_event_get_state_backend=
s(TRACE_PL330_HEXDUMP)) {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pl330_hex=
dump(buf, len);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">@@ -1562,6 &#43;1569,12 @@ stat=
ic void pl330_realize(DeviceState *dev, Error **errp)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;dma&quot;, PL330_I=
OMEM_SIZE);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; sysbus=
_init_mmio(SYS_BUS_DEVICE(dev), &amp;s-&gt;iomem);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; if (!s-=
&gt;mem_mr) {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; error_setg(errp, &quot;'mem_mr' link is not set&quot;);<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; return;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; }<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; address=
_space_init(&amp;s-&gt;mem_as, s-&gt;mem_mr, &quot;pl330-memory&quot;);<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; s-&gt;=
timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, pl330_exec_cycle_timer, s);<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; s-&gt;=
cfg[0] =3D (s-&gt;mgr_ns_at_rst ? 0x4 : 0) |<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">@@ -1656,6 &#43;1669,9 @@ stati=
c Property pl330_properties[] =3D {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp; &nbsp;&nbsp;&nbsp;DEFINE=
_PROP_UINT8(&quot;rd_q_dep&quot;, PL330State, rd_q_dep, 16),<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; DEFINE=
_PROP_UINT16(&quot;data_buffer_dep&quot;, PL330State, data_buffer_dep, 256)=
,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp; DEFINE_=
PROP_LINK(&quot;memory&quot;, PL330State, mem_mr,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; TYPE_MEMORY_REGION, MemoryRegion *),<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#43;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp; &nbsp;&nbsp;DEFINE=
_PROP_END_OF_LIST(),<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;};<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">--<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_4C23C17B8E87E74E906A25A3254A03F4F216C4FCSHASXM06verisil_--

