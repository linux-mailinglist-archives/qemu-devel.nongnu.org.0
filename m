Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EDF5BD448
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 19:58:50 +0200 (CEST)
Received: from localhost ([::1]:47658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaL2e-0007NM-9X
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 13:58:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaKfh-0002uk-GU
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:35:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaKfg-0002sj-1W
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:35:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663608903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+/XZpaWOatQvZlf69VdQZSO4CQFd856M9KwjqSmktZ0=;
 b=LFAb5mRel0W1qIxIxpIYmuMMZA9p2e8q0x9rCwYeKwfKKAZd2Cfw0XEToAT6qXhDiInrq8
 3QOnP47K4fg+oJuvUi9sG0CcjlMkaGpnprHVBnrz4etWepS98ZP1GHG2n9k0TuQaMLd5Fi
 Fd0MRdkoO+lPUZJ4JDYM1KUzj0XIA1g=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-568-a88EOQ9xPr6EwBqnR_Gj1Q-1; Mon, 19 Sep 2022 13:35:01 -0400
X-MC-Unique: a88EOQ9xPr6EwBqnR_Gj1Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 l15-20020a05600c4f0f00b003b4bec80edbso5079614wmq.9
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 10:35:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=+/XZpaWOatQvZlf69VdQZSO4CQFd856M9KwjqSmktZ0=;
 b=S/4waQWyWbVXbw8UtXF0V5klhIdZIbCD43j997maEEhL9cJeWEATWneHyGeMQYYV5i
 J045u9dYM63H/DU81Jb/e2DIwS7+3mvFwP/9yd/hK3cav/IkGYzFWPFlyB9oiDp9Wda8
 3OguY36CMAZ0+15UC/3rgEFcvMiyWPBeHO2lfJLcYSax8YwVQmtGA3onV8Wn4KLm4zpY
 Kyu4zTYDqxeeMxMlkWc1yprWkL/SXQ3Y9sv9g7pWrDrfAQw74Vd+1+UUsR4GKEkgLJTN
 dezTVcpgqjp7OjfCTdwHn86ygwFtm+r4mrKFSGt7Ml5GFwHoN0IWBbpTfA2bgtc09EyZ
 7GwA==
X-Gm-Message-State: ACrzQf2l0AmiElK7IRiTrTMyNXJV/OZhT17x2F85LqmWF5NCkTmpXypC
 MW/ATx2lGYoEAGbXj8XTqUzJ095vy31fwJZZwIYml1H5XNHWR94y87p8d2KOHqQgt3RHid3yVeN
 OG3RZJbbS1ylIvQrFzP1hu8KiawkU+chb/p9FBAai55ROxXvZ2GbpHN2/EdEJBoD1U/I=
X-Received: by 2002:a05:600c:4841:b0:3b4:76f0:99f with SMTP id
 j1-20020a05600c484100b003b476f0099fmr13783964wmo.85.1663608900337; 
 Mon, 19 Sep 2022 10:35:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6EslKwADUxi6v5j6RDoY/M9OCiyzOlOOPWqYjfcyiIxGH3/9AJ12t3/HZKTwMK+5iJZm/rQg==
X-Received: by 2002:a05:600c:4841:b0:3b4:76f0:99f with SMTP id
 j1-20020a05600c484100b003b476f0099fmr13783941wmo.85.1663608900013; 
 Mon, 19 Sep 2022 10:35:00 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 m37-20020a05600c3b2500b003a2e92edeccsm15444547wms.46.2022.09.19.10.34.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 10:34:59 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/21] spapr_pci: fix leak in spapr_phb_vfio_get_loc_code
Date: Mon, 19 Sep 2022 19:34:32 +0200
Message-Id: <20220919173449.5864-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220919173449.5864-1-pbonzini@redhat.com>
References: <20220919173449.5864-1-pbonzini@redhat.com>
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

Overwriting "path" in the second call to g_strdup_printf() causes a memory leak,
even if the variable itself is g_autofree.

Reported by Coverity as CID 1460454.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/ppc/spapr_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 67e9d468aa..57c8a4f085 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -800,6 +800,7 @@ static char *spapr_phb_vfio_get_loc_code(SpaprPhbState *sphb,  PCIDevice *pdev)
     }
 
     /* Construct and read from host device tree the loc-code */
+    g_free(path);
     path = g_strdup_printf("/proc/device-tree%s/ibm,loc-code", devspec);
     if (!g_file_get_contents(path, &buf, NULL, NULL)) {
         return NULL;
-- 
2.37.2


