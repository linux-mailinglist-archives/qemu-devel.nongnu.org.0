Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E5659779B
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 22:16:43 +0200 (CEST)
Received: from localhost ([::1]:57272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOPT0-00036u-LQ
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 16:16:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOPJu-0004xW-B6
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 16:07:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOPJs-0000V3-Ke
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 16:07:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660766836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nWQVRRhfHKdS6zw8hDv8H7vDo6NdB5TZvkd9lopLAgA=;
 b=QNF5K9fewWniNuopJnfQITZwfMLy82JFNwH383MMS6MjkjNjTX4tqZshYNk1eTr3blVX5A
 7ZPGQeyyIGEhMTdYiOwPHyB6lWnWIygfwxw4WsQy0954hUFJ64gWPOSu8aamJLqaByXIoe
 2+mpHaEZ0qZLZN48NMwtsPY6agPANsw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-456-XgS5EuIkOqG2RoxaaBFjlA-1; Wed, 17 Aug 2022 16:06:18 -0400
X-MC-Unique: XgS5EuIkOqG2RoxaaBFjlA-1
Received: by mail-wm1-f70.google.com with SMTP id
 b4-20020a05600c4e0400b003a5a96f1756so1563004wmq.0
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 13:06:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=nWQVRRhfHKdS6zw8hDv8H7vDo6NdB5TZvkd9lopLAgA=;
 b=7IVB5s3PAcEWfxXlUM5CHYJbV0G1Rrj4XL6ZzuZ8CIQfa1RsrqZRUBTh78RX+g+8hO
 uWVc6Co4kLlpF4bQfXwBy2r+grTyxHNTPaHP72BW4HWFWOreA081rUlZsssacnS94tdM
 KPeV48MGQKwipe+b6MX2IjePE7M+0Kn3brDRr1tY1t4nrvIozr/YGL1zAO8YZoUh0DNW
 ZDGbSsbstAwwvcjeyVnt8EC14rSSQ/CnASdBe/1BTHEnoPhQgrgeFqEzDYd+H64ENCqV
 b5KjzpGdBAUIlGtDNcR52JniYW3tWWGgaevP0G/p7ExC2i7qdTGK2Rc5a7vka0Ml6MjJ
 2ZCQ==
X-Gm-Message-State: ACgBeo0QeQW9ynHiTOdOEHZnLOnOv9X2sgqhe2aP+K5+QhXiNu19dJJa
 l8CtBxyDBz/Of7+pWq7qkBfP6rrFqh4oazItt06RbKF4Rk7D2f8mcGaUEMpg7yWaNgqM9iZMMxD
 Rosv8Nw58AZJfbf+Kk7qXdjkwGyRawuOeQjQcNl536jModzS5q7OXbiqtf1g9
X-Received: by 2002:adf:edc6:0:b0:224:f767:31ae with SMTP id
 v6-20020adfedc6000000b00224f76731aemr11630479wro.433.1660766777354; 
 Wed, 17 Aug 2022 13:06:17 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4VnM+aT9P8WjIz6X+gXyHhhk8kf9SEJuku/ndTC/6PdOI+QVFEevF0XfPijKqLvl+e+Yy1gQ==
X-Received: by 2002:adf:edc6:0:b0:224:f767:31ae with SMTP id
 v6-20020adfedc6000000b00224f76731aemr11630462wro.433.1660766777044; 
 Wed, 17 Aug 2022 13:06:17 -0700 (PDT)
Received: from redhat.com ([2.55.4.37]) by smtp.gmail.com with ESMTPSA id
 p6-20020a05600c05c600b003a604a29a34sm2713392wmd.35.2022.08.17.13.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 13:06:16 -0700 (PDT)
Date: Wed, 17 Aug 2022 16:06:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Ben Widawsky <ben.widawsky@intel.com>
Subject: [PULL 07/12] hw/cxl: Fix wrong query of target ports
Message-ID: <20220817200536.350795-8-mst@redhat.com>
References: <20220817200536.350795-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220817200536.350795-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Two issues were present in this code:
1) Check on which register to look in was inverted.
2) Both branches use the _LO register.

Whilst here moved to extract32() rather than hand rolling
the field extraction as simpler and hopefully less error prone.

Fixes Coverity CID: 1488873

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <20220808122051.14822-3-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/cxl/cxl-host.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/hw/cxl/cxl-host.c b/hw/cxl/cxl-host.c
index faa68ef038..1adf61231a 100644
--- a/hw/cxl/cxl-host.c
+++ b/hw/cxl/cxl-host.c
@@ -104,7 +104,6 @@ static bool cxl_hdm_find_target(uint32_t *cache_mem, hwaddr addr,
     uint32_t ctrl;
     uint32_t ig_enc;
     uint32_t iw_enc;
-    uint32_t target_reg;
     uint32_t target_idx;
 
     ctrl = cache_mem[R_CXL_HDM_DECODER0_CTRL];
@@ -116,14 +115,13 @@ static bool cxl_hdm_find_target(uint32_t *cache_mem, hwaddr addr,
     iw_enc = FIELD_EX32(ctrl, CXL_HDM_DECODER0_CTRL, IW);
     target_idx = (addr / cxl_decode_ig(ig_enc)) % (1 << iw_enc);
 
-    if (target_idx > 4) {
-        target_reg = cache_mem[R_CXL_HDM_DECODER0_TARGET_LIST_LO];
-        target_reg >>= target_idx * 8;
+    if (target_idx < 4) {
+        *target = extract32(cache_mem[R_CXL_HDM_DECODER0_TARGET_LIST_LO],
+                            target_idx * 8, 8);
     } else {
-        target_reg = cache_mem[R_CXL_HDM_DECODER0_TARGET_LIST_LO];
-        target_reg >>= (target_idx - 4) * 8;
+        *target = extract32(cache_mem[R_CXL_HDM_DECODER0_TARGET_LIST_HI],
+                            (target_idx - 4) * 8, 8);
     }
-    *target = target_reg & 0xff;
 
     return true;
 }
-- 
MST


