Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CF33BAE5E
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 20:42:35 +0200 (CEST)
Received: from localhost ([::1]:42522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m074c-0003vq-NR
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 14:42:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m0714-0003tf-2n
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 14:38:54 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:35331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m0712-0006qP-6a
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 14:38:53 -0400
Received: by mail-wr1-x432.google.com with SMTP id m18so19264364wrv.2
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 11:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JkJbITRvu3OZJX3RLZJavBspkqwzSZidGU15nXUNZro=;
 b=rhH9+YpY6vHHMq4I6AGtvrQgGlzkWD48fxIjnQZ2doh1b0EcktyhyjrS/B2RWyBup7
 Xzzb1IfldIpgSFk7rXwfaDhRI4AriyjK852HBTGYf73l44Oyd/1VmvnhmSRisIadY+Ab
 mgMmDy2Pe6wK+7mOu/BeO+pCRI+ZZyNhEgHIHx4yfuiyFSNFMrcGMuM7H3Nfo6innv3V
 nG38Au9UNgcrsXCDGCgarjZCOP98b5c+GkG+i5PHEKmQSjNwpkHlGsCjHRquI93xPd3D
 /VyS3vRQjwgZk5p9coCUwxQ2YGlumSNLHvtbwLKCdb3QcpP0lARd4wyFKsX9OLjkdPka
 WdEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JkJbITRvu3OZJX3RLZJavBspkqwzSZidGU15nXUNZro=;
 b=T8Itq5fmxcLaoGS6Jb4fEOngVCAqBYtvHXh6l5vqLMePV/pUU3z+15XY5CAA6l2a05
 qvMK3ySDbZMavWdFDscTAKtmyLyl3SMmOhB2ypwmQjUkuvszzvfpkhPAMECFP9y89kxO
 MEvP15/3xzW7DUjo6YOflsf3rBQ7SwrrS5xHXSq354iFK/PVv4el8b9zLO1RGu0xxG6g
 SGxwcRI1wNqtsylozFvMOGqT38nhCc3Qp0vsIZxKSwxCO+29AaQC2Rnqmbt9hschbLsv
 mxvX83+hHfsjBzrQEfd+R4spdakYnvGPwqatjM4kNKzdRnMOiXcOBjXcO9shzjjXLp24
 4krw==
X-Gm-Message-State: AOAM533PchtecycbsqRxSOR58Sp2wtZGX9ZtBwolQVQk8o6Ozt4RhXpo
 BQO7ZaVpslxevM1hziiRKtIQUszDsjU=
X-Google-Smtp-Source: ABdhPJwKXy15ccMef0gBxbAByDuEK3C0HsHPLEoSm0ILFHRIIy8CXUWdlm1Qyvq1bmsV9beH0Xkckg==
X-Received: by 2002:a5d:4b45:: with SMTP id w5mr11391266wrs.257.1625423930707; 
 Sun, 04 Jul 2021 11:38:50 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id o11sm9472958wmq.1.2021.07.04.11.38.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 11:38:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/12] linux-user/syscall: Remove hardcoded tabs (code style)
Date: Sun,  4 Jul 2021 20:37:54 +0200
Message-Id: <20210704183755.655002-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210704183755.655002-1-f4bug@amsat.org>
References: <20210704183755.655002-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 linux-user/syscall.c | 188 +++++++++++++++++++++----------------------
 1 file changed, 94 insertions(+), 94 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 33b7fef12a8..3761d3b2d64 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -521,112 +521,112 @@ static uint16_t target_to_host_errno_table[ERRNO_TABLE_SIZE] = {
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


