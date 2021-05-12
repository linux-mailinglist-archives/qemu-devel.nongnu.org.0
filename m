Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A8B37CFE2
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 19:35:39 +0200 (CEST)
Received: from localhost ([::1]:40176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgslm-0003Ue-2f
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 13:35:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lgsUR-00077H-PW
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:17:45 -0400
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:40610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lgsUJ-0008JM-P7
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:17:40 -0400
Received: by mail-il1-x134.google.com with SMTP id h6so20790626ila.7
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 10:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RLFKyjP117rAyI8j9vqpxACizdyhUGbM8QMFz1tkXdA=;
 b=Sg6QPJHjHbb+9wZ90Jprk5cczTe4r7zhF856OyWFGEpbBSYrERlUAcc+c6ZjNuNqcu
 6Phkscwbhi8dudOsZX80OQGUfmsD051HNp6NQ5UatrUk3wEfrPA1Jn3CmZ82pMkleQk7
 hwRnurQWY51fjWpqBr32tISNPXqY0TPO8OwrpYYTz6I175Z9rSwzKYBnwvDJ7xWwh2w2
 p7gffSOvkC+zuZMIqWJQ6Q5eACeQoeTPJ0/cY8eY4VtQT606oTy2n+dWl5TvCPx8TOs8
 G3Ljg0tstGrb5bWk38Ir0Bfmw3Qw7rWtz02rE0rc3k+I8Zah0VpEnN34VdkpAFI2HX8D
 Ndew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RLFKyjP117rAyI8j9vqpxACizdyhUGbM8QMFz1tkXdA=;
 b=TIVEAQa3FYsGudoKdL+EY0E3A4tZDR56S1h3a3cpJBPhd5mq5Bjevi4hksgwlo3v3A
 zXuHSNUksqw259mMq6UJ5hk33MlKMYeJL3rnFZovmiwebcXJ7m2RMEBcDKzUc+fSyexM
 +M/S4l87Km7igbRf/xeCcWheCtStPUY5WYHpm/qrYLola2CW52rKEKgyHM+pvMGh0LHG
 pA2aDYKDiDdVK6Kyj/OIRGkGy+BMD25rD/ms80W9Nfle8CVmsn5/3VRtjkVJf0sjD+GI
 QBuDULgEpy0bsYZWvR2/qFzu4plHeLtUIv901/OFk69XlznIF6QrPmV6nuOkOJTguDB1
 OTcQ==
X-Gm-Message-State: AOAM5330ukNQMhhB/DAIue4myoh2QpqF75c4uwkq16hbLsvZveVY/61f
 7Nw7w04sD8iakA07/u2W0g94ufLyDsHgYQ==
X-Google-Smtp-Source: ABdhPJwxr/vr9rL3Uu0+/4P3hWP6x6zx4GRz6RVP2ui2u8Q0I+UzP7JgSPZpynYNGKOrrcRvMvyg5w==
X-Received: by 2002:a92:cb51:: with SMTP id f17mr33452645ilq.119.1620839853728; 
 Wed, 12 May 2021 10:17:33 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id d2sm192064ile.18.2021.05.12.10.17.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 May 2021 10:17:33 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/20] bsd-user: style tweak: move extern to header file
Date: Wed, 12 May 2021 11:17:06 -0600
Message-Id: <20210512171720.46744-7-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210512171720.46744-1-imp@bsdimp.com>
References: <20210512171720.46744-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::134;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x134.google.com
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

extern char **environ has no standard home, so move the declaration from the .c
file to a handy .h file. Since this is a standard, old-school UNIX interface
dating from the 5th edition, it's not quite the same issue that the rule is
supposed to protect against, though.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/main.c | 1 -
 bsd-user/qemu.h | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index cd1c26516b..71bfe17f38 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -47,7 +47,6 @@ unsigned long reserved_va;
 
 static const char *interp_prefix = CONFIG_QEMU_INTERP_PREFIX;
 const char *qemu_uname_release;
-extern char **environ;
 enum BSDType bsd_type;
 
 /*
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 7ccc8ad397..5a82722281 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -27,6 +27,8 @@
 
 #include "exec/user/abitypes.h"
 
+extern char **environ;
+
 enum BSDType {
     target_freebsd,
     target_netbsd,
-- 
2.22.1


