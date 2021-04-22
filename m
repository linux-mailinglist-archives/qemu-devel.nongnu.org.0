Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9787636842C
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 17:47:30 +0200 (CEST)
Received: from localhost ([::1]:49176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZbY9-0007qq-Kd
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 11:47:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lZbVY-0006Zh-01
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 11:44:48 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:41682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lZbVV-0007xC-DG
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 11:44:47 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 o21-20020a1c4d150000b029012e52898006so3407248wmh.0
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 08:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uzZIQ50+pZQHOgg2g/YhSMmO1xishINik1PAxAzUmcY=;
 b=KIndjPWGVj32rzSuk95RiyOWjw9hK6pa47pM4uYhOl3IPGjMCzft1w+09lVW6IMHIy
 +WNUvCGC+xiTVJTWXne/0JoKsl8AroMuug3rPypG6Jri65aYzmikK5yZIh3to6Qv/ZnP
 y/HJYUMWI350R1a+pWa104qOn5PK+QDTk8LEZikhK2aVumx5MuDR6Ky1f/xCs1N9AeD7
 Y+TJi+hi0JJD1ev2/GAWfikWJBAXAPr5E1aYTYlvaZsTrnNVNIIX+ckg9J49FCUF2dH/
 rGAON/ygqYVm/yvXk0Ovso/l6tDzoULiadteY0qoDgH4dNF7+/a9NUNycchm0+JfRT2r
 eFBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uzZIQ50+pZQHOgg2g/YhSMmO1xishINik1PAxAzUmcY=;
 b=X+zuksU87VQyfZj+l+u8X0DJmKnisXHusspmnrUUi4EBtpOfhkNjt/HpL3bLcxbq9M
 AtAONjWJrK5Ip5IwFT6Wma6/Kyr96iGasEd3pFjaBW3h7oY4MsjDBdLisrUnICgQLxZd
 co7LX6pJ6OqRe8omW2rkqt4oLJrGbeK+x+5QGN6Ls0/esYDCqciJwfxOBrUIBvaA9DLb
 0enu99EVuSf0TrEXPSa92LZRcCRbPbK47Eb21s5mxSR1WAuk8wNDNnqIFku6pS4xjOqZ
 m0JD6c/sIq/DkxzBE3rzqCfzQYf/kDkuiGxJzPZXlVHRn5uw70j6pTYIJyTWClikDz57
 zZjQ==
X-Gm-Message-State: AOAM5307sDQxqCgOU273EV2KzC3LftLINsLFVNLDZ5cklF3DplT/2/4b
 y9fASPg+yxx+sPnFZfWqHIp7YGOmE7tisA==
X-Google-Smtp-Source: ABdhPJyyyuMbzPdqREpeVHySLKF8RrO4I6++iLT3s5vppZHAEiA9hJ6yMCrDvhQdRNJXoG+rpeGmGA==
X-Received: by 2002:a1c:7515:: with SMTP id o21mr4483277wmc.90.1619106283542; 
 Thu, 22 Apr 2021 08:44:43 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s8sm4273416wrn.97.2021.04.22.08.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 08:44:42 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 361B21FF7E;
 Thu, 22 Apr 2021 16:44:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/s390x: fix s390_probe_access to check PAGE_WRITE_ORG
 for writeability
Date: Thu, 22 Apr 2021 16:44:27 +0100
Message-Id: <20210422154427.13038-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, f4bug@amsat.org,
 Laurent Vivier <laurent@vivier.eu>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can remove PAGE_WRITE when (internally) marking a page read-only
because it contains translated code. This can get confused when we are
executing signal return code on signal stacks.

Fixes: e56552cf07 ("target/s390x: Implement the MVPG condition-code-option bit")
Found-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Laurent Vivier <laurent@vivier.eu>
---
 target/s390x/mem_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
index 12e84a4285..f6a7d29273 100644
--- a/target/s390x/mem_helper.c
+++ b/target/s390x/mem_helper.c
@@ -145,7 +145,7 @@ static int s390_probe_access(CPUArchState *env, target_ulong addr, int size,
 
 #if defined(CONFIG_USER_ONLY)
     flags = page_get_flags(addr);
-    if (!(flags & (access_type == MMU_DATA_LOAD ?  PAGE_READ : PAGE_WRITE))) {
+    if (!(flags & (access_type == MMU_DATA_LOAD ?  PAGE_READ : PAGE_WRITE_ORG))) {
         env->__excp_addr = addr;
         flags = (flags & PAGE_VALID) ? PGM_PROTECTION : PGM_ADDRESSING;
         if (nonfault) {
-- 
2.20.1


