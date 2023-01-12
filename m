Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 455BE66737A
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 14:45:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFxsD-0006Rj-Df; Thu, 12 Jan 2023 08:44:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFxsB-0006R8-9R
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 08:44:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFxs9-0001vD-Rj
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 08:44:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673531041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0zaXQ1zmFZ+FiHm9A+AC4bH9nqt/NvyBj1vpIFNPA/U=;
 b=O2IsO8uFKqO5Uxj/PNl2yESK4DKJWx3Y1c27nhEQXtDOPGOC23JpIUSOEbcasitnPC16fe
 DNyABARkdZPSV3rI1wzuU+rkQxhiVr2iMHsP7o0it5uK0bO5WJzrEddh8JtJJfWmqjgMR3
 DZ2Oboo1FPytKOZiXKEw/Ww14lfUL2k=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-460-8mYrPH7xNuOVt6KHF_Erww-1; Thu, 12 Jan 2023 08:44:00 -0500
X-MC-Unique: 8mYrPH7xNuOVt6KHF_Erww-1
Received: by mail-ed1-f70.google.com with SMTP id
 s13-20020a056402520d00b0046c78433b54so12324934edd.16
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 05:43:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0zaXQ1zmFZ+FiHm9A+AC4bH9nqt/NvyBj1vpIFNPA/U=;
 b=6WyX/VQbxQ8GGFjxUaA3KwczlN9GTcDxqmvruN9zcIVqwdbx/YeHEGMfjuo55+aE9x
 Tq6D9ivbet/SnQjzzwLvvUHemFT45qh+dvUmBl4PGFZb/3DTWdztIRds+w7HbkJ+6M7B
 70cYCX4dG2dItp7PFlB8XBtsozBtUnZGX9kiyE1LNyRtuEAid3KXdSbmcRT2IAMwidSa
 GItDC8iG0cHogKwbBf+0bePxbxL4dMH35v76++yPw4KgLXElUt5Un6Zoo2oaV7BPCaCp
 lA1ia+ExcVXz6IEYpKwnI+yHNiVuv+WGU8i2kWgDQ3Jw3LaWPx7wsp/7nwt5ZI+wtQeZ
 zohQ==
X-Gm-Message-State: AFqh2krTWGeWMIZCsqXQ2JdY8PZ0TegOVKex41ct3iUlcAc8L32t69wY
 GWC/iVlFB9HnLia6i2stsbUerRms9SF4Z9R/yefv+Y2VJdi8JUv8632kHmnCfc05Hw10FB4sCYt
 4471ULmmNnQksLtx2A0kAxUTcpWoUhAL3IAEIWYgp/EGIVbxxnogsAZbwwMTCdPpxHEQ=
X-Received: by 2002:a17:907:c303:b0:84d:2025:850a with SMTP id
 tl3-20020a170907c30300b0084d2025850amr21372400ejc.68.1673531037780; 
 Thu, 12 Jan 2023 05:43:57 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvj0kroJaRVk4laKVwbMSdCxEEsBtT+SFZZfMOAKD4RehXmWP4K0E36V9zpbtAcUA40gsSL/w==
X-Received: by 2002:a17:907:c303:b0:84d:2025:850a with SMTP id
 tl3-20020a170907c30300b0084d2025850amr21372378ejc.68.1673531037419; 
 Thu, 12 Jan 2023 05:43:57 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:4783:a68:c1ee:15c5])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a50fa85000000b00491c819d6d2sm7185753edr.44.2023.01.12.05.43.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 05:43:56 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>
Subject: [PULL v2 06/29] target/i386: Remove compilation errors when
 -Werror=maybe-uninitialized
Date: Thu, 12 Jan 2023 14:43:49 +0100
Message-Id: <20230112134350.469317-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230112134350.469317-1-pbonzini@redhat.com>
References: <20230112134350.469317-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
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

From: Eric Auger <eric.auger@redhat.com>

To avoid compilation errors when -Werror=maybe-uninitialized is used,
add a default case with g_assert_not_reached().

Otherwise with GCC 11.3.1 "cc (GCC) 11.3.1 20220421 (Red Hat 11.3.1-2)"
we get:

../target/i386/ops_sse.h: In function ‘helper_vpermdq_ymm’:
../target/i386/ops_sse.h:2495:13: error: ‘r3’ may be used
uninitialized in this function [-Werror=maybe-uninitialized]
     2495 |     d->Q(3) = r3;
          |     ~~~~~~~~^~~~
../target/i386/ops_sse.h:2494:13: error: ‘r2’ may be used
uninitialized in this function [-Werror=maybe-uninitialized]
     2494 |     d->Q(2) = r2;
          |     ~~~~~~~~^~~~
../target/i386/ops_sse.h:2493:13: error: ‘r1’ may be used
uninitialized in this function [-Werror=maybe-uninitialized]
     2493 |     d->Q(1) = r1;
          |     ~~~~~~~~^~~~
../target/i386/ops_sse.h:2492:13: error: ‘r0’ may be used
uninitialized in this function [-Werror=maybe-uninitialized]
     2492 |     d->Q(0) = r0;
          |     ~~~~~~~~^~~~

Signed-off-by: Eric Auger <eric.auger@redhat.com>

Message-Id: <20221222140158.1260748-1-eric.auger@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 3cbc36a59d1a..0bd6bfad8a17 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -2470,6 +2470,8 @@ void helper_vpermdq_ymm(Reg *d, Reg *v, Reg *s, uint32_t order)
         r0 = s->Q(2);
         r1 = s->Q(3);
         break;
+    default: /* default case added to help the compiler to avoid warnings */
+        g_assert_not_reached();
     }
     switch ((order >> 4) & 3) {
     case 0:
@@ -2488,6 +2490,8 @@ void helper_vpermdq_ymm(Reg *d, Reg *v, Reg *s, uint32_t order)
         r2 = s->Q(2);
         r3 = s->Q(3);
         break;
+    default: /* default case added to help the compiler to avoid warnings */
+        g_assert_not_reached();
     }
     d->Q(0) = r0;
     d->Q(1) = r1;
-- 
2.38.1


