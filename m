Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B28F47B467
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 21:34:54 +0100 (CET)
Received: from localhost ([::1]:59052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzPMz-0000bg-7h
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 15:34:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPDk-0001kL-CU
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 15:25:21 -0500
Received: from [2607:f8b0:4864:20::633] (port=44613
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPDh-00072U-UU
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 15:25:20 -0500
Received: by mail-pl1-x633.google.com with SMTP id q17so8956436plr.11
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 12:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=brtV571okmpgrnWIgKtPwoUNkykZ08GvD5KZnRkT83o=;
 b=QRFXt/6lEnQxE8VY4h8HBmv4bZNx9bcpgBs+ctngXGorx2Gdn+lnYnbpq54WAw/lY4
 Sn1KdPLYxJW2Hnp/rPT0A24VMlYa74jfVJsd0ZcGf2NqeUQihv8qcbN6QWl4GyPTq6TL
 50BT7itMHTYh5uoLWxwVdssMTa1+xFH1aAchnmcQKaK4lLX306KrL2oxDBftYQuFl0Gz
 wnuqBGC2G1xBKPHxMLbWPR73+iFffiEtBxszq02FFdAwV7WPeM+ElKN869endBChy371
 AG9JsGplMFYh/Zj/uVoZh9bZpNtiw7Nu91wJ5bdBhHy4nQTMKXGt041fNmReExspG4Cu
 nBgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=brtV571okmpgrnWIgKtPwoUNkykZ08GvD5KZnRkT83o=;
 b=ozvwjvyffoKk4d447nHMJnRzRx3/I66CtnSTWLer6GW33IUFftWB3GvBD9tXL/nuOb
 mZp2yyvrpmg7+AX23jGnBPhd39+SkFtCGAOoC4EVrLmdl7bQEQd98lSXEwkoZm1WdK63
 F3RoyyKOe4//UyMiygEdjZAhT4huGacF6JWavPi5EUR90+KPexVQZ2360xdEcOp5nOJJ
 j2yQ7GFWVVcDkJkHpLCvPopEpZx2rFHwq1b6SEfObVO2KxdS6gKwqu03oC7Tr8CQGsEG
 66rYwnnWe+TA/Ur7lwkYvBDV7+/Y4/MCC9soH6GGhx1eKPaan4Es+28JTFt7+xusPuxK
 2AYw==
X-Gm-Message-State: AOAM531iRoyaL+xiWQifsVKKMLjAAp4x3fekERUtkeET1iUx6iby0Fdu
 435dWUw2ABsRtLzvx7ZP/TpgHYkqP0x1vw==
X-Google-Smtp-Source: ABdhPJyxGYb+xaTmSJ7tSGjau8eqWdrFtA8QKmDNPpLjEPFcuqCAvMmX2iA5wBDQ3HECV+WBAUmDGw==
X-Received: by 2002:a17:90a:414b:: with SMTP id
 m11mr813587pjg.158.1640031915131; 
 Mon, 20 Dec 2021 12:25:15 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id q19sm233118pjd.21.2021.12.20.12.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 12:25:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/15] meson: Move bsd_user_ss to bsd-user/
Date: Mon, 20 Dec 2021 12:25:00 -0800
Message-Id: <20211220202500.111897-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220202500.111897-1-richard.henderson@linaro.org>
References: <20211220202500.111897-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have no need to reference bsd_user_ss outside of bsd-user.
Go ahead and merge it directly into specific_ss.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build          | 3 ---
 bsd-user/meson.build | 4 ++++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index cc4df68b20..f45ecf31bd 100644
--- a/meson.build
+++ b/meson.build
@@ -2375,7 +2375,6 @@ genh += hxdep
 authz_ss = ss.source_set()
 blockdev_ss = ss.source_set()
 block_ss = ss.source_set()
-bsd_user_ss = ss.source_set()
 chardev_ss = ss.source_set()
 common_ss = ss.source_set()
 common_user_ss = ss.source_set()
@@ -2630,8 +2629,6 @@ subdir('common-user')
 subdir('bsd-user')
 subdir('linux-user')
 
-specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
-
 common_user_ss = common_user_ss.apply(config_all, strict: false)
 common_user = static_library('common-user',
                              sources: common_user_ss.sources(),
diff --git a/bsd-user/meson.build b/bsd-user/meson.build
index 25c3976ead..9fcb80c3fa 100644
--- a/bsd-user/meson.build
+++ b/bsd-user/meson.build
@@ -2,6 +2,8 @@ if not have_bsd_user
    subdir_done()
 endif
 
+bsd_user_ss = ss.source_set()
+
 common_user_inc += include_directories('.')
 
 bsd_user_ss.add(files(
@@ -17,3 +19,5 @@ bsd_user_ss.add(files(
 
 # Pull in the OS-specific build glue, if any
 subdir(targetos)
+
+specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
-- 
2.25.1


