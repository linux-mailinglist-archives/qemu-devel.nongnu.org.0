Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F11432B495B
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 16:31:33 +0100 (CET)
Received: from localhost ([::1]:50348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kegTY-00063L-D8
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 10:31:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tpecar95@gmail.com>)
 id 1kegAl-0008Nz-Cm; Mon, 16 Nov 2020 10:12:04 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:37631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tpecar95@gmail.com>)
 id 1kegAi-0004g7-Va; Mon, 16 Nov 2020 10:12:03 -0500
Received: by mail-wr1-x444.google.com with SMTP id b6so19069561wrt.4;
 Mon, 16 Nov 2020 07:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=2OeIXsCueKgeot6j8X63ZcWV9rbNFM0cnVvrMjCk3IM=;
 b=S+XrU/b8s498aNSbtZfj397Jgbv2PahWOgjrrTx9LjGRHYk+P8gqSNHMmpYN2/z6Gv
 MvdVFa1DfAbiTxFqPo0vlN3QCM9QlsNCLaZ+6WrsmeErkX9uMP6LOKVUt66TpovZJxfA
 9Al/sRpSOpECnojtPrgXKzaT8Yc9ZS5dVbdx9GCxntzHuVeoeUhnyWsRwjFkD7bhxbPr
 kBf+nt/JAYp1IKWAUMWox/slU8daJeMCHB5b6h/ZncbF4Km5QPX0tYlyS2o/3pnZMDxj
 tvXHTUYl1Js/7BQ9aXhFcB4ItqcEACudTbuLRdm3Zkt02ZFMkittPHkemr94//LdbrA/
 FX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=2OeIXsCueKgeot6j8X63ZcWV9rbNFM0cnVvrMjCk3IM=;
 b=HS2Zn2WZyyChZCynMHGTAmqwRI6E7IBnCzg7m41DQqGrydsmpQEZFFD7EA82a/HK0Z
 9X1k5FmeyGTx7hio/Lkxz8jfJJ41WQ4eCYnt+glzmhNueeydyrl7VGDrbVHKbqkeMcXR
 q82IvPeGHsHCyM4T11mmiDC8lzzqrDlnTZjjNFRGSDo0VhwlEAOJSv/RHLdHRS+k4j2s
 aYOnKc+yZR+Z3B+gLSwfzPddfsF3xhPvPUHjTiAYbFrEh9n/32THwnDqvSkcUrENMbbL
 qkNd+1L5vyXuJC7AvgaSM3xTjVRxC1/m2kyRCCpbwttzpChDQm5nU0DGgBAqwi9M9FXt
 7BXA==
X-Gm-Message-State: AOAM533d4RO2DS1dA/VJlLIphmMChhBH/uUug3ADPMLB9KGo3mMOn/5R
 PisdJz2N1vIybK/uDswqX74xNp/QKNRRU9NuiSwx29MAaX4=
X-Google-Smtp-Source: ABdhPJx3inApbFvWGkdtCsgjn8/Gxqeap7rB9cdKRNoNwqJBlOHnK3xkYQJgzIANNXQq5Uo0/9PIthVom7F5NdtHZxY=
X-Received: by 2002:adf:e512:: with SMTP id j18mr21025959wrm.390.1605539518279; 
 Mon, 16 Nov 2020 07:11:58 -0800 (PST)
MIME-Version: 1.0
From: Tadej Pecar <tpecar95@gmail.com>
Date: Mon, 16 Nov 2020 16:11:47 +0100
Message-ID: <CAD-fBOBqRWQLW8xpJ+j8DSWeuDbCNEOr67uHqQJ+v=CwAFow7g@mail.gmail.com>
Subject: [PATCH] hw/char/cmsdk-apb-uart: Fix rx interrupt handling
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000a8f1a405b43acc3f"
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=tpecar95@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 16 Nov 2020 10:28:49 -0500
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a8f1a405b43acc3f
Content-Type: text/plain; charset="UTF-8"

Previously, the RX interrupt got missed if:
- the character backend provided the next character before the RX IRQ
Handler
  managed to clear the currently served interrupt.
- the character backend provided the next character while the RX interrupt
  was disabled. Enabling the interrupt did not trigger the interrupt
  even if the RXFULL status bit was set.

Signed-off-by: Tadej P <tpecar95@gmail.com>
---
 hw/char/cmsdk-apb-uart.c | 54 ++++++++++++++++++++++++++++------------
 hw/char/trace-events     |  1 +
 2 files changed, 39 insertions(+), 16 deletions(-)

diff --git a/hw/char/cmsdk-apb-uart.c b/hw/char/cmsdk-apb-uart.c
index 626b68f2ec..1b361bc4d6 100644
--- a/hw/char/cmsdk-apb-uart.c
+++ b/hw/char/cmsdk-apb-uart.c
@@ -96,19 +96,34 @@ static void uart_update_parameters(CMSDKAPBUART *s)

 static void cmsdk_apb_uart_update(CMSDKAPBUART *s)
 {
-    /* update outbound irqs, including handling the way the rxo and txo
-     * interrupt status bits are just logical AND of the overrun bit in
-     * STATE and the overrun interrupt enable bit in CTRL.
+    /*
+     * update outbound irqs
+     * (
+     *     state     [rxo,  txo,  rxbf, txbf ] at bit [3, 2, 1, 0]
+     *   | intstatus [rxo,  txo,  rx,   tx   ] at bit [3, 2, 1, 0]
+     * )
+     * & ctrl        [rxoe, txoe, rxe,  txe  ] at bit [5, 4, 3, 2]
+     * = masked_intstatus
+     *
+     * state: status register
+     * intstatus: pending interrupts and is sticky (has to be cleared by
sw)
+     * masked_intstatus: masked (by ctrl) pending interrupts
+     *
+     * intstatus [rxo, txo, rx] bits are set here
+     * intstatus [tx] is managed in uart_transmit
      */
-    uint32_t omask = (R_INTSTATUS_RXO_MASK | R_INTSTATUS_TXO_MASK);
-    s->intstatus &= ~omask;
-    s->intstatus |= (s->state & (s->ctrl >> 2) & omask);
-
-    qemu_set_irq(s->txint, !!(s->intstatus & R_INTSTATUS_TX_MASK));
-    qemu_set_irq(s->rxint, !!(s->intstatus & R_INTSTATUS_RX_MASK));
-    qemu_set_irq(s->txovrint, !!(s->intstatus & R_INTSTATUS_TXO_MASK));
-    qemu_set_irq(s->rxovrint, !!(s->intstatus & R_INTSTATUS_RXO_MASK));
-    qemu_set_irq(s->uartint, !!(s->intstatus));
+    s->intstatus |= s->state &
+        (R_INTSTATUS_RXO_MASK | R_INTSTATUS_TXO_MASK |
R_INTSTATUS_RX_MASK);
+
+    uint32_t masked_intstatus = s->intstatus & (s->ctrl >> 2);
+
+    trace_cmsdk_apb_uart_update(s->state, s->intstatus, masked_intstatus);
+
+    qemu_set_irq(s->txint,    !!(masked_intstatus & R_INTSTATUS_TX_MASK));
+    qemu_set_irq(s->rxint,    !!(masked_intstatus & R_INTSTATUS_RX_MASK));
+    qemu_set_irq(s->txovrint, !!(masked_intstatus & R_INTSTATUS_TXO_MASK));
+    qemu_set_irq(s->rxovrint, !!(masked_intstatus & R_INTSTATUS_RXO_MASK));
+    qemu_set_irq(s->uartint,  !!(masked_intstatus));
 }

 static int uart_can_receive(void *opaque)
@@ -144,9 +159,11 @@ static void uart_receive(void *opaque, const uint8_t
*buf, int size)

     s->rxbuf = *buf;
     s->state |= R_STATE_RXFULL_MASK;
-    if (s->ctrl & R_CTRL_RX_INTEN_MASK) {
-        s->intstatus |= R_INTSTATUS_RX_MASK;
-    }
+
+    /*
+     * Handled in cmsdk_apb_uart_update, in order to properly handle
+     * pending rx interrupt when rxen gets enabled
+     */
     cmsdk_apb_uart_update(s);
 }

@@ -278,7 +295,12 @@ static void uart_write(void *opaque, hwaddr offset,
uint64_t value,
          * is then reflected into the intstatus value by the update
function).
          */
         s->state &= ~(value & (R_INTSTATUS_TXO_MASK |
R_INTSTATUS_RXO_MASK));
-        s->intstatus &= ~value;
+
+        /*
+         * Clear rx interrupt status only if no pending character
+         * (no buffer full asserted).
+         */
+        s->intstatus &= ~value | (s->state & R_STATE_RXFULL_MASK);
         cmsdk_apb_uart_update(s);
         break;
     case A_BAUDDIV:
diff --git a/hw/char/trace-events b/hw/char/trace-events
index 81026f6612..0821c8eb3a 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -68,6 +68,7 @@ pl011_put_fifo_full(void) "FIFO now full, RXFF set"
 pl011_baudrate_change(unsigned int baudrate, uint64_t clock, uint32_t
ibrd, uint32_t fbrd) "new baudrate %u (clk: %" PRIu64 "hz, ibrd: %" PRIu32
", fbrd: %" PRIu32 ")"

 # cmsdk-apb-uart.c
+cmsdk_apb_uart_update(uint32_t state, uint32_t intstatus, uint32_t
masked_intstatus) "CMSDK APB UART update: state 0x%x intstatus 0x%x
masked_intstatus 0x%x"
 cmsdk_apb_uart_read(uint64_t offset, uint64_t data, unsigned size) "CMSDK
APB UART read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 cmsdk_apb_uart_write(uint64_t offset, uint64_t data, unsigned size) "CMSDK
APB UART write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 cmsdk_apb_uart_reset(void) "CMSDK APB UART: reset"
--
2.29.2

--000000000000a8f1a405b43acc3f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Previously, the RX interrupt got missed if:<br>- the chara=
cter backend provided the next character before the RX IRQ Handler<br>=C2=
=A0 managed to clear the currently served interrupt.<br>- the character bac=
kend provided the next character while the RX interrupt<br>=C2=A0 was disab=
led. Enabling the interrupt did not trigger the interrupt<br>=C2=A0 even if=
 the RXFULL status bit was set.<br><br>Signed-off-by: Tadej P &lt;<a href=
=3D"mailto:tpecar95@gmail.com">tpecar95@gmail.com</a>&gt;<br>---<br>=C2=A0h=
w/char/cmsdk-apb-uart.c | 54 ++++++++++++++++++++++++++++------------<br>=
=C2=A0hw/char/trace-events =C2=A0 =C2=A0 | =C2=A01 +<br>=C2=A02 files chang=
ed, 39 insertions(+), 16 deletions(-)<br><br>diff --git a/hw/char/cmsdk-apb=
-uart.c b/hw/char/cmsdk-apb-uart.c<br>index 626b68f2ec..1b361bc4d6 100644<b=
r>--- a/hw/char/cmsdk-apb-uart.c<br>+++ b/hw/char/cmsdk-apb-uart.c<br>@@ -9=
6,19 +96,34 @@ static void uart_update_parameters(CMSDKAPBUART *s)<br>=C2=
=A0<br>=C2=A0static void cmsdk_apb_uart_update(CMSDKAPBUART *s)<br>=C2=A0{<=
br>- =C2=A0 =C2=A0/* update outbound irqs, including handling the way the r=
xo and txo<br>- =C2=A0 =C2=A0 * interrupt status bits are just logical AND =
of the overrun bit in<br>- =C2=A0 =C2=A0 * STATE and the overrun interrupt =
enable bit in CTRL.<br>+ =C2=A0 =C2=A0/*<br>+ =C2=A0 =C2=A0 * update outbou=
nd irqs<br>+ =C2=A0 =C2=A0 * (<br>+ =C2=A0 =C2=A0 * =C2=A0 =C2=A0 state =C2=
=A0 =C2=A0 [rxo, =C2=A0txo, =C2=A0rxbf, txbf ] at bit [3, 2, 1, 0]<br>+ =C2=
=A0 =C2=A0 * =C2=A0 | intstatus [rxo, =C2=A0txo, =C2=A0rx, =C2=A0 tx =C2=A0=
 ] at bit [3, 2, 1, 0]<br>+ =C2=A0 =C2=A0 * )<br>+ =C2=A0 =C2=A0 * &amp; ct=
rl =C2=A0 =C2=A0 =C2=A0 =C2=A0[rxoe, txoe, rxe, =C2=A0txe =C2=A0] at bit [5=
, 4, 3, 2]<br>+ =C2=A0 =C2=A0 * =3D masked_intstatus<br>+ =C2=A0 =C2=A0 *<b=
r>+ =C2=A0 =C2=A0 * state: status register<br>+ =C2=A0 =C2=A0 * intstatus: =
pending interrupts and is sticky (has to be cleared by sw)<br>+ =C2=A0 =C2=
=A0 * masked_intstatus: masked (by ctrl) pending interrupts<br>+ =C2=A0 =C2=
=A0 *<br>+ =C2=A0 =C2=A0 * intstatus [rxo, txo, rx] bits are set here<br>+ =
=C2=A0 =C2=A0 * intstatus [tx] is managed in uart_transmit<br>=C2=A0 =C2=A0=
 =C2=A0 */<br>- =C2=A0 =C2=A0uint32_t omask =3D (R_INTSTATUS_RXO_MASK | R_I=
NTSTATUS_TXO_MASK);<br>- =C2=A0 =C2=A0s-&gt;intstatus &amp;=3D ~omask;<br>-=
 =C2=A0 =C2=A0s-&gt;intstatus |=3D (s-&gt;state &amp; (s-&gt;ctrl &gt;&gt; =
2) &amp; omask);<br>-<br>- =C2=A0 =C2=A0qemu_set_irq(s-&gt;txint, !!(s-&gt;=
intstatus &amp; R_INTSTATUS_TX_MASK));<br>- =C2=A0 =C2=A0qemu_set_irq(s-&gt=
;rxint, !!(s-&gt;intstatus &amp; R_INTSTATUS_RX_MASK));<br>- =C2=A0 =C2=A0q=
emu_set_irq(s-&gt;txovrint, !!(s-&gt;intstatus &amp; R_INTSTATUS_TXO_MASK))=
;<br>- =C2=A0 =C2=A0qemu_set_irq(s-&gt;rxovrint, !!(s-&gt;intstatus &amp; R=
_INTSTATUS_RXO_MASK));<br>- =C2=A0 =C2=A0qemu_set_irq(s-&gt;uartint, !!(s-&=
gt;intstatus));<br>+ =C2=A0 =C2=A0s-&gt;intstatus |=3D s-&gt;state &amp;<br=
>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0(R_INTSTATUS_RXO_MASK | R_INTSTATUS_TXO_MASK =
| R_INTSTATUS_RX_MASK);<br>+<br>+ =C2=A0 =C2=A0uint32_t masked_intstatus =
=3D s-&gt;intstatus &amp; (s-&gt;ctrl &gt;&gt; 2);<br>+<br>+ =C2=A0 =C2=A0t=
race_cmsdk_apb_uart_update(s-&gt;state, s-&gt;intstatus, masked_intstatus);=
<br>+<br>+ =C2=A0 =C2=A0qemu_set_irq(s-&gt;txint, =C2=A0 =C2=A0!!(masked_in=
tstatus &amp; R_INTSTATUS_TX_MASK));<br>+ =C2=A0 =C2=A0qemu_set_irq(s-&gt;r=
xint, =C2=A0 =C2=A0!!(masked_intstatus &amp; R_INTSTATUS_RX_MASK));<br>+ =
=C2=A0 =C2=A0qemu_set_irq(s-&gt;txovrint, !!(masked_intstatus &amp; R_INTST=
ATUS_TXO_MASK));<br>+ =C2=A0 =C2=A0qemu_set_irq(s-&gt;rxovrint, !!(masked_i=
ntstatus &amp; R_INTSTATUS_RXO_MASK));<br>+ =C2=A0 =C2=A0qemu_set_irq(s-&gt=
;uartint, =C2=A0!!(masked_intstatus));<br>=C2=A0}<br>=C2=A0<br>=C2=A0static=
 int uart_can_receive(void *opaque)<br>@@ -144,9 +159,11 @@ static void uar=
t_receive(void *opaque, const uint8_t *buf, int size)<br>=C2=A0<br>=C2=A0 =
=C2=A0 =C2=A0s-&gt;rxbuf =3D *buf;<br>=C2=A0 =C2=A0 =C2=A0s-&gt;state |=3D =
R_STATE_RXFULL_MASK;<br>- =C2=A0 =C2=A0if (s-&gt;ctrl &amp; R_CTRL_RX_INTEN=
_MASK) {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;intstatus |=3D R_INTSTATUS_R=
X_MASK;<br>- =C2=A0 =C2=A0}<br>+<br>+ =C2=A0 =C2=A0/*<br>+ =C2=A0 =C2=A0 * =
Handled in cmsdk_apb_uart_update, in order to properly handle<br>+ =C2=A0 =
=C2=A0 * pending rx interrupt when rxen gets enabled<br>+ =C2=A0 =C2=A0 */<=
br>=C2=A0 =C2=A0 =C2=A0cmsdk_apb_uart_update(s);<br>=C2=A0}<br>=C2=A0<br>@@=
 -278,7 +295,12 @@ static void uart_write(void *opaque, hwaddr offset, uint=
64_t value,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * is then reflected into =
the intstatus value by the update function).<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 */<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;state &amp;=3D ~(valu=
e &amp; (R_INTSTATUS_TXO_MASK | R_INTSTATUS_RXO_MASK));<br>- =C2=A0 =C2=A0 =
=C2=A0 =C2=A0s-&gt;intstatus &amp;=3D ~value;<br>+<br>+ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/*<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Clear rx interrupt status o=
nly if no pending character<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 * (no buffer f=
ull asserted).<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>+ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0s-&gt;intstatus &amp;=3D ~value | (s-&gt;state &amp; R_STATE_RXFU=
LL_MASK);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmsdk_apb_uart_update(s);<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>=C2=A0 =C2=A0 =C2=A0case A_BAU=
DDIV:<br>diff --git a/hw/char/trace-events b/hw/char/trace-events<br>index =
81026f6612..0821c8eb3a 100644<br>--- a/hw/char/trace-events<br>+++ b/hw/cha=
r/trace-events<br>@@ -68,6 +68,7 @@ pl011_put_fifo_full(void) &quot;FIFO no=
w full, RXFF set&quot;<br>=C2=A0pl011_baudrate_change(unsigned int baudrate=
, uint64_t clock, uint32_t ibrd, uint32_t fbrd) &quot;new baudrate %u (clk:=
 %&quot; PRIu64 &quot;hz, ibrd: %&quot; PRIu32 &quot;, fbrd: %&quot; PRIu32=
 &quot;)&quot;<br>=C2=A0<br>=C2=A0# cmsdk-apb-uart.c<br>+cmsdk_apb_uart_upd=
ate(uint32_t state, uint32_t intstatus, uint32_t masked_intstatus) &quot;CM=
SDK APB UART update: state 0x%x intstatus 0x%x masked_intstatus 0x%x&quot;<=
br>=C2=A0cmsdk_apb_uart_read(uint64_t offset, uint64_t data, unsigned size)=
 &quot;CMSDK APB UART read: offset 0x%&quot; PRIx64 &quot; data 0x%&quot; P=
RIx64 &quot; size %u&quot;<br>=C2=A0cmsdk_apb_uart_write(uint64_t offset, u=
int64_t data, unsigned size) &quot;CMSDK APB UART write: offset 0x%&quot; P=
RIx64 &quot; data 0x%&quot; PRIx64 &quot; size %u&quot;<br>=C2=A0cmsdk_apb_=
uart_reset(void) &quot;CMSDK APB UART: reset&quot;<br>--<br>2.29.2<br><br><=
/div>

--000000000000a8f1a405b43acc3f--

