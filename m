Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9504353E537
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 17:00:00 +0200 (CEST)
Received: from localhost ([::1]:39464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyED1-0007MK-NW
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 10:59:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDrL-0002a0-Nt
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDrJ-0000eI-NI
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654526253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j6MAMxnLiI0ZXMoEaI2ox4+MmiSbU8k7mfpEeYwLCTE=;
 b=Q56ZbiPvJsdnobAvn0eIQrBUg9ME/VwIusIUEtxcJJBQkPdTdJeDJ1Bmfx5wj6FLeG95cc
 vm5j27H9Sqx80sx3ekqcHp9fcRk3957sfeUjgXiSAdYt++CboTlEsZnVpiMsHOmrr0ILzz
 Agu2IB9nVowPC2wVfBn15PpJeZj7vuw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-5DayqEyfPZ6D0vUVm1tWJA-1; Mon, 06 Jun 2022 10:37:32 -0400
X-MC-Unique: 5DayqEyfPZ6D0vUVm1tWJA-1
Received: by mail-wr1-f72.google.com with SMTP id
 p8-20020a5d4588000000b0021033f1f79aso2883890wrq.5
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 07:37:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j6MAMxnLiI0ZXMoEaI2ox4+MmiSbU8k7mfpEeYwLCTE=;
 b=VwrbGZwdLYC+02JHI71ihrRUY3QuTjBlCJHdLh7L7MgElpngrgu8ZZNFcnnX4urW+E
 P/MwKeTnCQ3q4WjJZom5TLjtfF8WFIitBYE1DvcL8vQn+43f9D4lXUz/vbQpg2gzMZtL
 bKl5Ov1a3XeZa9MuwnO9ozsdL6sR+E6zPggpr2UX6bUzsOwpVPLa9m4yX0D6fsVhvArD
 QZI45Qbn3bmNz+h+3CkQcymlONYZpxX5ve2vWco2KJmUoPaybh58+p3aNNhuGwXdk/bC
 WiwatWZ+msw6icYdHntN/V8uZQKi6gcnVE/KXh76UBMm4C8K2BCHaItnRbEByzFDZH4f
 Z0ew==
X-Gm-Message-State: AOAM531ZADhM9yvJvuAci0o0HPzqVCxnRXSRQ1ph4y/j4IptsuQuLZ4d
 c8PLz9a2UcngPuXu3xvazWEMKD0gsl25LvdJg8X1Q6A6zw9MJf9j3sgeoVvHu63K5BfDPdqJ/WB
 +kj0/TcVj+Eyo6MdYoKbGm2qjZzg0Hk9bY4Ws7oq07otxliDOkDSSR5vpKw5KzwPZblw=
X-Received: by 2002:a5d:40c5:0:b0:216:ddde:9c2e with SMTP id
 b5-20020a5d40c5000000b00216ddde9c2emr10067429wrq.241.1654526250316; 
 Mon, 06 Jun 2022 07:37:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzeoZAs5CngK7VqHNnwXy2MVz66/VNhoKvse+DecdH55rlfYSrX8lMHhsW47DyYPYnHZ5Iog==
X-Received: by 2002:a5d:40c5:0:b0:216:ddde:9c2e with SMTP id
 b5-20020a5d40c5000000b00216ddde9c2emr10067394wrq.241.1654526249937; 
 Mon, 06 Jun 2022 07:37:29 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 c9-20020adfe749000000b002108ab90e5asm15653282wrn.58.2022.06.06.07.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 07:37:29 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>
Subject: [PULL 23/29] tests: install "qemu" namespace package into venv
Date: Mon,  6 Jun 2022 16:36:38 +0200
Message-Id: <20220606143644.1151112-24-pbonzini@redhat.com>
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

This patch adds the "qemu" namespace package to the $build/tests/venv
directory. It does so in "editable" mode, which means that changes to
the source python directory will actively be reflected by the venv.

This patch also then removes any sys.path hacking from the avocado test
scripts directly. By doing this, the environment of where to find these
packages is managed entirely by the virtual environment and not by the
scripts themselves.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220526000921.1581503-7-jsnow@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/Makefile.include                 |  1 +
 tests/avocado/avocado_qemu/__init__.py | 11 +++++------
 tests/avocado/virtio_check_params.py   |  1 -
 tests/avocado/virtio_version.py        |  1 -
 tests/requirements.txt                 |  1 +
 5 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index fa46c0c61b..3accb83b13 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -110,6 +110,7 @@ quiet-venv-pip = $(quiet-@)$(call quiet-command-run, \
 
 $(TESTS_VENV_DIR): $(TESTS_VENV_REQ)
 	$(call quiet-command, $(PYTHON) -m venv $@, VENV, $@)
+	$(call quiet-venv-pip,install -e "$(SRC_PATH)/python/")
 	$(call quiet-venv-pip,install -r $(TESTS_VENV_REQ))
 	$(call quiet-command, touch $@)
 
diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index 39f15c1d51..b656a70c55 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -21,6 +21,11 @@
 from avocado.utils import cloudinit, datadrainer, process, ssh, vmimage
 from avocado.utils.path import find_command
 
+from qemu.machine import QEMUMachine
+from qemu.utils import (get_info_usernet_hostfwd_port, kvm_available,
+                        tcg_available)
+
+
 #: The QEMU build root directory.  It may also be the source directory
 #: if building from the source dir, but it's safer to use BUILD_DIR for
 #: that purpose.  Be aware that if this code is moved outside of a source
@@ -35,12 +40,6 @@
 else:
     SOURCE_DIR = BUILD_DIR
 
-sys.path.append(os.path.join(SOURCE_DIR, 'python'))
-
-from qemu.machine import QEMUMachine
-from qemu.utils import (get_info_usernet_hostfwd_port, kvm_available,
-                        tcg_available)
-
 
 def has_cmd(name, args=None):
     """
diff --git a/tests/avocado/virtio_check_params.py b/tests/avocado/virtio_check_params.py
index e869690473..4093da8a67 100644
--- a/tests/avocado/virtio_check_params.py
+++ b/tests/avocado/virtio_check_params.py
@@ -22,7 +22,6 @@
 import re
 import logging
 
-sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
 from qemu.machine import QEMUMachine
 from avocado_qemu import QemuSystemTest
 from avocado import skip
diff --git a/tests/avocado/virtio_version.py b/tests/avocado/virtio_version.py
index 208910bb84..c84e48813a 100644
--- a/tests/avocado/virtio_version.py
+++ b/tests/avocado/virtio_version.py
@@ -11,7 +11,6 @@
 import sys
 import os
 
-sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
 from qemu.machine import QEMUMachine
 from avocado_qemu import QemuSystemTest
 
diff --git a/tests/requirements.txt b/tests/requirements.txt
index a21b59b443..0ba561b6bd 100644
--- a/tests/requirements.txt
+++ b/tests/requirements.txt
@@ -1,5 +1,6 @@
 # Add Python module requirements, one per line, to be installed
 # in the tests/venv Python virtual environment. For more info,
 # refer to: https://pip.pypa.io/en/stable/user_guide/#id1
+# Note that qemu.git/python/ is always implicitly installed.
 avocado-framework==88.1
 pycdlib==1.11.0
-- 
2.36.1



