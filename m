Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64526B8F0D
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Sep 2019 13:37:16 +0200 (CEST)
Received: from localhost ([::1]:57984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iBHDv-00080o-Eq
	for lists+qemu-devel@lfdr.de; Fri, 20 Sep 2019 07:37:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38053)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iBHAi-0004sS-Kz
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 07:33:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iBHAg-0001Dt-L8
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 07:33:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57836)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iBHAe-0001CX-LZ
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 07:33:54 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 834F510C093B;
 Fri, 20 Sep 2019 11:33:51 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 018A4100EBA3;
 Fri, 20 Sep 2019 11:33:47 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Justin Terry <juterry@microsoft.com>
Subject: [PATCH v2 3/3] .shippable.yml: Build WHPX enabled binaries
Date: Fri, 20 Sep 2019 13:33:29 +0200
Message-Id: <20190920113329.16787-4-philmd@redhat.com>
In-Reply-To: <20190920113329.16787-1-philmd@redhat.com>
References: <20190920113329.16787-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.66]); Fri, 20 Sep 2019 11:33:51 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Weil <sw@weilnetz.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 .shippable.yml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.shippable.yml b/.shippable.yml
index bbc6f88510..01b33bd034 100644
--- a/.shippable.yml
+++ b/.shippable.yml
@@ -25,6 +25,8 @@ env:
       TARGET_LIST=3Dmips64el-softmmu,mips64el-linux-user
     - IMAGE=3Ddebian-ppc64el-cross
       TARGET_LIST=3Dppc64-softmmu,ppc64-linux-user,ppc64abi32-linux-user
+    - IMAGE=3Dfedora-win10sdk-cross
+      TARGET_LIST=3Dx86_64-softmmu,i386-softmmu
 build:
   pre_ci:
     # usually host ARCH is set by configure
--=20
2.20.1


