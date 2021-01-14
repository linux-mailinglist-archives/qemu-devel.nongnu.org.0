Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3045C2F5D11
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 10:16:35 +0100 (CET)
Received: from localhost ([::1]:35108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzyk6-0000od-7r
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 04:16:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Ref_XwoKCho36H44D0M0O6EE6B4.2ECG4CK-34L4BDED6DK.EH6@flex--dgreenaway.bounces.google.com>)
 id 1kzwIk-0004U2-P1
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 01:40:10 -0500
Received: from mail-qt1-x84a.google.com ([2607:f8b0:4864:20::84a]:56883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Ref_XwoKCho36H44D0M0O6EE6B4.2ECG4CK-34L4BDED6DK.EH6@flex--dgreenaway.bounces.google.com>)
 id 1kzwIi-0007li-SG
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 01:40:10 -0500
Received: by mail-qt1-x84a.google.com with SMTP id k12so3567217qth.23
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 22:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=ppRSLhZSLVVnn3tvrkz9UxaMNNP/WRUn/2AsKI2sEJ8=;
 b=XU57UeJKKeL14YKNCb9blDvdlIZLNylYJUTq319LehbmSTnYC/zeCatyiMFBbI8b9P
 +qRMHA0Ex3h7NzBkV4sORxsfwIllRRB8q3oQSWmLXk8GnM1Kgc+79mQ43RFgU4lY+kee
 vAJ7njrWzwrMokFohathXSjx3+Gnw4OgHowHY31mmmfdlvzJME9RmAoaGjealNQ5wJP+
 2kVz5V6v+7+WaXDgFbwIYr5bMQ5tONrYQZNjyon2zr/0BVtRIJzQZZP65+1l7sonsNZa
 YAe4B5WBBdg2jHxX1ySMoNtZ9A9jj1/pnHL69hED9t+YaakLTgvJZUmcJQHfLiPEbYMQ
 GaQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=ppRSLhZSLVVnn3tvrkz9UxaMNNP/WRUn/2AsKI2sEJ8=;
 b=P/BNYurs+ySahRhlPa/1SJY5UWCOYuZdHhXIjYZizNgP4tlI74JIIjQ7NUmTHIO83A
 pQtTKWSVE2RIBui5bZ7tuutii9DOP6W0tN2l5EZ/LPeAv0B61QyaoTNXSJkQv1DsuaKk
 jB5oU1Ueq2KpPwOee5inpUCtr9Madh0fMBMgBcpvTxWmLqrcnqLwrYOK8w5oTObSgxXO
 wQTaF/W/TrwrIOxribUHzNxHdX8AOLqW9ut54/X4jo9ri8r2etyJonv89NKgNexijChp
 BTmx2pkqhdRdIO/YAolEljz+s0n/+6AjJVa/DqcwnuVAz1LbTYaov3qFxkT9xB3BM4qM
 Mz9Q==
X-Gm-Message-State: AOAM532scUNWedihxPQSwq6l1f9SeXINVdXrMEody9YVXcdonhBmZUj0
 QzYm+cy3O5pF7MuK6MbouDi7tNUYmmhjglKxhO81CsnyMClPMOa65/Bi57nBB2FzOXpxg0YVZ4m
 LnfT/RO3ca4Jlbm0w4YIUma3AJYVXgtutBVlsyzhotS4+sCPxLUrSGqpkq0R3c9qFA8kq4I4=
X-Google-Smtp-Source: ABdhPJyLnvyH2quLLjX48XcROFK1mGd/+tnvmkTbMRZNH/e5MrHhKjIJqjdn+weZO4wAnDhWdJ+fj02RTd6GEB7S
X-Received: from dgreenaway.syd.corp.google.com
 ([2401:fa00:9:1:7220:84ff:fe09:6028])
 (user=dgreenaway job=sendgmr) by 2002:ad4:4e8a:: with SMTP id
 dy10mr5847583qvb.14.1610606405619; Wed, 13 Jan 2021 22:40:05 -0800 (PST)
Date: Thu, 14 Jan 2021 17:39:58 +1100
Message-Id: <20210114063958.1508050-1-dgreenaway@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
Subject: [PATCH] target/i386: Fix decoding of certain BMI instructions
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::84a;
 envelope-from=3Ref_XwoKCho36H44D0M0O6EE6B4.2ECG4CK-34L4BDED6DK.EH6@flex--dgreenaway.bounces.google.com;
 helo=mail-qt1-x84a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 14 Jan 2021 04:14:48 -0500
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
Cc: David Greenaway <dgreenaway@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: David Greenaway <dgreenaway@google.com>
From: David Greenaway via <qemu-devel@nongnu.org>

This patch fixes a translation bug for a subset of x86 BMI instructions
such as the following:

   c4 e2 f9 f7 c0                shlxq   %rax, %rax, %rax

Currently, these incorrectly generate an undefined instruction exception
when SSE is disabled via CR4, while instructions like "shrxq" work fine.

The problem appears to be related to BMI instructions encoded using VEX
and with a mandatory prefix of "0x66" (data). Instructions with this
data prefix (such as shlxq) are currently rejected. Instructions with
other mandatory prefixes (such as shrxq) translate as expected.

This patch removes the incorrect check in "gen_sse" that causes the
exception to be generated. For the non-BMI cases, the check is
redundant: prefixes are already checked at line 3696.

Buglink: https://bugs.launchpad.net/qemu/+bug/1748296

Signed-off-by: David Greenaway <dgreenaway@google.com>
---

I'm a relative novice in both the QEMU source code and the x86
instruction set, so please do review carefully, and don't be afraid to
let me know if I am completely going down the wrong path.

This bug was originally reported at
https://bugs.launchpad.net/qemu/+bug/1748296 a few years ago. The
reproducer linked from the bug still fails on QEMU head, but is fixed by
this patch.

 target/i386/tcg/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 6a4c31f933..af1faf9342 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -3075,7 +3075,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
     }
     if (is_xmm
         && !(s->flags & HF_OSFXSR_MASK)
-        && ((b != 0x38 && b != 0x3a) || (s->prefix & PREFIX_DATA))) {
+        && (b != 0x38 && b != 0x3a)) {
         goto unknown_op;
     }
     if (b == 0x0e) {
-- 
2.30.0.284.gd98b1dd5eaa7-goog

