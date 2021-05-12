Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC6337CF00
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 19:27:30 +0200 (CEST)
Received: from localhost ([::1]:47016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgsds-0005jE-OJ
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 13:27:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lgsUd-0007C7-Le
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:17:55 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:40608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lgsUR-0008Lh-Ji
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:17:55 -0400
Received: by mail-il1-x131.google.com with SMTP id h6so20790972ila.7
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 10:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FOyYT6v3FJ+0uJnT7gsJB6d2fgSg7HmjK7xr2jCaye4=;
 b=lMtTiG/Ty13XxDpq0VZzh8ea6/2a11rxAKz3l8MsdI5v4z8kdzqaUjLdZOg9teM6yj
 eqy2Pk6Z4JhcaxaP2ZNasE4ThjIcwpcQFdHUjK5NWlBkFy3CirTrDqHq/0mIZ+kNPFrp
 /XND14Qh1VLhkGnVG2H1K2A+VrsV7LjCqvIW4n+uGJdbqdLxLPsf8nrr1ydGAs2iGJ76
 TUrm127HQvtP1YW0adLwAazCOfyFbA4zhWjTExM2DlUqcKILSJMuPZh0WdV+7Z68l0/5
 U93TjpeSyd8kiBydovl/H0Z68Rcy/4GWR6PdrbUAXnU5f2ef0zKy3PPLTyoIdMOwFLyT
 9iCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FOyYT6v3FJ+0uJnT7gsJB6d2fgSg7HmjK7xr2jCaye4=;
 b=KnHVFjjVrO9WtAMUN2SZemqmX3gwBZLZ02t8nNtDSwAECs1xyAsDfn3lgx9BozNkwC
 qvZxjXJ2RZC44AdB1QCyeWlBdtzn0iwU8YO8dy8FiUIP0Q3Q5aYOhoHQxRJyxU7Dgi7r
 4bV/1Jg3jYQxWne4ad7JZiudHf1TwWCfBFkyfwbZXoSlZpRN+9Wvc8ueXJIra/CEagav
 LmwVQhEMyKk6xolve5X36S5yuFxPOhEzpvBHkeFAW6x0ipvxHc4913STDPfkeHkd+pCY
 u6jOWc7nRvysupd5lMAjtiEJ9IuZM3EyZB5lf6WsW663158k+nCWB0ysHX8nlTNG+l/A
 X+tg==
X-Gm-Message-State: AOAM532LRxq+RJF2oxRvYPh06pc9RXIGkXqRGib04mgf9GinNW6tao4K
 kSSqcZypA/H9NGkewa5ToY6OrWSEk+GGgw==
X-Google-Smtp-Source: ABdhPJxTbiIe2gTADaxUnQaXAfncCTAt5yhnJ2CqF0gsYvdjmdN9VcK/XSWPVIe5SPkK6YwVD2FTRQ==
X-Received: by 2002:a05:6e02:ee1:: with SMTP id
 j1mr18433529ilk.105.1620839860888; 
 Wed, 12 May 2021 10:17:40 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id d2sm192064ile.18.2021.05.12.10.17.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 May 2021 10:17:40 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/20] bsd-user: style tweak: keyword space (
Date: Wed, 12 May 2021 11:17:14 -0600
Message-Id: <20210512171720.46744-15-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210512171720.46744-1-imp@bsdimp.com>
References: <20210512171720.46744-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::131;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x131.google.com
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
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/syscall.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
index 4abff796c7..7d986e9700 100644
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
@@ -272,7 +272,7 @@ static abi_long lock_iovec(int type, struct iovec *vec, abi_ulong target_addr,
     target_vec = lock_user(VERIFY_READ, target_addr, count * sizeof(struct target_iovec), 1);
     if (!target_vec)
         return -TARGET_EFAULT;
-    for(i = 0;i < count; i++) {
+    for (i = 0;i < count; i++) {
         base = tswapl(target_vec[i].iov_base);
         vec[i].iov_len = tswapl(target_vec[i].iov_len);
         if (vec[i].iov_len != 0) {
@@ -298,7 +298,7 @@ static abi_long unlock_iovec(struct iovec *vec, abi_ulong target_addr,
     target_vec = lock_user(VERIFY_READ, target_addr, count * sizeof(struct target_iovec), 1);
     if (!target_vec)
         return -TARGET_EFAULT;
-    for(i = 0;i < count; i++) {
+    for (i = 0;i < count; i++) {
         if (target_vec[i].iov_base) {
             base = tswapl(target_vec[i].iov_base);
             unlock_user(vec[i].iov_base, base, copy ? vec[i].iov_len : 0);
@@ -326,10 +326,10 @@ abi_long do_freebsd_syscall(void *cpu_env, int num, abi_long arg1,
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
@@ -428,10 +428,10 @@ abi_long do_netbsd_syscall(void *cpu_env, int num, abi_long arg1,
 
     record_syscall_start(cpu, num, arg1, arg2, arg3, arg4, arg5, arg6, 0, 0);
 
-    if(do_strace)
+    if (do_strace)
         print_netbsd_syscall(num, arg1, arg2, arg3, arg4, arg5, arg6);
 
-    switch(num) {
+    switch (num) {
     case TARGET_NETBSD_NR_exit:
 #ifdef CONFIG_GPROF
         _mcleanup();
@@ -507,10 +507,10 @@ abi_long do_openbsd_syscall(void *cpu_env, int num, abi_long arg1,
 
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


