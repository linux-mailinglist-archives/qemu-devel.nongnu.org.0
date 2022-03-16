Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C034DAE4A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 11:33:16 +0100 (CET)
Received: from localhost ([::1]:42700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUQxv-0000nU-JH
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 06:33:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nUQMu-0002Fp-1e
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 05:55:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nUQMp-0007uo-RB
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 05:54:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647424494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4BRCvcxUjIOoiBB4oL3cwBmh35emoKIkJHCs7+GmW6k=;
 b=CUdyXysGHKypGz7V7OwKoz3bwFkKpF2xC01rPjumINjLivpviljiLIbwcBmZy7Ez++p1Qr
 B1O1ivAnZ8z+OT2Eqjh27SsDx3i4hJYwT62bz2MLlw1vgdYkQWeS/CsJ9Yu2hr4F3u/j51
 sv4rGpIv4Rdhfug5xpJCqDWIaZZ5jAo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-SW5R-hdXPR2tbiSPflx3Dw-1; Wed, 16 Mar 2022 05:54:53 -0400
X-MC-Unique: SW5R-hdXPR2tbiSPflx3Dw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F2F1D3C14846;
 Wed, 16 Mar 2022 09:54:52 +0000 (UTC)
Received: from localhost (unknown [10.39.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9EE881400E73;
 Wed, 16 Mar 2022 09:54:51 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 24/27] Remove trailing ; after G_DEFINE_AUTO macro
Date: Wed, 16 Mar 2022 13:54:48 +0400
Message-Id: <20220316095448.2613859-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eric Blake <eblake@redhat.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The macro doesn't need it.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 configure    | 2 +-
 nbd/server.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 9e9b85147a5f..6d9cb23ac562 100755
--- a/configure
+++ b/configure
@@ -2248,7 +2248,7 @@ static void foo_free(Foo *f)
 {
     g_free(f);
 }
-G_DEFINE_AUTOPTR_CLEANUP_FUNC(Foo, foo_free);
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(Foo, foo_free)
 int main(void) { return 0; }
 EOF
 if ! compile_prog "$glib_cflags -Werror" "$glib_libs" ; then
diff --git a/nbd/server.c b/nbd/server.c
index 735381aacfcb..c5644fd3f6ad 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -2064,7 +2064,7 @@ static void nbd_extent_array_free(NBDExtentArray *ea)
     g_free(ea->extents);
     g_free(ea);
 }
-G_DEFINE_AUTOPTR_CLEANUP_FUNC(NBDExtentArray, nbd_extent_array_free);
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(NBDExtentArray, nbd_extent_array_free)
 
 /* Further modifications of the array after conversion are abandoned */
 static void nbd_extent_array_convert_to_be(NBDExtentArray *ea)
-- 
2.35.1.273.ge6ebfd0e8cbb


