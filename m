Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB91953E532
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 16:57:53 +0200 (CEST)
Received: from localhost ([::1]:34326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyEAz-0003k2-2A
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 10:57:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDrF-0002PI-RJ
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDrD-0000c2-7G
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654526245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ydCPV3AL2yJ4gisp+0rL/mAMFC2dKDpKV3qo4Abk2gs=;
 b=K0c/VZNQm+BRY6pVOHdsplosSoAdfUPzpx0cW84nAyDzuZBrsrVP+koQNS1fu8DXiMzvOR
 0U9mDWzMNsSrgaDDIthjs9bjucLs3Z4vASQNf3fQDV/lq52j4Nuv6APHqu2c+yczMhKUUA
 i7QCwY4zU8AjsnaadiUTKnlB5rnDPC0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-XGAZTxrdN8y_MJd9EIx51A-1; Mon, 06 Jun 2022 10:37:24 -0400
X-MC-Unique: XGAZTxrdN8y_MJd9EIx51A-1
Received: by mail-wm1-f72.google.com with SMTP id
 bi22-20020a05600c3d9600b0039c4144992cso3964983wmb.5
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 07:37:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ydCPV3AL2yJ4gisp+0rL/mAMFC2dKDpKV3qo4Abk2gs=;
 b=WWvmrIUNK07YU1kuavZhNZZBTmI9ciECK5nnlj9Z2/Stnxz6gNqe3sYiYAeNNNUm5a
 o7Rt7uEfT4ah3Z4loM0e7vfSNgTcIBZ1SajkGKYcjma0oy/ua5jw8CubdAa2zaj/jkft
 NXnkwDBL2EkGj76Yng+H6n+mVQuj2jmBD9PaR9M9kS9abL6hhlWlTH5932Gs0TqdNTI4
 erNFGxP99g6bpSn23ca4fS23xFnxbCqUVQKHSjdVvFn5B/02cKtb5DbGRz60vqoswlD5
 Ckt4SybF87Z8jv1t37AgN6vIV6heLUFDq0YXntFZl37sHmRp7tNb9uM0fMmfkBo9+yL6
 2IjQ==
X-Gm-Message-State: AOAM532Yi+G1d8NNhB/OiYaBUrWqgZlEmSnq10LlGaFpGyFAhm79J6by
 i6uwJbfFd1kO6R2dkHweP7Z2jjHPIcu0MglWRA8dIsWGuOMutmYgyKOwtjTcMout6DYHkrUBouD
 VtOuww46SfhhGji/QmrW4WJ0dvVBuZ1Xv3AXxJwV/WDb74W2UJdV62xaYHa434TbvQ1w=
X-Received: by 2002:a5d:594a:0:b0:212:3ad0:5bac with SMTP id
 e10-20020a5d594a000000b002123ad05bacmr21839203wri.393.1654526242729; 
 Mon, 06 Jun 2022 07:37:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxN4XHl+9kQNCYoczYoqZlVVoAsHL+PWrZ4jVsDz7CnuGb3/56Wa6Z5hmRLIP34ppn1ngVBUQ==
X-Received: by 2002:a5d:594a:0:b0:212:3ad0:5bac with SMTP id
 e10-20020a5d594a000000b002123ad05bacmr21839172wri.393.1654526242398; 
 Mon, 06 Jun 2022 07:37:22 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 186-20020a1c19c3000000b0039c4ec6fdacsm3739358wmz.40.2022.06.06.07.37.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 07:37:21 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>
Subject: [PULL 19/29] tests: add "TESTS_PYTHON" variable to Makefile
Date: Mon,  6 Jun 2022 16:36:34 +0200
Message-Id: <20220606143644.1151112-20-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220606143644.1151112-1-pbonzini@redhat.com>
References: <20220606143644.1151112-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

This is a convenience feature: $(PYTHON) points to the Python executable
we were instructed to use by the configure script. We use that Python to
create a virtual environment with the "check-venv" target in
tests/Makefile.include.

$(TESTS_PYTHON) points to the Python executable belonging to the virtual
environment tied to the build. This Python executable is a symlink to
the binary used to create the venv, which will be the version provided
at configure time.

Using $(TESTS_PYTHON) therefore uses the $(PYTHON) executable, but with
paths modified to use packages installed to the venv.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220526000921.1581503-3-jsnow@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/Makefile.include | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 2a1c77440a..50237f073a 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -89,6 +89,7 @@ TARGETS=$(patsubst libqemu-%.fa, %, $(filter libqemu-%.fa, $(ninja-targets)))
 TESTS_VENV_DIR=$(BUILD_DIR)/tests/venv
 TESTS_VENV_REQ=$(SRC_PATH)/tests/requirements.txt
 TESTS_RESULTS_DIR=$(BUILD_DIR)/tests/results
+TESTS_PYTHON=$(TESTS_VENV_DIR)/bin/python
 ifndef AVOCADO_TESTS
 	AVOCADO_TESTS=tests/avocado
 endif
@@ -108,7 +109,7 @@ $(TESTS_VENV_DIR): $(TESTS_VENV_REQ)
             $(PYTHON) -m venv $@, \
             VENV, $@)
 	$(call quiet-command, \
-            $(TESTS_VENV_DIR)/bin/python -m pip -q install -r $(TESTS_VENV_REQ), \
+            $(TESTS_PYTHON) -m pip -q install -r $(TESTS_VENV_REQ), \
             PIP, $(TESTS_VENV_REQ))
 	$(call quiet-command, touch $@)
 
@@ -126,7 +127,7 @@ FEDORA_31_DOWNLOAD=$(filter $(FEDORA_31_ARCHES),$(FEDORA_31_ARCHES_CANDIDATES))
 # download one specific Fedora 31 image
 get-vm-image-fedora-31-%: check-venv
 	$(call quiet-command, \
-             $(TESTS_VENV_DIR)/bin/python -m avocado vmimage get \
+             $(TESTS_PYTHON) -m avocado vmimage get \
              --distro=fedora --distro-version=31 --arch=$*, \
 	"AVOCADO", "Downloading avocado tests VM image for $*")
 
@@ -135,7 +136,7 @@ get-vm-images: check-venv $(patsubst %,get-vm-image-fedora-31-%, $(FEDORA_31_DOW
 
 check-avocado: check-venv $(TESTS_RESULTS_DIR) get-vm-images
 	$(call quiet-command, \
-            $(TESTS_VENV_DIR)/bin/python -m avocado \
+            $(TESTS_PYTHON) -m avocado \
             --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR) \
             $(if $(AVOCADO_TAGS),, --filter-by-tags-include-empty \
 			--filter-by-tags-include-empty-key) \
-- 
2.36.1



