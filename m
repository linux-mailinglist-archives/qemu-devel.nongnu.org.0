Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFF25253B0
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 19:30:36 +0200 (CEST)
Received: from localhost ([::1]:43326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npCe2-0000V7-Kc
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 13:30:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCYu-0004uB-Tb
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:25:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCYt-00054f-9z
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:25:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652376314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fXlwemrbSAom/pGYNc3f7pFbqngXibN4G33CRsyLZCc=;
 b=d6HCiGUEpzUVzoWTh3Hdq14W1Xpa8Kun4aIXdOHjOOjMmhkdgFyGDdu1I40k4hExbqplS+
 lu7vifLPjk7U88L/CbqYZqJ84d81aFFqC5AR51826qRUHI47fHO5+FHbPE5QzPSZlFjBzr
 M/lEq9kATQfO4IkF3L3t8d0rFFiczdo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-119-jZFeWz6kMy2WU9gT0EOX3A-1; Thu, 12 May 2022 13:25:12 -0400
X-MC-Unique: jZFeWz6kMy2WU9gT0EOX3A-1
Received: by mail-ed1-f72.google.com with SMTP id
 s29-20020a50ab1d000000b00427e495f00cso3476291edc.14
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 10:25:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fXlwemrbSAom/pGYNc3f7pFbqngXibN4G33CRsyLZCc=;
 b=uIairYwfA8jTCMenLA3CgYHW1L4q1BiECQP0JQlObeHmaiEf3yjgP2oR47oVB00+Zt
 HgywLafhFJra8OdPXGVLXgsEyx23kPS3eH2/mu7ByLgrLL2ahlR+MmtXDgDCgPea1RnA
 B9QzwpIGnK53TDGiKTGzWAVK/ZcQb9KHTOkxowVk+mfl0kQFk64d8CdMum3XnG5FQZlP
 Rij8fG12Tpp0RMd6X/DKqqDAynLhB5A0ITediR73su8prJuVqyxmJ2GBG3YaIK4p/1mU
 //w/AqFOprDG54EcUImEN3s1u7pzCaXEF4WzIjluJA9sefyLk4kVxCwX63EecazDTfwa
 4Vew==
X-Gm-Message-State: AOAM531QB9kiR+3TTgjkmIMSKMUdtEhYjyXYM6Ixm66Ek1zKyLrOvilT
 X26NoEH1uDV4vT3ekFC02pH7QdpNtLuju8wRToBITMshjeBLW+YK85lXVkaYcvuUta42QvtfP4Y
 m/8nwLjgXwjVCQKtTZWy1gBEM2aGCfhkxNo35/sc+O6lFLhyihldyiluiTpNk5lG4i2Y=
X-Received: by 2002:a05:6402:3226:b0:427:cef3:9fb3 with SMTP id
 g38-20020a056402322600b00427cef39fb3mr35945900eda.20.1652376311186; 
 Thu, 12 May 2022 10:25:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZ1ZGiJXuMwbqV1fzqkE4zoP/IFwcLyuR2XaGAo1YwVTRMLYcich8II0y4MUHdtRI5rKchmQ==
X-Received: by 2002:a05:6402:3226:b0:427:cef3:9fb3 with SMTP id
 g38-20020a056402322600b00427cef39fb3mr35945865eda.20.1652376310831; 
 Thu, 12 May 2022 10:25:10 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a50cdcb000000b0042617ba63c9sm2795656edj.83.2022.05.12.10.25.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 10:25:10 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 01/27] pc-bios/optionrom: detect -fno-pie
Date: Thu, 12 May 2022 19:24:39 +0200
Message-Id: <20220512172505.1065394-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220512172505.1065394-1-pbonzini@redhat.com>
References: <20220512172505.1065394-1-pbonzini@redhat.com>
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

Do not rely on the detection that was done in the configure script,
since in the future we may want to cross-compile this file.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                  | 1 -
 pc-bios/optionrom/Makefile | 3 ++-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index e77b29b093..c8b5b99532 100755
--- a/configure
+++ b/configure
@@ -2038,7 +2038,6 @@ echo "CCAS=$ccas" >> $config_host_mak
 echo "CPP=$cpp" >> $config_host_mak
 echo "OBJCOPY=$objcopy" >> $config_host_mak
 echo "LD=$ld" >> $config_host_mak
-echo "CFLAGS_NOPIE=$CFLAGS_NOPIE" >> $config_host_mak
 echo "QEMU_CFLAGS=$QEMU_CFLAGS" >> $config_host_mak
 echo "QEMU_CXXFLAGS=$QEMU_CXXFLAGS" >> $config_host_mak
 echo "QEMU_OBJCFLAGS=$QEMU_OBJCFLAGS" >> $config_host_mak
diff --git a/pc-bios/optionrom/Makefile b/pc-bios/optionrom/Makefile
index f1ef898073..8de5a9461c 100644
--- a/pc-bios/optionrom/Makefile
+++ b/pc-bios/optionrom/Makefile
@@ -22,7 +22,8 @@ override CFLAGS += $(call cc-option, -fcf-protection=none)
 override CPPFLAGS += -MMD -MP -MT $@ -MF $(@D)/$(*F).d
 
 override CFLAGS += $(filter -W%, $(QEMU_CFLAGS))
-override CFLAGS += $(CFLAGS_NOPIE) -ffreestanding -I$(TOPSRC_DIR)/include
+override CFLAGS += $(call cc-option, -fno-pie)
+override CFLAGS += -ffreestanding -I$(TOPSRC_DIR)/include
 override CFLAGS += $(call cc-option, -fno-stack-protector)
 override CFLAGS += $(call cc-option, -m16)
 
-- 
2.36.0


