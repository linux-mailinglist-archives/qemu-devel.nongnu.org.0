Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DBE374A04
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 23:18:32 +0200 (CEST)
Received: from localhost ([::1]:60762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leOud-0007mu-1m
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 17:18:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leOoD-0000sR-Dg
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:11:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leOoB-0004dD-TK
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:11:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620249111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hiAEEgiMzbtFY5nN+/nFhOYjAQIYHUilzZNqfLN4ZPg=;
 b=CLxuo9Zh+RoOHybuHRzHJGUUv/gxUuBDACjgE1eRuih92acILi4IMXMr8AZKrw02FhT51v
 cNo/KhU7ML45pTxinhXgKQx6bRX6U8BhBew/lSIhfyMZhQRekNfEUqnHO+W5evxeCCavbc
 8X15owGsUhY9Kgja+y/SFVvZdh2/gxo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-gI8vHX5FMOqB9nv24uKt9Q-1; Wed, 05 May 2021 17:11:47 -0400
X-MC-Unique: gI8vHX5FMOqB9nv24uKt9Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 r12-20020adfc10c0000b029010d83323601so1191089wre.22
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 14:11:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hiAEEgiMzbtFY5nN+/nFhOYjAQIYHUilzZNqfLN4ZPg=;
 b=spJNe/NMpgeVpID3E1hRH1cQMR+v/gSm2yK1HQ6uvlEhm4PsUkSvKS8feoiEIORiMB
 snv42i/VlbGmS7YHqsHq4fyo6WUCQismjsGm2A/lLOBZ6wBTYkazYTHVa3ViABiel2P/
 lTbLk/AuvgOj4X4B/goD2dJ1NxSfFK4XJgom+LgbwxAYXEFUQFzm/PQRecoVuZj04vcG
 rV84yqo9cYHj7fJ5XurhoEIIDyrlnKxkAqEzex7P+5XoYq6GBBXHxmZD8URIIWq4Uyqk
 AZElxRi82y1h7RbO6WSQjbjE3cw9AeZ0qILoV6mTSmV25tNnwkL2GGM+kpBHmClhDYJG
 jU9w==
X-Gm-Message-State: AOAM530KOOgwFfp1zjFVb26mYDytq3F2HcUq5j+cAUT1JA8wh9toZ+bt
 MKnW66gryqCl8l3ZQk3WIwRr0nC3JqZ4a9xdIznZ5l9fKHgYVFwME3h7/HDfk/qrsY61BVvWC3W
 b1pfk2utXjC1WFYpupHa23yLPDQ9BhHeMrDPqGQfG0K08QwJmyh6j1QNfdHeWqbOf
X-Received: by 2002:a5d:4ac6:: with SMTP id y6mr1056216wrs.414.1620249106572; 
 Wed, 05 May 2021 14:11:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkwwJ4FPVEZbq1eTtKpL88QQ5+CYLkOHs+o3I49IAhK0lukdV3xx4Jvs7je6TKllZc5PE/Ww==
X-Received: by 2002:a5d:4ac6:: with SMTP id y6mr1056191wrs.414.1620249106367; 
 Wed, 05 May 2021 14:11:46 -0700 (PDT)
Received: from x1w.redhat.com
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id i12sm672542wry.57.2021.05.05.14.11.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 14:11:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/23] hw/intc/xics: Avoid dynamic stack allocation
Date: Wed,  5 May 2021 23:10:35 +0200
Message-Id: <20210505211047.1496765-12-philmd@redhat.com>
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
 Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use autofree heap allocation instead of variable-length
array on the stack.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/intc/xics.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/xics.c b/hw/intc/xics.c
index 68f9d44feb4..c293d00d5c4 100644
--- a/hw/intc/xics.c
+++ b/hw/intc/xics.c
@@ -566,8 +566,8 @@ static void ics_reset_irq(ICSIRQState *irq)
 static void ics_reset(DeviceState *dev)
 {
     ICSState *ics = ICS(dev);
+    g_autofree uint8_t *flags = g_malloc(ics->nr_irqs);
     int i;
-    uint8_t flags[ics->nr_irqs];
 
     for (i = 0; i < ics->nr_irqs; i++) {
         flags[i] = ics->irqs[i].flags;
-- 
2.26.3


