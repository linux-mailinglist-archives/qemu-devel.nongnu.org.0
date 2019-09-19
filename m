Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7B0B781C
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Sep 2019 13:02:53 +0200 (CEST)
Received: from localhost ([::1]:42412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAuD6-0003WE-PI
	for lists+qemu-devel@lfdr.de; Thu, 19 Sep 2019 07:02:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56693)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iAuA8-0001xN-Lj
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 06:59:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iAuA7-0005Qg-Q7
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 06:59:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48274)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iAuA7-0005QI-LB
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 06:59:47 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E3F9C3175295;
 Thu, 19 Sep 2019 10:59:46 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-74.brq.redhat.com [10.40.204.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 55095608A5;
 Thu, 19 Sep 2019 10:59:44 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 19 Sep 2019 12:59:31 +0200
Message-Id: <20190919105932.19412-3-philmd@redhat.com>
In-Reply-To: <20190919105932.19412-1-philmd@redhat.com>
References: <20190919105932.19412-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Thu, 19 Sep 2019 10:59:47 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 2/2] .shippable.yml: Build WHPX enabled binaries
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
Cc: Fam Zheng <fam@euphon.net>, Lucian Petrut <lpetrut@cloudbasesolutions.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Justin Terry <juterry@microsoft.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Ilias Maratos <i.maratos@gmail.com>
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


