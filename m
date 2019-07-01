Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 373E1165E0
	for <lists+qemu-devel@lfdr.de>; Tue,  7 May 2019 16:38:56 +0200 (CEST)
Received: from localhost ([127.0.0.1]:47824 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hO1F9-0002qA-EV
	for lists+qemu-devel@lfdr.de; Tue, 07 May 2019 10:38:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48449)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1hO1Do-0002Ga-O2
	for qemu-devel@nongnu.org; Tue, 07 May 2019 10:37:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1hO1Dn-0008Lt-Ot
	for qemu-devel@nongnu.org; Tue, 07 May 2019 10:37:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37786)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>) id 1hO1Dn-0008KH-JL
	for qemu-devel@nongnu.org; Tue, 07 May 2019 10:37:31 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E61C281E18
	for <qemu-devel@nongnu.org>; Tue,  7 May 2019 14:37:30 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-15.phx2.redhat.com [10.3.116.15])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 541A12657F;
	Tue,  7 May 2019 14:37:28 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: 
Date: Tue,  7 May 2019 09:37:27 -0500
Message-Id: <20190507143727.15640-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 07 May 2019 14:37:30 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [slirp PATCH] maint: Add .gitignore
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
Cc: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ignore build artifacts during an in-tree build.

Signed-off-by: Eric Blake <eblake@redhat.com>
---

Sadly, libslirp includes no README (yet), and
https://gitlab.freedesktop.org/slirp (mentioned in qemu commit
7c47bdd8) does not seem to call out any slirp-specific mailing list
which should be cc'd for this patch.  I'd recommend that libslirp add
some documentation (both to a README file present in a git checkout,
and to the project web page), to make it friendlier to drive-by
emailed patch contributions.

 .gitignore | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 .gitignore

diff --git a/.gitignore b/.gitignore
new file mode 100644
index 0000000..daded16
--- /dev/null
+++ b/.gitignore
@@ -0,0 +1,4 @@
+*.a
+*.d
+*.o
+/src/libslirp-version.h
--=20
2.20.1


