Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFF13BAE60
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 20:45:33 +0200 (CEST)
Received: from localhost ([::1]:48302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m077U-0007lT-BK
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 14:45:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m070g-0002Qc-8W
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 14:38:30 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:38594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m070e-0006aD-CG
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 14:38:29 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 b14-20020a1c1b0e0000b02901fc3a62af78so5948591wmb.3
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 11:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CJuIK368crXe4pOjtmWBTUggvUT1LK0ej7CmcSbklm8=;
 b=msydWrXEBpJq6z/M6aG0q+c7Qjtv+m38qU4fn2hPwQ1MxZzVxvfPNjBFZjebsJk2ey
 fTXmN0I9DYyEN4wAiGMJSb7RydGsQN3z/4ca3cNJQvTNhNT1LYwOFn65GjLZ6ZFDhTPU
 tEYTv8T5Kdma2OTuFOdU/Q7Z2ZITQj4qt6IsPcLymKq08Romoud3AwaPBxd1ksNeFpNt
 8YfcAlaRCNTmZ+ujsopnG9BQCcvSwJh3WwHIs/cB5Koi1nLBmuM0X5Vr38GGEsDVrUdp
 mDBNaEd67nsCb9pivAdSKy+IOzA92ZOWDUXs3w9VWTlfWZEF6jVItyAy2eCgX3Ly+jZu
 n0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CJuIK368crXe4pOjtmWBTUggvUT1LK0ej7CmcSbklm8=;
 b=KU/CC4X8QbYoUh8EoeAI3nznfbnLabqzCGtmeJ00/R/Mhm3ikUA6wRGX1uNPiNrF/M
 gM/mhF9Xd45QifToFi+tKZYOENm5+3ijSFSriAZjombAmY0Gx86nYW+ZqatHXYCtNQFz
 L8yxu++VaD2r5oLqKkyzgw5Lal0TW1SDTlS/tmUP9Cb0N/UyHt6FqDSLKCRPIXGWBc53
 c5NsPIZUGxpjccBxt10Ep7bmQdLB6WblqsWxO8ROBdgvw5K+ZSMiObVmASsCNfkhR7rv
 IdHSeuM8fCJbjjx7bSoUzmsxSiWiSqB/KADzUJ/KxqavlrOi3QlwABDmM7UDKYj9+j0z
 m6+Q==
X-Gm-Message-State: AOAM533LBwdOMXrieDdbU3gUGSh+OtBuffBCy+tjLr343BuRokF8gz6b
 QAEN320SlQJxh+IsgZUAlkkIg3L9TJw=
X-Google-Smtp-Source: ABdhPJx7rcjIHpLxd0DRmDMdNBaWs3XeeRXEC3IVwiLUhIrXW5/l9qZ08jZD0T4H2uTz0RQqGJtphQ==
X-Received: by 2002:a1c:9a8a:: with SMTP id c132mr10700025wme.52.1625423906368; 
 Sun, 04 Jul 2021 11:38:26 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id l17sm2465884wmq.3.2021.07.04.11.38.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 11:38:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/12] linux-user/alpha: Remove hardcoded tabs (code style)
Date: Sun,  4 Jul 2021 20:37:49 +0200
Message-Id: <20210704183755.655002-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210704183755.655002-1-f4bug@amsat.org>
References: <20210704183755.655002-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
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

We are going to move this code, fix its style first.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Patch trivial to review using 'git-diff --ignore-all-space'
---
 linux-user/alpha/target_syscall.h | 196 +++++++++++++++---------------
 1 file changed, 97 insertions(+), 99 deletions(-)

diff --git a/linux-user/alpha/target_syscall.h b/linux-user/alpha/target_syscall.h
index 4e6f9360566..13a71f35eaf 100644
--- a/linux-user/alpha/target_syscall.h
+++ b/linux-user/alpha/target_syscall.h
@@ -47,196 +47,194 @@ struct target_pt_regs {
 #undef TARGET_EWOULDBLOCK
 #define TARGET_EWOULDBLOCK      TARGET_EAGAIN /* Operation would block */
 #undef TARGET_EDEADLK
-#define TARGET_EDEADLK		11
+#define TARGET_EDEADLK          11
 #undef TARGET_EAGAIN
-#define TARGET_EAGAIN		35
+#define TARGET_EAGAIN           35
 #undef TARGET_EINPROGRESS
-#define TARGET_EINPROGRESS	36
+#define TARGET_EINPROGRESS      36
 #undef TARGET_EALREADY
-#define TARGET_EALREADY		37
+#define TARGET_EALREADY         37
 #undef TARGET_ENOTSOCK
-#define TARGET_ENOTSOCK		38
+#define TARGET_ENOTSOCK         38
 #undef TARGET_EDESTADDRREQ
-#define TARGET_EDESTADDRREQ	39
+#define TARGET_EDESTADDRREQ     39
 #undef TARGET_EMSGSIZE
-#define TARGET_EMSGSIZE		40
+#define TARGET_EMSGSIZE         40
 #undef TARGET_EPROTOTYPE
-#define TARGET_EPROTOTYPE	41
+#define TARGET_EPROTOTYPE       41
 #undef TARGET_ENOPROTOOPT
-#define TARGET_ENOPROTOOPT	42
+#define TARGET_ENOPROTOOPT      42
 #undef TARGET_EPROTONOSUPPORT
-#define TARGET_EPROTONOSUPPORT	43
+#define TARGET_EPROTONOSUPPORT  43
 #undef TARGET_ESOCKTNOSUPPORT
-#define TARGET_ESOCKTNOSUPPORT	44
+#define TARGET_ESOCKTNOSUPPORT  44
 #undef TARGET_EOPNOTSUPP
-#define TARGET_EOPNOTSUPP	45
+#define TARGET_EOPNOTSUPP       45
 #undef TARGET_EPFNOSUPPORT
-#define TARGET_EPFNOSUPPORT	46
+#define TARGET_EPFNOSUPPORT     46
 #undef TARGET_EAFNOSUPPORT
-#define TARGET_EAFNOSUPPORT	47
+#define TARGET_EAFNOSUPPORT     47
 #undef TARGET_EADDRINUSE
-#define TARGET_EADDRINUSE	48
+#define TARGET_EADDRINUSE       48
 #undef TARGET_EADDRNOTAVAIL
-#define TARGET_EADDRNOTAVAIL	49
+#define TARGET_EADDRNOTAVAIL    49
 #undef TARGET_ENETDOWN
-#define TARGET_ENETDOWN		50
+#define TARGET_ENETDOWN         50
 #undef TARGET_ENETUNREACH
-#define TARGET_ENETUNREACH	51
+#define TARGET_ENETUNREACH      51
 #undef TARGET_ENETRESET
-#define TARGET_ENETRESET	52
+#define TARGET_ENETRESET        52
 #undef TARGET_ECONNABORTED
-#define TARGET_ECONNABORTED	53
+#define TARGET_ECONNABORTED     53
 #undef TARGET_ECONNRESET
-#define TARGET_ECONNRESET	54
+#define TARGET_ECONNRESET       54
 #undef TARGET_ENOBUFS
-#define TARGET_ENOBUFS		55
+#define TARGET_ENOBUFS          55
 #undef TARGET_EISCONN
-#define TARGET_EISCONN		56
+#define TARGET_EISCONN          56
 #undef TARGET_ENOTCONN
-#define TARGET_ENOTCONN		57
+#define TARGET_ENOTCONN         57
 #undef TARGET_ESHUTDOWN
-#define TARGET_ESHUTDOWN	58
+#define TARGET_ESHUTDOWN        58
 #undef TARGET_ETOOMANYREFS
-#define TARGET_ETOOMANYREFS	59
+#define TARGET_ETOOMANYREFS     59
 #undef TARGET_ETIMEDOUT
-#define TARGET_ETIMEDOUT	60
+#define TARGET_ETIMEDOUT        60
 #undef TARGET_ECONNREFUSED
-#define TARGET_ECONNREFUSED	61
+#define TARGET_ECONNREFUSED     61
 #undef TARGET_ELOOP
-#define TARGET_ELOOP		62
+#define TARGET_ELOOP            62
 #undef TARGET_ENAMETOOLONG
-#define TARGET_ENAMETOOLONG	63
+#define TARGET_ENAMETOOLONG     63
 #undef TARGET_EHOSTDOWN
-#define TARGET_EHOSTDOWN	64
+#define TARGET_EHOSTDOWN        64
 #undef TARGET_EHOSTUNREACH
-#define TARGET_EHOSTUNREACH	65
+#define TARGET_EHOSTUNREACH     65
 #undef TARGET_ENOTEMPTY
-#define TARGET_ENOTEMPTY	66
-// Unused			67
+#define TARGET_ENOTEMPTY        66
+/* Unused                       67 */
 #undef TARGET_EUSERS
-#define TARGET_EUSERS		68
+#define TARGET_EUSERS           68
 #undef TARGET_EDQUOT
-#define TARGET_EDQUOT		69
+#define TARGET_EDQUOT           69
 #undef TARGET_ESTALE
-#define TARGET_ESTALE		70
+#define TARGET_ESTALE           70
 #undef TARGET_EREMOTE
-#define TARGET_EREMOTE		71
-// Unused			72-76
+#define TARGET_EREMOTE          71
+/* Unused                       72-76 */
 #undef TARGET_ENOLCK
-#define TARGET_ENOLCK		77
+#define TARGET_ENOLCK           77
 #undef TARGET_ENOSYS
-#define TARGET_ENOSYS		78
-// Unused			79
+#define TARGET_ENOSYS           78
+/* Unused                       79 */
 #undef TARGET_ENOMSG
-#define TARGET_ENOMSG		80
+#define TARGET_ENOMSG           80
 #undef TARGET_EIDRM
-#define TARGET_EIDRM		81
+#define TARGET_EIDRM            81
 #undef TARGET_ENOSR
-#define TARGET_ENOSR		82
+#define TARGET_ENOSR            82
 #undef TARGET_ETIME
-#define TARGET_ETIME		83
+#define TARGET_ETIME            83
 #undef TARGET_EBADMSG
-#define TARGET_EBADMSG		84
+#define TARGET_EBADMSG          84
 #undef TARGET_EPROTO
-#define TARGET_EPROTO		85
+#define TARGET_EPROTO           85
 #undef TARGET_ENODATA
-#define TARGET_ENODATA		86
+#define TARGET_ENODATA          86
 #undef TARGET_ENOSTR
-#define TARGET_ENOSTR		87
+#define TARGET_ENOSTR           87
 #undef TARGET_ECHRNG
-#define TARGET_ECHRNG		88
+#define TARGET_ECHRNG           88
 #undef TARGET_EL2NSYNC
-#define TARGET_EL2NSYNC		89
+#define TARGET_EL2NSYNC         89
 #undef TARGET_EL3HLT
-#define TARGET_EL3HLT		90
+#define TARGET_EL3HLT           90
 #undef TARGET_EL3RST
-#define TARGET_EL3RST		91
+#define TARGET_EL3RST           91
 #undef TARGET_ENOPKG
-#define TARGET_ENOPKG		92
+#define TARGET_ENOPKG           92
 #undef TARGET_ELNRNG
-#define TARGET_ELNRNG		93
+#define TARGET_ELNRNG           93
 #undef TARGET_EUNATCH
-#define TARGET_EUNATCH		94
+#define TARGET_EUNATCH          94
 #undef TARGET_ENOCSI
-#define TARGET_ENOCSI		95
+#define TARGET_ENOCSI           95
 #undef TARGET_EL2HLT
-#define TARGET_EL2HLT		96
+#define TARGET_EL2HLT           96
 #undef TARGET_EBADE
-#define TARGET_EBADE		97
+#define TARGET_EBADE            97
 #undef TARGET_EBADR
-#define TARGET_EBADR		98
+#define TARGET_EBADR            98
 #undef TARGET_EXFULL
-#define TARGET_EXFULL		99
+#define TARGET_EXFULL           99
 #undef TARGET_ENOANO
-#define TARGET_ENOANO		100
+#define TARGET_ENOANO           100
 #undef TARGET_EBADRQC
-#define TARGET_EBADRQC		101
+#define TARGET_EBADRQC          101
 #undef TARGET_EBADSLT
-#define TARGET_EBADSLT		102
-// Unused			103
+#define TARGET_EBADSLT          102
+/* Unused                       103 */
 #undef TARGET_EBFONT
-#define TARGET_EBFONT		104
+#define TARGET_EBFONT           104
 #undef TARGET_ENONET
-#define TARGET_ENONET		105
+#define TARGET_ENONET           105
 #undef TARGET_ENOLINK
-#define TARGET_ENOLINK		106
+#define TARGET_ENOLINK          106
 #undef TARGET_EADV
-#define TARGET_EADV		107
+#define TARGET_EADV             107
 #undef TARGET_ESRMNT
-#define TARGET_ESRMNT		108
+#define TARGET_ESRMNT           108
 #undef TARGET_ECOMM
-#define TARGET_ECOMM		109
+#define TARGET_ECOMM            109
 #undef TARGET_EMULTIHOP
-#define TARGET_EMULTIHOP	110
+#define TARGET_EMULTIHOP        110
 #undef TARGET_EDOTDOT
-#define TARGET_EDOTDOT		111
+#define TARGET_EDOTDOT          111
 #undef TARGET_EOVERFLOW
-#define TARGET_EOVERFLOW	112
+#define TARGET_EOVERFLOW        112
 #undef TARGET_ENOTUNIQ
-#define TARGET_ENOTUNIQ		113
+#define TARGET_ENOTUNIQ         113
 #undef TARGET_EBADFD
-#define TARGET_EBADFD		114
+#define TARGET_EBADFD           114
 #undef TARGET_EREMCHG
-#define TARGET_EREMCHG		115
+#define TARGET_EREMCHG          115
 #undef TARGET_EILSEQ
-#define TARGET_EILSEQ		116
-
-// Same as default		117-121
-
+#define TARGET_EILSEQ           116
+/* Same as default              117-121 */
 #undef TARGET_ELIBACC
-#define TARGET_ELIBACC		122
+#define TARGET_ELIBACC          122
 #undef TARGET_ELIBBAD
-#define TARGET_ELIBBAD		123
+#define TARGET_ELIBBAD          123
 #undef TARGET_ELIBSCN
-#define TARGET_ELIBSCN		124
+#define TARGET_ELIBSCN          124
 #undef TARGET_ELIBMAX
-#define TARGET_ELIBMAX		125
+#define TARGET_ELIBMAX          125
 #undef TARGET_ELIBEXEC
-#define TARGET_ELIBEXEC		126
+#define TARGET_ELIBEXEC         126
 #undef TARGET_ERESTART
-#define TARGET_ERESTART		127
+#define TARGET_ERESTART         127
 #undef TARGET_ESTRPIPE
-#define TARGET_ESTRPIPE		128
+#define TARGET_ESTRPIPE         128
 #undef TARGET_ENOMEDIUM
-#define TARGET_ENOMEDIUM	129
+#define TARGET_ENOMEDIUM        129
 #undef TARGET_EMEDIUMTYPE
-#define TARGET_EMEDIUMTYPE	130
+#define TARGET_EMEDIUMTYPE      130
 #undef TARGET_ECANCELED
-#define TARGET_ECANCELED	131
+#define TARGET_ECANCELED        131
 #undef TARGET_ENOKEY
-#define TARGET_ENOKEY		132
+#define TARGET_ENOKEY           132
 #undef TARGET_EKEYEXPIRED
-#define TARGET_EKEYEXPIRED	133
+#define TARGET_EKEYEXPIRED      133
 #undef TARGET_EKEYREVOKED
-#define TARGET_EKEYREVOKED	134
+#define TARGET_EKEYREVOKED      134
 #undef TARGET_EKEYREJECTED
-#define TARGET_EKEYREJECTED	135
+#define TARGET_EKEYREJECTED     135
 #undef TARGET_EOWNERDEAD
-#define TARGET_EOWNERDEAD	136
+#define TARGET_EOWNERDEAD       136
 #undef TARGET_ENOTRECOVERABLE
-#define TARGET_ENOTRECOVERABLE	137
+#define TARGET_ENOTRECOVERABLE  137
 #undef TARGET_ERFKILL
-#define TARGET_ERFKILL		138
+#define TARGET_ERFKILL          138
 #undef TARGET_EHWPOISON
 #define TARGET_EHWPOISON        139
 
-- 
2.31.1


