Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AFB32BA27
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 20:16:01 +0100 (CET)
Received: from localhost ([::1]:35838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHWyW-00024v-Ui
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 14:16:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWvR-0000BQ-NC
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 14:12:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWvN-0006uy-2w
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 14:12:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614798761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rXFV9G0MJ4FvY42CmYEG0oMTNhQmH249ONzv0QeRcyQ=;
 b=Cy56EltcrPG+LDMBgLd1tkl5gDd3PztVgb8BZpfkonySZVYsRLqIwsdi1pmL+JikrbBd3G
 Lp9ML1GNIZIiseVfznStFbBOsxkm5hVlCCbY5LgE/74/Ozt9X8KODdsRZw0TL7ziu6gjWY
 1dFh28PLpbRB0qa54gq64b9X5sWnjHU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-mZIPPWBGNmq1xAbnBEUdbg-1; Wed, 03 Mar 2021 14:12:40 -0500
X-MC-Unique: mZIPPWBGNmq1xAbnBEUdbg-1
Received: by mail-wr1-f71.google.com with SMTP id e29so13196263wra.12
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 11:12:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rXFV9G0MJ4FvY42CmYEG0oMTNhQmH249ONzv0QeRcyQ=;
 b=Vp+CmtXLYmFwr44IqSmPK1mjPw6gZxNDNVHuVO5DwqsISdX/0HwV9MR5k7EX5gvXnJ
 lx9dkVwrNvtpt7E+nWIsA7cyZ7D+haxtx9d0mhsfHEN7oIcAA69umN2UEcKBhKKCRCzf
 NHXEN6rZw2OIf3hbh/FKw+XNQUGGOJDKnupz7Q9TEGbVve5lo4GgNfsynF7KdV0xr8Dl
 9OM43HU/0bx9G6T9bQtcMcJWVZREhOmskoZh7E+XnLhUfDs4tVgOQ5N+ACXVyTcwZ0/A
 nLGs4Qf2X5dpH0tXotHjsGjJhqRzkRYxvHo/QwlQ4gf28d21JgGhW4RLP4ZNis2y1l9K
 4lDA==
X-Gm-Message-State: AOAM532DHl4m2oQfZDOrN5mZnT+HOJdhEHgb0SecCxfjGI059MhW46/v
 LBqqtQMS3/ng7l4mtbKFoq2IsBIzqkkHPXb9U8gyVjmPnZSDC0EH6ZylbcwEl6hAORjjHcl2eUu
 E0rAF8bQEJJdiwr8QOcLpxcCWxijtzMEDszuXm8DTjxSzBLKpUAlHmNHPL+3NGDRP
X-Received: by 2002:a1c:7fd8:: with SMTP id a207mr441371wmd.40.1614798758643; 
 Wed, 03 Mar 2021 11:12:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwUlGR3AFf6/QS6ZZh+/wUME62yJZIX+H+tEgqvi46UMWQqbq4iaUNQm6UKm+TWUtbuYK9G+g==
X-Received: by 2002:a1c:7fd8:: with SMTP id a207mr441341wmd.40.1614798758390; 
 Wed, 03 Mar 2021 11:12:38 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id p6sm19301832wru.2.2021.03.03.11.12.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 11:12:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 06/10] hw/net: ne2000: Remove the logic of padding
 short frames in the receive path
Date: Wed,  3 Mar 2021 20:12:01 +0100
Message-Id: <20210303191205.1656980-7-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303191205.1656980-1-philmd@redhat.com>
References: <20210303191205.1656980-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Now that we have implemented unified short frames padding in the
QEMU networking codes, remove the same logic in the NIC codes.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Message-Id: <1614763306-18026-6-git-send-email-bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/net/ne2000.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/hw/net/ne2000.c b/hw/net/ne2000.c
index 6c17ee1ae21..b0a120ece63 100644
--- a/hw/net/ne2000.c
+++ b/hw/net/ne2000.c
@@ -167,15 +167,12 @@ static int ne2000_buffer_full(NE2000State *s)
     return 0;
 }
 
-#define MIN_BUF_SIZE 60
-
 ssize_t ne2000_receive(NetClientState *nc, const uint8_t *buf, size_t size_)
 {
     NE2000State *s = qemu_get_nic_opaque(nc);
     size_t size = size_;
     uint8_t *p;
     unsigned int total_len, next, avail, len, index, mcast_idx;
-    uint8_t buf1[60];
     static const uint8_t broadcast_macaddr[6] =
         { 0xff, 0xff, 0xff, 0xff, 0xff, 0xff };
 
@@ -213,15 +210,6 @@ ssize_t ne2000_receive(NetClientState *nc, const uint8_t *buf, size_t size_)
         }
     }
 
-
-    /* if too small buffer, then expand it */
-    if (size < MIN_BUF_SIZE) {
-        memcpy(buf1, buf, size);
-        memset(buf1 + size, 0, MIN_BUF_SIZE - size);
-        buf = buf1;
-        size = MIN_BUF_SIZE;
-    }
-
     index = s->curpag << 8;
     if (index >= NE2000_PMEM_END) {
         index = s->start;
-- 
2.26.2


