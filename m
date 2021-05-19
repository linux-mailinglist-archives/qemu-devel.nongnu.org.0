Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F22C389459
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 19:03:57 +0200 (CEST)
Received: from localhost ([::1]:55750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljPbw-0003Ef-9U
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 13:03:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljPA3-00037E-0f
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:35:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljP9z-0006vK-Cg
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:35:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621442102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zQBaPB2rPx7zwmJ2L9PvToDExIoXxeF+Eyck4rA2oM0=;
 b=bhihmjEsJnbtjKgQedAaL8S4bGXe1nyyPfhZSfsKdDML6K5gdLcWYroxJMVRMPAyJk/iSs
 xXnz37shzXLFziNWQEvE361LfutGFf8jyT4K7PZnTmMduaTSjM2JwtHsdQuWOfBSbx94ku
 ANHQOOb1MTYlGlBk2Y4ms9vvAKVCOIk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-_1BUL7g8N1O83g4dfRfSKw-1; Wed, 19 May 2021 12:35:00 -0400
X-MC-Unique: _1BUL7g8N1O83g4dfRfSKw-1
Received: by mail-wm1-f72.google.com with SMTP id
 r15-20020a05600c35cfb029017373d9f318so829936wmq.4
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 09:35:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zQBaPB2rPx7zwmJ2L9PvToDExIoXxeF+Eyck4rA2oM0=;
 b=D/k60l9N6+eR1cyZq2S2/jYaP8HDXT3s6S8qbQCt8kPnKf1DXXEJwA4bUQ/FlnNzfT
 Fcl718PMoHaxBszVvQcPGHvF5aVQIRrEDkLV1hoBnhxGx5N6ce7HN3AqFOjfHkj+nIC1
 R/ai/O5OAOGMo32MxU6QtyosrhntGuP+YnQEDRGt3AIwSbm9uz/kEeMegEaAL8oMc3++
 he942bTlTHIfeiXIsOuI3iTq1TlePUrHGWp1ju9+NYlirBExrMRfAVX46GDtuzrqTIFC
 oE0gTTGEBWY7xrerBvAaxZxAdBEI69Ypj6Yuy8YbaDRif5UKzEUSmtgO4vDRc2TW+f8m
 Al+w==
X-Gm-Message-State: AOAM5325MJK7TSz8un81oLbZnpQYFAr8rhHdlzs6+g6rkFNucuULcW4J
 OuKE7/1kjQ7Oi5MyaWDuP3hojMDGN95RLkVK1gprN20kEmB0vAsN8zCcNq4I7kxdy98xA7pSWkN
 FuYZQvpD3EfTo3+g=
X-Received: by 2002:a05:6000:244:: with SMTP id
 m4mr15692482wrz.225.1621442099154; 
 Wed, 19 May 2021 09:34:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywwJOety9/DBSOSzzTvYDzInt8nSuOZZrF0A9b3n1kH6PiHULNuMGh/KNuFa2lyQsxUq0leQ==
X-Received: by 2002:a05:6000:244:: with SMTP id
 m4mr15692468wrz.225.1621442099047; 
 Wed, 19 May 2021 09:34:59 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id b8sm27015076wrx.15.2021.05.19.09.34.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 09:34:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: John Snow <jsnow@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v6 2/5] hw/block/fdc: Replace disabled fprintf() by trace event
Date: Wed, 19 May 2021 18:34:45 +0200
Message-Id: <20210519163448.2154339-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210519163448.2154339-1-philmd@redhat.com>
References: <20210519163448.2154339-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: John Snow <jsnow@redhat.com>
Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/fdc.c        | 7 +------
 hw/block/trace-events | 1 +
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index a825c2acbae..1d3a0473678 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -1242,12 +1242,7 @@ static void fdctrl_external_reset_isa(DeviceState *d)
 
 static void fdctrl_handle_tc(void *opaque, int irq, int level)
 {
-    //FDCtrl *s = opaque;
-
-    if (level) {
-        // XXX
-        FLOPPY_DPRINTF("TC pulsed\n");
-    }
+    trace_fdctrl_tc_pulse(level);
 }
 
 /* Change IRQ state */
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 646917d045f..7b26fc738f0 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -3,6 +3,7 @@
 # fdc.c
 fdc_ioport_read(uint8_t reg, uint8_t value) "read reg 0x%02x val 0x%02x"
 fdc_ioport_write(uint8_t reg, uint8_t value) "write reg 0x%02x val 0x%02x"
+fdctrl_tc_pulse(int level) "TC pulse: %u"
 
 # pflash_cfi01.c
 # pflash_cfi02.c
-- 
2.26.3


