Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6475A381A38
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 19:43:03 +0200 (CEST)
Received: from localhost ([::1]:41646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhyJa-0000Qz-FT
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 13:43:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEO-0000Mq-Pw
 for qemu-devel@nongnu.org; Sat, 15 May 2021 13:37:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEL-0006Ah-31
 for qemu-devel@nongnu.org; Sat, 15 May 2021 13:37:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621100256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k59OgyztQggH2BswEalrOvHA2AZsGsT7XfWLcKTsjW4=;
 b=D9NedgT3VSrkPQwTYTtIsGlErAZpthfrfifzJp3kpuJrr0ySU0PVYl8CtU7iG+e2bjRhmQ
 PuhRWAIlLIWwGQEVgfVHas73SrpjqLQ0vc0ky4WdLNVQcnySd7EvsfYBVZQu0yqhgnxMeU
 oDmGrl8XoaAMJVpR9Dgddw/RfcFK184=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-I3fASzWzPPmZdY99eFIT2w-1; Sat, 15 May 2021 13:37:34 -0400
X-MC-Unique: I3fASzWzPPmZdY99eFIT2w-1
Received: by mail-wm1-f69.google.com with SMTP id
 o126-20020a1c28840000b0290149b8f27c99so183217wmo.2
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 10:37:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k59OgyztQggH2BswEalrOvHA2AZsGsT7XfWLcKTsjW4=;
 b=jUFWyJ7k4WoMum0Hk88x9S+Okt70HojhZD7/FXPFets6FBA9QcZn21nXRbl1iPLp+0
 ZjTzFlCfEEOK2K2uNHm6A/IIilc9KrOrAogO/32KTjWWZ+qyB5iLH5MO3KnZ6lu0QICi
 ESIr+0RJ6tPR+IjJwaH3Krv8Jp9lfqB73ALqgRPvF4PyFaQs/lLVxUyo6QINkUdfs27D
 kKP3iygwYB8Hn86UgAvNamp9ASz52jUBbanuSxIuhgaGg5ncq3t3rkqt5kmIp+iNfYaW
 JBaI6B1woIorBO04BCcV97svQGOFP3js4boSwN5DffX4v8ihKC0SM5eYjGkk8UdBGEIf
 UoKw==
X-Gm-Message-State: AOAM531wpot88YVTwqxCbg+FCEmhCMa/Lx2wCRauPbUP/CBL4XipBkDo
 l6nDeln/Ex82JWk/k+PzfU3zVUHDvRG5qFZngo8DEbRpRkHzTPed2YPB7bFN4ra67x0NHWCEDVl
 Mfs1HBXtmXwJUVRlWhACrGB+JQ+BrbHRN+UsmWKXBtBaCH/gOX0gcElH5nx7fcFdY
X-Received: by 2002:a1c:a446:: with SMTP id n67mr3743214wme.19.1621100253415; 
 Sat, 15 May 2021 10:37:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyY81/AM1k54bDXruKvRIomEErOv9vjg+vI2AQgtq4Ayz/+9KFltkQvriNz3cEMu45Ca/C/7Q==
X-Received: by 2002:a1c:a446:: with SMTP id n67mr3743192wme.19.1621100253232; 
 Sat, 15 May 2021 10:37:33 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id b68sm2216685wmb.11.2021.05.15.10.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 10:37:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/12] hw/arm/Kconfig: Add missing dependency NPCM7XX ->
 SMBUS
Date: Sat, 15 May 2021 19:37:07 +0200
Message-Id: <20210515173716.358295-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210515173716.358295-1-philmd@redhat.com>
References: <20210515173716.358295-1-philmd@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
 Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, Hao Wu <wuhaotsh@google.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
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
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 67723d9ea6a..85c6a1a088c 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -373,6 +373,7 @@ config NPCM7XX
     bool
     select A9MPCORE
     select ARM_GIC
+    select SMBUS
     select AT24C  # EEPROM
     select PL310  # cache controller
     select SERIAL
-- 
2.26.3


