Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E73D6161EC
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 12:44:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqC8T-0005Hv-IT; Wed, 02 Nov 2022 07:42:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqC7v-00059V-Ek
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 07:41:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqC7t-0005Nw-My
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 07:41:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667389305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Au5lB1o4PdSr952SmEZ4IrudR5JlexcK/wWief35hc=;
 b=RCTt4PthLM926DujS36e7eTUMYeTVInjnho0G5k7yNrXxbCx2zTl/u0VfX2vQJfyWNrLS8
 03k/oKAX5lZIFm6Tgl3FI3fLA9NtNc9cXgOViqlZhFhMSRAaKlwZ6M33mVFN0evUBjGFrN
 5cK/y9mtY+BP6xxlUwSxLnq6aQLLCrM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-643-qZJJmnHNNHaMWehVzH8Kzg-1; Wed, 02 Nov 2022 07:41:43 -0400
X-MC-Unique: qZJJmnHNNHaMWehVzH8Kzg-1
Received: by mail-ed1-f72.google.com with SMTP id
 w4-20020a05640234c400b004631f8923baso6817570edc.5
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 04:41:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7Au5lB1o4PdSr952SmEZ4IrudR5JlexcK/wWief35hc=;
 b=zZogmpgEN4txnQpMDLzs5RyCtyeyHwCmV8CTJrYfZiVyMaBHSRZCIijMYhIHMNnecC
 tvKa9htysur7GKm7CJuDmSqF7aT69FZMvncow09MENyvOE99623BW44r3VR06tzHWrZl
 bJ8KmHtvuOcYuv201Gxw/FWJpmwPP+EAlN4SqkjLg7MHk/SqzKjXCyLMMVw2TyEU7QSo
 fOJIwTuIIv4xL1iNfuy6PGaTI/LZHCdtm69ROSoWQyElJwalpp50KxEICfLAlKywQnjD
 ery1YAa/yLAFUy6W38law+ohp6UUpxfZj2zDzBixvOdI38j5HL0ZzOqcYJ9+q/icPPox
 KlvA==
X-Gm-Message-State: ACrzQf1+Vt8l64gDvtjJYEIVrIFdXLXMLQjEg+ma5vlDqbxJ+k3E6Xhb
 bouYTIhYej6gK3yFQGrPSB6YY7JUrfNqy8h0LdzoMGzNFpnuy4hdNBGM25+MRt+zT4GKYkAyPCK
 lzsW61IUF4G0n7Xm0j6Vno92adVLV3/q3Amn3kgeXE+m695V8RXj1qG3qErSQzgQeoxE=
X-Received: by 2002:a50:cc07:0:b0:453:4427:a918 with SMTP id
 m7-20020a50cc07000000b004534427a918mr24222228edi.121.1667389302080; 
 Wed, 02 Nov 2022 04:41:42 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7MQZwE9mU7Va1DAgmRgQ5CzfF5WctnQM+h98g1Jw9GCHdK/ys9ztbNIrxObWs/3lMT1Ih+rg==
X-Received: by 2002:a50:cc07:0:b0:453:4427:a918 with SMTP id
 m7-20020a50cc07000000b004534427a918mr24222207edi.121.1667389301807; 
 Wed, 02 Nov 2022 04:41:41 -0700 (PDT)
Received: from avogadro.local ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a170906118b00b0078116c361d9sm5384039eja.10.2022.11.02.04.41.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 04:41:41 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Andreas Gustafsson <gson@gson.org>
Subject: [PULL 5/5] target/i386: Fix test for paging enabled
Date: Wed,  2 Nov 2022 12:41:25 +0100
Message-Id: <20221102114125.58902-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221102114125.58902-1-pbonzini@redhat.com>
References: <20221102114125.58902-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

If CR0.PG is unset, pg_mode will be zero, but it will also be zero
for non-PAE/non-PSE page tables with CR0.WP=0.  Restore the
correct test for paging enabled.

Fixes: 98281984a37 ("target/i386: Add MMU_PHYS_IDX and MMU_NESTED_IDX")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1269
Reported-by: Andreas Gustafsson <gson@gson.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221102091232.1092552-1-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/sysemu/excp_helper.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index d51b5d7431a0..405a5d414a14 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -553,12 +553,12 @@ static bool get_physical_address(CPUX86State *env, vaddr addr,
         break;
 
     default:
-        in.cr3 = env->cr[3];
-        in.mmu_idx = mmu_idx;
-        in.ptw_idx = use_stage2 ? MMU_NESTED_IDX : MMU_PHYS_IDX;
-        in.pg_mode = get_pg_mode(env);
+        if (likely(env->cr[0] & CR0_PG_MASK)) {
+            in.cr3 = env->cr[3];
+            in.mmu_idx = mmu_idx;
+            in.ptw_idx = use_stage2 ? MMU_NESTED_IDX : MMU_PHYS_IDX;
+            in.pg_mode = get_pg_mode(env);
 
-        if (likely(in.pg_mode)) {
             if (in.pg_mode & PG_MODE_LMA) {
                 /* test virtual address sign extension */
                 int shift = in.pg_mode & PG_MODE_LA57 ? 56 : 47;
-- 
2.38.1


