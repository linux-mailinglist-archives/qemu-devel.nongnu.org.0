Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD2F5A9EED
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 20:29:15 +0200 (CEST)
Received: from localhost ([::1]:51524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTowE-0004vP-7V
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 14:29:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTort-0007ZY-2x
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:24:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTorj-0008Fm-Ri
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:24:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662056675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k2nKjhnostYqgPi2r+8oxC34rrW7j9TGrr7tgEbh8fU=;
 b=Pt5Jj3Z72fmLxcRk9ynaQcU/JBaQYLIEeayc/vp+WfF6veZuegaMz6hkXg6kk/RebRj4CR
 jA17KadHFrQeHm7IXh2NvaCGhvGe8fyM+Y6/GIUtPYyZ6E9OXMziDmV0hGRmFzrWNp6aRh
 WOf3yWo51/iJIuBooGfMcOe9IP2QO8E=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-642-Eofj_XxhPaaws_n3EDxw_A-1; Thu, 01 Sep 2022 14:24:34 -0400
X-MC-Unique: Eofj_XxhPaaws_n3EDxw_A-1
Received: by mail-ed1-f69.google.com with SMTP id
 v1-20020a056402348100b00448acc79177so7153686edc.23
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 11:24:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=k2nKjhnostYqgPi2r+8oxC34rrW7j9TGrr7tgEbh8fU=;
 b=aF+C6s70sxLgXToEMZdUoA7qJYJ10EvL/w/JWOuJawbPYwV52ECh77+gqhOXfJC/uj
 XGq/yfAAiy+FG7fNwEcFprdzk33wIh3tJxQoSygkvozNzSnnJhLfI8ixzUnCKow16EXE
 5x0/naFgFPZ42Y/EYffVvsaS8QaT3AHn7yo88CyQhkTnbeEJ/mfYel7fs/6HzLbkCJoY
 xLhASDh8WtdC0Dk1CmKyRy6VpVd7ML+/QXx8ZWnLKu/VW439l4Bb4tROfm/6HsGbLRgr
 9qmSow46kmYhVWcYk4lTnjIN8u4WM0lYKyjUkkMeeoBWYYs74e1qzaIR67cogatAz4HT
 dmaA==
X-Gm-Message-State: ACgBeo2/F++JTHEjc80I6hIs13oa2T85BoIQKdK3k8RumV44ssjLspyd
 c2MSUEBJNA7doss3t8BUUQEijplQ1cRHNlDZJ7MiLI02S5K29A/ky+ML5/Xzw7wINPUOSk5mTzw
 g0LwlstgA+G7hNnRbBTL3jY3Z2k5bli3Pygb8xIaug0U9mubEqctqkHukubi2GDimS8s=
X-Received: by 2002:a05:6402:184:b0:442:fd54:2a21 with SMTP id
 r4-20020a056402018400b00442fd542a21mr29743775edv.129.1662056672607; 
 Thu, 01 Sep 2022 11:24:32 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5JMS56T54lh2dTUzgZMO6Y9ZrL3VqyAtBBOi2x5Nr8ZI10nZ9vmmAacyDAubMQ++iAkeoq3Q==
X-Received: by 2002:a05:6402:184:b0:442:fd54:2a21 with SMTP id
 r4-20020a056402018400b00442fd542a21mr29743755edv.129.1662056672235; 
 Thu, 01 Sep 2022 11:24:32 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a50ab16000000b00445e1489313sm1728177edc.94.2022.09.01.11.24.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 11:24:31 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: John Millikin <john@john-millikin.com>,
	Bill Paul <noisetube@gmail.com>
Subject: [PULL 01/39] esp: Handle CMD_BUSRESET by resetting the SCSI bus
Date: Thu,  1 Sep 2022 20:23:51 +0200
Message-Id: <20220901182429.93533-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220901182429.93533-1-pbonzini@redhat.com>
References: <20220901182429.93533-1-pbonzini@redhat.com>
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

From: John Millikin <john@john-millikin.com>

Per investigation on the linked ticket, SunOS issues a SCSI bus reset
to the ESP as part of its boot sequence. If this ESP command doesn't
cause devices to assert sense flag UNIT ATTENTION, SunOS will consider
the CD-ROM device to be non-compliant with Common Command Set (CCS).
In this condition, the SunOS installer's early userspace doesn't set
the installation source location to sr0 and the miniroot copy fails.

Signed-off-by: John Millikin <john@john-millikin.com>
Suggested-by: Bill Paul <noisetube@gmail.com>
Buglink: https://gitlab.com/qemu-project/qemu/-/issues/1127
Message-Id: <20220817053846.699310-1-john@john-millikin.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/esp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 2d3c649567..c799c19bd4 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -939,6 +939,11 @@ static void esp_soft_reset(ESPState *s)
     esp_hard_reset(s);
 }
 
+static void esp_bus_reset(ESPState *s)
+{
+    qbus_reset_all(BUS(&s->bus));
+}
+
 static void parent_esp_reset(ESPState *s, int irq, int level)
 {
     if (level) {
@@ -1067,6 +1072,7 @@ void esp_reg_write(ESPState *s, uint32_t saddr, uint64_t val)
             break;
         case CMD_BUSRESET:
             trace_esp_mem_writeb_cmd_bus_reset(val);
+            esp_bus_reset(s);
             if (!(s->wregs[ESP_CFG1] & CFG1_RESREPT)) {
                 s->rregs[ESP_RINTR] |= INTR_RST;
                 esp_raise_irq(s);
-- 
2.37.2



