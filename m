Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DD61376BF
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jan 2020 20:14:18 +0100 (CET)
Received: from localhost ([::1]:50769 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipzjd-0003FJ-Bg
	for lists+qemu-devel@lfdr.de; Fri, 10 Jan 2020 14:14:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37580)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wainersm@redhat.com>) id 1ipziU-0002Fb-6X
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 14:13:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <wainersm@redhat.com>) id 1ipziS-0008TI-MR
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 14:13:05 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42105
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <wainersm@redhat.com>) id 1ipziS-0008O9-Ha
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 14:13:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578683583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mz8u3t8zcvM8xrXWktjw6fkAD+5E9OF4gE6ZbfpZAs0=;
 b=hhVfLyn71c3KvORWbRCNCbnlMSQEsFwgMrd/slYwHk8h+97BDvnl9yo1Y3OclFym2DuSBw
 UD8e7xjH5iIc2ds0dWh/FOLHWkkDNYEc0KoTITnkX5BP+VMHb3GF1duk7vXUKCMN4A8jZT
 SCsNR/a4jck6XA2aKOcwciuWkHvhNL0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-Iahj6Dg1OJSzxgjvD90_Tw-1; Fri, 10 Jan 2020 14:13:02 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54A7E1005502;
 Fri, 10 Jan 2020 19:13:01 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-73.gru2.redhat.com
 [10.97.116.73])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B01980623;
 Fri, 10 Jan 2020 19:12:59 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] travis.yml: Install genisoimage package
Date: Fri, 10 Jan 2020 16:12:54 -0300
Message-Id: <20200110191254.11303-2-wainersm@redhat.com>
In-Reply-To: <20200110191254.11303-1-wainersm@redhat.com>
References: <20200110191254.11303-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: Iahj6Dg1OJSzxgjvD90_Tw-1
X-Mimecast-Spam-Score: 0
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
Cc: fam@euphon.net, alex.bennee@linaro.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The genisoimage program is required for tests/cdrom-test
tests, otherwise they are skipped. The current Travis
environments do not provide it by default, so let's
explicitly require the genisoimage package.

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
---
 .travis.yml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/.travis.yml b/.travis.yml
index 6c1038a0f1..131c920255 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -51,6 +51,8 @@ addons:
       - sparse
       - uuid-dev
       - gcovr
+      # Tests dependencies
+      - genisoimage
=20
=20
 # The channel name "irc.oftc.net#qemu" is encrypted against qemu/qemu
@@ -383,6 +385,8 @@ matrix:
           - libusb-1.0-0-dev
           - libvdeplug-dev
           - libvte-2.91-dev
+          # Tests dependencies
+          - genisoimage
       env:
         - TEST_CMD=3D"make check check-tcg V=3D1"
         - CONFIG=3D"--disable-containers --target-list=3D${MAIN_SOFTMMU_TA=
RGETS}"
@@ -412,6 +416,8 @@ matrix:
           - libusb-1.0-0-dev
           - libvdeplug-dev
           - libvte-2.91-dev
+          # Tests dependencies
+          - genisoimage
       env:
         - TEST_CMD=3D"make check check-tcg V=3D1"
         - CONFIG=3D"--disable-containers --target-list=3D${MAIN_SOFTMMU_TA=
RGETS},ppc64le-linux-user"
@@ -441,6 +447,8 @@ matrix:
           - libusb-1.0-0-dev
           - libvdeplug-dev
           - libvte-2.91-dev
+          # Tests dependencies
+          - genisoimage
       env:
         - TEST_CMD=3D"make check check-tcg V=3D1"
         - CONFIG=3D"--disable-containers --target-list=3D${MAIN_SOFTMMU_TA=
RGETS},s390x-linux-user"
--=20
2.23.0


