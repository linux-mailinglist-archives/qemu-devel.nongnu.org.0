Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9524F628BD
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jul 2019 20:50:43 +0200 (CEST)
Received: from localhost ([::1]:43942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkYio-0008Ex-Qn
	for lists+qemu-devel@lfdr.de; Mon, 08 Jul 2019 14:50:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54824)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eblake@redhat.com>) id 1hkYgo-0007I8-HW
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 14:48:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1hkYgZ-0000cz-8s
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 14:48:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47782)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1hkYgC-0008G6-PP; Mon, 08 Jul 2019 14:48:00 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DBAA530BD1B4;
 Mon,  8 Jul 2019 18:47:06 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-78.phx2.redhat.com [10.3.116.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4AF625C219;
 Mon,  8 Jul 2019 18:47:06 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  8 Jul 2019 13:47:03 -0500
Message-Id: <20190708184703.19251-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Mon, 08 Jul 2019 18:47:06 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH for-4.1] iotests: Update 082 expected output
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
Cc: kwolf@redhat.com, "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A recent tweak to the '-o help' output for qemu-img needs to be
reflected into the iotests expected outputs.

Fixes: f7077c98
Reported-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---

'git grep -l "0.10 or 1.1" tests' confirms this was the only
output file affected

 tests/qemu-iotests/082.out | 54 +++++++++++++++++++-------------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/tests/qemu-iotests/082.out b/tests/qemu-iotests/082.out
index 58de358b38f3..9d4ed4dc9d61 100644
--- a/tests/qemu-iotests/082.out
+++ b/tests/qemu-iotests/082.out
@@ -47,7 +47,7 @@ Supported options:
   backing_file=3D<str>     - File name of a base image
   backing_fmt=3D<str>      - Image format of the base image
   cluster_size=3D<size>    - qcow2 cluster size
-  compat=3D<str>           - Compatibility level (0.10 or 1.1)
+  compat=3D<str>           - Compatibility level (v2 [0.10] or v3 [1.1])
   data_file=3D<str>        - File name of an external data file
   data_file_raw=3D<bool (on/off)> - The external data file must stay val=
id as a raw image
   encrypt.cipher-alg=3D<str> - Name of encryption cipher algorithm
@@ -70,7 +70,7 @@ Supported options:
   backing_file=3D<str>     - File name of a base image
   backing_fmt=3D<str>      - Image format of the base image
   cluster_size=3D<size>    - qcow2 cluster size
-  compat=3D<str>           - Compatibility level (0.10 or 1.1)
+  compat=3D<str>           - Compatibility level (v2 [0.10] or v3 [1.1])
   data_file=3D<str>        - File name of an external data file
   data_file_raw=3D<bool (on/off)> - The external data file must stay val=
id as a raw image
   encrypt.cipher-alg=3D<str> - Name of encryption cipher algorithm
@@ -93,7 +93,7 @@ Supported options:
   backing_file=3D<str>     - File name of a base image
   backing_fmt=3D<str>      - Image format of the base image
   cluster_size=3D<size>    - qcow2 cluster size
-  compat=3D<str>           - Compatibility level (0.10 or 1.1)
+  compat=3D<str>           - Compatibility level (v2 [0.10] or v3 [1.1])
   data_file=3D<str>        - File name of an external data file
   data_file_raw=3D<bool (on/off)> - The external data file must stay val=
id as a raw image
   encrypt.cipher-alg=3D<str> - Name of encryption cipher algorithm
@@ -116,7 +116,7 @@ Supported options:
   backing_file=3D<str>     - File name of a base image
   backing_fmt=3D<str>      - Image format of the base image
   cluster_size=3D<size>    - qcow2 cluster size
-  compat=3D<str>           - Compatibility level (0.10 or 1.1)
+  compat=3D<str>           - Compatibility level (v2 [0.10] or v3 [1.1])
   data_file=3D<str>        - File name of an external data file
   data_file_raw=3D<bool (on/off)> - The external data file must stay val=
id as a raw image
   encrypt.cipher-alg=3D<str> - Name of encryption cipher algorithm
@@ -139,7 +139,7 @@ Supported options:
   backing_file=3D<str>     - File name of a base image
   backing_fmt=3D<str>      - Image format of the base image
   cluster_size=3D<size>    - qcow2 cluster size
-  compat=3D<str>           - Compatibility level (0.10 or 1.1)
+  compat=3D<str>           - Compatibility level (v2 [0.10] or v3 [1.1])
   data_file=3D<str>        - File name of an external data file
   data_file_raw=3D<bool (on/off)> - The external data file must stay val=
id as a raw image
   encrypt.cipher-alg=3D<str> - Name of encryption cipher algorithm
@@ -162,7 +162,7 @@ Supported options:
   backing_file=3D<str>     - File name of a base image
   backing_fmt=3D<str>      - Image format of the base image
   cluster_size=3D<size>    - qcow2 cluster size
-  compat=3D<str>           - Compatibility level (0.10 or 1.1)
+  compat=3D<str>           - Compatibility level (v2 [0.10] or v3 [1.1])
   data_file=3D<str>        - File name of an external data file
   data_file_raw=3D<bool (on/off)> - The external data file must stay val=
id as a raw image
   encrypt.cipher-alg=3D<str> - Name of encryption cipher algorithm
@@ -185,7 +185,7 @@ Supported options:
   backing_file=3D<str>     - File name of a base image
   backing_fmt=3D<str>      - Image format of the base image
   cluster_size=3D<size>    - qcow2 cluster size
-  compat=3D<str>           - Compatibility level (0.10 or 1.1)
+  compat=3D<str>           - Compatibility level (v2 [0.10] or v3 [1.1])
   data_file=3D<str>        - File name of an external data file
   data_file_raw=3D<bool (on/off)> - The external data file must stay val=
id as a raw image
   encrypt.cipher-alg=3D<str> - Name of encryption cipher algorithm
@@ -208,7 +208,7 @@ Supported options:
   backing_file=3D<str>     - File name of a base image
   backing_fmt=3D<str>      - Image format of the base image
   cluster_size=3D<size>    - qcow2 cluster size
-  compat=3D<str>           - Compatibility level (0.10 or 1.1)
+  compat=3D<str>           - Compatibility level (v2 [0.10] or v3 [1.1])
   data_file=3D<str>        - File name of an external data file
   data_file_raw=3D<bool (on/off)> - The external data file must stay val=
id as a raw image
   encrypt.cipher-alg=3D<str> - Name of encryption cipher algorithm
@@ -246,7 +246,7 @@ Supported qcow2 options:
   backing_file=3D<str>     - File name of a base image
   backing_fmt=3D<str>      - Image format of the base image
   cluster_size=3D<size>    - qcow2 cluster size
-  compat=3D<str>           - Compatibility level (0.10 or 1.1)
+  compat=3D<str>           - Compatibility level (v2 [0.10] or v3 [1.1])
   data_file=3D<str>        - File name of an external data file
   data_file_raw=3D<bool (on/off)> - The external data file must stay val=
id as a raw image
   encrypt.cipher-alg=3D<str> - Name of encryption cipher algorithm
@@ -327,7 +327,7 @@ Supported options:
   backing_file=3D<str>     - File name of a base image
   backing_fmt=3D<str>      - Image format of the base image
   cluster_size=3D<size>    - qcow2 cluster size
-  compat=3D<str>           - Compatibility level (0.10 or 1.1)
+  compat=3D<str>           - Compatibility level (v2 [0.10] or v3 [1.1])
   data_file=3D<str>        - File name of an external data file
   data_file_raw=3D<bool (on/off)> - The external data file must stay val=
id as a raw image
   encrypt.cipher-alg=3D<str> - Name of encryption cipher algorithm
@@ -350,7 +350,7 @@ Supported options:
   backing_file=3D<str>     - File name of a base image
   backing_fmt=3D<str>      - Image format of the base image
   cluster_size=3D<size>    - qcow2 cluster size
-  compat=3D<str>           - Compatibility level (0.10 or 1.1)
+  compat=3D<str>           - Compatibility level (v2 [0.10] or v3 [1.1])
   data_file=3D<str>        - File name of an external data file
   data_file_raw=3D<bool (on/off)> - The external data file must stay val=
id as a raw image
   encrypt.cipher-alg=3D<str> - Name of encryption cipher algorithm
@@ -373,7 +373,7 @@ Supported options:
   backing_file=3D<str>     - File name of a base image
   backing_fmt=3D<str>      - Image format of the base image
   cluster_size=3D<size>    - qcow2 cluster size
-  compat=3D<str>           - Compatibility level (0.10 or 1.1)
+  compat=3D<str>           - Compatibility level (v2 [0.10] or v3 [1.1])
   data_file=3D<str>        - File name of an external data file
   data_file_raw=3D<bool (on/off)> - The external data file must stay val=
id as a raw image
   encrypt.cipher-alg=3D<str> - Name of encryption cipher algorithm
@@ -396,7 +396,7 @@ Supported options:
   backing_file=3D<str>     - File name of a base image
   backing_fmt=3D<str>      - Image format of the base image
   cluster_size=3D<size>    - qcow2 cluster size
-  compat=3D<str>           - Compatibility level (0.10 or 1.1)
+  compat=3D<str>           - Compatibility level (v2 [0.10] or v3 [1.1])
   data_file=3D<str>        - File name of an external data file
   data_file_raw=3D<bool (on/off)> - The external data file must stay val=
id as a raw image
   encrypt.cipher-alg=3D<str> - Name of encryption cipher algorithm
@@ -419,7 +419,7 @@ Supported options:
   backing_file=3D<str>     - File name of a base image
   backing_fmt=3D<str>      - Image format of the base image
   cluster_size=3D<size>    - qcow2 cluster size
-  compat=3D<str>           - Compatibility level (0.10 or 1.1)
+  compat=3D<str>           - Compatibility level (v2 [0.10] or v3 [1.1])
   data_file=3D<str>        - File name of an external data file
   data_file_raw=3D<bool (on/off)> - The external data file must stay val=
id as a raw image
   encrypt.cipher-alg=3D<str> - Name of encryption cipher algorithm
@@ -442,7 +442,7 @@ Supported options:
   backing_file=3D<str>     - File name of a base image
   backing_fmt=3D<str>      - Image format of the base image
   cluster_size=3D<size>    - qcow2 cluster size
-  compat=3D<str>           - Compatibility level (0.10 or 1.1)
+  compat=3D<str>           - Compatibility level (v2 [0.10] or v3 [1.1])
   data_file=3D<str>        - File name of an external data file
   data_file_raw=3D<bool (on/off)> - The external data file must stay val=
id as a raw image
   encrypt.cipher-alg=3D<str> - Name of encryption cipher algorithm
@@ -465,7 +465,7 @@ Supported options:
   backing_file=3D<str>     - File name of a base image
   backing_fmt=3D<str>      - Image format of the base image
   cluster_size=3D<size>    - qcow2 cluster size
-  compat=3D<str>           - Compatibility level (0.10 or 1.1)
+  compat=3D<str>           - Compatibility level (v2 [0.10] or v3 [1.1])
   data_file=3D<str>        - File name of an external data file
   data_file_raw=3D<bool (on/off)> - The external data file must stay val=
id as a raw image
   encrypt.cipher-alg=3D<str> - Name of encryption cipher algorithm
@@ -488,7 +488,7 @@ Supported options:
   backing_file=3D<str>     - File name of a base image
   backing_fmt=3D<str>      - Image format of the base image
   cluster_size=3D<size>    - qcow2 cluster size
-  compat=3D<str>           - Compatibility level (0.10 or 1.1)
+  compat=3D<str>           - Compatibility level (v2 [0.10] or v3 [1.1])
   data_file=3D<str>        - File name of an external data file
   data_file_raw=3D<bool (on/off)> - The external data file must stay val=
id as a raw image
   encrypt.cipher-alg=3D<str> - Name of encryption cipher algorithm
@@ -526,7 +526,7 @@ Supported qcow2 options:
   backing_file=3D<str>     - File name of a base image
   backing_fmt=3D<str>      - Image format of the base image
   cluster_size=3D<size>    - qcow2 cluster size
-  compat=3D<str>           - Compatibility level (0.10 or 1.1)
+  compat=3D<str>           - Compatibility level (v2 [0.10] or v3 [1.1])
   data_file=3D<str>        - File name of an external data file
   data_file_raw=3D<bool (on/off)> - The external data file must stay val=
id as a raw image
   encrypt.cipher-alg=3D<str> - Name of encryption cipher algorithm
@@ -618,7 +618,7 @@ Creation options for 'qcow2':
   backing_file=3D<str>     - File name of a base image
   backing_fmt=3D<str>      - Image format of the base image
   cluster_size=3D<size>    - qcow2 cluster size
-  compat=3D<str>           - Compatibility level (0.10 or 1.1)
+  compat=3D<str>           - Compatibility level (v2 [0.10] or v3 [1.1])
   data_file=3D<str>        - File name of an external data file
   data_file_raw=3D<bool (on/off)> - The external data file must stay val=
id as a raw image
   encrypt.cipher-alg=3D<str> - Name of encryption cipher algorithm
@@ -642,7 +642,7 @@ Creation options for 'qcow2':
   backing_file=3D<str>     - File name of a base image
   backing_fmt=3D<str>      - Image format of the base image
   cluster_size=3D<size>    - qcow2 cluster size
-  compat=3D<str>           - Compatibility level (0.10 or 1.1)
+  compat=3D<str>           - Compatibility level (v2 [0.10] or v3 [1.1])
   data_file=3D<str>        - File name of an external data file
   data_file_raw=3D<bool (on/off)> - The external data file must stay val=
id as a raw image
   encrypt.cipher-alg=3D<str> - Name of encryption cipher algorithm
@@ -666,7 +666,7 @@ Creation options for 'qcow2':
   backing_file=3D<str>     - File name of a base image
   backing_fmt=3D<str>      - Image format of the base image
   cluster_size=3D<size>    - qcow2 cluster size
-  compat=3D<str>           - Compatibility level (0.10 or 1.1)
+  compat=3D<str>           - Compatibility level (v2 [0.10] or v3 [1.1])
   data_file=3D<str>        - File name of an external data file
   data_file_raw=3D<bool (on/off)> - The external data file must stay val=
id as a raw image
   encrypt.cipher-alg=3D<str> - Name of encryption cipher algorithm
@@ -690,7 +690,7 @@ Creation options for 'qcow2':
   backing_file=3D<str>     - File name of a base image
   backing_fmt=3D<str>      - Image format of the base image
   cluster_size=3D<size>    - qcow2 cluster size
-  compat=3D<str>           - Compatibility level (0.10 or 1.1)
+  compat=3D<str>           - Compatibility level (v2 [0.10] or v3 [1.1])
   data_file=3D<str>        - File name of an external data file
   data_file_raw=3D<bool (on/off)> - The external data file must stay val=
id as a raw image
   encrypt.cipher-alg=3D<str> - Name of encryption cipher algorithm
@@ -714,7 +714,7 @@ Creation options for 'qcow2':
   backing_file=3D<str>     - File name of a base image
   backing_fmt=3D<str>      - Image format of the base image
   cluster_size=3D<size>    - qcow2 cluster size
-  compat=3D<str>           - Compatibility level (0.10 or 1.1)
+  compat=3D<str>           - Compatibility level (v2 [0.10] or v3 [1.1])
   data_file=3D<str>        - File name of an external data file
   data_file_raw=3D<bool (on/off)> - The external data file must stay val=
id as a raw image
   encrypt.cipher-alg=3D<str> - Name of encryption cipher algorithm
@@ -738,7 +738,7 @@ Creation options for 'qcow2':
   backing_file=3D<str>     - File name of a base image
   backing_fmt=3D<str>      - Image format of the base image
   cluster_size=3D<size>    - qcow2 cluster size
-  compat=3D<str>           - Compatibility level (0.10 or 1.1)
+  compat=3D<str>           - Compatibility level (v2 [0.10] or v3 [1.1])
   data_file=3D<str>        - File name of an external data file
   data_file_raw=3D<bool (on/off)> - The external data file must stay val=
id as a raw image
   encrypt.cipher-alg=3D<str> - Name of encryption cipher algorithm
@@ -762,7 +762,7 @@ Creation options for 'qcow2':
   backing_file=3D<str>     - File name of a base image
   backing_fmt=3D<str>      - Image format of the base image
   cluster_size=3D<size>    - qcow2 cluster size
-  compat=3D<str>           - Compatibility level (0.10 or 1.1)
+  compat=3D<str>           - Compatibility level (v2 [0.10] or v3 [1.1])
   data_file=3D<str>        - File name of an external data file
   data_file_raw=3D<bool (on/off)> - The external data file must stay val=
id as a raw image
   encrypt.cipher-alg=3D<str> - Name of encryption cipher algorithm
@@ -786,7 +786,7 @@ Creation options for 'qcow2':
   backing_file=3D<str>     - File name of a base image
   backing_fmt=3D<str>      - Image format of the base image
   cluster_size=3D<size>    - qcow2 cluster size
-  compat=3D<str>           - Compatibility level (0.10 or 1.1)
+  compat=3D<str>           - Compatibility level (v2 [0.10] or v3 [1.1])
   data_file=3D<str>        - File name of an external data file
   data_file_raw=3D<bool (on/off)> - The external data file must stay val=
id as a raw image
   encrypt.cipher-alg=3D<str> - Name of encryption cipher algorithm
@@ -827,7 +827,7 @@ Creation options for 'qcow2':
   backing_file=3D<str>     - File name of a base image
   backing_fmt=3D<str>      - Image format of the base image
   cluster_size=3D<size>    - qcow2 cluster size
-  compat=3D<str>           - Compatibility level (0.10 or 1.1)
+  compat=3D<str>           - Compatibility level (v2 [0.10] or v3 [1.1])
   data_file=3D<str>        - File name of an external data file
   data_file_raw=3D<bool (on/off)> - The external data file must stay val=
id as a raw image
   encrypt.cipher-alg=3D<str> - Name of encryption cipher algorithm
--=20
2.20.1


