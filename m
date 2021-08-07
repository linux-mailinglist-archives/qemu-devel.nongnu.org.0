Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD52C3E372E
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 23:46:47 +0200 (CEST)
Received: from localhost ([::1]:46048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCU9W-0006ZY-Uc
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 17:46:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU5t-0006Mz-SY
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:01 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:43542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU5s-0004lJ-Bl
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:01 -0400
Received: by mail-io1-xd2c.google.com with SMTP id y1so19934770iod.10
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 14:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nOSUvgH5f74ZfkyvhQajEnSvPZqEVu6yJTk1v/dSPeA=;
 b=CuW8wr4FELZBpLNUv7wXScasImLjI+il+QEGvRmeVij6KOSUI+sIn/J1VK2EptZkoB
 t61zIGdy/r8VzvLwOmyFk70/W/w1DS2s4MjX5zmM+uqqfkpQ8i35p5h+pLbiTAQrNXkv
 Sm2UQ9qWl2ajgYX2J84kq0lnxvEmXnbs2T1xiJthJxg3pFE8SbsUAelu6uLRUS+S6/UA
 iOOVdFUVkDBDlwwOJXr3nXwCwxztwjPQploCzkwEWNZ/BZFwcUfbc0c62FEc64/XpMNs
 kHzGprpWXhLBvgrJyO8iUAIzBg64ya6DZbUvitYHRc1qqbictPeD4j+JZjHBjo900BuT
 mIEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nOSUvgH5f74ZfkyvhQajEnSvPZqEVu6yJTk1v/dSPeA=;
 b=KPpeQ6LVYi7VS+wwj59Kb/fpXsNA0rGAIgVZEK+DOTvVkon4iswfpxuqPX5GIzJnc2
 YkihcQN8BKYUddJ+VoS1fTXZy+oHzZJmdH6bfmjTzSj6/tyAJ83XDx4VIsxV8wSVA77U
 bY54p78kBXJ+Idxabgk7BBbkoRDMdnUPuHEvxcYmqO3y7hBFEwtwW7yfTRqYB4Bl0/2a
 QhByUmAjTbchHnCX4qs50+4B3uizRP2vbX8h9QM3/VAk4W2iKIgCB//TkoUH4pXLRoSD
 fmVfrAaiADQPPIqI5eR/M1HANOPvZgwdeUSuASsr42bOqwaTFANt6hSyvEOhv9tR9yd1
 CPJw==
X-Gm-Message-State: AOAM532QhbXCgkviK5Spm3h/q+zvBS7KHd6KRvmnvMA2b6Qf4taDitX1
 J2mlSSC7++BuJAuPNEqwK3f0k7YtVj1jN/sk
X-Google-Smtp-Source: ABdhPJwN/KQJyvb+uHZD63l2r72jX7ertRVHAv2GtFUm4TqVyptk4C/qu0vboRwYjvPgnPZ76F870w==
X-Received: by 2002:a05:6602:2044:: with SMTP id
 z4mr1138887iod.128.1628372579026; 
 Sat, 07 Aug 2021 14:42:59 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm8062827ios.36.2021.08.07.14.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 14:42:58 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.2 08/49] bsd-user: style nits: fix whitespace issues to
 be qemu standard
Date: Sat,  7 Aug 2021 15:42:01 -0600
Message-Id: <20210807214242.82385-9-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210807214242.82385-1-imp@bsdimp.com>
References: <20210807214242.82385-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2c.google.com
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
Cc: kevans@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/bsdload.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/bsd-user/bsdload.c b/bsd-user/bsdload.c
index 8d83f21eda..39098170d5 100644
--- a/bsd-user/bsdload.c
+++ b/bsd-user/bsdload.c
@@ -125,7 +125,7 @@ abi_ulong loader_build_argptr(int envc, int argc, abi_ulong sp,
 }
 
 int loader_exec(const char *filename, char **argv, char **envp,
-             struct target_pt_regs *regs, struct image_info *infop)
+                struct target_pt_regs *regs, struct image_info *infop)
 {
     struct bsd_binprm bprm;
     int retval;
@@ -133,7 +133,7 @@ int loader_exec(const char *filename, char **argv, char **envp,
 
     bprm.p = TARGET_PAGE_SIZE * MAX_ARG_PAGES - sizeof(unsigned int);
     for (i = 0 ; i < MAX_ARG_PAGES ; i++) {     /* clear page-table */
-            bprm.page[i] = NULL;
+        bprm.page[i] = NULL;
     }
     retval = open(filename, O_RDONLY);
     if (retval < 0) {
-- 
2.32.0


