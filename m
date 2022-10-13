Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E625FDA97
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 15:21:40 +0200 (CEST)
Received: from localhost ([::1]:52562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiy9a-00044A-Lu
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 09:21:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixUD-0001px-GU
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:38:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oixU9-0004I8-8g
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 08:38:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665664706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mqlguSef8a2F2SdhBV7Q1/fhDKRm1B4phyAmEQsD8C4=;
 b=ATsrVj6JxW2bR4hvWtlqpDzj1lYIF8ZPQXXlJMmSdkKTf0Xeq6sWFe90xZAaAdG8zcdTAR
 nHgBmQ7vUHmA2K0wLeR/7Nox3fxSoLpDzG3kfj/wiJ4fzcRsKX+whddGz27UX6yGfMfihF
 QUGE9xjIsbQoPEacmYMhDBZ6XMb90DI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-296-nYhC8XFONqSuuNPfcSK39Q-1; Thu, 13 Oct 2022 08:38:25 -0400
X-MC-Unique: nYhC8XFONqSuuNPfcSK39Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 j20-20020a05640211d400b0045bd72f05d6so1426197edw.11
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 05:38:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mqlguSef8a2F2SdhBV7Q1/fhDKRm1B4phyAmEQsD8C4=;
 b=YA+KPu/Tp+XA9xn2DqMS+tzGXCAx01LpJlV/xEBXPOjZ4iE54UMLki71teyPjMTB8O
 dA8ltbpziutD6Nd/xPJ/U1KvdohL+mL3kzFzGjvmA2HOkXHoevKyy0jpIqclN7+A64NX
 kIZ7z828Gq5xG0jlG61/7u8f9wbloObzcddG1/WZpLIxM1b1vmn3O6802f+jhySUFtFB
 ZwHDAnrg+RP8MponhHYsVNOrlgqEZvr7BmZyn/Exg2SlUTcAh3yBAyZn918bEiHCXRwk
 NR5lpC0ljw9+NDrYn2oMBzVzilJZeMyTZBixTtZIKpXWye3kc8oMNg+WxAp42pPICC3K
 HjsQ==
X-Gm-Message-State: ACrzQf1xflbdtPER5iV/QVZowE03/1gfhC7SpQMe0vHS6DLJoaeoR1kv
 nplqDdvtmNHHh+k0tIfmPeenRaYLziYfTPXcME/jyT8XG4yrVwJVVmzH4dlGPUtAo3B+L8gWls8
 XfeHitR9amEirMcLXLAjj82iNw3kDAPa4w8kJ0zCXoYiowJNPcL8IA4X5yTOm9vozONY=
X-Received: by 2002:a05:6402:169a:b0:458:fe61:d3b4 with SMTP id
 a26-20020a056402169a00b00458fe61d3b4mr31328246edv.140.1665664703941; 
 Thu, 13 Oct 2022 05:38:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5xNihb/1uwA26brng7RXBzusBRJJtpdq5L95jCfY/KB7hdaGP9NGu1ZrcLVuM8CaCmaTgzMQ==
X-Received: by 2002:a05:6402:169a:b0:458:fe61:d3b4 with SMTP id
 a26-20020a056402169a00b00458fe61d3b4mr31328227edv.140.1665664703664; 
 Thu, 13 Oct 2022 05:38:23 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 lh9-20020a170906f8c900b0078d793e7927sm3051462ejb.4.2022.10.13.05.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 05:38:23 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	afaria@redhat.com
Subject: [PATCH 24/24] monitor: switch to *_co_* functions
Date: Thu, 13 Oct 2022 14:37:11 +0200
Message-Id: <20221013123711.620631-25-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013123711.620631-1-pbonzini@redhat.com>
References: <20221013123711.620631-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Alberto Faria <afaria@redhat.com>

Signed-off-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 blockdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/blockdev.c b/blockdev.c
index a32bafc07a..47d47d5b18 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2448,7 +2448,7 @@ void coroutine_fn qmp_block_resize(bool has_device, const char *device,
     bdrv_co_unlock(bs);
 
     old_ctx = bdrv_co_enter(bs);
-    blk_truncate(blk, size, false, PREALLOC_MODE_OFF, 0, errp);
+    blk_co_truncate(blk, size, false, PREALLOC_MODE_OFF, 0, errp);
     bdrv_co_leave(bs, old_ctx);
 
     bdrv_co_lock(bs);
-- 
2.37.3


