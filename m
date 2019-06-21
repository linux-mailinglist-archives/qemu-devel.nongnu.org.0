Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7B34DF06
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 04:10:59 +0200 (CEST)
Received: from localhost ([::1]:54154 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1he911-000068-4A
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 22:10:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41124)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <paolo.bonzini@gmail.com>) id 1he8a4-0006bX-5F
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 21:43:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1he8a2-0006b9-88
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 21:43:07 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:42904)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1he8Zz-0006PG-UB
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 21:43:05 -0400
Received: by mail-wr1-x42c.google.com with SMTP id x17so4853678wrl.9
 for <qemu-devel@nongnu.org>; Thu, 20 Jun 2019 18:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H+GIX/ew7P3W1KtFZyQEoH7Aekz0PvrQKasKssVk2dE=;
 b=UQqN+g+rGVJFiDtwxSCJ/I5UCMAg0iWU98+JJfS37weqiSaGUgVF3gpEtGRus4Nc3g
 4IZ+1b+VwZYdn8m0C7kP78X5CAGub149gjaqJ32uH3jFTrL4ewu0iH3vVn+N5anj468V
 eWOAST9kUjg7n7YLi7zam6dAncsprTI4HShQCAyoYCIIO37xYMT92TgzvAi1mEcohbeI
 esNePagtKBzZ7fj0GJ6HUnWpHeOrCoGCfvvRIjpcESCkwNYVfF3qDFEhAiMjjq8+9cwH
 jlh0i1tOG4Ihb9zpa2wHgOZuK6vteIHogvWBLEq1qu8MsuWcKyfkB+4NGowBeMMUX1rY
 v2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=H+GIX/ew7P3W1KtFZyQEoH7Aekz0PvrQKasKssVk2dE=;
 b=CrOU1xafyi5MSx+gzGO0tFKKn3l48/tiw1thG1vgqgR3T5DlGVxtwav1yZcXTs8FQ3
 3l5Bd5xaFubZOEIeTjAwTd/SoGYLkkkmC6gxk9e2TamohNrtXKDiL8xMmmvGJCjARv+N
 3iYKz48UkUBI2IAly9EesJaaGOB4pVRdZAWawkFauUOF3UJDLV/RFW+A8CMGiM2rjD/R
 1QolWOPtJlrUUwf+w2DEyRhhJRmH0bg7MgCyM2fhbTBmwstdtal30TK8ktgKOf8M7O58
 7Wk6KDSgV/GhMdHxHaN2sixEIcYKatAhNz0wE7GTEdAe/yekDRcEw+IFlDtbWT+/eI5l
 9FIQ==
X-Gm-Message-State: APjAAAUpN93PbWkFQjY1hBF3taZY+D0z2u5nlWrI28+dM5zX4ALPD2rd
 sN51ayce6I+5o3XNL8vn6WYO/eC5
X-Google-Smtp-Source: APXvYqzPFgdsHu8f1uF3j80J4QwlBMQwQ5bnufYUnTv2iaOZhEKcnSON0bKfMhf1KjJrbi+W1F4n1A==
X-Received: by 2002:adf:9bd3:: with SMTP id e19mr15643087wrc.38.1561081375774; 
 Thu, 20 Jun 2019 18:42:55 -0700 (PDT)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id d1sm1123125wru.41.2019.06.20.18.42.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Jun 2019 18:42:55 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 21 Jun 2019 03:42:28 +0200
Message-Id: <1561081350-3723-24-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1561081350-3723-1-git-send-email-pbonzini@redhat.com>
References: <1561081350-3723-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42c
Subject: [Qemu-devel] [PULL 23/25] sd: Fix out-of-bounds assertions
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
Cc: Lidong Chen <lidong.chen@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lidong Chen <lidong.chen@oracle.com>

Due to an off-by-one error, the assert statements allow an
out-of-bound array access.  This doesn't happen in practice,
but the static analyzer notices.

Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
Reviewed-by: Liam Merwick <liam.merwick@oracle.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Message-Id: <6b19cb7359a10a6bedc3ea0fce22fed3ef93c102.1560806687.git.lidong.chen@oracle.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/sd/sd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 60500ec..917195a6 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -145,7 +145,7 @@ static const char *sd_state_name(enum SDCardStates state)
     if (state == sd_inactive_state) {
         return "inactive";
     }
-    assert(state <= ARRAY_SIZE(state_name));
+    assert(state < ARRAY_SIZE(state_name));
     return state_name[state];
 }
 
@@ -166,7 +166,7 @@ static const char *sd_response_name(sd_rsp_type_t rsp)
     if (rsp == sd_r1b) {
         rsp = sd_r1;
     }
-    assert(rsp <= ARRAY_SIZE(response_name));
+    assert(rsp < ARRAY_SIZE(response_name));
     return response_name[rsp];
 }
 
-- 
1.8.3.1



