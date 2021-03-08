Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D950B3315DB
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 19:23:51 +0100 (CET)
Received: from localhost ([::1]:34626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJKXm-0005kM-U9
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 13:23:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJlA-0007DT-H8
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:36 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:35782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkq-00078B-PM
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:36 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 c76-20020a1c9a4f0000b029010c94499aedso4301443wme.0
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6Y/D7IZPF2btpylr/tGSrJglln8Q0IaQqjPn+zpk0J0=;
 b=WmvHSiprixbEuxj1g9Wjy+tEYCQXmVyNL9iDCS70aQEBuD7J+tULMK0ZKw/4iiMhM7
 LxkAxyZf3/Ikb2WdaMhwdg0XeyhjWQYsA/P5Wrf/Tii2/i75waO8v/eJOk9bpVTL+Ira
 y5jp4HoItWuxQEJoh76GP2KlpZGvHw3J37zfdaeiB8wp1DdQzOBzeE7ggEHu0+3R3W2N
 rBa69k9oR2QRrCWEazNgtAV/7MbhPPs7x14vTq8jg50DyM2j5PmOQGhHTbGUbF+Rd6Q8
 4khcaHRJyXT0QyfePwZAgKKPdYu122Rc3lcxrBpYthJtOejtF1xAAXSxu9IT3P+EkFEU
 C7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6Y/D7IZPF2btpylr/tGSrJglln8Q0IaQqjPn+zpk0J0=;
 b=h3vHUu3LQTbbK72tKIme4vVytbnf5vN13Hva6X+5bvI6l5aOio0/2+voVYailbDQA+
 TrNqmJCPopIgh/E8U3/j3aTqb6RWU7Dy55c00KX6ZwMojhTztj7qvdlIKEw4bP7ZwOMx
 NlFsoT76udCPMHLjaFEFxz89wFch94O1I+5/Olmv1x9G0tpChvBypQ/jCAATmrgX7WLn
 hm/x2efciVM9N5EnhjNygYFvmrj8shEawBpMJcg/uvzHIGk5f3ZZ1zIbqPq1dzPoVHFC
 M4zQMW9NG8+T+Ji+uf1U4QeSJoe0mlv12jro7h+T/gX9Fks9VbqPW+Is/eg3CglSdVFj
 dYhA==
X-Gm-Message-State: AOAM532tIj+nMK5q6hTveN4NXS4Yd0CWwyBQfbKP2K0jchdGoUFNs6iP
 r2ZMUiDbe0FP7XtbWd6D9IZIiBHhB7HxhQ==
X-Google-Smtp-Source: ABdhPJzfTo4BPj+rQCp7/p3FuCYW7GHZTumq3w+14QW5+YzWibrJP6uRJt6TBIWQKVrXwOQxnHyQVQ==
X-Received: by 2002:a7b:c04c:: with SMTP id u12mr23658578wmc.9.1615224795329; 
 Mon, 08 Mar 2021 09:33:15 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i10sm18628217wrs.11.2021.03.08.09.33.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:33:15 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 39/54] hw/misc/mps2-scc: Implement changes for AN547
Date: Mon,  8 Mar 2021 17:32:29 +0000
Message-Id: <20210308173244.20710-40-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308173244.20710-1-peter.maydell@linaro.org>
References: <20210308173244.20710-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the minor changes required to the SCC block for AN547 images:
 * CFG2 and CFG5 exist (like AN524)
 * CFG3 is reserved (like AN524)
 * CFG0 bit 1 is CPU_WAIT; we don't implement it, but note this
   in the TODO comment

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210219144617.4782-40-peter.maydell@linaro.org
---
 hw/misc/mps2-scc.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/hw/misc/mps2-scc.c b/hw/misc/mps2-scc.c
index 140a4b9ceba..c56aca86ad5 100644
--- a/hw/misc/mps2-scc.c
+++ b/hw/misc/mps2-scc.c
@@ -110,14 +110,14 @@ static uint64_t mps2_scc_read(void *opaque, hwaddr offset, unsigned size)
         r = s->cfg1;
         break;
     case A_CFG2:
-        if (scc_partno(s) != 0x524) {
+        if (scc_partno(s) != 0x524 && scc_partno(s) != 0x547) {
             /* CFG2 reserved on other boards */
             goto bad_offset;
         }
         r = s->cfg2;
         break;
     case A_CFG3:
-        if (scc_partno(s) == 0x524) {
+        if (scc_partno(s) == 0x524 && scc_partno(s) == 0x547) {
             /* CFG3 reserved on AN524 */
             goto bad_offset;
         }
@@ -130,7 +130,7 @@ static uint64_t mps2_scc_read(void *opaque, hwaddr offset, unsigned size)
         r = s->cfg4;
         break;
     case A_CFG5:
-        if (scc_partno(s) != 0x524) {
+        if (scc_partno(s) != 0x524 && scc_partno(s) != 0x547) {
             /* CFG5 reserved on other boards */
             goto bad_offset;
         }
@@ -185,7 +185,10 @@ static void mps2_scc_write(void *opaque, hwaddr offset, uint64_t value,
 
     switch (offset) {
     case A_CFG0:
-        /* TODO on some boards bit 0 controls RAM remapping */
+        /*
+         * TODO on some boards bit 0 controls RAM remapping;
+         * on others bit 1 is CPU_WAIT.
+         */
         s->cfg0 = value;
         break;
     case A_CFG1:
@@ -195,7 +198,7 @@ static void mps2_scc_write(void *opaque, hwaddr offset, uint64_t value,
         }
         break;
     case A_CFG2:
-        if (scc_partno(s) != 0x524) {
+        if (scc_partno(s) != 0x524 && scc_partno(s) != 0x547) {
             /* CFG2 reserved on other boards */
             goto bad_offset;
         }
@@ -203,7 +206,7 @@ static void mps2_scc_write(void *opaque, hwaddr offset, uint64_t value,
         s->cfg2 = value;
         break;
     case A_CFG5:
-        if (scc_partno(s) != 0x524) {
+        if (scc_partno(s) != 0x524 && scc_partno(s) != 0x547) {
             /* CFG5 reserved on other boards */
             goto bad_offset;
         }
-- 
2.20.1


