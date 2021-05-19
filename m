Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA99F388CC5
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 13:27:57 +0200 (CEST)
Received: from localhost ([::1]:58244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljKMn-0001fs-1k
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 07:27:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1ljKKA-0008Rb-HJ; Wed, 19 May 2021 07:25:14 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:34626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1ljKJy-0006z9-G3; Wed, 19 May 2021 07:25:14 -0400
Received: by mail-ed1-x52c.google.com with SMTP id w12so7180599edx.1;
 Wed, 19 May 2021 04:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NZryzjsckBxm75YGf8NUMeT+ziZK5Tsl+X2Vgd+Hqv0=;
 b=uZQKg+AY4QsZHEYuO6Tjl9OXs/ml2cBdKqEVfvlQc4dtDXhFK0N4KwSV7oPehUhkus
 t+0yL7ccWYSQfSUwMnbB1o3zt6roG5GY8L+4na+Pm7Ay1nvd0kVkUiGPAX97ZnaOVRc5
 iBWQbV9qLljYy5h++eaDmfeHZuT66S/AHb9emMryRUPPK7RSlVuztEaoUz9vEp4lonmJ
 nuMSGN9fEDG7GtKD1iiAtMMJGdgvliupIoWtqEkEv0GKFm/rzqwSPcjNuKZ49Tuh9jqy
 ZBk2zilDwQdjWDN1JO/6WAdLzqid+zJcnfJ4Y0aND7FhLbjFkuBXS80tnu1BhkO27Iup
 c2Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NZryzjsckBxm75YGf8NUMeT+ziZK5Tsl+X2Vgd+Hqv0=;
 b=LBZItJhmyAKOjq77/uC4GtYqBhhly+al4UD9W6f52R77gigAcxXGQDLVA5Zw8DxAMn
 YQLOOVRYzraRRd1sKahgUhHhEkRTUZzPIhCeX7hYoQ00eUj5+E69PtGXedjeA3OPVH0m
 PEZhOg0HQx7kGMI/snE9mTxnfBxs7PBG7Qih4ZySQnT75UVja2wJMcmg45fAK85HdZQ5
 fCxcugAB7NRePTfQXZOm+pOY4+eXOcUD9It6oLtTl52qfYQZAdL2ngcDNHaykQbvNdRP
 4R6GRFC75TN8f0o3uFjNbANbMBrC/u/BB3Uimu5JRELl0o5TP4vj3wbBe+e3orRcK3Q/
 gVpA==
X-Gm-Message-State: AOAM533pdGq/0hU9jBRHR1iltsuhzT6KKaRs/3ago0gtHeeasww8dNV6
 ss9dIloOLZwrs90DCQWYNnm/Oaepxpimpw==
X-Google-Smtp-Source: ABdhPJyNg3gnP1hWhmoshUR9Ey6dDY6YvtSrYDhVuaWM2idHkGW0lE5AWOdBe0U+qpB3einM64WJfg==
X-Received: by 2002:aa7:cd16:: with SMTP id b22mr13508516edw.335.1621423498279; 
 Wed, 19 May 2021 04:24:58 -0700 (PDT)
Received: from kwango.local (ip-94-112-132-16.net.upcbroadband.cz.
 [94.112.132.16])
 by smtp.gmail.com with ESMTPSA id y9sm12496429ejc.36.2021.05.19.04.24.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 04:24:57 -0700 (PDT)
From: Ilya Dryomov <idryomov@gmail.com>
To: qemu-block@nongnu.org
Subject: [PATCH] MAINTAINERS: update block/rbd.c maintainer
Date: Wed, 19 May 2021 13:25:13 +0200
Message-Id: <20210519112513.19694-1-idryomov@gmail.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=idryomov@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Jason has moved on from working on RBD and Ceph.  I'm taking over
his role upstream.

Signed-off-by: Ilya Dryomov <idryomov@gmail.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index eab178aeee5e..3e77ac9030fa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3042,7 +3042,7 @@ S: Supported
 F: block/vmdk.c
 
 RBD
-M: Jason Dillaman <dillaman@redhat.com>
+M: Ilya Dryomov <idryomov@gmail.com>
 L: qemu-block@nongnu.org
 S: Supported
 F: block/rbd.c
-- 
2.19.2


