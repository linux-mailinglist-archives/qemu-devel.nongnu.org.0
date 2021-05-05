Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6CF3749FB
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 23:16:11 +0200 (CEST)
Received: from localhost ([::1]:55774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leOsM-0005e2-SX
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 17:16:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leOnY-0008Fp-Rj
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:11:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leOnU-0004BN-Dj
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:11:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620249067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jDbW5AjqVLLqIRW+qjBQwi317+pzRCZswt2T1a+tgz4=;
 b=KHDdeDe1m6Zrj54XHU2pDNFXJkOU/N721eZc7/SBQXw+Cc6aTgAWJrMRAka9JTocGVxnyQ
 D11Xn2qPizNBpCplJvC8/J9yCF/pi+KeukQX/ImAA68DxNau7mY6ZhtpCjZmJZUE1dRAoG
 P3lMiInHM/lBUeC7ytUhTw/Dt2CgRAE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-2fGPp7LqPBidA81VxMuPcQ-1; Wed, 05 May 2021 17:11:06 -0400
X-MC-Unique: 2fGPp7LqPBidA81VxMuPcQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 o10-20020a05600c4fcab029014ae7fdec90so706489wmq.5
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 14:11:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jDbW5AjqVLLqIRW+qjBQwi317+pzRCZswt2T1a+tgz4=;
 b=ubnkVniNa2DvXGeE86Vx5kTE6qWIVTYsEW5sNX9buss7hayx1qhUy2Tl5pHSddS20k
 GfdOpav2NJ4tKabieJDb91xgOhf2n3c/5aVoMzHTZXB7lL6VZF/iUjEXAtDMQ7Bjd8hi
 cBYRjSOIIuLJfMxwMyKT9Fm+fxRjMl0oaD7oiDiVzXOtT8nPI4DvMOq5zLKE7isUapUj
 2dAk1jXoFxKHetuMBhTsm5jcBW+xmxrv04yEu1AkLtQtbmRJnEB+gstlMQQx7Ew/d+Qm
 1PCzO8N/LTkC9zo8v3ZjMVbcY1aC3WTURECurgj4JuMq3JPer+AUWwkElVZQDjq7Tv9e
 KWtQ==
X-Gm-Message-State: AOAM532oTJG2+Z+6fuaZFya4OXJ7rW0ELYm8xMVLAf4e5vU4zbZpp14N
 AsacqSswOyH6mz3ytsNnPGAgxbsLLqqo2SmsteqAq4j86+o+fzfnYkn1G9jLbAKn7C2kmzJBWk3
 CwogW6g4HiHEUZjG9sbjGzJSiwH2t8cWFNpru/rS0REKt/vl7emv3BJwCaA8dPFpE
X-Received: by 2002:a1c:750b:: with SMTP id o11mr12022989wmc.188.1620249064811; 
 Wed, 05 May 2021 14:11:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOEPOao+qykKQIphPjsuJSYjxkn/EPllDV0Z2ZMqGBHfz+R9Qb+afafsKtq+M5cPi7UKuSqg==
X-Received: by 2002:a1c:750b:: with SMTP id o11mr12022964wmc.188.1620249064582; 
 Wed, 05 May 2021 14:11:04 -0700 (PDT)
Received: from x1w.redhat.com
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id o1sm4073966wmc.6.2021.05.05.14.11.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 14:11:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/23] chardev/baum: Use definitions to avoid dynamic stack
 allocation
Date: Wed,  5 May 2021 23:10:27 +0200
Message-Id: <20210505211047.1496765-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210505211047.1496765-1-philmd@redhat.com>
References: <20210505211047.1496765-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We know 'x * y' will be at most 'X_MAX * Y_MAX' (which is not
a big value, it is actually 84). Instead of having the compiler
use variable-length array, declare an array able to hold the
maximum 'x * y'.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 chardev/baum.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/chardev/baum.c b/chardev/baum.c
index adc3d7b3b56..0822e9ed5f3 100644
--- a/chardev/baum.c
+++ b/chardev/baum.c
@@ -383,9 +383,9 @@ static int baum_eat_packet(BaumChardev *baum, const uint8_t *buf, int len)
     switch (req) {
     case BAUM_REQ_DisplayData:
     {
-        uint8_t cells[baum->x * baum->y], c;
-        uint8_t text[baum->x * baum->y];
-        uint8_t zero[baum->x * baum->y];
+        uint8_t cells[X_MAX * Y_MAX], c;
+        uint8_t text[X_MAX * Y_MAX];
+        uint8_t zero[X_MAX * Y_MAX];
         int cursor = BRLAPI_CURSOR_OFF;
         int i;
 
@@ -408,7 +408,7 @@ static int baum_eat_packet(BaumChardev *baum, const uint8_t *buf, int len)
         }
         timer_del(baum->cellCount_timer);
 
-        memset(zero, 0, sizeof(zero));
+        memset(zero, 0, baum->x * baum->y);
 
         brlapi_writeArguments_t wa = {
             .displayNumber = BRLAPI_DISPLAY_DEFAULT,
-- 
2.26.3


