Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AC3571AA0
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 14:58:04 +0200 (CEST)
Received: from localhost ([::1]:42642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBFSl-00060Y-7F
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 08:58:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBFLR-0003BD-7u
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:50:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBFLO-0001U6-7N
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:50:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657630225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JhT2ZFpO3KJr1H7Z4giO4e6EM4PklFeAguLG50U8/JM=;
 b=YgyOOpDJAeOACpc102EU10FkP61vs+RqdslHAl9R+2gNaWyoMl3LE0Eh82hi7SSQhNOzeM
 pfkSF/z8FnIpXqHQoCEkrAuonzUHq+Nmi8nZt01NDZIXAsgXMwG9iDnoeYLIJdolDE4xrT
 3yz/BP/AdfUe6BoQLcOpB835abkdQL4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-cMKDymXpMiqpwk_9Vq4U3A-1; Tue, 12 Jul 2022 08:50:24 -0400
X-MC-Unique: cMKDymXpMiqpwk_9Vq4U3A-1
Received: by mail-ed1-f72.google.com with SMTP id
 g7-20020a056402424700b0043ac55ccf15so5254246edb.4
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 05:50:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JhT2ZFpO3KJr1H7Z4giO4e6EM4PklFeAguLG50U8/JM=;
 b=lTSyLVivx8uOV75cCZxDXVV+0+gfQ4jVzyngFOIS9kXuZExFA8F1uweTbE7/rrSufT
 0DWq1Its4g1UMyUKWxLHxIQq2Fzobfvi7eD1vHWSQG/zcNiJZ6URF1ezslIde/k1eia2
 Wsia+jafP5vt2XAUuYoMcAnjZUVZXyXxU+Hkx2G5vwzTnEeLLlszfNcWaW30Ws7K7OHD
 oCeXMPknBLeeqQ7/rm5aaDIUWfYznf9poDJAgG0RVn21esT5/ocuupUrYZrxjzuDEKnE
 awbdbEQaCeXva/YVh1kdvAO/+jUkPVkCr8cPOpfjftQK4L+8HI6nQe2ab1lDKedolrgK
 Gm0g==
X-Gm-Message-State: AJIora9MiDnshZ9PZs+0RNPxUWx6+N3/Kvo1hjj8K65jmTbVn3J8YHmK
 1nq/zruNdRgjE7BfhQJ/D4ybBkTqaeBA4j42FugT6LqMCdAy490/m3SH+NLZTBHOvWsqDnHrIpn
 LGit9yn6nEVWaM2fFgjIFtFb7BjcTKmftJnMX9nhtX371WsaL8nrLyVZER4OhJfNrbLQ=
X-Received: by 2002:a17:907:a05b:b0:72b:33f9:f927 with SMTP id
 gz27-20020a170907a05b00b0072b33f9f927mr18783895ejc.707.1657630223073; 
 Tue, 12 Jul 2022 05:50:23 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uZng0larLNfY8GrXnARghrTYV5rFS4agsUQfJ8E9VWQ0YoJ8KKVDIc/kPCmy48jM1aAcRAyQ==
X-Received: by 2002:a17:907:a05b:b0:72b:33f9:f927 with SMTP id
 gz27-20020a170907a05b00b0072b33f9f927mr18783871ejc.707.1657630222770; 
 Tue, 12 Jul 2022 05:50:22 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 x24-20020aa7d398000000b0043ab1ad0b6bsm6020205edq.37.2022.07.12.05.50.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 05:50:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Miaoqian Lin <linmq006@gmail.com>
Subject: [PULL 15/18] accel: kvm: Fix memory leak in find_stats_descriptors
Date: Tue, 12 Jul 2022 14:49:53 +0200
Message-Id: <20220712124956.150451-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712124956.150451-1-pbonzini@redhat.com>
References: <20220712124956.150451-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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



