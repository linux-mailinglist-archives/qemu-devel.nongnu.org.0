Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC472369B85
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 22:47:48 +0200 (CEST)
Received: from localhost ([::1]:58936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la2iJ-0005ex-UX
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 16:47:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1la2b0-0005rr-AE
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:40:15 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:42815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1la2aw-00089a-W8
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:40:14 -0400
Received: by mail-io1-xd2b.google.com with SMTP id s16so44834150iog.9
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 13:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/gwCxCC7TtVXWBYc6FcQ7sYKzrLKeF2MwPhAfxAi6i0=;
 b=sbr+H0Jb2DsRi27VwhdZhQxOYhGkqbggvzcR7aYHGNcdEmsr3aEQGS1V50mFnQH2Ok
 8r7qYxYviIyAcC10qV4y5UeblwzauFeKVlyFJrJJyIyiJIQDnK8gNQxvzoa5RTWVsVBg
 E1w+Aw0L2kjIdnYlDr0GmRnG/YFkVpENBjtUo5y9/9ff6lccKkGtkzSMYa0B4kgF4i/S
 yqdRw+lJX9fLVShK7SRwQ/8iyp+0nA7ZbzyvN7v+3p3cAv6ZH2XfB/VPTbtkVfIY1BDB
 xr/g7/iu50jkt09qz67GaFFgBnspunFaz5SMQvteAxraWbAxLZRi0OqnCX51KN1FA0b7
 o0TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/gwCxCC7TtVXWBYc6FcQ7sYKzrLKeF2MwPhAfxAi6i0=;
 b=lNsfc1/xX2Vmr2Z+DIEWLXOKK1wvuz6QKT5gfJTMaFPbg0qjpLNhOzPLJySd0pxx/i
 TmRvUUUcUEJRn21sJNEBX2iFbypTgP/xcqZwb4v+JgktSnBYmQKMGj+QklZpEJ3hoJGj
 L/y7Zoyk87xLBWEP5oZYJHGR2Db7J8OObbwSUzmVjS/iLfojuxDtbbBmRmf/2OlfwTc/
 5sw0XlfmD/mPPhMg7DVK6eOilsZOJqw7WlOGBNpCs5PJY5cfJsKNA1A+PNv0mMBMr/Dm
 y4F+l1J75UtEvWu0h5RS1uvGeEta4EKZX97AIrK2KP390OX2ndSRlGk8EzrmXQjLd9vT
 HtDg==
X-Gm-Message-State: AOAM532tD2Sc74sdrJXAYntfc7QAd5cxoAkV2eNM93ohtG7i+IwEk0qC
 bZaeGktJT/tobxcqO6FTMMiFAYm67NBh/9XX
X-Google-Smtp-Source: ABdhPJzFo0ExPDZVgpEYX7K9E9i28fDZD3irWZAVwiH3jSO8d5JjOxIKLbKHzKTz9JjSt9TVWarFRQ==
X-Received: by 2002:a02:cd13:: with SMTP id g19mr5167190jaq.45.1619210409612; 
 Fri, 23 Apr 2021 13:40:09 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id n1sm3201308ion.22.2021.04.23.13.40.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Apr 2021 13:40:09 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 10/24] bsd-user: style tweak: use C not C++ comments
Date: Fri, 23 Apr 2021 14:39:45 -0600
Message-Id: <20210423203959.78275-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2b.google.com
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

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/qemu.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index b836b603af..3480db890d 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -71,7 +71,7 @@ struct image_info {
 
 struct sigqueue {
     struct sigqueue *next;
-    //target_siginfo_t info;
+    /* target_siginfo_t info; */
 };
 
 struct emulated_sigtable {
@@ -193,9 +193,11 @@ extern int do_strace;
 /* signal.c */
 void process_pending_signals(CPUArchState *cpu_env);
 void signal_init(void);
-//int queue_signal(CPUArchState *env, int sig, target_siginfo_t *info);
-//void host_to_target_siginfo(target_siginfo_t *tinfo, const siginfo_t *info);
-//void target_to_host_siginfo(siginfo_t *info, const target_siginfo_t *tinfo);
+/*
+ * int queue_signal(CPUArchState *env, int sig, target_siginfo_t *info);
+ * void host_to_target_siginfo(target_siginfo_t *tinfo, const siginfo_t *info);
+ * void target_to_host_siginfo(siginfo_t *info, const target_siginfo_t *tinfo);
+ */
 long do_sigreturn(CPUArchState *env);
 long do_rt_sigreturn(CPUArchState *env);
 abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, abi_ulong sp);
-- 
2.22.1


