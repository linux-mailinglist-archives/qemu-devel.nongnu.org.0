Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E7414D277
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jan 2020 22:27:37 +0100 (CET)
Received: from localhost ([::1]:51546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwus4-00017B-H0
	for lists+qemu-devel@lfdr.de; Wed, 29 Jan 2020 16:27:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59385)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iwuor-0004iz-HJ
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 16:24:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iwuoq-00006q-Bx
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 16:24:17 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:24991
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iwuoq-000065-8a
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 16:24:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580333055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Cvp/dJALwsoKPBLU0n7owo2QPAvy58Th+do1knti0M=;
 b=R5o2ndmJD5p5+K7pnzVYkxmYAMFsQ8x51/qVDBBuGMeinySVnnLboK2L8FCGt6tYJp6Quu
 OBvBU7xWMMwFA9KWghYh5i9NMBOQAZq9T4Zsuw1qgb9sn3jl2kMfBtd67qtwkf7Pl77Cda
 BAHQ8OCBU+VLBGvZSYrCwU7Y7BfPhGg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-cSZJKJhzMNm5KLkZoKYgvg-1; Wed, 29 Jan 2020 16:24:14 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17E5C1005510;
 Wed, 29 Jan 2020 21:24:13 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-184.brq.redhat.com [10.40.205.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2AB4260BF3;
 Wed, 29 Jan 2020 21:24:04 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Denis Plotnikov <dplotnikov@virtuozzo.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 05/29] tests/acceptance: Restrict X86CPUModelAliases test
 to QEMU >= 4.1
Date: Wed, 29 Jan 2020 22:23:21 +0100
Message-Id: <20200129212345.20547-6-philmd@redhat.com>
In-Reply-To: <20200129212345.20547-1-philmd@redhat.com>
References: <20200129212345.20547-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: cSZJKJhzMNm5KLkZoKYgvg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Cc: Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 'alias-of' option has been introduced with QEMU 4.1 (see
commit 7d753f61544). By using the 'version-min' Avocado tag
we can restrict this test to versions >=3D 4.1.

This fixes when running the test with a older QEMU:

  tests/acceptance/x86_cpu_model_versions.py:X86CPUModelAliases.test_none_a=
lias:  ERROR: 'alias-of' (0.45 s)

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 tests/acceptance/x86_cpu_model_versions.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/acceptance/x86_cpu_model_versions.py b/tests/acceptance/=
x86_cpu_model_versions.py
index 90558d9a71..e7604bab7c 100644
--- a/tests/acceptance/x86_cpu_model_versions.py
+++ b/tests/acceptance/x86_cpu_model_versions.py
@@ -30,6 +30,7 @@ class X86CPUModelAliases(avocado_qemu.Test):
     Validation of PC CPU model versions and CPU model aliases
=20
     :avocado: tags=3Darch:x86_64
+    :avocado: tags=3Dversion-min:4.1
     """
     def validate_aliases(self, cpus):
         for c in cpus.values():
--=20
2.21.1


