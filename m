Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1003C925B
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 22:44:38 +0200 (CEST)
Received: from localhost ([::1]:49756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3lkD-0008Gs-6L
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 16:44:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m3lih-0006Rh-PL
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 16:43:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m3lie-0006H3-VU
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 16:43:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626295379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1K83Xan5y/+/i4D+YxXdho6YG5RzwV0V4SgPvALJQ84=;
 b=DWUS8Rq8uxiRStK0H738hFW5REwzG+nrif/2jAwcuwXzf+pbHU7YJjzE4zBW+oa5Od9HC2
 3I9OzMFFQLJZF7TxvOE1Li4zcljnLbdHby+1OjbBhWKGKnMn39Ix5+1CNlN4cwubVLH6/m
 EpO2Npg91b0ijmufBIz5wTQ09qkHG4Y=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-_VHBpI0MN6CjKOHeX40rbQ-1; Wed, 14 Jul 2021 16:42:58 -0400
X-MC-Unique: _VHBpI0MN6CjKOHeX40rbQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 u13-20020a5d6dad0000b029012e76845945so2144010wrs.11
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 13:42:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1K83Xan5y/+/i4D+YxXdho6YG5RzwV0V4SgPvALJQ84=;
 b=WuEFejX8BLDWO44AGhiv56ia5rpaJG/KamPSgcggdgHWuw/c0KGilVtzEbjYPQsXVW
 S8Xm5mPkpIH8a4Vebd8jpocYRRtKC0Xpyh3nfjmNWD6DUNGX2PsGrtki4PWDBxyOwo6h
 j9OOZE/pQ0xmykwUe2Gi+Il1gxu0iVQ7KbWKnnnkZvoRDd0Bu9h3XdilLR6azHiq2fHa
 clOuM15aeVU8EAcN04mak7nDrZkwH4caxMrQMd9tGH46DiICuG6imPQEktarNSmV+vK+
 TshA/RLw3JtMY/P5xxCB065m8H4DejvWaP2HpYZio8OUJm+4EdZV8/nKRDxeoLWukDBG
 noug==
X-Gm-Message-State: AOAM530PXDg//XUi9UWgLFW6eQhgz/ePhrtabYxNHDxpZgON2VuV9ren
 w0OCJwts9QQwV0MGhw5BetVuUuhP3rLQVk/TnySu6D4bfYMiRo2sZZ288358qhniyB0vq9hi+rl
 YsrmsMLSwrz3pqbFKx9le7ZMNNX2uL34gNA07SRG5llSV5i2GO+QW0/X2A3ML5aOO
X-Received: by 2002:a1c:4c0a:: with SMTP id z10mr96908wmf.24.1626295376455;
 Wed, 14 Jul 2021 13:42:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRypEUeb8x14MwUxi1+J1pDxpcSVvrY75F1YHzt+8gjCt2oTuRcxAs56W4/D72BwN5yRQ4Fg==
X-Received: by 2002:a1c:4c0a:: with SMTP id z10mr96889wmf.24.1626295376141;
 Wed, 14 Jul 2021 13:42:56 -0700 (PDT)
Received: from localhost.localdomain
 (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr. [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id 129sm3168066wmz.26.2021.07.14.13.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 13:42:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/5] gitlab-ci: Extract EDK2 job rules to reusable section
Date: Wed, 14 Jul 2021 22:42:38 +0200
Message-Id: <20210714204238.3145092-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210714204238.3145092-1-philmd@redhat.com>
References: <20210714204238.3145092-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Dov Murik <dovmurik@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All jobs depending on 'docker-edk2' job must use at most all
the rules that triggers it. The simplest way to ensure that
is to always use the same rules. Extract all the rules to a
reusable section, and include this section (with the 'extends'
keyword) in both 'docker-edk2' and 'build-edk2' jobs.

The problem was introduced in commit 71920809cea ("gitlab-ci.yml:
Add jobs to build EDK2 firmware binaries"), but was revealed in
commit 1925468ddbf ("docker: EDK2 build job depends on EDK2
container") and eventually failed on CI:
https://gitlab.com/qemu-project/qemu/-/pipelines/335995843

Reported-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210714101003.3113726-1-philmd@redhat.com>
---
 .gitlab-ci.d/edk2.yml | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/.gitlab-ci.d/edk2.yml b/.gitlab-ci.d/edk2.yml
index ba7280605c4..aae2f7ad880 100644
--- a/.gitlab-ci.d/edk2.yml
+++ b/.gitlab-ci.d/edk2.yml
@@ -1,10 +1,22 @@
-docker-edk2:
- stage: containers
- rules: # Only run this job when the Dockerfile is modified
+# All jobs needing docker-edk2 must use the same rules it uses.
+.edk2_job_rules:
+ rules: # Only run this job when ...
  - changes:
+   # this file is modified
    - .gitlab-ci.d/edk2.yml
+   # or the Dockerfile is modified
    - .gitlab-ci.d/edk2/Dockerfile
+   # or roms/edk2/ is modified (submodule updated)
+   - roms/edk2/*
    when: always
+ - if: '$CI_COMMIT_REF_NAME =~ /^edk2/' # or the branch/tag starts with 'edk2'
+   when: always
+ - if: '$CI_COMMIT_MESSAGE =~ /edk2/i' # or last commit description contains 'EDK2'
+   when: always
+
+docker-edk2:
+ extends: .edk2_job_rules
+ stage: containers
  image: docker:19.03.1
  services:
  - docker:19.03.1-dind
@@ -24,16 +36,9 @@ docker-edk2:
  - docker push $IMAGE_TAG
 
 build-edk2:
+ extends: .edk2_job_rules
  stage: build
  needs: ['docker-edk2']
- rules: # Only run this job when ...
- - changes: # ... roms/edk2/ is modified (submodule updated)
-   - roms/edk2/*
-   when: always
- - if: '$CI_COMMIT_REF_NAME =~ /^edk2/' # or the branch/tag starts with 'edk2'
-   when: always
- - if: '$CI_COMMIT_MESSAGE =~ /edk2/i' # or last commit description contains 'EDK2'
-   when: always
  artifacts:
    paths: # 'artifacts.zip' will contains the following files:
    - pc-bios/edk2*bz2
-- 
2.31.1


