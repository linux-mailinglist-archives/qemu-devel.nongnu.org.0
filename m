Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF1E154CF3
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 21:27:05 +0100 (CET)
Received: from localhost ([::1]:45602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iznjr-0007av-OD
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 15:27:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45026)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iznix-0007Ai-B3
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 15:26:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iznis-0003kl-US
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 15:26:04 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:39998
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iznis-0003eT-IT
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 15:26:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581020757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=v1NjRpggDMX4lNDE1PBN0wECRamOWRc1OHPdedxUNkY=;
 b=Zbht0eEcQseKGdZV1cqgfRerKL3SABiCou7rSZVzYC2qWAsViVqFK2Rys9Mv8hZmp6J/r+
 3n/0VNSJmRYdsEnxkF9vugn49/NUclRvrBUPjw4Fsf+Y8Ll9FmqV00AwsVl6ou6oBhsQ6R
 LRCrY6O4dPW6pJlPpojBA/rKaxUIcXw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-HVqbcYQKNnOh6xzyKau95g-1; Thu, 06 Feb 2020 15:25:55 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1362A8018B7;
 Thu,  6 Feb 2020 20:25:54 +0000 (UTC)
Received: from thuth.com (ovpn-116-68.ams2.redhat.com [10.36.116.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C5FC061069;
 Thu,  6 Feb 2020 20:25:46 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH] travis.yml: Test the s390-ccw build, too
Date: Thu,  6 Feb 2020 21:25:43 +0100
Message-Id: <20200206202543.7085-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: HVqbcYQKNnOh6xzyKau95g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since we can now use a s390x host on Travis, we can also build and
test the s390-ccw bios images there. For this we have to make sure
that roms/SLOF is checked out, too, and then move the generated *.img
files to the right location before running the tests.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .travis.yml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/.travis.yml b/.travis.yml
index 6c0ec6cf69..c0eeff9caa 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -508,6 +508,16 @@ matrix:
       env:
         - TEST_CMD=3D"make check check-tcg V=3D1"
         - CONFIG=3D"--disable-containers --target-list=3D${MAIN_SOFTMMU_TA=
RGETS},s390x-linux-user"
+      script:
+        - ( cd ${SRC_DIR} ; git submodule update --init roms/SLOF )
+        - BUILD_RC=3D0 && make -j${JOBS} || BUILD_RC=3D$?
+        - |
+          if [ "$BUILD_RC" -eq 0 ] ; then
+              mv pc-bios/s390-ccw/*.img pc-bios/ ;
+              ${TEST_CMD} ;
+          else
+              $(exit $BUILD_RC);
+          fi
=20
     # Release builds
     # The make-release script expect a QEMU version, so our tag must start=
 with a 'v'.
--=20
2.18.1


