Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 171935FB1D5
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 13:50:11 +0200 (CEST)
Received: from localhost ([::1]:49868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiDly-00050C-37
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 07:50:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCUr-0002jT-LV
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:28:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCUk-0004cY-0R
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:28:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665484097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jVXWu5so8eiOLbp5V+dPBJ9ZByv5+S3LZqNBcPkJT8s=;
 b=OuMx+FebWTXSjwwBmR3a+jCqiunKsk95GKP5sPmPeqSwbQsUGEOQxtxHZBnJNP10Sbj9rn
 KV13HXxGkIl5lNgZcvIrdHA67hFvyhQV5/+OmbheTXY+DEMscXDZkF1/+TOXbvtG7sAF3T
 C6ZVDYHrr9bkXtFaUL5JQJcUAcDnlu0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-78-SUWF49TPN_WyqSavXXHUlQ-1; Tue, 11 Oct 2022 06:28:16 -0400
X-MC-Unique: SUWF49TPN_WyqSavXXHUlQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 z9-20020a05640240c900b00458dae4ed9cso10828872edb.3
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 03:28:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jVXWu5so8eiOLbp5V+dPBJ9ZByv5+S3LZqNBcPkJT8s=;
 b=7TXw8l0JoIf/YqbigKIDH8jimsKLeSAYD6svxWcpvVsyY33xwTiRLGshBKnSB15K86
 UKq2KTu6LRgCk3PVRNIZfeX1NsRMTqyQw9rYqcrt3birAaqobaUQ2A3CQPFNqFZKqkND
 s/yZyw5ztaJpVBpxRL9865jkw07bAp5vPSzoxLXEn46n/CVJJytnzoGW6M3anktqLHbV
 Cn6pI7eWBIE8PVbMdv3C/MehGSXmq8AOPn+J/IX3WmY4mLnRPW58SHVZbeckGOV+z/cI
 5+fMPCoX8/S0LpW+E4t5HBW2d8+M+ezIL1C+nHCm28C6s5DGtNAvzZmqiBYJ/7GIgvE6
 EknA==
X-Gm-Message-State: ACrzQf1cbAkZ1hbnHJRW6kmUIUUjAoI27f7GrXbC3teVvEIY1ZB9L6q5
 CvW5SSQiStB29NS9qj96JRiJv1FmHJzW554cJB906ZnSFOWjbMw/6fdI2ei/GAKvFZ9SWm4GAb+
 YwZdUVAoi8PcShF7HQ3Xtkwdr2ZPliiQKHP7sdXDmTAIqYH/xmLwxuxK5gVkUv40AbbQ=
X-Received: by 2002:a17:907:94d2:b0:783:e5dd:9c79 with SMTP id
 dn18-20020a17090794d200b00783e5dd9c79mr19257983ejc.18.1665484094789; 
 Tue, 11 Oct 2022 03:28:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5P8nX/CzdZuaXR7CipFIfNgnRUdPQEMqUYe5GtOyhEU9S0We6yMrr0M0YQBUMm2wOkIOgkSg==
X-Received: by 2002:a17:907:94d2:b0:783:e5dd:9c79 with SMTP id
 dn18-20020a17090794d200b00783e5dd9c79mr19257966ejc.18.1665484094541; 
 Tue, 11 Oct 2022 03:28:14 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:aad8:f393:e009:e014])
 by smtp.gmail.com with ESMTPSA id
 ha6-20020a170906a88600b00780f24b797dsm6694115ejb.108.2022.10.11.03.28.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 03:28:14 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 25/37] target/i386: Use gen_jmp_rel for DISAS_TOO_MANY
Date: Tue, 11 Oct 2022 12:26:48 +0200
Message-Id: <20221011102700.319178-26-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011102700.319178-1-pbonzini@redhat.com>
References: <20221011102700.319178-1-pbonzini@redhat.com>
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

From: Richard Henderson <richard.henderson@linaro.org>

With gen_jmp_rel, we may chain between two translation blocks
which may only be separated because of TB size limits.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221001140935.465607-21-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 5b84be4975..cf23ae6e5e 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -8798,6 +8798,9 @@ static void i386_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
     case DISAS_NORETURN:
         break;
     case DISAS_TOO_MANY:
+        gen_update_cc_op(dc);
+        gen_jmp_rel_csize(dc, 0, 0);
+        break;
     case DISAS_EOB_NEXT:
         gen_update_cc_op(dc);
         gen_update_eip_cur(dc);
-- 
2.37.3


