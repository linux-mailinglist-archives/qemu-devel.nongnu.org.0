Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CD7525470
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 20:07:21 +0200 (CEST)
Received: from localhost ([::1]:56890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npDDc-00076T-Qv
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 14:07:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCZi-0005Cg-OH
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:26:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCZg-0005GX-MY
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:26:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652376364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BcNVyX9bFIn0tyHO78KSwxAwgrt1RIgGrefVJaTmEkM=;
 b=ZqtYT9X/UoaHfBSTBTiJhRuOo6K/9ClVZpHmmHiFcjupqg3gBpxyGpq1oxqFet5HWbqD0G
 HbRFoj1LkTgfgBfdNOfLj4qUrhQ3e+qNFdwwSMtUhsUG5+vnjBY7kXO6WjJo5Cfwp6wBiR
 Vle8XYpQPmQOYthkS0Peo8lpYCtXXfw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-0NTgCOdTPqeBUl5_OyR20g-1; Thu, 12 May 2022 13:26:03 -0400
X-MC-Unique: 0NTgCOdTPqeBUl5_OyR20g-1
Received: by mail-ed1-f71.google.com with SMTP id
 r30-20020a50d69e000000b00425e1e97671so3486674edi.18
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 10:26:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BcNVyX9bFIn0tyHO78KSwxAwgrt1RIgGrefVJaTmEkM=;
 b=0ZWRNa/kT8kJYJENKK4kne115L5lcG6qIpDXjF5BelCgUEFFUELCCPOWIIF5UeLqn5
 trVr4/6k1jI0nns1HvSPrD8oXO2uMX/UIzS0Vchvf/YZr6EfE68Mb5xfRxDMXDAbIINt
 tZJhDrOvMEJ36U2xGBtpJB0woJLpSOxCF39beiPJG4/Vj6C+/kmo00Ecs+BYO2lTlxTc
 p17O9Jac8XsjH/MjOi0msWfG7IVHPp7pFOnqaZCiCXgHBYEaxvYPvmB7qpOgq6tTNtvr
 n1Qi2lazwvzqA7SWJZHR1GBKbYTWUNMg7LpA78xfroIM2lkDtrO1KMBcrZWHIoTTkjLI
 EGOA==
X-Gm-Message-State: AOAM531EcabWlBQPy53vqSBhnPnHBRC8D2go5ffooo1xcGT1C+xpPIUy
 PZuCPQkRFnNJQnqotoMhzHFZKuBEaMyf0QvqOwLvQ6qxT0LAFWGhCSuKgNsje8FKWUXTYdOMcgn
 VjlVYXdjAyWaZLckKeNqlHbLouFS3fBbq0fsV0waNyurJNnlEDWF214J5XuT4qO4U4WQ=
X-Received: by 2002:a05:6402:3585:b0:427:ccd4:bec3 with SMTP id
 y5-20020a056402358500b00427ccd4bec3mr36497524edc.2.1652376361424; 
 Thu, 12 May 2022 10:26:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzb90kIjAObf7/57ETpSOsAIKjZ8m8nl/MdfKmTUNT95+Rei6sGkzhbtBrnx4+59O77lRkdTw==
X-Received: by 2002:a05:6402:3585:b0:427:ccd4:bec3 with SMTP id
 y5-20020a056402358500b00427ccd4bec3mr36497505edc.2.1652376361198; 
 Thu, 12 May 2022 10:26:01 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170906c20900b006f3ef214da7sm2413288ejz.13.2022.05.12.10.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 10:26:00 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kshitij Suri <kshitij.suri@nutanix.com>
Subject: [PULL 25/27] meson: link libpng independent of vnc
Date: Thu, 12 May 2022 19:25:03 +0200
Message-Id: <20220512172505.1065394-26-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220512172505.1065394-1-pbonzini@redhat.com>
References: <20220512172505.1065394-1-pbonzini@redhat.com>
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

From: Kshitij Suri <kshitij.suri@nutanix.com>

Currently png support is dependent on vnc for linking object file to
libpng. This commit makes the parameter independent of vnc as it breaks
system emulator with --disable-vnc unless --disable-png is added.

Fixes: 9a0a119a38 ("Added parameter to take screenshot with screendump as PNG", 2022-04-27)
Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>
Message-Id: <20220510161932.228481-1-kshitij.suri@nutanix.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 ui/meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/ui/meson.build b/ui/meson.build
index eba93b41e3..e9f48c5315 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -2,6 +2,7 @@ softmmu_ss.add(pixman)
 specific_ss.add(when: ['CONFIG_SOFTMMU'], if_true: pixman)   # for the include path
 specific_ss.add(when: ['CONFIG_SOFTMMU'], if_true: opengl)   # for the include path
 
+softmmu_ss.add(png)
 softmmu_ss.add(files(
   'clipboard.c',
   'console.c',
@@ -40,7 +41,7 @@ vnc_ss.add(files(
   'vnc-jobs.c',
   'vnc-clipboard.c',
 ))
-vnc_ss.add(zlib, png, jpeg, gnutls)
+vnc_ss.add(zlib, jpeg, gnutls)
 vnc_ss.add(when: sasl, if_true: files('vnc-auth-sasl.c'))
 softmmu_ss.add_all(when: vnc, if_true: vnc_ss)
 softmmu_ss.add(when: vnc, if_false: files('vnc-stubs.c'))
-- 
2.36.0


