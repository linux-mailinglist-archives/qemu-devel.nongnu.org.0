Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 295045499C8
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 19:22:11 +0200 (CEST)
Received: from localhost ([::1]:56134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0nlS-0005DK-8d
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 13:22:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o0ncq-0001Md-WF
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 13:13:17 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:35578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o0ncm-0006xO-8n
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 13:13:14 -0400
Received: by mail-ej1-x634.google.com with SMTP id me5so12462893ejb.2
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 10:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rZddIaoLD/ZTyoHMOhubaxrRGzNsR1qnEvTVtIqOZCA=;
 b=BA4PzvyvmRJQpxJKJDnlGReoQ426i0P6qPFLdKKB+NMNy1VkZWfke6kpqh1AcqsRT8
 G+Sxtzc6mPOS+tRuKUIeF9Mzu3X3l4laI6K4DmaH3VB6BlELAcnV0p+5x6bNl0c7gYrR
 yAc7LaEJOa3TlWzKWJtkaexWDQEmrgCteXK7mLQhfDgAiJM13opZm9MT7PFkl/ij40Sb
 Wmfs7fySIHl6oxx6OEDrh/fcObSLWASNRR9LUTjMk7upETEu2scC4h5snM+9LGadjKX/
 w4c1Ni9p2MetJiVT1ZOfnD9FxiHrYwyjL+tY1aubUZf4vA3rBvDHLCPTTyb/yleC+zKK
 IiJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rZddIaoLD/ZTyoHMOhubaxrRGzNsR1qnEvTVtIqOZCA=;
 b=5RWfUB+qAFA/bTWvjMw2cK6qiuKY17XfscxHf4FXuUBiTceekdBRMOpMhAjVdV9uSG
 N11DJN38gELf4qofvsLSxACU4Hpu5StacrAu2EhOIqKoZ5bI1XLVY4czfmZV7bqbvqTF
 K3EF1mQcZl8scZmgERu5xM4wlq7sQDv6K+zhDVifbaM/hRBrH43eIV/y+kui60gqM71Y
 rAn3VvIVl6cPif1WMca43o+YLeLDHd61Uo0xRA9BLEZ4HDUGauZcgsJ0hxherPeiHkMe
 qE+N2H30u/EMJa5fDwqNFEjx/Ga+ABA2pO9sdxoBUYRU0nGQo1CgCpDnLNujnWI2t3tt
 BUyw==
X-Gm-Message-State: AOAM531d5BMBLTCyT+xgsIEdljt7e+6N0LQ++kSNmEeY0k+V4sMjurI3
 jIblnC+w7QtBFfD9QSjLiNY03g==
X-Google-Smtp-Source: ABdhPJxeJuxRwVDnYXMcpe3Bctj79PoY3snKACyVRBB3ab3d1C0mrLCeD7XDeyGFypiruTaXXiucuQ==
X-Received: by 2002:a17:906:7308:b0:710:dabe:d651 with SMTP id
 di8-20020a170906730800b00710dabed651mr730115ejc.75.1655140390904; 
 Mon, 13 Jun 2022 10:13:10 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 v24-20020a170906859800b007120e9573b4sm4045901ejx.169.2022.06.13.10.13.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 10:13:06 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 88FD81FFBF;
 Mon, 13 Jun 2022 18:12:59 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v1 7/7] .gitlab: use less aggressive nproc on our aarch64/32
 runners
Date: Mon, 13 Jun 2022 18:12:58 +0100
Message-Id: <20220613171258.1905715-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220613171258.1905715-1-alex.bennee@linaro.org>
References: <20220613171258.1905715-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Running on all 80 cores of our aarch64 runner does occasionally
trigger a race condition which fails the build. However the CI system
is not the time and place to play with much heisenbugs so turn down
the nproc to "only" use 40 cores in the build.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .../custom-runners/ubuntu-20.04-aarch32.yml   |  4 ++--
 .../custom-runners/ubuntu-20.04-aarch64.yml   | 24 +++++++++----------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch32.yml b/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch32.yml
index 47856ac53c..1998460d06 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch32.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch32.yml
@@ -19,5 +19,5 @@ ubuntu-20.04-aarch32-all:
  - mkdir build
  - cd build
  - ../configure --cross-prefix=arm-linux-gnueabihf-
- - make --output-sync -j`nproc`
- - make --output-sync -j`nproc` check V=1
+ - make --output-sync -j`nproc --ignore=40`
+ - make --output-sync -j`nproc --ignore=40` check V=1
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml b/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
index 951e490db1..65718a188a 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
@@ -17,9 +17,9 @@ ubuntu-20.04-aarch64-all-linux-static:
  - mkdir build
  - cd build
  - ../configure --enable-debug --static --disable-system --disable-glusterfs --disable-libssh
- - make --output-sync -j`nproc`
- - make --output-sync -j`nproc` check V=1
- - make --output-sync -j`nproc` check-tcg V=1
+ - make --output-sync -j`nproc --ignore=40`
+ - make --output-sync -j`nproc --ignore=40` check V=1
+ - make --output-sync -j`nproc --ignore=40` check-tcg V=1
 
 ubuntu-20.04-aarch64-all:
  needs: []
@@ -38,8 +38,8 @@ ubuntu-20.04-aarch64-all:
  - mkdir build
  - cd build
  - ../configure --disable-libssh
- - make --output-sync -j`nproc`
- - make --output-sync -j`nproc` check V=1
+ - make --output-sync -j`nproc --ignore=40`
+ - make --output-sync -j`nproc --ignore=40` check V=1
 
 ubuntu-20.04-aarch64-alldbg:
  needs: []
@@ -55,8 +55,8 @@ ubuntu-20.04-aarch64-alldbg:
  - cd build
  - ../configure --enable-debug --disable-libssh
  - make clean
- - make --output-sync -j`nproc`
- - make --output-sync -j`nproc` check V=1
+ - make --output-sync -j`nproc --ignore=40`
+ - make --output-sync -j`nproc --ignore=40` check V=1
 
 ubuntu-20.04-aarch64-clang:
  needs: []
@@ -75,8 +75,8 @@ ubuntu-20.04-aarch64-clang:
  - mkdir build
  - cd build
  - ../configure --disable-libssh --cc=clang-10 --cxx=clang++-10 --enable-sanitizers
- - make --output-sync -j`nproc`
- - make --output-sync -j`nproc` check V=1
+ - make --output-sync -j`nproc --ignore=40`
+ - make --output-sync -j`nproc --ignore=40` check V=1
 
 ubuntu-20.04-aarch64-tci:
  needs: []
@@ -95,7 +95,7 @@ ubuntu-20.04-aarch64-tci:
  - mkdir build
  - cd build
  - ../configure --disable-libssh --enable-tcg-interpreter
- - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc --ignore=40`
 
 ubuntu-20.04-aarch64-notcg:
  needs: []
@@ -114,5 +114,5 @@ ubuntu-20.04-aarch64-notcg:
  - mkdir build
  - cd build
  - ../configure --disable-libssh --disable-tcg
- - make --output-sync -j`nproc`
- - make --output-sync -j`nproc` check V=1
+ - make --output-sync -j`nproc --ignore=40`
+ - make --output-sync -j`nproc --ignore=40` check V=1
-- 
2.30.2


