Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9D251FAC1
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 13:02:28 +0200 (CEST)
Received: from localhost ([::1]:55258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no19l-0006I2-Ay
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 07:02:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0fE-0004i7-KV
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:30:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0fD-0002pB-2z
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:30:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652092250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PTpiMctGFRNCeUD0zfF0QDxVsAAFlrqIKcCLw448UvM=;
 b=Fp8Lw8rL60+bBdlM1YpHC6lRFpHEDenqkcj4h6lmMDjH2Ap/zsTQ6WnfRnbt63bmhZiSTU
 98WWiO1po/4VAi6ICICS1fQTcV94O2oqAs3ohcb1xnREqUZDnCBT1ZBV/yLmgNbeCEOKEU
 WIEKDmvHfAZyW017xVp6d8tTLW7QNq4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-WhdRItxgM-e-YTUIupD6-g-1; Mon, 09 May 2022 06:30:48 -0400
X-MC-Unique: WhdRItxgM-e-YTUIupD6-g-1
Received: by mail-wr1-f71.google.com with SMTP id
 p10-20020adfaa0a000000b0020c4829af5fso5604811wrd.16
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 03:30:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PTpiMctGFRNCeUD0zfF0QDxVsAAFlrqIKcCLw448UvM=;
 b=y1iP234BwNH1GVB/yO8lxiomeuCPU65cth/1+annmcN/2HLF5QJBMYjJzknOHtqpAX
 P77FFlZhKtbb5LKXhxKhKMe4frXHl9YJYdizy3AGASrLlDi2q4lVdWWaiRIQ9fKvqA6U
 tDX+3CXtZJUpYMRluCueJrLK9gRVi7342afuQfn4/wuguqOqF5JKmI8YHIVazrKyLck1
 V7SUib8zkEXwedf97d1trfRTa+o5reaeyB4tygshcMo9ZlH8BpmAdO/fJ1EJFGRT7hxs
 zVfqQgl2ycn8+NAW7xU9YTp9CyW7SlxWnScJTVUkzOLuq7ZiIQWeKabZ0C2+R0su7IyP
 /ILA==
X-Gm-Message-State: AOAM530RrI/P2lPpeDZf7no5SsDMpI01Ag4Ek6y23DXAZyjSCePqqX0S
 4AOmQXzFIvp+ja4vC8HRpAxuJBWl9ylyCvoY/wvXE8UMGvpEpwjNqi1ayG9/AWjPYET4zosNV+9
 RVbD7PtKhaotzXCng0T0SQCv7HkP/akzd5806O6KcNYtXm4XFs0jijBkQKg8rHcxP8nE=
X-Received: by 2002:a7b:cd97:0:b0:38f:f785:ff8 with SMTP id
 y23-20020a7bcd97000000b0038ff7850ff8mr21417441wmj.44.1652092247266; 
 Mon, 09 May 2022 03:30:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcM5mMdpC9ZojQzl6AAeE2ewGdGHpOd8UbqZcx8RFL3mtFNso1L5CJZJidtyuCzwg/I+dCuA==
X-Received: by 2002:a7b:cd97:0:b0:38f:f785:ff8 with SMTP id
 y23-20020a7bcd97000000b0038ff7850ff8mr21417411wmj.44.1652092246808; 
 Mon, 09 May 2022 03:30:46 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a1c7205000000b003942a244ecbsm12207056wmc.16.2022.05.09.03.30.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 03:30:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/26] nvme: add missing coroutine_fn annotations
Date: Mon,  9 May 2022 12:30:05 +0200
Message-Id: <20220509103019.215041-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509103019.215041-1-pbonzini@redhat.com>
References: <20220509103019.215041-1-pbonzini@redhat.com>
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/nvme.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/block/nvme.c b/block/nvme.c
index 01fb28aa63..6519697e40 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -1234,8 +1234,9 @@ static inline bool nvme_qiov_aligned(BlockDriverState *bs,
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
2.35.1


