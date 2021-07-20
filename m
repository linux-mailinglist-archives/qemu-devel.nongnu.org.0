Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4823CFE1B
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 17:46:35 +0200 (CEST)
Received: from localhost ([::1]:55242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5rx4-0006yV-D6
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 11:46:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5rsx-0007vF-Mp
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:42:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5rsu-0004yK-L5
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:42:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626795736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TPsCTU8L4r8xb5MkbAmNgt4G1+BBMqLJLuOI80KFoMM=;
 b=eaUR7kMK0PQIit/dq58ufOD0qeYqdgmN5DYoFhAsOGHu2dkUqi2DSu8zscp/KmX3KL999H
 /i/Ic4wGYx4eVyMzohWmySTLNItCu/+jei5vak7CciAEUmBCgC71yTYHLVicgNhVEZsClq
 UoUhS/NMacvTey+rDt4N6Re9ClWT1rI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-695D1tR4P7uvrObXkGQjEQ-1; Tue, 20 Jul 2021 11:42:15 -0400
X-MC-Unique: 695D1tR4P7uvrObXkGQjEQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 r11-20020a5d52cb0000b02901309f5e7298so10513605wrv.0
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 08:42:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TPsCTU8L4r8xb5MkbAmNgt4G1+BBMqLJLuOI80KFoMM=;
 b=Ctsd0USZuJ1WEFYppLcbQuewWJWfvQKb6yRlYbKpkrWlZHQv+WJHkOfOoUjkdcGEjj
 tDm15z6QAniMUoyoa24hQHfhjfujjwPOy0DJXWis25A1aalj1/BJ/hiFcbZ9R6uIDcCR
 GlxHtD5HsIl2vVosrUT2kUYmiDxYZZTkcyJTbiPjUtc1sDgDkH75kITJHnxEGa4WulaW
 VJtm94ahOIDcRrMFIKeNE7C3O7bWcw92W2vzwgvQOOqKak8DFcBb1gNKzVh1oKfH55Gd
 S0ClSrWjmF1G5Vy4n8BwyBTvA5KM6KPvVgjcRPnuceHKyD4+OopNvr7GL93ZSzIGpDLo
 3qgw==
X-Gm-Message-State: AOAM530Qn9KGlLHU4Bo7mr6YPrjh+2G9Ou12418Yy9Fu0fL+rMxAQrUu
 YqvNMRC/8vHNzeOPbg+M0+encgJljpfQgNN3nRuBb3BTQnfMqKv9EBxkrkcoZq8eOqShoeh8qNv
 mWOEWe9OEy8EeZ6MMKd4tt5LzX4TmwzuC4qnUH9zRtYxdqjT7XQN6fsHWvptk/rbz
X-Received: by 2002:a05:600c:b48:: with SMTP id
 k8mr39020867wmr.180.1626795733713; 
 Tue, 20 Jul 2021 08:42:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzi7jNf/6tgIxJuaGgZuwygb8HcjM/iyjsAYT2v6JV5PaUbfJSY+6D9VzcfvW5BlFklN5BzLg==
X-Received: by 2002:a05:600c:b48:: with SMTP id
 k8mr39020840wmr.180.1626795733450; 
 Tue, 20 Jul 2021 08:42:13 -0700 (PDT)
Received: from x1w.. (122.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id
 c2sm23892669wrs.60.2021.07.20.08.42.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 08:42:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/17] hw/arm/Kconfig: Add missing dependency NPCM7XX -> SMBUS
Date: Tue, 20 Jul 2021 17:41:31 +0200
Message-Id: <20210720154141.3919817-8-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210720154141.3919817-1-philmd@redhat.com>
References: <20210720154141.3919817-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: Hao Wu <wuhaotsh@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The TYPE_NPCM7XX_SMBUS device model exposes an SMBus, but
this isn't advertised with proper Kconfig symbol, leading
to an early build failure when building NPCM7XX machines
standalone:

  The following clauses were found for AT24C

      config AT24C depends on I2C
      select AT24C if NPCM7XX

Fix by adding SMBUS to NPCM7XX.

Fixes: 94e77879395 ("hw/i2c: Implement NPCM7XX SMBus Module Single Mode")
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210515173716.358295-4-philmd@redhat.com>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 90b19c0861a..4a994f35e3b 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -388,6 +388,7 @@ config NPCM7XX
     select A9MPCORE
     select ADM1272
     select ARM_GIC
+    select SMBUS
     select AT24C  # EEPROM
     select MAX34451
     select PL310  # cache controller
-- 
2.31.1


