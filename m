Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C69D5292DA
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:28:19 +0200 (CEST)
Received: from localhost ([::1]:34598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqiGI-0000l3-6o
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhjE-0000cS-9s
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:54:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhjB-0006h9-Ph
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:54:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YtuLKHZQnIkaXOfZ3CPnLzT68FYvl3RPQfjN7N+G8D0=;
 b=Bz2qFwLdPPdnS6t2WOnZJuqCwnUOeFW1gQvcb7nW2ZRIQlH2AxJNhdERgpV6aCGkqC/8Un
 MVt/NnOYoMtSEjLY10NQX7bNKLdIlD8r6Ju+zT7F6BUMKbopmbj8gD2i5AklaOlXYzEF6z
 sFB99Md8HM4Q2ggdJtcmp/sDgh3LRz0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-ImMWzgHkMxGofiLzvcnPuQ-1; Mon, 16 May 2022 16:54:02 -0400
X-MC-Unique: ImMWzgHkMxGofiLzvcnPuQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 ay24-20020a056402203800b0042a96a76ba5so4445008edb.20
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:54:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YtuLKHZQnIkaXOfZ3CPnLzT68FYvl3RPQfjN7N+G8D0=;
 b=aHmP9ZKqHZDSyvf6V582bADneRmNDO+AGSRalM1BzWWLAsmZc9GEi3bN6cqrOsFt4P
 jV6XKyVo+GtNAv2oxpHEGxrXkdoGAYOk7E3SzrYT80t61V5zKkXEIAaFcTKLA81y+JeM
 sjEMTg1RfKAqyY/x1nsQ07a8V/ka+yl9Eqi2mYHAF2CMtqidbmzAWoLmFskMOLxEhTzP
 ApnBE4TQ2AHS4cO65mKi8sGdlJuzhtspWFhAZReO4gXFsKYywvvZmOwFdL5DArEeNqkb
 6YQMdiC7NHaET+Ysk6bRNPhNZZL6WPBrRBDpNJyiCLNXd+nhPt3pAA8skafoDX8g9oYY
 zxMQ==
X-Gm-Message-State: AOAM531lGqvbzHyHDuFr5ugllq/kPTc8KuAbf6EZbyc93Iym7iRuj3HH
 S70sD3AkQ4xnpq284ot1O5niImneeSEfJPmhAs/SFnNpRibowMO9VIEeIU/6mwHKcCE0TSoM7hN
 RWj/7EEm6vX6LzOOyOYjqZcJbpWdlTehWK/Vi1sHfFn7iPz1hK85OveLw+Anb
X-Received: by 2002:a17:907:7da3:b0:6f5:2d00:e069 with SMTP id
 oz35-20020a1709077da300b006f52d00e069mr16153582ejc.743.1652734441035; 
 Mon, 16 May 2022 13:54:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyLMwsxt7TBiapR1jmFTVoKUbp5TBkVJTPvuJyKjvspSxXCbpIQkUd2CGApLe1Ram4uE6emw==
X-Received: by 2002:a17:907:7da3:b0:6f5:2d00:e069 with SMTP id
 oz35-20020a1709077da300b006f52d00e069mr16153562ejc.743.1652734440757; 
 Mon, 16 May 2022 13:54:00 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 de27-20020a1709069bdb00b006f3ef214ddesm173500ejc.68.2022.05.16.13.53.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:54:00 -0700 (PDT)
Date: Mon, 16 May 2022 16:53:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Peter Xu <peterx@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL v2 55/86] intel-iommu: update root_scalable before switching
 as during post_load
Message-ID: <20220516204913.542894-56-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: Jason Wang <jasowang@redhat.com>

We need check whether passthrough is enabled during
vtd_switch_address_space() by checking the context entries. This
requires the root_scalable to be set correctly otherwise we may try to
check legacy rsvd bits instead of scalable ones.

Fixing this by updating root_scalable before switching the address
spaces during post_load.

Fixes: fb43cf739e ("intel_iommu: scalable mode emulation")
Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20220317080522.14621-1-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
---
 hw/i386/intel_iommu.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 695dd51dc3..53e3f5035d 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -3073,13 +3073,6 @@ static int vtd_post_load(void *opaque, int version_id)
 {
     IntelIOMMUState *iommu = opaque;
 
-    /*
-     * Memory regions are dynamically turned on/off depending on
-     * context entry configurations from the guest. After migration,
-     * we need to make sure the memory regions are still correct.
-     */
-    vtd_switch_address_space_all(iommu);
-
     /*
      * We don't need to migrate the root_scalable because we can
      * simply do the calculation after the loading is complete.  We
@@ -3089,6 +3082,13 @@ static int vtd_post_load(void *opaque, int version_id)
      */
     vtd_update_scalable_state(iommu);
 
+    /*
+     * Memory regions are dynamically turned on/off depending on
+     * context entry configurations from the guest. After migration,
+     * we need to make sure the memory regions are still correct.
+     */
+    vtd_switch_address_space_all(iommu);
+
     return 0;
 }
 
-- 
MST


