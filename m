Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF6815F77A
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Feb 2020 21:11:16 +0100 (CET)
Received: from localhost ([::1]:45138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2hIx-0003qD-6q
	for lists+qemu-devel@lfdr.de; Fri, 14 Feb 2020 15:11:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51898)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1j2hGP-0007QU-9w
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 15:08:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1j2hGO-0005R7-BC
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 15:08:37 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:32481
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1j2hGO-0005QV-7f
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 15:08:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581710915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q+WJ9A0MdHS2JVaGI30bMN+WQVzGoxwouKYg1sBf3pI=;
 b=Mx28TSH9TvrWR7nv5SOQQAhM9LM3T9E8EaBZgqbwK/NhzCSg4t1s8lx2gi62kQJVTaZV9x
 rdN8B9URUVh50+UKCmJTEu1qxKQhyReO3Ppz5nw6I8eCL3gMtxgBDhZr7Kddp64tA6kCsZ
 AUYnR4E+jP57m3PwHITMbonHguIgg/0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-oj-uNuTfPsad8q9O5ZM01w-1; Fri, 14 Feb 2020 15:08:32 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1161E800D53;
 Fri, 14 Feb 2020 20:08:31 +0000 (UTC)
Received: from linux.fritz.box.com (unknown [10.36.118.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A3125C1C3;
 Fri, 14 Feb 2020 20:08:29 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 2/7] commit: Remove unused bytes_written
Date: Fri, 14 Feb 2020 21:08:07 +0100
Message-Id: <20200214200812.28180-3-kwolf@redhat.com>
In-Reply-To: <20200214200812.28180-1-kwolf@redhat.com>
References: <20200214200812.28180-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: oj-uNuTfPsad8q9O5ZM01w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, nsoffer@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The bytes_written variable is only ever written to, it serves no
purpose. This has actually been the case since the commit job was first
introduced in commit 747ff602636.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/commit.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/block/commit.c b/block/commit.c
index 23c90b3b91..cce898a4f3 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -140,7 +140,6 @@ static int coroutine_fn commit_run(Job *job, Error **er=
rp)
     int ret =3D 0;
     int64_t n =3D 0; /* bytes */
     void *buf =3D NULL;
-    int bytes_written =3D 0;
     int64_t len, base_len;
=20
     ret =3D len =3D blk_getlength(s->top);
@@ -180,7 +179,6 @@ static int coroutine_fn commit_run(Job *job, Error **er=
rp)
         trace_commit_one_iteration(s, offset, n, ret);
         if (copy) {
             ret =3D commit_populate(s->top, s->base, offset, n, buf);
-            bytes_written +=3D n;
         }
         if (ret < 0) {
             BlockErrorAction action =3D
--=20
2.20.1


