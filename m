Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE174C5719
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 18:20:32 +0100 (CET)
Received: from localhost ([::1]:35744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nO0kB-00067D-CD
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 12:20:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nO0XW-0008J0-JZ
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 12:07:26 -0500
Received: from [2607:f8b0:4864:20::d2b] (port=44706
 helo=mail-io1-xd2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nO0XQ-0000Q9-To
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 12:07:25 -0500
Received: by mail-io1-xd2b.google.com with SMTP id h16so10147511iol.11
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 09:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0W7CyGd+wltyjsV4bxtaXkJoEqxgaZms/OXr5iQpEmE=;
 b=pCKpbvFG84XhFi1icT9yGplBeEYFOb4YkBzfC801APJnkkFVOh4Q4/AxvrgsMp+kvr
 Xp0WFsOh62nMJYbtHAZFUdwysKQYYRJOII1qGhHdpikdvnBfOV+t+Nyv5Xax3W7TNZy+
 fUz9OGMQSVDaNVJQmNT5GGcSihVqLWnjFl0h36kiWUcu0X1ueCwJryRkwnifJgE+Wosj
 yZKshWVwWrntVxJALFF3ONNNgEwVjhnuDGtGZyNAsOmt9fgr6O0eu52Ddp8+nfkkrL55
 jzQn2A3KX5uhNdcpal8gdx2xO3vKl7x2nCeen1dgylE3kVI0unaTXUlAFMdzttG8fCiz
 VbYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0W7CyGd+wltyjsV4bxtaXkJoEqxgaZms/OXr5iQpEmE=;
 b=YjaXSkRBTabETTes0F4LKD1ltV7sd/EZrBXJhJXV5iv5MFGh4eReA1JFkZsfjpJbQN
 rLmKDLf/AK89KS6xo8bFUQWDT4XXy9KuDDTJH510dr23R0oc2aHFZAzr1LJNZDrxyW8G
 ZLqwLQKtb4odTTzWKgVgKfIKOeN0U5+CNmMC/D8E69LuF/m74UvyfhO0dhuIZ4s6z9Th
 rm69Sa3L95yS7xHD3Yn1qJlE1M3sJOsJfyZsw7WThrGPrv+G6xZcGTcTMRQue/eVnn82
 s1DpAyD7u1ub//jmY4SXBI/eVzjJeE+RGi/okKiiGj+iTK7D71sM1okrpDJVa2RZH/Ft
 Idjg==
X-Gm-Message-State: AOAM531QonryiGDSpQAvwiCktOr0awPilcRizE1Cgh6RTO+oDKrR6JVf
 h9I4BWsZEUnbr2jrM2dKtEpvAt8hbmIuLg==
X-Google-Smtp-Source: ABdhPJweasE5iNYOH7TGeRJSfQdFxrQrBRWCpIvHKnVkeGLM+EPCtZKS3CtoSatiI3g6vPxbr1I8Pw==
X-Received: by 2002:a6b:b704:0:b0:611:55c2:b2c7 with SMTP id
 h4-20020a6bb704000000b0061155c2b2c7mr9623939iof.12.1645895239639; 
 Sat, 26 Feb 2022 09:07:19 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 e23-20020a6b5017000000b00635b8032d45sm3138764iob.22.2022.02.26.09.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 09:07:19 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/16] bsd-user/x86_64/target_arch_thread.h: Assume a
 FreeBSD target
Date: Sat, 26 Feb 2022 10:07:35 -0700
Message-Id: <20220226170744.76615-8-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220226170744.76615-1-imp@bsdimp.com>
References: <20220226170744.76615-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2b
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2b.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, arrowd@FreeBSD.org,
 Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since we can't run on anything else, assume for the moment that this is
a FreeBSD target. In the future, we'll need to handle this properly via
some include file in bsd-user/*bsd/x86_64/mumble.h. There's a number of
other diffs that would be needed to make things work on OtherBSD, so it
doesn't make sense to preseve this one detail today.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/x86_64/target_arch_thread.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/bsd-user/x86_64/target_arch_thread.h b/bsd-user/x86_64/target_arch_thread.h
index d105e43fd35..b745d7ffeb7 100644
--- a/bsd-user/x86_64/target_arch_thread.h
+++ b/bsd-user/x86_64/target_arch_thread.h
@@ -32,9 +32,7 @@ static inline void target_thread_init(struct target_pt_regs *regs,
     regs->rax = 0;
     regs->rsp = infop->start_stack;
     regs->rip = infop->entry;
-    if (bsd_type == target_freebsd) {
-        regs->rdi = infop->start_stack;
-    }
+    regs->rdi = infop->start_stack;
 }
 
 #endif /* !_TARGET_ARCH_THREAD_H_ */
-- 
2.33.1


