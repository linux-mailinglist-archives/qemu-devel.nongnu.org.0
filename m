Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DABB32AD5FA
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 13:17:59 +0100 (CET)
Received: from localhost ([::1]:51602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcSb0-0001ai-Uh
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 07:17:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcSZQ-0000FB-99
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 07:16:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcSZO-0000jC-8K
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 07:16:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605010577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hHoxmp0GZU/YhZXxlfHMYBwFYW7GtaO/Gi2jra08+tw=;
 b=WJj7LGhA2OIBwQ5N/H9ZaR+XV/qKhNoGqhN9VB+mH639OxbYqajik02JqPrzDkaU2yxfxc
 wkvvPW97rKt0zZc+gd+F3s6v1hTyoYjjHqHl4bsF4b3dK1XNHjJs9HZTuGMMhqZDhO/6+y
 F6Rc6cMumL1yiHFWz/wp8f6ZZSITw2I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-iyO4n_fANQ2cL3WmWN96ow-1; Tue, 10 Nov 2020 07:16:15 -0500
X-MC-Unique: iyO4n_fANQ2cL3WmWN96ow-1
Received: by mail-wm1-f71.google.com with SMTP id a130so1079582wmf.0
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 04:16:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hHoxmp0GZU/YhZXxlfHMYBwFYW7GtaO/Gi2jra08+tw=;
 b=uhWtApcqd7IK0TCnsiTZDi1Ek+nARpEKO2vhRjqt4lVYYbB4kTpBQxiuxwoME1BKAe
 gJQ7EYthxwJh5vipd0JdSGBoDWjAl+f4kJpsPWpyTnroYELYn0Xw4suMRjdRpiRDctcN
 ARZaQDWxCdjvqkFGd/hX1SzjZ4XsxdUTHAV+gpAXlBATdxgycBLdP+LwoS5EEiyDIauz
 Ass8egfvD64WZ9lwOfOE6S5Pl1n3euVazTVnp+UP8LV6v1OYWLXtvA8YrM9xlrgyiAUU
 P0XTMsICkmpbF5fQumz2WAfiGhS65Gfas8gh/DB0jQcGcp7/vvP8jhFHfBawFDDGIeNW
 nRuA==
X-Gm-Message-State: AOAM530qOd7VvU43c/0YN9d1GUrDdTdBepA9G7HaPz932fTPGcdAfJFB
 q9azR9LTM3UMHb66ub5Z/S56KESpo63C3Ib07ulXYPAHYOdRVKDvfCtdpLSrfuAkWykpb7us3W/
 GhaJL41CMx7l6fKt7bQqLQMQPcWX200XmSjvcEW6z6cxc3JxHbo5OUpgTF9JvRUo1
X-Received: by 2002:adf:a29e:: with SMTP id s30mr25357003wra.29.1605010573603; 
 Tue, 10 Nov 2020 04:16:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyPLOKNs2QqlOodBTN6XxGjPm4TJ1PcbW1fB6nw1uT2dItJxTOHNGG+uqmqHElWl5rp0d+YLA==
X-Received: by 2002:adf:a29e:: with SMTP id s30mr25356969wra.29.1605010573330; 
 Tue, 10 Nov 2020 04:16:13 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id m20sm19094724wrg.81.2020.11.10.04.16.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 04:16:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2 1/2] gitlab-ci: Avoid running the OpenSBI job when not
 necessary
Date: Tue, 10 Nov 2020 13:16:05 +0100
Message-Id: <20201110121606.2792442-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201110121606.2792442-1-philmd@redhat.com>
References: <20201110121606.2792442-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 02:00:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The OpenSBI jobs use the 'changes' keyword, which "makes it
possible to define if a job should be created based on files
modified by a Git push event." (see [*]). This keyword comes
with a warning:

  Caution:

    In pipelines with sources other than the three above
    changes can’t determine if a given file is new or old
    and always returns true."

In commit 922febe2af we moved the YAML config file from the
repository root directory to the .gitlab-ci.d/ directory.

We didn't respect the previous warning and disabled the
'changes' filter rule, as the files are now in a (directory)
three above the YAML config file.

As this job doesn't take much (less than 1min), run it by
default.

[*] https://docs.gitlab.com/ee/ci/yaml/#onlychangesexceptchanges

Fixes: 922febe2af ("Move edk2 and opensbi YAML files to .gitlab-ci.d folder")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/opensbi.yml | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/.gitlab-ci.d/opensbi.yml b/.gitlab-ci.d/opensbi.yml
index 5b13047e2ab..b1fa244fda4 100644
--- a/.gitlab-ci.d/opensbi.yml
+++ b/.gitlab-ci.d/opensbi.yml
@@ -1,10 +1,5 @@
 docker-opensbi:
  stage: containers
- rules: # Only run this job when the Dockerfile is modified
- - changes:
-   - .gitlab-ci.d/opensbi.yml
-   - .gitlab-ci.d/opensbi/Dockerfile
-   when: always
  image: docker:19.03.1
  services:
  - docker:19.03.1-dind
@@ -25,14 +20,6 @@ docker-opensbi:
 
 build-opensbi:
  stage: build
- rules: # Only run this job when ...
- - changes: # ... roms/opensbi/ is modified (submodule updated)
-   - roms/opensbi/*
-   when: always
- - if: '$CI_COMMIT_REF_NAME =~ /^opensbi/' # or the branch/tag starts with 'opensbi'
-   when: always
- - if: '$CI_COMMIT_MESSAGE =~ /opensbi/i' # or last commit description contains 'OpenSBI'
-   when: always
  artifacts:
    paths: # 'artifacts.zip' will contains the following files:
    - pc-bios/opensbi-riscv32-generic-fw_dynamic.bin
-- 
2.26.2


