Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B05C374A3A
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 23:36:12 +0200 (CEST)
Received: from localhost ([::1]:58280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lePBj-0004ux-6P
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 17:36:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leOoR-0001RH-AD
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:12:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leOoO-0004kE-Dk
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:12:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620249123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=636tUeaZUJwZXzgkoGYRlYUQS8C8vEDoXPpJByBKufw=;
 b=IF1qXYoH3yz2yjsoCjgktKA2JL1W60wC+hBzIbKHy5jg6rpxVTT/kWQ1t3YOzzjfpCV0sQ
 hF9F0tkspBBrG58xz15jdOALRcq2JOXPD9TeRpY6du7U8VqlM7GpKTCmgnhuWqwuGSRZW2
 /vsdEQ+UB5oDjxO/luCDCnLhp9LV69I=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-y4ask1dpPNuscPnmAWTD0w-1; Wed, 05 May 2021 17:12:02 -0400
X-MC-Unique: y4ask1dpPNuscPnmAWTD0w-1
Received: by mail-wr1-f72.google.com with SMTP id
 r12-20020adfc10c0000b029010d83323601so1191301wre.22
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 14:12:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=636tUeaZUJwZXzgkoGYRlYUQS8C8vEDoXPpJByBKufw=;
 b=WZKEEEk8yF6lrrJN7Vgf1gC8IYyMAULy1VqzPFOzX4M6S6yiheKk7HbyOO44QoH74a
 EXMhR2e7SZ7HUyMCCWd1SO7V07vDcOXC1IXHWIT1HHOr3WgYMUdIyuIiapHfKanM7sfh
 34kVlvl9k6NwGGEeNC7qGWqktuwn3CMq6OFm5+KAiRxUWqKGfqfJVkMAJbAKlfE4vxue
 MsoAhkrhsSzWDfcvxc/wJP33lIaiqrpJtrDVt8nmN5EfR/iG5ll4iAccH1KRiHgxw/PS
 NGx1XeZUxb8PGKJwjtE1+/i0XfIwdjfQcjq0oez0KkIpInEGuMwRTIZPLERKR2xA9LWa
 QmVQ==
X-Gm-Message-State: AOAM530AbVx487n/SreafVN7XquGhLd0xiORMYC6N5y/EEweuXr05HWt
 qoeSAsRFHY2yMhYEjDuosQTmzsj4pgdbZHRhHTjQSW8iyVvdKYv8hOc/oEGsfwT7T85lBpvwiR+
 zDRAIOcwQ3ft3gnp3DdWrcoIrWWW47ZotNskMi2JI2Ipgw1gHeLSQJY1lSq1as5Jy
X-Received: by 2002:a05:600c:2242:: with SMTP id
 a2mr619034wmm.125.1620249120976; 
 Wed, 05 May 2021 14:12:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCJeEMZBQikxcTCj55Wbnl59HNODb424Hnb387n8l9K6RxYflSny7y4Nqiv7PVgw1geYimyw==
X-Received: by 2002:a05:600c:2242:: with SMTP id
 a2mr619021wmm.125.1620249120831; 
 Wed, 05 May 2021 14:12:00 -0700 (PDT)
Received: from x1w.redhat.com
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id r5sm641066wmh.23.2021.05.05.14.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 14:12:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/23] hw/usb/hcd-ohci: Use definition to avoid dynamic stack
 allocation
Date: Wed,  5 May 2021 23:10:38 +0200
Message-Id: <20210505211047.1496765-15-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210505211047.1496765-1-philmd@redhat.com>
References: <20210505211047.1496765-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The compiler isn't clever enough to figure 'width' is a constant,
so help it by using a definitions instead.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/usb/hcd-ohci.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index 1cf2816772c..d090eee673d 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -894,13 +894,14 @@ static int ohci_service_iso_td(OHCIState *ohci, struct ohci_ed *ed,
     return 1;
 }
 
+#define HEX_CHAR_PER_LINE 16
+
 static void ohci_td_pkt(const char *msg, const uint8_t *buf, size_t len)
 {
     bool print16;
     bool printall;
-    const int width = 16;
     int i;
-    char tmp[3 * width + 1];
+    char tmp[3 * HEX_CHAR_PER_LINE + 1];
     char *p = tmp;
 
     print16 = !!trace_event_get_state_backends(TRACE_USB_OHCI_TD_PKT_SHORT);
@@ -911,7 +912,7 @@ static void ohci_td_pkt(const char *msg, const uint8_t *buf, size_t len)
     }
 
     for (i = 0; ; i++) {
-        if (i && (!(i % width) || (i == len))) {
+        if (i && (!(i % HEX_CHAR_PER_LINE) || (i == len))) {
             if (!printall) {
                 trace_usb_ohci_td_pkt_short(msg, tmp);
                 break;
-- 
2.26.3


