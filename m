Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB47167EB8
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 14:35:37 +0100 (CET)
Received: from localhost ([::1]:57852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j58Su-00075Y-92
	for lists+qemu-devel@lfdr.de; Fri, 21 Feb 2020 08:35:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32896)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1j58JQ-0002ln-M0
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 08:25:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1j58JO-0007Dh-Nu
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 08:25:47 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:29468
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1j58JO-0007D8-Jj
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 08:25:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582291546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gHpGZPegfWHVhKgIAmrHIDKDWR6mi0Dl7I1mfwjtkJE=;
 b=gqNI9gwgD592TVQSorG7QaYfT6fpFdrsyQOvqRyamrBSZofBAT/3ddrlorsiQgdpS5SkR/
 FSc0zsQMsvdhHrlp7f5QIlrLvW9gzhp9qvtZFjLoCX0mt9lXhkCH/Pe01H60o/btQ32u6X
 ZkAwXvRTigwRR+osnM4H0OlbIdgWcjk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-ITq4KLSUMvS4zNaQbex7fA-1; Fri, 21 Feb 2020 08:25:44 -0500
X-MC-Unique: ITq4KLSUMvS4zNaQbex7fA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14784107ACC7;
 Fri, 21 Feb 2020 13:25:43 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.1])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C54F84BCC;
 Fri, 21 Feb 2020 13:25:41 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, philmd@redhat.com, yangx.jy@cn.fujitsu.com,
 mrezanin@redhat.com
Subject: [PULL 2/6] tools/virtiofsd/passthrough_ll: Remove unneeded variable
 assignment
Date: Fri, 21 Feb 2020 13:25:32 +0000
Message-Id: <20200221132536.38364-3-dgilbert@redhat.com>
In-Reply-To: <20200221132536.38364-1-dgilbert@redhat.com>
References: <20200221132536.38364-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Fix warning reported by Clang static code analyzer:

    CC      tools/virtiofsd/passthrough_ll.o
  tools/virtiofsd/passthrough_ll.c:1083:5: warning: Value stored to 'saverr=
' is never read
      saverr =3D ENOMEM;
      ^        ~~~~~~

Fixes: 7c6b66027
Reported-by: Clang Static Analyzer
Reviewed-by: J=C3=A1n Tomko <jtomko@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index c635fc8820..e9e71d5fc2 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -1080,8 +1080,6 @@ static void lo_mknod_symlink(fuse_req_t req, fuse_ino=
_t parent,
         return;
     }
=20
-    saverr =3D ENOMEM;
-
     saverr =3D lo_change_cred(req, &old);
     if (saverr) {
         goto out;
--=20
2.24.1


