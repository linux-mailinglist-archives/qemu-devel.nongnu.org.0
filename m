Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C32A53E549
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 17:04:16 +0200 (CEST)
Received: from localhost ([::1]:48070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyEH9-000594-KJ
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 11:04:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDrO-0002bn-0y
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDrM-0000eg-Gc
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654526256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YtlVUesl9728XneFM+M8MhUCvdZtA1uLl7Gr8FIog3E=;
 b=SdDaTtoJ7T/A1o6CEY/57VTMVzGwgEpdLn3AsKrL8fhyOVhmDks0oP51BZW9Utz1TTQs5U
 4yxREq302ot6bOYy5TrIz2rmccTtjEi21c0AEl/dlIxcEdrEeJtMIAw8osnRkBDX3g60eK
 GrW3iDvt+5edfTeNjDLBwvy3+EQNHCA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-522-r2CsJYNnPJG93Val4UC6BA-1; Mon, 06 Jun 2022 10:37:34 -0400
X-MC-Unique: r2CsJYNnPJG93Val4UC6BA-1
Received: by mail-wm1-f71.google.com with SMTP id
 bg40-20020a05600c3ca800b00394779649b1so11305238wmb.3
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 07:37:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YtlVUesl9728XneFM+M8MhUCvdZtA1uLl7Gr8FIog3E=;
 b=jzWt31+Qe62tHwUJ7RS8+W3q4v/2fD2TOqDmOb9u7VcgdW1jabGmwK8oWWwUmHEvWV
 u7Tu5akxvqVSHnkJ2ij+vhSP06in8F/E5BJm1EemLIMjRTF0RIExOFWTqGRtGrXQEmYb
 FHfHmtQVlXWUEbh1OVyf02iTtrPVypB7pu2TUtZQ721wZVR9GHTO0ndGNOT7p7bQ1QUS
 PWBoH5/jj9BoWIZ4D7XKri9yMPRJR94SkY02YByp5M/fBAxp4Q9+tiuiwqBzyk6pZaHk
 Ca9ZgpWZuJnPcur5JL7ksM0NXHP+/AQKdFXUwZehxAZAm8uGLtCQdSQV3lR0O5z1ZOEL
 d+yw==
X-Gm-Message-State: AOAM531FWrzFg1A2kecLogx8zDyBxJmL2P5rO2pcTYEqCB6bTyxqm6ML
 llhNMN/4PpSqQySvo8+4En4t+L1abU9duyXElxdyhE+Acm7hYVVY9aOjTHtoPMRFmwby84hLDbk
 ky+tmk5c4KJYjhTaKIVADLNNYKsWU/+0lBny1T40AV/muK2caN9CZUOoyDLau8qjpj1Y=
X-Received: by 2002:a05:600c:22d9:b0:39c:4b1b:5f99 with SMTP id
 25-20020a05600c22d900b0039c4b1b5f99mr9107568wmg.151.1654526252985; 
 Mon, 06 Jun 2022 07:37:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnjhUfOdbuNuNegdmva9LOaL+nwSJUonldJZsqh1XkxfasJ4xz8A3srMLxfBXfgqAL6Q+/GA==
X-Received: by 2002:a05:600c:22d9:b0:39c:4b1b:5f99 with SMTP id
 25-20020a05600c22d900b0039c4b1b5f99mr9107513wmg.151.1654526252405; 
 Mon, 06 Jun 2022 07:37:32 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 bg20-20020a05600c3c9400b0039c15861001sm15533194wmb.21.2022.06.06.07.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 07:37:31 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>
Subject: [PULL 24/29] tests: use tests/venv to run basevm.py-based scripts
Date: Mon,  6 Jun 2022 16:36:39 +0200
Message-Id: <20220606143644.1151112-25-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220606143644.1151112-1-pbonzini@redhat.com>
References: <20220606143644.1151112-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

This patch co-opts the virtual environment being used by avocado tests
to also run the basevm.py tests. This is being done in preparation for
for the qemu.qmp package being removed from qemu.git.

As part of the change, remove any sys.path() hacks and treat "qemu" as a
normal third-party import.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220526000921.1581503-8-jsnow@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/vm/Makefile.include | 13 +++++++------
 tests/vm/basevm.py        |  6 +++---
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/tests/vm/Makefile.include b/tests/vm/Makefile.include
index ae91f5043e..588bc999cc 100644
--- a/tests/vm/Makefile.include
+++ b/tests/vm/Makefile.include
@@ -84,10 +84,11 @@ vm-clean-all:
 
 $(IMAGES_DIR)/%.img:	$(SRC_PATH)/tests/vm/% \
 			$(SRC_PATH)/tests/vm/basevm.py \
-			$(SRC_PATH)/tests/vm/Makefile.include
+			$(SRC_PATH)/tests/vm/Makefile.include \
+			check-venv
 	@mkdir -p $(IMAGES_DIR)
 	$(call quiet-command, \
-		$(PYTHON) $< \
+		$(TESTS_PYTHON) $< \
 		$(if $(V)$(DEBUG), --debug) \
 		$(if $(GENISOIMAGE),--genisoimage $(GENISOIMAGE)) \
 		$(if $(QEMU_LOCAL),--build-path $(BUILD_DIR)) \
@@ -101,9 +102,9 @@ $(IMAGES_DIR)/%.img:	$(SRC_PATH)/tests/vm/% \
 
 
 # Build in VM $(IMAGE)
-vm-build-%: $(IMAGES_DIR)/%.img
+vm-build-%: $(IMAGES_DIR)/%.img check-venv
 	$(call quiet-command, \
-		$(PYTHON) $(SRC_PATH)/tests/vm/$* \
+		$(TESTS_PYTHON) $(SRC_PATH)/tests/vm/$* \
 		$(if $(V)$(DEBUG), --debug) \
 		$(if $(DEBUG), --interactive) \
 		$(if $(J),--jobs $(J)) \
@@ -127,9 +128,9 @@ vm-boot-serial-%: $(IMAGES_DIR)/%.img
 		-device virtio-net-pci,netdev=vnet \
 	|| true
 
-vm-boot-ssh-%: $(IMAGES_DIR)/%.img
+vm-boot-ssh-%: $(IMAGES_DIR)/%.img check-venv
 	$(call quiet-command, \
-		$(PYTHON) $(SRC_PATH)/tests/vm/$* \
+		$(TESTS_PYTHON) $(SRC_PATH)/tests/vm/$* \
 		$(if $(J),--jobs $(J)) \
 		$(if $(V)$(DEBUG), --debug) \
 		$(if $(QEMU_LOCAL),--build-path $(BUILD_DIR)) \
diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
index 254e11c932..d7d0413df3 100644
--- a/tests/vm/basevm.py
+++ b/tests/vm/basevm.py
@@ -18,9 +18,6 @@
 import logging
 import time
 import datetime
-sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
-from qemu.machine import QEMUMachine
-from qemu.utils import get_info_usernet_hostfwd_port, kvm_available
 import subprocess
 import hashlib
 import argparse
@@ -31,6 +28,9 @@
 import traceback
 import shlex
 
+from qemu.machine import QEMUMachine
+from qemu.utils import get_info_usernet_hostfwd_port, kvm_available
+
 SSH_KEY_FILE = os.path.join(os.path.dirname(__file__),
                "..", "keys", "id_rsa")
 SSH_PUB_KEY_FILE = os.path.join(os.path.dirname(__file__),
-- 
2.36.1



