Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AF6574891
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 11:22:46 +0200 (CEST)
Received: from localhost ([::1]:51928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBv3V-000332-2i
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 05:22:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBukG-0005MX-0M
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:02:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBukD-000626-EQ
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:02:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657789368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JedoTWOXY7JNxUVgoEPO4DDMHQfmV7WNJPWNZj4qG/4=;
 b=McDqOU8yNJziwPhxeygHX3r0CE4hG4myZh6fE7Lkp4EeSTYx2+jL8xIVGY+vx9IeJOQfIv
 582xHGbqQx0tCOWOIyUg/cL+gzgTgHBxAaTRCOgE6KE7R2dL8ha1UvWlikeEdGsUlUlOPB
 0H842k5hageG1YZEkNKBJzYwFkdi040=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-307-K-VKX6hjOKymSJdHWe2HCQ-1; Thu, 14 Jul 2022 05:02:47 -0400
X-MC-Unique: K-VKX6hjOKymSJdHWe2HCQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 s4-20020a170906500400b006feaccb3a0eso508452ejj.11
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 02:02:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JedoTWOXY7JNxUVgoEPO4DDMHQfmV7WNJPWNZj4qG/4=;
 b=XJ0TeZa5n6uQiaLpwpJ5JYsXJrZ7Em8fYN7qxnjAene7fWDdVpE90TwHnUnnt92T9m
 miVFABpWWPyX/WcMMybXBuAhLueMwFP7mxH9CXjo6FwHz/8CKL8dcBsulR402ykktMw3
 jSzt3w0h7UR9fStLPHGUVgR3oGeF9sX9+m8K+CT1Z3qpSEdHPb988xZlY5Wy1j5+vOBG
 06pzYJFJfsvVkbnDoJT2fjeF2vwZCNCL/mfz1gIasJRKHF47i/r8kV+huueS4n8od+8M
 Kw+dvazUzcQgPAapUCWruAsZo2hqYug9j+UnfmQV2zgONEuFUApWx3r1FySUrIpwy5/f
 LyOg==
X-Gm-Message-State: AJIora/frjGLblLZ9zZIBzRdIs84AtOrBxNm2WR7vTCzfDdRlFe1XJXj
 2fyMCeVyZIe5rxmzcsxdhUnDg7IOD+phA9ikC97HO/uhlvqnVrlXckil/DXC84iZfODxeifDk97
 iJDjv1nvW4QXp/gGoRYII/l2+lD27QIukWvvFOpcY3yKIkiDWtfHsaSBpY1aaoGydly0=
X-Received: by 2002:a17:906:84f0:b0:72b:5cf4:465d with SMTP id
 zp16-20020a17090684f000b0072b5cf4465dmr7870962ejb.705.1657789366152; 
 Thu, 14 Jul 2022 02:02:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sFgqYnGx9Vyb13CZn2t+lOEtgWe4Cp/1aOasgVJKLisvKlbfTLCwOGxvzh/h43Ii4jCWDN3Q==
X-Received: by 2002:a17:906:84f0:b0:72b:5cf4:465d with SMTP id
 zp16-20020a17090684f000b0072b5cf4465dmr7870945ejb.705.1657789365872; 
 Thu, 14 Jul 2022 02:02:45 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 kv10-20020a17090778ca00b0072eddc468absm452904ejc.134.2022.07.14.02.02.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 02:02:45 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 19/20] q800: add default vendor and product information for
 scsi-cd devices
Date: Thu, 14 Jul 2022 11:02:10 +0200
Message-Id: <20220714090211.304305-20-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220714090211.304305-1-pbonzini@redhat.com>
References: <20220714090211.304305-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

The MacOS CDROM driver uses a SCSI INQUIRY command to check that any SCSI CDROMs
detected match a whitelist of vendors and products before adding them to the
list of available devices.

Add known-good default vendor and product information using the existing
compat_prop mechanism so the user doesn't have to use long command lines to set
the qdev properties manually.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220622105314.802852-15-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/m68k/q800.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index dccf192e55..101ab0f803 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -695,6 +695,9 @@ static GlobalProperty hw_compat_q800[] = {
     { "scsi-cd", "quirk_mode_sense_rom_use_dbd", "on"},
     { "scsi-cd", "quirk_mode_page_vendor_specific_apple", "on"},
     { "scsi-cd", "quirk_mode_page_truncated", "on"},
+    { "scsi-cd", "vendor", "MATSHITA" },
+    { "scsi-cd", "product", "CD-ROM CR-8005" },
+    { "scsi-cd", "ver", "1.0k" },
 };
 static const size_t hw_compat_q800_len = G_N_ELEMENTS(hw_compat_q800);
 
-- 
2.36.1



