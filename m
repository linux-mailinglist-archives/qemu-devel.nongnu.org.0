Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A24374C50B6
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 22:28:16 +0100 (CET)
Received: from localhost ([::1]:56958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNi8N-0003Zn-Mo
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 16:28:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1nNhka-000781-Sx
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 16:03:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1nNhkX-0005SY-5I
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 16:03:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645823016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pab33bVOuXSFeRJwLzNTvMzu0uHABihopxaPUGjTWBg=;
 b=HOp0QtKRZaUFOdGy9nZYv39gJx9fEbCO+yz2rVUhVjKNu1+Cw5XePCXNcSCvfaLHqkSrgg
 nYGA5iqE/cOxTTcfMrREas0iHhieBpLN0FuXni81uNYQm2L+vIEuPSG9rU+zxRzjE2Wu9/
 Y+Op0u5euGaHKOfycKv9Gm8w7gXlIUI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-527-Fp9uRNVmN1adrKrF6jR4Pw-1; Fri, 25 Feb 2022 16:03:34 -0500
X-MC-Unique: Fp9uRNVmN1adrKrF6jR4Pw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B56AB1006AA5;
 Fri, 25 Feb 2022 21:03:30 +0000 (UTC)
Received: from p50.localhost.localdomain.com (unknown [10.22.16.50])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F8702ED79;
 Fri, 25 Feb 2022 21:03:15 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 4/9] Avocado: bump to version 95.0
Date: Fri, 25 Feb 2022 16:01:51 -0500
Message-Id: <20220225210156.2032055-5-crosa@redhat.com>
In-Reply-To: <20220225210156.2032055-1-crosa@redhat.com>
References: <20220225210156.2032055-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Huacai Chen <chenhuacai@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eric Farman <farman@linux.ibm.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Greg Kurz <groug@kaod.org>,
 Fabien Chouteau <chouteau@adacore.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Cleber Rosa <crosa@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Even though there have been a number of improvements (and some pretty
deep internal changes) since Avocado 88.1, only one change should
affect "make check-avocado".

With the nrunner architecture, test execution happens in parallel by
default.  But, tests may fail due to insufficient timeouts or similar
reasons when run under systems with limited or shared resources.  To
avoid breakages, especially on CI, let's keep the serial execution
until proven that it won't impact the CI jobs.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/Makefile.include | 1 +
 tests/requirements.txt | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index e7153c8e91..676aa0d944 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -135,6 +135,7 @@ check-avocado: check-venv $(TESTS_RESULTS_DIR) get-vm-images
             $(if $(AVOCADO_TAGS),, --filter-by-tags-include-empty \
 			--filter-by-tags-include-empty-key) \
             $(AVOCADO_CMDLINE_TAGS) \
+            --nrunner-max-parallel-tasks=1 \
             $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS), \
             "AVOCADO", "tests/avocado")
 
diff --git a/tests/requirements.txt b/tests/requirements.txt
index a21b59b443..49aa0fd6f6 100644
--- a/tests/requirements.txt
+++ b/tests/requirements.txt
@@ -1,5 +1,5 @@
 # Add Python module requirements, one per line, to be installed
 # in the tests/venv Python virtual environment. For more info,
 # refer to: https://pip.pypa.io/en/stable/user_guide/#id1
-avocado-framework==88.1
+avocado-framework==95.0
 pycdlib==1.11.0
-- 
2.35.1


