Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B56FC36A1F4
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:11:05 +0200 (CEST)
Received: from localhost ([::1]:33604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laKs4-0008C3-OS
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKhy-0005Ux-FJ
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:00:38 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:35528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKhs-0004CO-Ul
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:00:38 -0400
Received: by mail-il1-x12b.google.com with SMTP id r5so2958080ilb.2
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 09:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Joh6sYPdqWoZ7daN4rswi5g+4s7Yq8+szdUVhDLRb+k=;
 b=TRW0WIeqxWrrgPnT04NJp/1anqKo1TMYzXFfJgkuQG/FrOGPWw4kVH/QK7TB0ZvoMz
 AS8ylNdYdJM9I8lMe0HFEYnETnkEtyVylM/x/PG1Y87d/khtyLNHRuMPkzju9vwyOpan
 LjMz20383lfw1Xl72LoMfB9NJ2DlLKr7+Up42PLPzQ1C5fbpBY911spPS6SRO8NSfb+Y
 ReXLsI6BUM9f+yVXXYXO2ccF0rdQBLH3LqCHvB+HN79Y+lBhWEnOXaIsfWELRrJlDHfU
 T6sLc205c0hemh7EOocF4TuVAqFc+26ByUH3+dHmDr2cJYzkDxScPhC3M0MptVnpM8qh
 m4KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Joh6sYPdqWoZ7daN4rswi5g+4s7Yq8+szdUVhDLRb+k=;
 b=Vtg0lNPpKTtStKpA24KW5Ia7LNbTr0GS1IT5qrOLNVw7BopbSOzJN5o+ItxtKeyGCx
 O1weXrVrDfeCfsstKrmlFIH5Qbp1E6u4SYXv+QVZspr+qn+5/NenYWqKnauVCIRlZ9fU
 DB334TxBJZt8h6i0HzRZas71BMSHEqraNigo9tGSikaXLsllfYktf/PNcAV4SxQlLn8+
 3biiVg2dLu5VKpxMQfh5x6tR41moqfJj4JOoypeqgQkRKtVCAKbTMlRSW5JMGxAKhUNZ
 4Va5E4IbEAnDXDp+bB7HPEStkzAGh1C6XDvhWqm6sc/T9og1gLHL/WY51O7jDe0SN2Mo
 o0hw==
X-Gm-Message-State: AOAM5335LLbjoUHo/kCLoJhKMYlUITRzysUp7vCBrtK/NpOxNIt4rk/k
 CLruPteClabWpXJUB2I4JRhzsCUKA2JG0LKx
X-Google-Smtp-Source: ABdhPJy48POnk6Rh+Bz6JxDAKH66cM6zA8WzMEKPjHbid2tl4I02HC+xJT+nXPLPMJUTmNj4HK1Y3g==
X-Received: by 2002:a92:7f08:: with SMTP id a8mr7300884ild.87.1619280031589;
 Sat, 24 Apr 2021 09:00:31 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h4sm4055901ili.52.2021.04.24.09.00.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Apr 2021 09:00:31 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/48] bsd-user: style tweak: keyword space (
Date: Sat, 24 Apr 2021 09:59:34 -0600
Message-Id: <20210424160016.15200-7-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210424160016.15200-1-imp@bsdimp.com>
References: <20210424160016.15200-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12b;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12b.google.com
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
Cc: kevans@freebsd.org, Richard Henderson <richard.henderson@linaro.org>,
 arichardson@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/syscall.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
index adc3d21b54..3352735c68 100644
--- a/bsd-user/syscall.c
+++ b/bsd-user/syscall.c
@@ -95,7 +95,7 @@ static abi_long do_freebsd_sysarch(CPUX86State *env, int op, abi_ulong parms)
     abi_ulong val;
     int idx;
 
-    switch(op) {
+    switch (op) {
 #ifdef TARGET_ABI32
     case TARGET_FREEBSD_I386_SET_GSBASE:
     case TARGET_FREEBSD_I386_SET_FSBASE:
@@ -271,7 +271,7 @@ static abi_long lock_iovec(int type, struct iovec *vec, abi_ulong target_addr,
     target_vec = lock_user(VERIFY_READ, target_addr, count * sizeof(struct target_iovec), 1);
     if (!target_vec)
         return -TARGET_EFAULT;
-    for(i = 0;i < count; i++) {
+    for (i = 0;i < count; i++) {
         base = tswapl(target_vec[i].iov_base);
         vec[i].iov_len = tswapl(target_vec[i].iov_len);
         if (vec[i].iov_len != 0) {
@@ -297,7 +297,7 @@ static abi_long unlock_iovec(struct iovec *vec, abi_ulong target_addr,
     target_vec = lock_user(VERIFY_READ, target_addr, count * sizeof(struct target_iovec), 1);
     if (!target_vec)
         return -TARGET_EFAULT;
-    for(i = 0;i < count; i++) {
+    for (i = 0;i < count; i++) {
         if (target_vec[i].iov_base) {
             base = tswapl(target_vec[i].iov_base);
             unlock_user(vec[i].iov_base, base, copy ? vec[i].iov_len : 0);
@@ -325,10 +325,10 @@ abi_long do_freebsd_syscall(void *cpu_env, int num, abi_long arg1,
 #endif
     record_syscall_start(cpu, num, arg1, arg2, arg3, arg4, arg5, arg6, 0, 0);
 
-    if(do_strace)
+    if (do_strace)
         print_freebsd_syscall(num, arg1, arg2, arg3, arg4, arg5, arg6);
 
-    switch(num) {
+    switch (num) {
     case TARGET_FREEBSD_NR_exit:
 #ifdef CONFIG_GPROF
         _mcleanup();
@@ -427,10 +427,10 @@ abi_long do_netbsd_syscall(void *cpu_env, int num, abi_long arg1,
 
     record_syscall_start(cpu, num, arg1, arg2, arg3, arg4, arg5, arg6, 0, 0);
 
-    if(do_strace)
+    if (do_strace)
         print_netbsd_syscall(num, arg1, arg2, arg3, arg4, arg5, arg6);
 
-    switch(num) {
+    switch (num) {
     case TARGET_NETBSD_NR_exit:
 #ifdef CONFIG_GPROF
         _mcleanup();
@@ -506,10 +506,10 @@ abi_long do_openbsd_syscall(void *cpu_env, int num, abi_long arg1,
 
     record_syscall_start(cpu, num, arg1, arg2, arg3, arg4, arg5, arg6, 0, 0);
 
-    if(do_strace)
+    if (do_strace)
         print_openbsd_syscall(num, arg1, arg2, arg3, arg4, arg5, arg6);
 
-    switch(num) {
+    switch (num) {
     case TARGET_OPENBSD_NR_exit:
 #ifdef CONFIG_GPROF
         _mcleanup();
-- 
2.22.1


