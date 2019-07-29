Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E16F78ED9
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jul 2019 17:14:19 +0200 (CEST)
Received: from localhost ([::1]:53310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hs7Lu-0007f0-75
	for lists+qemu-devel@lfdr.de; Mon, 29 Jul 2019 11:14:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39608)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <damien.hedde@greensocs.com>) id 1hs799-0007HB-I4
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 11:01:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1hs798-0006Xf-6e
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 11:01:07 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:49058)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1hs78t-0005SA-Og; Mon, 29 Jul 2019 11:00:53 -0400
Received: from kouign-amann.bar.greensocs.com (unknown [172.16.11.117])
 by beetle.greensocs.com (Postfix) with ESMTPS id DE95796F9A;
 Mon, 29 Jul 2019 14:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1564412361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1HoLedqaHFCEiYSkRjPotMwTDNCFXhCgcBZD95/OiZo=;
 b=Xr62mWIQEwdGnuxWiLpJncXpPhAUuO0NZ2Xy7a9HUXGM+ou+etjs183oE/kFel+6lC2eJt
 +6eVwkuNZMKmA9fpVZzVWfdlMCrEijGCXjtHHl5S2hB+AK7B5BNwjG3JFlRGLesmgrwd5C
 Rc9zQf4q/za38IEWQ9YpXo32qcEnpPc=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Mon, 29 Jul 2019 16:56:43 +0200
Message-Id: <20190729145654.14644-23-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729145654.14644-1-damien.hedde@greensocs.com>
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1564412361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1HoLedqaHFCEiYSkRjPotMwTDNCFXhCgcBZD95/OiZo=;
 b=NIJOwCHtZZJFciYeaOJEeKg11+5sAvFRHcwD3arGxW/6kCZhAzSzg6/eXVlV9cP36jaPne
 5UA2G16WR1elSjaq+oQUdj2PNtg1mVlfWPDleEBmnTqFuAvDISl1d8rAL0yBnRgD5PSYOk
 nYS4AfUoXWgt7ZCQK8N+tctdbIaMpuM=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1564412361; a=rsa-sha256; cv=none;
 b=0+PfB123rGeUdfG4F42XHYDGHcRWj91+XVIXEqCQU/4HEwSoJjFd8fh60K1eey2y3EucVe
 eGNBYqyqIq2GJMQqrgjm0XsmNyuTI3y9pjdKH3OGwI3HbPw2jRMe4iA4+Mui/4kfjNtldu
 62483G6LUW74JNbm4+Huscco5iQ9ERQ=
ARC-Authentication-Results: i=1;
	beetle.greensocs.com;
	none
X-Spam: Yes
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
Subject: [Qemu-devel] [PATCH v3 22/33] hw/ppc/pnv_psi.c: remove
 device_legacy_reset call
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
Cc: fam@euphon.net, peter.maydell@linaro.org, walling@linux.ibm.com,
 dmitry.fleytman@gmail.com, mst@redhat.com, mark.cave-ayland@ilande.co.uk,
 kraxel@redhat.com, edgar.iglesias@xilinx.com, hare@suse.com,
 qemu-block@nongnu.org, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, marcandre.lureau@redhat.com, rth@twiddle.net,
 thuth@redhat.com, ehabkost@redhat.com, alistair@alistair23.me,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, clg@kaod.org, jsnow@redhat.com,
 david@gibson.dropbear.id.au, Damien Hedde <damien.hedde@greensocs.com>,
 berrange@redhat.com, cohuck@redhat.com, mark.burton@greensocs.com,
 qemu-ppc@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace legacy's reset call by device_reset_warm.

The new function propagates also the reset to the sub-buses tree but this=
 has
no impact since XiveSource has no child bus.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/ppc/pnv_psi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/pnv_psi.c b/hw/ppc/pnv_psi.c
index 78eafa353a..c17e83abe5 100644
--- a/hw/ppc/pnv_psi.c
+++ b/hw/ppc/pnv_psi.c
@@ -703,7 +703,7 @@ static void pnv_psi_p9_mmio_write(void *opaque, hwadd=
r addr,
         break;
     case PSIHB9_INTERRUPT_CONTROL:
         if (val & PSIHB9_IRQ_RESET) {
-            device_legacy_reset(DEVICE(&psi9->source));
+            device_reset_warm(DEVICE(&psi9->source));
         }
         psi->regs[reg] =3D val;
         break;
--=20
2.22.0


