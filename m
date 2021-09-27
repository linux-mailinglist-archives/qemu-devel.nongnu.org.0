Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAA0419AE0
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 19:12:49 +0200 (CEST)
Received: from localhost ([::1]:42944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUuBM-0008Ab-Eh
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 13:12:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUu26-0002uR-MN
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:03:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUu24-0003Bb-Mq
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:03:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632762192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IKfiq28KwaCW2FhO3C3XMBnTMqiuEqzPEChSBk4TZWs=;
 b=BmK0aulEtcW9ylMHUtnDXwhdR1vCljuzGak4gMwreAoRT0DZz91LQ3pEsYtNzOthV47c1E
 i+Dnh//tanBq5wkLgbZPpIzId1IPKsvBs1mlC07Ms+9eQxf4AjggIgVgIHCqwO+/VPMcbw
 KJqz2KWE75G9nPKqpaySevpf1glhry8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412--Ouzvj2eOOKQgjz_Fsxetg-1; Mon, 27 Sep 2021 13:03:11 -0400
X-MC-Unique: -Ouzvj2eOOKQgjz_Fsxetg-1
Received: by mail-wm1-f69.google.com with SMTP id
 m2-20020a05600c3b0200b0030cd1310631so178050wms.7
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 10:03:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IKfiq28KwaCW2FhO3C3XMBnTMqiuEqzPEChSBk4TZWs=;
 b=3nCm3MqXa4jit+1I7tZSINM1C8UM3z4kRCHfbgkb5ZIWAxoRtBMSY5cMDVTqKmtx/J
 iUP56Gj9subqglgD2MPz+1q+V78IOzryD+OccR+bbhC1b9uRDTwWQisa7m5uQhtRhDfM
 atfsfG8pO+9ccEf/v+79YJlTpVwGFnVt6KHJgQYOjjDNWVYCofxXUKbTatUo7hX0TlPe
 i4Zv0mPaGvv+NfPwEZ16uGnMjCBSf+OWKw0iuHACqN+uJQ2W3L5Ou0VF/UfVzk0Taa+r
 GTRkOmVrlN7QHu8G6L166zqt74R4zNDLAXGBcQMEgQa9uI0LEJt0gtYJZkirHZySBhG7
 faBg==
X-Gm-Message-State: AOAM5323dHjMGDMRpjZVmTAiLtWMnVL3nPxEGwpMKQTEcLUWxalcy/+w
 oEBXQzwZsdy+xVhD8kevJVZvpY9Shf7Obxbg1EkkaNTHd2d8Txoo3T+MHL1gn79NIF5Hai72MK9
 /aWTxqoByWoDT9zwyv+Gd1KGppBWmzXy0sOuAcTU0pZRBkssTNkZKsN+qDxvKtY2s
X-Received: by 2002:a05:6000:1787:: with SMTP id
 e7mr1102268wrg.202.1632762189568; 
 Mon, 27 Sep 2021 10:03:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzp23u46G61pMWo8e2AbguEBwJJezhNyKsx7v3kFzOig2GYu9ZwZ4Pu3/qwGOpiI9m2QbwULw==
X-Received: by 2002:a05:6000:1787:: with SMTP id
 e7mr1102231wrg.202.1632762189281; 
 Mon, 27 Sep 2021 10:03:09 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id q7sm18273195wrc.55.2021.09.27.10.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 10:03:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/21] avocado_qemu: fix import module based on isort
Date: Mon, 27 Sep 2021 19:02:15 +0200
Message-Id: <20210927170227.2014482-10-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927170227.2014482-1-philmd@redhat.com>
References: <20210927170227.2014482-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Willian Rampazzo <willianr@redhat.com>

Signed-off-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210920204932.94132-4-willianr@redhat.com>
---
 tests/acceptance/avocado_qemu/__init__.py | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index d2077d63cda..edb9ed74852 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -12,19 +12,13 @@
 import os
 import shutil
 import sys
-import uuid
 import tempfile
+import uuid
 
 import avocado
-
-from avocado.utils import cloudinit
-from avocado.utils import datadrainer
-from avocado.utils import network
-from avocado.utils import ssh
-from avocado.utils import vmimage
+from avocado.utils import cloudinit, datadrainer, network, ssh, vmimage
 from avocado.utils.path import find_command
 
-
 #: The QEMU build root directory.  It may also be the source directory
 #: if building from the source dir, but it's safer to use BUILD_DIR for
 #: that purpose.  Be aware that if this code is moved outside of a source
@@ -42,11 +36,9 @@
 sys.path.append(os.path.join(SOURCE_DIR, 'python'))
 
 from qemu.machine import QEMUMachine
-from qemu.utils import (
-    get_info_usernet_hostfwd_port,
-    kvm_available,
-    tcg_available,
-)
+from qemu.utils import (get_info_usernet_hostfwd_port, kvm_available,
+                        tcg_available)
+
 
 def is_readable_executable_file(path):
     return os.path.isfile(path) and os.access(path, os.R_OK | os.X_OK)
-- 
2.31.1


