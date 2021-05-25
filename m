Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD4838FCBD
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 10:27:26 +0200 (CEST)
Received: from localhost ([::1]:54168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llSPM-0005Fo-5K
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 04:27:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llSO6-0003sv-EI
 for qemu-devel@nongnu.org; Tue, 25 May 2021 04:26:06 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:55175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llSO1-00074H-Bw
 for qemu-devel@nongnu.org; Tue, 25 May 2021 04:26:06 -0400
Received: by mail-wm1-x333.google.com with SMTP id o127so16229950wmo.4
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 01:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o1WSZEk8kjuC4uhaNaZcGg8QBuBlPPjh5clU4EME/5M=;
 b=mjv+IIKDukg1bucVJqaeE3Xn7xr3+vSiqVJV/+i4J4TIgD8QWcmZNAuqS3fFYtv30U
 4GfwROFAV3SJ42NYQNWh9WBBuM0aYQocIJx8TlNiU+dcYC++hoSrnyfZQKBrFKPJDY/M
 9Gw3XZ4ap3udzgTkZ9nNKbNRUAcHbNN18Mzcwgz/+zWm8CF31zIJ2YW3D2PkIVigLUCM
 6YK35gJHTqLVZ92humFJENOCUzzHCYpdz35vrxul6BML18znXoayuA8raQZblwdJqQGg
 X+82KfLKpB76nNkllAeGastqyYBANZvmJkVfeI/k6/9h1CUtOJOwDNtzzLDBkLQiom4g
 oNUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=o1WSZEk8kjuC4uhaNaZcGg8QBuBlPPjh5clU4EME/5M=;
 b=jhTOOvroBPY55Onl41bDM1ZH3bylo/h5iernyX5u3Z6bglXbuDwLhRT0Bi2VV+cUKS
 lpGGG35YIH/K7AzfBaKYX8L86aIijp38GavaiJWcAW36WWVhMaV73srjApTquf3C/17Z
 9Nu7EKPtvrQWKWoe5xYTDt0ah8ZGw+odEFmuTooQKaBBIxotvIzsZ+nWkKkFRk1Dt9Xr
 FOYOaU8VCkA6NT3N7n6Zh1p8dMUcaRjb5mhUmBSkRWZ+D5lGjQgsed6xF2NzY4ygY173
 jF+9tEsyDTrH0uF5tnp8Mk4qZ5cqIgXwSrd2xoK3RIFjLi+oyKjgmD7qoqBHkJKuz9Ra
 zYlQ==
X-Gm-Message-State: AOAM533C/WJMnnL/lYnzcGOUOF9nVYVMT8FjC4SPyu+DabwpscoaEJNg
 8QMTIOmzgAMaqKvXpTF+A62r4b4hEAhxVQ==
X-Google-Smtp-Source: ABdhPJwS7GvWpwuD8cXXiCkRKIkCJ5uWRkuRq3N1PdgteSQIk9SXDj7fUVVd8cuvm29kKSuXgYKVTQ==
X-Received: by 2002:a1c:e156:: with SMTP id y83mr2544233wmg.89.1621931159445; 
 Tue, 25 May 2021 01:25:59 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id d14sm8800289wra.5.2021.05.25.01.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 01:25:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/9] gitlab-ci: Make mainstream CI green again
Date: Tue, 25 May 2021 10:25:47 +0200
Message-Id: <20210525082556.4011380-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Various patches to make mainstream CI green again:=0D
=0D
- rebased "gitlab-ci: Ease forks pipeline workflow" on testing-next=0D
- split gprof-gcov job=0D
- run avocado tests manually (except on mainstream)=0D
- fix firmware jobs to only run when files changed=0D
- discard avocado results on success, keep them longer on failures=0D
=0D
Some patches were already sent in different series. I addressed=0D
Thomas / Alex / Daniel comments and included them here as an=0D
omnibus series, hoping it can get queued via Thomas testing-next=0D
tree.=0D
=0D
Based-on: thuth testing-next=0D
https://gitlab.com/thuth/qemu/-/commits/testing-next/=0D
=0D
Alex Benn=C3=A9e (1):=0D
  gitlab-ci: explicitly reference the upstream registry=0D
=0D
Philippe Mathieu-Daud=C3=A9 (8):=0D
  gitlab-ci: Extract all default build/test jobs to buildtest.yml=0D
  gitlab-ci: Move current job set to qemu-project.yml=0D
  gitlab-ci: Document how forks can use different set of jobs=0D
  gitlab-ci: Extract cross-container jobs to container-cross.yml=0D
  gitlab-ci: Split gprof-gcov job=0D
  gitlab-ci: Keep Avocado reports during 1 week=0D
  gitlab-ci: Run Avocado tests manually (except mainstream CI)=0D
  gitlab-ci: Use absolute path and simplify firmware jobs=0D
=0D
 .gitlab-ci.d/buildtest-template.yml |  16 +-=0D
 .gitlab-ci.d/buildtest.yml          | 747 ++++++++++++++++++++++++++=0D
 .gitlab-ci.d/container-cross.yml    | 164 ++++++=0D
 .gitlab-ci.d/container-template.yml |   3 +-=0D
 .gitlab-ci.d/containers.yml         | 166 +-----=0D
 .gitlab-ci.d/edk2.yml               |  11 +-=0D
 .gitlab-ci.d/opensbi.yml            |  11 +-=0D
 .gitlab-ci.d/qemu-project.yml       |  11 +=0D
 .gitlab-ci.yml                      | 780 ++--------------------------=0D
 9 files changed, 987 insertions(+), 922 deletions(-)=0D
 create mode 100644 .gitlab-ci.d/buildtest.yml=0D
 create mode 100644 .gitlab-ci.d/container-cross.yml=0D
 create mode 100644 .gitlab-ci.d/qemu-project.yml=0D
=0D
-- =0D
2.26.3=0D
=0D

