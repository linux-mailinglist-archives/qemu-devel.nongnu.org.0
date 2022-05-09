Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8837C51FB11
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 13:13:34 +0200 (CEST)
Received: from localhost ([::1]:44060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no1KX-00023F-Lw
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 07:13:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0fd-0005G3-0y
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:31:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0fZ-0002qh-PA
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:31:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652092273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v1wXjy3dOvISKhKrLTVr4XDRoBc4ykMCUe9x4ZrVMjo=;
 b=Q4F5whCsIfk5NFa/V3OHaw80a85s3Xcv4iI8zWBtfFqqy661Wid9W1yaMvbigvh1AmwfsA
 aHJ+5hnboU41GbZ6Zk6TWv3syQZLwA5B++hN+zubuVKqCqb6bGvMtUfzKFzBFXyN1h900c
 fjsHEMFEdjdWzt7Lwruk0sA3oB1/mv4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-446-Ee0BMztrMc-7EK-kRwQDcg-1; Mon, 09 May 2022 06:31:11 -0400
X-MC-Unique: Ee0BMztrMc-7EK-kRwQDcg-1
Received: by mail-wr1-f70.google.com with SMTP id
 v17-20020a056000163100b0020c9b0e9039so4565891wrb.18
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 03:31:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v1wXjy3dOvISKhKrLTVr4XDRoBc4ykMCUe9x4ZrVMjo=;
 b=eSBtZ1PiYJw0y4p/Bi7U0ivPFIE4klvPFAqsoMQqaBuJdfFPcQojCfvnY41g1m4sJD
 J56SjthEVRr8KEEeWcA+/uO++RPJho204+EHyuNgi7M2+dpfWgbNx1BJ4wLmJZr36enn
 ktpBt9E4YrlYT201d28CzUOqlTdKZQ6caayjoaJ30//AQRpZo6Ti8Id1aHZvbQTYt1fY
 Gq++rpFLRmi4x+WZnSotUEzwk0P9dk80CBy1/nLtV3E9oRizKuBQOb7/3RkVwfA2TuJT
 t9ny4HWylBUal4Hf+dHfFilEkcAoSE6pzCCKn38qou3Ds4of5iuMIrkMb90QgwkaiWsI
 ogSQ==
X-Gm-Message-State: AOAM532EIV1ifpVAlN8a08io24ihoaI8oZFVK+4NQyXrVJyeKwQZAJoC
 vUH6RDAKCXMqQ7ACE4ItaD5+DNplpTEuMRGmhU5+VUCZCf2ou8I7OQV86kczQ1ymNX8TUqJTffX
 v12SYeknqzY5nkavQ0WNhdOb57RxfOaHNG/uR6vKeoOhWdqI8mJuNaedZWaV9ZDH80xc=
X-Received: by 2002:a05:600c:1d08:b0:394:54ee:c994 with SMTP id
 l8-20020a05600c1d0800b0039454eec994mr15128887wms.137.1652092270013; 
 Mon, 09 May 2022 03:31:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdEv+zZrmaYRhteWCMm3/pM1APfr6PaARAOaNIqJYXYdQ+Ub1zjoSGV0VobBx7TT0ofp+W6Q==
X-Received: by 2002:a05:600c:1d08:b0:394:54ee:c994 with SMTP id
 l8-20020a05600c1d0800b0039454eec994mr15128845wms.137.1652092269559; 
 Mon, 09 May 2022 03:31:09 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 y11-20020a1c4b0b000000b003945781b725sm14869730wma.37.2022.05.09.03.31.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 03:31:08 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 19/26] throttle: add missing coroutine_fn annotations
Date: Mon,  9 May 2022 12:30:12 +0200
Message-Id: <20220509103019.215041-20-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509103019.215041-1-pbonzini@redhat.com>
References: <20220509103019.215041-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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
 block/throttle.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/throttle.c b/block/throttle.c
index 6e8d52fa24..ddd450593a 100644
--- a/block/throttle.c
+++ b/block/throttle.c
@@ -162,7 +162,7 @@ static int coroutine_fn throttle_co_pwritev_compressed(BlockDriverState *bs,
                                BDRV_REQ_WRITE_COMPRESSED);
 }
 
-static int throttle_co_flush(BlockDriverState *bs)
+static int coroutine_fn throttle_co_flush(BlockDriverState *bs)
 {
     return bdrv_co_flush(bs->file->bs);
 }
-- 
2.35.1


