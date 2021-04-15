Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEA536071E
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 12:29:28 +0200 (CEST)
Received: from localhost ([::1]:34542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWzFY-0003TB-15
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 06:29:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lWz9t-0007HH-Oc
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 06:23:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lWz9s-0008Tj-7Z
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 06:23:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618482215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w5PdIklFyUrXVkInzR6jRcGLXceYvSrty/XCh3gByxY=;
 b=MVAz29u5qMOgdJ940SZNrOnT/L6Jbpt2x9OIVbORUgGnDmw84A+kOpLNdDjKvc266fPQM0
 S1tvyg2tqbT7oUMHXpg+sfOMe9ntiNl9qxX4ic3GR8Ybpd2+4qW1/UdPrDCkRD+WlILKLm
 g+VgS+fWMdopIEC8RQDeDL3oDH0wxOc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-RT8hDGTvNOiAnfuvUXWbuQ-1; Thu, 15 Apr 2021 06:23:31 -0400
X-MC-Unique: RT8hDGTvNOiAnfuvUXWbuQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 f15-20020adffccf0000b02901028c7339ccso2527752wrs.1
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 03:23:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w5PdIklFyUrXVkInzR6jRcGLXceYvSrty/XCh3gByxY=;
 b=soqrD6ShWTcP/NujJWL3fnIGFTs/R3XPveyUFfnHp721uGvO+I1Z5w2fVE9/zp5UI4
 u7pr73yYCl6BHyqFYUwszr84QBZlD40CvynDfBlxfek7E7CjOVladv2HtAPV1ZAJQtrG
 soVCI9nZrz57Lnhu6HMbYZSki1P2KgOmsWlOPj/ivPqKtb4OsZOEbsC46uMbMZC8O8xt
 0SPjju1wa6Nwxsqf/bMJ6fBH9SU4AoVtZyT2TtL8m7hTFqSHoywSeOO9vsl8WVPk4ygl
 tv8pPYiRjuYJCO7gTAQ4Vul3rlbZMCsZvjR66sZbh3zfi22PBceT9kxnwG9uGKbhql0h
 ClgQ==
X-Gm-Message-State: AOAM531elC09UQXpSo/xD9/5WlrhDszkCtA1eNf4CeG3xRKX/dKuJL/2
 i01ElKmCXh7l6yeYqmj/CrJlahejFHkSuUW8JA+ZpAonPt7IsO1Yi9G4AcoDArjAmLCNN5Tl8qe
 Gd0ljZDYJA94rkvg=
X-Received: by 2002:a05:6000:18af:: with SMTP id
 b15mr2708869wri.71.1618482210587; 
 Thu, 15 Apr 2021 03:23:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbPVHQ2wBHqituWSoyDnWCYWj0aptiH/Z5l+7RO+ETXkW6mEb05uZkMkReNfofB5x3l77Ecw==
X-Received: by 2002:a05:6000:18af:: with SMTP id
 b15mr2708846wri.71.1618482210421; 
 Thu, 15 Apr 2021 03:23:30 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id j30sm2386379wrj.62.2021.04.15.03.23.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 03:23:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: John Snow <jsnow@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 1/4] hw/block/fdc: Replace disabled fprintf() by trace event
Date: Thu, 15 Apr 2021 12:23:18 +0200
Message-Id: <20210415102321.3987935-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210415102321.3987935-1-philmd@redhat.com>
References: <20210415102321.3987935-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
index fa12e3a67a7..306989c193c 100644
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


