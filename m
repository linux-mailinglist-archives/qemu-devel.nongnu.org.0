Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9395112DAFC
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Dec 2019 19:43:58 +0100 (CET)
Received: from localhost ([::1]:45454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1imMUn-0005BB-HC
	for lists+qemu-devel@lfdr.de; Tue, 31 Dec 2019 13:43:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46264)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1imML7-0000fO-AT
 for qemu-devel@nongnu.org; Tue, 31 Dec 2019 13:33:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1imML6-0002Q2-60
 for qemu-devel@nongnu.org; Tue, 31 Dec 2019 13:33:57 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:24330
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1imML6-0002Oi-2M
 for qemu-devel@nongnu.org; Tue, 31 Dec 2019 13:33:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577817235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MjHVdP/5ri9UqY1Fmuk97Ss0NV6vSnEanJqzdtKIYwI=;
 b=hZ3E3WIOlem53JIYwNpU9UEVSkQZICKSwXa8XyG1xQL3TL4tF3UHvC3n0Tu3vw4Xm89KAd
 mSO+7KSH4JMB5eMVF7w9h2B/DuWHnIh7dL0UuJy1Lrn8bob5TX2DVCwXqmNBDxRmMJvVYN
 MU1+stdbVhgcg42d+TXSquxw1vRskDk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-OfC3hBUjMcS19eAIPukIsQ-1; Tue, 31 Dec 2019 13:33:54 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B23210054E3;
 Tue, 31 Dec 2019 18:33:52 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-116-30.ams2.redhat.com [10.36.116.30])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DE2067673;
 Tue, 31 Dec 2019 18:33:39 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 08/14] hw/ppc/Kconfig: Let the Xilinx Virtex5 ML507 use the
 PPC-440 devices
Date: Tue, 31 Dec 2019 19:32:10 +0100
Message-Id: <20191231183216.6781-9-philmd@redhat.com>
In-Reply-To: <20191231183216.6781-1-philmd@redhat.com>
References: <20191231183216.6781-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: OfC3hBUjMcS19eAIPukIsQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Fam Zheng <fam@euphon.net>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When configured with --without-default-devices, the build fails:

    LINK    ppc-softmmu/qemu-system-ppc
  /usr/bin/ld: hw/ppc/virtex_ml507.o: in function `ppc440_init_xilinx':
  hw/ppc/virtex_ml507.c:112: undefined reference to `ppcuic_init'
  collect2: error: ld returned 1 exit status
  make[1]: *** [Makefile:206: qemu-system-ppc] Error 1
  make: *** [Makefile:483: ppc-softmmu/all] Error 2

Fix by selecting the PPC4XX config.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/ppc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index 004b7d5ad5..d8482a5e99 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -110,6 +110,7 @@ config E500
=20
 config VIRTEX
     bool
+    select PPC4XX
     select PFLASH_CFI01
     select SERIAL
     select XILINX
--=20
2.21.0


