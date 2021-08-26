Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D203F8FD0
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 23:15:26 +0200 (CEST)
Received: from localhost ([::1]:39430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJMiV-00006A-M8
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 17:15:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMfl-0005XR-TA
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:29 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:35653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMfk-0006kX-J8
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:29 -0400
Received: by mail-io1-xd2d.google.com with SMTP id a15so5600874iot.2
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 14:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=okxKdJbOUcfEuQyncikhmmKgqqr7aQZgUfGvRlvwHSo=;
 b=WiNQCFBzemFEH0X5g5TJyVXgYrKB6V8rxCLcOv4Loc0yfiWcXavvXDoLfBtdoTAHey
 uyc3xnqdh9qcBvqsd1r3+J3SfGia4DjtheRpDDXr+bG5c+hF07FEOxk4vXZHicEBzYxp
 RlbIAvRtBe/EBn5xyzWXqs5ie5TY89R/s30AEu1mOnoLICwkuUhPUtXydAuLIBpV/TZJ
 SIorxU0hWE+CLnghTxiVyiTTcChQC+27K08Zwsl1D2jNpulDwMO1zKr6dEShpMGHMeGy
 RD3Noy0IlvB9KNABXdRTXg37w7j96SqzD01yOeNcJ/qOCeMddcjwx8BGs1KGim1R5eqI
 eeOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=okxKdJbOUcfEuQyncikhmmKgqqr7aQZgUfGvRlvwHSo=;
 b=RP0Pl2k794aQ1sL1XnrsJK2Z66ElFiRKjcGDKg4rQhpK3piT75L+xhGJDChB+Hn3QY
 9JrKrmK7Hhpltu9SBKCbb04ybn9OOfHnGiKQ7GcIQBnMcacMHBjOq+PhlqD9Q3ZW1FKc
 xORc6fOyDO18GtiwTlcYg2WBoClH2LbXjGXqwFVPOYUSXLdjgUAkq9TDoK6/1MR0ScbX
 Hq0W54/0oFj1pp53lj4FVGdaaiwY8dFa7M1/Mgyy9opeP4IxDefGPhCe30xd3OK13zs/
 iGRM0fqwdO2/p00rH8FLVVX3xMmZHRcisePTeUuEv7sM2ermUAuWhSn2/UX7ij8Dy88j
 Lt1g==
X-Gm-Message-State: AOAM533b2fu0iIBsaXDq2DV1SkWcmFTLqbVqsPCMwMwmzXqvCy6MgwIE
 Ju3nUieXP/7O5/ENLqbaTwA3Hlf4/4yqR8eb
X-Google-Smtp-Source: ABdhPJysrqeJLd4McA6GAiAg2P3c6mdO+hgX9bYv19MRIn0+fvcgn4TPicuLhezX89Pi8nejQxObog==
X-Received: by 2002:a02:cbb0:: with SMTP id v16mr5145423jap.114.1630012347328; 
 Thu, 26 Aug 2021 14:12:27 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm2348633ilp.75.2021.08.26.14.12.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 14:12:26 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/43] bsd-user: style nits: bsdload.c whitespace to qemu
 standard
Date: Thu, 26 Aug 2021 15:11:23 -0600
Message-Id: <20210826211201.98877-6-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210826211201.98877-1-imp@bsdimp.com>
References: <20210826211201.98877-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2d.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/bsdload.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/bsd-user/bsdload.c b/bsd-user/bsdload.c
index 0ade58b9e2..ec71c5e923 100644
--- a/bsd-user/bsdload.c
+++ b/bsd-user/bsdload.c
@@ -140,7 +140,7 @@ abi_ulong loader_build_argptr(int envc, int argc, abi_ulong sp,
 }
 
 int loader_exec(const char *filename, char **argv, char **envp,
-             struct target_pt_regs *regs, struct image_info *infop)
+                struct target_pt_regs *regs, struct image_info *infop)
 {
     struct bsd_binprm bprm;
     int retval;
@@ -148,7 +148,7 @@ int loader_exec(const char *filename, char **argv, char **envp,
 
     bprm.p = TARGET_PAGE_SIZE * MAX_ARG_PAGES - sizeof(unsigned int);
     for (i = 0 ; i < MAX_ARG_PAGES ; i++) {     /* clear page-table */
-            bprm.page[i] = NULL;
+        bprm.page[i] = NULL;
     }
     retval = open(filename, O_RDONLY);
     if (retval < 0) {
-- 
2.32.0


