Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9114A2D4A08
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 20:26:26 +0100 (CET)
Received: from localhost ([::1]:34588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn56X-0001wV-Ip
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 14:26:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3wO-0005MB-UV
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:11:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3wM-0000mc-Dm
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:11:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IXfUWibUDD3qvFBeOlmCILSH/5yiUugL3d2LfLjhcv4=;
 b=CHHVIe5CPHq0ZTPQ6yVi1zCsoliOIAlHnjmpZZaSZo9Y6DfQzkp8m3ru3I9mZd/+5sPYrX
 PVrLWPvZuyTNBqMojniNvBwHlnpTyKsatq7oj9g3/QPWdjDqV/nMm7gEJrXLRnDYqpZFAm
 tqcC0CI7nYX7LEEShV4YvGETrseF+Dg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-3Fgvh8O5NuG7pN-3CnTx2g-1; Wed, 09 Dec 2020 13:11:47 -0500
X-MC-Unique: 3Fgvh8O5NuG7pN-3CnTx2g-1
Received: by mail-wm1-f71.google.com with SMTP id u123so640927wmu.5
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:11:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IXfUWibUDD3qvFBeOlmCILSH/5yiUugL3d2LfLjhcv4=;
 b=Kgj6o9qZrBRBqfoSUyr5reVy1p9Fc+3OCQjDop9kcp9H0NhUpkBH41YfDQd39CoXss
 Bx0ocMM/HA9asj+TAaX9y2Mzuy5Dw5OnHOQrFZOGsOBSnRpxgl4+If4tj4ptNJ+3CBlY
 BeGVl+b5H9+lZ1sOC75tkYL8T4ogRrRdVz7ZGx4qietxkcYQ9mb3nrixnEGlW6VRwpOy
 ahxmaOiyEbOsyC/McygwssYbsyaDsjOpKNJpQQhGWzPM+Fs+MfVsPRmwEXOusP/Nbyzk
 NpNNng96FwGKJqAKhzHCftIJj3YDcqpA+yDs+3ZsPMt+4wosyR6I8BuBRH/saLCdFJBA
 frxw==
X-Gm-Message-State: AOAM530/UkHzCGNkG49dNlU7FRpWX20rDh0N4/Ec4HwZNoehOp7Axa5M
 PPEA0jctNuazJWlmXzpkw0siAbeRU0zOWeeHyU+Oti6jeyLLyfMVkb3aoIHyMJbWC6Q88WbnlCo
 uH0f9B/UpfAORrNqNf3qSWPvXuH22L5fyazf82MJkY6PzxkwwlHm9OpaSzq+I
X-Received: by 2002:adf:e64b:: with SMTP id b11mr3981491wrn.257.1607537506000; 
 Wed, 09 Dec 2020 10:11:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzzxpwI4ETyf/9VAJua3fWTwOmtWHjN4lD7+HL2SOedA+edgndCCOtv3pDueztMkkhP2vFHAA==
X-Received: by 2002:adf:e64b:: with SMTP id b11mr3981476wrn.257.1607537505844; 
 Wed, 09 Dec 2020 10:11:45 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id t16sm5016125wri.42.2020.12.09.10.11.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:11:45 -0800 (PST)
Date: Wed, 9 Dec 2020 13:11:36 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 63/65] pcie_aer: Fix help message of pcie_aer_inject_error
 command
Message-ID: <20201209180546.721296-64-mst@redhat.com>
References: <20201209180546.721296-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201209180546.721296-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Zenghui Yu <yuzenghui@huawei.com>, Peter Maydell <peter.maydell@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zenghui Yu <yuzenghui@huawei.com>

There is an interesting typo in the help message of pcie_aer_inject_error
command. Use 'tlp' instead of 'tlb' to match the PCIe AER term.

Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
Message-Id: <20201204030953.837-1-yuzenghui@huawei.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hmp-commands.hx | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index ff2d7aa8f3..dd460eb908 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1302,8 +1302,8 @@ ERST
 	              " -c for correctable error\n\t\t\t"
                       "<id> = qdev device id\n\t\t\t"
                       "<error_status> = error string or 32bit\n\t\t\t"
-                      "<tlb header> = 32bit x 4\n\t\t\t"
-                      "<tlb header prefix> = 32bit x 4",
+                      "<tlp header> = 32bit x 4\n\t\t\t"
+                      "<tlp header prefix> = 32bit x 4",
         .cmd        = hmp_pcie_aer_inject_error,
     },
 
-- 
MST


