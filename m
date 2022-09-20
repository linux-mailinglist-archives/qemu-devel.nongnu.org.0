Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9463B5BF011
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 00:27:29 +0200 (CEST)
Received: from localhost ([::1]:60166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaliB-0001Dd-VD
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 18:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oagzv-0006Kj-DS
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oagzt-00026V-GS
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663694723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pmay+KXHKAZiRDPwIYrcS61+XW1Aa8B74QrdkvyUTEc=;
 b=cBBtJolhpLBXvlDyGRy+R39Oj//ffMqLGQTsdD9GfC3Ot1pWi6NBgXR+qWvaIjNLQ/rj+W
 8FH1nzsLBWSUgMAajIaQRMaAPA6k2Hxe4+8dy4i+ohgkyz/HSAW/lmM6KsQKAIcSZq1/3n
 kWSx8fDOk6Xuq76e9enhSMusqfL+8KU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-272-OOjDHFK0N_qimoQkqJqsOw-1; Tue, 20 Sep 2022 13:25:21 -0400
X-MC-Unique: OOjDHFK0N_qimoQkqJqsOw-1
Received: by mail-ed1-f70.google.com with SMTP id
 y14-20020a056402440e00b0044301c7ccd9so2347316eda.19
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:25:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=pmay+KXHKAZiRDPwIYrcS61+XW1Aa8B74QrdkvyUTEc=;
 b=EDddJsYcRaGrtH+ZfSKIwydkRurUM09gkZupKuBcgVxqDE64AHP+uySEfA0ihtTnG9
 TJhOkZf2DsvDPATgAgNDhRrALGYMK4RKY/jjZ+HZk3iAZ+bRX+udme4hmquCFhEKQz3j
 i1Er5gd4jUDxyo7SsWouNGJHHGz9aIMLhnfaNBnpo4e4v1vOeBBoiZVPz8miAGuLY+WY
 1f/3UCOpqL0cfDFXf65rJqcHSpgpdIYmP9msdm1VYfP4o2zN4IEfY1aczbaSvm9IQnI8
 +ChMQ/D2CLJfWxuZllGSLve7HeaArEBkREKIqZf88dgBGImCsdWqblugqCc/t0697iAn
 UMPA==
X-Gm-Message-State: ACrzQf1WOX0OxkyDiQhto3F850Gs8BTJzRL7iU0/JKRGxC7ZXT0QVpZ1
 9qSAkhGw4HKwe9NX70793tE8NiSYvjSatQhUp+1LsLIqqhUUFp7Gx1SYdp2nDYJ2/FNjOwL6Ha4
 /6wHdam5ZmMAQWsHGxk/cQsgFiRK4wTe+JSO7YEHUQ0nDBVMzpJ/U586J3d6cmYGKrPg=
X-Received: by 2002:a17:907:9714:b0:77b:e7a8:2f66 with SMTP id
 jg20-20020a170907971400b0077be7a82f66mr18154800ejc.107.1663694720348; 
 Tue, 20 Sep 2022 10:25:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4Aoy/QtKxICN9IO17gGlah/cdhOra84clJKOhtVqLKEX9SdUxru4JROWQdwOr3RDVXDEOATg==
X-Received: by 2002:a17:907:9714:b0:77b:e7a8:2f66 with SMTP id
 jg20-20020a170907971400b0077be7a82f66mr18154787ejc.107.1663694720089; 
 Tue, 20 Sep 2022 10:25:20 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 t18-20020a17090605d200b0073da32b7db0sm128228ejt.199.2022.09.20.10.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:25:19 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH v2 07/37] target/i386: add CPUID[EAX=7,
 ECX=0].ECX to DisasContext
Date: Tue, 20 Sep 2022 19:24:37 +0200
Message-Id: <20220920172507.95568-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220920172507.95568-1-pbonzini@redhat.com>
References: <20220920172507.95568-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
index e6e82f32cb..4dcd276e80 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -115,6 +115,7 @@ typedef struct DisasContext {
     int cpuid_ext2_features;
     int cpuid_ext3_features;
     int cpuid_7_0_ebx_features;
+    int cpuid_7_0_ecx_features;
     int cpuid_xsave_features;
 
     /* TCG local temps */
@@ -8871,6 +8872,7 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     dc->cpuid_ext2_features = env->features[FEAT_8000_0001_EDX];
     dc->cpuid_ext3_features = env->features[FEAT_8000_0001_ECX];
     dc->cpuid_7_0_ebx_features = env->features[FEAT_7_0_EBX];
+    dc->cpuid_7_0_ecx_features = env->features[FEAT_7_0_ECX];
     dc->cpuid_xsave_features = env->features[FEAT_XSAVE];
     dc->jmp_opt = !((cflags & CF_NO_GOTO_TB) ||
                     (flags & (HF_TF_MASK | HF_INHIBIT_IRQ_MASK)));
-- 
2.37.2


