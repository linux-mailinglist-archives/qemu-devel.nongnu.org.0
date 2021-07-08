Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D653C1895
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:44:19 +0200 (CEST)
Received: from localhost ([::1]:46782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Y4Q-0003dQ-Iq
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:44:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1XTf-0006fS-No
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:06:19 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:36856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1XTd-000802-Mv
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:06:19 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 t14-20020a05600c198eb029020c8aac53d4so20476942wmq.1
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 10:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IfmXRvf8HQCCSrICqUB6/53Hv4PTApeh7FAtr9C87zo=;
 b=J4LTg128nl4ydk9QaeHLXvikmnc0hD5xGrcxh3leX5pvSXHcqUgbMWNGml3+zvKzcL
 7juEh8ikd2+3fR5eHDv6NaUjteNp7/zhcnF8+v7M9j8yBusM6hnHGgYUfDY+BPeMUcLs
 PTu/40IgvkMhNtgGK/nS2qK68UTSC8C8tBpZ4Rt4kVgwoMWwmMHgXyeNitLkKQEn6MCG
 ZhHmv4Vjf7wJA73jBV2NB4NaeHrOYm8VWRNf9JTJAKfnmjgbLmbVW5RR0TDhteLoxLoi
 dCiv2EWuoVpTL8yWr9DWZiPSkwBXH5feKl+a7xSfzzNZdewjcEZ3sFmj0i7S2jI0nFBM
 XHOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=IfmXRvf8HQCCSrICqUB6/53Hv4PTApeh7FAtr9C87zo=;
 b=fu4TKKjDkJ3JV9dulLnZO2OoPKb1UCsZKV0STehqP1zVFWjy8HfibDu93ImXYA/2lS
 Y1mUqCK0fffUQARSGRjck2iLLzMHWkOBmewknlzoN8+vhXkpBVHrC5Uey9BrWMyjI+lH
 Q9yklmWLovTZnJOJTRwPaqnuxnLaJ7IZd6nw6V3r1+Di1g9KpMzksmvUnkxAGJhmlT4o
 oHGVEtbC5BKXtfTjgqtBaTHyY0qHYddDUhG2AChOPqKN00J7KSqC67hy4gvpKCCnZBGx
 44ysojWG9Lub690ZFyPAtdFu6cXrdZHBpMMRIOBnd3AFYRZZkqExBrjl40+Vm2NsNWsZ
 nkZg==
X-Gm-Message-State: AOAM531rG/PfUFoFyo3XrsCDabD66ZH+kvk47s0Ej23G9kBnn0HUHykt
 z4VrajM69uVkglOsQLdFZwL+7QKBt1I=
X-Google-Smtp-Source: ABdhPJyAQPytJAwI4Ejto74j4zm56uJLuWierrOh5uHhfoPnQd03l1y1Qq0xwnUaiJWyAq7jz1XS8w==
X-Received: by 2002:a05:600c:4101:: with SMTP id
 j1mr6513518wmi.84.1625763976231; 
 Thu, 08 Jul 2021 10:06:16 -0700 (PDT)
Received: from x1w.redhat.com (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id h13sm2823337wrs.68.2021.07.08.10.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 10:06:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/8] linux-user/hppa: Move errno definitions to
 'target_errno_defs.h'
Date: Thu,  8 Jul 2021 19:05:47 +0200
Message-Id: <20210708170550.1846343-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708170550.1846343-1-f4bug@amsat.org>
References: <20210708170550.1846343-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
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
 linux-user/hppa/target_errno_defs.h | 214 ++++++++++++++++++++++++++++
 linux-user/hppa/target_syscall.h    | 210 ---------------------------
 2 files changed, 214 insertions(+), 210 deletions(-)

diff --git a/linux-user/hppa/target_errno_defs.h b/linux-user/hppa/target_errno_defs.h
index d6e9676ce25..b8f728f5863 100644
--- a/linux-user/hppa/target_errno_defs.h
+++ b/linux-user/hppa/target_errno_defs.h
@@ -3,4 +3,218 @@
 
 #include "../generic/target_errno_defs.h"
 
+/*
+ * Generic target errno overridden with definitions taken
+ * from asm-parisc/errno.h
+ */
+#undef TARGET_EWOULDBLOCK
+#define TARGET_EWOULDBLOCK     TARGET_EAGAIN /* Operation would block */
+#undef  TARGET_ENOMSG
+#define TARGET_ENOMSG          35
+#undef  TARGET_EIDRM
+#define TARGET_EIDRM           36
+#undef  TARGET_ECHRNG
+#define TARGET_ECHRNG          37
+#undef  TARGET_EL2NSYNC
+#define TARGET_EL2NSYNC        38
+#undef  TARGET_EL3HLT
+#define TARGET_EL3HLT          39
+#undef  TARGET_EL3RST
+#define TARGET_EL3RST          40
+#undef  TARGET_ELNRNG
+#define TARGET_ELNRNG          41
+#undef  TARGET_EUNATCH
+#define TARGET_EUNATCH         42
+#undef  TARGET_ENOCSI
+#define TARGET_ENOCSI          43
+#undef  TARGET_EL2HLT
+#define TARGET_EL2HLT          44
+#undef  TARGET_EDEADLK
+#define TARGET_EDEADLK         45
+#undef  TARGET_ENOLCK
+#define TARGET_ENOLCK          46
+#undef  TARGET_EILSEQ
+#define TARGET_EILSEQ          47
+
+#undef  TARGET_ENONET
+#define TARGET_ENONET          50
+#undef  TARGET_ENODATA
+#define TARGET_ENODATA         51
+#undef  TARGET_ETIME
+#define TARGET_ETIME           52
+#undef  TARGET_ENOSR
+#define TARGET_ENOSR           53
+#undef  TARGET_ENOSTR
+#define TARGET_ENOSTR          54
+#undef  TARGET_ENOPKG
+#define TARGET_ENOPKG          55
+
+#undef  TARGET_ENOLINK
+#define TARGET_ENOLINK         57
+#undef  TARGET_EADV
+#define TARGET_EADV            58
+#undef  TARGET_ESRMNT
+#define TARGET_ESRMNT          59
+#undef  TARGET_ECOMM
+#define TARGET_ECOMM           60
+#undef  TARGET_EPROTO
+#define TARGET_EPROTO          61
+
+#undef  TARGET_EMULTIHOP
+#define TARGET_EMULTIHOP       64
+
+#undef  TARGET_EDOTDOT
+#define TARGET_EDOTDOT         66
+#undef  TARGET_EBADMSG
+#define TARGET_EBADMSG         67
+#undef  TARGET_EUSERS
+#define TARGET_EUSERS          68
+#undef  TARGET_EDQUOT
+#define TARGET_EDQUOT          69
+#undef  TARGET_ESTALE
+#define TARGET_ESTALE          70
+#undef  TARGET_EREMOTE
+#define TARGET_EREMOTE         71
+#undef  TARGET_EOVERFLOW
+#define TARGET_EOVERFLOW       72
+
+#undef  TARGET_EBADE
+#define TARGET_EBADE           160
+#undef  TARGET_EBADR
+#define TARGET_EBADR           161
+#undef  TARGET_EXFULL
+#define TARGET_EXFULL          162
+#undef  TARGET_ENOANO
+#define TARGET_ENOANO          163
+#undef  TARGET_EBADRQC
+#define TARGET_EBADRQC         164
+#undef  TARGET_EBADSLT
+#define TARGET_EBADSLT         165
+#undef  TARGET_EBFONT
+#define TARGET_EBFONT          166
+#undef  TARGET_ENOTUNIQ
+#define TARGET_ENOTUNIQ        167
+#undef  TARGET_EBADFD
+#define TARGET_EBADFD          168
+#undef  TARGET_EREMCHG
+#define TARGET_EREMCHG         169
+#undef  TARGET_ELIBACC
+#define TARGET_ELIBACC         170
+#undef  TARGET_ELIBBAD
+#define TARGET_ELIBBAD         171
+#undef  TARGET_ELIBSCN
+#define TARGET_ELIBSCN         172
+#undef  TARGET_ELIBMAX
+#define TARGET_ELIBMAX         173
+#undef  TARGET_ELIBEXEC
+#define TARGET_ELIBEXEC        174
+#undef  TARGET_ERESTART
+#define TARGET_ERESTART        175
+#undef  TARGET_ESTRPIPE
+#define TARGET_ESTRPIPE        176
+#undef  TARGET_EUCLEAN
+#define TARGET_EUCLEAN         177
+#undef  TARGET_ENOTNAM
+#define TARGET_ENOTNAM         178
+#undef  TARGET_ENAVAIL
+#define TARGET_ENAVAIL         179
+#undef  TARGET_EISNAM
+#define TARGET_EISNAM          180
+#undef  TARGET_EREMOTEIO
+#define TARGET_EREMOTEIO       181
+#undef  TARGET_ENOMEDIUM
+#define TARGET_ENOMEDIUM       182
+#undef  TARGET_EMEDIUMTYPE
+#define TARGET_EMEDIUMTYPE     183
+#undef  TARGET_ENOKEY
+#define TARGET_ENOKEY          184
+#undef  TARGET_EKEYEXPIRED
+#define TARGET_EKEYEXPIRED     185
+#undef  TARGET_EKEYREVOKED
+#define TARGET_EKEYREVOKED     186
+#undef  TARGET_EKEYREJECTED
+#define TARGET_EKEYREJECTED    187
+
+/* Never used in linux.  */
+/* #define TARGET_ENOSYM          215 */
+#undef  TARGET_ENOTSOCK
+#define TARGET_ENOTSOCK        216
+#undef  TARGET_EDESTADDRREQ
+#define TARGET_EDESTADDRREQ    217
+#undef  TARGET_EMSGSIZE
+#define TARGET_EMSGSIZE        218
+#undef  TARGET_EPROTOTYPE
+#define TARGET_EPROTOTYPE      219
+#undef  TARGET_ENOPROTOOPT
+#define TARGET_ENOPROTOOPT     220
+#undef  TARGET_EPROTONOSUPPORT
+#define TARGET_EPROTONOSUPPORT 221
+#undef  TARGET_ESOCKTNOSUPPORT
+#define TARGET_ESOCKTNOSUPPORT 222
+#undef  TARGET_EOPNOTSUPP
+#define TARGET_EOPNOTSUPP      223
+#undef  TARGET_EPFNOSUPPORT
+#define TARGET_EPFNOSUPPORT    224
+#undef  TARGET_EAFNOSUPPORT
+#define TARGET_EAFNOSUPPORT    225
+#undef  TARGET_EADDRINUSE
+#define TARGET_EADDRINUSE      226
+#undef  TARGET_EADDRNOTAVAIL
+#define TARGET_EADDRNOTAVAIL   227
+#undef  TARGET_ENETDOWN
+#define TARGET_ENETDOWN        228
+#undef  TARGET_ENETUNREACH
+#define TARGET_ENETUNREACH     229
+#undef  TARGET_ENETRESET
+#define TARGET_ENETRESET       230
+#undef  TARGET_ECONNABORTED
+#define TARGET_ECONNABORTED    231
+#undef  TARGET_ECONNRESET
+#define TARGET_ECONNRESET      232
+#undef  TARGET_ENOBUFS
+#define TARGET_ENOBUFS         233
+#undef  TARGET_EISCONN
+#define TARGET_EISCONN         234
+#undef  TARGET_ENOTCONN
+#define TARGET_ENOTCONN        235
+#undef  TARGET_ESHUTDOWN
+#define TARGET_ESHUTDOWN       236
+#undef  TARGET_ETOOMANYREFS
+#define TARGET_ETOOMANYREFS    237
+#undef  TARGET_ETIMEDOUT
+#define TARGET_ETIMEDOUT       238
+#undef  TARGET_ECONNREFUSED
+#define TARGET_ECONNREFUSED    239
+#define TARGET_EREMOTERELEASE  240
+#undef  TARGET_EHOSTDOWN
+#define TARGET_EHOSTDOWN       241
+#undef  TARGET_EHOSTUNREACH
+#define TARGET_EHOSTUNREACH    242
+
+#undef  TARGET_EALREADY
+#define TARGET_EALREADY        244
+#undef  TARGET_EINPROGRESS
+#define TARGET_EINPROGRESS     245
+#undef  TARGET_ENOTEMPTY
+#define TARGET_ENOTEMPTY       247
+#undef  TARGET_ENAMETOOLONG
+#define TARGET_ENAMETOOLONG    248
+#undef  TARGET_ELOOP
+#define TARGET_ELOOP           249
+#undef  TARGET_ENOSYS
+#define TARGET_ENOSYS          251
+
+#undef  TARGET_ECANCELED
+#define TARGET_ECANCELED       253
+
+#undef  TARGET_EOWNERDEAD
+#define TARGET_EOWNERDEAD      254
+#undef  TARGET_ENOTRECOVERABLE
+#define TARGET_ENOTRECOVERABLE 255
+
+#undef  TARGET_ERFKILL
+#define TARGET_ERFKILL         256
+#undef  TARGET_EHWPOISON
+#define TARGET_EHWPOISON       257
+
 #endif
diff --git a/linux-user/hppa/target_syscall.h b/linux-user/hppa/target_syscall.h
index 97a095656d8..0018bcb5c4d 100644
--- a/linux-user/hppa/target_syscall.h
+++ b/linux-user/hppa/target_syscall.h
@@ -27,214 +27,4 @@ struct target_pt_regs {
 #define TARGET_MCL_FUTURE  2
 #define TARGET_MCL_ONFAULT 4
 
-#undef  TARGET_EWOULDBLOCK
-#define TARGET_EWOULDBLOCK     TARGET_EAGAIN /* Operation would block */
-#undef  TARGET_ENOMSG
-#define TARGET_ENOMSG          35
-#undef  TARGET_EIDRM
-#define TARGET_EIDRM           36
-#undef  TARGET_ECHRNG
-#define TARGET_ECHRNG          37
-#undef  TARGET_EL2NSYNC
-#define TARGET_EL2NSYNC        38
-#undef  TARGET_EL3HLT
-#define TARGET_EL3HLT          39
-#undef  TARGET_EL3RST
-#define TARGET_EL3RST          40
-#undef  TARGET_ELNRNG
-#define TARGET_ELNRNG          41
-#undef  TARGET_EUNATCH
-#define TARGET_EUNATCH         42
-#undef  TARGET_ENOCSI
-#define TARGET_ENOCSI          43
-#undef  TARGET_EL2HLT
-#define TARGET_EL2HLT          44
-#undef  TARGET_EDEADLK
-#define TARGET_EDEADLK         45
-#undef  TARGET_ENOLCK
-#define TARGET_ENOLCK          46
-#undef  TARGET_EILSEQ
-#define TARGET_EILSEQ          47
-
-#undef  TARGET_ENONET
-#define TARGET_ENONET          50
-#undef  TARGET_ENODATA
-#define TARGET_ENODATA         51
-#undef  TARGET_ETIME
-#define TARGET_ETIME           52
-#undef  TARGET_ENOSR
-#define TARGET_ENOSR           53
-#undef  TARGET_ENOSTR
-#define TARGET_ENOSTR          54
-#undef  TARGET_ENOPKG
-#define TARGET_ENOPKG          55
-
-#undef  TARGET_ENOLINK
-#define TARGET_ENOLINK         57
-#undef  TARGET_EADV
-#define TARGET_EADV            58
-#undef  TARGET_ESRMNT
-#define TARGET_ESRMNT          59
-#undef  TARGET_ECOMM
-#define TARGET_ECOMM           60
-#undef  TARGET_EPROTO
-#define TARGET_EPROTO          61
-
-#undef  TARGET_EMULTIHOP
-#define TARGET_EMULTIHOP       64
-
-#undef  TARGET_EDOTDOT
-#define TARGET_EDOTDOT         66
-#undef  TARGET_EBADMSG
-#define TARGET_EBADMSG         67
-#undef  TARGET_EUSERS
-#define TARGET_EUSERS          68
-#undef  TARGET_EDQUOT
-#define TARGET_EDQUOT          69
-#undef  TARGET_ESTALE
-#define TARGET_ESTALE          70
-#undef  TARGET_EREMOTE
-#define TARGET_EREMOTE         71
-#undef  TARGET_EOVERFLOW
-#define TARGET_EOVERFLOW       72
-
-#undef  TARGET_EBADE
-#define TARGET_EBADE           160
-#undef  TARGET_EBADR
-#define TARGET_EBADR           161
-#undef  TARGET_EXFULL
-#define TARGET_EXFULL          162
-#undef  TARGET_ENOANO
-#define TARGET_ENOANO          163
-#undef  TARGET_EBADRQC
-#define TARGET_EBADRQC         164
-#undef  TARGET_EBADSLT
-#define TARGET_EBADSLT         165
-#undef  TARGET_EBFONT
-#define TARGET_EBFONT          166
-#undef  TARGET_ENOTUNIQ
-#define TARGET_ENOTUNIQ        167
-#undef  TARGET_EBADFD
-#define TARGET_EBADFD          168
-#undef  TARGET_EREMCHG
-#define TARGET_EREMCHG         169
-#undef  TARGET_ELIBACC
-#define TARGET_ELIBACC         170
-#undef  TARGET_ELIBBAD
-#define TARGET_ELIBBAD         171
-#undef  TARGET_ELIBSCN
-#define TARGET_ELIBSCN         172
-#undef  TARGET_ELIBMAX
-#define TARGET_ELIBMAX         173
-#undef  TARGET_ELIBEXEC
-#define TARGET_ELIBEXEC        174
-#undef  TARGET_ERESTART
-#define TARGET_ERESTART        175
-#undef  TARGET_ESTRPIPE
-#define TARGET_ESTRPIPE        176
-#undef  TARGET_EUCLEAN
-#define TARGET_EUCLEAN         177
-#undef  TARGET_ENOTNAM
-#define TARGET_ENOTNAM         178
-#undef  TARGET_ENAVAIL
-#define TARGET_ENAVAIL         179
-#undef  TARGET_EISNAM
-#define TARGET_EISNAM          180
-#undef  TARGET_EREMOTEIO
-#define TARGET_EREMOTEIO       181
-#undef  TARGET_ENOMEDIUM
-#define TARGET_ENOMEDIUM       182
-#undef  TARGET_EMEDIUMTYPE
-#define TARGET_EMEDIUMTYPE     183
-#undef  TARGET_ENOKEY
-#define TARGET_ENOKEY          184
-#undef  TARGET_EKEYEXPIRED
-#define TARGET_EKEYEXPIRED     185
-#undef  TARGET_EKEYREVOKED
-#define TARGET_EKEYREVOKED     186
-#undef  TARGET_EKEYREJECTED
-#define TARGET_EKEYREJECTED    187
-
-/* Never used in linux.  */
-/* #define TARGET_ENOSYM          215 */
-#undef  TARGET_ENOTSOCK
-#define TARGET_ENOTSOCK        216
-#undef  TARGET_EDESTADDRREQ
-#define TARGET_EDESTADDRREQ    217
-#undef  TARGET_EMSGSIZE
-#define TARGET_EMSGSIZE        218
-#undef  TARGET_EPROTOTYPE
-#define TARGET_EPROTOTYPE      219
-#undef  TARGET_ENOPROTOOPT
-#define TARGET_ENOPROTOOPT     220
-#undef  TARGET_EPROTONOSUPPORT
-#define TARGET_EPROTONOSUPPORT 221
-#undef  TARGET_ESOCKTNOSUPPORT
-#define TARGET_ESOCKTNOSUPPORT 222
-#undef  TARGET_EOPNOTSUPP
-#define TARGET_EOPNOTSUPP      223
-#undef  TARGET_EPFNOSUPPORT
-#define TARGET_EPFNOSUPPORT    224
-#undef  TARGET_EAFNOSUPPORT
-#define TARGET_EAFNOSUPPORT    225
-#undef  TARGET_EADDRINUSE
-#define TARGET_EADDRINUSE      226
-#undef  TARGET_EADDRNOTAVAIL
-#define TARGET_EADDRNOTAVAIL   227
-#undef  TARGET_ENETDOWN
-#define TARGET_ENETDOWN        228
-#undef  TARGET_ENETUNREACH
-#define TARGET_ENETUNREACH     229
-#undef  TARGET_ENETRESET
-#define TARGET_ENETRESET       230
-#undef  TARGET_ECONNABORTED
-#define TARGET_ECONNABORTED    231
-#undef  TARGET_ECONNRESET
-#define TARGET_ECONNRESET      232
-#undef  TARGET_ENOBUFS
-#define TARGET_ENOBUFS         233
-#undef  TARGET_EISCONN
-#define TARGET_EISCONN         234
-#undef  TARGET_ENOTCONN
-#define TARGET_ENOTCONN        235
-#undef  TARGET_ESHUTDOWN
-#define TARGET_ESHUTDOWN       236
-#undef  TARGET_ETOOMANYREFS
-#define TARGET_ETOOMANYREFS    237
-#undef  TARGET_ETIMEDOUT
-#define TARGET_ETIMEDOUT       238
-#undef  TARGET_ECONNREFUSED
-#define TARGET_ECONNREFUSED    239
-#define TARGET_EREMOTERELEASE  240
-#undef  TARGET_EHOSTDOWN
-#define TARGET_EHOSTDOWN       241
-#undef  TARGET_EHOSTUNREACH
-#define TARGET_EHOSTUNREACH    242
-
-#undef  TARGET_EALREADY
-#define TARGET_EALREADY        244
-#undef  TARGET_EINPROGRESS
-#define TARGET_EINPROGRESS     245
-#undef  TARGET_ENOTEMPTY
-#define TARGET_ENOTEMPTY       247
-#undef  TARGET_ENAMETOOLONG
-#define TARGET_ENAMETOOLONG    248
-#undef  TARGET_ELOOP
-#define TARGET_ELOOP           249
-#undef  TARGET_ENOSYS
-#define TARGET_ENOSYS          251
-
-#undef  TARGET_ECANCELED
-#define TARGET_ECANCELED       253
-
-#undef  TARGET_EOWNERDEAD
-#define TARGET_EOWNERDEAD      254
-#undef  TARGET_ENOTRECOVERABLE
-#define TARGET_ENOTRECOVERABLE 255
-
-#undef  TARGET_ERFKILL
-#define TARGET_ERFKILL         256
-#undef  TARGET_EHWPOISON
-#define TARGET_EHWPOISON       257
-
 #endif /* HPPA_TARGET_SYSCALL_H */
-- 
2.31.1


