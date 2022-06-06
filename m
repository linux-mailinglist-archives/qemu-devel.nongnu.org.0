Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0D553E520
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 16:45:09 +0200 (CEST)
Received: from localhost ([::1]:35700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyDye-0001tQ-8S
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 10:45:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDr5-0001wZ-Oy
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDqq-0000WE-8m
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654526215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KXRNumb0PKZ5F4F0yrvtrWIHLJU9qPmC5y9tpVx2nDY=;
 b=Gwjn27hHisb3uBckc8LD2fh1JusiNnGqxqxAa5jqPDbpyK610AIHUY1nHvaJEfPUa4ibLC
 0ApgSLyKoGl6DYcF/RRyGW91Swsn7fuQU27uth9PWtUTKU5rPuc4sqgvGeV1C7tYaxLDKT
 6qMcO68LogmpekiR9zR3bLLqGw/kw0U=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-478-klzLyr7QPXmetFj9S-g4Aw-1; Mon, 06 Jun 2022 10:36:54 -0400
X-MC-Unique: klzLyr7QPXmetFj9S-g4Aw-1
Received: by mail-wr1-f70.google.com with SMTP id
 m18-20020adff392000000b0021848a78a53so349687wro.19
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 07:36:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KXRNumb0PKZ5F4F0yrvtrWIHLJU9qPmC5y9tpVx2nDY=;
 b=V38MDZL2qn8ts7X38pZ2lJX6eLDyJBll2S19Z7NkaZ2iVaTl2IGuHPSQwF32Eui4hD
 x2LybnOJ+d6uE0ovnIGpHP3DI5Kkg8ZfIBnpNXL1VZV+Y9Yf2B6zJ4a0B4f+6PpZGbP2
 fUgyQmoRgWWsn3IJXP5AaWENiz/XTpvhn0ibulB+mRl50LBCQoWHAj5eo13LStUIT3I3
 oy47Z4/OxpGzeLQu5WuBFqS7VRbwphczY6eAuN/z+0NpF6u16EFwhn5uKb3Q3kNYwLG0
 nzAwvVATqknW5gD9KDusy2OmkmWUUCB5OSMkfEK0SPYn/jWWZeUF+R5X313q1Wm5w9qS
 ol+Q==
X-Gm-Message-State: AOAM5335Q/koAmmPkcF8CKBJPK2veOm6JcXuTJemX6GR6vkXq9J+/hSE
 WoZbfGXB+dFLzcjrXWCpFe7nc0xVzWkb1nwfnmPRkiPT34f2lYB53HTnhZ4kqIsqKGDGvEdKqsA
 yNmr/5UEFLvxZd4p5wkkHSZAWgU7Pi5AhVF/WSU/gZz3cTksqLW0yNJa4CpMlNg8Z4vQ=
X-Received: by 2002:a5d:62c7:0:b0:216:fa41:2f81 with SMTP id
 o7-20020a5d62c7000000b00216fa412f81mr10006603wrv.249.1654526212202; 
 Mon, 06 Jun 2022 07:36:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTxARHUTbfpSvwoyk/WeBgrZltKzSHeERSGpawBpcOKiL2ZvYhhz37H4IwfLhvpa1qAbmdyw==
X-Received: by 2002:a5d:62c7:0:b0:216:fa41:2f81 with SMTP id
 o7-20020a5d62c7000000b00216fa412f81mr10006566wrv.249.1654526211914; 
 Mon, 06 Jun 2022 07:36:51 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 q15-20020adff50f000000b002102e6b757csm18153474wro.90.2022.06.06.07.36.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 07:36:51 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Yang Zhong <yang.zhong@intel.com>
Subject: [PULL 03/29] target/i386: Fix wrong count setting
Date: Mon,  6 Jun 2022 16:36:18 +0200
Message-Id: <20220606143644.1151112-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220606143644.1151112-1-pbonzini@redhat.com>
References: <20220606143644.1151112-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Yang Zhong <yang.zhong@intel.com>

The previous patch used wrong count setting with index value, which got wrong
value from CPUID(EAX=12,ECX=0):EAX. So the SGX1 instruction can't be exposed
to VM and the SGX decice can't work in VM.

Fixes: d19d6ffa0710 ("target/i386: introduce helper to access supported CPUID")

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20220530131834.1222801-1-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index bb6a5dd498..9fdfec9d8b 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5559,7 +5559,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
          * supports.  Features can be further restricted by userspace, but not
          * made more permissive.
          */
-        x86_cpu_get_supported_cpuid(0x12, index, eax, ebx, ecx, edx);
+        x86_cpu_get_supported_cpuid(0x12, count, eax, ebx, ecx, edx);
 
         if (count == 0) {
             *eax &= env->features[FEAT_SGX_12_0_EAX];
-- 
2.36.1



