Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 577193BAE5B
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 20:41:30 +0200 (CEST)
Received: from localhost ([::1]:38212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m073Z-00016w-BR
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 14:41:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m070p-0002wR-IP
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 14:38:39 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:45994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m070n-0006gj-HH
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 14:38:39 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 u8-20020a7bcb080000b02901e44e9caa2aso9802174wmj.4
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 11:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=THfCpiyWDbdLgy9uQqqYdT0LsGOfjlk6B9VN48cjs9U=;
 b=KT9Fc+G+nQpGoF1kq6YNPyZJpC4DlgAF4kCmS6MaPGRYVoT+W0JHQ1HVPV96zNd1Pv
 llUy7v/lkbG1KVvQjcFWxk4fklpUSf8QK3MTx2jLYkW8mhPfgJqM3GwVdD1qrzQRFg+A
 fCubgxEZnJ/BbyD14Ora6cyZp5BS2ufqcOIWnJfFyUQBJBblO1LIeon3pesD4+B3flt+
 uDRqcZ8ioc3irew6Ov6AYoXzOiaaRHIa8IUcr/Itl4jNe1ZpPTnm9LKFmuEVH3WwziYE
 28y7jUF56LYE6InHjFVSiRVeojMoLI6hljHP5xcCEd2laCgEIuXu//fkjOth9m5i/ooz
 HHsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=THfCpiyWDbdLgy9uQqqYdT0LsGOfjlk6B9VN48cjs9U=;
 b=Tp1OCr2ARhYiDCSQeF7CW7B5ZMjKozL4cGcDzWHlJqxTfqmQVfC4IwCFoZ/Fz96Jyf
 xICTRVwxiBrCNHKme/PkIAvBzbFqkCJjI31dKfi4NoMGAtJY/Lr8qkJJOjm/S+AShhbD
 KNR/6QZiMWXRcOnp+o7mfiPOiM7x0b7E7+G4I3eMLLOsw/ugAsXfFEEd1q9tJBi8FF36
 kvU0//TuZI3H62Zmpimf0rk6t1IJgSiMCMBqYvoHyXhHenVmuSahePXc9TaNQSwBvDMc
 yDhFxoK19mPRNQY1plemfAKfkvZsKqfQwW9YYybaOa1ptvAlRnHBJcrFbcSKqZAc58qU
 nEow==
X-Gm-Message-State: AOAM5337D42Kq79V1MOXMF485dKhFjdhuaFOCFq6eVIoyDMV3/iWLtdu
 5MMrfeE1fwLc5et/xbPw/UGTwrSTLgQ=
X-Google-Smtp-Source: ABdhPJyeJU85WzwYx/8xwWUmHiWIg4F3MsLWfhRo7yrbFoFFJIMbb39RDiMhSRFy7r0BZ7bplV+kRw==
X-Received: by 2002:a1c:cc17:: with SMTP id h23mr10427762wmb.129.1625423916062; 
 Sun, 04 Jul 2021 11:38:36 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id f13sm10764377wrt.86.2021.07.04.11.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 11:38:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/12] linux-user/hppa: Move errno definitions to
 'target_errno_defs.h'
Date: Sun,  4 Jul 2021 20:37:51 +0200
Message-Id: <20210704183755.655002-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210704183755.655002-1-f4bug@amsat.org>
References: <20210704183755.655002-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
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
 linux-user/hppa/target_errno_defs.h | 210 ++++++++++++++++++++++++++++
 linux-user/hppa/target_syscall.h    | 210 ----------------------------
 2 files changed, 210 insertions(+), 210 deletions(-)

diff --git a/linux-user/hppa/target_errno_defs.h b/linux-user/hppa/target_errno_defs.h
index 5ae6b8d0ba2..411dd591edb 100644
--- a/linux-user/hppa/target_errno_defs.h
+++ b/linux-user/hppa/target_errno_defs.h
@@ -1,4 +1,214 @@
 #ifndef HPPA_TARGET_ERRNO_H
 #define HPPA_TARGET_ERRNO_H
 
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


