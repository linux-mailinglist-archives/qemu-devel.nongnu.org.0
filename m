Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA1D1654CC
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Feb 2020 03:08:13 +0100 (CET)
Received: from localhost ([::1]:34840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4bG7-0005bo-Q5
	for lists+qemu-devel@lfdr.de; Wed, 19 Feb 2020 21:08:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34102)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1j4bFB-0004iq-2U
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 21:07:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1j4bFA-0005rh-0m
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 21:07:13 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:21574
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>) id 1j4bF9-0005rN-Tk
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 21:07:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582164431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L+lRGdGA4lfG2QdFIQAyFXXwbsou9E3B5awlAohHFiI=;
 b=BJClvYj83FPQye3NE0DGcIF/ovTXbD1it4CuW4tdFmv6BScdBR/rVo4ufdlbKgqvRItwbw
 Zqn0PxePa/VdrmEI9muMHydtvDexxULD45wP/H8SQDbIJjofdxX5gZgysHmBnWYLYH2At8
 rRIhb+lqveYyGD8lYDdokMZqTZJTsPA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-IzJuGfgjNv2LgfmBPQ33FA-1; Wed, 19 Feb 2020 21:07:07 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80748189F760;
 Thu, 20 Feb 2020 02:07:06 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-120-89.rdu2.redhat.com
 [10.10.120.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B620719C4F;
 Thu, 20 Feb 2020 02:07:04 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 3/3] Acceptance tests: add make targets to download images
Date: Wed, 19 Feb 2020 21:06:52 -0500
Message-Id: <20200220020652.16276-4-crosa@redhat.com>
In-Reply-To: <20200220020652.16276-1-crosa@redhat.com>
References: <20200220020652.16276-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: IzJuGfgjNv2LgfmBPQ33FA-1
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
Cc: Fam Zheng <fam@euphon.net>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The newly introduced "boot linux" tests make use of Linux images that
are larger than usual, and fall into what Avocado calls "vmimages",
and can be referred to by name, version and architecture.

The images can be downloaded automatically during the test. But, to
make for more reliable test results, this introduces a target that
will download the vmimages for the architectures that have been
configured and are available for the currently used distro (Fedora
31).

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/Makefile.include | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 2f1cafed72..3fc6e4f2cc 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -20,6 +20,8 @@ check-help:
 =09@echo " $(MAKE) check-venv           Creates a Python venv for tests"
 =09@echo " $(MAKE) check-clean          Clean the tests and related data"
 =09@echo
+=09@echo " $(MAKE) get-vm-images        Downloads all images used by accep=
tance tests, according to configured targets (~350 MB each, 1.5 GB max)"
+=09@echo
 =09@echo
 =09@echo "The variable SPEED can be set to control the gtester speed setti=
ng."
 =09@echo "Default options are -k and (for $(MAKE) V=3D1) --verbose; they c=
an be"
@@ -886,7 +888,20 @@ $(TESTS_RESULTS_DIR):
=20
 check-venv: $(TESTS_VENV_DIR)
=20
-check-acceptance: check-venv $(TESTS_RESULTS_DIR)
+FEDORA_31_ARCHES_CANDIDATES=3D$(patsubst ppc64,ppc64le,$(TARGETS))
+FEDORA_31_ARCHES :=3D x86_64 aarch64 ppc64le s390x
+FEDORA_31_DOWNLOAD=3D$(filter $(FEDORA_31_ARCHES),$(FEDORA_31_ARCHES_CANDI=
DATES))
+
+# download one specific Fedora 31 image
+get-vm-image-fedora-31-%: $(check-venv)
+=09$(call quiet-command, \
+             $(TESTS_VENV_DIR)/bin/python -m avocado vmimage get \
+             --distro=3Dfedora --distro-version=3D31 --arch=3D$*)
+
+# download all vm images, according to defined targets
+get-vm-images: $(check-venv) $(patsubst %,get-vm-image-fedora-31-%, $(FEDO=
RA_31_DOWNLOAD))
+
+check-acceptance: check-venv $(TESTS_RESULTS_DIR) get-vm-images
 =09$(call quiet-command, \
             $(TESTS_VENV_DIR)/bin/python -m avocado \
             --show=3D$(AVOCADO_SHOW) run --job-results-dir=3D$(TESTS_RESUL=
TS_DIR) \
@@ -897,7 +912,7 @@ check-acceptance: check-venv $(TESTS_RESULTS_DIR)
=20
 # Consolidated targets
=20
-.PHONY: check-block check-qapi-schema check-qtest check-unit check check-c=
lean
+.PHONY: check-block check-qapi-schema check-qtest check-unit check check-c=
lean get-vm-images
 check-qapi-schema: check-tests/qapi-schema/frontend check-tests/qapi-schem=
a/doc-good.texi
 check-qtest: $(patsubst %,check-qtest-%, $(QTEST_TARGETS))
 ifeq ($(CONFIG_TOOLS),y)
--=20
2.21.1


