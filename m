Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B16547456
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 13:42:31 +0200 (CEST)
Received: from localhost ([::1]:45070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzzVf-00059F-1g
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 07:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyUY-00077K-Ua
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:37:19 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:54873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyUX-0006qw-Fb
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:37:18 -0400
Received: by mail-wm1-x32a.google.com with SMTP id n185so623878wmn.4
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 03:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A6EEZNkHaS1IhD9MCBtC2cYS6mSvyzNV07PVTVWi5zg=;
 b=P8RdqxH1VhnyAIMvsGV69fISsxlMpmKiLjqtKyMi8CFTxDTPlWQ5Ck7LP6Yg2q4MFu
 yGTBrhKWWqTehEYB4rLaVno3fVXx1pUA1B10yhzPJ9/fVct5lmBNXFO0DoglqviYhftu
 3b76XorkCtTa+fQzPoJun2ZBdTmmTmQi3c+R0VlcQm9ql9+9lrBUw1mZFJ/SPjG/Nmkf
 U/jBeIn98sNrsG2WlxgeKnQyqigmULGod7jNlvuGB+LkjRVOYaX7pqMXBng/XemBxwx6
 CdXW+rK0H7OpQNJPTOIPITEFKDrZaHU7zt5XWk3Cv4VBMQuhfROVj6obUIOQ1diTSLM1
 r0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A6EEZNkHaS1IhD9MCBtC2cYS6mSvyzNV07PVTVWi5zg=;
 b=oZtnYbtLDXKKDrb7cZ0unBEzPyPDZ2uP1SiGH3+3gVXyHeavB/TD5vmqAqpNX5yEzF
 /zwcV4ops2xBgGdcQSsVfjA/jHCbkIPh5KVFPdwHbpTbxOQSv7LyYx2g7YUo8VAePRli
 p11mI8APFjwuS8rlEucw5FORi3bp9lgChscQeZW79GXAcRV1Ojvl/NwicTUQVbTC6CHd
 XK8bIKEObxvnWlnlMQV1gtRN6SNaptbcOpJRBjr/fzfz3iHobC06q3RtVr4LPm5gIXgK
 tf3vUu7ssfEXGDS2FdC4ChFcf3bCFPdm7zKgO/SURCka9Ie1VwQ+NTtC7VCeiVDGd7dv
 XhBg==
X-Gm-Message-State: AOAM533qr8YwfeM+V7ZPi3PpTsLP5u/07ZuCxB2xTsDW07fHu/uMHb42
 d+DZ97DNgtgstxSmICfaYJPqObppxQw=
X-Google-Smtp-Source: ABdhPJw/KFSrTfjcYg3hZD9vYxAdLEokEteY6li9FKGd78D/YWkxmLbHTBJCyrIPiTrHXVp5G8b65A==
X-Received: by 2002:a05:600c:228d:b0:39c:63ff:5f2 with SMTP id
 13-20020a05600c228d00b0039c63ff05f2mr4240388wmf.22.1654943836023; 
 Sat, 11 Jun 2022 03:37:16 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 h16-20020a5d6890000000b0020fe61acd09sm2164824wru.12.2022.06.11.03.37.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 03:37:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 47/49] accel/tcg/cpu-exec: Unexport dump_drift_info()
Date: Sat, 11 Jun 2022 12:33:10 +0200
Message-Id: <20220611103312.67773-48-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
References: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bernhard Beschow <shentey@gmail.com>

Commit 3a841ab53f165910224dc4bebabf1a8f1d04200c 'qapi: introduce
x-query-jit QMP command' basically moved the only function using
dump_drift_info() to cpu-exec.c. Therefore, dump_drift_info() doesn't
need to be exported any longer.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20220520180109.8224-9-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/tcg/cpu-exec.c   | 2 +-
 include/exec/cpu-all.h | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 635aeecc0a..7cbf9996b7 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -1048,7 +1048,7 @@ void tcg_exec_unrealizefn(CPUState *cpu)
 
 #ifndef CONFIG_USER_ONLY
 
-void dump_drift_info(GString *buf)
+static void dump_drift_info(GString *buf)
 {
     if (!icount_enabled()) {
         return;
diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 5d5290deb5..9a716be80d 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -419,8 +419,6 @@ static inline bool tlb_hit(target_ulong tlb_addr, target_ulong addr)
 }
 
 #ifdef CONFIG_TCG
-/* accel/tcg/cpu-exec.c */
-void dump_drift_info(GString *buf);
 /* accel/tcg/translate-all.c */
 void dump_exec_info(GString *buf);
 void dump_opcount_info(GString *buf);
-- 
2.36.1


