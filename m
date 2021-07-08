Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2573C188D
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:40:36 +0200 (CEST)
Received: from localhost ([::1]:37900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Y0p-0005tV-7H
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:40:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1XTb-0006Pc-BK
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:06:15 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:38812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1XTZ-0007y8-86
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:06:15 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 b14-20020a1c1b0e0000b02901fc3a62af78so7259496wmb.3
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 10:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rKz0MBltluybA0CvVtKsZwhPvK79l+VZrjjpxv2NlM4=;
 b=DDTm4hPw4ivU/B7dRSrormwSMxAk1H1mLJCuE+7rSn/fiw0ZP7VQbzb4FKza7IHnoz
 11wPIshCMWflmRn5Aa0CgcJJll67xWGAcJBPzaAeQPAubPx5kLD9CGDOxLTydgcKJeuM
 p9Mr7gv5dvDsKCzLFiymfWLIa513q21ium4M8x/upxihjjtjRMOrk69WrMgIqQdFyZ5a
 zrRxsDB0bAsHc/IbGnGe8CM+7B5qJ66zlhzaW5AQ+M5Kjhmg7/1qUGBtUB/IyEkqH5kS
 K0coAu+WXUHzyjXlBNbPf6voXply7L9USJ8+tEuHgXnUN97IJJK2yA5MPa267VR8g2tH
 YR/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rKz0MBltluybA0CvVtKsZwhPvK79l+VZrjjpxv2NlM4=;
 b=gqA2X4FJANfTVZJO0mrZMTvmla2WnQAWj8e5JLpYkhSihGpu8afTkmLgoYQQWsLfTc
 g7wlvLSBYi+4Qq9pCICn7GP38CbfvFUrP5UM4m3CPhX6j7GkfdhFqavOVoWDBKzFFnKI
 2X5ROyqH4ujewzeW6F3x7+y44Q5ZY1btJgy7fHpfqbZNMkPdGmt50BduKsVyCRb2foze
 sBwuNzSK5foOS7HxxrlVP+TN59wzwy9QoeOBPo/q+vRL1RqwZ+XSFAtqnSE6Ts5JH6C+
 X0509LxThnDbmg28gBkRpCSKgtyuHis6Dw8UXL7M2lGwB8sMzX+716RcIsyb+ocMR/tE
 1ntQ==
X-Gm-Message-State: AOAM5324lMk/ZG6u+lh/mGSTRoIn0Walh8hkk3iM1ITvUrGwBf+qcOr6
 v7h938IUHILdSYyE9GEYd0fuYYU0DOg=
X-Google-Smtp-Source: ABdhPJxhzzpdzbfQeAlba4Dl8di48LVDu0/t0PKqRuXoHzYsSDDLj6dian/DYS+bhnCOsxxr6vkYSA==
X-Received: by 2002:a05:600c:2058:: with SMTP id
 p24mr34308214wmg.76.1625763971601; 
 Thu, 08 Jul 2021 10:06:11 -0700 (PDT)
Received: from x1w.redhat.com (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id h15sm2769880wrq.88.2021.07.08.10.06.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 10:06:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/8] linux-user/alpha: Move errno definitions to
 'target_errno_defs.h'
Date: Thu,  8 Jul 2021 19:05:46 +0200
Message-Id: <20210708170550.1846343-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708170550.1846343-1-f4bug@amsat.org>
References: <20210708170550.1846343-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/alpha/target_errno_defs.h | 198 +++++++++++++++++++++++++++
 linux-user/alpha/target_syscall.h    | 194 --------------------------
 2 files changed, 198 insertions(+), 194 deletions(-)

diff --git a/linux-user/alpha/target_errno_defs.h b/linux-user/alpha/target_errno_defs.h
index 54770108c02..07924b13aaf 100644
--- a/linux-user/alpha/target_errno_defs.h
+++ b/linux-user/alpha/target_errno_defs.h
@@ -3,4 +3,202 @@
 
 #include "../generic/target_errno_defs.h"
 
+/*
+ * Generic target errno overridden with definitions taken
+ * from asm-alpha/errno.h
+ */
+#undef TARGET_EWOULDBLOCK
+#define TARGET_EWOULDBLOCK      TARGET_EAGAIN
+#undef TARGET_EDEADLK
+#define TARGET_EDEADLK          11
+#undef TARGET_EAGAIN
+#define TARGET_EAGAIN           35
+#undef TARGET_EINPROGRESS
+#define TARGET_EINPROGRESS      36
+#undef TARGET_EALREADY
+#define TARGET_EALREADY         37
+#undef TARGET_ENOTSOCK
+#define TARGET_ENOTSOCK         38
+#undef TARGET_EDESTADDRREQ
+#define TARGET_EDESTADDRREQ     39
+#undef TARGET_EMSGSIZE
+#define TARGET_EMSGSIZE         40
+#undef TARGET_EPROTOTYPE
+#define TARGET_EPROTOTYPE       41
+#undef TARGET_ENOPROTOOPT
+#define TARGET_ENOPROTOOPT      42
+#undef TARGET_EPROTONOSUPPORT
+#define TARGET_EPROTONOSUPPORT  43
+#undef TARGET_ESOCKTNOSUPPORT
+#define TARGET_ESOCKTNOSUPPORT  44
+#undef TARGET_EOPNOTSUPP
+#define TARGET_EOPNOTSUPP       45
+#undef TARGET_EPFNOSUPPORT
+#define TARGET_EPFNOSUPPORT     46
+#undef TARGET_EAFNOSUPPORT
+#define TARGET_EAFNOSUPPORT     47
+#undef TARGET_EADDRINUSE
+#define TARGET_EADDRINUSE       48
+#undef TARGET_EADDRNOTAVAIL
+#define TARGET_EADDRNOTAVAIL    49
+#undef TARGET_ENETDOWN
+#define TARGET_ENETDOWN         50
+#undef TARGET_ENETUNREACH
+#define TARGET_ENETUNREACH      51
+#undef TARGET_ENETRESET
+#define TARGET_ENETRESET        52
+#undef TARGET_ECONNABORTED
+#define TARGET_ECONNABORTED     53
+#undef TARGET_ECONNRESET
+#define TARGET_ECONNRESET       54
+#undef TARGET_ENOBUFS
+#define TARGET_ENOBUFS          55
+#undef TARGET_EISCONN
+#define TARGET_EISCONN          56
+#undef TARGET_ENOTCONN
+#define TARGET_ENOTCONN         57
+#undef TARGET_ESHUTDOWN
+#define TARGET_ESHUTDOWN        58
+#undef TARGET_ETOOMANYREFS
+#define TARGET_ETOOMANYREFS     59
+#undef TARGET_ETIMEDOUT
+#define TARGET_ETIMEDOUT        60
+#undef TARGET_ECONNREFUSED
+#define TARGET_ECONNREFUSED     61
+#undef TARGET_ELOOP
+#define TARGET_ELOOP            62
+#undef TARGET_ENAMETOOLONG
+#define TARGET_ENAMETOOLONG     63
+#undef TARGET_EHOSTDOWN
+#define TARGET_EHOSTDOWN        64
+#undef TARGET_EHOSTUNREACH
+#define TARGET_EHOSTUNREACH     65
+#undef TARGET_ENOTEMPTY
+#define TARGET_ENOTEMPTY        66
+/* Unused                       67 */
+#undef TARGET_EUSERS
+#define TARGET_EUSERS           68
+#undef TARGET_EDQUOT
+#define TARGET_EDQUOT           69
+#undef TARGET_ESTALE
+#define TARGET_ESTALE           70
+#undef TARGET_EREMOTE
+#define TARGET_EREMOTE          71
+/* Unused                       72-76 */
+#undef TARGET_ENOLCK
+#define TARGET_ENOLCK           77
+#undef TARGET_ENOSYS
+#define TARGET_ENOSYS           78
+/* Unused                       79 */
+#undef TARGET_ENOMSG
+#define TARGET_ENOMSG           80
+#undef TARGET_EIDRM
+#define TARGET_EIDRM            81
+#undef TARGET_ENOSR
+#define TARGET_ENOSR            82
+#undef TARGET_ETIME
+#define TARGET_ETIME            83
+#undef TARGET_EBADMSG
+#define TARGET_EBADMSG          84
+#undef TARGET_EPROTO
+#define TARGET_EPROTO           85
+#undef TARGET_ENODATA
+#define TARGET_ENODATA          86
+#undef TARGET_ENOSTR
+#define TARGET_ENOSTR           87
+#undef TARGET_ECHRNG
+#define TARGET_ECHRNG           88
+#undef TARGET_EL2NSYNC
+#define TARGET_EL2NSYNC         89
+#undef TARGET_EL3HLT
+#define TARGET_EL3HLT           90
+#undef TARGET_EL3RST
+#define TARGET_EL3RST           91
+#undef TARGET_ENOPKG
+#define TARGET_ENOPKG           92
+#undef TARGET_ELNRNG
+#define TARGET_ELNRNG           93
+#undef TARGET_EUNATCH
+#define TARGET_EUNATCH          94
+#undef TARGET_ENOCSI
+#define TARGET_ENOCSI           95
+#undef TARGET_EL2HLT
+#define TARGET_EL2HLT           96
+#undef TARGET_EBADE
+#define TARGET_EBADE            97
+#undef TARGET_EBADR
+#define TARGET_EBADR            98
+#undef TARGET_EXFULL
+#define TARGET_EXFULL           99
+#undef TARGET_ENOANO
+#define TARGET_ENOANO           100
+#undef TARGET_EBADRQC
+#define TARGET_EBADRQC          101
+#undef TARGET_EBADSLT
+#define TARGET_EBADSLT          102
+/* Unused                       103 */
+#undef TARGET_EBFONT
+#define TARGET_EBFONT           104
+#undef TARGET_ENONET
+#define TARGET_ENONET           105
+#undef TARGET_ENOLINK
+#define TARGET_ENOLINK          106
+#undef TARGET_EADV
+#define TARGET_EADV             107
+#undef TARGET_ESRMNT
+#define TARGET_ESRMNT           108
+#undef TARGET_ECOMM
+#define TARGET_ECOMM            109
+#undef TARGET_EMULTIHOP
+#define TARGET_EMULTIHOP        110
+#undef TARGET_EDOTDOT
+#define TARGET_EDOTDOT          111
+#undef TARGET_EOVERFLOW
+#define TARGET_EOVERFLOW        112
+#undef TARGET_ENOTUNIQ
+#define TARGET_ENOTUNIQ         113
+#undef TARGET_EBADFD
+#define TARGET_EBADFD           114
+#undef TARGET_EREMCHG
+#define TARGET_EREMCHG          115
+#undef TARGET_EILSEQ
+#define TARGET_EILSEQ           116
+/* Same as default              117-121 */
+#undef TARGET_ELIBACC
+#define TARGET_ELIBACC          122
+#undef TARGET_ELIBBAD
+#define TARGET_ELIBBAD          123
+#undef TARGET_ELIBSCN
+#define TARGET_ELIBSCN          124
+#undef TARGET_ELIBMAX
+#define TARGET_ELIBMAX          125
+#undef TARGET_ELIBEXEC
+#define TARGET_ELIBEXEC         126
+#undef TARGET_ERESTART
+#define TARGET_ERESTART         127
+#undef TARGET_ESTRPIPE
+#define TARGET_ESTRPIPE         128
+#undef TARGET_ENOMEDIUM
+#define TARGET_ENOMEDIUM        129
+#undef TARGET_EMEDIUMTYPE
+#define TARGET_EMEDIUMTYPE      130
+#undef TARGET_ECANCELED
+#define TARGET_ECANCELED        131
+#undef TARGET_ENOKEY
+#define TARGET_ENOKEY           132
+#undef TARGET_EKEYEXPIRED
+#define TARGET_EKEYEXPIRED      133
+#undef TARGET_EKEYREVOKED
+#define TARGET_EKEYREVOKED      134
+#undef TARGET_EKEYREJECTED
+#define TARGET_EKEYREJECTED     135
+#undef TARGET_EOWNERDEAD
+#define TARGET_EOWNERDEAD       136
+#undef TARGET_ENOTRECOVERABLE
+#define TARGET_ENOTRECOVERABLE  137
+#undef TARGET_ERFKILL
+#define TARGET_ERFKILL          138
+#undef TARGET_EHWPOISON
+#define TARGET_EHWPOISON        139
+
 #endif
diff --git a/linux-user/alpha/target_syscall.h b/linux-user/alpha/target_syscall.h
index 13a71f35eaf..03091bf0a82 100644
--- a/linux-user/alpha/target_syscall.h
+++ b/linux-user/alpha/target_syscall.h
@@ -44,200 +44,6 @@ struct target_pt_regs {
 #define UNAME_MACHINE "alpha"
 #define UNAME_MINIMUM_RELEASE "2.6.32"
 
-#undef TARGET_EWOULDBLOCK
-#define TARGET_EWOULDBLOCK      TARGET_EAGAIN /* Operation would block */
-#undef TARGET_EDEADLK
-#define TARGET_EDEADLK          11
-#undef TARGET_EAGAIN
-#define TARGET_EAGAIN           35
-#undef TARGET_EINPROGRESS
-#define TARGET_EINPROGRESS      36
-#undef TARGET_EALREADY
-#define TARGET_EALREADY         37
-#undef TARGET_ENOTSOCK
-#define TARGET_ENOTSOCK         38
-#undef TARGET_EDESTADDRREQ
-#define TARGET_EDESTADDRREQ     39
-#undef TARGET_EMSGSIZE
-#define TARGET_EMSGSIZE         40
-#undef TARGET_EPROTOTYPE
-#define TARGET_EPROTOTYPE       41
-#undef TARGET_ENOPROTOOPT
-#define TARGET_ENOPROTOOPT      42
-#undef TARGET_EPROTONOSUPPORT
-#define TARGET_EPROTONOSUPPORT  43
-#undef TARGET_ESOCKTNOSUPPORT
-#define TARGET_ESOCKTNOSUPPORT  44
-#undef TARGET_EOPNOTSUPP
-#define TARGET_EOPNOTSUPP       45
-#undef TARGET_EPFNOSUPPORT
-#define TARGET_EPFNOSUPPORT     46
-#undef TARGET_EAFNOSUPPORT
-#define TARGET_EAFNOSUPPORT     47
-#undef TARGET_EADDRINUSE
-#define TARGET_EADDRINUSE       48
-#undef TARGET_EADDRNOTAVAIL
-#define TARGET_EADDRNOTAVAIL    49
-#undef TARGET_ENETDOWN
-#define TARGET_ENETDOWN         50
-#undef TARGET_ENETUNREACH
-#define TARGET_ENETUNREACH      51
-#undef TARGET_ENETRESET
-#define TARGET_ENETRESET        52
-#undef TARGET_ECONNABORTED
-#define TARGET_ECONNABORTED     53
-#undef TARGET_ECONNRESET
-#define TARGET_ECONNRESET       54
-#undef TARGET_ENOBUFS
-#define TARGET_ENOBUFS          55
-#undef TARGET_EISCONN
-#define TARGET_EISCONN          56
-#undef TARGET_ENOTCONN
-#define TARGET_ENOTCONN         57
-#undef TARGET_ESHUTDOWN
-#define TARGET_ESHUTDOWN        58
-#undef TARGET_ETOOMANYREFS
-#define TARGET_ETOOMANYREFS     59
-#undef TARGET_ETIMEDOUT
-#define TARGET_ETIMEDOUT        60
-#undef TARGET_ECONNREFUSED
-#define TARGET_ECONNREFUSED     61
-#undef TARGET_ELOOP
-#define TARGET_ELOOP            62
-#undef TARGET_ENAMETOOLONG
-#define TARGET_ENAMETOOLONG     63
-#undef TARGET_EHOSTDOWN
-#define TARGET_EHOSTDOWN        64
-#undef TARGET_EHOSTUNREACH
-#define TARGET_EHOSTUNREACH     65
-#undef TARGET_ENOTEMPTY
-#define TARGET_ENOTEMPTY        66
-/* Unused                       67 */
-#undef TARGET_EUSERS
-#define TARGET_EUSERS           68
-#undef TARGET_EDQUOT
-#define TARGET_EDQUOT           69
-#undef TARGET_ESTALE
-#define TARGET_ESTALE           70
-#undef TARGET_EREMOTE
-#define TARGET_EREMOTE          71
-/* Unused                       72-76 */
-#undef TARGET_ENOLCK
-#define TARGET_ENOLCK           77
-#undef TARGET_ENOSYS
-#define TARGET_ENOSYS           78
-/* Unused                       79 */
-#undef TARGET_ENOMSG
-#define TARGET_ENOMSG           80
-#undef TARGET_EIDRM
-#define TARGET_EIDRM            81
-#undef TARGET_ENOSR
-#define TARGET_ENOSR            82
-#undef TARGET_ETIME
-#define TARGET_ETIME            83
-#undef TARGET_EBADMSG
-#define TARGET_EBADMSG          84
-#undef TARGET_EPROTO
-#define TARGET_EPROTO           85
-#undef TARGET_ENODATA
-#define TARGET_ENODATA          86
-#undef TARGET_ENOSTR
-#define TARGET_ENOSTR           87
-#undef TARGET_ECHRNG
-#define TARGET_ECHRNG           88
-#undef TARGET_EL2NSYNC
-#define TARGET_EL2NSYNC         89
-#undef TARGET_EL3HLT
-#define TARGET_EL3HLT           90
-#undef TARGET_EL3RST
-#define TARGET_EL3RST           91
-#undef TARGET_ENOPKG
-#define TARGET_ENOPKG           92
-#undef TARGET_ELNRNG
-#define TARGET_ELNRNG           93
-#undef TARGET_EUNATCH
-#define TARGET_EUNATCH          94
-#undef TARGET_ENOCSI
-#define TARGET_ENOCSI           95
-#undef TARGET_EL2HLT
-#define TARGET_EL2HLT           96
-#undef TARGET_EBADE
-#define TARGET_EBADE            97
-#undef TARGET_EBADR
-#define TARGET_EBADR            98
-#undef TARGET_EXFULL
-#define TARGET_EXFULL           99
-#undef TARGET_ENOANO
-#define TARGET_ENOANO           100
-#undef TARGET_EBADRQC
-#define TARGET_EBADRQC          101
-#undef TARGET_EBADSLT
-#define TARGET_EBADSLT          102
-/* Unused                       103 */
-#undef TARGET_EBFONT
-#define TARGET_EBFONT           104
-#undef TARGET_ENONET
-#define TARGET_ENONET           105
-#undef TARGET_ENOLINK
-#define TARGET_ENOLINK          106
-#undef TARGET_EADV
-#define TARGET_EADV             107
-#undef TARGET_ESRMNT
-#define TARGET_ESRMNT           108
-#undef TARGET_ECOMM
-#define TARGET_ECOMM            109
-#undef TARGET_EMULTIHOP
-#define TARGET_EMULTIHOP        110
-#undef TARGET_EDOTDOT
-#define TARGET_EDOTDOT          111
-#undef TARGET_EOVERFLOW
-#define TARGET_EOVERFLOW        112
-#undef TARGET_ENOTUNIQ
-#define TARGET_ENOTUNIQ         113
-#undef TARGET_EBADFD
-#define TARGET_EBADFD           114
-#undef TARGET_EREMCHG
-#define TARGET_EREMCHG          115
-#undef TARGET_EILSEQ
-#define TARGET_EILSEQ           116
-/* Same as default              117-121 */
-#undef TARGET_ELIBACC
-#define TARGET_ELIBACC          122
-#undef TARGET_ELIBBAD
-#define TARGET_ELIBBAD          123
-#undef TARGET_ELIBSCN
-#define TARGET_ELIBSCN          124
-#undef TARGET_ELIBMAX
-#define TARGET_ELIBMAX          125
-#undef TARGET_ELIBEXEC
-#define TARGET_ELIBEXEC         126
-#undef TARGET_ERESTART
-#define TARGET_ERESTART         127
-#undef TARGET_ESTRPIPE
-#define TARGET_ESTRPIPE         128
-#undef TARGET_ENOMEDIUM
-#define TARGET_ENOMEDIUM        129
-#undef TARGET_EMEDIUMTYPE
-#define TARGET_EMEDIUMTYPE      130
-#undef TARGET_ECANCELED
-#define TARGET_ECANCELED        131
-#undef TARGET_ENOKEY
-#define TARGET_ENOKEY           132
-#undef TARGET_EKEYEXPIRED
-#define TARGET_EKEYEXPIRED      133
-#undef TARGET_EKEYREVOKED
-#define TARGET_EKEYREVOKED      134
-#undef TARGET_EKEYREJECTED
-#define TARGET_EKEYREJECTED     135
-#undef TARGET_EOWNERDEAD
-#define TARGET_EOWNERDEAD       136
-#undef TARGET_ENOTRECOVERABLE
-#define TARGET_ENOTRECOVERABLE  137
-#undef TARGET_ERFKILL
-#define TARGET_ERFKILL          138
-#undef TARGET_EHWPOISON
-#define TARGET_EHWPOISON        139
-
 // For sys_osf_getsysinfo
 #define TARGET_GSI_UACPROC		8
 #define TARGET_GSI_IEEE_FP_CONTROL	45
-- 
2.31.1


