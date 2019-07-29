Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3517278EBC
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jul 2019 17:08:22 +0200 (CEST)
Received: from localhost ([::1]:53110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hs7G9-0002uE-Bu
	for lists+qemu-devel@lfdr.de; Mon, 29 Jul 2019 11:08:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38733)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <damien.hedde@greensocs.com>) id 1hs78D-0005d1-KJ
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 11:00:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1hs78C-0005eE-Kn
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 11:00:09 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:48360)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1hs787-0004fu-7l; Mon, 29 Jul 2019 11:00:03 -0400
Received: from kouign-amann.bar.greensocs.com (unknown [172.16.11.117])
 by beetle.greensocs.com (Postfix) with ESMTPS id 1315096F87;
 Mon, 29 Jul 2019 14:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1564412351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JUkSJk/z4p8uU9Wl2P+lKIjShSp3qQDd9mv3tstBlD0=;
 b=3ZBxpLx2cz1sC5ElXTSOCFd4r9wavd9+5+AgkakHzj8AuKg40TshxcTjGaRAzEEllsWnWA
 S+sdlYbktkyn3431nVyQyBPPCMYMVvcbs8FynFY3j/zSX16jFjnXh2AXwOrISiehOkjW2x
 jaDvXeRn0ZR8ypWu5/SjtR7Jq6n2oEU=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Mon, 29 Jul 2019 16:56:36 +0200
Message-Id: <20190729145654.14644-16-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729145654.14644-1-damien.hedde@greensocs.com>
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1564412351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JUkSJk/z4p8uU9Wl2P+lKIjShSp3qQDd9mv3tstBlD0=;
 b=ZrZyGQ5n0g7gvGYleIogdes7RUtsC4bjEAVlhfb/kiSYT2NgILzu0pRP1D/CI4TtefjnWo
 L84uVE7SG123638D6gtirI3GDJtgNk+gMcXhdDZ0sLca3P8TpV4HJhx2bAqibwFPLjcLs/
 mp6d8Fy4zSekFkdyU+I5lT+p0Jc5GAk=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1564412351; a=rsa-sha256; cv=none;
 b=TPJPzohUoDfJfCMHaq0O1Ho3g6uFOfRF62qmtdrakW0V5qPbmoaP2L8majT3BqC8PCYiFB
 BVDYcEe7azcuXdebWA4WzAND/DsjAi1f5e0RqHZkcPBiNu75diDMYYmEm46d4e8nOL+3iB
 LonCOki/kb1SWtbKwZ9BWpA7cXpojZU=
ARC-Authentication-Results: i=1;
	beetle.greensocs.com;
	none
X-Spam: Yes
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
Subject: [Qemu-devel] [PATCH v3 15/33] hw/ide/piix.c: remove qdev_reset_all
 call
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

Replace deprecated qdev_reset_all by device_reset_warm.

This does not impact the behavior.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/ide/piix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index b97e555072..64cb4a52ef 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -196,7 +196,7 @@ int pci_piix3_xen_ide_unplug(DeviceState *dev, bool a=
ux)
             blk_unref(blk);
         }
     }
-    qdev_reset_all(DEVICE(dev));
+    device_reset_warm(DEVICE(dev));
     return 0;
 }
=20
--=20
2.22.0


