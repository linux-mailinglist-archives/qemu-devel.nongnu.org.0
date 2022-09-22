Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 378B95E5E9B
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 11:29:23 +0200 (CEST)
Received: from localhost ([::1]:42608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obIWI-0005AP-AH
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 05:29:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHu7-0004SH-LQ
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:49:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHu6-0003EG-0T
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:49:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663836593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O6AXzgGtdYWeMtnt6YWtXqyOu/JX+5LJAyvz2m6ZVtw=;
 b=LxDcNyuXQysMie9xV+2JLP76FKRUd6HR5oCgdTPId/kGQQAbcj6FJHujW0BvQxSeJmeQRy
 LIEcg/QY6b7hb/IZ0s2tOZK2DAsTJO18Pppty2OqDZack0Ko4hhUHXUT/K1uCkVR4VeLRF
 Jk0RyJzvhEr9DsHvVU/9RrjCzM218/0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-486-rNUxlVKuMEaSRs2x9TugKg-1; Thu, 22 Sep 2022 04:49:51 -0400
X-MC-Unique: rNUxlVKuMEaSRs2x9TugKg-1
Received: by mail-ed1-f70.google.com with SMTP id
 z2-20020a056402274200b004516734e755so6178010edd.3
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 01:49:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=O6AXzgGtdYWeMtnt6YWtXqyOu/JX+5LJAyvz2m6ZVtw=;
 b=Px6a/dLy0prCASTvrIL1DHoDJq5R1L0ScATvb4TP45nCxzRkRogTrRiB0BlbxlV5jD
 p0cRNGKlgcE/MLuUnx3VS4JEn+2CzKBjNQ1wJP+iaaPjgsvgFFd4PEatiGc06hXQu/tm
 qNz0/+QvDkL21Mm9QRcMxMIvoB4XGH/wuzyyhe31h3OX5klJLWMN2BRemOkfAHlFlH6K
 qEKDqMVTJniG42Imk9ELkImJ2sWfdKncG77ZuhNr6C3X6wO2K4y3FBfvRdWy9ok5sxr2
 XxJI0Og/YlbOYfzwk1uBm4e5I//8ofbVcJZZ9716T1QLrKMXYxyPQySKsGR7qKBvjQBd
 ierw==
X-Gm-Message-State: ACrzQf1nnpdU6pOJQYOHCcpVXuW74+ASG3ZPa18I2H/VRpd04AGhowQP
 pJSRa1p+FC+NpowY1uqXCSWYqabDR5n9XLvRcgCiHjAxa+QyeKjpjDfbmJvBoykp68UxTLhhwHO
 vDTu4ykbgDZuchkzgTi7GUb+aQYMjfUtR2CemdSXuV6zVwq1iCf7UeeSFF+ew+ki5YLY=
X-Received: by 2002:a05:6402:43cf:b0:450:eae1:c9d3 with SMTP id
 p15-20020a05640243cf00b00450eae1c9d3mr2139622edc.231.1663836589795; 
 Thu, 22 Sep 2022 01:49:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6IioacpwDCdEDsGN/kdg8wnRbBXkbewG88bBcyTM/XG1KymnBHH9CIPEVdYOW+dC8QyUgGcQ==
X-Received: by 2002:a05:6402:43cf:b0:450:eae1:c9d3 with SMTP id
 p15-20020a05640243cf00b00450eae1c9d3mr2139601edc.231.1663836589479; 
 Thu, 22 Sep 2022 01:49:49 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 kv6-20020a17090778c600b0076f0ab594e9sm2323852ejc.73.2022.09.22.01.49.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 01:49:49 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com,
	qemu-block@nongnu.org,
	afaria@redhat.com
Subject: [PATCH 16/26] curl: add missing coroutine_fn annotations
Date: Thu, 22 Sep 2022 10:49:14 +0200
Message-Id: <20220922084924.201610-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922084924.201610-1-pbonzini@redhat.com>
References: <20220922084924.201610-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

Callers of coroutine_fn must be coroutine_fn themselves, or the call
must be within "if (qemu_in_coroutine())".  Apply coroutine_fn to
functions where this holds.

Reviewed-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/curl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/curl.c b/block/curl.c
index 1e0f609579..cba4c4cac7 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -855,7 +855,7 @@ out_noclean:
     return -EINVAL;
 }
 
-static void curl_setup_preadv(BlockDriverState *bs, CURLAIOCB *acb)
+static void coroutine_fn curl_setup_preadv(BlockDriverState *bs, CURLAIOCB *acb)
 {
     CURLState *state;
     int running;
-- 
2.37.3


