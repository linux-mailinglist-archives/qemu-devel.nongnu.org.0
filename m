Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE651233AD
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Dec 2019 18:37:07 +0100 (CET)
Received: from localhost ([::1]:44226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihGmP-0003yP-OK
	for lists+qemu-devel@lfdr.de; Tue, 17 Dec 2019 12:37:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46475)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ihGke-00026V-7i
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 12:35:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ihGkd-0000eG-4T
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 12:35:16 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:33030
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ihGkd-0000dZ-0L
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 12:35:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576604114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y+5GQW/D3XfrNd11HlFzSAvLO+49VFKNR/eOAZ5FZJk=;
 b=FEUwkMhkciZN3cnRaTxCyJuioITSPNN9xRlpk7BcXFop+jpm6mBjdpArLHXR3Un6pR1ZGu
 d07BjZ7+Z7smQkEtRtRb4CQ/LRfGJ9NXG/ROABffX3IhWe2EI8qjCQd0kO7D2SqVVXfaKs
 Ze2evdJrbPf/QKiiWHllzQ6Qz7fEqSw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-0nPwLdugM5mNllHWznEZyw-1; Tue, 17 Dec 2019 12:35:11 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49E4EDBFB;
 Tue, 17 Dec 2019 17:35:10 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-147.brq.redhat.com [10.40.205.147])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3150826571;
 Tue, 17 Dec 2019 17:35:06 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/6] qemu-io-cmds: Silent GCC9 format-overflow warning
Date: Tue, 17 Dec 2019 18:34:25 +0100
Message-Id: <20191217173425.5082-7-philmd@redhat.com>
In-Reply-To: <20191217173425.5082-1-philmd@redhat.com>
References: <20191217173425.5082-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 0nPwLdugM5mNllHWznEZyw-1
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
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GCC9 is confused when building with CFLAG -O3:

  In function =E2=80=98help_oneline=E2=80=99,
      inlined from =E2=80=98help_all=E2=80=99 at qemu-io-cmds.c:2414:9,
      inlined from =E2=80=98help_f=E2=80=99 at qemu-io-cmds.c:2424:9:
  qemu-io-cmds.c:2389:9: error: =E2=80=98%s=E2=80=99 directive argument is =
null [-Werror=3Dformat-overflow=3D]
   2389 |         printf("%s ", ct->name);
        |         ^~~~~~~~~~~~~~~~~~~~~~~

Audit shows this can't happen. Give a hint to GCC adding an
assert() call.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Max Reitz <mreitz@redhat.com>
Cc: qemu-block@nongnu.org
---
 qemu-io-cmds.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index 1b7e700020..9e956a5dd4 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -2411,6 +2411,7 @@ static void help_all(void)
     const cmdinfo_t *ct;
=20
     for (ct =3D cmdtab; ct < &cmdtab[ncmds]; ct++) {
+        assert(ct->name);
         help_oneline(ct->name, ct);
     }
     printf("\nUse 'help commandname' for extended help.\n");
--=20
2.21.0


