Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F23B3BAE65
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 20:47:12 +0200 (CEST)
Received: from localhost ([::1]:52168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0795-00020w-Ht
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 14:47:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m070l-0002f7-0t
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 14:38:35 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:33609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m070i-0006ca-Us
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 14:38:34 -0400
Received: by mail-wr1-x435.google.com with SMTP id i8so19309404wrc.0
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 11:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WG98X5izSZqZWpgtQzpBw6SrWSZh6q07Xw6YeXrnmvo=;
 b=a6N5Wp8KyEzkVwA/rJBwPm8+AYOib5QMkmXNq2lJQ5aeQ3cOwDrVvokroghINvwhdb
 CwSAP/OuGYt9Vxclm0CqhsXeq3Oou9V8rjB4pmdwtuts5kDkiFJvx36wBSYlf64LObbZ
 mdU2E5GMihy57bwaIAm4k3GKJCHSQkqWXgiVZeE33gDh/MVHXhUTa0a9/HVUoy2/pa+3
 VoOhSbZ3MPlbZghxaZtngmxp/MrXLa3Z1E+6b2n2x6ba+uzTlbR/AcpNLHYZzvqAKOYK
 M7LKtlCSl7P8Q+I/hf38rMSs+Tgfw9zpAbY9unQk+nWf45kLjv+MNhg/Yr3T0X2E/ZAE
 R6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WG98X5izSZqZWpgtQzpBw6SrWSZh6q07Xw6YeXrnmvo=;
 b=H8AOnlpaDjCQnAtfAhoHKQK+Y7iZSm/cRnGqoJRAmNzW7h+Tq141gAsJAOKbkjblOr
 tNmV0hb2mb/YDXTWbcMTY1PgM00f+q42Ani9IRN6hFTxMfNwfzEz8ieoJJhNxZljKSeW
 rn4GMbRKQe4AOdJoDnGZ/HUpw9YYuuONUyY4gLxNlypDXXfEkhJjBX9HhTG553OjFAUQ
 8y0j5gIxJsUCln8K1vqS/C1OaFrQvdCEzQF8N59A1w+vJGoREm8YJaUbtY6YV/mh/oMh
 +iOhSk6Niw4FZbrv9MNFEYRbVmmLpTRjetwbbMSh4/rIQc+gwVopLNhMYXVtyPyZoGjO
 aEWA==
X-Gm-Message-State: AOAM530FU5ZWM2SFvxUK/cD7sdAVg9MU8/cvprrpCV0yzE7oCNqyBm7p
 OTwxrzYGuDOCTHBinMLGhD0d5VX4lBA=
X-Google-Smtp-Source: ABdhPJxtZ+pDCDmV+IidJ2val0CCenXwUc1k/zSevAI8rWkhT1Sf4LNFHFHriS0a+Fdc71Mnjf/qxA==
X-Received: by 2002:a5d:4dd0:: with SMTP id f16mr11005118wru.44.1625423911231; 
 Sun, 04 Jul 2021 11:38:31 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id e23sm5635259wme.31.2021.07.04.11.38.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 11:38:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/12] linux-user/alpha: Move errno definitions to
 'target_errno_defs.h'
Date: Sun,  4 Jul 2021 20:37:50 +0200
Message-Id: <20210704183755.655002-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210704183755.655002-1-f4bug@amsat.org>
References: <20210704183755.655002-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Helge Deller <deller@gmx.de>, Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Taylor Simpson <tsimpson@quicinc.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/alpha/target_errno_defs.h | 194 +++++++++++++++++++++++++++
 linux-user/alpha/target_syscall.h    | 194 ---------------------------
 2 files changed, 194 insertions(+), 194 deletions(-)

diff --git a/linux-user/alpha/target_errno_defs.h b/linux-user/alpha/target_errno_defs.h
index 13770b14b82..fae8a4f43a1 100644
--- a/linux-user/alpha/target_errno_defs.h
+++ b/linux-user/alpha/target_errno_defs.h
@@ -1,4 +1,198 @@
 #ifndef ALPHA_TARGET_ERRNO_H
 #define ALPHA_TARGET_ERRNO_H
 
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


