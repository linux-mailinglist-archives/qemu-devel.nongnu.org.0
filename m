Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B83EE1627D2
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Feb 2020 15:14:20 +0100 (CET)
Received: from localhost ([::1]:35848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j43dj-0003k5-Mi
	for lists+qemu-devel@lfdr.de; Tue, 18 Feb 2020 09:14:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53065)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1j43Xx-0007Ui-BW
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 09:08:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1j43Xw-0001Z7-AT
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 09:08:21 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:53660
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1j43Xw-0001Ym-79
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 09:08:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582034899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tn4D6pU3zHYfyDfKU8k/VBSlZKwhv1aGUwReNMGhKtA=;
 b=iJXjHgvANwEEHdccqWghzXjqnTkfQQ5yEyFHjFTGkspowyewucH2WnXuRgy8dsMWfDTh2Q
 rfhi8AZDAbTgeXHyO38N2gigYMRqj89Ia0aq2PIYd/02zZDalU2V8bnBnGroq/dbNpnX4G
 SxwpP+litqcPKvqgtCAMlnx8KdqW2kg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-GRLK2wTENamgoqvJgoi_kA-1; Tue, 18 Feb 2020 09:08:15 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E845801F78;
 Tue, 18 Feb 2020 14:08:14 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-117-181.ams2.redhat.com
 [10.36.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8ACB119E9C;
 Tue, 18 Feb 2020 14:08:13 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 17/36] block/io_uring: Remove superfluous semicolon
Date: Tue, 18 Feb 2020 15:07:03 +0100
Message-Id: <20200218140722.23876-18-kwolf@redhat.com>
In-Reply-To: <20200218140722.23876-1-kwolf@redhat.com>
References: <20200218140722.23876-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: GRLK2wTENamgoqvJgoi_kA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Fixes: 6663a0a3376
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <20200218094402.26625-5-philmd@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/io_uring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/io_uring.c b/block/io_uring.c
index 56892fd1ab..a3142ca989 100644
--- a/block/io_uring.c
+++ b/block/io_uring.c
@@ -187,7 +187,7 @@ static void luring_process_completions(LuringState *s)
                     ret =3D 0;
                 }
             } else {
-                ret =3D -ENOSPC;;
+                ret =3D -ENOSPC;
             }
         }
 end:
--=20
2.20.1


