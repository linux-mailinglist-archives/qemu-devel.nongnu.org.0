Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5D85A1CD2
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 00:55:54 +0200 (CEST)
Received: from localhost ([::1]:40242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRLlR-0004nr-CQ
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 18:55:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRLKl-000321-6N
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:28:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRLKj-0004gN-9P
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:28:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661466496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ydca63mNOQMKEHzrp19/VKhkot84wtSJ5aP+5gJP3wA=;
 b=Ye79bDjf51N3NVSCfHNyWWGMWhRqutoXnvTpTf5ZrMCEMPKdonPDsO6uNCzfGv1zAeVIX/
 wsWXZVMQcBYFaKJa3nwe6fSEw3Yk/9XyXXNzMGKCf3CTMyyGmX9hPgppUDvNFeB3E1qVvo
 9ktzAwfF2QpR/s/VjFXiViSdiyi7LKU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-84-kfXTL2HTMQmWJsF_h4UEbQ-1; Thu, 25 Aug 2022 18:28:15 -0400
X-MC-Unique: kfXTL2HTMQmWJsF_h4UEbQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 v67-20020a1cac46000000b003a615c4893dso11489669wme.3
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 15:28:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=ydca63mNOQMKEHzrp19/VKhkot84wtSJ5aP+5gJP3wA=;
 b=MVt+AiVzX1qYClCAAbX4G1i55fPMnTg8ZArjz6Yo8fQYAfsUblOR2aBlCcvZwAD5wv
 s6/hVhLu3NTg3NpyDfos6x2WF4xIMl9D0PdYsiD/5GFGWWXnWTQgVJGpKI4Q6tZPYzWK
 mkuEsU/e6CiIblfbNAeSe+REUAEzQXYAwI7js9zBdLwONO5zmiZNQ0JOsiy0n0Cj6xFG
 /po26ybsprwnoAH4GFRs7tWmD7AHkTON9LZMCyQo4qOUSc54WobWc4P1RTl5H7lmbutI
 PMcfq7ZsWWpNjsY/JMarZLnkrJdy3ggvS3jlL6CrFuOM1TzBn6v3lB/CEq9yJTGnZNeb
 guKA==
X-Gm-Message-State: ACgBeo0WbHImgUmw0hPDd+wuL4vPuxQmr/GEelRcWh8oTeetQ9fPONBu
 uqPT4j6n7HeepJtCJuvT+yDTIhlbMB9Qs4qfcsm2UtF02v2Ccypuk2GZkmYbj5A3kLky7fvVZrv
 W6yElwcrRVHydRCndcCCFxrrLiGMk4iHEtePLS53crDPS/ezENiuhKkdYxcRxIZXXc/4=
X-Received: by 2002:a5d:6d0c:0:b0:225:4ff9:7e67 with SMTP id
 e12-20020a5d6d0c000000b002254ff97e67mr3423785wrq.534.1661466494171; 
 Thu, 25 Aug 2022 15:28:14 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4UCAzLsIfaUE7TEFOIwf8zzu0mbERgq1wN0KU7kzqwNCemfOP5Q0Ou8pQ7InxChDnOlCDkvw==
X-Received: by 2002:a5d:6d0c:0:b0:225:4ff9:7e67 with SMTP id
 e12-20020a5d6d0c000000b002254ff97e67mr3423772wrq.534.1661466493821; 
 Thu, 25 Aug 2022 15:28:13 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 w2-20020a05600018c200b0021efc75914esm316310wrq.79.2022.08.25.15.28.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 15:28:13 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH 18/20] pc-bios/optionrom: Adopt meson style Make output
Date: Fri, 26 Aug 2022 00:27:43 +0200
Message-Id: <20220825222745.38779-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220825222745.38779-1-pbonzini@redhat.com>
References: <20220825222745.38779-1-pbonzini@redhat.com>
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 pc-bios/optionrom/Makefile | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/pc-bios/optionrom/Makefile b/pc-bios/optionrom/Makefile
index f514e4f84b..b1fff0ba6c 100644
--- a/pc-bios/optionrom/Makefile
+++ b/pc-bios/optionrom/Makefile
@@ -12,8 +12,8 @@ NULL :=
 SPACE := $(NULL) #
 TARGET_PREFIX := $(patsubst %/,%:$(SPACE),$(TARGET_DIR))
 
-quiet-@ = $(if $(V),,@)
-quiet-command = $(if $(V),$1,$(if $(2),@printf "  %-7s %s\n" $2 $3 && $1, @$1))
+quiet-@ = $(if $(V),,@$(if $1,printf "%s\n" "$(TARGET_PREFIX)$1" && ))
+quiet-command = $(call quiet-@,$2 $@)$1
 
 # Flags for dependency generation
 override CPPFLAGS += -MMD -MP -MT $@ -MF $(@D)/$(*F).d
@@ -41,19 +41,19 @@ override LDFLAGS = -nostdlib -Wl,-T,$(SRC_DIR)/flat.lds
 pvh.img: pvh.o pvh_main.o
 
 %.o: %.S
-	$(call quiet-command,$(CC) $(CPPFLAGS) $(CFLAGS) -c -o $@ $<,"AS","$@")
+	$(call quiet-command,$(CC) $(CPPFLAGS) $(CFLAGS) -c -o $@ $<,Assembling)
 
 %.o: %.c
-	$(call quiet-command,$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@,"CC","$@")
+	$(call quiet-command,$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@,Compiling)
 
 %.img: %.o
-	$(call quiet-command,$(CC) $(CFLAGS) $(LDFLAGS) -s -o $@ $^,"BUILD","$@")
+	$(call quiet-command,$(CC) $(CFLAGS) $(LDFLAGS) -s -o $@ $^,Linking)
 
 %.raw: %.img
-	$(call quiet-command,$(OBJCOPY) -O binary -j .text $< $@,"BUILD","$@")
+	$(call quiet-command,$(OBJCOPY) -O binary -j .text $< $@,Extracting raw object)
 
 %.bin: %.raw
-	$(call quiet-command,$(PYTHON) $(TOPSRC_DIR)/scripts/signrom.py $< $@,"SIGN","$@")
+	$(call quiet-command,$(PYTHON) $(TOPSRC_DIR)/scripts/signrom.py $< $@,Computing checksum into)
 
 include $(wildcard *.d)
 
-- 
2.37.1



