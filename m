Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2892290F6
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jul 2020 08:35:05 +0200 (CEST)
Received: from localhost ([::1]:44184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jy8LI-0007Et-LD
	for lists+qemu-devel@lfdr.de; Wed, 22 Jul 2020 02:35:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jy8Fk-0007Lz-J0
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 02:29:20 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:33797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jy8Fh-0006vf-Nw
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 02:29:20 -0400
Received: by mail-wm1-x342.google.com with SMTP id g10so3660985wmc.1
 for <qemu-devel@nongnu.org>; Tue, 21 Jul 2020 23:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hc/5WUXlyYNx0Z/MlINrBx3LfFPq8y5IJhnEoD5JoRY=;
 b=Un8jCS3+/WQPj0Zvjp6PJEf/A6V++DcdDT3/elW9MfJ2/LmBdx6+L/2AdFp4P1xjJW
 +G0CIj7yefQhh9p3YgeYJNrgZcebpaIKDERZPAhoHJvCt3E0ivztsMachJ0j9iueLOap
 ebgEAH8it63QEnyBAtx/H6QnFE1Ozl6+jPxr7lMKZjBwNhactcUGSztdyEuJWFCFPBIL
 EC/WVAYkCLKb6+GPG6JTDJX9iGqwVASggtfMxb5I0WdeJTRVTfSWEGWA6LdJJTcwXgW4
 /eT9os7QtKz/SJDpOIcLBoXdnqjm5M0KUKT4pOc5GyOg91djs7glUjA1sNPdOt4Eurwf
 /C5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hc/5WUXlyYNx0Z/MlINrBx3LfFPq8y5IJhnEoD5JoRY=;
 b=Oa4MK8Vz4LlIE0rYPxo12KON0S1Zhc/Dvj8hWnTw8I4NsYLEjlXd6TQbNqlNdU9MH8
 S/BkHnTXRqi2tdK9T1M5Fs6dfERiYYTydHy0KI6s9DwJkmkvz6NoMuznOSws1EVWXHu/
 IeI0gUACj21z2JQxRUPqKQDLn6Uw28naoT83Y2tJ1pMi+dSHhteCoJDOBsu0qZvAJuSp
 /vWcFHnLssoojuy/9xyYryhbCmHR8uOcmrgFiDcxBguo5pZx2vn4c3O8CJ4LsY+kJRvE
 cWP2RVNUqz6r9iMTHAKpxcqQ1gJceBODBdN6/stUoEKmRuw7W6cwDMClF4sDTBRcezcJ
 tEiQ==
X-Gm-Message-State: AOAM531izt/5YzfHz2e5TP/d3p2uxBijlg6+d+9tX72LJCErg5hETYHo
 639Azm6Oc1jtOLHZ/xeE4UmUWA==
X-Google-Smtp-Source: ABdhPJzzvmHGjVrPtXq4YDIf7iAIrMfm8wYqEEcjizXXEkaAhTemPifO0ywwBlaSfNtfS1T3YedsuA==
X-Received: by 2002:a1c:7d54:: with SMTP id y81mr7481440wmc.110.1595399356239; 
 Tue, 21 Jul 2020 23:29:16 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u20sm5846508wmc.42.2020.07.21.23.29.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 23:29:10 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A30FD1FF93;
 Wed, 22 Jul 2020 07:29:03 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/12] target/i386: floatx80: avoid compound literals in
 static initializers
Date: Wed, 22 Jul 2020 07:28:57 +0100
Message-Id: <20200722062902.24509-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200722062902.24509-1-alex.bennee@linaro.org>
References: <20200722062902.24509-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, Peter Maydell <peter.maydell@linaro.org>,
 berrange@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, richard.henderson@linaro.org,
 f4bug@amsat.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 cota@braap.org, Joseph Myers <joseph@codesourcery.com>,
 Paolo Bonzini <pbonzini@redhat.com>, aurelien@aurel32.net,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laszlo Ersek <lersek@redhat.com>

Quoting ISO C99 6.7.8p4, "All the expressions in an initializer for an
object that has static storage duration shall be constant expressions or
string literals".

The compound literal produced by the make_floatx80() macro is not such a
constant expression, per 6.6p7-9. (An implementation may accept it,
according to 6.6p10, but is not required to.)

Therefore using "floatx80_zero" and make_floatx80() for initializing
"f2xm1_table" and "fpatan_table" is not portable. And gcc-4.8 in RHEL-7.6
actually chokes on them:

> target/i386/fpu_helper.c:871:5: error: initializer element is not constant
>      { make_floatx80(0xbfff, 0x8000000000000000ULL),
>      ^

We've had the make_floatx80_init() macro for this purpose since commit
3bf7e40ab914 ("softfloat: fix for C99", 2012-03-17), so let's use that
macro again.

Fixes: eca30647fc07
Fixes: ff57bb7b6326
Link: https://lists.gnu.org/archive/html/qemu-devel/2017-08/msg06566.html
Link: https://lists.gnu.org/archive/html/qemu-devel/2020-07/msg04714.html
Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Joseph Myers <joseph@codesourcery.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <rth@twiddle.net>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20200716144251.23004-1-lersek@redhat.com>
---
 include/fpu/softfloat.h  |   1 +
 target/i386/fpu_helper.c | 426 +++++++++++++++++++--------------------
 2 files changed, 214 insertions(+), 213 deletions(-)

diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index f1a19df066b..659218b5c78 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -822,6 +822,7 @@ static inline bool floatx80_invalid_encoding(floatx80 a)
 }
 
 #define floatx80_zero make_floatx80(0x0000, 0x0000000000000000LL)
+#define floatx80_zero_init make_floatx80_init(0x0000, 0x0000000000000000LL)
 #define floatx80_one make_floatx80(0x3fff, 0x8000000000000000LL)
 #define floatx80_ln2 make_floatx80(0x3ffe, 0xb17217f7d1cf79acLL)
 #define floatx80_pi make_floatx80(0x4000, 0xc90fdaa22168c235LL)
diff --git a/target/i386/fpu_helper.c b/target/i386/fpu_helper.c
index f5e6c4b88d4..4ea73874d83 100644
--- a/target/i386/fpu_helper.c
+++ b/target/i386/fpu_helper.c
@@ -868,201 +868,201 @@ struct f2xm1_data {
 };
 
 static const struct f2xm1_data f2xm1_table[65] = {
-    { make_floatx80(0xbfff, 0x8000000000000000ULL),
-      make_floatx80(0x3ffe, 0x8000000000000000ULL),
-      make_floatx80(0xbffe, 0x8000000000000000ULL) },
-    { make_floatx80(0xbffe, 0xf800000000002e7eULL),
-      make_floatx80(0x3ffe, 0x82cd8698ac2b9160ULL),
-      make_floatx80(0xbffd, 0xfa64f2cea7a8dd40ULL) },
-    { make_floatx80(0xbffe, 0xefffffffffffe960ULL),
-      make_floatx80(0x3ffe, 0x85aac367cc488345ULL),
-      make_floatx80(0xbffd, 0xf4aa7930676ef976ULL) },
-    { make_floatx80(0xbffe, 0xe800000000006f10ULL),
-      make_floatx80(0x3ffe, 0x88980e8092da5c14ULL),
-      make_floatx80(0xbffd, 0xeecfe2feda4b47d8ULL) },
-    { make_floatx80(0xbffe, 0xe000000000008a45ULL),
-      make_floatx80(0x3ffe, 0x8b95c1e3ea8ba2a5ULL),
-      make_floatx80(0xbffd, 0xe8d47c382ae8bab6ULL) },
-    { make_floatx80(0xbffe, 0xd7ffffffffff8a9eULL),
-      make_floatx80(0x3ffe, 0x8ea4398b45cd8116ULL),
-      make_floatx80(0xbffd, 0xe2b78ce97464fdd4ULL) },
-    { make_floatx80(0xbffe, 0xd0000000000019a0ULL),
-      make_floatx80(0x3ffe, 0x91c3d373ab11b919ULL),
-      make_floatx80(0xbffd, 0xdc785918a9dc8dceULL) },
-    { make_floatx80(0xbffe, 0xc7ffffffffff14dfULL),
-      make_floatx80(0x3ffe, 0x94f4efa8fef76836ULL),
-      make_floatx80(0xbffd, 0xd61620ae02112f94ULL) },
-    { make_floatx80(0xbffe, 0xc000000000006530ULL),
-      make_floatx80(0x3ffe, 0x9837f0518db87fbbULL),
-      make_floatx80(0xbffd, 0xcf901f5ce48f008aULL) },
-    { make_floatx80(0xbffe, 0xb7ffffffffff1723ULL),
-      make_floatx80(0x3ffe, 0x9b8d39b9d54eb74cULL),
-      make_floatx80(0xbffd, 0xc8e58c8c55629168ULL) },
-    { make_floatx80(0xbffe, 0xb00000000000b5e1ULL),
-      make_floatx80(0x3ffe, 0x9ef5326091a0c366ULL),
-      make_floatx80(0xbffd, 0xc2159b3edcbe7934ULL) },
-    { make_floatx80(0xbffe, 0xa800000000006f8aULL),
-      make_floatx80(0x3ffe, 0xa27043030c49370aULL),
-      make_floatx80(0xbffd, 0xbb1f79f9e76d91ecULL) },
-    { make_floatx80(0xbffe, 0x9fffffffffff816aULL),
-      make_floatx80(0x3ffe, 0xa5fed6a9b15171cfULL),
-      make_floatx80(0xbffd, 0xb40252ac9d5d1c62ULL) },
-    { make_floatx80(0xbffe, 0x97ffffffffffb621ULL),
-      make_floatx80(0x3ffe, 0xa9a15ab4ea7c30e6ULL),
-      make_floatx80(0xbffd, 0xacbd4a962b079e34ULL) },
-    { make_floatx80(0xbffe, 0x8fffffffffff162bULL),
-      make_floatx80(0x3ffe, 0xad583eea42a1b886ULL),
-      make_floatx80(0xbffd, 0xa54f822b7abc8ef4ULL) },
-    { make_floatx80(0xbffe, 0x87ffffffffff4d34ULL),
-      make_floatx80(0x3ffe, 0xb123f581d2ac7b51ULL),
-      make_floatx80(0xbffd, 0x9db814fc5aa7095eULL) },
-    { make_floatx80(0xbffe, 0x800000000000227dULL),
-      make_floatx80(0x3ffe, 0xb504f333f9de539dULL),
-      make_floatx80(0xbffd, 0x95f619980c4358c6ULL) },
-    { make_floatx80(0xbffd, 0xefffffffffff3978ULL),
-      make_floatx80(0x3ffe, 0xb8fbaf4762fbd0a1ULL),
-      make_floatx80(0xbffd, 0x8e08a1713a085ebeULL) },
-    { make_floatx80(0xbffd, 0xe00000000000df81ULL),
-      make_floatx80(0x3ffe, 0xbd08a39f580bfd8cULL),
-      make_floatx80(0xbffd, 0x85eeb8c14fe804e8ULL) },
-    { make_floatx80(0xbffd, 0xd00000000000bccfULL),
-      make_floatx80(0x3ffe, 0xc12c4cca667062f6ULL),
-      make_floatx80(0xbffc, 0xfb4eccd6663e7428ULL) },
-    { make_floatx80(0xbffd, 0xc00000000000eff0ULL),
-      make_floatx80(0x3ffe, 0xc5672a1155069abeULL),
-      make_floatx80(0xbffc, 0xea6357baabe59508ULL) },
-    { make_floatx80(0xbffd, 0xb000000000000fe6ULL),
-      make_floatx80(0x3ffe, 0xc9b9bd866e2f234bULL),
-      make_floatx80(0xbffc, 0xd91909e6474372d4ULL) },
-    { make_floatx80(0xbffd, 0x9fffffffffff2172ULL),
-      make_floatx80(0x3ffe, 0xce248c151f84bf00ULL),
-      make_floatx80(0xbffc, 0xc76dcfab81ed0400ULL) },
-    { make_floatx80(0xbffd, 0x8fffffffffffafffULL),
-      make_floatx80(0x3ffe, 0xd2a81d91f12afb2bULL),
-      make_floatx80(0xbffc, 0xb55f89b83b541354ULL) },
-    { make_floatx80(0xbffc, 0xffffffffffff81a3ULL),
-      make_floatx80(0x3ffe, 0xd744fccad69d7d5eULL),
-      make_floatx80(0xbffc, 0xa2ec0cd4a58a0a88ULL) },
-    { make_floatx80(0xbffc, 0xdfffffffffff1568ULL),
-      make_floatx80(0x3ffe, 0xdbfbb797daf25a44ULL),
-      make_floatx80(0xbffc, 0x901121a0943696f0ULL) },
-    { make_floatx80(0xbffc, 0xbfffffffffff68daULL),
-      make_floatx80(0x3ffe, 0xe0ccdeec2a94f811ULL),
-      make_floatx80(0xbffb, 0xf999089eab583f78ULL) },
-    { make_floatx80(0xbffc, 0x9fffffffffff4690ULL),
-      make_floatx80(0x3ffe, 0xe5b906e77c83657eULL),
-      make_floatx80(0xbffb, 0xd237c8c41be4d410ULL) },
-    { make_floatx80(0xbffb, 0xffffffffffff8aeeULL),
-      make_floatx80(0x3ffe, 0xeac0c6e7dd24427cULL),
-      make_floatx80(0xbffb, 0xa9f9c8c116ddec20ULL) },
-    { make_floatx80(0xbffb, 0xbfffffffffff2d18ULL),
-      make_floatx80(0x3ffe, 0xefe4b99bdcdb06ebULL),
-      make_floatx80(0xbffb, 0x80da33211927c8a8ULL) },
-    { make_floatx80(0xbffa, 0xffffffffffff8ccbULL),
-      make_floatx80(0x3ffe, 0xf5257d152486d0f4ULL),
-      make_floatx80(0xbffa, 0xada82eadb792f0c0ULL) },
-    { make_floatx80(0xbff9, 0xffffffffffff11feULL),
-      make_floatx80(0x3ffe, 0xfa83b2db722a0846ULL),
-      make_floatx80(0xbff9, 0xaf89a491babef740ULL) },
-    { floatx80_zero,
-      make_floatx80(0x3fff, 0x8000000000000000ULL),
-      floatx80_zero },
-    { make_floatx80(0x3ff9, 0xffffffffffff2680ULL),
-      make_floatx80(0x3fff, 0x82cd8698ac2b9f6fULL),
-      make_floatx80(0x3ff9, 0xb361a62b0ae7dbc0ULL) },
-    { make_floatx80(0x3ffb, 0x800000000000b500ULL),
-      make_floatx80(0x3fff, 0x85aac367cc488345ULL),
-      make_floatx80(0x3ffa, 0xb5586cf9891068a0ULL) },
-    { make_floatx80(0x3ffb, 0xbfffffffffff4b67ULL),
-      make_floatx80(0x3fff, 0x88980e8092da7cceULL),
-      make_floatx80(0x3ffb, 0x8980e8092da7cce0ULL) },
-    { make_floatx80(0x3ffb, 0xffffffffffffff57ULL),
-      make_floatx80(0x3fff, 0x8b95c1e3ea8bd6dfULL),
-      make_floatx80(0x3ffb, 0xb95c1e3ea8bd6df0ULL) },
-    { make_floatx80(0x3ffc, 0x9fffffffffff811fULL),
-      make_floatx80(0x3fff, 0x8ea4398b45cd4780ULL),
-      make_floatx80(0x3ffb, 0xea4398b45cd47800ULL) },
-    { make_floatx80(0x3ffc, 0xbfffffffffff9980ULL),
-      make_floatx80(0x3fff, 0x91c3d373ab11b919ULL),
-      make_floatx80(0x3ffc, 0x8e1e9b9d588dc8c8ULL) },
-    { make_floatx80(0x3ffc, 0xdffffffffffff631ULL),
-      make_floatx80(0x3fff, 0x94f4efa8fef70864ULL),
-      make_floatx80(0x3ffc, 0xa7a77d47f7b84320ULL) },
-    { make_floatx80(0x3ffc, 0xffffffffffff2499ULL),
-      make_floatx80(0x3fff, 0x9837f0518db892d4ULL),
-      make_floatx80(0x3ffc, 0xc1bf828c6dc496a0ULL) },
-    { make_floatx80(0x3ffd, 0x8fffffffffff80fbULL),
-      make_floatx80(0x3fff, 0x9b8d39b9d54e3a79ULL),
-      make_floatx80(0x3ffc, 0xdc69cdceaa71d3c8ULL) },
-    { make_floatx80(0x3ffd, 0x9fffffffffffbc23ULL),
-      make_floatx80(0x3fff, 0x9ef5326091a10313ULL),
-      make_floatx80(0x3ffc, 0xf7a993048d081898ULL) },
-    { make_floatx80(0x3ffd, 0xafffffffffff20ecULL),
-      make_floatx80(0x3fff, 0xa27043030c49370aULL),
-      make_floatx80(0x3ffd, 0x89c10c0c3124dc28ULL) },
-    { make_floatx80(0x3ffd, 0xc00000000000fd2cULL),
-      make_floatx80(0x3fff, 0xa5fed6a9b15171cfULL),
-      make_floatx80(0x3ffd, 0x97fb5aa6c545c73cULL) },
-    { make_floatx80(0x3ffd, 0xd0000000000093beULL),
-      make_floatx80(0x3fff, 0xa9a15ab4ea7c30e6ULL),
-      make_floatx80(0x3ffd, 0xa6856ad3a9f0c398ULL) },
-    { make_floatx80(0x3ffd, 0xe00000000000c2aeULL),
-      make_floatx80(0x3fff, 0xad583eea42a17876ULL),
-      make_floatx80(0x3ffd, 0xb560fba90a85e1d8ULL) },
-    { make_floatx80(0x3ffd, 0xefffffffffff1e3fULL),
-      make_floatx80(0x3fff, 0xb123f581d2abef6cULL),
-      make_floatx80(0x3ffd, 0xc48fd6074aafbdb0ULL) },
-    { make_floatx80(0x3ffd, 0xffffffffffff1c23ULL),
-      make_floatx80(0x3fff, 0xb504f333f9de2cadULL),
-      make_floatx80(0x3ffd, 0xd413cccfe778b2b4ULL) },
-    { make_floatx80(0x3ffe, 0x8800000000006344ULL),
-      make_floatx80(0x3fff, 0xb8fbaf4762fbd0a1ULL),
-      make_floatx80(0x3ffd, 0xe3eebd1d8bef4284ULL) },
-    { make_floatx80(0x3ffe, 0x9000000000005d67ULL),
-      make_floatx80(0x3fff, 0xbd08a39f580c668dULL),
-      make_floatx80(0x3ffd, 0xf4228e7d60319a34ULL) },
-    { make_floatx80(0x3ffe, 0x9800000000009127ULL),
-      make_floatx80(0x3fff, 0xc12c4cca6670e042ULL),
-      make_floatx80(0x3ffe, 0x82589994cce1c084ULL) },
-    { make_floatx80(0x3ffe, 0x9fffffffffff06f9ULL),
-      make_floatx80(0x3fff, 0xc5672a11550655c3ULL),
-      make_floatx80(0x3ffe, 0x8ace5422aa0cab86ULL) },
-    { make_floatx80(0x3ffe, 0xa7fffffffffff80dULL),
-      make_floatx80(0x3fff, 0xc9b9bd866e2f234bULL),
-      make_floatx80(0x3ffe, 0x93737b0cdc5e4696ULL) },
-    { make_floatx80(0x3ffe, 0xafffffffffff1470ULL),
-      make_floatx80(0x3fff, 0xce248c151f83fd69ULL),
-      make_floatx80(0x3ffe, 0x9c49182a3f07fad2ULL) },
-    { make_floatx80(0x3ffe, 0xb800000000000e0aULL),
-      make_floatx80(0x3fff, 0xd2a81d91f12aec5cULL),
-      make_floatx80(0x3ffe, 0xa5503b23e255d8b8ULL) },
-    { make_floatx80(0x3ffe, 0xc00000000000b7faULL),
-      make_floatx80(0x3fff, 0xd744fccad69dd630ULL),
-      make_floatx80(0x3ffe, 0xae89f995ad3bac60ULL) },
-    { make_floatx80(0x3ffe, 0xc800000000003aa6ULL),
-      make_floatx80(0x3fff, 0xdbfbb797daf25a44ULL),
-      make_floatx80(0x3ffe, 0xb7f76f2fb5e4b488ULL) },
-    { make_floatx80(0x3ffe, 0xd00000000000a6aeULL),
-      make_floatx80(0x3fff, 0xe0ccdeec2a954685ULL),
-      make_floatx80(0x3ffe, 0xc199bdd8552a8d0aULL) },
-    { make_floatx80(0x3ffe, 0xd800000000004165ULL),
-      make_floatx80(0x3fff, 0xe5b906e77c837155ULL),
-      make_floatx80(0x3ffe, 0xcb720dcef906e2aaULL) },
-    { make_floatx80(0x3ffe, 0xe00000000000582cULL),
-      make_floatx80(0x3fff, 0xeac0c6e7dd24713aULL),
-      make_floatx80(0x3ffe, 0xd5818dcfba48e274ULL) },
-    { make_floatx80(0x3ffe, 0xe800000000001a5dULL),
-      make_floatx80(0x3fff, 0xefe4b99bdcdb06ebULL),
-      make_floatx80(0x3ffe, 0xdfc97337b9b60dd6ULL) },
-    { make_floatx80(0x3ffe, 0xefffffffffffc1efULL),
-      make_floatx80(0x3fff, 0xf5257d152486a2faULL),
-      make_floatx80(0x3ffe, 0xea4afa2a490d45f4ULL) },
-    { make_floatx80(0x3ffe, 0xf800000000001069ULL),
-      make_floatx80(0x3fff, 0xfa83b2db722a0e5cULL),
-      make_floatx80(0x3ffe, 0xf50765b6e4541cb8ULL) },
-    { make_floatx80(0x3fff, 0x8000000000000000ULL),
-      make_floatx80(0x4000, 0x8000000000000000ULL),
-      make_floatx80(0x3fff, 0x8000000000000000ULL) },
+    { make_floatx80_init(0xbfff, 0x8000000000000000ULL),
+      make_floatx80_init(0x3ffe, 0x8000000000000000ULL),
+      make_floatx80_init(0xbffe, 0x8000000000000000ULL) },
+    { make_floatx80_init(0xbffe, 0xf800000000002e7eULL),
+      make_floatx80_init(0x3ffe, 0x82cd8698ac2b9160ULL),
+      make_floatx80_init(0xbffd, 0xfa64f2cea7a8dd40ULL) },
+    { make_floatx80_init(0xbffe, 0xefffffffffffe960ULL),
+      make_floatx80_init(0x3ffe, 0x85aac367cc488345ULL),
+      make_floatx80_init(0xbffd, 0xf4aa7930676ef976ULL) },
+    { make_floatx80_init(0xbffe, 0xe800000000006f10ULL),
+      make_floatx80_init(0x3ffe, 0x88980e8092da5c14ULL),
+      make_floatx80_init(0xbffd, 0xeecfe2feda4b47d8ULL) },
+    { make_floatx80_init(0xbffe, 0xe000000000008a45ULL),
+      make_floatx80_init(0x3ffe, 0x8b95c1e3ea8ba2a5ULL),
+      make_floatx80_init(0xbffd, 0xe8d47c382ae8bab6ULL) },
+    { make_floatx80_init(0xbffe, 0xd7ffffffffff8a9eULL),
+      make_floatx80_init(0x3ffe, 0x8ea4398b45cd8116ULL),
+      make_floatx80_init(0xbffd, 0xe2b78ce97464fdd4ULL) },
+    { make_floatx80_init(0xbffe, 0xd0000000000019a0ULL),
+      make_floatx80_init(0x3ffe, 0x91c3d373ab11b919ULL),
+      make_floatx80_init(0xbffd, 0xdc785918a9dc8dceULL) },
+    { make_floatx80_init(0xbffe, 0xc7ffffffffff14dfULL),
+      make_floatx80_init(0x3ffe, 0x94f4efa8fef76836ULL),
+      make_floatx80_init(0xbffd, 0xd61620ae02112f94ULL) },
+    { make_floatx80_init(0xbffe, 0xc000000000006530ULL),
+      make_floatx80_init(0x3ffe, 0x9837f0518db87fbbULL),
+      make_floatx80_init(0xbffd, 0xcf901f5ce48f008aULL) },
+    { make_floatx80_init(0xbffe, 0xb7ffffffffff1723ULL),
+      make_floatx80_init(0x3ffe, 0x9b8d39b9d54eb74cULL),
+      make_floatx80_init(0xbffd, 0xc8e58c8c55629168ULL) },
+    { make_floatx80_init(0xbffe, 0xb00000000000b5e1ULL),
+      make_floatx80_init(0x3ffe, 0x9ef5326091a0c366ULL),
+      make_floatx80_init(0xbffd, 0xc2159b3edcbe7934ULL) },
+    { make_floatx80_init(0xbffe, 0xa800000000006f8aULL),
+      make_floatx80_init(0x3ffe, 0xa27043030c49370aULL),
+      make_floatx80_init(0xbffd, 0xbb1f79f9e76d91ecULL) },
+    { make_floatx80_init(0xbffe, 0x9fffffffffff816aULL),
+      make_floatx80_init(0x3ffe, 0xa5fed6a9b15171cfULL),
+      make_floatx80_init(0xbffd, 0xb40252ac9d5d1c62ULL) },
+    { make_floatx80_init(0xbffe, 0x97ffffffffffb621ULL),
+      make_floatx80_init(0x3ffe, 0xa9a15ab4ea7c30e6ULL),
+      make_floatx80_init(0xbffd, 0xacbd4a962b079e34ULL) },
+    { make_floatx80_init(0xbffe, 0x8fffffffffff162bULL),
+      make_floatx80_init(0x3ffe, 0xad583eea42a1b886ULL),
+      make_floatx80_init(0xbffd, 0xa54f822b7abc8ef4ULL) },
+    { make_floatx80_init(0xbffe, 0x87ffffffffff4d34ULL),
+      make_floatx80_init(0x3ffe, 0xb123f581d2ac7b51ULL),
+      make_floatx80_init(0xbffd, 0x9db814fc5aa7095eULL) },
+    { make_floatx80_init(0xbffe, 0x800000000000227dULL),
+      make_floatx80_init(0x3ffe, 0xb504f333f9de539dULL),
+      make_floatx80_init(0xbffd, 0x95f619980c4358c6ULL) },
+    { make_floatx80_init(0xbffd, 0xefffffffffff3978ULL),
+      make_floatx80_init(0x3ffe, 0xb8fbaf4762fbd0a1ULL),
+      make_floatx80_init(0xbffd, 0x8e08a1713a085ebeULL) },
+    { make_floatx80_init(0xbffd, 0xe00000000000df81ULL),
+      make_floatx80_init(0x3ffe, 0xbd08a39f580bfd8cULL),
+      make_floatx80_init(0xbffd, 0x85eeb8c14fe804e8ULL) },
+    { make_floatx80_init(0xbffd, 0xd00000000000bccfULL),
+      make_floatx80_init(0x3ffe, 0xc12c4cca667062f6ULL),
+      make_floatx80_init(0xbffc, 0xfb4eccd6663e7428ULL) },
+    { make_floatx80_init(0xbffd, 0xc00000000000eff0ULL),
+      make_floatx80_init(0x3ffe, 0xc5672a1155069abeULL),
+      make_floatx80_init(0xbffc, 0xea6357baabe59508ULL) },
+    { make_floatx80_init(0xbffd, 0xb000000000000fe6ULL),
+      make_floatx80_init(0x3ffe, 0xc9b9bd866e2f234bULL),
+      make_floatx80_init(0xbffc, 0xd91909e6474372d4ULL) },
+    { make_floatx80_init(0xbffd, 0x9fffffffffff2172ULL),
+      make_floatx80_init(0x3ffe, 0xce248c151f84bf00ULL),
+      make_floatx80_init(0xbffc, 0xc76dcfab81ed0400ULL) },
+    { make_floatx80_init(0xbffd, 0x8fffffffffffafffULL),
+      make_floatx80_init(0x3ffe, 0xd2a81d91f12afb2bULL),
+      make_floatx80_init(0xbffc, 0xb55f89b83b541354ULL) },
+    { make_floatx80_init(0xbffc, 0xffffffffffff81a3ULL),
+      make_floatx80_init(0x3ffe, 0xd744fccad69d7d5eULL),
+      make_floatx80_init(0xbffc, 0xa2ec0cd4a58a0a88ULL) },
+    { make_floatx80_init(0xbffc, 0xdfffffffffff1568ULL),
+      make_floatx80_init(0x3ffe, 0xdbfbb797daf25a44ULL),
+      make_floatx80_init(0xbffc, 0x901121a0943696f0ULL) },
+    { make_floatx80_init(0xbffc, 0xbfffffffffff68daULL),
+      make_floatx80_init(0x3ffe, 0xe0ccdeec2a94f811ULL),
+      make_floatx80_init(0xbffb, 0xf999089eab583f78ULL) },
+    { make_floatx80_init(0xbffc, 0x9fffffffffff4690ULL),
+      make_floatx80_init(0x3ffe, 0xe5b906e77c83657eULL),
+      make_floatx80_init(0xbffb, 0xd237c8c41be4d410ULL) },
+    { make_floatx80_init(0xbffb, 0xffffffffffff8aeeULL),
+      make_floatx80_init(0x3ffe, 0xeac0c6e7dd24427cULL),
+      make_floatx80_init(0xbffb, 0xa9f9c8c116ddec20ULL) },
+    { make_floatx80_init(0xbffb, 0xbfffffffffff2d18ULL),
+      make_floatx80_init(0x3ffe, 0xefe4b99bdcdb06ebULL),
+      make_floatx80_init(0xbffb, 0x80da33211927c8a8ULL) },
+    { make_floatx80_init(0xbffa, 0xffffffffffff8ccbULL),
+      make_floatx80_init(0x3ffe, 0xf5257d152486d0f4ULL),
+      make_floatx80_init(0xbffa, 0xada82eadb792f0c0ULL) },
+    { make_floatx80_init(0xbff9, 0xffffffffffff11feULL),
+      make_floatx80_init(0x3ffe, 0xfa83b2db722a0846ULL),
+      make_floatx80_init(0xbff9, 0xaf89a491babef740ULL) },
+    { floatx80_zero_init,
+      make_floatx80_init(0x3fff, 0x8000000000000000ULL),
+      floatx80_zero_init },
+    { make_floatx80_init(0x3ff9, 0xffffffffffff2680ULL),
+      make_floatx80_init(0x3fff, 0x82cd8698ac2b9f6fULL),
+      make_floatx80_init(0x3ff9, 0xb361a62b0ae7dbc0ULL) },
+    { make_floatx80_init(0x3ffb, 0x800000000000b500ULL),
+      make_floatx80_init(0x3fff, 0x85aac367cc488345ULL),
+      make_floatx80_init(0x3ffa, 0xb5586cf9891068a0ULL) },
+    { make_floatx80_init(0x3ffb, 0xbfffffffffff4b67ULL),
+      make_floatx80_init(0x3fff, 0x88980e8092da7cceULL),
+      make_floatx80_init(0x3ffb, 0x8980e8092da7cce0ULL) },
+    { make_floatx80_init(0x3ffb, 0xffffffffffffff57ULL),
+      make_floatx80_init(0x3fff, 0x8b95c1e3ea8bd6dfULL),
+      make_floatx80_init(0x3ffb, 0xb95c1e3ea8bd6df0ULL) },
+    { make_floatx80_init(0x3ffc, 0x9fffffffffff811fULL),
+      make_floatx80_init(0x3fff, 0x8ea4398b45cd4780ULL),
+      make_floatx80_init(0x3ffb, 0xea4398b45cd47800ULL) },
+    { make_floatx80_init(0x3ffc, 0xbfffffffffff9980ULL),
+      make_floatx80_init(0x3fff, 0x91c3d373ab11b919ULL),
+      make_floatx80_init(0x3ffc, 0x8e1e9b9d588dc8c8ULL) },
+    { make_floatx80_init(0x3ffc, 0xdffffffffffff631ULL),
+      make_floatx80_init(0x3fff, 0x94f4efa8fef70864ULL),
+      make_floatx80_init(0x3ffc, 0xa7a77d47f7b84320ULL) },
+    { make_floatx80_init(0x3ffc, 0xffffffffffff2499ULL),
+      make_floatx80_init(0x3fff, 0x9837f0518db892d4ULL),
+      make_floatx80_init(0x3ffc, 0xc1bf828c6dc496a0ULL) },
+    { make_floatx80_init(0x3ffd, 0x8fffffffffff80fbULL),
+      make_floatx80_init(0x3fff, 0x9b8d39b9d54e3a79ULL),
+      make_floatx80_init(0x3ffc, 0xdc69cdceaa71d3c8ULL) },
+    { make_floatx80_init(0x3ffd, 0x9fffffffffffbc23ULL),
+      make_floatx80_init(0x3fff, 0x9ef5326091a10313ULL),
+      make_floatx80_init(0x3ffc, 0xf7a993048d081898ULL) },
+    { make_floatx80_init(0x3ffd, 0xafffffffffff20ecULL),
+      make_floatx80_init(0x3fff, 0xa27043030c49370aULL),
+      make_floatx80_init(0x3ffd, 0x89c10c0c3124dc28ULL) },
+    { make_floatx80_init(0x3ffd, 0xc00000000000fd2cULL),
+      make_floatx80_init(0x3fff, 0xa5fed6a9b15171cfULL),
+      make_floatx80_init(0x3ffd, 0x97fb5aa6c545c73cULL) },
+    { make_floatx80_init(0x3ffd, 0xd0000000000093beULL),
+      make_floatx80_init(0x3fff, 0xa9a15ab4ea7c30e6ULL),
+      make_floatx80_init(0x3ffd, 0xa6856ad3a9f0c398ULL) },
+    { make_floatx80_init(0x3ffd, 0xe00000000000c2aeULL),
+      make_floatx80_init(0x3fff, 0xad583eea42a17876ULL),
+      make_floatx80_init(0x3ffd, 0xb560fba90a85e1d8ULL) },
+    { make_floatx80_init(0x3ffd, 0xefffffffffff1e3fULL),
+      make_floatx80_init(0x3fff, 0xb123f581d2abef6cULL),
+      make_floatx80_init(0x3ffd, 0xc48fd6074aafbdb0ULL) },
+    { make_floatx80_init(0x3ffd, 0xffffffffffff1c23ULL),
+      make_floatx80_init(0x3fff, 0xb504f333f9de2cadULL),
+      make_floatx80_init(0x3ffd, 0xd413cccfe778b2b4ULL) },
+    { make_floatx80_init(0x3ffe, 0x8800000000006344ULL),
+      make_floatx80_init(0x3fff, 0xb8fbaf4762fbd0a1ULL),
+      make_floatx80_init(0x3ffd, 0xe3eebd1d8bef4284ULL) },
+    { make_floatx80_init(0x3ffe, 0x9000000000005d67ULL),
+      make_floatx80_init(0x3fff, 0xbd08a39f580c668dULL),
+      make_floatx80_init(0x3ffd, 0xf4228e7d60319a34ULL) },
+    { make_floatx80_init(0x3ffe, 0x9800000000009127ULL),
+      make_floatx80_init(0x3fff, 0xc12c4cca6670e042ULL),
+      make_floatx80_init(0x3ffe, 0x82589994cce1c084ULL) },
+    { make_floatx80_init(0x3ffe, 0x9fffffffffff06f9ULL),
+      make_floatx80_init(0x3fff, 0xc5672a11550655c3ULL),
+      make_floatx80_init(0x3ffe, 0x8ace5422aa0cab86ULL) },
+    { make_floatx80_init(0x3ffe, 0xa7fffffffffff80dULL),
+      make_floatx80_init(0x3fff, 0xc9b9bd866e2f234bULL),
+      make_floatx80_init(0x3ffe, 0x93737b0cdc5e4696ULL) },
+    { make_floatx80_init(0x3ffe, 0xafffffffffff1470ULL),
+      make_floatx80_init(0x3fff, 0xce248c151f83fd69ULL),
+      make_floatx80_init(0x3ffe, 0x9c49182a3f07fad2ULL) },
+    { make_floatx80_init(0x3ffe, 0xb800000000000e0aULL),
+      make_floatx80_init(0x3fff, 0xd2a81d91f12aec5cULL),
+      make_floatx80_init(0x3ffe, 0xa5503b23e255d8b8ULL) },
+    { make_floatx80_init(0x3ffe, 0xc00000000000b7faULL),
+      make_floatx80_init(0x3fff, 0xd744fccad69dd630ULL),
+      make_floatx80_init(0x3ffe, 0xae89f995ad3bac60ULL) },
+    { make_floatx80_init(0x3ffe, 0xc800000000003aa6ULL),
+      make_floatx80_init(0x3fff, 0xdbfbb797daf25a44ULL),
+      make_floatx80_init(0x3ffe, 0xb7f76f2fb5e4b488ULL) },
+    { make_floatx80_init(0x3ffe, 0xd00000000000a6aeULL),
+      make_floatx80_init(0x3fff, 0xe0ccdeec2a954685ULL),
+      make_floatx80_init(0x3ffe, 0xc199bdd8552a8d0aULL) },
+    { make_floatx80_init(0x3ffe, 0xd800000000004165ULL),
+      make_floatx80_init(0x3fff, 0xe5b906e77c837155ULL),
+      make_floatx80_init(0x3ffe, 0xcb720dcef906e2aaULL) },
+    { make_floatx80_init(0x3ffe, 0xe00000000000582cULL),
+      make_floatx80_init(0x3fff, 0xeac0c6e7dd24713aULL),
+      make_floatx80_init(0x3ffe, 0xd5818dcfba48e274ULL) },
+    { make_floatx80_init(0x3ffe, 0xe800000000001a5dULL),
+      make_floatx80_init(0x3fff, 0xefe4b99bdcdb06ebULL),
+      make_floatx80_init(0x3ffe, 0xdfc97337b9b60dd6ULL) },
+    { make_floatx80_init(0x3ffe, 0xefffffffffffc1efULL),
+      make_floatx80_init(0x3fff, 0xf5257d152486a2faULL),
+      make_floatx80_init(0x3ffe, 0xea4afa2a490d45f4ULL) },
+    { make_floatx80_init(0x3ffe, 0xf800000000001069ULL),
+      make_floatx80_init(0x3fff, 0xfa83b2db722a0e5cULL),
+      make_floatx80_init(0x3ffe, 0xf50765b6e4541cb8ULL) },
+    { make_floatx80_init(0x3fff, 0x8000000000000000ULL),
+      make_floatx80_init(0x4000, 0x8000000000000000ULL),
+      make_floatx80_init(0x3fff, 0x8000000000000000ULL) },
 };
 
 void helper_f2xm1(CPUX86State *env)
@@ -1275,24 +1275,24 @@ struct fpatan_data {
 };
 
 static const struct fpatan_data fpatan_table[9] = {
-    { floatx80_zero,
-      floatx80_zero },
-    { make_floatx80(0x3ffb, 0xfeadd4d5617b6e33ULL),
-      make_floatx80(0xbfb9, 0xdda19d8305ddc420ULL) },
-    { make_floatx80(0x3ffc, 0xfadbafc96406eb15ULL),
-      make_floatx80(0x3fbb, 0xdb8f3debef442fccULL) },
-    { make_floatx80(0x3ffd, 0xb7b0ca0f26f78474ULL),
-      make_floatx80(0xbfbc, 0xeab9bdba460376faULL) },
-    { make_floatx80(0x3ffd, 0xed63382b0dda7b45ULL),
-      make_floatx80(0x3fbc, 0xdfc88bd978751a06ULL) },
-    { make_floatx80(0x3ffe, 0x8f005d5ef7f59f9bULL),
-      make_floatx80(0x3fbd, 0xb906bc2ccb886e90ULL) },
-    { make_floatx80(0x3ffe, 0xa4bc7d1934f70924ULL),
-      make_floatx80(0x3fbb, 0xcd43f9522bed64f8ULL) },
-    { make_floatx80(0x3ffe, 0xb8053e2bc2319e74ULL),
-      make_floatx80(0xbfbc, 0xd3496ab7bd6eef0cULL) },
-    { make_floatx80(0x3ffe, 0xc90fdaa22168c235ULL),
-      make_floatx80(0xbfbc, 0xece675d1fc8f8cbcULL) },
+    { floatx80_zero_init,
+      floatx80_zero_init },
+    { make_floatx80_init(0x3ffb, 0xfeadd4d5617b6e33ULL),
+      make_floatx80_init(0xbfb9, 0xdda19d8305ddc420ULL) },
+    { make_floatx80_init(0x3ffc, 0xfadbafc96406eb15ULL),
+      make_floatx80_init(0x3fbb, 0xdb8f3debef442fccULL) },
+    { make_floatx80_init(0x3ffd, 0xb7b0ca0f26f78474ULL),
+      make_floatx80_init(0xbfbc, 0xeab9bdba460376faULL) },
+    { make_floatx80_init(0x3ffd, 0xed63382b0dda7b45ULL),
+      make_floatx80_init(0x3fbc, 0xdfc88bd978751a06ULL) },
+    { make_floatx80_init(0x3ffe, 0x8f005d5ef7f59f9bULL),
+      make_floatx80_init(0x3fbd, 0xb906bc2ccb886e90ULL) },
+    { make_floatx80_init(0x3ffe, 0xa4bc7d1934f70924ULL),
+      make_floatx80_init(0x3fbb, 0xcd43f9522bed64f8ULL) },
+    { make_floatx80_init(0x3ffe, 0xb8053e2bc2319e74ULL),
+      make_floatx80_init(0xbfbc, 0xd3496ab7bd6eef0cULL) },
+    { make_floatx80_init(0x3ffe, 0xc90fdaa22168c235ULL),
+      make_floatx80_init(0xbfbc, 0xece675d1fc8f8cbcULL) },
 };
 
 void helper_fpatan(CPUX86State *env)
-- 
2.20.1


