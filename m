Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6425499C5
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 19:22:05 +0200 (CEST)
Received: from localhost ([::1]:55788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0nlM-0004sP-9p
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 13:22:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o0ncm-0001JA-G7
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 13:13:13 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:38621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o0nck-0006x4-2o
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 13:13:11 -0400
Received: by mail-ej1-x62c.google.com with SMTP id n10so12428523ejk.5
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 10:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2PGpjsrLqpE/QLQNcCq3szGIZC92jtro/jYiQlTKzhk=;
 b=nfIrWEZ/zprQsae0dw5is62HjDlo6xe54tIej6T9UscYaKUaPPUusiQqdOh3U7nQUn
 yMOXWZ2HBxW2tbEbefeB61BUZtGEffQoU21+H7Ne2QPL8fx7DjBPI57jQLAd2duwVy1Y
 WpHr5iISmgO4VvqnDkh1+AnN6/CYrzlCJdoNV5P338NsCz9wLmI1v7O8FP1tBYIsnypk
 3pyAEpLskap2VcExXa+p1JOY+tyvSdyfLxGErwhUeETWZ9bSxyUykyITlUUldCSmwdFr
 L9x805lxNY+ESIAN6EHxWVUf8s1gQ/w2HkweSuqxycHqOnCM6CysoBXT35jgR5eeITBV
 yQxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2PGpjsrLqpE/QLQNcCq3szGIZC92jtro/jYiQlTKzhk=;
 b=wz9kM/VOZ4Qc0pzS+UMqFj0AkiCoPjlN2t5lDYEKfMN7wCZyCTx4Q1G5xrXZVD53x5
 ToOm+XiyAbFBeUFyFmaidTzdmF/Quf517aj/LP84S71yZS8HL44VqG+hJrEtVvXzyM5D
 InkfOQgPk0VtCmzkttS/Bi/kiPeWOh5SD9f1eCmjnoeJk8YE9AjaVDmCK+7FZiQ4JmaB
 bUSTk2GobGmDfP9kfV7E8CH/DjzF0gOzgwzi6d55CJzzsx2+EeB+9tP9a2hilcxn25YR
 bxJ8GLNIef7HuGEHg93Yix8SH4knkBYhBWjcHr8+iAsfw/W1jCQ8HraGe1e/g22bsSPo
 IMOg==
X-Gm-Message-State: AJIora/QNwE/r7D/h5P2Ran2yyfV+4VY1zr10LiP1HgOj2M++ym39quh
 Jl9c6ZNE249XGXyWcIFo90xSww==
X-Google-Smtp-Source: AGRyM1u016xOPleAgQaHxXPn4X86gG0OgfYWAEwevKUMz4DGendhe2DOdCn17bunrNhsrzC1i/6GEw==
X-Received: by 2002:a17:906:7315:b0:711:db45:af4c with SMTP id
 di21-20020a170906731500b00711db45af4cmr711332ejc.412.1655140388307; 
 Mon, 13 Jun 2022 10:13:08 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 n21-20020a5099d5000000b0042dccb44e88sm5359485edb.23.2022.06.13.10.13.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 10:13:06 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 648331FFBD;
 Mon, 13 Jun 2022 18:12:59 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 5/7] tests/tcg: disable xtensa-linux-user again
Date: Mon, 13 Jun 2022 18:12:56 +0100
Message-Id: <20220613171258.1905715-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220613171258.1905715-1-alex.bennee@linaro.org>
References: <20220613171258.1905715-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

The move from tests/tcg/configure.sh started enabling the container image
for xtensa-linux-user, which fails because the compiler does not have
the full set of headers.  The cause is the "xtensa*-softmmu)" case
in tests/tcg/configure.sh which became just "xtensa*)" in the new
probe_target_compiler shell function.  Look out for xtensa*-linux-user
and do not configure it.

Reported-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220608135727.1341946-1-pbonzini@redhat.com>
Fixes: cd362defbb ("tests/tcg: merge configure.sh back into main configure script")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index e69537c756..4b12a8094c 100755
--- a/configure
+++ b/configure
@@ -2024,7 +2024,6 @@ probe_target_compiler() {
         container_cross_prefix=x86_64-linux-gnu-
         ;;
       xtensa*)
-        # FIXME: xtensa-linux-user?
         container_hosts=x86_64
         container_image=debian-xtensa-cross
 
@@ -2481,6 +2480,10 @@ for target in $target_list; do
   echo "# Automatically generated by configure - do not modify" > $config_target_mak
   echo "TARGET_NAME=$arch" >> $config_target_mak
   case $target in
+    xtensa*-linux-user)
+      # the toolchain is not complete with headers, only build softmmu tests
+      continue
+      ;;
     *-softmmu)
       test -f $source_path/tests/tcg/$arch/Makefile.softmmu-target || continue
       qemu="qemu-system-$arch"
-- 
2.30.2


