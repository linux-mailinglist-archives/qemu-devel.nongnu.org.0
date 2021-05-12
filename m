Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 877D337D094
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 19:42:39 +0200 (CEST)
Received: from localhost ([::1]:59250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgssY-00080c-J0
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 13:42:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lgsUh-0007QK-3Z
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:17:59 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:33533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lgsUV-0008NP-E0
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:17:58 -0400
Received: by mail-io1-xd2e.google.com with SMTP id a11so22396709ioo.0
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 10:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dpPy8lhuqjxSmBaq/swlFjptC79bOmZiRmqH9jnLUiw=;
 b=wLe9MHDY1MXHZCe+AotSsYfEXJEuVMZKejSRa6YySQT7M9lCu2KYFrlWziplFDw8gj
 5RTOrVioLoHX7OCdVB53+z9NsBLODZbMn9YTarytlTbT2IPJoHeEe/oLFuQr4L2I+Ohk
 k33PVwvGVJM83LaQ06DW+MbcH9xOO7B6n5qREELHF+35vFAaQVl0DbfsmWseVUtQ2Xw4
 cyAMWEB0YNgUuS47fB/b2ZtPFzF04XXeBCTQMytDT7hb/bdNJzjUESzh7Jm5haO8DUTg
 aDo8DlUxSUYwiBeW2f0H5nxtpuoeo5NM7GW6VFU47lfTAdgdzivkSR7om5N0b6FeKQmQ
 tlaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dpPy8lhuqjxSmBaq/swlFjptC79bOmZiRmqH9jnLUiw=;
 b=rNM5gR54Jja/8nty7MLGhADwpqttg6kVxfDbwHIixSWA8zXnoSOXcjK9b0J49qQjr0
 SR8kNXPppsE8cmmH3DJZn+MAji04qK/XmkRn067PeP/tvoXDElorV0EfpYrbJRxxqhsN
 vXXewK4zh33Z9AMWqymrXHfIRbQFxb37cOg2k/P/c8EYwI6w5k3wv2qemuGTNC7Tln28
 Y2r8rwcgLhAdLWlmDcVJ8RR1zYvddAEAb69Yh5Gz3cqrWNsIZWur69ML8Re6hQYJVNyS
 dhQ13pMIziPnjHdbeU5jhX6jZz5qEwkho8ZCMC+tHJ5UqS6tlevt6+wpFThimEa5RKhp
 9O5Q==
X-Gm-Message-State: AOAM532GzEuxNDIGbOeLGa4rwBZyiR//l33R8bSNmMFpfe6J05PAeisf
 jm/355/tHk3RMX6Wv+i0goSh83pH6C+s2g==
X-Google-Smtp-Source: ABdhPJwkrjoTbHXNtSNSQOEXp1YIyF9mpFy4u3qggxMyrXynxUPO1PXLWdyhJjVRrwuandJgJAbbPg==
X-Received: by 2002:a5e:8305:: with SMTP id x5mr26727715iom.112.1620839865800; 
 Wed, 12 May 2021 10:17:45 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id d2sm192064ile.18.2021.05.12.10.17.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 May 2021 10:17:45 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/20] bsd-user: Stop building the sparc targets
Date: Wed, 12 May 2021 11:17:19 -0600
Message-Id: <20210512171720.46744-20-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210512171720.46744-1-imp@bsdimp.com>
References: <20210512171720.46744-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The forked bsd-user tree doesn't really support these targets.  They aren't
functional at the moment anyway. Remove them from the build so that the major
reorg patch series can focus on one platform (x86) before adding addition
platforms once things are shuffled. This should make it easier to review and
satisfy that all revisions of a patch series are buildable.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 default-configs/targets/sparc-bsd-user.mak   | 3 ---
 default-configs/targets/sparc64-bsd-user.mak | 4 ----
 2 files changed, 7 deletions(-)
 delete mode 100644 default-configs/targets/sparc-bsd-user.mak
 delete mode 100644 default-configs/targets/sparc64-bsd-user.mak

diff --git a/default-configs/targets/sparc-bsd-user.mak b/default-configs/targets/sparc-bsd-user.mak
deleted file mode 100644
index 9ba3d7b07f..0000000000
--- a/default-configs/targets/sparc-bsd-user.mak
+++ /dev/null
@@ -1,3 +0,0 @@
-TARGET_ARCH=sparc
-TARGET_ALIGNED_ONLY=y
-TARGET_WORDS_BIGENDIAN=y
diff --git a/default-configs/targets/sparc64-bsd-user.mak b/default-configs/targets/sparc64-bsd-user.mak
deleted file mode 100644
index 8dd3217800..0000000000
--- a/default-configs/targets/sparc64-bsd-user.mak
+++ /dev/null
@@ -1,4 +0,0 @@
-TARGET_ARCH=sparc64
-TARGET_BASE_ARCH=sparc
-TARGET_ALIGNED_ONLY=y
-TARGET_WORDS_BIGENDIAN=y
-- 
2.22.1


