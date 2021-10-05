Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA2B423291
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 23:01:11 +0200 (CEST)
Received: from localhost ([::1]:56696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXrYj-0007qe-QV
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 17:01:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mXrWV-00075j-Oz
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 16:58:51 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:36592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mXrWU-0000sc-Aj
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 16:58:51 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 qe4-20020a17090b4f8400b0019f663cfcd1so2948683pjb.1
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 13:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5XAy4YsWus8FfAFYX1y3USl0r6bCXnIlOl2XDnaB3ks=;
 b=WtVRWag80uzdFhIZnSlga7jqbPzKDBCbeLND6Je0Enbo76YoYy2M6Fu54ytdPPrOE+
 27PA2K+O48XmBsJOlWNrie9vFtf1un8EKq7qMll4ypXqR+WU499MNsv7AJtsPYRpea2L
 HxAsBsYvw9nPuWWwAf0TLF0PKkiEIPUxiRcCqqjNzesNG8s21/J+AKafMwN4Z/QpT8nP
 4b+aw2RGGGiYZp9fvl21FEOcZoxBXyCu+ZkRFLDtyZr7dTXmSK0z07c8BLIBTD0bFWoc
 edblaYd1jGLEMcqKTzkvl5pR3Y8VEjwQEBZ/o+JFTgHrWzfERgfBel20HHwVG2GhOABY
 PIjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5XAy4YsWus8FfAFYX1y3USl0r6bCXnIlOl2XDnaB3ks=;
 b=yytcW8+wPSIL6tyCZmvjy2LGdjLMS9t3uJNd68rgvuSE0yJRKBCuq9d/zQAIMBcEsK
 oaPhveEEwA3ucOblIBI1sdmCWSYackEjfqVaGD9fBxA1t87IbhWUo33VHvlRTpp5AsCd
 bLMPfV4edanvBYQHwy63QxTRmHmsnwpn2t6SFBXZ5XylPPwz7ojoCbIlCaJucUy2GYC2
 uvE0YjjQXdnC9Q4xxartdf/lHaUVWAZJMzuCYvr0K2JsFTlWrnwri2K3WhK9Xme7etkN
 KtepBSflxjpw5DgYCS7bP/J3oJY/KOFbUT5pJDUG+ZMgIsLxc39IwlkRZq6pODUaMy8U
 BRfQ==
X-Gm-Message-State: AOAM530sNjVqG+hlNm/UPDwaafeoYU7IAK5SU5h/EjClQz1upnWOVUTa
 moTF6idQsMX4LiSu+D5HzL+G8/PNsTVqcg==
X-Google-Smtp-Source: ABdhPJxi/3yj0bJMi8b9s2c/48dyfW2UOukclRx8e7TPyqjjP2Wvv0xMtA6c40rtuJBbohH8LOLHfg==
X-Received: by 2002:a17:90a:4091:: with SMTP id
 l17mr6380296pjg.138.1633467528346; 
 Tue, 05 Oct 2021 13:58:48 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y8sm18949095pfe.217.2021.10.05.13.58.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 13:58:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/docker/dockerfiles: Bump fedora-i386-cross to fedora 34
Date: Tue,  5 Oct 2021 13:58:46 -0700
Message-Id: <20211005205846.153724-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For unknown and unrepeatable reasons, the cross-i386-tci test has
started failing.  "Fix" this by updating the container to use fedora 34.

Add sysprof-capture-devel as a new dependency of glib2-devel that
was not correctly spelled out in the rpm rules.

Use dnf update Just In Case -- there are presently out-of-date
packages in the upstream docker registry.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/docker/dockerfiles/fedora-i386-cross.docker | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/docker/dockerfiles/fedora-i386-cross.docker b/tests/docker/dockerfiles/fedora-i386-cross.docker
index 820740d5be..f62a71ce22 100644
--- a/tests/docker/dockerfiles/fedora-i386-cross.docker
+++ b/tests/docker/dockerfiles/fedora-i386-cross.docker
@@ -1,4 +1,5 @@
-FROM registry.fedoraproject.org/fedora:33
+FROM registry.fedoraproject.org/fedora:34
+
 ENV PACKAGES \
     bzip2 \
     ccache \
@@ -20,10 +21,11 @@ ENV PACKAGES \
     pcre-devel.i686 \
     perl-Test-Harness \
     pixman-devel.i686 \
+    sysprof-capture-devel.i686 \
     zlib-devel.i686
 
 ENV QEMU_CONFIGURE_OPTS --cpu=i386 --disable-vhost-user
 ENV PKG_CONFIG_LIBDIR /usr/lib/pkgconfig
 
-RUN dnf install -y $PACKAGES
+RUN dnf update -y && dnf install -y $PACKAGES
 RUN rpm -q $PACKAGES | sort > /packages.txt
-- 
2.25.1


