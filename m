Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D32E3C71E8
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 16:14:10 +0200 (CEST)
Received: from localhost ([::1]:49158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3JAn-00071U-6u
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 10:14:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m3Ifp-0000UJ-DW
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:42:09 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:51887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m3Ifm-00069R-Qz
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:42:09 -0400
Received: from quad ([82.142.17.146]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1ML9i0-1lmK3C125C-00IAt1; Tue, 13
 Jul 2021 15:41:56 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 04/12] linux-user/alpha: Move errno definitions to
 'target_errno_defs.h'
Date: Tue, 13 Jul 2021 15:41:44 +0200
Message-Id: <20210713134152.288423-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210713134152.288423-1-laurent@vivier.eu>
References: <20210713134152.288423-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:yq79lh/77TS3yhRxxYGRxNIuWpbOGxBEz+YPAfLRAXgWslKt+TY
 EilWBQf7tAHyAHK72K4BkJZzeKykkKyf46aHezE0nfJXcozsB/ffgt6Wj7V7z6TCv9coq81
 Z+kxnBv2Hz2G/IBNpoY/qgV3sAEsh10CUnvtPVUNw6E8Ik2Bwfl2pjaVgI9HmynqfNuDMWI
 tza+Ij2ZNyg3zqmesXW5Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:S2SRRlhI3Tc=:HCVMWEHbp4vGtmqfRpVMK2
 /9DkfyoAJMRGf/9Zn+9zZT86DaPbbQmHxVM45XCxApldITtkEobDuvX5U/yhHp8/AoI0sxq3Q
 gZAqSpwhh7ga7dfteGYG02JLmtSInXIkJ3kg+7PiiR6p+1+zW7ZPVYeMlJkbfrAH7TObgHvWc
 mjFg3l2kuVQw2e0oHN03xpdMBYEufWaFu2ic9uBk8n6tVkC+Go/IFgCtj86hAMIvH2b6SL0yX
 Q57zwa5/CXtkbShRSn80HhbPtnfwMJcYYy0w6qU0XSLiA+YMs+TKlxw1hJTBFSNUmON8y63jO
 Xp2ShTDO0LlvHQ+zSYZxGBTMTz8YHcTWcX3BhUJeKGf00enBBaydD9k6FZzGCYP7AUld5uePV
 a8r/lI9KpCt99ptV1ld6Wxthr7hWMvf2mffZ8M7ut/msyWxH/a2P++QzAEREELPLAb9SEs3E0
 8V/WDIidQBDxB1bPZWl24vyZHcX6RrbjKl+niLOummhNzmU0tNA7g9AcQkPDutztjAeZlYSmk
 xAYJaXQ4P1ISIntzBZvKOIBMuF6FZdiEmskgesmY02aurO6c7vV/4vYGtMzXyiGPDQC4f9u3B
 Y9N6Qh4WcIJltERQk7Wy3VxdtdiQJBgO1IMLiPDj/AHDWS4XNjCpgx6OUOWgb+IAehwSXscp2
 fJkpxQfx2dLvYBCO8nYnnHPIj+sz7GxEtrK37T1O5UjggBxjqz9VX0GOZe8OVZQ7g6glRSMei
 6tusuV30b8phaBIb5tVgrpkAeFe+iYYgylVB9XldA4NNdhhv2KdXjyN6jHuYbU10jESeCWtHh
 GOm/zk8nj1UR3k1aLaasuFr+nExTp4Yh+Qe/7y95OGdss9fdV+1wds88Y84+soCOiO/Vkk0
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210708170550.1846343-5-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/alpha/target_errno_defs.h | 198 +++++++++++++++++++++++++++
 linux-user/alpha/target_syscall.h    | 194 --------------------------
 2 files changed, 198 insertions(+), 194 deletions(-)

diff --git a/linux-user/alpha/target_errno_defs.h b/linux-user/alpha/target_errno_defs.h
index 54770108c02a..07924b13aafe 100644
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
index 13a71f35eaf3..03091bf0a826 100644
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


