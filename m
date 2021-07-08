Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0733BF838
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 12:15:05 +0200 (CEST)
Received: from localhost ([::1]:36594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1R3g-0000oC-Jk
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 06:15:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1Qx5-0004rw-6x
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 06:08:15 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:35923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1Qx3-0001IN-2z
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 06:08:14 -0400
Received: from quad ([82.142.13.34]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M8yPu-1m4C6p3DKY-0068gn; Thu, 08
 Jul 2021 12:08:02 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 7/8] linux-user/alpha: Remove hardcoded tabs (code style)
Date: Thu,  8 Jul 2021 12:07:55 +0200
Message-Id: <20210708100756.212085-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708100756.212085-1-laurent@vivier.eu>
References: <20210708100756.212085-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+BpB57Lap3ebVEFW367IIBNX2/L6YEk2wbkTqPjFtubHsREXLmx
 yS33dHqbWIj9aJhKXDbviJvQngKkDvU5Tlh73e5HzrQY/ZR/Fv7a6VhlOlr6ZQAbBKq61Rb
 UeyG2MQ2UvbxRZuqYA48/JEwrNyHlpZBAeXYxjFpmuyeA6CRElyuGQnPMX03G8Fs+6Sr3/d
 aizoUfSRt3daFz1q1NB6Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VPIZE7Gq0KY=:nxRpTgAyyaXU41fV6xEyGr
 QlZYPsH+UIyFZvIuY3UMuSOeEuU5zTUGq6sMNT+neFqAkBuUsmD7IfEDoZxMxKcY4yoCT4Fk+
 M2IIyjm7YHilNUOtHU+cDh4btKQscOpm11i+eyAwvUbiTBfaT9ukkU6+4797o/hvMgjRXDv+I
 qJ+9FoUkCg+bgHpV4j7PffnLFUxfjDUh2SmzsRUu93P/wxL3qa9yRns/6e7gnyLPUZ3N6hgWu
 WteL9keVtLI6vbt3K/5dZjvM2dggnIMPt72hiE96DnoiRCZvy4gEltwL7m+BMIPPULyFLPvwX
 NzhrPfTpwGjqvDlkKKJqtc1xJ8gPu2GhbX427CUwOYhxg4yICFomUQ+KTeufWe0a4VG+TznRn
 qKzJJ6+aTOLGSaf5psiVmj1KpDucEWnm6aFlgu0lmSBUAbsk6f5yKs6i0Xvs3xlyytZCATk77
 gxhP45Eo0SgVeqF+v9k5gKySMZ+6I25Q1OACFCk3kZ6U4LdeJ+xaVryI/E6GLYElYQgzCVZUv
 lY3mRjvtrlyWMAAkWIvuBsXHXtNS8U0pK/mskaef/AqS7blrlssmrFR4Yj0YHF5WYWYCQXO7X
 8ZkJKxYD5GHtzrA+fbKj6k41uGMu7fIgp+XLn8dIgZP+dPQGsbxVgIM2aMEEY1t4jaZ5WH4Eu
 5KjZ6T2Pc8zO3JbW/LVucnfXUicb58mnA7h7hkGHA6Qq3GXrUjt4ijtRm4PWEOrS7kryEZ60H
 zLdqSH4LkDqghv2UKH6kwklkMSYCj65U8eD29riPC8BhfLmz3hwClLCnSXo8rUHt40qei6Tgd
 xPycUskYPukxwZBoLyGN4F4bd5Yb7JqJ1bKpHD/hmnGythFndNNBVykbQgfdp4bLyyldPxc
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

We are going to move this code, fix its style first.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210704183755.655002-7-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/alpha/target_syscall.h | 196 +++++++++++++++---------------
 1 file changed, 97 insertions(+), 99 deletions(-)

diff --git a/linux-user/alpha/target_syscall.h b/linux-user/alpha/target_syscall.h
index 4e6f93605660..13a71f35eaf3 100644
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


