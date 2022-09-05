Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD375AD066
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 12:43:13 +0200 (CEST)
Received: from localhost ([::1]:34972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV9ZO-0002iW-Nk
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 06:43:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oV9BG-0000e4-Vl
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 06:18:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oV9BE-00050s-7g
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 06:18:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662373087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+/XZpaWOatQvZlf69VdQZSO4CQFd856M9KwjqSmktZ0=;
 b=BMrhzvNCudDp+Lrke0Ybh00tM3FEuENdJqmpC5XcZNm4I3LMItTC8D6n5K0Dn7zP0e7Wao
 8mfEYcPZFBhWMQBVF4ttjxNOUdCGdBrrgFeOC8ZowoyHgiJcBgrWdOq3YmcPu/j6FZzYuZ
 x4hXIA5dpzzs/mJd6naxmTARY9H/ZKg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-495-Ay9y8efwPJOXtOQTG_8mkQ-1; Mon, 05 Sep 2022 06:18:00 -0400
X-MC-Unique: Ay9y8efwPJOXtOQTG_8mkQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 w17-20020a056402269100b0043da2189b71so5483288edd.6
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 03:18:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=+/XZpaWOatQvZlf69VdQZSO4CQFd856M9KwjqSmktZ0=;
 b=VNL+bOgJRu9iMMqnly3Viw4bw6Fl3JqiywO2cjE+xEDsmVXT6G5ZjKBZFMx5kkKLo+
 hOyWK3xaUjUPjoEdBVZbYdZwoidSTtLR4Ci4G/vGG/tcPlZzLWzU07wSJucrlwM/RY/4
 7ljBhbjiI+G1WFazG0rC9vxDk0VOzJdoFvWnb3rwQU65RgSwsE2lAak2Dh24gd7ZwvcB
 UFHcHkuNEOVeJ/KpBFLxCKCIhfBDzgUSf/8+5N9/PSW76kxfdFnMHFL/iydl0XwXPrdn
 sA/semyKeGUBSJ/xjwE4+emlj4K/LuEDHyBWuiKVzP5JvDDY5+m+aV7gKP2erzkSGElU
 wHaQ==
X-Gm-Message-State: ACgBeo32o51dvub6lPN+r/GM+l15aCMTtmUt5alOEoQUS8K2kqeI92vW
 luNL7KvjJ0zY7jBZ5oyX1vhMXGPsr5XijjIb7tcy/BOC8dMo8Pen4+aKK1YB69IhYwFZiGGqdOr
 qsXRH2ARTT2Cp3KlXPjt6iCmQdODbvzP8GXvmdkDFw4tmAO4BFX3TTGnlwkSu+MDMcKI=
X-Received: by 2002:a17:906:ef8c:b0:73d:db28:dc32 with SMTP id
 ze12-20020a170906ef8c00b0073ddb28dc32mr33280208ejb.224.1662373079364; 
 Mon, 05 Sep 2022 03:17:59 -0700 (PDT)
X-Google-Smtp-Source: AA6agR57mWLJv3beC2dLnAUla5ului5IjGab7WMsDKaxi1ZYCa3ohhjs6K6+rOV4D5vjiBgTZOcS9Q==
X-Received: by 2002:a17:906:ef8c:b0:73d:db28:dc32 with SMTP id
 ze12-20020a170906ef8c00b0073ddb28dc32mr33280188ejb.224.1662373078940; 
 Mon, 05 Sep 2022 03:17:58 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 d21-20020a170906305500b0073d6ab5bcaasm4822930ejd.212.2022.09.05.03.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 03:17:58 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Subject: [PATCH] spapr_pci: fix leak in spapr_phb_vfio_get_loc_code
Date: Mon,  5 Sep 2022 12:17:57 +0200
Message-Id: <20220905101757.19885-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
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
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


