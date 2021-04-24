Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B9F36A220
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:32:07 +0200 (CEST)
Received: from localhost ([::1]:43794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laLCQ-0002HQ-8Q
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:32:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKiS-0005dK-SP
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:11 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:46655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKi4-0004Fw-7f
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:04 -0400
Received: by mail-il1-x132.google.com with SMTP id l19so2612357ilk.13
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 09:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yc0G57w66B+c5dfyiTCbs3UapbbpPr/2pow6STVVxmI=;
 b=vSk5ScBBMmlB/aYZ5hsTgIgt60Sr7jWkIGUYv91d8HhCkbx+RDKugB8jwk2TX9mc38
 1eM/bCKhNgjrk4ado5ObMY3Lgp7eL9l/NbspP7tEpvOf02c9Lv/Ns0AW7UG0pJr0ld8P
 iawaJGWp2uc6OpbVp3gA87sYsOJ5b0WZDSMjbBPvLcUqr6yM8NEZP02LB8bN7wsM9fz4
 JX9qS3JN5z1Rqy/uJLnN4Ikvzoc1237LdCQu6wFueT62nJriz4pOKHty6C0rrTaOihyz
 v07DtJOXdHUXo352cMW47Pzj3NyxLnN2dA45eu3EO1kqSfkeBcae/4S+5O89JEGybfFD
 eqHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yc0G57w66B+c5dfyiTCbs3UapbbpPr/2pow6STVVxmI=;
 b=tTA6X++SQ2/5nSLd74OQrwxjvfLtjBpeW5KkOP/1/+lZjMNBRCZLGE/HooUedGuh0p
 P8bd+oN/XLj26rOvu63atWuo42MnCcMl9MDyR/Du+Jddx/NSyKyB72EsukenoIPpFLBD
 WSuEuqOZjpsNumiMaLitgfUOz2FHgr/MUSjSDnbBO0tphVWsoVH3uB9RbncTVSslU3WZ
 mmMVw2P0CF25Ao8tbCBiR5SYtD4RnibKYgUFi29Y7WAWsz2l2o1FnqhoZatwwfBVLsft
 vKWFfsbonSzAcrkdhnVUNY5eaubF0D4k2eZd/cLrSr1IfH2sDj1vPqk8jKTGrgtp18Vz
 dn1g==
X-Gm-Message-State: AOAM532fLN5RogsTZ1jgT8HF0j+YCEMGa0JMjJu8S8i1aJmtmGVIhVnn
 SNrOn6ciNPe5tPwNuUv+Mx79g2Q8py3fbzqN
X-Google-Smtp-Source: ABdhPJzZEMZUbZDQWM53YAEAQZ0dTMZcxJhifNcarCCpOdW0MmligpaVpx1ygjLwEYHU+6RZF7b1GA==
X-Received: by 2002:a92:dd0e:: with SMTP id n14mr1301955ilm.117.1619280042226; 
 Sat, 24 Apr 2021 09:00:42 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h4sm4055901ili.52.2021.04.24.09.00.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Apr 2021 09:00:41 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 19/48] bsd-user: style tweak: move extern to header file
Date: Sat, 24 Apr 2021 09:59:47 -0600
Message-Id: <20210424160016.15200-20-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210424160016.15200-1-imp@bsdimp.com>
References: <20210424160016.15200-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::132;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x132.google.com
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
 arichardson@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

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
index 60a62e016a..1b5d815c3a 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -48,7 +48,6 @@ unsigned long reserved_va;
 
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


