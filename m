Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BAE12240C
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Dec 2019 06:50:37 +0100 (CET)
Received: from localhost ([::1]:36188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ih5kh-00016q-TH
	for lists+qemu-devel@lfdr.de; Tue, 17 Dec 2019 00:50:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52761)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1ih5EE-0004fz-Ly
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 00:17:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1ih5ED-0004NV-MH
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 00:17:02 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44456
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>) id 1ih5ED-0004NL-IB
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 00:17:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576559821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4qq4jTy9B7rJaMCrbWTWfG84h4ysQyyseP8ZANiJzoQ=;
 b=iRejAdWYTEWmV73TMsHrRwGW3QVbYrOruw0pGB/UqUmnYLiuJOFOqaa1S7ya4zoqrD6PL5
 MO0T7ZVc+qQSaEH/UvsG2LOqB5+s0hhXmhbGF8H6LHgBMBq+skf6OMOQEgAlxDEQ/SXkef
 YugadPXDNmLXCHX3EoOJV6NjJYjxAuc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-wEkOI788MXGneOCTt-wEHA-1; Tue, 17 Dec 2019 00:16:59 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97FEB8017DF;
 Tue, 17 Dec 2019 05:16:57 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-6.gru2.redhat.com
 [10.97.116.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4735E19C4F;
 Tue, 17 Dec 2019 05:16:49 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 15/15] python/qemu: Remove unneeded imports in __init__
Date: Tue, 17 Dec 2019 00:15:21 -0500
Message-Id: <20191217051521.1239-16-crosa@redhat.com>
In-Reply-To: <20191217051521.1239-1-crosa@redhat.com>
References: <20191217051521.1239-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: wEkOI788MXGneOCTt-wEHA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Fam Zheng <fam@euphon.net>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-ppc@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wainer dos Santos Moschetta <wainersm@redhat.com>

__init_.py import some sub-modules unnecessarily. So let's
clean it up.

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Suggested-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>
Message-Id: <20191216191438.93418-6-wainersm@redhat.com>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 python/qemu/__init__.py | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/python/qemu/__init__.py b/python/qemu/__init__.py
index eff17a306e..4ca06c34a4 100644
--- a/python/qemu/__init__.py
+++ b/python/qemu/__init__.py
@@ -9,9 +9,3 @@
 # This work is licensed under the terms of the GNU GPL, version 2.  See
 # the COPYING file in the top-level directory.
 #
-# Based on qmp.py.
-#
-
-from . import qmp
-from . import machine
-from . import accel
--=20
2.21.0


