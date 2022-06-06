Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C5E53E528
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 16:50:49 +0200 (CEST)
Received: from localhost ([::1]:45648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyE48-0000PQ-5R
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 10:50:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDr7-00025V-Qj
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDr4-0000Vc-K2
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654526211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VzF8PA6ek1MoUJLhlubB3deg/aUiCd4KpJOKWHcRyfQ=;
 b=TszokRNq9gnCnDih+Xf5PhQgTqwUoGYVeOufST+PSfntXImH2aKoGcjyUillJHkUwyC68O
 2svp9dJzrdg8wHqazd+gr1LcDj3aCJyrt3aq62gN187u/XsaKXPunrMdkBMMG1v3mOFcN7
 qlN5M+qcxFQbbScW6ySposr4dZMUsQI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-421-CMVnazMLOHePnDuMYdmhMQ-1; Mon, 06 Jun 2022 10:36:50 -0400
X-MC-Unique: CMVnazMLOHePnDuMYdmhMQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 p24-20020a05600c1d9800b0039c51c2da19so760380wms.0
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 07:36:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VzF8PA6ek1MoUJLhlubB3deg/aUiCd4KpJOKWHcRyfQ=;
 b=EzT42bdEQ6x1T/mBZgoUXPXpt57Uu0TIOxYrG1nWbyN2mk/7L82cJ/BGsx2fAxwir2
 dioLhd8rKXhvtdGqFxxMJItyFe2SzxdVLrJJkL+xWK9tQg42yl/1/I5yQeWS90fI/vby
 8lXD8nvrQuXalUORdOyfQ3zQP+ysGk4NHZ1lBOL0S409fLMY2q5RS+k27LgrW3lvqb/B
 cuGHG/1i+DVtXLXsOF2YFyohmtthCLkUq5sMy03V1hK84OxwbEyhVWtXmz2TJ7RuLjID
 TBr0XZTxv+DWcHdfQsh2SEu2CpBkWd/4+BkwozO8frS0JOEdIbgwaGPK2WQuaxyWypid
 cX6g==
X-Gm-Message-State: AOAM531vYTrVtu/M/PgyadQDrbgR4EWrwi1Q/F2DbJIx7Fw32bVwxDp2
 799PJDO1ndzmsI5DcoRBECR0iaD01nNxASWJJghN+2Zzt5G5G4UTPCwlCe1RqFQxuMU68zKN2zv
 gvs+flzItdEHVHBPxeyCh9wnlPLq+nEZZcKiIpQnUhtvTfDLfLHuEEx8ff3uyuYwLZ84=
X-Received: by 2002:a5d:47c1:0:b0:217:1bfc:56c2 with SMTP id
 o1-20020a5d47c1000000b002171bfc56c2mr9179980wrc.336.1654526208290; 
 Mon, 06 Jun 2022 07:36:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzv9/cGwHN2A+ficzzDjm0CXYh8OesQAaD5UB6hoHSCv47nJxhKHWjl9HeXyIDp8T4FgUETxQ==
X-Received: by 2002:a5d:47c1:0:b0:217:1bfc:56c2 with SMTP id
 o1-20020a5d47c1000000b002171bfc56c2mr9179949wrc.336.1654526207953; 
 Mon, 06 Jun 2022 07:36:47 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 c7-20020a05600c0a4700b003973c54bd69sm25016268wmq.1.2022.06.06.07.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 07:36:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stephen Michael Jothen <sjothen@gmail.com>
Subject: [PULL 01/29] target/i386/tcg: Fix masking of real-mode addresses with
 A20 bit
Date: Mon,  6 Jun 2022 16:36:16 +0200
Message-Id: <20220606143644.1151112-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220606143644.1151112-1-pbonzini@redhat.com>
References: <20220606143644.1151112-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

From: Stephen Michael Jothen <sjothen@gmail.com>

The correct A20 masking is done if paging is enabled (protected mode) but it
seems to have been forgotten in real mode. For example from the AMD64 APM Vol. 2
section 1.2.4:

> If the sum of the segment base and effective address carries over into bit 20,
> that bit can be optionally truncated to mimic the 20-bit address wrapping of the
> 8086 processor by using the A20M# input signal to mask the A20 address bit.

Most BIOSes will enable the A20 line on boot, but I found by disabling the A20 line
afterwards, the correct wrapping wasn't taking place.

`handle_mmu_fault' in target/i386/tcg/sysemu/excp_helper.c seems to be the culprit.
In real mode, it fills the TLB with the raw unmasked address. However, for the
protected mode, the `mmu_translate' function does the correct A20 masking.

The fix then should be to just apply the A20 mask in the first branch of the if
statement.

Signed-off-by: Stephen Michael Jothen <sjothen@gmail.com>
Message-Id: <Yo5MUMSz80jXtvt9@air-old.local>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/sysemu/excp_helper.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index e1b6d88683..48feba7e75 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -359,6 +359,7 @@ static int handle_mmu_fault(CPUState *cs, vaddr addr, int size,
     CPUX86State *env = &cpu->env;
     int error_code = PG_ERROR_OK;
     int pg_mode, prot, page_size;
+    int32_t a20_mask;
     hwaddr paddr;
     hwaddr vaddr;
 
@@ -368,7 +369,8 @@ static int handle_mmu_fault(CPUState *cs, vaddr addr, int size,
 #endif
 
     if (!(env->cr[0] & CR0_PG_MASK)) {
-        paddr = addr;
+        a20_mask = x86_get_a20_mask(env);
+        paddr = addr & a20_mask;
 #ifdef TARGET_X86_64
         if (!(env->hflags & HF_LMA_MASK)) {
             /* Without long mode we can only address 32bits in real mode */
-- 
2.36.1



