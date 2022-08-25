Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C150C5A1C96
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 00:42:30 +0200 (CEST)
Received: from localhost ([::1]:42786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRLYT-0001Pa-Lh
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 18:42:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRLKT-00027a-Rb
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:28:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRLKP-0004XU-Sk
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:28:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661466477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RbTm3+juZB9gyf2Xqko128b+NY8WaTbMZFo/sMmGgGU=;
 b=SCPN2LVJFoDFBzQbiV0rC+TRCJeOviawBtGKzJN1vEy1jY82m1X0LPfUm7Vvl4XzBzsjGU
 pt9f8wViketMDE111acr/8Mnbj5nyWcxUeVqrlomsadPXWVsAdYj/d/dFpk+bdjpQleM2/
 9CmkMnrxpPJH8MenhzDGUn5orfY4IcQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-625-j4t9DwPYPpOaVGZA2YUiEA-1; Thu, 25 Aug 2022 18:27:55 -0400
X-MC-Unique: j4t9DwPYPpOaVGZA2YUiEA-1
Received: by mail-wr1-f72.google.com with SMTP id
 u25-20020adfa199000000b002257fb95920so620311wru.1
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 15:27:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=RbTm3+juZB9gyf2Xqko128b+NY8WaTbMZFo/sMmGgGU=;
 b=D9KnmP4oVIyFu84xJ8n4U3OQIbxKkDMniVw4cFMzBIbmZ3g+cuNj/pJYZ9PNiCRLME
 XAaw3tpbrD29F/G4aN85aW6xI4GPNnnwXxw/jJ8uRFyutsjIIwl3zx1QJK3jhvbljeit
 iJWCwh8Oluv+zmZR5WGqJ8KgECkTP12mRWwEQEeAhqZSSwcXu3rZw28LUG8nHwM0XQ0b
 x8XhM3d6oMz65rsGAW/IPqnw/B8uIZvcduzjUP5wZD2k+Q/YDgTF1tBvW0L/rKJp6EOs
 Z6bsboVamxaGy00EGG7OxIsJkJkgflf6nmg1DMB0U+ztVrSMRI3KHb7Vn8/bEgWuJd4m
 TmHw==
X-Gm-Message-State: ACgBeo2VB6I1cKza/HsOTF8erOmWhgudDicEFMunvWDyjwQSNjY+ePuS
 KV0ff3Fm7CJtk/3SVL+JTom2T6V4rZOhnllTEr6ivdahuai3z691JoHKfmnG0amNU9QUp/argn2
 JUEpwawGOYRG4bAkwHzBn4mgHysJ2ZP8seHDWkIkBkXBZOpiaoH/HDrF1hktxkLEy0zs=
X-Received: by 2002:a5d:634f:0:b0:225:2ab4:d539 with SMTP id
 b15-20020a5d634f000000b002252ab4d539mr3257026wrw.149.1661466474524; 
 Thu, 25 Aug 2022 15:27:54 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4IOgmmHson7CWj9J+Vyj6RLz2Sy5FTsnS8TMsGX19Wnf0OGCamKRbwfpzBmMKN0mq4AEak4A==
X-Received: by 2002:a5d:634f:0:b0:225:2ab4:d539 with SMTP id
 b15-20020a5d634f000000b002252ab4d539mr3257015wrw.149.1661466474230; 
 Thu, 25 Aug 2022 15:27:54 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 v124-20020a1cac82000000b003a342933727sm6683355wme.3.2022.08.25.15.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 15:27:53 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH 05/20] build: add recursive distclean rules
Date: Fri, 26 Aug 2022 00:27:30 +0200
Message-Id: <20220825222745.38779-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220825222745.38779-1-pbonzini@redhat.com>
References: <20220825222745.38779-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 13234f2aa4..ef0fbb4dee 100644
--- a/Makefile
+++ b/Makefile
@@ -186,7 +186,7 @@ include $(SRC_PATH)/tests/Makefile.include
 
 all: recurse-all
 
-ROMS_RULES=$(foreach t, all clean, $(addsuffix /$(t), $(ROMS)))
+ROMS_RULES=$(foreach t, all clean distclean, $(addsuffix /$(t), $(ROMS)))
 .PHONY: $(ROMS_RULES)
 $(ROMS_RULES):
 	$(call quiet-command,$(MAKE) $(SUBDIR_MAKEFLAGS) -C $(dir $@) V="$(V)" TARGET_DIR="$(dir $@)" $(notdir $@),)
@@ -194,6 +194,7 @@ $(ROMS_RULES):
 .PHONY: recurse-all recurse-clean
 recurse-all: $(addsuffix /all, $(ROMS))
 recurse-clean: $(addsuffix /clean, $(ROMS))
+recurse-distclean: $(addsuffix /distclean, $(ROMS))
 
 ######################################################################
 
@@ -214,7 +215,7 @@ dist: qemu-$(VERSION).tar.bz2
 qemu-%.tar.bz2:
 	$(SRC_PATH)/scripts/make-release "$(SRC_PATH)" "$(patsubst qemu-%.tar.bz2,%,$@)"
 
-distclean: clean
+distclean: clean recurse-distclean
 	-$(quiet-@)test -f build.ninja && $(NINJA) $(NINJAFLAGS) -t clean -g || :
 	rm -f config-host.mak qemu-bundle
 	rm -f tests/tcg/config-*.mak
-- 
2.37.1



