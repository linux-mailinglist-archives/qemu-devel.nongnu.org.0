Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED49D5595D0
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 10:55:16 +0200 (CEST)
Received: from localhost ([::1]:60316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4f5w-0000Zc-16
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 04:55:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o4efd-0006OM-TW
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:28:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o4efc-0005WU-6k
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:28:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656059282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JhT2ZFpO3KJr1H7Z4giO4e6EM4PklFeAguLG50U8/JM=;
 b=XcTvfPKb1KdeL55hCPmLLlhRmVk8ptZVetDHLOzKFT6V0Bi6x1TYcpDiBwPRCQBBQZaxHy
 CWcRz5nGatqjAPZ9P5JeMnd4ZIM1FG/3A22NYpMw1qYxTZNv5ydBDX8OlTtpsi32CHuJTe
 kchPr4HzfSO4Gwc1l3yOvZUdovx5uP8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-201-zXi2G2SAMwaLpdTx7Io9CQ-1; Fri, 24 Jun 2022 04:28:00 -0400
X-MC-Unique: zXi2G2SAMwaLpdTx7Io9CQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 h16-20020a05640250d000b00435bab1a7b4so1371262edb.10
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 01:28:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JhT2ZFpO3KJr1H7Z4giO4e6EM4PklFeAguLG50U8/JM=;
 b=grA/0nmyvd+bdR8OvAwLpxR7nmvPSis3HWHhMUtRGqAa8VXrwDNBeXoiUEj5LpZOAk
 5q1HaEDYjsjYcKiPaaL4yEBcRsBjBN0+///ROudv5YIrfKlG2sFq4UyTKadpMeRSy0N9
 tjdO5q4qqqBF0plSSG+OFMT18U/oKFjDQKRhZpU3J0drMkpoG3n3Aoj29++KH27N8Y1H
 iq36YDi2y5ZpWmN9dGyvCHBuYzLiLgPz8Hs/2gAlYLWbYb1vicx/mZ4OQRXHtKJ40WnN
 Yo5qJxGSE5Y4oKZKIpv5f29m21JQ24Ir06Kt+zsk5PjKG0nPHvlat094n8NpTSLK9D0b
 YsiQ==
X-Gm-Message-State: AJIora8nQfaBKPzl9LkA8sHSbl0oE+oqToSrxtkApNcS7TLQ9GRbtDoL
 ICOQKN5VPS/VDmT+hDx5/ixsmWwJzdXlkSDP5hIq/M3/4zzp7951fF3x/Iqu/A9a6FPqDfHv81W
 VqlrS0vS7dlUL/7kARVskKKhcxCfTYf8jogj4ExWCqhGTXzISOO0M/hGEEILgAdOZ1KU=
X-Received: by 2002:a17:907:c14:b0:722:bc08:c4ae with SMTP id
 ga20-20020a1709070c1400b00722bc08c4aemr12361321ejc.8.1656059279374; 
 Fri, 24 Jun 2022 01:27:59 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ubbpR4fWtQX3lUpkeiYR8tozIrCUWjjzLREOqHOY+W8xor5U1UKrJI8h+zdtIHNB7f9Rem6Q==
X-Received: by 2002:a17:907:c14:b0:722:bc08:c4ae with SMTP id
 ga20-20020a1709070c1400b00722bc08c4aemr12361305ejc.8.1656059279095; 
 Fri, 24 Jun 2022 01:27:59 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 q18-20020a17090609b200b006feaa22e367sm694353eje.165.2022.06.24.01.27.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 01:27:58 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Miaoqian Lin <linmq006@gmail.com>
Subject: [PULL 14/14] accel: kvm: Fix memory leak in find_stats_descriptors
Date: Fri, 24 Jun 2022 10:27:30 +0200
Message-Id: <20220624082730.246924-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220624082730.246924-1-pbonzini@redhat.com>
References: <20220624082730.246924-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Miaoqian Lin <linmq006@gmail.com>

This function doesn't release descriptors in one error path,
result in memory leak. Call g_free() to release it.

Fixes: cc01a3f4cadd ("kvm: Support for querying fd-based stats")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
Message-Id: <20220624063159.57411-1-linmq006@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index ba3210b1c1..ed8b6b896e 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -3891,6 +3891,7 @@ static StatsDescriptors *find_stats_descriptors(StatsTarget target, int stats_fd
         error_setg(errp, "KVM stats: failed to read stats header: "
                    "expected %zu actual %zu",
                    sizeof(*kvm_stats_header), ret);
+        g_free(descriptors);
         return NULL;
     }
     size_desc = sizeof(*kvm_stats_desc) + kvm_stats_header->name_size;
-- 
2.36.1


