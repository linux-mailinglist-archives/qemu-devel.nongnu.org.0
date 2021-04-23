Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 569DA369B77
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 22:44:41 +0200 (CEST)
Received: from localhost ([::1]:49824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la2fI-0001uO-Bi
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 16:44:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1la2ad-00059q-3v
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:39:51 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:38820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1la2aa-0007wk-UW
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:39:50 -0400
Received: by mail-oi1-x22b.google.com with SMTP id d25so12882772oij.5
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 13:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M4SqFhVwp+qFFjGoMhAyPxx+zzs7u3r3DJJd2CS34OQ=;
 b=coi/8jQ3hLer3eZ5L/nHL4R6yL4z9Lli12adcb+FgWg3ORBrhAeVgxU1G2MJUkC9Mp
 3aZfAK7ctIhCjOng5DzEz55UBHojw2GPGq7H18p7NFKqFvuykpT6TCpRcbwluatmDMW2
 ozgNkdx0g446Gh1bj/MLtw8mtAdK4GRRE7q3oz3zqlXk94mDAYu9QL9iXk5z6P5XnNPf
 2WiLXQx+xQ9hlrECqaFr25WVCcY0jT3KfsN53X0RnRhAPaR1cXC6Jd4vtmjRMhJNCp90
 lz/f5iZBujQ64xSUr/3hT2rNDN3Z+uZnSxYu8iSIHKYts+wKuDP/Z7qa4FwhYYDo0OgB
 XAQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M4SqFhVwp+qFFjGoMhAyPxx+zzs7u3r3DJJd2CS34OQ=;
 b=cInA3B2D+0KDmH/pyRPokNjrJ9wRboYj6oeu3DYx4pNpx70y7JmfD1TEr3CHyA62CN
 i0AgKWacuxDs2Xkyr8sJYlG+/5QIrrUsp1MW4lRxeqKyku790zbeIbrtNqB9X39KfhAG
 kPSTgZlWQFOI3X1JH/tVRAC8ePUUzH2zOvuRWizj1c0b5tXFwR+1Y3MpSLE5CAvf9DuE
 0EYihSI37n09LaXwDduPfUghuDexDXnE4206dtstBSFFDPgnaKSrId4CU22FQrD+x7od
 HdJ1BQQ3zB8YIy7ajUnreiyQJpdsjDhHhmzJgRxSwXM0003OEvGCJ/spf1DlVIn6kCwT
 qTFA==
X-Gm-Message-State: AOAM532i9+z77qENTDF1LjdatlWZPxQmS5af9r5dN6LfRR+TynK0NdDr
 ohXlrHmC5D5m+OXyYZbPFrZu2YV4a6jFeUem
X-Google-Smtp-Source: ABdhPJyjAURax91ugIwJNh3FnVA7UQL7L+esszcpFKmOmLDa4HD6pbd7FJHZutfCEa+XqiyvRpYdQQ==
X-Received: by 2002:a05:6808:58:: with SMTP id
 v24mr4175304oic.130.1619210387558; 
 Fri, 23 Apr 2021 13:39:47 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id m127sm1511911oib.32.2021.04.23.13.39.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Apr 2021 13:39:47 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 06/24] bsd-user: style tweak: keyword space (
Date: Fri, 23 Apr 2021 14:39:32 -0600
Message-Id: <20210423203935.78225-6-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210423203935.78225-1-imp@bsdimp.com>
References: <20210423203935.78225-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::22b;
 envelope-from=imp@bsdimp.com; helo=mail-oi1-x22b.google.com
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
Cc: kevans@freebsd.org, arichardson@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

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


