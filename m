Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 820AC11D683
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Dec 2019 20:00:28 +0100 (CET)
Received: from localhost ([::1]:36288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifThL-0007m3-71
	for lists+qemu-devel@lfdr.de; Thu, 12 Dec 2019 14:00:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48687)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1ifTc5-0002ly-KE
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 13:55:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1ifTc4-0000Jq-Go
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 13:55:01 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:28154
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1ifTc4-0000J4-BU
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 13:55:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576176899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZAwffZkNPLokqTuFCAgkcN6DNnGsl5ORUvhYAh0aDdI=;
 b=dl6qalBE8qoGR3lxj3F+/Jl3KljN+jo5SbxLRc4a/I0/o3RZA87hHGZzCM53oxfhYdlfez
 Qd+fHdxik8J5AFvHUAHpcQC8BFtXlMia4AVFH8zkAJOgzkE4O4vG2zuPT3Ry4LXktVSICI
 CeCaHm8Ln3RjBrpGlgUUC3w/mCk5/ss=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314--zK7kxDBMe2Hmd3GOoiDnA-1; Thu, 12 Dec 2019 13:54:56 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 680FA8017DF;
 Thu, 12 Dec 2019 18:54:55 +0000 (UTC)
Received: from thuth.com (ovpn-116-168.ams2.redhat.com [10.36.116.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6FDBC19C4F;
 Thu, 12 Dec 2019 18:54:49 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 09/10] tests/Makefile: Fix check-report.* targets shown in
 check-help
Date: Thu, 12 Dec 2019 19:54:23 +0100
Message-Id: <20191212185424.4675-10-thuth@redhat.com>
In-Reply-To: <20191212185424.4675-1-thuth@redhat.com>
References: <20191212185424.4675-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: -zK7kxDBMe2Hmd3GOoiDnA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wainer dos Santos Moschetta <wainersm@redhat.com>

The check-report.html and check-report.xml targets were replaced
with check-report.tap in commit 9df43317b82 but the check-help
text was not updated so it still lists check-report.html.

Fixes: 9df43317b82
Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20191211204427.4681-2-wainersm@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/Makefile.include | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 8566f5f119..680bd8a669 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -16,12 +16,10 @@ check-help:
 =09@echo " $(MAKE) check-softfloat      Run FPU emulation tests"
 =09@echo " $(MAKE) check-acceptance     Run all acceptance (functional) te=
sts"
 =09@echo
-=09@echo " $(MAKE) check-report.html    Generates an HTML test report"
+=09@echo " $(MAKE) check-report.tap     Generates an aggregated TAP test r=
eport"
 =09@echo " $(MAKE) check-venv           Creates a Python venv for tests"
 =09@echo " $(MAKE) check-clean          Clean the tests and related data"
 =09@echo
-=09@echo "Please note that HTML reports do not regenerate if the unit test=
s"
-=09@echo "have not changed."
 =09@echo
 =09@echo "The variable SPEED can be set to control the gtester speed setti=
ng."
 =09@echo "Default options are -k and (for $(MAKE) V=3D1) --verbose; they c=
an be"
--=20
2.18.1


