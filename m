Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7C63BF818
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 12:10:05 +0200 (CEST)
Received: from localhost ([::1]:49012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Qyr-00073u-2T
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 06:10:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1Qx5-0004ry-7O
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 06:08:15 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:36349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1Qx3-0001IJ-33
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 06:08:14 -0400
Received: from quad ([82.142.13.34]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MOAJt-1lqeOx1NfN-00OV9O; Thu, 08
 Jul 2021 12:08:02 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 8/8] linux-user/syscall: Remove hardcoded tabs (code style)
Date: Thu,  8 Jul 2021 12:07:56 +0200
Message-Id: <20210708100756.212085-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708100756.212085-1-laurent@vivier.eu>
References: <20210708100756.212085-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:WOs0fu94TNCfhXwyITbFEfYbGb46VUNmzw1/P56Ww2dIDHY52fq
 C+duxRqMHzIgd60+WnHpbloT6ewND+ua0hPQhVxXiGsQ4P38T6cVAfUcFN+1xoXBna18xCM
 dSNXNtYrhuv0OsYiXXRi/S8u6CHStfArPPyPTm5bt733ljY/q0Lhz/qXXPGxAhWxee0thLS
 UHbx7cLZpw7z0mZ/shUSg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QKHHiFYtQDY=:Lzc1IQZYarVHN2p6OokLAL
 v7XCGNJOmBLJkcGbE2p9zUnLCA+7a1sLm2brqAE7PUYDDWMbczhvbNgwvfdpe+LhnpUtocPFp
 d2rbVt12SVbpT8VDU+94GNmKc0MO8s9gZW3pRlSkp64T4J9BY2naB+XvsQ0HcVtfHt8u+2nk4
 bWWJbwOElm1ICOOZ8sOxg3Vjg+Jj1mPxMjMHq/FYleA7mQTDyar/mWzdv1ZRfI2Y2+TNwRW0s
 Kbh8UHJyzASfXtkGBZ8KqTQ5psyYy3qbfxt5Vhay5ztSqmEFxJrnXm/DRIYvjJhzZIokilUUK
 yGfMqGVv3QNvr88kuKMXlJZuRMRtRFsgqNLdo/Fel/+i7QN7c0LiABvzazAXFL0tK/rNuzrWG
 2nnmiYwpNUrwJXk7ZCe23dkQI00bcR3XOMBleaNDAohUx3upcm7fwFiNmbhDOIQVup5JCSTkq
 LIFC+7N2kEqvYBNQfDQEFYaAOgvy61D6YqESj42qEuDoHp76OZviV0dwMsSXPQbo6eudZ7o87
 MQcPMBd7udiaNYC5deOx3W4pvqjP8mo3T11G8E+8DGx8EuNEOab1LhTwbQmLXjrP8BpMCMpOv
 qJ7991ODoA0yndIdzTMt+SleK7VB9SfxXkw0rDHssdh5EESB169/bVsYw23TNgdZliaYOvFhM
 GmW3CYnKgAh1/y0XKyWJK5xGF+rE0yC/TnEknYfUoJQicRADyHp5Fqe7geOYHd4EZyRDst4MB
 S8Z/XzrWb815Jgl2ahMFubJU16lSk/fQu0Ne1iqMbGDcQ8V6aYDMFboptTW5cgU7182gr7PDy
 vfDLOgrY/CqYebAOuKcOHTXANkzOerfX3djmpEb5ILfI9V3xcJE9UQtlvX9jMHdWl0iN/52
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UPPERCASE_75_100=0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

We are going to move this code, fix its style first.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210704183755.655002-12-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 188 +++++++++++++++++++++----------------------
 1 file changed, 94 insertions(+), 94 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 3bc06d178e83..2e826206d227 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -519,112 +519,112 @@ static uint16_t target_to_host_errno_table[ERRNO_TABLE_SIZE] = {
  * minus the errnos that are not actually generic to all archs.
  */
 static uint16_t host_to_target_errno_table[ERRNO_TABLE_SIZE] = {
-    [EAGAIN]		= TARGET_EAGAIN,
-    [EIDRM]		= TARGET_EIDRM,
-    [ECHRNG]		= TARGET_ECHRNG,
-    [EL2NSYNC]		= TARGET_EL2NSYNC,
-    [EL3HLT]		= TARGET_EL3HLT,
-    [EL3RST]		= TARGET_EL3RST,
-    [ELNRNG]		= TARGET_ELNRNG,
-    [EUNATCH]		= TARGET_EUNATCH,
-    [ENOCSI]		= TARGET_ENOCSI,
-    [EL2HLT]		= TARGET_EL2HLT,
-    [EDEADLK]		= TARGET_EDEADLK,
-    [ENOLCK]		= TARGET_ENOLCK,
-    [EBADE]		= TARGET_EBADE,
-    [EBADR]		= TARGET_EBADR,
-    [EXFULL]		= TARGET_EXFULL,
-    [ENOANO]		= TARGET_ENOANO,
-    [EBADRQC]		= TARGET_EBADRQC,
-    [EBADSLT]		= TARGET_EBADSLT,
-    [EBFONT]		= TARGET_EBFONT,
-    [ENOSTR]		= TARGET_ENOSTR,
-    [ENODATA]		= TARGET_ENODATA,
-    [ETIME]		= TARGET_ETIME,
-    [ENOSR]		= TARGET_ENOSR,
-    [ENONET]		= TARGET_ENONET,
-    [ENOPKG]		= TARGET_ENOPKG,
-    [EREMOTE]		= TARGET_EREMOTE,
-    [ENOLINK]		= TARGET_ENOLINK,
-    [EADV]		= TARGET_EADV,
-    [ESRMNT]		= TARGET_ESRMNT,
-    [ECOMM]		= TARGET_ECOMM,
-    [EPROTO]		= TARGET_EPROTO,
-    [EDOTDOT]		= TARGET_EDOTDOT,
-    [EMULTIHOP]		= TARGET_EMULTIHOP,
-    [EBADMSG]		= TARGET_EBADMSG,
-    [ENAMETOOLONG]	= TARGET_ENAMETOOLONG,
-    [EOVERFLOW]		= TARGET_EOVERFLOW,
-    [ENOTUNIQ]		= TARGET_ENOTUNIQ,
-    [EBADFD]		= TARGET_EBADFD,
-    [EREMCHG]		= TARGET_EREMCHG,
-    [ELIBACC]		= TARGET_ELIBACC,
-    [ELIBBAD]		= TARGET_ELIBBAD,
-    [ELIBSCN]		= TARGET_ELIBSCN,
-    [ELIBMAX]		= TARGET_ELIBMAX,
-    [ELIBEXEC]		= TARGET_ELIBEXEC,
-    [EILSEQ]		= TARGET_EILSEQ,
-    [ENOSYS]		= TARGET_ENOSYS,
-    [ELOOP]		= TARGET_ELOOP,
-    [ERESTART]		= TARGET_ERESTART,
-    [ESTRPIPE]		= TARGET_ESTRPIPE,
-    [ENOTEMPTY]		= TARGET_ENOTEMPTY,
-    [EUSERS]		= TARGET_EUSERS,
-    [ENOTSOCK]		= TARGET_ENOTSOCK,
-    [EDESTADDRREQ]	= TARGET_EDESTADDRREQ,
-    [EMSGSIZE]		= TARGET_EMSGSIZE,
-    [EPROTOTYPE]	= TARGET_EPROTOTYPE,
-    [ENOPROTOOPT]	= TARGET_ENOPROTOOPT,
-    [EPROTONOSUPPORT]	= TARGET_EPROTONOSUPPORT,
-    [ESOCKTNOSUPPORT]	= TARGET_ESOCKTNOSUPPORT,
-    [EOPNOTSUPP]	= TARGET_EOPNOTSUPP,
-    [EPFNOSUPPORT]	= TARGET_EPFNOSUPPORT,
-    [EAFNOSUPPORT]	= TARGET_EAFNOSUPPORT,
-    [EADDRINUSE]	= TARGET_EADDRINUSE,
-    [EADDRNOTAVAIL]	= TARGET_EADDRNOTAVAIL,
-    [ENETDOWN]		= TARGET_ENETDOWN,
-    [ENETUNREACH]	= TARGET_ENETUNREACH,
-    [ENETRESET]		= TARGET_ENETRESET,
-    [ECONNABORTED]	= TARGET_ECONNABORTED,
-    [ECONNRESET]	= TARGET_ECONNRESET,
-    [ENOBUFS]		= TARGET_ENOBUFS,
-    [EISCONN]		= TARGET_EISCONN,
-    [ENOTCONN]		= TARGET_ENOTCONN,
-    [EUCLEAN]		= TARGET_EUCLEAN,
-    [ENOTNAM]		= TARGET_ENOTNAM,
-    [ENAVAIL]		= TARGET_ENAVAIL,
-    [EISNAM]		= TARGET_EISNAM,
-    [EREMOTEIO]		= TARGET_EREMOTEIO,
+    [EAGAIN]            = TARGET_EAGAIN,
+    [EIDRM]             = TARGET_EIDRM,
+    [ECHRNG]            = TARGET_ECHRNG,
+    [EL2NSYNC]          = TARGET_EL2NSYNC,
+    [EL3HLT]            = TARGET_EL3HLT,
+    [EL3RST]            = TARGET_EL3RST,
+    [ELNRNG]            = TARGET_ELNRNG,
+    [EUNATCH]           = TARGET_EUNATCH,
+    [ENOCSI]            = TARGET_ENOCSI,
+    [EL2HLT]            = TARGET_EL2HLT,
+    [EDEADLK]           = TARGET_EDEADLK,
+    [ENOLCK]            = TARGET_ENOLCK,
+    [EBADE]             = TARGET_EBADE,
+    [EBADR]             = TARGET_EBADR,
+    [EXFULL]            = TARGET_EXFULL,
+    [ENOANO]            = TARGET_ENOANO,
+    [EBADRQC]           = TARGET_EBADRQC,
+    [EBADSLT]           = TARGET_EBADSLT,
+    [EBFONT]            = TARGET_EBFONT,
+    [ENOSTR]            = TARGET_ENOSTR,
+    [ENODATA]           = TARGET_ENODATA,
+    [ETIME]             = TARGET_ETIME,
+    [ENOSR]             = TARGET_ENOSR,
+    [ENONET]            = TARGET_ENONET,
+    [ENOPKG]            = TARGET_ENOPKG,
+    [EREMOTE]           = TARGET_EREMOTE,
+    [ENOLINK]           = TARGET_ENOLINK,
+    [EADV]              = TARGET_EADV,
+    [ESRMNT]            = TARGET_ESRMNT,
+    [ECOMM]             = TARGET_ECOMM,
+    [EPROTO]            = TARGET_EPROTO,
+    [EDOTDOT]           = TARGET_EDOTDOT,
+    [EMULTIHOP]         = TARGET_EMULTIHOP,
+    [EBADMSG]           = TARGET_EBADMSG,
+    [ENAMETOOLONG]      = TARGET_ENAMETOOLONG,
+    [EOVERFLOW]         = TARGET_EOVERFLOW,
+    [ENOTUNIQ]          = TARGET_ENOTUNIQ,
+    [EBADFD]            = TARGET_EBADFD,
+    [EREMCHG]           = TARGET_EREMCHG,
+    [ELIBACC]           = TARGET_ELIBACC,
+    [ELIBBAD]           = TARGET_ELIBBAD,
+    [ELIBSCN]           = TARGET_ELIBSCN,
+    [ELIBMAX]           = TARGET_ELIBMAX,
+    [ELIBEXEC]          = TARGET_ELIBEXEC,
+    [EILSEQ]            = TARGET_EILSEQ,
+    [ENOSYS]            = TARGET_ENOSYS,
+    [ELOOP]             = TARGET_ELOOP,
+    [ERESTART]          = TARGET_ERESTART,
+    [ESTRPIPE]          = TARGET_ESTRPIPE,
+    [ENOTEMPTY]         = TARGET_ENOTEMPTY,
+    [EUSERS]            = TARGET_EUSERS,
+    [ENOTSOCK]          = TARGET_ENOTSOCK,
+    [EDESTADDRREQ]      = TARGET_EDESTADDRREQ,
+    [EMSGSIZE]          = TARGET_EMSGSIZE,
+    [EPROTOTYPE]        = TARGET_EPROTOTYPE,
+    [ENOPROTOOPT]       = TARGET_ENOPROTOOPT,
+    [EPROTONOSUPPORT]   = TARGET_EPROTONOSUPPORT,
+    [ESOCKTNOSUPPORT]   = TARGET_ESOCKTNOSUPPORT,
+    [EOPNOTSUPP]        = TARGET_EOPNOTSUPP,
+    [EPFNOSUPPORT]      = TARGET_EPFNOSUPPORT,
+    [EAFNOSUPPORT]      = TARGET_EAFNOSUPPORT,
+    [EADDRINUSE]        = TARGET_EADDRINUSE,
+    [EADDRNOTAVAIL]     = TARGET_EADDRNOTAVAIL,
+    [ENETDOWN]          = TARGET_ENETDOWN,
+    [ENETUNREACH]       = TARGET_ENETUNREACH,
+    [ENETRESET]         = TARGET_ENETRESET,
+    [ECONNABORTED]      = TARGET_ECONNABORTED,
+    [ECONNRESET]        = TARGET_ECONNRESET,
+    [ENOBUFS]           = TARGET_ENOBUFS,
+    [EISCONN]           = TARGET_EISCONN,
+    [ENOTCONN]          = TARGET_ENOTCONN,
+    [EUCLEAN]           = TARGET_EUCLEAN,
+    [ENOTNAM]           = TARGET_ENOTNAM,
+    [ENAVAIL]           = TARGET_ENAVAIL,
+    [EISNAM]            = TARGET_EISNAM,
+    [EREMOTEIO]         = TARGET_EREMOTEIO,
     [EDQUOT]            = TARGET_EDQUOT,
-    [ESHUTDOWN]		= TARGET_ESHUTDOWN,
-    [ETOOMANYREFS]	= TARGET_ETOOMANYREFS,
-    [ETIMEDOUT]		= TARGET_ETIMEDOUT,
-    [ECONNREFUSED]	= TARGET_ECONNREFUSED,
-    [EHOSTDOWN]		= TARGET_EHOSTDOWN,
-    [EHOSTUNREACH]	= TARGET_EHOSTUNREACH,
-    [EALREADY]		= TARGET_EALREADY,
-    [EINPROGRESS]	= TARGET_EINPROGRESS,
-    [ESTALE]		= TARGET_ESTALE,
-    [ECANCELED]		= TARGET_ECANCELED,
-    [ENOMEDIUM]		= TARGET_ENOMEDIUM,
-    [EMEDIUMTYPE]	= TARGET_EMEDIUMTYPE,
+    [ESHUTDOWN]         = TARGET_ESHUTDOWN,
+    [ETOOMANYREFS]      = TARGET_ETOOMANYREFS,
+    [ETIMEDOUT]         = TARGET_ETIMEDOUT,
+    [ECONNREFUSED]      = TARGET_ECONNREFUSED,
+    [EHOSTDOWN]         = TARGET_EHOSTDOWN,
+    [EHOSTUNREACH]      = TARGET_EHOSTUNREACH,
+    [EALREADY]          = TARGET_EALREADY,
+    [EINPROGRESS]       = TARGET_EINPROGRESS,
+    [ESTALE]            = TARGET_ESTALE,
+    [ECANCELED]         = TARGET_ECANCELED,
+    [ENOMEDIUM]         = TARGET_ENOMEDIUM,
+    [EMEDIUMTYPE]       = TARGET_EMEDIUMTYPE,
 #ifdef ENOKEY
-    [ENOKEY]		= TARGET_ENOKEY,
+    [ENOKEY]            = TARGET_ENOKEY,
 #endif
 #ifdef EKEYEXPIRED
-    [EKEYEXPIRED]	= TARGET_EKEYEXPIRED,
+    [EKEYEXPIRED]       = TARGET_EKEYEXPIRED,
 #endif
 #ifdef EKEYREVOKED
-    [EKEYREVOKED]	= TARGET_EKEYREVOKED,
+    [EKEYREVOKED]       = TARGET_EKEYREVOKED,
 #endif
 #ifdef EKEYREJECTED
-    [EKEYREJECTED]	= TARGET_EKEYREJECTED,
+    [EKEYREJECTED]      = TARGET_EKEYREJECTED,
 #endif
 #ifdef EOWNERDEAD
-    [EOWNERDEAD]	= TARGET_EOWNERDEAD,
+    [EOWNERDEAD]        = TARGET_EOWNERDEAD,
 #endif
 #ifdef ENOTRECOVERABLE
-    [ENOTRECOVERABLE]	= TARGET_ENOTRECOVERABLE,
+    [ENOTRECOVERABLE]   = TARGET_ENOTRECOVERABLE,
 #endif
 #ifdef ENOMSG
     [ENOMSG]            = TARGET_ENOMSG,
-- 
2.31.1


