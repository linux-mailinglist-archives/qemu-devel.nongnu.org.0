Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D89E3585213
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 17:07:47 +0200 (CEST)
Received: from localhost ([::1]:37880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHRac-0007n3-PQ
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 11:07:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oHRXo-0003cx-Sg
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 11:04:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oHRXk-0005WQ-UU
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 11:04:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659107087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y9jTGz6yycUqlvdaKmP8LetyYM6boIaRuNVp7IEHQfM=;
 b=CsC/xvxexhQbF0mJSYzoiA30eoM66QwCSH6tdQN6SgQw3ksbuXUiKAnVZh76X7NG+f5VXG
 5fIF1OJ9d3G9qH1H297vaVW1LbLhST7j64qhKnZLfFNi2lLl95UHKBWfK1YxtVCOxLFnK7
 VFLQBjNs7e5P3wxt4Wiiax6uy6SAzSw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-58-jYTcdJ0nO2-ay0GUGeLHrA-1; Fri, 29 Jul 2022 11:04:46 -0400
X-MC-Unique: jYTcdJ0nO2-ay0GUGeLHrA-1
Received: by mail-ed1-f71.google.com with SMTP id
 h15-20020a056402280f00b0043bd8412fe0so3097289ede.16
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 08:04:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y9jTGz6yycUqlvdaKmP8LetyYM6boIaRuNVp7IEHQfM=;
 b=MInU204ivvDftirRd28lh+y0Wz1HwB6q3zJ16O8l8b9XgNwscgAw/3tqnJfSfMfLrF
 VgCIP3iP6YETh+A9LyvSVQOMsLxHNMlcrEvzDjCJlVkQz2sFDwnUWBlxaqHY0nksAseT
 TMeZmdISsfTGHNnDUYxNOoxGOKTBHxbhT0bFXnq5qISh1qyO6Vhq6QSqyS0CXJp/N56q
 ZTyClvyS8TC8aFr9TIA7Z0hlT0XRi2d+z+jldkoaYvrBo4R5xsicdCYcEWFAIx6v/pIb
 LvuNsTzsmqc1NX2pdVEZtmJbjgvCd1POngQMqjZlxa3zSAeDyOLznVYLARVMwkrdOvxG
 VGeA==
X-Gm-Message-State: AJIora+O19MUULrhxkO9ioqhhzR6olpoXEKO5+JPt/kGQX8zRm22oGAe
 aeqYhqRdZF3gAu7cS587APpNBIfh1GUlqeNdn+prgyENywulhkcTWte++VQ5ZSYAcZlRqKt3UR7
 V9sXcUPPJ7PHIm5ra5lmSd+V+cmBNR/bZ/mnpSpYFiOQlmVi80ReAi7r9dpR50oAErHU=
X-Received: by 2002:a05:6402:348f:b0:43c:2919:cfb5 with SMTP id
 v15-20020a056402348f00b0043c2919cfb5mr3919113edc.326.1659107084983; 
 Fri, 29 Jul 2022 08:04:44 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sMtoLcMgY1uS8qqJ7PSO+4SCI7OdFvpQ+DTvcxZapp249wgSwzU/7/Om+5aCZMI5zT0CCfDA==
X-Received: by 2002:a05:6402:348f:b0:43c:2919:cfb5 with SMTP id
 v15-20020a056402348f00b0043c2919cfb5mr3919070edc.326.1659107084505; 
 Fri, 29 Jul 2022 08:04:44 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 c10-20020a17090618aa00b00704fa2748ffsm5261ejf.99.2022.07.29.08.04.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 08:04:43 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Korneliusz Osmenda <korneliuszo@gmail.com>
Subject: [PULL 2/6] vga: fix incorrect line height in 640x200x2 mode
Date: Fri, 29 Jul 2022 17:04:34 +0200
Message-Id: <20220729150438.20293-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220729150438.20293-1-pbonzini@redhat.com>
References: <20220729150438.20293-1-pbonzini@redhat.com>
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

When in CGA modes, QEMU wants to ignore the maximum scan field (bits 0..4) of
the maximum scan length register in the CRTC.  It is not clear why this is
needed---for example, Bochs ignores bit 7 instead.  The issue is that the
CGA modes are not detected correctly, and in particular mode 6 results in
multi_scan==3 according to how SeaBIOS programs it.  The right way to check
for CGA graphics modes is to check whether bit 13 of the address is special
cased by the CRT controller to achieve line interleaving, i.e. whether bit 0
of the CRTC mode control register is clear.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1020
Reported-by: Korneliusz Osmenda <korneliuszo@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/display/vga.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/display/vga.c b/hw/display/vga.c
index 5dca2d1528..50ecb1ad02 100644
--- a/hw/display/vga.c
+++ b/hw/display/vga.c
@@ -1514,9 +1514,10 @@ static void vga_draw_graphic(VGACommonState *s, int full_update)
         force_shadow = true;
     }
 
+    /* bits 5-6: 0 = 16-color mode, 1 = 4-color mode, 2 = 256-color mode.  */
     shift_control = (s->gr[VGA_GFX_MODE] >> 5) & 3;
     double_scan = (s->cr[VGA_CRTC_MAX_SCAN] >> 7);
-    if (shift_control != 1) {
+    if (s->cr[VGA_CRTC_MODE] & 1) {
         multi_scan = (((s->cr[VGA_CRTC_MAX_SCAN] & 0x1f) + 1) << double_scan)
             - 1;
     } else {
-- 
2.36.1



