Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BB536A200
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:16:29 +0200 (CEST)
Received: from localhost ([::1]:50274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laKxF-0006lX-CC
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:16:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKi2-0005Yn-MH
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:00:46 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:35535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKhw-0004D0-7I
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:00:42 -0400
Received: by mail-il1-x132.google.com with SMTP id r5so2958152ilb.2
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 09:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5spDA4ad8IC94jF1bigmtQ1FSEIn1pWZKjNT8+eHgHE=;
 b=mdDcvXXHa3xVu1qM47oXXYw4YG6kqY4Dd+oabOdd7P5hR+kmhDnIJaF5UQ8rLuIfuH
 1d3NJs1MM35HlOw9H1IkKdwNraNcU4N66NY1eLmEyw9EgnCyeQXaRhphhBvO5u3ynXyX
 6F3oEoOAmmBjBoNl76pdymq9GbuPMwf/1rtWRDC0cDXVm7hvJfZjJ0Rnu34vCQ7AU8si
 Q8gD8DRQA7DT8Dc+92Rxjn4X365rgtjfV9aL5o6i9Qxedt3GVHhXlTJudfRIHyritnpG
 o1fJOn+phG2OJUk88rsPG+FOcCJnuGtEjoG16mupvdekiwcd9VGVSVDu5fkzV/x8gN1f
 8VMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5spDA4ad8IC94jF1bigmtQ1FSEIn1pWZKjNT8+eHgHE=;
 b=rkIrOGJVmoYGAH+uFsFsh2mNCEG5oS0E5jn+zWR2w/PYujG9gKxo+dEM9t6c1syS0D
 fT/FFAZLlTMvIGkxXw5WthCFzf+DKWSq1R0dAC8awxVL9NioMaQLj8an0jJiPHTa0mZz
 Yy9yqi0xwpHQLkjBTnYBir0pPKD2w34R0tzrqhOse8BGqRnHulU6WSj0RtQWeq2tVq1B
 ZGtJExqfOX7itaVuNTQIapTkjQMr8XTf26G72z12I/uHtC1GpCqhKbO+6gP0K6ZFiYRM
 lvU3Dh1l0lTiNH+RXriUE+sOCgj8fuGLsnvTgb9uTn++RuZtkf+nIqFkRuW4fpfcpCwF
 rqew==
X-Gm-Message-State: AOAM531/Fsho0k/rK/SKW7ecjG1pGDMAYK/JRzgBUlHxybGFFUyzYL90
 1tE1C7fpJZFbGiVclmZ6hAnx/5nhHb6pCVVl
X-Google-Smtp-Source: ABdhPJyGH3PRoGzJf4ZXTMkk6efSlVbzR/QtN4Yg8obrskgPEwM2tjItXShtaNUz17I+gzVHEyPNGw==
X-Received: by 2002:a92:6810:: with SMTP id d16mr7660152ilc.88.1619280034837; 
 Sat, 24 Apr 2021 09:00:34 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h4sm4055901ili.52.2021.04.24.09.00.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Apr 2021 09:00:34 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/48] bsd-user: Remove commented out code
Date: Sat, 24 Apr 2021 09:59:38 -0600
Message-Id: <20210424160016.15200-11-imp@bsdimp.com>
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
Cc: kevans@freebsd.org, arichardson@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Remove dead code that's been commented out forever.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/qemu.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index b836b603af..7ccc8ad397 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -71,7 +71,6 @@ struct image_info {
 
 struct sigqueue {
     struct sigqueue *next;
-    //target_siginfo_t info;
 };
 
 struct emulated_sigtable {
@@ -193,9 +192,6 @@ extern int do_strace;
 /* signal.c */
 void process_pending_signals(CPUArchState *cpu_env);
 void signal_init(void);
-//int queue_signal(CPUArchState *env, int sig, target_siginfo_t *info);
-//void host_to_target_siginfo(target_siginfo_t *tinfo, const siginfo_t *info);
-//void target_to_host_siginfo(siginfo_t *info, const target_siginfo_t *tinfo);
 long do_sigreturn(CPUArchState *env);
 long do_rt_sigreturn(CPUArchState *env);
 abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, abi_ulong sp);
-- 
2.22.1


