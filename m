Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B22C4444493
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 16:22:22 +0100 (CET)
Received: from localhost ([::1]:36290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miI5l-0005Oy-RD
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 11:22:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHp8-0003UY-TN; Wed, 03 Nov 2021 11:05:12 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:43534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHoz-0000YY-Mx; Wed, 03 Nov 2021 11:05:10 -0400
Received: by mail-wr1-x42b.google.com with SMTP id t30so4023620wra.10;
 Wed, 03 Nov 2021 08:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rnSjJep00PuWrOp9q/49ZO8vTrCgwf3MZFCi6UASDb4=;
 b=RU+tuUJp+V8KINeMxy4e7TN7PJ6Mw9ZQ3n+xB8KTEsVv29nLMsQhD1Dk6y+fBnPOzm
 IHkNVN+i6chyZN2gGQh309VtmuIe/n1m0JSyVbkqv6upUFc0VMgcFmBMtdFZMV616x1B
 CJJOtTbltL3m3INnSpQQ3mizzENssJB/9yBBOEuI6o54ImI1lsM6+UFT25X7/1noLqRz
 DFqaqrithXsMzlpgHVpYSglY3ohmTkOO7IzHYcfPN+ZIZdhzWP/8Pq29f+GNw43WxI+f
 IaSPXYB8PeMFqohOFumPncTB27mgx8swNSW73vkcQeuPBas6zdB0bBeufhGnNIpv8jXO
 eJkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rnSjJep00PuWrOp9q/49ZO8vTrCgwf3MZFCi6UASDb4=;
 b=AW5KEFje3Cu5sEOyWSSOv53KZp05VR2gbm+lAhU0RL0OnhwCk50Jz7gr/CMzAMiNT0
 WYubnDOgPbzpQ4t7q32UaO8BPATitL0fCNhfW2KvT4UM/XpU0PT4iqDuvxBfNjEbiDj7
 MQ5fxHSEgNHQOa0QLgviBD8lTS9NFMoe5WKi6dQgsRpcExK6ebTRcR4kTFIxrSn8s29t
 y9Z7RK/keBVxq8s0U9CfYn9m0PyzRkUGcHVoB3zEXFuDn4k8fBjEoBtIEmRaQhFLdxoN
 p0PevzAWq46ZNaOBLnSooTx9pD9USJWFjyRMAMnNSMdaAI24rnwkL3/xcDP9cZ0iJqgx
 4keg==
X-Gm-Message-State: AOAM530Pg9EtcguRYpnDRnF/rSYvee7hiM7Gg36ctbopSzkA8Q4rizkZ
 4sPre1a23knr5JW9Fd4zBNAqOPrmQF4=
X-Google-Smtp-Source: ABdhPJwpQb3VeeL9lYJPpHbPwOb/DwkAW2v05V57R5YIwxny+N/zhOgMv/e8FjfrYUtV4nzkTcZLOQ==
X-Received: by 2002:a5d:6449:: with SMTP id d9mr30395276wrw.332.1635951899677; 
 Wed, 03 Nov 2021 08:04:59 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h16sm2488797wrm.27.2021.11.03.08.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 08:04:59 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/27] hw/i386: Rename default_bus_bypass_iommu
Date: Wed,  3 Nov 2021 16:04:28 +0100
Message-Id: <20211103150442.387121-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211103150442.387121-1-pbonzini@redhat.com>
References: <20211103150442.387121-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-stable@nongnu.org, Eric Auger <eric.auger@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Since commit d8fb7d0969d5 ("vl: switch -M parsing to keyval"), machine
parameter definitions cannot use underscores, because keyval_dashify()
transforms them to dashes and the parser doesn't find the parameter.

This affects option default_bus_bypass_iommu which was introduced in the
same release:

$ qemu-system-x86_64 -M q35,default_bus_bypass_iommu=on
qemu-system-x86_64: Property 'pc-q35-6.1-machine.default-bus-bypass-iommu' not found

Rename the parameter to "default-bus-bypass-iommu". Passing
"default_bus_bypass_iommu" is still valid since the underscore are
transformed automatically.

Fixes: c9e96b04fc19 ("hw/i386: Add a default_bus_bypass_iommu pc machine option")
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Message-Id: <20211025104737.1560274-1-jean-philippe@linaro.org>
Cc: qemu-stable@nongnu.org
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/pc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index fcfb7f7139..ac5af274cd 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1718,7 +1718,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     object_class_property_add_bool(oc, "hpet",
         pc_machine_get_hpet, pc_machine_set_hpet);
 
-    object_class_property_add_bool(oc, "default_bus_bypass_iommu",
+    object_class_property_add_bool(oc, "default-bus-bypass-iommu",
         pc_machine_get_default_bus_bypass_iommu,
         pc_machine_set_default_bus_bypass_iommu);
 
-- 
2.31.1



