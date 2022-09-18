Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB675BBC4B
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 09:22:29 +0200 (CEST)
Received: from localhost ([::1]:58466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZodI-0004tG-GI
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 03:22:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oZoZL-0002uy-BU
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 03:18:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oZoZH-0002FU-E6
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 03:18:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663485497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DCfeDcg7stRxSdw0AePAnW4YvAKF+QFscneJiFL2iUo=;
 b=huASXJj8f5Yj019l0u3CgvXQ1K6TiZS6cKVRbA0AGn5LHscVradJEGoUWRmNKar4CqaElW
 Uj35JpJXuIW+55xQLa/mpqvJE9qUe367/eD8pTSp1FBR3G9+yEwPoAJcXYkOzf5EIPlS1R
 GFkV7oiP1UXdcg5boevpw1+miys1GJ8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-664-tuUfFeeENlm5Ep9CM7DlrQ-1; Sun, 18 Sep 2022 03:18:15 -0400
X-MC-Unique: tuUfFeeENlm5Ep9CM7DlrQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 h133-20020a1c218b000000b003b3263d477eso13528716wmh.8
 for <qemu-devel@nongnu.org>; Sun, 18 Sep 2022 00:18:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=DCfeDcg7stRxSdw0AePAnW4YvAKF+QFscneJiFL2iUo=;
 b=DqbeeY11Zr3gt4PNkK0Qu+t0XHDu3LquB1BSacxewzWBBJL6b3jjajeS6R0YhYgQ/P
 ILeN5GMIVeAj9IbJHDUpSMoGoP3kwxLUFTIhkBgrOC25YHELaAWFhsU84SCPckxkn/Yh
 N5HFjaRlpmlm14n883RvRUrPrmvtZyg3y3d5+/H0eYYxrZ8ay7+vBgi0eu2T0zfBJDxj
 07kcTELEC8O/Pjeywy3W2HefZQYKHSr0txwICdmKSICFFo/+zzeWqfmjLXZICkJeKPl6
 hZiw3RJ5n9EpS73ms7iWlfP9ctVVAJhHgUxzPYIaAVHWBhWlc8MbPuMPDCCmW7Aimrzw
 Gvag==
X-Gm-Message-State: ACrzQf3TmDNzTOa9sx3EV5fMnLQ1BtKIUiNk+g0M9cBHp3Jh0IupjB1f
 EFWURANsiaHBThRlUzaHY1Dyd0NmuATXeun715NuDIrDlvxn7sk7F8bo4IOk9YpJ9QWGcJTlTD1
 8eAm+TRyrWhF9B+rrIW12Qo6AuP78eQVPdqFuxnhlwOdTbmANYsnKBi82UPgkD5clxkk=
X-Received: by 2002:a05:600c:19cc:b0:3b4:b15a:7df with SMTP id
 u12-20020a05600c19cc00b003b4b15a07dfmr8625820wmq.185.1663485493781; 
 Sun, 18 Sep 2022 00:18:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7JW3HVaHGIEw5ZUhTwG9Wuebbo2MNJK4uN7boV9F3rUZharCR7Fid713y5ClR/A/WA3+IpnQ==
X-Received: by 2002:a05:600c:19cc:b0:3b4:b15a:7df with SMTP id
 u12-20020a05600c19cc00b003b4b15a07dfmr8625804wmq.185.1663485493419; 
 Sun, 18 Sep 2022 00:18:13 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a05600c358500b003a608d69a64sm9132012wmq.21.2022.09.18.00.18.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Sep 2022 00:18:12 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/i386: correctly mask SSE4a bit indices in register
 operands
Date: Sun, 18 Sep 2022 09:18:07 +0200
Message-Id: <20220918071807.539664-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
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

SSE4a instructions EXTRQ and INSERTQ have two bit index operands, that can be
immediates or taken from an XMM register.  In both cases, the fields are
6-bit wide and the top two bits in the byte are ignored.  translate.c is
doing that correctly for the immediate case, but not for the XMM case, so
fix it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index c0766de18d..3504bca36a 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -926,7 +926,7 @@ static inline uint64_t helper_extrq(uint64_t src, int shift, int len)
 
 void helper_extrq_r(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
-    d->ZMM_Q(0) = helper_extrq(d->ZMM_Q(0), s->ZMM_B(1), s->ZMM_B(0));
+    d->ZMM_Q(0) = helper_extrq(d->ZMM_Q(0), s->ZMM_B(1) & 63, s->ZMM_B(0) & 63);
 }
 
 void helper_extrq_i(CPUX86State *env, ZMMReg *d, int index, int length)
@@ -948,7 +948,7 @@ static inline uint64_t helper_insertq(uint64_t src, int shift, int len)
 
 void helper_insertq_r(CPUX86State *env, ZMMReg *d, ZMMReg *s)
 {
-    d->ZMM_Q(0) = helper_insertq(s->ZMM_Q(0), s->ZMM_B(9), s->ZMM_B(8));
+    d->ZMM_Q(0) = helper_insertq(s->ZMM_Q(0), s->ZMM_B(9) & 63, s->ZMM_B(8) & 63);
 }
 
 void helper_insertq_i(CPUX86State *env, ZMMReg *d, int index, int length)
-- 
2.37.2


