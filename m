Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0E9529E03
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 11:29:44 +0200 (CEST)
Received: from localhost ([::1]:54138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqtWR-0002PL-6D
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 05:29:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqtTJ-00080M-FQ
 for qemu-devel@nongnu.org; Tue, 17 May 2022 05:26:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqtTF-0003XD-Ua
 for qemu-devel@nongnu.org; Tue, 17 May 2022 05:26:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652779585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uoPUcf+gWzkzUbBnPNYFnx3ClJ6pvlzZxwCJ6+UrUr0=;
 b=Hacl8WNC5sz0nLtg4KQThkwlj/vSRpE/uDR3zF8HCTmVj/r8WsZmIXS9N8QSuBEhITfkXU
 0IUrsGWz8MK4/lP47xTA8c33fDhmiSJfcENLDtRlj/xP0mihyvKnkTKjoVqzsd3nfC6lZq
 3/0DIRp0hsVlP1N4YtwxS5G1Mlq7eA0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-s6JVDbg3P86wqD0Jhzj1ZQ-1; Tue, 17 May 2022 05:26:24 -0400
X-MC-Unique: s6JVDbg3P86wqD0Jhzj1ZQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 qw30-20020a1709066a1e00b006f45e7f44b0so7064549ejc.5
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 02:26:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uoPUcf+gWzkzUbBnPNYFnx3ClJ6pvlzZxwCJ6+UrUr0=;
 b=E9AOMjUy3lcu1Q1+L/10aRKfL+WiaNdiKzU0XL444fOmoyxZ6C2109MTKRE9vEsBKO
 HRV0N+7udQRop0U8Qpgp22g+efTeiCLgIeylIYz6FGAhaAgFWUZ9LcUaBWBEtzqjc/7M
 1yn8r1Ln2WfR2xfkXbhv3JVhxfKIx5n9mv2suxfhFS+yP2ke7GAKNWS3d43T/oFxcJvY
 FgN9QSRPj392+SK9oKXKJveoBi/uK68Keyr0+s7ATie7e6W5cHDyadATXhcckz7HkvWk
 5Zv8/BUkHP9YaIncnW3XaZAnXmPRSVo08sRd+cHiCrQSAbMuEUvQBS4Qa1QE+U8kqfHm
 YP4w==
X-Gm-Message-State: AOAM530zsJkdCn1JRJx9rgdG/k5HmjXY9PsPk/h3GBNsEsFapgvuN8+k
 us70JelqUNW4S/DTR4M0b0q082Ny/lIBTjD18f5rA2hTsGEg+ZT99s7XheyUDFFwyWQ+8B+gClG
 pBsazWlTKgKebQVnyxqiMSDzxsAtxpyyAsuPklc82KQ4BTmvCYoT73EPzidSNjOfnHjQ=
X-Received: by 2002:a17:907:1c87:b0:6f0:29ea:cc01 with SMTP id
 nb7-20020a1709071c8700b006f029eacc01mr18876273ejc.671.1652779582425; 
 Tue, 17 May 2022 02:26:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCSejIFfgSZIIKBQFXi7zn6Pg2RPG4tjQ9v9pPzmZlVJ4J3g+S7X2Pbxbz13h98u59jZf3Kw==
X-Received: by 2002:a17:907:1c87:b0:6f0:29ea:cc01 with SMTP id
 nb7-20020a1709071c8700b006f029eacc01mr18876256ejc.671.1652779582190; 
 Tue, 17 May 2022 02:26:22 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 my35-20020a1709065a6300b006f3ef214de2sm806007ejc.72.2022.05.17.02.26.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 02:26:21 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	richard.henderson@linaro.org
Subject: [PATCH 01/16] configure: do not define or use the CPP variable
Date: Tue, 17 May 2022 11:26:01 +0200
Message-Id: <20220517092616.1272238-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220517092616.1272238-1-pbonzini@redhat.com>
References: <20220517092616.1272238-1-pbonzini@redhat.com>
MIME-Version: 1.0
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

Just hardcode $(CC) -E, it should be enough.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                  | 3 ---
 pc-bios/optionrom/Makefile | 2 +-
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/configure b/configure
index 0cc8c876f7..4c8954feea 100755
--- a/configure
+++ b/configure
@@ -378,7 +378,6 @@ fi
 ar="${AR-${cross_prefix}ar}"
 as="${AS-${cross_prefix}as}"
 ccas="${CCAS-$cc}"
-cpp="${CPP-$cc -E}"
 objcopy="${OBJCOPY-${cross_prefix}objcopy}"
 ld="${LD-${cross_prefix}ld}"
 ranlib="${RANLIB-${cross_prefix}ranlib}"
@@ -2030,7 +2029,6 @@ echo "CC=$cc" >> $config_host_mak
 echo "AR=$ar" >> $config_host_mak
 echo "AS=$as" >> $config_host_mak
 echo "CCAS=$ccas" >> $config_host_mak
-echo "CPP=$cpp" >> $config_host_mak
 echo "OBJCOPY=$objcopy" >> $config_host_mak
 echo "LD=$ld" >> $config_host_mak
 echo "QEMU_CFLAGS=$QEMU_CFLAGS" >> $config_host_mak
@@ -2273,7 +2271,6 @@ preserve_env() {
 preserve_env AR
 preserve_env AS
 preserve_env CC
-preserve_env CPP
 preserve_env CFLAGS
 preserve_env CXX
 preserve_env CXXFLAGS
diff --git a/pc-bios/optionrom/Makefile b/pc-bios/optionrom/Makefile
index 2494ad9c25..17ccc76241 100644
--- a/pc-bios/optionrom/Makefile
+++ b/pc-bios/optionrom/Makefile
@@ -50,7 +50,7 @@ override LDFLAGS = -m $(LD_I386_EMULATION) -T $(SRC_DIR)/flat.lds
 pvh.img: pvh.o pvh_main.o
 
 %.o: %.S
-	$(call quiet-command,$(CPP) $(CPPFLAGS) -c -o - $< | $(AS) $(ASFLAGS) -o $@,"AS","$@")
+	$(call quiet-command,$(CC) $(CPPFLAGS) -E -o - $< | $(AS) $(ASFLAGS) -o $@,"AS","$@")
 
 %.o: %.c
 	$(call quiet-command,$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@,"CC","$@")
-- 
2.36.0


