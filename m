Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7C0B3791
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Sep 2019 11:53:42 +0200 (CEST)
Received: from localhost ([::1]:60650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i9nhV-0008DV-Qt
	for lists+qemu-devel@lfdr.de; Mon, 16 Sep 2019 05:53:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43131)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i9nfb-0006Ow-So
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 05:51:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i9nfa-0008Ib-9B
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 05:51:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49224)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1i9nfW-0008H7-PN; Mon, 16 Sep 2019 05:51:38 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 16CE818C8935;
 Mon, 16 Sep 2019 09:51:38 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-115.brq.redhat.com [10.40.204.115])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B1D9E5C1D6;
 Mon, 16 Sep 2019 09:51:32 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 16 Sep 2019 11:51:20 +0200
Message-Id: <20190916095121.29506-2-philmd@redhat.com>
In-Reply-To: <20190916095121.29506-1-philmd@redhat.com>
References: <20190916095121.29506-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Mon, 16 Sep 2019 09:51:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 1/2] trace: Remove trailing newline in events
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Jason Wang <jasowang@redhat.com>, John Snow <jsnow@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While the tracing frawework does not forbid trailing newline in
events format string, using them lead to confuse output.
It is the responsibility of the backend to properly end an event
line.

Some of our formats have trailing newlines, remove them.

Reviewed-by: John Snow <jsnow@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/misc/trace-events | 10 +++++-----
 hw/scsi/trace-events |  2 +-
 hw/sd/trace-events   |  2 +-
 nbd/trace-events     |  4 ++--
 net/trace-events     |  6 +++---
 5 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index c1ea1aa437..74276225f8 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -118,11 +118,11 @@ iotkit_secctl_ns_read(uint32_t offset, uint64_t dat=
a, unsigned size) "IoTKit Sec
 iotkit_secctl_ns_write(uint32_t offset, uint64_t data, unsigned size) "I=
oTKit SecCtl NS regs write: offset 0x%x data 0x%" PRIx64 " size %u"
=20
 # imx6ul_ccm.c
-ccm_entry(void) "\n"
-ccm_freq(uint32_t freq) "freq =3D %d\n"
-ccm_clock_freq(uint32_t clock, uint32_t freq) "(Clock =3D %d) =3D %d\n"
-ccm_read_reg(const char *reg_name, uint32_t value) "reg[%s] <=3D 0x%" PR=
Ix32 "\n"
-ccm_write_reg(const char *reg_name, uint32_t value) "reg[%s] =3D> 0x%" P=
RIx32 "\n"
+ccm_entry(void) ""
+ccm_freq(uint32_t freq) "freq =3D %d"
+ccm_clock_freq(uint32_t clock, uint32_t freq) "(Clock =3D %d) =3D %d"
+ccm_read_reg(const char *reg_name, uint32_t value) "reg[%s] <=3D 0x%" PR=
Ix32
+ccm_write_reg(const char *reg_name, uint32_t value) "reg[%s] =3D> 0x%" P=
RIx32
=20
 # iotkit-sysinfo.c
 iotkit_sysinfo_read(uint64_t offset, uint64_t data, unsigned size) "IoTK=
it SysInfo read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
diff --git a/hw/scsi/trace-events b/hw/scsi/trace-events
index 452b5994e6..b0820052f8 100644
--- a/hw/scsi/trace-events
+++ b/hw/scsi/trace-events
@@ -28,7 +28,7 @@ mptsas_mmio_read(void *dev, uint32_t addr, uint32_t val=
) "dev %p addr 0x%08x val
 mptsas_mmio_unhandled_read(void *dev, uint32_t addr) "dev %p addr 0x%08x=
"
 mptsas_mmio_unhandled_write(void *dev, uint32_t addr, uint32_t val) "dev=
 %p addr 0x%08x value 0x%x"
 mptsas_mmio_write(void *dev, uint32_t addr, uint32_t val) "dev %p addr 0=
x%08x value 0x%x"
-mptsas_process_message(void *dev, int msg, uint32_t ctx) "dev %p cmd %d =
context 0x%08x\n"
+mptsas_process_message(void *dev, int msg, uint32_t ctx) "dev %p cmd %d =
context 0x%08x"
 mptsas_process_scsi_io_request(void *dev, int bus, int target, int lun, =
uint64_t len) "dev %p dev %d:%d:%d length %"PRIu64""
 mptsas_reset(void *dev) "dev %p "
 mptsas_scsi_overflow(void *dev, uint32_t ctx, uint64_t req, uint64_t fou=
nd) "dev %p context 0x%08x: %"PRIu64"/%"PRIu64""
diff --git a/hw/sd/trace-events b/hw/sd/trace-events
index 52971dc033..efcff666a2 100644
--- a/hw/sd/trace-events
+++ b/hw/sd/trace-events
@@ -4,7 +4,7 @@
 bcm2835_sdhost_read(uint64_t offset, uint64_t data, unsigned size) "offs=
et 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 bcm2835_sdhost_write(uint64_t offset, uint64_t data, unsigned size) "off=
set 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 bcm2835_sdhost_edm_change(const char *why, uint32_t edm) "(%s) EDM now 0=
x%x"
-bcm2835_sdhost_update_irq(uint32_t irq) "IRQ bits 0x%x\n"
+bcm2835_sdhost_update_irq(uint32_t irq) "IRQ bits 0x%x"
=20
 # core.c
 sdbus_command(const char *bus_name, uint8_t cmd, uint32_t arg) "@%s CMD%=
02d arg 0x%08x"
diff --git a/nbd/trace-events b/nbd/trace-events
index f6cde96790..a955918e97 100644
--- a/nbd/trace-events
+++ b/nbd/trace-events
@@ -61,8 +61,8 @@ nbd_negotiate_begin(void) "Beginning negotiation"
 nbd_negotiate_new_style_size_flags(uint64_t size, unsigned flags) "adver=
tising size %" PRIu64 " and flags 0x%x"
 nbd_negotiate_success(void) "Negotiation succeeded"
 nbd_receive_request(uint32_t magic, uint16_t flags, uint16_t type, uint6=
4_t from, uint32_t len) "Got request: { magic =3D 0x%" PRIx32 ", .flags =3D=
 0x%" PRIx16 ", .type =3D 0x%" PRIx16 ", from =3D %" PRIu64 ", len =3D %"=
 PRIu32 " }"
-nbd_blk_aio_attached(const char *name, void *ctx) "Export %s: Attaching =
clients to AIO context %p\n"
-nbd_blk_aio_detach(const char *name, void *ctx) "Export %s: Detaching cl=
ients from AIO context %p\n"
+nbd_blk_aio_attached(const char *name, void *ctx) "Export %s: Attaching =
clients to AIO context %p"
+nbd_blk_aio_detach(const char *name, void *ctx) "Export %s: Detaching cl=
ients from AIO context %p"
 nbd_co_send_simple_reply(uint64_t handle, uint32_t error, const char *er=
rname, int len) "Send simple reply: handle =3D %" PRIu64 ", error =3D %" =
PRIu32 " (%s), len =3D %d"
 nbd_co_send_structured_done(uint64_t handle) "Send structured reply done=
: handle =3D %" PRIu64
 nbd_co_send_structured_read(uint64_t handle, uint64_t offset, void *data=
, size_t size) "Send structured read data reply: handle =3D %" PRIu64 ", =
offset =3D %" PRIu64 ", data =3D %p, len =3D %zu"
diff --git a/net/trace-events b/net/trace-events
index ac57056497..02c13fd0ba 100644
--- a/net/trace-events
+++ b/net/trace-events
@@ -17,9 +17,9 @@ colo_compare_icmp_miscompare(const char *sta, int size)=
 ": %s =3D %d"
 colo_compare_ip_info(int psize, const char *sta, const char *stb, int ss=
ize, const char *stc, const char *std) "ppkt size =3D %d, ip_src =3D %s, =
ip_dst =3D %s, spkt size =3D %d, ip_src =3D %s, ip_dst =3D %s"
 colo_old_packet_check_found(int64_t old_time) "%" PRId64
 colo_compare_miscompare(void) ""
-colo_compare_tcp_info(const char *pkt, uint32_t seq, uint32_t ack, int h=
dlen, int pdlen, int offset, int flags) "%s: seq/ack=3D %u/%u hdlen=3D %d=
 pdlen=3D %d offset=3D %d flags=3D%d\n"
+colo_compare_tcp_info(const char *pkt, uint32_t seq, uint32_t ack, int h=
dlen, int pdlen, int offset, int flags) "%s: seq/ack=3D %u/%u hdlen=3D %d=
 pdlen=3D %d offset=3D %d flags=3D%d"
=20
 # filter-rewriter.c
 colo_filter_rewriter_debug(void) ""
-colo_filter_rewriter_pkt_info(const char *func, const char *src, const c=
har *dst, uint32_t seq, uint32_t ack, uint32_t flag) "%s: src/dst: %s/%s =
p: seq/ack=3D%u/%u  flags=3D0x%x\n"
-colo_filter_rewriter_conn_offset(uint32_t offset) ": offset=3D%u\n"
+colo_filter_rewriter_pkt_info(const char *func, const char *src, const c=
har *dst, uint32_t seq, uint32_t ack, uint32_t flag) "%s: src/dst: %s/%s =
p: seq/ack=3D%u/%u  flags=3D0x%x"
+colo_filter_rewriter_conn_offset(uint32_t offset) ": offset=3D%u"
--=20
2.20.1


