Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 384724AAEC5
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 11:11:12 +0100 (CET)
Received: from localhost ([::1]:44912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGeVi-00038m-JE
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 05:11:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGe0Y-0001Ko-QO
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:39:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGe0W-0003lB-L6
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:38:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644140336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oz2e6MHHl60kdDpnLZXoNoUL3IzInDDXRSJJeB+BbMA=;
 b=RmjdHNQqvgsbKShwcMp7vDZdLWEST4iQryz7rAgZJG+rncn9Oq9f6lAfqkgMUVm++g0gj2
 bJ19T/+lqG46AshEZPQTFS7q7qQLeikqImW5XkTrMj0CQ1ADanuavyeNQYKL9tA3Y39kbp
 e/TPxN/RToyGJHRaXYM00oC9k46K/rs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-137-tcXegQXVOUmkDXc6t1W_WQ-1; Sun, 06 Feb 2022 04:38:54 -0500
X-MC-Unique: tcXegQXVOUmkDXc6t1W_WQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 s187-20020a1ca9c4000000b0037bb8547d64so1532472wme.0
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 01:38:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=oz2e6MHHl60kdDpnLZXoNoUL3IzInDDXRSJJeB+BbMA=;
 b=QHapZOASRCESN/444EsK3aB5oyYA3JXLq36eR3gyTT/lsNBAsSqIXvPQ4AIV91yu8t
 ZInoWFP8gAj8NP7CGuFUAwN3CADXPmr6TYLhHyMm1OdYEJxbG1DUJCjztqzG/v9uTQzz
 XqpWPtTQqPoBGHF8kXR/bLVBxIF5QXXlYoeUHOJCzOqcP+sUNBxy0RDWgppTw+S5/H1Q
 uPB8G7fG0qiT1wluVRAAjUgCwRKJiIieGfvkDCI2E9EIa4j6Jej2Cx2X+LnApJfDNyTs
 +Cp4qquW/m2bZIU6hN8t9q/bDFsOZ9h402MH4XXxWcWWC6sLxTw35iIps7bxhWdMUX2g
 SbMw==
X-Gm-Message-State: AOAM530xHH+kwSPG/LkpgAZzzlWu9+jEgiCz64saOJ0rpYrD2ZgadqcK
 2BxY+Y2iYAjv8x77k4VE9XtrbJ12jC/+iMNRJ1s8d4IQ4xeoaTIZLcLvbWs4cNtTWIHZoJQsqMQ
 itsGl+bWCsOqlxNYLtR97veVLOkLsJU57ZL9TqCkbRL+2wp8uMacbLXJ75LfE
X-Received: by 2002:adf:fa48:: with SMTP id y8mr5736173wrr.646.1644140333420; 
 Sun, 06 Feb 2022 01:38:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyWwXj6znhXQ27Qo0lAni5unMj8fL0ddJqeSfvI5gXpmFvbPaD3entidbihTAto7cTUx5X/TA==
X-Received: by 2002:adf:fa48:: with SMTP id y8mr5736152wrr.646.1644140333186; 
 Sun, 06 Feb 2022 01:38:53 -0800 (PST)
Received: from redhat.com ([2.52.12.81])
 by smtp.gmail.com with ESMTPSA id f2sm7139503wri.49.2022.02.06.01.38.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 01:38:52 -0800 (PST)
Date: Sun, 6 Feb 2022 04:38:50 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 24/24] util/oslib-posix: Fix missing unlock in the error
 path of os_mem_prealloc()
Message-ID: <20220206093702.1282676-25-mst@redhat.com>
References: <20220206093702.1282676-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220206093702.1282676-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 David Hildenbrand <david@redhat.com>, Michal Privoznik <mprivozn@redhat.com>,
 Pankaj Gupta <pankaj.gupta@ionos.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

We're missing an unlock in case installing the signal handler failed.
Fortunately, we barely see this error in real life.

Fixes: a960d6642d39 ("util/oslib-posix: Support concurrent os_mem_prealloc() invocation")
Fixes: CID 1468941
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Pankaj Gupta <pankaj.gupta@ionos.com>
Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Michal Privoznik <mprivozn@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20220111120830.119912-1-david@redhat.com>
Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 util/oslib-posix.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 9efdc74bba..ac0dbc2adc 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -683,6 +683,7 @@ void os_mem_prealloc(int fd, char *area, size_t memory, int smp_cpus,
 
         ret = sigaction(SIGBUS, &act, &sigbus_oldact);
         if (ret) {
+            qemu_mutex_unlock(&sigbus_mutex);
             error_setg_errno(errp, errno,
                 "os_mem_prealloc: failed to install signal handler");
             return;
-- 
MST


