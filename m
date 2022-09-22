Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9DB5E5E36
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 11:13:23 +0200 (CEST)
Received: from localhost ([::1]:43538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obIGo-0005IO-Le
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 05:13:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHu1-0004MU-5x
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:49:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHtz-0003CM-Lv
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:49:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663836587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sAFAs4hAiiPiiYyIOLDT0XHpVnfH9R+UM/N5QubwJIk=;
 b=P6w1vGziEdPGUXI8SgV73eruaeqeUyzghi44P4quY672/PdvuIoVkZ/CUXHkbzcoW/9D+b
 BYHk9R1KfsOPjdNHBbtTOQYOZXfIPSNPADtbLuCUXcvazGmLfHPlD94ooBnjzG0NCdM/Qy
 Y4Sm7Z8tXUea/szRq3jtU0dPJJpnP4E=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-67-iHre37S8PaCZVxm9QYk-4A-1; Thu, 22 Sep 2022 04:49:45 -0400
X-MC-Unique: iHre37S8PaCZVxm9QYk-4A-1
Received: by mail-ed1-f69.google.com with SMTP id
 w20-20020a05640234d400b00450f24c8ca6so6153724edc.13
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 01:49:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=sAFAs4hAiiPiiYyIOLDT0XHpVnfH9R+UM/N5QubwJIk=;
 b=6w1Ejg/rsV8+hLNdy5444FyvAol7IqfjgFGGtDvi7rEpXbdarrEwK85sycIkuvtN0B
 s++0x/jqACKCvzfXXtaTGIkIOW3nXI4EltzErgpbNa6iJWXpK/9G7KG/Mr2Xqpq5JwxK
 nbBJb0BTYLpDgsaBJdB4wpJ3MQx/7zpkUhFdY4pHv2ZP/A6tPCOokEYnNxBAlZjfdtJK
 v5CtjUStNYD+VRb9wMCxtHikm4kqP5u8bzfjRX6dv7P115xkgBIzbTBphLktHOtz+All
 3FnKflXoQM6XOV+7S4Q0J1CBbXpx5pBnO5U4NjY4SaM6+GX7ipMzXJUuVFdpGR0PiqTn
 uOUA==
X-Gm-Message-State: ACrzQf3/m4KmSesDd7mi8G2UtEq4lBHYiNpEZEGRccNqcr9seHN35Dul
 jNHrlu0GmgCbxtf4D4SlQd39V8nlfolP7t9y/t6j6mWlKWQAMijlz6F0x0el1P1SMCBmj5ails/
 gCs0XG33H5CuSYnukh/6DgwndPeIpJRh3Dr8b2jESti89XtFUq8i76/zwzwWvMy+XoJk=
X-Received: by 2002:a17:907:62a1:b0:781:b320:90c0 with SMTP id
 nd33-20020a17090762a100b00781b32090c0mr1759344ejc.255.1663836584252; 
 Thu, 22 Sep 2022 01:49:44 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7ghzK16tMiaf1ZWvoOA5nAvB3y+8sLo34wX1L9Dla1Qa/ejWwfYALLYp3FeGgVsTsHasgzJw==
X-Received: by 2002:a17:907:62a1:b0:781:b320:90c0 with SMTP id
 nd33-20020a17090762a100b00781b32090c0mr1759321ejc.255.1663836584001; 
 Thu, 22 Sep 2022 01:49:44 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 el8-20020a056402360800b004533fc582cbsm3207944edb.21.2022.09.22.01.49.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 01:49:43 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com,
	qemu-block@nongnu.org,
	afaria@redhat.com
Subject: [PATCH 12/26] nvme: add missing coroutine_fn annotations
Date: Thu, 22 Sep 2022 10:49:10 +0200
Message-Id: <20220922084924.201610-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922084924.201610-1-pbonzini@redhat.com>
References: <20220922084924.201610-1-pbonzini@redhat.com>
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
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Callers of coroutine_fn must be coroutine_fn themselves, or the call
must be within "if (qemu_in_coroutine())".  Apply coroutine_fn to
functions where this holds.

Reviewed-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/nvme.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/block/nvme.c b/block/nvme.c
index 3e6abef1ce..c51b9f5cd3 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -1242,8 +1242,9 @@ static inline bool nvme_qiov_aligned(BlockDriverState *bs,
     return true;
 }
 
-static int nvme_co_prw(BlockDriverState *bs, uint64_t offset, uint64_t bytes,
-                       QEMUIOVector *qiov, bool is_write, int flags)
+static coroutine_fn int nvme_co_prw(BlockDriverState *bs,
+				    uint64_t offset, uint64_t bytes,
+				    QEMUIOVector *qiov, bool is_write, int flags)
 {
     BDRVNVMeState *s = bs->opaque;
     int r;
-- 
2.37.3


