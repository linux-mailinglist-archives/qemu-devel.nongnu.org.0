Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF6A1B31E0
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Apr 2020 23:23:42 +0200 (CEST)
Received: from localhost ([::1]:36290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jR0Mn-0006dC-8h
	for lists+qemu-devel@lfdr.de; Tue, 21 Apr 2020 17:23:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57986)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jR0Jn-0005Bg-OV
 for qemu-devel@nongnu.org; Tue, 21 Apr 2020 17:20:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jR0Ji-0004Rs-KL
 for qemu-devel@nongnu.org; Tue, 21 Apr 2020 17:20:34 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:55654
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jR0Jh-0004Mi-EW
 for qemu-devel@nongnu.org; Tue, 21 Apr 2020 17:20:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587504026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=66FBuX3kMTK7TLcLsZBvJg+BKOaPWvGWonKu5G7q3lU=;
 b=ba5XTxsnqtn/SIUtr/JdyuO27gVbEsFA8JfvT6ibwnPHAy7OK78rmfJrWhz625nl5hTcOG
 J70gCTANfLe/qXr3m1rloDaeDlbpM5oxX5+EJAOT89mlLzkwiNTXu+kM3a4mPjIwes024j
 OaBxegaN8cv1qVGiQVfxevWLmLnrZoE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-HuHRNCToMgys0kllwYljug-1; Tue, 21 Apr 2020 17:20:24 -0400
X-MC-Unique: HuHRNCToMgys0kllwYljug-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CED3D18C35A2;
 Tue, 21 Apr 2020 21:20:23 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-80.rdu2.redhat.com [10.10.116.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EDA34A18BC;
 Tue, 21 Apr 2020 21:20:22 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/6] docs: Sort sections on qemu-img subcommand parameters
Date: Tue, 21 Apr 2020 16:20:14 -0500
Message-Id: <20200421212019.170707-2-eblake@redhat.com>
In-Reply-To: <20200421212019.170707-1-eblake@redhat.com>
References: <20200421212019.170707-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/21 17:20:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: nsoffer@redhat.com, kwolf@redhat.com, jsnow@redhat.com,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already list the subcommand summaries alphabetically, we should do
the same for the documentation related to subcommand-specific
parameters.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 docs/tools/qemu-img.rst | 48 ++++++++++++++++++++---------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
index 0080f83a76c9..7d08c48d308f 100644
--- a/docs/tools/qemu-img.rst
+++ b/docs/tools/qemu-img.rst
@@ -142,30 +142,6 @@ by the used format or see the format descriptions belo=
w for details.
   the documentation of the emulator's ``-drive cache=3D...`` option for al=
lowed
   values.

-Parameters to snapshot subcommand:
-
-.. program:: qemu-img-snapshot
-
-.. option:: snapshot
-
-  Is the name of the snapshot to create, apply or delete
-
-.. option:: -a
-
-  Applies a snapshot (revert disk to saved state)
-
-.. option:: -c
-
-  Creates a snapshot
-
-.. option:: -d
-
-  Deletes a snapshot
-
-.. option:: -l
-
-  Lists all snapshots in the given image
-
 Parameters to compare subcommand:

 .. program:: qemu-img-compare
@@ -245,6 +221,30 @@ Parameters to dd subcommand:

   Sets the number of input blocks to skip

+Parameters to snapshot subcommand:
+
+.. program:: qemu-img-snapshot
+
+.. option:: snapshot
+
+  Is the name of the snapshot to create, apply or delete
+
+.. option:: -a
+
+  Applies a snapshot (revert disk to saved state)
+
+.. option:: -c
+
+  Creates a snapshot
+
+.. option:: -d
+
+  Deletes a snapshot
+
+.. option:: -l
+
+  Lists all snapshots in the given image
+
 Command description:

 .. program:: qemu-img-commands
--=20
2.26.2


