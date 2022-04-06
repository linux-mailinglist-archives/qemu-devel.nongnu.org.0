Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CD04F6C67
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 23:16:09 +0200 (CEST)
Received: from localhost ([::1]:55240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncD0a-00045W-Rg
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 17:16:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ncCwe-0006av-3j
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 17:12:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ncCwb-0004kS-Fx
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 17:12:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649279520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u0mNmytbvefXEVGdA2NGtUyUOKC//ISODVygseXjcAg=;
 b=hXzB50lB5wrZqOa4KNkUpLtZzMgMBNXcOQy67TS79kfUv2iIdGKi3IdDvr1JKMFHGJ8BxG
 R/2OOIBdf1B1F6N6a5UCHK8rtKHS3aKAXHQmq0p+23gygNxfxB51bRcQznvMhTNQzY6WQ/
 e+Kto2Wt3iNdGnKLRh5sMJ6RWNQruvE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-416-rfpAe1GvPNeiu8as_-0o0A-1; Wed, 06 Apr 2022 17:11:59 -0400
X-MC-Unique: rfpAe1GvPNeiu8as_-0o0A-1
Received: by mail-wm1-f70.google.com with SMTP id
 l19-20020a05600c1d1300b0038e736f98faso951490wms.4
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 14:11:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=u0mNmytbvefXEVGdA2NGtUyUOKC//ISODVygseXjcAg=;
 b=tYhnhOJfN35spgeAw9zeb0lwygW4Hw4CHU4uE8kR+1Rrzy1bsPWnOo7ZprPvKotnMO
 dBY4nx2T+Tiwhv2f004FZsZWD4w7P2kXuE3mxMItbLWKr3wlw6zPq6xLV2pTSEKgiFVt
 YcOMtG1hl4c/F7KR+uMaL6bwnDeVekUkteP8hm2VVWfcZvqr71TVc+ZH25PVMaLPwSFa
 Sa0C2zFvj/zxofC7HHORx9kA17SZnxQlIP27sB+ST5zs0ex7Q30dtny1JGfGB6oTz6BT
 rnPcYbKs91pknc5Hqyo1Mp8kOiDoS+nSJD8WI7zz9B2s6ip8fxVAdysNoaLM0n1V1Dh/
 6UZg==
X-Gm-Message-State: AOAM533h17wkHdIvyvZuWy/n6v0mzBAHEcg1F9WcRAZhCq56gEB1NGMn
 WW1LPs5WMXHbE1MLqvB5ZMjEeoQee1it4pUhG3chxYohxdvQXFJXp9pBi6V64zbPj40ImVd2NQc
 6FvlPLBvK3DNf5XspM0h74gxX/N91yOzsp1j0zR8rGcQ8X3WDf7FPID4lAvPi
X-Received: by 2002:a05:6000:156a:b0:204:1fb0:47e with SMTP id
 10-20020a056000156a00b002041fb0047emr8128648wrz.590.1649279518166; 
 Wed, 06 Apr 2022 14:11:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxl1+S8f1RG38BdxLfJiWMyrxLWYrzE6FOLsAVevQVDbpmL8aZRQN8ra9zz9Fp1yCUQD/ESDw==
X-Received: by 2002:a05:6000:156a:b0:204:1fb0:47e with SMTP id
 10-20020a056000156a00b002041fb0047emr8128628wrz.590.1649279517813; 
 Wed, 06 Apr 2022 14:11:57 -0700 (PDT)
Received: from redhat.com ([2.52.15.99]) by smtp.gmail.com with ESMTPSA id
 bi20-20020a05600c3d9400b0038cfe80eeddsm5300032wmb.29.2022.04.06.14.11.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 14:11:57 -0700 (PDT)
Date: Wed, 6 Apr 2022 17:11:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/3] intel-iommu: correct the value used for error_setg_errno()
Message-ID: <20220406211137.38840-3-mst@redhat.com>
References: <20220406211137.38840-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220406211137.38840-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jason Wang <jasowang@redhat.com>

error_setg_errno() expects a normal errno value, not a negated
one, so we should use ENOTSUP instead of -ENOSUP.

Fixes: Coverity CID 1487174
Fixes: ("intel_iommu: support snoop control")
Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20220401022824.9337-1-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Peter Xu <peterx@redhat.com>
---
 hw/i386/intel_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 32471a44cb..b4b4c82be6 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -3032,7 +3032,7 @@ static int vtd_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
 
     /* TODO: add support for VFIO and vhost users */
     if (s->snoop_control) {
-        error_setg_errno(errp, -ENOTSUP,
+        error_setg_errno(errp, ENOTSUP,
                          "Snoop Control with vhost or VFIO is not supported");
         return -ENOTSUP;
     }
-- 
MST


