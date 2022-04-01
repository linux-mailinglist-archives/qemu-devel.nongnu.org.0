Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EF74EEFD1
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 16:30:12 +0200 (CEST)
Received: from localhost ([::1]:40426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naIHz-0000qL-9m
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 10:30:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1naI2B-00041B-IA
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 10:13:51 -0400
Received: from [2a00:1450:4864:20::62b] (port=43006
 helo=mail-ej1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1naI2A-0006eK-2T
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 10:13:51 -0400
Received: by mail-ej1-x62b.google.com with SMTP id j15so6104416eje.9
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 07:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e5NK+IBafbABoMZkfxnbwRAIBUXFveQkCRnSRQFORZU=;
 b=KnWaiNGkAbreFqbfh6PE6pNNpvdi7cmv8yv3wiChdPEfNaxxhv3QUCo0ja7RimwdIs
 4HC/2CKR58obTc75D5olExxhnHBY9xn8gMrgCAXWawN48aS3kVAXzzhNDhPg97rQA5rZ
 ThZCZbI20thCnMQVuEGoTGLgrPW3p6CTWG6B8yVwduOSZJd6134Nm4rCga1W4Tzm5wDb
 WWWSq3MuVtvQc0B+SMoBhiSwb5yYpx4BQ387r3feIanSFqUMxEcnd7mwNj+DKuwiPZZ9
 dF8bGGhZFKfwm/Pz33IjtljZhIprLASgfTZYGcABLf6oSqK0eP7i4C1z2M7JICOYEKjF
 Qryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=e5NK+IBafbABoMZkfxnbwRAIBUXFveQkCRnSRQFORZU=;
 b=y/LcguTLSehGsDoJ7xvTN4QOLQz9oU0ZC57mItnikYzsWb86fuoVtQ4euAlbINtqhh
 n/y9z2/cuO/LWats6P6ffDxgy9IUVRkQE0/F2qjE5KJvjw8yMhybPil6E+KUb79Hefum
 n86Cgr8fJB4R8gb9OpvC0z1dIomFHRYQPv4uAvl230leeOmyz3M/5ET8tmsPGqGAO/vl
 N5A3ZEWMIKa1r3Ts4MVnMtmNmuJdbTanH9DRjCpEp4WeZTTG+VnPvimZyibpOaYaUlUk
 W5Tl6701uxOgmmtve5mqqk5sVvIY7ObDPHuOfPRbyJ3gMhUXidhoo3VsXceZf8WyABeN
 Eycg==
X-Gm-Message-State: AOAM533tDCOVv9ypbAoCVbFLyyx3cm5u+hr0ajEf0nAw7YdZAHwGP0RV
 gKT90Hxtg8yToUikKAHuLlZ5LQP3tyE=
X-Google-Smtp-Source: ABdhPJwOTHgMWkkdyE7u5AGUL2GvnPTh3Qw8Zdg7oBnHIjRDty7b4YG+lBwFD5CKBRBb+5IGE7LOvQ==
X-Received: by 2002:a17:907:1b10:b0:6e4:bac5:f080 with SMTP id
 mp16-20020a1709071b1000b006e4bac5f080mr55886ejc.24.1648822428745; 
 Fri, 01 Apr 2022 07:13:48 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bn3-20020a170906c0c300b006e50416e24bsm212595ejb.98.2022.04.01.07.13.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 07:13:48 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/17] tests/tcg: fix non-static build
Date: Fri,  1 Apr 2022 16:13:26 +0200
Message-Id: <20220401141326.1244422-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401141326.1244422-1-pbonzini@redhat.com>
References: <20220401141326.1244422-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If linking with -static fails at configure time, -static should not be used
at build time either.  Do not include BUILD_STATIC in $config_target_mak.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220328140240.40798-16-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/tcg/configure.sh | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 75603fee6d..691d90abac 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -261,7 +261,6 @@ for target in $target_list; do
                   if do_compiler "$target_compiler" $target_compiler_cflags \
                                  -o $TMPE $TMPC ; then
                       got_cross_cc=yes
-                      echo "BUILD_STATIC=y" >> $config_target_mak
                       echo "CC=$target_compiler" >> $config_target_mak
                   fi
               else
-- 
2.35.1


