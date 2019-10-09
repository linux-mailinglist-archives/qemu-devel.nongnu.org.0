Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37519D1972
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Oct 2019 22:13:09 +0200 (CEST)
Received: from localhost ([::1]:56650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIIKa-0003jd-5Y
	for lists+qemu-devel@lfdr.de; Wed, 09 Oct 2019 16:13:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59487)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iIFQj-0002FP-Ag
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 13:07:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iIFQh-0004Aq-92
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 13:07:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33022)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iIFQh-00049c-3Z
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 13:07:15 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5A996309B689;
 Wed,  9 Oct 2019 17:07:14 +0000 (UTC)
Received: from thuth.com (ovpn-116-38.ams2.redhat.com [10.36.116.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A7C7860167;
 Wed,  9 Oct 2019 17:07:11 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 2/5] travis.yml: Use libsdl2 instead of libsdl1.2,
 and install libsdl2-image
Date: Wed,  9 Oct 2019 19:06:58 +0200
Message-Id: <20191009170701.14756-3-thuth@redhat.com>
In-Reply-To: <20191009170701.14756-1-thuth@redhat.com>
References: <20191009170701.14756-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Wed, 09 Oct 2019 17:07:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We've removed support for SDL 1.2 quite a while ago already, so let's
use SDL 2 now in Travis to get test coverage for SDL again.
And while we're at it, also add libsdl2-image-dev which can be used
by QEMU nowadays, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .travis.yml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index 63328387f6..e21b9ad666 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -39,7 +39,8 @@ addons:
       - libpixman-1-dev
       - libpng12-dev
       - librados-dev
-      - libsdl1.2-dev
+      - libsdl2-dev
+      - libsdl2-image-dev
       - libseccomp-dev
       - libspice-protocol-dev
       - libspice-server-dev
@@ -308,7 +309,8 @@ matrix:
             - libpixman-1-dev
             - libpng12-dev
             - librados-dev
-            - libsdl1.2-dev
+            - libsdl2-dev
+            - libsdl2-image-dev
             - libseccomp-dev
             - libspice-protocol-dev
             - libspice-server-dev
-- 
2.18.1


