Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F96A12CF65
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Dec 2019 12:19:36 +0100 (CET)
Received: from localhost ([::1]:60546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ilt5D-0005A0-Ob
	for lists+qemu-devel@lfdr.de; Mon, 30 Dec 2019 06:19:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36349)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ilt3z-0004U3-Jh
 for qemu-devel@nongnu.org; Mon, 30 Dec 2019 06:18:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ilt3x-0008U5-Br
 for qemu-devel@nongnu.org; Mon, 30 Dec 2019 06:18:19 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:27637
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ilt3s-0008SA-AL
 for qemu-devel@nongnu.org; Mon, 30 Dec 2019 06:18:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577704691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4kTG5ZqN2/PAmEoRVFs6v7U1ZnC1Ba9MP0oHqjlTJfc=;
 b=S2DqfNzPZFWmahTbWQ8tSKgWQG0vRABSzjGm6DjIMWYhBukPcmFunxjyjYSSLoY2LFmmJ8
 8+7ITMuLOjdpYt2kUEyHsXX1TOrd85HH2tIPx1iG6WHS+qZ3aoNWLwwWPYIGuHkvK5ilTb
 Nb6DVJVFMAlK0T3AAF97EKvJ02dJlCM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-Kv5g1z8-MWaVswYBBVbgew-1; Mon, 30 Dec 2019 06:18:07 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEA008017DF;
 Mon, 30 Dec 2019 11:18:06 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-116-185.ams2.redhat.com [10.36.116.185])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 40C1E1081303;
 Mon, 30 Dec 2019 11:18:02 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] MAINTAINERS: Remove Claudio Fontana bouncing email
Date: Mon, 30 Dec 2019 12:18:00 +0100
Message-Id: <20191230111801.26315-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: Kv5g1z8-MWaVswYBBVbgew-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Claudio Fontana <claudio.fontana@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Claudio Fontana Huawei email is bouncing, remove it.

  The message you sent to claudio.fontana@huawei.com couldn't be
  delivered due to: Recipient email address is possibly incorrect.

  Further information:
    5.1.1 Error: invalid recipients

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 387879aebc..8db4de6b9a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2383,7 +2383,6 @@ F: plugins/
 F: tests/plugin
=20
 AArch64 TCG target
-M: Claudio Fontana <claudio.fontana@huawei.com>
 M: Claudio Fontana <claudio.fontana@gmail.com>
 S: Maintained
 L: qemu-arm@nongnu.org
--=20
2.21.0


