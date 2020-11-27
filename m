Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 839E82C6AC1
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 18:42:12 +0100 (CET)
Received: from localhost ([::1]:54298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kihl5-0005vP-CA
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 12:42:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kihkH-0005U8-PU
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 12:41:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kihkE-0005iP-HN
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 12:41:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606498876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ishc1wMCsn5jgoH1UVBDyCZIG/gh19eG7GoNQWhhP1E=;
 b=EVGy4lhZa9XC+D18fYkzUc7jyEfn0ezI1mEHsan0/y4ANQ6dwP0UhbeAtMHn5eVpfqVtq6
 dfUuOKJRMXko4PfzCkP24EayACNWFbX7RhmCxwOCpdZ9xC0CmmC/H7K7Rf31cyiYZt1JjQ
 3zebzYt5ynZSfz0Btt7QgR4a3J/0FiI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-5T7ckk9sPr-37C1Km3Vlmw-1; Fri, 27 Nov 2020 12:41:14 -0500
X-MC-Unique: 5T7ckk9sPr-37C1Km3Vlmw-1
Received: by mail-wr1-f70.google.com with SMTP id b5so3737927wrp.3
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 09:41:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ishc1wMCsn5jgoH1UVBDyCZIG/gh19eG7GoNQWhhP1E=;
 b=a+bokgOAKw3u7euWQF4N/QaEPf5HcGiQjn14iiTGkBWlGLk+drCTeJPPaAVFECQkQf
 oMUpMP7QnGiBkwM1VHc1t8KimWuSE4WyirApj77isEw9XO1BKZlF0tWl0qOxXAWyHd1Y
 osjHRIq9v9JRo8hwJrGQGBVVp2A8huozVZmzSWoaKTk2QAtK7lIzMaXPK42C9bkBfQ4w
 GHxgjVAjhBOh+3JBI8gDDeIH4lPIncgLCVrerwLebGYzFo+0JMk5S9ZgSgWSmKkVE8Nt
 oz6F05F4KKKyYiqLWvVBAjqlTOWLLV/MSmMNbCyWspO3kjjup1Y8vS9Zj2KtlE4enU1T
 k4fg==
X-Gm-Message-State: AOAM532TrFlgHE7gPuiKHKwgI1cS5DBUqMzFhLx/hevNFM/cCQXnkINn
 leRTesQi2DTulW5+keMTwrxUwI5fYZH/yuvxo3NQZGwE/FN7ZIZy+U54iouk1zipBlapwfecgIu
 sCnKgXu/1AuNKxGp5Ez50yIg8/6K7LK+LG1KKx+HTonhRuxwSTGJPXf+GCVPx80o2
X-Received: by 2002:a7b:cb58:: with SMTP id v24mr10166361wmj.23.1606498873079; 
 Fri, 27 Nov 2020 09:41:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJznRcixmPFYQCmfRhbBuIoDMPPl4eax8H2DBunI/eARpkp34smxu88EefqnjV+IrjssA3vmkg==
X-Received: by 2002:a7b:cb58:: with SMTP id v24mr10166338wmj.23.1606498872846; 
 Fri, 27 Nov 2020 09:41:12 -0800 (PST)
Received: from x1w.redhat.com (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id c17sm16184115wro.19.2020.11.27.09.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 09:41:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, Willian Rampazzo <wrampazz@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [RFC PATCH-for-5.2] gitlab-ci: Do not automatically run Avocado
 integration tests anymore
Date: Fri, 27 Nov 2020 18:41:10 +0100
Message-Id: <20201127174110.1932671-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 virt-ci-maint-team@redhat.com, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We lately realized that the Avocado framework was not designed
to be regularly run on CI environments. Therefore, as of 5.2
we deprecate the gitlab-ci jobs using Avocado. To not disrupt
current users, it is possible to keep the current behavior by
setting the QEMU_CI_INTEGRATION_JOBS_PRE_5_2_RELEASE variable
(see [*]).
From now on, using these jobs (or adding new tests to them)
is strongly discouraged.

Tests based on Avocado will be ported to new job schemes during
the next releases, with better documentation and templates.

[*] https://docs.gitlab.com/ee/ci/variables/README.html#create-a-custom-variable-in-the-ui

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.yml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index d0173e82b16..2674407cd13 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -66,6 +66,15 @@ include:
     - cd build
     - python3 -c 'import json; r = json.load(open("tests/results/latest/results.json")); [print(t["logfile"]) for t in r["tests"] if t["status"] not in ("PASS", "SKIP", "CANCEL")]' | xargs cat
     - du -chs ${CI_PROJECT_DIR}/avocado-cache
+  rules:
+  # As of QEMU 5.2, Avocado is not yet ready to run in CI environments, therefore
+  # the jobs based on this template are not run automatically (except if the user
+  # explicitly sets the QEMU_CI_INTEGRATION_JOBS_PRE_5_2_RELEASE environment
+  # variable). Adding new jobs on top of this template is strongly discouraged.
+  - if: $QEMU_CI_INTEGRATION_JOBS_PRE_5_2_RELEASE == null
+    when: manual
+    allow_failure: true
+  - when: always
 
 build-system-ubuntu:
   <<: *native_build_job_definition
-- 
2.26.2


