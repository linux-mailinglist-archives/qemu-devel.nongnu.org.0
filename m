Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CAC49D173
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 19:10:25 +0100 (CET)
Received: from localhost ([::1]:35414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCmkS-0002b9-Hh
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 13:10:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <35IvxYQcKCtcO7GMNK79HH9E7.5HFJ7FN-67O7EGHG9GN.HK9@flex--venture.bounces.google.com>)
 id 1nCmZT-0000TN-T9
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 12:59:03 -0500
Received: from [2607:f8b0:4864:20::b4a] (port=56216
 helo=mail-yb1-xb4a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <35IvxYQcKCtcO7GMNK79HH9E7.5HFJ7FN-67O7EGHG9GN.HK9@flex--venture.bounces.google.com>)
 id 1nCmZS-0000ev-7V
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 12:59:03 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id
 e13-20020a25e70d000000b00615e9bc9a3cso590785ybh.22
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 09:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=9CHa3z7ibh+wQwKi0QxjDP31H6eY49wbJnmXPqH4vEs=;
 b=hkWn4pS2uPH14Ew1IExDsXW7Ie03CP34ljCUxXKklF18Xl2/p+MvbtmCh/uSfgMWVD
 Dwp0Lk03qxlOIF2+UCrZYuLZJLG11tR9SAvGHvX9/O4YTbH08ODelrkXvtDVSKFoXyAK
 LYrgfGwqNk4/xmkWUA0qnlspnOgx4h4/X5KlUh80zMginFNjrsEbS/eik9Eh0/gmlLYb
 gJOZaGe/WRPEvSALbJMaSzy+/ggGjBrXUN3+blIt3YrbyPmfFFthhE00vqsZb5XGfqey
 FA0LR5/x1D/zOr9Eqm3MAr3zM8P/QQlx2eWRuWeH9jjpPyP7XJiuJKuTZKAPRqE3yEJB
 zxMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=9CHa3z7ibh+wQwKi0QxjDP31H6eY49wbJnmXPqH4vEs=;
 b=rW8FX5l6jJup+Iu6scFDQlC69w127iKy9tB2FH//Es9HJtWiV+vw6ATvoA49BIZdfX
 FaGsiZC5wMaZHdXi2dYP/RLIYkPcKxlljaQeh6rH5vpcBr5pj68FRVLDQFwY+pRuWgkO
 pAvhAG3MsUDTfNIapbferXlZIKoUHReE4GauEtcZi+o9tQS/vkojeRpvSO94fdhYehF8
 5Rjxv6oRJKyXI2Vf7sDmJq1p74qpljxBM4K/U+efl3k79AaDKbqe9bl0CdLDyO4DV9nL
 Di5L/xgtKlbuqmoudogsBRy7a+cMe4a/PtQ7cONZWeeqWPDNrE4Nrg+7lqrEaLfPfRWy
 r8fA==
X-Gm-Message-State: AOAM532nrbZKRn/T832kN+vCaGGiVxnQQbhq5VrdHw+fzLgJrUe0cPsB
 yKFWg95tM5bdDOw4OmLxWHKZsbP1ZMDO
X-Google-Smtp-Source: ABdhPJwvmxGR2HmvRtuUS/J94MTiYcqdotB05r9WJ+CIHBjVgXUCcTn4IT9azdlG9I4wctNMHGtJkcJznRlb
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:c75c:8ce4:97cf:a279])
 (user=venture job=sendgmr) by 2002:a5b:d0a:: with SMTP id
 y10mr56428ybp.385.1643219940958; 
 Wed, 26 Jan 2022 09:59:00 -0800 (PST)
Date: Wed, 26 Jan 2022 09:58:49 -0800
In-Reply-To: <20220126175850.1904968-1-venture@google.com>
Message-Id: <20220126175850.1904968-2-venture@google.com>
Mime-Version: 1.0
References: <20220126175850.1904968-1-venture@google.com>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
Subject: [PATCH v2 1/2] linux-user: rt_sigprocmask, check read perms first
From: Patrick Venture <venture@google.com>
To: laurent@vivier.eu
Cc: qemu-devel@nongnu.org, scw@google.com, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b4a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=35IvxYQcKCtcO7GMNK79HH9E7.5HFJ7FN-67O7EGHG9GN.HK9@flex--venture.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -87
X-Spam_score: -8.8
X-Spam_bar: --------
X-Spam_report: (-8.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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

From: Shu-Chun Weng <scw@google.com>

Linux kernel does it this way (checks read permission before validating `how`)
and the latest version of ABSL's `AddressIsReadable()` depends on this
behavior.

c.f.  https://github.com/torvalds/linux/blob/9539ba4308ad5bdca6cb41c7b73cbb9f796dcdd7/kernel/signal.c#L3147
Reviewed-by: Patrick Venture <venture@google.com>
Signed-off-by: Shu-Chun Weng <scw@google.com>
---
 linux-user/syscall.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 5950222a77..34bd819e38 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -9508,6 +9508,13 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
             }
 
             if (arg2) {
+                p = lock_user(VERIFY_READ, arg2, sizeof(target_sigset_t), 1);
+                if (!p) {
+                    return -TARGET_EFAULT;
+                }
+                target_to_host_sigset(&set, p);
+                unlock_user(p, arg2, 0);
+                set_ptr = &set;
                 switch(how) {
                 case TARGET_SIG_BLOCK:
                     how = SIG_BLOCK;
@@ -9521,11 +9528,6 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                 default:
                     return -TARGET_EINVAL;
                 }
-                if (!(p = lock_user(VERIFY_READ, arg2, sizeof(target_sigset_t), 1)))
-                    return -TARGET_EFAULT;
-                target_to_host_sigset(&set, p);
-                unlock_user(p, arg2, 0);
-                set_ptr = &set;
             } else {
                 how = 0;
                 set_ptr = NULL;
-- 
2.35.0.rc0.227.g00780c9af4-goog


