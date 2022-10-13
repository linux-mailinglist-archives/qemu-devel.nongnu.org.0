Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 604945FE491
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 23:54:48 +0200 (CEST)
Received: from localhost ([::1]:33182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj6AB-0005Nd-EL
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 17:54:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj62t-0002TC-25
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:47:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj62r-0005C3-IY
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:47:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665697632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=owZpd2lbrfAxFaJKGE6lZlkqmFBquIIN5WL+QF/R+BI=;
 b=B1ubc/z1QIDhRhERzN71PuFPACRdXWwKPOGokMQt3gRjDPb68TWYhUdn+578PBS2vJjItu
 dOmzz+jwRgljvCFylZQa2HTvVAwcRyPuRYoVG5sMqXDjhGZ5h/+CZxGdMKWrXPhQLxKZGw
 gb3ZMNmwwMCrdz7yaZIjAikYffmiEK8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-323-zfD5Ex4IMyS9dck3vJO4jA-1; Thu, 13 Oct 2022 17:47:11 -0400
X-MC-Unique: zfD5Ex4IMyS9dck3vJO4jA-1
Received: by mail-ed1-f71.google.com with SMTP id
 c17-20020a05640227d100b0045c91f982a1so2333281ede.2
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 14:47:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=owZpd2lbrfAxFaJKGE6lZlkqmFBquIIN5WL+QF/R+BI=;
 b=x6TpmMHo432QgR3lVcEbrhOyYxVylfHmesj+aUlMdPvZ2fcuHYlujJsC0LDWqhlYx7
 bt5NsF9Rg5RPiSv4zc8m25863b3WP2pom6G9ceknkRwM8fmztzmbKJKxthSHi5QfUNDh
 7EQqnlVVX1HeBAc8jq+juoxpcDbSTCqSu/sUj3UFeeB2+UMEnOMsfAEoF1EdgCIMQpyE
 oJ7qMoYgz+k5FdI9o/u7Z8qx1ay1u3olLHQOQYdy/JZ/vNs1KaKaPuXuaNlqMYbwLDIE
 IT/0dZw2nJCkzfY8s7txc4qBEP51YmA+DExwrbIi/nK4vZX2zzeWUcIQKNU9MBt42Y5w
 kR7g==
X-Gm-Message-State: ACrzQf36B9EKHsHRfkduqg3vGwJRhsEuXR44ImtdLOrlQk5pUXY9ZCfU
 docRrgd12jmQugAoEFkQ9suCE+xFhsUskhTH4h3yZQ980JEy/uLHYLhrIs8BTWAf4p0J34WEonu
 Gat82Tjm/1BnheUV8MpA1gDz2jKAhEVPX6DM8zwHAfR2mYoNlF3w1AdMp0XblubZJgU4=
X-Received: by 2002:a17:907:847:b0:77f:f489:cc25 with SMTP id
 ww7-20020a170907084700b0077ff489cc25mr1323525ejb.80.1665697629981; 
 Thu, 13 Oct 2022 14:47:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4jYNzPwz5wjiuB9UiRMwIx4aR9L7E/Vi59E29S3u8PtAikRMYds43+W6rjYXOVqHfdxv34Xw==
X-Received: by 2002:a17:907:847:b0:77f:f489:cc25 with SMTP id
 ww7-20020a170907084700b0077ff489cc25mr1323510ejb.80.1665697629714; 
 Thu, 13 Oct 2022 14:47:09 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a056402004700b00458d50b4a24sm478409edu.96.2022.10.13.14.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 14:47:09 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH 05/35] target/i386: add CPUID[EAX=7, ECX=0].ECX to DisasContext
Date: Thu, 13 Oct 2022 23:46:21 +0200
Message-Id: <20221013214651.672114-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013214651.672114-1-pbonzini@redhat.com>
References: <20221013214651.672114-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

TCG will shortly implement VAES instructions, so add the relevant feature
word to the DisasContext.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 4403d376e0..f3ba3275d2 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -116,6 +116,7 @@ typedef struct DisasContext {
     int cpuid_ext2_features;
     int cpuid_ext3_features;
     int cpuid_7_0_ebx_features;
+    int cpuid_7_0_ecx_features;
     int cpuid_xsave_features;
 
     /* TCG local temps */
@@ -8851,6 +8852,7 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     dc->cpuid_ext2_features = env->features[FEAT_8000_0001_EDX];
     dc->cpuid_ext3_features = env->features[FEAT_8000_0001_ECX];
     dc->cpuid_7_0_ebx_features = env->features[FEAT_7_0_EBX];
+    dc->cpuid_7_0_ecx_features = env->features[FEAT_7_0_ECX];
     dc->cpuid_xsave_features = env->features[FEAT_XSAVE];
     dc->jmp_opt = !((cflags & CF_NO_GOTO_TB) ||
                     (flags & (HF_TF_MASK | HF_INHIBIT_IRQ_MASK)));
-- 
2.37.3


