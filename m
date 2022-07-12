Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D5D571AA4
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 14:58:42 +0200 (CEST)
Received: from localhost ([::1]:44712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBFTN-0007UJ-JZ
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 08:58:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBFLI-00037e-Va
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:50:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBFLE-0001Rq-2B
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:50:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657630214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vdqmLvR6JN932wcQnmiu8+mPHY+md+mV37njXiUqS3g=;
 b=gpiZ8l2oLRpMv071k9Fs5GY389akS0KdV/ygqJH/jcZnA2iSaq1PTjLwkOtp+XRgtiYwV3
 STcNE/K+8v9Njw0iriNTn5KQ+Rm2UnlEEwqUnne55v7YWE/3HHgdzEYRIcl73McNu5a4tp
 M6iG2pZedhzPYwlRjBBslvG3PnHjwIw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-481-MUyGXDHtOs6G9onTAU7IHQ-1; Tue, 12 Jul 2022 08:50:12 -0400
X-MC-Unique: MUyGXDHtOs6G9onTAU7IHQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 sc42-20020a1709078a2a00b0072b5f51a9dbso1888098ejc.1
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 05:50:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vdqmLvR6JN932wcQnmiu8+mPHY+md+mV37njXiUqS3g=;
 b=aUbltpC04sR60M8mtVkopAeIJES8bu8PIGFxsSKz+hIG/7L3qZCgWrUW4UvOfJ707U
 h1g2ca6oq/GJQejP/XOrwm3cyxUkG/NN4SY/4KLt4zDF6DCnDe6D6BhAbCttuwqzzB3n
 snIDagEQyMrOoS1OpIKpvaMTLEZzB99Ups/paomI7BIjp2Uut00P57ai7+OqvTWbqdkx
 Db4w485i2+y/L+jes90qSr3J4BAjNuTIQcxkIngqbyhCFFdh1N11QI2pN7QqTdI8/xob
 ac6aL0iOkrNWQthcZEKJ5+8JHeAcgDloWpZhc/Dpp1BQIVNyuX7XIg7wnEvEXJJe5c21
 GLdw==
X-Gm-Message-State: AJIora9eiUxqwurbnvG/Fm87lXm14tpygMK4uQLVW95MnxI4Iid08yao
 dZ0H/0xcslWxafR6d377/7WMp4pYftZNgWAru3Qa8jPO6UD1tEJtkI3srmsTwwA6sm8elYw/zlD
 QlP7+YU1UIoHTMS24a+7fr9ALdLdZBajxVcv4B5BfX0DYhswPuIMjHDhjlPTsfXUci9c=
X-Received: by 2002:aa7:c2d7:0:b0:43a:78af:6e57 with SMTP id
 m23-20020aa7c2d7000000b0043a78af6e57mr31507216edp.163.1657630211486; 
 Tue, 12 Jul 2022 05:50:11 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tIP/7f3VhUc2LnZnQLNkLTa8q2AleDk5eO6cOIwXMSLo4CP1VbPTZdz+7F3mcuioz4u7HXjg==
X-Received: by 2002:aa7:c2d7:0:b0:43a:78af:6e57 with SMTP id
 m23-20020aa7c2d7000000b0043a78af6e57mr31507181edp.163.1657630211186; 
 Tue, 12 Jul 2022 05:50:11 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 pv5-20020a170907208500b0072af4af2f46sm3764846ejb.74.2022.07.12.05.50.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 05:50:10 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/18] configure: allow more host/target combos to use the host
 compiler
Date: Tue, 12 Jul 2022 14:49:45 +0200
Message-Id: <20220712124956.150451-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712124956.150451-1-pbonzini@redhat.com>
References: <20220712124956.150451-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Add more pairs of bi-arch compilers, so that it is not necessary to have
e.g. both little-endian and big-endian ARM compilers.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/configure b/configure
index 8f3401a23e..c9feb1a924 100755
--- a/configure
+++ b/configure
@@ -2058,8 +2058,12 @@ probe_target_compiler() {
   compute_target_variable $1 target_ranlib ranlib
   compute_target_variable $1 target_strip strip
   case "$1:$cpu" in
+    aarch64_be:aarch64 | \
+    armeb:arm | \
     i386:x86_64 | \
+    mips*:mips64 | \
     ppc*:ppc64 | \
+    sparc:sparc64 | \
     "$cpu:$cpu")
       : ${target_cc:=$cc}
       : ${target_ccas:=$ccas}
-- 
2.36.1



