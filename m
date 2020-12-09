Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D482D499C
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 19:58:30 +0100 (CET)
Received: from localhost ([::1]:42904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn4fV-0005qJ-IG
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 13:58:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3t8-0002EM-1u
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:08:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3t3-000869-K8
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:08:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l0gJ2VpSbCOtbZxPOChuV1mVFMIO/b+gNgYfj7nsR0w=;
 b=bD5GfSHF8E15d9OpfknM/AjUedfcxz/WSvPR+fGFsOTNMpt6lvz/UQlBwFnY1hr9jJKe73
 mUlizUEO6K/qXHAvXCPW3hZgMMsrtYqPebX3W5cdWWD8hs6X/37tZFmzI26tjch9p7tU5Z
 n6tywkk7Ve8zh/uiQx5TFOROgtKwpOw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-Tpti0F5NNVGUDnlzqDIOmw-1; Wed, 09 Dec 2020 13:08:21 -0500
X-MC-Unique: Tpti0F5NNVGUDnlzqDIOmw-1
Received: by mail-wm1-f71.google.com with SMTP id q17so641680wmc.1
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:08:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=l0gJ2VpSbCOtbZxPOChuV1mVFMIO/b+gNgYfj7nsR0w=;
 b=VV3Ybifx2FndUlRScQPIm+BHqkMZXSq+ALx3Mifn9Tgf/z3V6sOhxFUwJQoTDYKBM6
 1qjIF8vYYZ9jelMuAVzhAEr+sZM0K3FLqiCcan9tFyEvIMSakYSp9RR5iSG1KrClOgQ0
 Z9VbiAti9OvtsWFG9Kai7CGk5UQKSXxQeDy1rUZw37Lcyotx1ZrUpUofJTi4tvKAxWua
 4Pu+bATAJ9tMcQyQzX3zLGVihHF3G2GQ3Fnp+V/tEnLUcc9gasVVOjHmGuTrdV+3YnkS
 ZPnuAp9pTri8t9TufYF7VPCgtcD+au8XNn0kO1lHhxnNVwr3eflUL9f+jidKdBOV+OOY
 cnFw==
X-Gm-Message-State: AOAM530PHyu90TDfOkya2ceaRJFvcQKDBBEnOP1+Ccrvd9qHt3KyL+hz
 nVuomZY4O5/UE2zQEJylOBsw7gnGAFKxyqgO+Xhkx7jpAbHYY3ysGRs7kCovuUILnIag4hv8mJd
 cFAjQ44CquFnxsXiRLELbKlotjxBeTt5LBjEbILr+Z0Qbq0yRDakr7Ogt9oI4
X-Received: by 2002:a5d:5005:: with SMTP id e5mr3938999wrt.279.1607537300246; 
 Wed, 09 Dec 2020 10:08:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyT1cqVEA0W3+dVvR3nDhpokYiLI0CpalXVsvLyNiTRB50PQ5IA96wgkR5/sOJDB9chtYKfHQ==
X-Received: by 2002:a5d:5005:: with SMTP id e5mr3938976wrt.279.1607537300020; 
 Wed, 09 Dec 2020 10:08:20 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id q15sm4836085wrw.75.2020.12.09.10.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:08:19 -0800 (PST)
Date: Wed, 9 Dec 2020 13:08:16 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 22/65] failover: qdev_device_add() returns err or dev set
Message-ID: <20201209180546.721296-23-mst@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Juan Quintela <quintela@redhat.com>

Never both.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20201118083748.1328-8-quintela@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/virtio-net.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 6ca85627d8..3e82108d42 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -803,13 +803,6 @@ static void failover_add_primary(VirtIONet *n, Error **errp)
         if (err) {
             qemu_opts_del(n->primary_device_opts);
         }
-        if (n->primary_dev) {
-            if (err) {
-                qdev_unplug(n->primary_dev, &err);
-                qdev_set_id(n->primary_dev, "");
-
-            }
-        }
     } else {
         error_setg(errp, "Primary device not found");
         error_append_hint(errp, "Virtio-net failover will not work. Make "
-- 
MST


