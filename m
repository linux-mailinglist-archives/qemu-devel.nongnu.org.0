Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FBA78EFC
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jul 2019 17:19:40 +0200 (CEST)
Received: from localhost ([::1]:53544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hs7R5-0000Kr-Al
	for lists+qemu-devel@lfdr.de; Mon, 29 Jul 2019 11:19:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39680)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <damien.hedde@greensocs.com>) id 1hs79B-0007M2-D6
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 11:01:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1hs799-0006a8-Jm
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 11:01:08 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:49052)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1hs78t-0005S4-Oh; Mon, 29 Jul 2019 11:00:53 -0400
Received: from kouign-amann.bar.greensocs.com (unknown [172.16.11.117])
 by beetle.greensocs.com (Postfix) with ESMTPS id 1DE7C96F97;
 Mon, 29 Jul 2019 14:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1564412358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mT1SeeKucmc8IuW94V9VP/AALM7YEnzQm+i28TezWA0=;
 b=Rk25e/UyeEwl3Nl5ykINYeodVRnVemJuBNes2CqyrP47faAsghjCXyblixQVDnwV6hMYMf
 foh0XxF04aTrFe75RvcDuzeCMuTg7qX1T23wrdOj9fvkpB5N85XWgRH6bGMqd+msdY3VqA
 g5dAEOE6pI7Yfz2Fijvm8kPB1Y4tq6I=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Mon, 29 Jul 2019 16:56:41 +0200
Message-Id: <20190729145654.14644-21-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729145654.14644-1-damien.hedde@greensocs.com>
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1564412358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mT1SeeKucmc8IuW94V9VP/AALM7YEnzQm+i28TezWA0=;
 b=PGGiRBGftSOHGSCE+X+S8zduGQFjtpLkNhWzHwjFMgSXLu4bOnHcBAPbbs/GPlBNXXu/zW
 zhfRv6FXfuyB6f485IN2GlRxpKo0CAqmtSFZlkbOXflPEIjci/ATcROqIt32YLTOZYfkd9
 Hz+WxKHq1hJGom2yTfcIj9mBnJWPL+c=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1564412358; a=rsa-sha256; cv=none;
 b=QcBwg0BVzq57f5hlgeh94iiJ2W/FtCuuNmtg8MaCzwXNpzljhjwwnyj57NSrPcDplD7dzi
 R1gczB2c1TRBGMZGE61zNiU47Vsa5BxS73OIOoMVjHP9vYZOxceQ2aNqmCNvG4sq2eXCyn
 yuhB5yq9qCO9YVxcwKZhtLRK1EV4pIk=
ARC-Authentication-Results: i=1;
	beetle.greensocs.com;
	none
X-Spam: Yes
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
Subject: [Qemu-devel] [PATCH v3 20/33] hw/hyperv/hyperv.c: remove
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

Replace legacy's reset call by device_reset_warm in
*hyperv_synic_reset*.

The new function propagates also the reset to the sub-buses tree but this=
 has
no impact since SynICState has no child bus.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/hyperv/hyperv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/hyperv/hyperv.c b/hw/hyperv/hyperv.c
index cd9db3cb5c..ae377934ee 100644
--- a/hw/hyperv/hyperv.c
+++ b/hw/hyperv/hyperv.c
@@ -140,7 +140,7 @@ void hyperv_synic_reset(CPUState *cs)
     SynICState *synic =3D get_synic(cs);
=20
     if (synic) {
-        device_legacy_reset(DEVICE(synic));
+        device_reset_warm(DEVICE(synic));
     }
 }
=20
--=20
2.22.0


