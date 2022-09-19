Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 832925BD450
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 20:00:47 +0200 (CEST)
Received: from localhost ([::1]:56942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaL4Y-0000YE-JC
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 14:00:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaKgB-0003Ko-PH
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:35:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaKg5-0003CS-LN
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:35:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663608929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pj4YI1EbEjLq11Ta/hqOEQN7kn7r7RkoCyk4aYS+xIw=;
 b=OdbIeAKLWrziv+2oJFCvSEXUXI4dIU+kg+JbygxlSPsewaa9NOzasS2zTWt4xQ6PPbqFoQ
 DwcpM3CFQc8zTKQzfoHoq6iQcaAWvOovMY85Gry80HaxL3rUVIBIDlEoyEuq4ZIHooAGvR
 2A9xuj8wqb8QEEkZV8LB/l+KO7GZcYg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-489-k0S-C065M1eO4wXkk79ROA-1; Mon, 19 Sep 2022 13:35:27 -0400
X-MC-Unique: k0S-C065M1eO4wXkk79ROA-1
Received: by mail-wr1-f70.google.com with SMTP id
 d30-20020adfa41e000000b00228c0e80c49so29328wra.21
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 10:35:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Pj4YI1EbEjLq11Ta/hqOEQN7kn7r7RkoCyk4aYS+xIw=;
 b=APM2WoytMobY5QuSN0IBo/lh21u5kdP4npu3XclRSNWulgc5zg+EudEazsBC1hvGbA
 A+uGahSFpkFbo0va3YlrPkz9reZGV+HGMhGN+FClM9nBJ2oOJGO0L2nBZcMYZJxZdYKg
 TFL3OuBD1IwtjeGf7IpeOd8C+kgRLjnfP1jHRzsiHC576PlNiWtDQTfgwQ+Skf1F0jjv
 sJu8ykeW1ft9nkXBeU309yTJDEpNfxsTGkEv4d07qp+zYxRutuRmn+poVrnSaZVA5Gsr
 rSLkHyLi310axpvDysMO/5pb/hHxpQD5rxC0PlZhB1Ha2D+x671+cmt8nCOUeVbLNmmT
 Loew==
X-Gm-Message-State: ACrzQf2fGMUkcuVy67ubAuwEq+6V9t2KVxMRvJhBxipSxNZN2Rjxl2OS
 Y1E15m/pLLILcsd9PWdGnxxoIsrEImXJ0QfooTHbLgdVU7h7R8R15HT3/H08NzHJZ1zJWrPYSuu
 WbePGs0ALWwaCrfoEM8SW8B/daA5McFujCmvLXvaru0FrN/pbuOFnXHJUjpD+wbSN6Ns=
X-Received: by 2002:a05:600c:34c6:b0:3b4:9643:e46d with SMTP id
 d6-20020a05600c34c600b003b49643e46dmr13445349wmq.9.1663608926480; 
 Mon, 19 Sep 2022 10:35:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7+2U49tGC1lVZQ9BuOXQo+MmRJMyl+0IPuRrqkoAvM5/PGatb9+XTMvxIE3XXsM575bFW1kg==
X-Received: by 2002:a05:600c:34c6:b0:3b4:9643:e46d with SMTP id
 d6-20020a05600c34c600b003b49643e46dmr13445330wmq.9.1663608926090; 
 Mon, 19 Sep 2022 10:35:26 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 a3-20020a056000100300b00228b3ff1f5dsm16593778wrx.117.2022.09.19.10.35.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 10:35:25 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>
Subject: [PULL 21/21] qboot: update to latest submodule
Date: Mon, 19 Sep 2022 19:34:49 +0200
Message-Id: <20220919173449.5864-22-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220919173449.5864-1-pbonzini@redhat.com>
References: <20220919173449.5864-1-pbonzini@redhat.com>
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
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Include patch "Place setup_data at location specified by host"
from Jason A. Donenfeld.

Cc: Jason A. Donenfeld <Jason@zx2c4.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 roms/qboot | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/roms/qboot b/roms/qboot
index a5300c4949..8ca302e86d 160000
--- a/roms/qboot
+++ b/roms/qboot
@@ -1 +1 @@
-Subproject commit a5300c4949b8d4de2d34bedfaed66793f48ec948
+Subproject commit 8ca302e86d685fa05b16e2b208888243da319941
-- 
2.37.2


