Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3363654DDFB
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 11:13:41 +0200 (CEST)
Received: from localhost ([::1]:45924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1lZL-0004uY-W4
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 05:13:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o1kw0-00021X-JF
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:33:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o1kvx-0002vN-VW
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:33:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655368377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wm4jV4ne6eRReZ+e1Hp0CzkELFz8F0VJafQcLc+3ApM=;
 b=WzSmccmKYwJIoXZPlO0wfkhQrYNwPazqytCYhF5L+8aRGBAO7ju/+1oZtj/3k1BJMCGF5t
 Ye0Z9JaBL0IldvMXZNckGoUKNtFIZSdiAmzK6vBr08wInUu8PnqElh3u4ONk5xt8xd1pgP
 zE4o5Rs15AyhQSRWGKiOw5YYuoo4yJc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-462-sC_TxZSgOdWGfFdxtwJKDA-1; Thu, 16 Jun 2022 04:32:55 -0400
X-MC-Unique: sC_TxZSgOdWGfFdxtwJKDA-1
Received: by mail-ej1-f72.google.com with SMTP id
 rs21-20020a170907037500b0070c40030f0aso310597ejb.20
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 01:32:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wm4jV4ne6eRReZ+e1Hp0CzkELFz8F0VJafQcLc+3ApM=;
 b=2Ukej3RzHxRFu9/URkujIbV20l4amDZgELfd4hbzJqPAWdkMQDgcs2Jn2nVF4P3uCY
 M6fOqFFVht4w51tPPrPB1WEojBkXCzhFkMk3HHMxcobCueNjsuzWfCqcrm6+8JTGEJdA
 Z34M+Fqgq3+enGRVZMOjEISOREjnRrWhVZ0Fojjn0Pe9mMX4+P1uHl8kYxgk99yfrKKO
 AmxD/3vDEI4GQOeF5dE79QBpF56KzanyWCMNzidihkXQDcuVIim6096nv+LdyB49evS9
 4VuCzsb4YeOihz6mhkQ7mlckNLHlCOvvX7wRsZ1IF0D6F/YEZL8GqAMb+z0+p602d62u
 4afQ==
X-Gm-Message-State: AJIora/Vq/agFosF4X2nirVTUwfennxGpRuRQkqkEkKI7vIvu2z9+fb5
 rYAwDIPi7IigwbYQw7ti7cyWAGo0/Jki3msnV0ySvc8eEnNy6okFIUc8hr8Dh+6B4dizC0nDrIT
 noG19APTkVbXHipg5KzU41YQO7ezkayipvzZMuwieG3Tgg/aQfhPoJS1naqjTXxOu/M8=
X-Received: by 2002:a17:906:5fc4:b0:715:ebe6:7415 with SMTP id
 k4-20020a1709065fc400b00715ebe67415mr3370544ejv.725.1655368374437; 
 Thu, 16 Jun 2022 01:32:54 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vQIV/hv8+h8oA1XXWxq7N6eVWZSflhW0/4qQ0SywFsqlKYrEiepqkyA+GlJSRxIR1CRnNQbA==
X-Received: by 2002:a17:906:5fc4:b0:715:ebe6:7415 with SMTP id
 k4-20020a1709065fc400b00715ebe67415mr3370524ejv.725.1655368374009; 
 Thu, 16 Jun 2022 01:32:54 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 qc23-20020a170906d8b700b006feb047502bsm477348ejb.151.2022.06.16.01.32.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 01:32:53 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/21] build: include pc-bios/ part in the ROMS variable
Date: Thu, 16 Jun 2022 10:32:09 +0200
Message-Id: <20220616083209.117397-22-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220616083209.117397-1-pbonzini@redhat.com>
References: <20220616083209.117397-1-pbonzini@redhat.com>
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

Include the full path in TARGET_DIR, so that messages from sub-Makefiles
are clearer.  Also, prepare for possibly building firmware outside
pc-bios/ from the Makefile,

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile  | 12 +++++-------
 configure |  6 +++---
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/Makefile b/Makefile
index 3c0d89057e..ec4445db9a 100644
--- a/Makefile
+++ b/Makefile
@@ -186,16 +186,14 @@ include $(SRC_PATH)/tests/Makefile.include
 
 all: recurse-all
 
-ROM_DIRS = $(addprefix pc-bios/, $(ROMS))
-ROM_DIRS_RULES=$(foreach t, all clean, $(addsuffix /$(t), $(ROM_DIRS)))
-# Only keep -O and -g cflags
-.PHONY: $(ROM_DIRS_RULES)
-$(ROM_DIRS_RULES):
+ROMS_RULES=$(foreach t, all clean, $(addsuffix /$(t), $(ROMS)))
+.PHONY: $(ROMS_RULES)
+$(ROMS_RULES):
 	$(call quiet-command,$(MAKE) $(SUBDIR_MAKEFLAGS) -C $(dir $@) V="$(V)" TARGET_DIR="$(dir $@)" $(notdir $@),)
 
 .PHONY: recurse-all recurse-clean
-recurse-all: $(addsuffix /all, $(ROM_DIRS))
-recurse-clean: $(addsuffix /clean, $(ROM_DIRS))
+recurse-all: $(addsuffix /all, $(ROMS))
+recurse-clean: $(addsuffix /clean, $(ROMS))
 
 ######################################################################
 
diff --git a/configure b/configure
index 9fba134746..a4d61fe504 100755
--- a/configure
+++ b/configure
@@ -2236,7 +2236,7 @@ if test -n "$target_cc" &&
         fi
     done
     if test -n "$ld_i386_emulation"; then
-        roms="optionrom"
+        roms="pc-bios/optionrom"
         config_mak=pc-bios/optionrom/config.mak
         echo "# Automatically generated by configure - do not modify" > $config_mak
         echo "TOPSRC_DIR=$source_path" >> $config_mak
@@ -2247,7 +2247,7 @@ fi
 
 probe_target_compilers ppc ppc64
 if test -n "$target_cc" && test "$softmmu" = yes; then
-    roms="$roms vof"
+    roms="$roms pc-bios/vof"
     config_mak=pc-bios/vof/config.mak
     echo "# Automatically generated by configure - do not modify" > $config_mak
     echo "SRC_DIR=$source_path/pc-bios/vof" >> $config_mak
@@ -2266,7 +2266,7 @@ if test -n "$target_cc" && test "$softmmu" = yes; then
       echo "WARNING: Your compiler does not support the z900!"
       echo "         The s390-ccw bios will only work with guest CPUs >= z10."
     fi
-    roms="$roms s390-ccw"
+    roms="$roms pc-bios/s390-ccw"
     config_mak=pc-bios/s390-ccw/config-host.mak
     echo "# Automatically generated by configure - do not modify" > $config_mak
     echo "SRC_PATH=$source_path/pc-bios/s390-ccw" >> $config_mak
-- 
2.36.1


