Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EC766471C
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 18:16:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFH66-0003F7-28; Tue, 10 Jan 2023 11:03:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH5R-0002tE-5X
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:02:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH5O-0004z5-QP
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:02:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673366569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mhbP2nj+YKePeUN8E3Nxb3/GqgA/LcoW7bGgdJgbHSo=;
 b=S2//HngReDgHFqDNQ7Ytcn/k/ZpzaG7VZuGosHiV3zXCJqd/zAHkWQkXTVRuO6a5R9Q7Ju
 zWv8SGRoeaCNtrzegKCobiEYT9PNbBaV1OXOpaiuDmGADq+QnJJ3uImw4XU1e/pMzJFcUZ
 IT8nsshZbWR+7OzAJwL5DsrnWMeGKpQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-86-auZl4dVpMEiAp77DKun4oA-1; Tue, 10 Jan 2023 11:02:48 -0500
X-MC-Unique: auZl4dVpMEiAp77DKun4oA-1
Received: by mail-wr1-f72.google.com with SMTP id
 j18-20020adfb312000000b00293def622d1so2129571wrd.17
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:02:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mhbP2nj+YKePeUN8E3Nxb3/GqgA/LcoW7bGgdJgbHSo=;
 b=BxkUp2zq3W5JleHAht2WFZRm19LmmWf/hgKEoxz4VcUGJduhitVA6tzMGgKHT17dc6
 rXdVkx5IAw82sKnhIru0BbGPARrr6CpAHGdly+w0KzGLLBA+I79xD1MXEZiXxayRlBnP
 2EOM4+WxFjmgC5CgjWOVNKC2H1X+Geym4BSTajiaPkFq7EQSIjSuUbUsmZgKaSvKAJXW
 g0h4HmY426R3CR6hmBYmVL/eYDHLzsqyx6YjtbRHWyWEiyrc7kr1JeC+6ksyp869Pb9s
 0UCP96o9F18DWoO9k7kYTv2q92RdMBu+r/cxJScFxsv0boegn6C022ovAMufCpELl5e7
 /hzA==
X-Gm-Message-State: AFqh2ko1EQkEnqoaOUL7WSoOq1KQfI9G0SJsT5x58TIF6bYBXFFGFik+
 ibwPOBCsVDFBLFnPz2Iw+gfu879Can7ERjM1CdlWT9PO4HKM/gnHU/hT0bHCRAwKgEcFsPq7wWZ
 EJ08Jkj+WNwACJbrwgJ9N5CldBf5ZZsbiV55+9yEUolwEnbPGp+IlvGmulHU68liMbjA=
X-Received: by 2002:a05:600c:d2:b0:3d2:2b70:f2fd with SMTP id
 u18-20020a05600c00d200b003d22b70f2fdmr50712889wmm.21.1673366561438; 
 Tue, 10 Jan 2023 08:02:41 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs1Qm7IV2fkSKJ6GQOgqAwKmMYdw0G72qFACCTrGwTB2jV6B5Rr8V/ajroOVLR1lPAmq/m9ng==
X-Received: by 2002:a05:600c:d2:b0:3d2:2b70:f2fd with SMTP id
 u18-20020a05600c00d200b003d22b70f2fdmr50712855wmm.21.1673366561082; 
 Tue, 10 Jan 2023 08:02:41 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 2-20020a05600c020200b003d9ef8ad6b2sm7411398wmi.13.2023.01.10.08.02.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 08:02:40 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Joe Richey <joerichey@google.com>
Subject: [PULL 02/29] i386: Emit correct error code for 64-bit IDT entry
Date: Tue, 10 Jan 2023 17:02:06 +0100
Message-Id: <20230110160233.339771-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110160233.339771-1-pbonzini@redhat.com>
References: <20230110160233.339771-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Joe Richey <joerichey@google.com>

When in 64-bit mode, IDT entiries are 16 bytes, so `intno * 16` is used
for base/limit/offset calculations. However, even in 64-bit mode, the
exception error code still uses bits [3,16) for the invlaid interrupt
index.

This means the error code should still be `intno * 8 + 2` even in 64-bit
mode.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1382
Signed-off-by: Joe Richey <joerichey@google.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/seg_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c
index 539189b4d184..03b58e94a2d4 100644
--- a/target/i386/tcg/seg_helper.c
+++ b/target/i386/tcg/seg_helper.c
@@ -882,7 +882,7 @@ static void do_interrupt64(CPUX86State *env, int intno, int is_int,
 
     dt = &env->idt;
     if (intno * 16 + 15 > dt->limit) {
-        raise_exception_err(env, EXCP0D_GPF, intno * 16 + 2);
+        raise_exception_err(env, EXCP0D_GPF, intno * 8 + 2);
     }
     ptr = dt->base + intno * 16;
     e1 = cpu_ldl_kernel(env, ptr);
@@ -895,18 +895,18 @@ static void do_interrupt64(CPUX86State *env, int intno, int is_int,
     case 15: /* 386 trap gate */
         break;
     default:
-        raise_exception_err(env, EXCP0D_GPF, intno * 16 + 2);
+        raise_exception_err(env, EXCP0D_GPF, intno * 8 + 2);
         break;
     }
     dpl = (e2 >> DESC_DPL_SHIFT) & 3;
     cpl = env->hflags & HF_CPL_MASK;
     /* check privilege if software int */
     if (is_int && dpl < cpl) {
-        raise_exception_err(env, EXCP0D_GPF, intno * 16 + 2);
+        raise_exception_err(env, EXCP0D_GPF, intno * 8 + 2);
     }
     /* check valid bit */
     if (!(e2 & DESC_P_MASK)) {
-        raise_exception_err(env, EXCP0B_NOSEG, intno * 16 + 2);
+        raise_exception_err(env, EXCP0B_NOSEG, intno * 8 + 2);
     }
     selector = e1 >> 16;
     offset = ((target_ulong)e3 << 32) | (e2 & 0xffff0000) | (e1 & 0x0000ffff);
-- 
2.38.1


