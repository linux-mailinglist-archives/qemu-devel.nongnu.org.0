Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D515526755
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 18:44:30 +0200 (CEST)
Received: from localhost ([::1]:32934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npYOz-0003Hv-GO
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 12:44:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npXsp-00018M-6s
 for qemu-devel@nongnu.org; Fri, 13 May 2022 12:11:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npXsm-0004dO-P8
 for qemu-devel@nongnu.org; Fri, 13 May 2022 12:11:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652458272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OK0to00hZr33g+bacbdfmnWtmxWLDNzWz7vj6utljHg=;
 b=iWLvzmcwCf5RLSo9vK4z9ZmiUVsbjdw2WWmc+EoKWw9qbwRvm87HVAht6pbzG5aN5WYXBa
 /l/826IAekkikl3Z2Zj8ENKzsoJ9erjGLJH90RPyzX0ShZOpT3fE2ykuJ64IgTqXfYF5Xn
 EwJN8h46Fcoyzhys/+GnKtWa9wUcR8Q=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-2XU2-flROOidQENwOj16cQ-1; Fri, 13 May 2022 12:11:10 -0400
X-MC-Unique: 2XU2-flROOidQENwOj16cQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 v13-20020a170906b00d00b006f51e289f7cso4311906ejy.19
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 09:11:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OK0to00hZr33g+bacbdfmnWtmxWLDNzWz7vj6utljHg=;
 b=mP6jDGPjjd2SuOrj9ww73FMQ7XaleyoYE8XzG7gpzhoLjW5pdwqLAbAvwdNlUQ1M8c
 7nuNTkbAhisCHhClwgqy3t0ftxn9xC9tLiWb4lGG6vOiq7ELs5LKSCHjVWfcPyWV8rPP
 bY5gKhU7uPh47KH6jxA0XFDRmJKXg4Ha2Jx2UBLuEJkHWKKCssE+atQdpMfGqGVPl7vx
 P0xNtrS0nGEQTMxE0eQMH754XXWWMR1ge4b34L/va8KRgRymxtkFCFx5BsCyUta2u2d6
 +eJfTWOKZjQWrI/7hbOmye10wzco0N+suQIhGTuO66EeYSs/uXju0NyLgydWRLTROjVS
 EERw==
X-Gm-Message-State: AOAM531j3mlaoyEiMmOtgZ7SoRa2UecVgItqspQUeM+m1RvJhF13wYlk
 1WZsoRBeYrp805u3gyrX3Bb968W/UAnHQyIY1pSmx9XUd5AeJHU9iDg2WTCv28KUiPvYK6z17C+
 5kypsjbmBuBOc4rcymJtbYEkB+F58g4B8dVaSHxi6vazO/8yLseQEbH7q/pxNR7PydDk=
X-Received: by 2002:a17:907:7248:b0:6f4:34e4:fc63 with SMTP id
 ds8-20020a170907724800b006f434e4fc63mr5048000ejc.553.1652458269527; 
 Fri, 13 May 2022 09:11:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWJhdBCjmAZOcNkjVPYRMzpo3Rj+O8t85YFI1NfPUiQaZ2jJt9N0sKWjeQlc/F/RUAZ/sS9g==
X-Received: by 2002:a17:907:7248:b0:6f4:34e4:fc63 with SMTP id
 ds8-20020a170907724800b006f434e4fc63mr5047969ejc.553.1652458269224; 
 Fri, 13 May 2022 09:11:09 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 f2-20020a056402004200b0042617ba63c4sm1105401edu.78.2022.05.13.09.11.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 09:11:08 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] build: remove useless dependency
Date: Fri, 13 May 2022 18:11:07 +0200
Message-Id: <20220513161107.1125188-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
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

qemu-plugins.symbols is now processed in Meson.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Makefile b/Makefile
index e5fd1ebdf6..b842dbccdb 100644
--- a/Makefile
+++ b/Makefile
@@ -165,10 +165,7 @@ ifneq ($(filter $(ninja-targets), $(ninja-cmd-goals)),)
 endif
 endif
 
-# Force configure to re-run if the API symbols are updated
 ifeq ($(CONFIG_PLUGIN),y)
-config-host.mak: $(SRC_PATH)/plugins/qemu-plugins.symbols
-
 .PHONY: plugins
 plugins:
 	$(call quiet-command,\
-- 
2.36.0


