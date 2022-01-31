Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D52BE4A494D
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 15:28:08 +0100 (CET)
Received: from localhost ([::1]:33660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEXf5-0001Zm-GB
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 09:28:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nEXDX-00088u-8l
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 08:59:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nEXDU-0006c6-TY
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 08:59:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643637576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qZw6P68jBMD+Ba0ZG5HIVYcxqhAttqL+0lJAFZXhhrY=;
 b=ACAaQctyHKsOmBP3daPHKc6xKzQ3d8KAyWj+JprCEFtpvSXENBIWZe0zsZv2v++zIRRGaE
 n+xuo4gK73iaTkRlTUx65mDByJRvmjsISNQuOaIYUYOUjt2MyeuppmTp92MQPMj76TgdWr
 OM7GofflTjyGR6Jv92iE+u3O4AA0iYw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-SVnCshKHPu6rbQqJvvMS7Q-1; Mon, 31 Jan 2022 08:59:33 -0500
X-MC-Unique: SVnCshKHPu6rbQqJvvMS7Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 268141083F62;
 Mon, 31 Jan 2022 13:59:32 +0000 (UTC)
Received: from localhost (unknown [10.39.194.217])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5294A84A16;
 Mon, 31 Jan 2022 13:59:10 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH] qemu-img: Unify [-b [-F]] documentation
Date: Mon, 31 Jan 2022 14:59:08 +0100
Message-Id: <20220131135908.32393-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu-img convert documents the backing file and backing format options
as follows:
    [-B backing_file [-F backing_fmt]]
whereas qemu-img create has this:
    [-b backing_file] [-F backing_fmt]

That is, for convert, we document that -F cannot be given without -B,
while for create, way say that they are independent.

Indeed, it is technically possible to give -F without -b, because it is
left to the block driver to decide whether this is an error or not, so
sometimes it is:

$ qemu-img create -f qed -F qed test.qed 64M
Formatting 'test.qed', fmt=qed size=67108864 backing_fmt=qed [...]

And sometimes it is not:

$ qemu-img create -f qcow2 -F qcow2 test.qcow2 64M
Formatting 'test.qcow2', fmt=qcow2 cluster_size=65536 [...]
qemu-img: test.qcow2: Backing format cannot be used without backing file

Generally, it does not make much sense, though, and users should only
give -F with -b, so document it that way, as we have already done for
qemu-img convert (commit 1899bf47375ad40555dcdff12ba49b4b8b82df38).

Reported-by: Tingting Mao <timao@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 docs/tools/qemu-img.rst | 2 +-
 qemu-img-cmds.hx        | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
index d663dd92bd..8885ea11cf 100644
--- a/docs/tools/qemu-img.rst
+++ b/docs/tools/qemu-img.rst
@@ -463,7 +463,7 @@ Command description:
   ``--skip-broken-bitmaps`` is also specified to copy only the
   consistent bitmaps.
 
-.. option:: create [--object OBJECTDEF] [-q] [-f FMT] [-b BACKING_FILE] [-F BACKING_FMT] [-u] [-o OPTIONS] FILENAME [SIZE]
+.. option:: create [--object OBJECTDEF] [-q] [-f FMT] [-b BACKING_FILE [-F BACKING_FMT]] [-u] [-o OPTIONS] FILENAME [SIZE]
 
   Create the new disk image *FILENAME* of size *SIZE* and format
   *FMT*. Depending on the file format, you can add one or more *OPTIONS*
diff --git a/qemu-img-cmds.hx b/qemu-img-cmds.hx
index 72bcdcfbfa..1b1dab5b17 100644
--- a/qemu-img-cmds.hx
+++ b/qemu-img-cmds.hx
@@ -52,9 +52,9 @@ SRST
 ERST
 
 DEF("create", img_create,
-    "create [--object objectdef] [-q] [-f fmt] [-b backing_file] [-F backing_fmt] [-u] [-o options] filename [size]")
+    "create [--object objectdef] [-q] [-f fmt] [-b backing_file [-F backing_fmt]] [-u] [-o options] filename [size]")
 SRST
-.. option:: create [--object OBJECTDEF] [-q] [-f FMT] [-b BACKING_FILE] [-F BACKING_FMT] [-u] [-o OPTIONS] FILENAME [SIZE]
+.. option:: create [--object OBJECTDEF] [-q] [-f FMT] [-b BACKING_FILE [-F BACKING_FMT]] [-u] [-o OPTIONS] FILENAME [SIZE]
 ERST
 
 DEF("dd", img_dd,
-- 
2.34.1


