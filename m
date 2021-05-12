Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F48837CEFF
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 19:26:51 +0200 (CEST)
Received: from localhost ([::1]:43430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgsdG-0003AN-5M
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 13:26:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lgsUU-00078W-NN
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:17:49 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:38599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lgsUI-0008J5-G2
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:17:46 -0400
Received: by mail-il1-x12b.google.com with SMTP id c3so20815547ils.5
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 10:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lcNhuk+/UP+YWgfFE7/i6JSUSQF0xDtbR8oIBcbnvUg=;
 b=rZxBW9T1C/P0K1FvKei6HG1iuWwfaQ3EDyVoVxkxRunii34upwn9++0YpaoYC2pqsH
 iNqvyT9giJnb4xmjGPdH109sUH+SEN3B8zgWYjGAvZtQYGquUQTVsx8EEUMP6jAxQ/KG
 gwsnBoyBsqXoSj3o9PoUSyX1K3rKqnT84Kwdun1Tu8YV0KxNByYxMJiLNmv1rfu5CmEs
 GdpX3c0mPeZBLEl62obSF6iTPyqXnPoazn3VFHBbJzn7XTFlV7ZEEaB560KXQwRWz2yT
 tp17mr4GEVWRj8i1hTyxKbCWBwTs7aAfuAZJR1D43+VwDuGD+IaQYpAWyr1oz/9YkbUK
 KrSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lcNhuk+/UP+YWgfFE7/i6JSUSQF0xDtbR8oIBcbnvUg=;
 b=Zgvaaz1P7JG826GJ8Ydy8+bKutZjK8YeGREn4sC5MtXjZAlrKmEjzaZ2xNuOsMa9Vv
 Qd4Os/G5VpIxCDm2QrNLZwO4bSdD82mMdcXSbIxwBwDmMYS11aLQFDLhDucrRuJQodr4
 jow3UnEPoln0k8LOIVsULfCS7NXH096wrXhwx7iJ1xIyTKGHrAjEa1H/DzsG8Lg3EP+n
 N0DXiUFjdtaiBkf+61KX/iFeUj/LaC+svcRrEshosBQsJE+zv+ZEgCqgkcItRjiVR3LI
 vK6AVx9AxSVDDMPeNca3pPOn2C3fVaD0QqvgZH5b2/WE+mMbfNY9/uoVtfCi3uBKWLGR
 wY3A==
X-Gm-Message-State: AOAM531AZOymkNoJaYjDxrq7xFY4PMTOHMjQ6FNCcoQd59+2T0PDbO7Q
 irygtItlTIxQo/oaJ9tbQp0vNNYOqE1heg==
X-Google-Smtp-Source: ABdhPJwCce/Jw+h+ZcPA8esMYaZ4g53eMwE+Wgd3JFVga46hbd6HKqCjp8yfEhImsivql2MTzgyvcQ==
X-Received: by 2002:a92:d2c5:: with SMTP id w5mr7759026ilg.146.1620839852194; 
 Wed, 12 May 2021 10:17:32 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id d2sm192064ile.18.2021.05.12.10.17.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 May 2021 10:17:31 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/20] bsd-user: Remove commented out code
Date: Wed, 12 May 2021 11:17:05 -0600
Message-Id: <20210512171720.46744-6-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210512171720.46744-1-imp@bsdimp.com>
References: <20210512171720.46744-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12b;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

Remove dead code that's been commented out forever.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


