Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D80D654E855
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 19:07:16 +0200 (CEST)
Received: from localhost ([::1]:57940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1sxf-0006OJ-Vg
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 13:07:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o1soY-0004xl-5r
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 12:57:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o1soW-0001yb-LP
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 12:57:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655398668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NlUZccHco3O53JsRfPeS/lMyhHn0rsyO3VHNHDCSruI=;
 b=Agwv5UbA5T1exR+0dPx0Pc9isEXasLLjG/x2nhJtNReP5PYKSo49xYEQookdEOWQtM8NBo
 Lbmb2TQ3dBW6Yn3pyQn6dxtRZ1zU/Ln4W1wBXvkuE8u//nk+5hprMigO8BuurXCiHP64FE
 bOMQj6zyvBqf9jByfMtLWmRxo7nupxw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-ef8euUOZO362XTpgW7Jq8A-1; Thu, 16 Jun 2022 12:57:47 -0400
X-MC-Unique: ef8euUOZO362XTpgW7Jq8A-1
Received: by mail-wm1-f69.google.com with SMTP id
 o23-20020a05600c511700b0039743cd8093so1134842wms.6
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 09:57:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NlUZccHco3O53JsRfPeS/lMyhHn0rsyO3VHNHDCSruI=;
 b=cD5xAiVARt35yMfF7XlEceEj2s1eVymiiZq0/kgZnmBuG8UTerFzujSmJ2SaK11jlu
 Xpp6xPn3jIKYeSffORYnsHmPMO/avCjGHPObxJo7MZe8fxJiJUrHV0zDrH8jp7qw+e5P
 hLjr6+2ot1pF8Ti24eZAKNcXJibuP+q2Ez75noOy0a97a8AkDf1PDzDGuX8ZpzE6ji6T
 vdp3xnfHvLTLYbpVCtMy24pb+7cTvCACea6iwLT6ImdygccsVIGq3pCejkDxeRAbR6tZ
 5uTgtbQeU5FlTVqul4UomFyW45b//c3Xbk72UFG3rzG0Snf8vHSQ/X5yuy9iKLubw5J/
 5evA==
X-Gm-Message-State: AJIora+haV1LBjLDHNGjmNMJY1dWOKi4ouD4FGnIqWgDpw2CKihYjKIn
 1ier8eE+T2ZQX1OIYysZmvR07STVwFSof2sTfTzYVI8gUhMSY26rZumza6CDOP0d3sbYhABZuAD
 zE0xkkQP3fpz0zGlK3+eH/JDN6xXiAHALcJ2W5HGFkiKhp8DLO877TohWjhRc
X-Received: by 2002:a05:6000:1a8b:b0:219:af0c:ddf8 with SMTP id
 f11-20020a0560001a8b00b00219af0cddf8mr5528097wry.142.1655398665605; 
 Thu, 16 Jun 2022 09:57:45 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1scSySJABTfl4uZVJ7rMWTS/25z0TCiI0lp7k+Md4FofcZIsIgmWVMYkIeYazD73Loc9qCUBg==
X-Received: by 2002:a05:6000:1a8b:b0:219:af0c:ddf8 with SMTP id
 f11-20020a0560001a8b00b00219af0cddf8mr5528073wry.142.1655398665310; 
 Thu, 16 Jun 2022 09:57:45 -0700 (PDT)
Received: from redhat.com ([2.53.13.204]) by smtp.gmail.com with ESMTPSA id
 e18-20020adfe7d2000000b00219f9829b71sm2269315wrn.56.2022.06.16.09.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 09:57:44 -0700 (PDT)
Date: Thu, 16 Jun 2022 12:57:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Zhenzhong Duan <zhenzhong.duan@intel.com>,
 Eric Auger <eric.auger@redhat.com>
Subject: [PULL 07/10] virtio-iommu: Add an assert check in translate routine
Message-ID: <20220616165703.42226-8-mst@redhat.com>
References: <20220616165703.42226-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616165703.42226-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

From: Zhenzhong Duan <zhenzhong.duan@intel.com>

With address space switch supported, dma access translation only
happen after endpoint is attached to a non-bypass domain.

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
Message-Id: <20220613061010.2674054-4-zhenzhong.duan@intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-iommu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 73d5bde9d1..7c122ab957 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -865,6 +865,10 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
     qemu_rec_mutex_lock(&s->mutex);
 
     ep = g_tree_lookup(s->endpoints, GUINT_TO_POINTER(sid));
+
+    if (bypass_allowed)
+        assert(ep && ep->domain && !ep->domain->bypass);
+
     if (!ep) {
         if (!bypass_allowed) {
             error_report_once("%s sid=%d is not known!!", __func__, sid);
-- 
MST


