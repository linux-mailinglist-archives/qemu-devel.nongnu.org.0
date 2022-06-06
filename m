Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9089C53E54D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 17:09:13 +0200 (CEST)
Received: from localhost ([::1]:59056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyELv-0004Uu-ML
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 11:09:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDrU-0002i7-SD
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDrQ-0000fD-Vx
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654526259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YbCITN4WWv2lWDs17REuqnuTLGGVSQp/qDeRaT877jU=;
 b=N8L8bi3jDjETxUnh/ajHudZ2QJQEoSNjmBZoR4UjGOtgQsMhANZ5KEeqt1k75G+wkOnzUr
 oqK/6D6g2pzsJ6OsO8YsP8SvSNvVexUiT95R4urkhvKvQ00I7y5ywUPFWCKP4rFdJIjFqC
 BAbo8KX1dPreMClSjyoQOWLa/aNRbWg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-147-k0KXds0rPpKkHjW_BdkdqQ-1; Mon, 06 Jun 2022 10:37:38 -0400
X-MC-Unique: k0KXds0rPpKkHjW_BdkdqQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 m18-20020adff392000000b0021848a78a53so350381wro.19
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 07:37:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YbCITN4WWv2lWDs17REuqnuTLGGVSQp/qDeRaT877jU=;
 b=y/dpm2kZf1Y0k1I5SzSA3TuXN6KNZCqee6G958cRRDzR4+Iu93N6/ZwIW7GEWq2sJy
 u+YEuIsCmdqdTslBQIw8cWSLta+ztWcteM/cTtUhyx7VyHv6YoF46TFfJyR3jPVoz9ym
 k58FdvWQf+M9lLGZBA95sZFRVm5BL5htXltdANZEDPpyuC9TIluZyCGN+KzUMYV8joDR
 rv0GUUnvrzSjFJXAoCifA8PmJ/N5lNavJ2z20UDXOsycrOB+OMJlXjFIAtf85Nzlj6pU
 gY0LBcBUEXM6IrSnWKZ6xiiDGgmhI7XPAnODAo/ofNWtJpbhU3LoPNIiQ57OO5n+qDbd
 9f1w==
X-Gm-Message-State: AOAM530Awuvmfb+M0JCd2HgpkjYA35HPohrZdSPG/jqfebEkBPS2n2l1
 9TVeFEejbnPezdh4e4QA3Y/cI9TcrNbgwireQLvo2YrHPq4xiIp5i0Ofr8/qePJOW9AqKji5M25
 aGomYm1tMOT7rccTX2NYquETo4OvPWnPRoBIc5uMpFZfLpchgLNdUYMp9G4m05uSMsWs=
X-Received: by 2002:a05:600c:20e:b0:397:697f:172b with SMTP id
 14-20020a05600c020e00b00397697f172bmr52867525wmi.84.1654526256043; 
 Mon, 06 Jun 2022 07:37:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFlvRh3T+AJ2NqPMByRmAQyqWjz7ZoP5TqZoBHfW1m2Qdf7fu11UaY6gQsRv6YE4SvqzQYxQ==
X-Received: by 2002:a05:600c:20e:b0:397:697f:172b with SMTP id
 14-20020a05600c020e00b00397697f172bmr52867480wmi.84.1654526255651; 
 Mon, 06 Jun 2022 07:37:35 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 186-20020a1c19c3000000b0039c4ec6fdacsm3739931wmz.40.2022.06.06.07.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 07:37:35 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>
Subject: [PULL 26/29] tests: run 'device-crash-test' from tests/venv
Date: Mon,  6 Jun 2022 16:36:41 +0200
Message-Id: <20220606143644.1151112-27-pbonzini@redhat.com>
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

Remove the sys.path hacking from device-crash-test, and add in a little
user-friendly message for anyone who was used to running this script
directly from the source tree.

Modify the GitLab job recipes to create the tests/venv first, then run
device-crash-test from that venv.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220526000921.1581503-10-jsnow@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 .gitlab-ci.d/buildtest.yml |  8 +++++---
 scripts/device-crash-test  | 14 +++++++++++---
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index ecac3ec50c..544385f5be 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -110,7 +110,8 @@ crash-test-debian:
     IMAGE: debian-amd64
   script:
     - cd build
-    - scripts/device-crash-test -q ./qemu-system-i386
+    - make check-venv
+    - tests/venv/bin/python3 scripts/device-crash-test -q ./qemu-system-i386
 
 build-system-fedora:
   extends: .native_build_job_template
@@ -155,8 +156,9 @@ crash-test-fedora:
     IMAGE: fedora
   script:
     - cd build
-    - scripts/device-crash-test -q ./qemu-system-ppc
-    - scripts/device-crash-test -q ./qemu-system-riscv32
+    - make check-venv
+    - tests/venv/bin/python3 scripts/device-crash-test -q ./qemu-system-ppc
+    - tests/venv/bin/python3 scripts/device-crash-test -q ./qemu-system-riscv32
 
 build-system-centos:
   extends: .native_build_job_template
diff --git a/scripts/device-crash-test b/scripts/device-crash-test
index a203b3fdea..73bcb98693 100755
--- a/scripts/device-crash-test
+++ b/scripts/device-crash-test
@@ -33,10 +33,18 @@ import re
 import random
 import argparse
 from itertools import chain
+from pathlib import Path
 
-sys.path.append(os.path.join(os.path.dirname(__file__), '..', 'python'))
-from qemu.machine import QEMUMachine
-from qemu.qmp import ConnectError
+try:
+    from qemu.machine import QEMUMachine
+    from qemu.qmp import ConnectError
+except ModuleNotFoundError as exc:
+    path = Path(__file__).resolve()
+    print(f"Module '{exc.name}' not found.")
+    print("  Try 'make check-venv' from your build directory,")
+    print("  and then one way to run this script is like so:")
+    print(f'  > $builddir/tests/venv/bin/python3 "{path}"')
+    sys.exit(1)
 
 logger = logging.getLogger('device-crash-test')
 dbg = logger.debug
-- 
2.36.1



