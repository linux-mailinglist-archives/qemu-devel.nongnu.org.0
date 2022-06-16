Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6878854DE0B
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 11:20:36 +0200 (CEST)
Received: from localhost ([::1]:50490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1lg2-0008S6-P8
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 05:20:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o1kw0-00020y-69
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:33:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o1kvv-0002v9-FP
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:32:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655368374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZVARjugAIjnT/VKUsTwlLt+SkZNqOAcdCvLVW7E7KE8=;
 b=OF+5/CdR2w/1gs0Grd88eZI8Y5EH2cpEK3a69hVEMcgyjeLn9bwGLu1wWQWIXzAhcY/kNJ
 ZLlSdoGZiCjqbZd7E82om1M3K+0Jm0Qwzyq8S/8xbBuCUuftryoyxqpgOY+bqc2ly2E/9U
 4rzF+dxzA16sDtwRs88dQeSIO1VPRtE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-70-A_VLtL6EM66CyR4-yjSdBw-1; Thu, 16 Jun 2022 04:32:52 -0400
X-MC-Unique: A_VLtL6EM66CyR4-yjSdBw-1
Received: by mail-ed1-f71.google.com with SMTP id
 g7-20020a056402424700b0042dee9d11d0so777925edb.3
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 01:32:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZVARjugAIjnT/VKUsTwlLt+SkZNqOAcdCvLVW7E7KE8=;
 b=JmksTcxOKGQBLgczL9EUdN14UEKchQ3IzlZcEweFUKH9JHXSoyXm5FfmKqPJCudI2I
 2ihcnSLL5JPjqcYLT1aSs19OTQr6WIEZFnuaE+nOm6tST3u52kKdyzt95K8t8iUWq39M
 2NwmoFINgpOeEHGP8JurtFR4RWnbDfTzmdKdYqnfwtebOE9WAKmwQtexx1xsPCHCiGZW
 awNz16Ztuho4nBKTQPBPQXHwsZMC0kj4PnZ091Yjl+VamLpCChdZEhSWwv6BbaKClZH4
 GFwoB0F9j7JqKPbbXHr6UmV8q89RbCpcyQ2ypvyvqZ/LeSeeM6hANJJaDZyfdxSPGLZv
 sCKQ==
X-Gm-Message-State: AJIora/+H4XarLEPh71fOmL+1YgEfQDQQJ61vT4+7zKD46oNUadToyxa
 QbkuIpDBm9vvdRORQ+kqftBb/hMVjRQKRnN6wtVJGMUP07WpsA8Mm2c1R51e1lGchvqVzpO0AG3
 smD6K6quBIP4I2p8YZWc90Ok9z5C4RWLHAVDS/TG8fRQgs5tZa3qVfAukRFuh9D1JV2A=
X-Received: by 2002:a05:6402:2397:b0:42d:dd10:6c11 with SMTP id
 j23-20020a056402239700b0042ddd106c11mr4885819eda.167.1655368371372; 
 Thu, 16 Jun 2022 01:32:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v6vl4bLQGV21CAfsiS3JNZIu6IWiQvI3pb4qSmDazuTTf1UwLsFdLcCbUsk/+sgwGG+uCTyA==
X-Received: by 2002:a05:6402:2397:b0:42d:dd10:6c11 with SMTP id
 j23-20020a056402239700b0042ddd106c11mr4885794eda.167.1655368371123; 
 Thu, 16 Jun 2022 01:32:51 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 ky20-20020a170907779400b006f4cb79d9a8sm488863ejc.75.2022.06.16.01.32.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 01:32:50 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Zhenzhong Duan <zhenzhong.duan@intel.com>
Subject: [PULL 19/21] =?UTF-8?q?q35=EF=BC=9AEnable=20TSEG=20only=20when?=
 =?UTF-8?q?=20G=5FSMRAME=20and=20TSEG=5FEN=20both=20enabled?=
Date: Thu, 16 Jun 2022 10:32:07 +0200
Message-Id: <20220616083209.117397-20-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220616083209.117397-1-pbonzini@redhat.com>
References: <20220616083209.117397-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

From: Zhenzhong Duan <zhenzhong.duan@intel.com>

According to spec:
"TSEG Enable (T_EN): Enabling of SMRAM memory for Extended SMRAM space
only. When G_SMRAME = 1 and TSEG_EN = 1, the TSEG is enabled to appear
in the appropriate physical address space. Note that once D_LCK is set,
this bit becomes read only."

Changed to match the spec description.

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
Message-Id: <20220615034501.2733802-1-zhenzhong.duan@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/pci-host/q35.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index ab5a47aff5..20da121374 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -379,7 +379,8 @@ static void mch_update_smram(MCHPCIState *mch)
         memory_region_set_enabled(&mch->high_smram, false);
     }
 
-    if (pd->config[MCH_HOST_BRIDGE_ESMRAMC] & MCH_HOST_BRIDGE_ESMRAMC_T_EN) {
+    if ((pd->config[MCH_HOST_BRIDGE_ESMRAMC] & MCH_HOST_BRIDGE_ESMRAMC_T_EN) &&
+        (pd->config[MCH_HOST_BRIDGE_SMRAM] & SMRAM_G_SMRAME)) {
         switch (pd->config[MCH_HOST_BRIDGE_ESMRAMC] &
                 MCH_HOST_BRIDGE_ESMRAMC_TSEG_SZ_MASK) {
         case MCH_HOST_BRIDGE_ESMRAMC_TSEG_SZ_1MB:
-- 
2.36.1



