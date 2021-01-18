Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DDE2F9A23
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 07:52:39 +0100 (CET)
Received: from localhost ([::1]:49050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1OP0-0001CC-TA
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 01:52:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l1OCI-0002td-Aj; Mon, 18 Jan 2021 01:39:35 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:34129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l1OCB-0007bH-3W; Mon, 18 Jan 2021 01:39:27 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 460DE16B6;
 Mon, 18 Jan 2021 01:39:19 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 18 Jan 2021 01:39:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=xp8rMS5fYi67I
 zBTztXoRRHYHPvcz6CsxRtqujbiTX8=; b=XRkZhcuwfbvDW9WPlzqGCkZpgCxXo
 Ya7cEM0p3uGKSWcWUe+lpfY7E4j+t/Ip4ts+Vih9+Ym7V8pJqU98FfCIFgjwa9xw
 /kQkhEbnpjj8tZ1wEyDmMAUzee3T0T6YdySmQssumueg5MBII6fH5SmW9tRNRda/
 h3wVxdVY695O7rP7RH6pOu6ap+GFtgOX5HzIfzJKFD5T1H3s+XeAVMRK6EWlgaT3
 nA5rGqLC2Kjg7K9Gn7j0sGzTpJOzBP0mFoXsrFfa0J/23I2eUliBRFa+NmbdThdj
 IYyH5VijUXyYrSauFE3v1Taw3XegnyZFKOGStJRBK/kuOKxhYxGfvgGQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=xp8rMS5fYi67IzBTztXoRRHYHPvcz6CsxRtqujbiTX8=; b=GJpW6OMA
 OhUqFDRpb15U6GX0ZPNwReD2/b3m4gaptaPIBWUCXpVoAEAMAFtgcsDt7qK7VAIV
 96IC7lAbGXh7ZcXAhxHKMvCH+EBJuTbV4CUvPj/4EshTdh5zYWx+F1yxqk18bIUQ
 nFj2mYcGEAfsi6FUriEhRw2WtqM/chpKmrFGM6/3NcZM2LOcDKB0jYd1+nJaFash
 cgvVC50ZDUcWHCRYm0oEVlPEUU/TSgyCvywHJkEqVaQcJqk193QnlVCl47Jrbd6q
 Gb369STdGyYzopKxavO1oWh9BXGh4rbro6sebIX/2vj0qABh7hyxyr9wcItTmiUh
 wLDoWim57UP5tg==
X-ME-Sender: <xms:Fi0FYK79gFPV_Y-8OLeI4LB_mcQRAjI3uNTBVm1Kmq6pcSsPRoremQ>
 <xme:Fi0FYD5zNHo8oAuacHYEtimpGnrFYKcuomvbRGBrCtwKVIUZhXcuZ93rnPsJqzieT
 23DP3gKXrdvW4jdFqM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdejgdeliecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheplfhirgiguhhn
 ucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenucggtf
 frrghtthgvrhhnpeejiefhgfetleekleffudektdehvedujedvgeekkeejfefhhffhtedu
 tefgtdffueenucfkphepudduiedrvddvkedrkeegrddvnecuvehluhhsthgvrhfuihiivg
 epfeenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihg
 ohgrthdrtghomh
X-ME-Proxy: <xmx:Fi0FYJcdZyCEaydEtjSY3UhyuZY6ZBagLJ6Gz9A4TpYjeAZoYVrt-A>
 <xmx:Fi0FYHKvlO5Ac5pdlI7kgZfcdNmZokVr4cAYlv2yBLntqurgb0I6EQ>
 <xmx:Fi0FYOLjSgBNXJM1ArpoH4VhuBugq81wAHryRyCbA0tPbmICtenGfQ>
 <xmx:Fi0FYD66NSDWoMTHgOES0DwHlT44gIuHwL_d5y5t3oVo4cTMZu5YxaUcAGtdgu8w>
Received: from strike.U-LINK.com (unknown [116.228.84.2])
 by mail.messagingengine.com (Postfix) with ESMTPA id EE8D9240062;
 Mon, 18 Jan 2021 01:39:11 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 9/9] gitlab-ci: Add alpine to pipeline
Date: Mon, 18 Jan 2021 14:38:08 +0800
Message-Id: <20210118063808.12471-10-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210118063808.12471-1-jiaxun.yang@flygoat.com>
References: <20210118063808.12471-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.18;
 envelope-from=jiaxun.yang@flygoat.com; helo=wnew4-smtp.messagingengine.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>, kvm@vger.kernel.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We only run build test and check-acceptance as their are too many
failures in checks due to minor string mismatch.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 .gitlab-ci.d/containers.yml |  5 +++++
 .gitlab-ci.yml              | 23 +++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index 910754a699..90fac85ce4 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -28,6 +28,11 @@
     - if: '$CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH'
     - if: '$CI_COMMIT_REF_NAME == "testing/next"'
 
+amd64-alpine-container:
+  <<: *container_job_definition
+  variables:
+    NAME: alpine
+
 amd64-centos7-container:
   <<: *container_job_definition
   variables:
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 4532f1718a..6cc922aedb 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -72,6 +72,29 @@ include:
     - cd build
     - du -chs ${CI_PROJECT_DIR}/avocado-cache
 
+build-system-alpine:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: alpine
+    TARGETS: aarch64-softmmu alpha-softmmu cris-softmmu hppa-softmmu
+      moxie-softmmu microblazeel-softmmu mips64el-softmmu
+    MAKE_CHECK_ARGS: check-build
+    CONFIGURE_ARGS: --enable-docs
+  artifacts:
+    expire_in: 2 days
+    paths:
+      - build
+
+acceptance-system-alpine:
+  <<: *native_test_job_definition
+  needs:
+    - job: build-system-alpine
+      artifacts: true
+  variables:
+    IMAGE: alpine
+    MAKE_CHECK_ARGS: check-acceptance
+  <<: *acceptance_definition
+
 build-system-ubuntu:
   <<: *native_build_job_definition
   variables:
-- 
2.30.0


