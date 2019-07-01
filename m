Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB0818AE1
	for <lists+qemu-devel@lfdr.de>; Thu,  9 May 2019 15:39:55 +0200 (CEST)
Received: from localhost ([127.0.0.1]:54746 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOjH8-0004Iu-Ts
	for lists+qemu-devel@lfdr.de; Thu, 09 May 2019 09:39:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51305)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1hOjEz-0002t4-OO
	for qemu-devel@nongnu.org; Thu, 09 May 2019 09:37:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1hOjEy-0001wb-Sm
	for qemu-devel@nongnu.org; Thu, 09 May 2019 09:37:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48920)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sgarzare@redhat.com>)
	id 1hOjEy-0001wU-Nn; Thu, 09 May 2019 09:37:40 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 002D9307EA9F;
	Thu,  9 May 2019 13:37:40 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-116-227.ams2.redhat.com
	[10.36.116.227])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5067217989;
	Thu,  9 May 2019 13:37:38 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  9 May 2019 15:37:37 +0200
Message-Id: <20190509133737.242548-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Thu, 09 May 2019 13:37:40 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] net/slirp: fix the error message when the
 prefix len is invalid
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, Jan Kiszka <jan.kiszka@siemens.com>,
	Jason Wang <jasowang@redhat.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a missing parentheses at the end of the error message,
when we have an invalid prefix len.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 net/slirp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/slirp.c b/net/slirp.c
index 95934fb36d..0f4ae0abc0 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -498,7 +498,8 @@ static int net_slirp_init(NetClientState *peer, const=
 char *model,
     }
     if (vprefix6_len < 0 || vprefix6_len > 126) {
         error_setg(errp,
-                   "Invalid prefix provided (prefix len must be in range=
 0-126");
+                   "Invalid prefix provided "
+                   "(prefix len must be in range 0-126)");
         return -1;
     }
=20
--=20
2.20.1


