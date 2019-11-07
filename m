Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3C0F34FF
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Nov 2019 17:51:35 +0100 (CET)
Received: from localhost ([::1]:45476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSl0Q-0002hv-7i
	for lists+qemu-devel@lfdr.de; Thu, 07 Nov 2019 11:51:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42870)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iSknG-0003aJ-VW
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 11:38:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iSknF-0005qd-Tu
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 11:37:58 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:56073
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1iSknF-0005qS-QV
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 11:37:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573144677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R2Tj1dDCQs/moFJiJxP91nwe0DdILLqQy85RelomtDU=;
 b=YKhGgdKpgd2CNr+hwPF7nTztRnQZh7XpOLj0IyF0mYXtTJWUke7isSk5XqJzd+df/HJ8yf
 5ogzZ9YOtQw5o+x95jXENAhibBWJwa3iT8FULASfNFWhNu7TQBHA8jR+1At1yoP1KPjwnd
 vN91vqt4ADMDYViB7d5XNvKq4P5EQjY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-wLY_cLPFNJKSCzNgDJNA0Q-1; Thu, 07 Nov 2019 11:37:55 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D3E0107ACC3;
 Thu,  7 Nov 2019 16:37:53 +0000 (UTC)
Received: from localhost (ovpn-117-149.ams2.redhat.com [10.36.117.149])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EEB3960BFB;
 Thu,  7 Nov 2019 16:37:52 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 20/22] iotests: Make 198 work with data_file
Date: Thu,  7 Nov 2019 17:37:06 +0100
Message-Id: <20191107163708.833192-21-mreitz@redhat.com>
In-Reply-To: <20191107163708.833192-1-mreitz@redhat.com>
References: <20191107163708.833192-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: wLY_cLPFNJKSCzNgDJNA0Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
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
Cc: Kevin Wolf <kwolf@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We do not care about the json:{} filenames here, so we can just filter
them out and thus make the test work both with and without external data
files.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 tests/qemu-iotests/198     | 6 ++++--
 tests/qemu-iotests/198.out | 4 ++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/tests/qemu-iotests/198 b/tests/qemu-iotests/198
index c8f824cfae..fb0d5a29d3 100755
--- a/tests/qemu-iotests/198
+++ b/tests/qemu-iotests/198
@@ -92,13 +92,15 @@ echo
 echo "=3D=3D checking image base =3D=3D"
 $QEMU_IMG info --image-opts $IMGSPECBASE | _filter_img_info --format-speci=
fic \
     | sed -e "/^disk size:/ D" -e '/refcount bits:/ D' -e '/compat:/ D' \
-          -e '/lazy refcounts:/ D' -e '/corrupt:/ D'
+          -e '/lazy refcounts:/ D' -e '/corrupt:/ D' -e '/^\s*data file/ D=
' \
+    | _filter_json_filename
=20
 echo
 echo "=3D=3D checking image layer =3D=3D"
 $QEMU_IMG info --image-opts $IMGSPECLAYER | _filter_img_info --format-spec=
ific \
     | sed -e "/^disk size:/ D" -e '/refcount bits:/ D' -e '/compat:/ D' \
-          -e '/lazy refcounts:/ D' -e '/corrupt:/ D'
+          -e '/lazy refcounts:/ D' -e '/corrupt:/ D' -e '/^\s*data file/ D=
' \
+    | _filter_json_filename
=20
=20
 # success, all done
diff --git a/tests/qemu-iotests/198.out b/tests/qemu-iotests/198.out
index e86b175e39..831ce3a289 100644
--- a/tests/qemu-iotests/198.out
+++ b/tests/qemu-iotests/198.out
@@ -32,7 +32,7 @@ read 16777216/16777216 bytes at offset 0
 16 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
=20
 =3D=3D checking image base =3D=3D
-image: json:{"encrypt.key-secret": "sec0", "driver": "IMGFMT", "file": {"d=
river": "file", "filename": "TEST_DIR/t.IMGFMT.base"}}
+image: json:{ /* filtered */ }
 file format: IMGFMT
 virtual size: 16 MiB (16777216 bytes)
 Format specific information:
@@ -74,7 +74,7 @@ Format specific information:
         master key iters: 1024
=20
 =3D=3D checking image layer =3D=3D
-image: json:{"encrypt.key-secret": "sec1", "driver": "IMGFMT", "file": {"d=
river": "file", "filename": "TEST_DIR/t.IMGFMT"}}
+image: json:{ /* filtered */ }
 file format: IMGFMT
 virtual size: 16 MiB (16777216 bytes)
 backing file: TEST_DIR/t.IMGFMT.base
--=20
2.23.0


