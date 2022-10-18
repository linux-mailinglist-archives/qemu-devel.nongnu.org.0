Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8174D602DB9
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 16:00:10 +0200 (CEST)
Received: from localhost ([::1]:54474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okn8b-0002zA-Ds
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 10:00:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmiS-0004Ra-0o
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:33:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmiA-0005H3-QR
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:32:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666099956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jGWfq6eTVwMpCraC7JzJ6/JuO3n3PCIS41bQQLFgqiA=;
 b=gq6rQYz9dP6HjSZPNObe5kSKUHISAwtD+8WVQzYY6XZ3CLRUK4XEkQurxxQSSBohjFk08D
 MdYYrUW2D8asneSsHnP5i5j4jlXAfaSzxNALi7qpAlYOCIgeAhhghfC6S89Tp4tTQZ7lno
 VNpdREZSuHVsrnn93krlTiisRjGRn2c=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-517-CN9Bt19fMkq_sD9eV1rooA-1; Tue, 18 Oct 2022 09:32:34 -0400
X-MC-Unique: CN9Bt19fMkq_sD9eV1rooA-1
Received: by mail-ed1-f70.google.com with SMTP id
 z20-20020a05640240d400b0045cec07c3dcso11497373edb.3
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 06:32:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jGWfq6eTVwMpCraC7JzJ6/JuO3n3PCIS41bQQLFgqiA=;
 b=UHNt6/PhAq7u5R2Rj2Du3j8ADfWK5tz8Eyl/ffITQXuuAeHfkorDLxguEuuZGMoR6g
 zMSaENvvOKA+iHJvKdnq2w1rQY8A0T1aP+jDdcYyrDS+lYtVFXVQhE4FwCz6tEXy+/OL
 LyusGCcChUPeuHPtTEW6ycCk6NDRv/TFaUlQ5BRHyDW3fUx6yO0UjwDvMfHynFTK5gPE
 zjh7UfBik8vxfUv1ELNhJNq+G+BPKEkAej/D5K8jc0azwYFo2/WpSc+9d6t8ljj27SyL
 b++WFpg8ezQK555TJ3dNq+J5VrvQdr+OnagEwT3QRz5SqoP/r+AfuBt37H6gMiN9zH+R
 +yaQ==
X-Gm-Message-State: ACrzQf3MOgpDG6E06qNLo4BZmpTNnq+VgJFJUCdfWz7Mdwywjfn/1zaR
 tXyCrIVOhwALS0FtZH4LOLSkDHbsXs13Vh9ib+pkFVUNQILYNzumZlSaEMGSNRuvf4MoYopFQy8
 GUMyeXLdoaipfTgI2cFbtSeU7h/dAOfe5BQ3lldZqptMJU3I9hvt/UER4c+NVAQE+Tak=
X-Received: by 2002:a17:906:dacd:b0:780:a90c:e144 with SMTP id
 xi13-20020a170906dacd00b00780a90ce144mr2393174ejb.153.1666099953235; 
 Tue, 18 Oct 2022 06:32:33 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4b4EMhsLyxmzimHomtOeN+xTs4nR9UJLV+Wyt5tCDvz7CFhvB81D6MIWoC+3Md2/v9sQnaZQ==
X-Received: by 2002:a17:906:dacd:b0:780:a90c:e144 with SMTP id
 xi13-20020a170906dacd00b00780a90ce144mr2393152ejb.153.1666099952930; 
 Tue, 18 Oct 2022 06:32:32 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 e26-20020a056402149a00b0043bbb3535d6sm8887707edv.66.2022.10.18.06.32.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 06:32:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 33/53] target/i386: implement additional AVX comparison
 operators
Date: Tue, 18 Oct 2022 15:30:22 +0200
Message-Id: <20221018133042.856368-34-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221018133042.856368-1-pbonzini@redhat.com>
References: <20221018133042.856368-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

The new implementation of SSE will cover AVX from the get go, so include
the 24 extra comparison operators that are only available with the VEX
prefix.

Based on a patch by Paul Brook <paul@nowt.org>.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h        | 38 ++++++++++++++++++++++++++++++++++++
 target/i386/ops_sse_header.h | 27 +++++++++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 8bb7293975..18d217ebf5 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -1075,10 +1075,21 @@ void glue(helper_addsubpd, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
         }                                                                   \
     }
 
+static inline bool FPU_EQU(FloatRelation x)
+{
+    return (x == float_relation_equal || x == float_relation_unordered);
+}
+static inline bool FPU_GE(FloatRelation x)
+{
+    return (x == float_relation_equal || x == float_relation_greater);
+}
 #define FPU_EQ(x) (x == float_relation_equal)
 #define FPU_LT(x) (x == float_relation_less)
 #define FPU_LE(x) (x <= float_relation_equal)
+#define FPU_GT(x) (x == float_relation_greater)
 #define FPU_UNORD(x) (x == float_relation_unordered)
+/* We must make sure we evaluate the argument in case it is a signalling NAN */
+#define FPU_FALSE(x) (x == float_relation_equal && 0)
 
 #define FPU_CMPQ(size, a, b) \
     float ## size ## _compare_quiet(a, b, &env->sse_status)
@@ -1098,6 +1109,33 @@ SSE_HELPER_CMP(cmpnlt, FPU_CMPS, !FPU_LT)
 SSE_HELPER_CMP(cmpnle, FPU_CMPS, !FPU_LE)
 SSE_HELPER_CMP(cmpord, FPU_CMPQ, !FPU_UNORD)
 
+SSE_HELPER_CMP(cmpequ, FPU_CMPQ, FPU_EQU)
+SSE_HELPER_CMP(cmpnge, FPU_CMPS, !FPU_GE)
+SSE_HELPER_CMP(cmpngt, FPU_CMPS, !FPU_GT)
+SSE_HELPER_CMP(cmpfalse, FPU_CMPQ,  FPU_FALSE)
+SSE_HELPER_CMP(cmpnequ, FPU_CMPQ, !FPU_EQU)
+SSE_HELPER_CMP(cmpge, FPU_CMPS, FPU_GE)
+SSE_HELPER_CMP(cmpgt, FPU_CMPS, FPU_GT)
+SSE_HELPER_CMP(cmptrue, FPU_CMPQ,  !FPU_FALSE)
+
+SSE_HELPER_CMP(cmpeqs, FPU_CMPS, FPU_EQ)
+SSE_HELPER_CMP(cmpltq, FPU_CMPQ, FPU_LT)
+SSE_HELPER_CMP(cmpleq, FPU_CMPQ, FPU_LE)
+SSE_HELPER_CMP(cmpunords, FPU_CMPS,  FPU_UNORD)
+SSE_HELPER_CMP(cmpneqq, FPU_CMPS, !FPU_EQ)
+SSE_HELPER_CMP(cmpnltq, FPU_CMPQ, !FPU_LT)
+SSE_HELPER_CMP(cmpnleq, FPU_CMPQ, !FPU_LE)
+SSE_HELPER_CMP(cmpords, FPU_CMPS, !FPU_UNORD)
+
+SSE_HELPER_CMP(cmpequs, FPU_CMPS, FPU_EQU)
+SSE_HELPER_CMP(cmpngeq, FPU_CMPQ, !FPU_GE)
+SSE_HELPER_CMP(cmpngtq, FPU_CMPQ, !FPU_GT)
+SSE_HELPER_CMP(cmpfalses, FPU_CMPS,  FPU_FALSE)
+SSE_HELPER_CMP(cmpnequs, FPU_CMPS, !FPU_EQU)
+SSE_HELPER_CMP(cmpgeq, FPU_CMPQ, FPU_GE)
+SSE_HELPER_CMP(cmpgtq, FPU_CMPQ, FPU_GT)
+SSE_HELPER_CMP(cmptrues, FPU_CMPS,  !FPU_FALSE)
+
 #undef SSE_HELPER_CMP
 
 #if SHIFT == 1
diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
index 32ffa8445b..e7866a8395 100644
--- a/target/i386/ops_sse_header.h
+++ b/target/i386/ops_sse_header.h
@@ -237,6 +237,33 @@ SSE_HELPER_CMP(cmpnlt, FPU_CMPS, !FPU_LT)
 SSE_HELPER_CMP(cmpnle, FPU_CMPS, !FPU_LE)
 SSE_HELPER_CMP(cmpord, FPU_CMPQ, !FPU_UNORD)
 
+SSE_HELPER_CMP(cmpequ, FPU_CMPQ, FPU_EQU)
+SSE_HELPER_CMP(cmpnge, FPU_CMPS, !FPU_GE)
+SSE_HELPER_CMP(cmpngt, FPU_CMPS, !FPU_GT)
+SSE_HELPER_CMP(cmpfalse, FPU_CMPQ,  FPU_FALSE)
+SSE_HELPER_CMP(cmpnequ, FPU_CMPQ, !FPU_EQU)
+SSE_HELPER_CMP(cmpge, FPU_CMPS, FPU_GE)
+SSE_HELPER_CMP(cmpgt, FPU_CMPS, FPU_GT)
+SSE_HELPER_CMP(cmptrue, FPU_CMPQ,  !FPU_FALSE)
+
+SSE_HELPER_CMP(cmpeqs, FPU_CMPS, FPU_EQ)
+SSE_HELPER_CMP(cmpltq, FPU_CMPQ, FPU_LT)
+SSE_HELPER_CMP(cmpleq, FPU_CMPQ, FPU_LE)
+SSE_HELPER_CMP(cmpunords, FPU_CMPS,  FPU_UNORD)
+SSE_HELPER_CMP(cmpneqq, FPU_CMPS, !FPU_EQ)
+SSE_HELPER_CMP(cmpnltq, FPU_CMPQ, !FPU_LT)
+SSE_HELPER_CMP(cmpnleq, FPU_CMPQ, !FPU_LE)
+SSE_HELPER_CMP(cmpords, FPU_CMPS, !FPU_UNORD)
+
+SSE_HELPER_CMP(cmpequs, FPU_CMPS, FPU_EQU)
+SSE_HELPER_CMP(cmpngeq, FPU_CMPQ, !FPU_GE)
+SSE_HELPER_CMP(cmpngtq, FPU_CMPQ, !FPU_GT)
+SSE_HELPER_CMP(cmpfalses, FPU_CMPS,  FPU_FALSE)
+SSE_HELPER_CMP(cmpnequs, FPU_CMPS, !FPU_EQU)
+SSE_HELPER_CMP(cmpgeq, FPU_CMPQ, FPU_GE)
+SSE_HELPER_CMP(cmpgtq, FPU_CMPQ, FPU_GT)
+SSE_HELPER_CMP(cmptrues, FPU_CMPS,  !FPU_FALSE)
+
 #if SHIFT == 1
 DEF_HELPER_3(ucomiss, void, env, Reg, Reg)
 DEF_HELPER_3(comiss, void, env, Reg, Reg)
-- 
2.37.3


