Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C364E6DCAB0
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 20:23:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plw8w-0002iu-DP; Mon, 10 Apr 2023 14:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1plw8j-0002fZ-3i
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 14:21:18 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1plw8h-0000f5-BR
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 14:21:16 -0400
Received: by mail-il1-x130.google.com with SMTP id k7so13378661ils.3
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 11:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1681150874;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dLPGsKZ9qU3wG8gg3c0pvYiD+HZ1kzhXINDhxubxQNw=;
 b=HuVHD2VmF9LrGijNnNQOw1FT8pd6IU1zojiA3I0QkFcgoTubn79TeBYjoiy57KLV3x
 OthUg8QJK9w/oNT/8yYOchpka1kbu3f3ag79Cf8WF6sMjDYKI5F/POiATYNTIfWkJzI6
 c7Am+rnFfS6/ItJ1Ho7U/Z9KX0Tww34rmOfP84HNH2Jm3U8T9ixiPfCxJOPbZiPxfSM9
 NpKaGOBTy4vi/Bez7el1RjLrgAR8kSv1zjmHYsZ0paNI9vb7gYKYgzDk+2kXxu+ZCao+
 /T8KjMLVirTfWP9TIlquHhBPGNBkHtgWxPYl3n5VtTK7My5O9TNTOqfoueOE5TEOQsa1
 2AVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681150874;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dLPGsKZ9qU3wG8gg3c0pvYiD+HZ1kzhXINDhxubxQNw=;
 b=am4QgUFLz16GPg5fs6WOGPqgZTkrCZfDbPOPwOb1ufr9RwCizo5fjHIW/tyDDRSv3p
 cQOLeTGXcJd+yoAQ6gMo7GSVH9V/IeGIr6K8BV6OLhwxv+D1JWwRZFk2r95cIbolvMEX
 5huKft9jVykfOZauqnC6ciitzPlYPvVWh29GKdvu/uZMCsuOnZU2F4OTWS4OFMo3YKJk
 WMuDfJZ7tP6CqoCUWdDCJnzHyVSOqMpBQ8VEE63mgOLeLpUOuF/+ZHnB95t2aB6c3OxZ
 DRjmHK5C/pxZSM7Jmors3uD1MZbKS7HqNkAoA/L3hS6+7zfftotWaAc/c6Pgw6mrToJc
 mr+w==
X-Gm-Message-State: AAQBX9dp4qch9wqz/16CnzVxQUYyMaZgi0xM4RXfiq3TgEpXRAK2r2zC
 s87cTfyqTQsRuq3Z2KreQgnxz8/0Vd40f0A7e54=
X-Google-Smtp-Source: AKy350aWL/Kv5SZ+685IckIA598+X9IlwPx4WSck5QK5jjwFWdY/1xHc23jbcdBGwoFmIWl0WDwI+Q==
X-Received: by 2002:a92:d201:0:b0:328:bfbd:1e87 with SMTP id
 y1-20020a92d201000000b00328bfbd1e87mr2340055ily.27.1681150874373; 
 Mon, 10 Apr 2023 11:21:14 -0700 (PDT)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 a15-20020a056e02120f00b00313b281ecd2sm3104314ilq.70.2023.04.10.11.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 11:21:14 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: jrtc27@jrtc27.com, riastradh@netbsd.org, Kyle Evans <kevans@freebsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>, Brad Smith <brad@comstyle.com>,
 Warner Losh <imp@bsdimp.com>, reinoud@netbsd.org,
 Stacey Son <sson@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 10/19] bsd-user: Implement do_sysctl_kern_getprocs
Date: Mon, 10 Apr 2023 12:20:47 -0600
Message-Id: <20230410182056.320-11-imp@bsdimp.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230410182056.320-1-imp@bsdimp.com>
References: <20230410182056.320-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::130;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x130.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Stacey Son <sson@FreeBSD.org>

Implement do_sysctl_kern_getprocs to retrieve proc info from the kernel.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/freebsd/os-sys.c | 165 +++++++++++++++++++++++++++++++++++++-
 bsd-user/qemu.h           |   3 +
 2 files changed, 167 insertions(+), 1 deletion(-)

diff --git a/bsd-user/freebsd/os-sys.c b/bsd-user/freebsd/os-sys.c
index df317065587..d4a6dcc6c2b 100644
--- a/bsd-user/freebsd/os-sys.c
+++ b/bsd-user/freebsd/os-sys.c
@@ -19,9 +19,14 @@
 
 #include "qemu/osdep.h"
 #include "qemu.h"
+#include "qemu-bsd.h"
 #include "target_arch_sysarch.h"
-
+#include "signal-common.h"
+#include <sys/param.h>
 #include <sys/sysctl.h>
+#include <sys/user.h>   /* For struct kinfo_* */
+
+#include "target_os_user.h"
 
 /*
  * Length for the fixed length types.
@@ -107,6 +112,164 @@ static abi_ulong h2g_ulong_sat(u_long ul)
  */
 #define bsd_get_ncpu() 1
 
+static void
+host_to_target_kinfo_proc(struct target_kinfo_proc *tki, struct kinfo_proc *hki)
+{
+    int i;
+
+    __put_user(sizeof(struct target_kinfo_proc), &tki->ki_structsize);
+    __put_user(hki->ki_layout, &tki->ki_layout);
+
+    /* Some of these are used as flags (e.g. ki_fd == NULL in procstat). */
+    tki->ki_args = tswapal((abi_ulong)(uintptr_t)hki->ki_args);
+    tki->ki_paddr = tswapal((abi_ulong)(uintptr_t)hki->ki_paddr);
+    tki->ki_addr = tswapal((abi_ulong)(uintptr_t)hki->ki_addr);
+    tki->ki_tracep = tswapal((abi_ulong)(uintptr_t)hki->ki_tracep);
+    tki->ki_textvp = tswapal((abi_ulong)(uintptr_t)hki->ki_textvp);
+    tki->ki_fd = tswapal((abi_ulong)(uintptr_t)hki->ki_fd);
+    tki->ki_vmspace = tswapal((abi_ulong)(uintptr_t)hki->ki_vmspace);
+    tki->ki_wchan = tswapal((abi_ulong)(uintptr_t)hki->ki_wchan);
+
+    __put_user(hki->ki_pid, &tki->ki_pid);
+    __put_user(hki->ki_ppid, &tki->ki_ppid);
+    __put_user(hki->ki_pgid, &tki->ki_pgid);
+    __put_user(hki->ki_tpgid, &tki->ki_tpgid);
+    __put_user(hki->ki_sid, &tki->ki_sid);
+    __put_user(hki->ki_tsid, &tki->ki_tsid);
+    __put_user(hki->ki_jobc, &tki->ki_jobc);
+    __put_user(hki->ki_tdev, &tki->ki_tdev);
+
+    host_to_target_sigset(&tki->ki_siglist, &hki->ki_siglist);
+    host_to_target_sigset(&tki->ki_sigmask, &hki->ki_sigmask);
+    host_to_target_sigset(&tki->ki_sigignore, &hki->ki_sigignore);
+    host_to_target_sigset(&tki->ki_sigcatch, &hki->ki_sigcatch);
+
+    __put_user(hki->ki_uid, &tki->ki_uid);
+    __put_user(hki->ki_ruid, &tki->ki_ruid);
+    __put_user(hki->ki_svuid, &tki->ki_svuid);
+    __put_user(hki->ki_rgid, &tki->ki_rgid);
+    __put_user(hki->ki_svgid, &tki->ki_svgid);
+    __put_user(hki->ki_ngroups, &tki->ki_ngroups);
+
+    for (i=0; i < TARGET_KI_NGROUPS; i++)
+        __put_user(hki->ki_groups[i], &tki->ki_groups[i]);
+
+    __put_user(hki->ki_size, &tki->ki_size);
+
+    __put_user(hki->ki_rssize, &tki->ki_rssize);
+    __put_user(hki->ki_swrss, &tki->ki_swrss);
+    __put_user(hki->ki_tsize, &tki->ki_tsize);
+    __put_user(hki->ki_dsize, &tki->ki_dsize);
+    __put_user(hki->ki_ssize, &tki->ki_ssize);
+
+    __put_user(hki->ki_xstat, &tki->ki_xstat);
+    __put_user(hki->ki_acflag, &tki->ki_acflag);
+
+    __put_user(hki->ki_pctcpu, &tki->ki_pctcpu);
+
+    __put_user(hki->ki_estcpu, &tki->ki_estcpu);
+    __put_user(hki->ki_slptime, &tki->ki_slptime);
+    __put_user(hki->ki_swtime, &tki->ki_swtime);
+    __put_user(hki->ki_cow, &tki->ki_cow);
+    __put_user(hki->ki_runtime, &tki->ki_runtime);
+
+    __put_user(hki->ki_start.tv_sec, &tki->ki_start.tv_sec);
+    __put_user(hki->ki_start.tv_usec, &tki->ki_start.tv_usec);
+    __put_user(hki->ki_childtime.tv_sec, &tki->ki_childtime.tv_sec);
+    __put_user(hki->ki_childtime.tv_usec, &tki->ki_childtime.tv_usec);
+
+    __put_user(hki->ki_flag, &tki->ki_flag);
+    __put_user(hki->ki_kiflag, &tki->ki_kiflag);
+
+    __put_user(hki->ki_traceflag, &tki->ki_traceflag);
+    __put_user(hki->ki_stat, &tki->ki_stat);
+    __put_user(hki->ki_nice, &tki->ki_nice);
+    __put_user(hki->ki_lock, &tki->ki_lock);
+    __put_user(hki->ki_rqindex, &tki->ki_rqindex);
+    __put_user(hki->ki_oncpu_old, &tki->ki_oncpu_old);
+    __put_user(hki->ki_lastcpu_old, &tki->ki_lastcpu_old);
+
+    strncpy(tki->ki_tdname, hki->ki_tdname, TARGET_TDNAMLEN+1);
+    strncpy(tki->ki_wmesg, hki->ki_wmesg, TARGET_WMESGLEN+1);
+    strncpy(tki->ki_login, hki->ki_login, TARGET_LOGNAMELEN+1);
+    strncpy(tki->ki_lockname, hki->ki_lockname, TARGET_LOCKNAMELEN+1);
+    strncpy(tki->ki_comm, hki->ki_comm, TARGET_COMMLEN+1);
+    strncpy(tki->ki_emul, hki->ki_emul, TARGET_KI_EMULNAMELEN+1);
+    strncpy(tki->ki_loginclass, hki->ki_loginclass, TARGET_LOGINCLASSLEN+1);
+
+    __put_user(hki->ki_oncpu, &tki->ki_oncpu);
+    __put_user(hki->ki_lastcpu, &tki->ki_lastcpu);
+    __put_user(hki->ki_tracer, &tki->ki_tracer);
+    __put_user(hki->ki_flag2, &tki->ki_flag2);
+    __put_user(hki->ki_fibnum, &tki->ki_fibnum);
+    __put_user(hki->ki_cr_flags, &tki->ki_cr_flags);
+    __put_user(hki->ki_jid, &tki->ki_jid);
+    __put_user(hki->ki_numthreads, &tki->ki_numthreads);
+    __put_user(hki->ki_tid, &tki->ki_tid);
+
+    memcpy(&tki->ki_pri, &hki->ki_pri, sizeof(struct target_priority));
+
+    h2g_rusage(&hki->ki_rusage, &tki->ki_rusage);
+    h2g_rusage(&hki->ki_rusage_ch, &tki->ki_rusage_ch);
+
+    __put_user(((uintptr_t)hki->ki_pcb), &tki->ki_pcb);
+    __put_user(((uintptr_t)hki->ki_kstack), &tki->ki_kstack);
+    __put_user(((uintptr_t)hki->ki_udata), &tki->ki_udata);
+    __put_user(((uintptr_t)hki->ki_tdaddr), &tki->ki_tdaddr);
+
+    __put_user(hki->ki_sflag, &tki->ki_sflag);
+    __put_user(hki->ki_tdflags, &tki->ki_tdflags);
+}
+
+abi_long
+do_sysctl_kern_getprocs(int op, int arg, size_t olen,
+        struct target_kinfo_proc *tki, size_t *tlen)
+{
+    abi_long ret;
+    struct kinfo_proc *kipp;
+    int mib[4], num, i, miblen;
+    size_t len;
+
+    if (tlen == NULL)
+        return -TARGET_EINVAL;
+
+    mib[0] = CTL_KERN;
+    mib[1] = KERN_PROC;
+    mib[2] = op;
+    mib[3] = arg;
+
+    miblen = (op == KERN_PROC_ALL || op == KERN_PROC_PROC) ?  3 : 4;
+
+    len = 0;
+    ret = get_errno(sysctl(mib, miblen, NULL, &len, NULL, 0));
+    if (is_error(ret))
+        return ret;
+
+    num = len / sizeof(*kipp);
+    *tlen = num * sizeof(struct target_kinfo_proc);
+    if (tki == NULL)
+        return ret;
+
+    if (olen < *tlen)
+        return -TARGET_EINVAL;
+
+    kipp = g_malloc(len);
+    if (kipp == NULL)
+        return -TARGET_ENOMEM;
+    ret = get_errno(sysctl(mib, miblen, kipp, &len, NULL, 0));
+    num = len / sizeof(*kipp);
+    *tlen = num * sizeof(struct target_kinfo_proc);
+    if (len % sizeof(*kipp) != 0 || kipp->ki_structsize != sizeof(*kipp)) {
+        ret = -TARGET_EINVAL; /* XXX */
+    } else if (!is_error(ret)) {
+        for(i=0; i < num; i++)
+            host_to_target_kinfo_proc(&tki[i], &kipp[i]);
+    }
+
+    g_free(kipp);
+    return ret;
+}
+
 /*
  * This uses the undocumented oidfmt interface to find the kind of a requested
  * sysctl, see /sys/kern/kern_sysctl.c:sysctl_sysctl_oidfmt() (compare to
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 49468734d44..fcaf794ad6e 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -258,6 +258,9 @@ bool is_error(abi_long ret);
 int host_to_target_errno(int err);
 
 /* os-sys.c */
+struct target_kinfo_proc;
+abi_long do_sysctl_kern_getprocs(int op, int arg, size_t olen,
+        struct target_kinfo_proc *tki, size_t *tlen);
 abi_long do_freebsd_sysctl(CPUArchState *env, abi_ulong namep, int32_t namelen,
         abi_ulong oldp, abi_ulong oldlenp, abi_ulong newp, abi_ulong newlen);
 abi_long do_freebsd_sysctlbyname(CPUArchState *env, abi_ulong namep,
-- 
2.40.0


