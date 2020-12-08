Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1367C2D32D7
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 20:55:56 +0100 (CET)
Received: from localhost ([::1]:47314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmj5X-0007ny-5H
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 14:55:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmilO-0005R9-JT
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:35:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmilK-0004zM-2N
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:35:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e63XrFjhRraaBUyyxddNntT8UVuXnzEpnyPrT9Xi6Do=;
 b=LDKcDS5MtWlNCn35Fp697jYHv0fPwH7/EFmWNkr+09fJKvB5ebuCZ0VDluKlQ3fcyMmjM9
 FEljRVCipcJ1ieaogAdIcDtyPip7bZtesmGPDHS8EYu/YZ9bH5Zlt1xDT0kF9Zso/x2Wtn
 yhDtzIZRVo236u3jTFxq8CjuMoaehto=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-XbdY3kj9PsWjzaM-zXn51g-1; Tue, 08 Dec 2020 14:34:57 -0500
X-MC-Unique: XbdY3kj9PsWjzaM-zXn51g-1
Received: by mail-wm1-f70.google.com with SMTP id q17so700542wmc.1
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:34:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=e63XrFjhRraaBUyyxddNntT8UVuXnzEpnyPrT9Xi6Do=;
 b=t/NUsgC30jhmVLt2sPNJoJ8oOmeFoZqDC0cNP4bLfWNfOLTEJyIiLHyFs6ylPqmtJ2
 cavXh1x52FYZ5jyIH6sch3V0tKO4/DIVua9osrXC4N4mu45pc+OkNyZ1KUb3FWcP2/I+
 CwlvvuWm4++iPSG2QhvsqI6E02yJhUwP5tkNr6T7DlsjSi2Ch3pENyqNTiTilaRk5sa5
 kttkKaRYvoHxg+wx/3oP5IqDh7eoK49w2+zG6hMyONcio5LvdX5R+2YXiVqPXS3cDyz6
 s7/xNmaXtnCmWgdE24hkVu0ZkG5M7Z3lJDv1FkydVWo28tlT6zbMzr6hgxK8qdbwkwvV
 FqkA==
X-Gm-Message-State: AOAM533iq7yzeQPIhkgJr1+c3lMjFLIUck7UAQ1y4cy/5W1e3H7tGxaq
 KThwHNPn+SZo3f9NB461bE/y7/LxqPY5NGkJmWGFnsPI3Nej6mk27r+m7uopTIiTM3/u4eYfqVv
 VwOVsTIgvW1GFiZ7JOkpkCjaP4g5zrJU2Ut3+xDW2WFg9G2zy4AsixQ04kJc7
X-Received: by 2002:a05:600c:2116:: with SMTP id
 u22mr5208041wml.174.1607456095769; 
 Tue, 08 Dec 2020 11:34:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyAxMl/5DeewYmVPofY679evIcfLRedoxLBmBvWwMWwaJ3MkEmCOXElPbENFh0+IBEx6ABsZw==
X-Received: by 2002:a05:600c:2116:: with SMTP id
 u22mr5208026wml.174.1607456095541; 
 Tue, 08 Dec 2020 11:34:55 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id k1sm21327089wrp.23.2020.12.08.11.34.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:34:54 -0800 (PST)
Date: Tue, 8 Dec 2020 14:34:52 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 24/66] failover: g_strcmp0() knows how to handle NULL
Message-ID: <20201208193307.646726-25-mst@redhat.com>
References: <20201208193307.646726-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201208193307.646726-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20201118083748.1328-10-quintela@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/virtio-net.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index c221671852..e334f05352 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -818,7 +818,7 @@ static int is_my_primary(void *opaque, QemuOpts *opts, Error **errp)
     int ret = 0;
     const char *standby_id = qemu_opt_get(opts, "failover_pair_id");
 
-    if (standby_id != NULL && (g_strcmp0(standby_id, n->netclient_name) == 0)) {
+    if (g_strcmp0(standby_id, n->netclient_name) == 0) {
         n->primary_device_id = g_strdup(opts->id);
         ret = 1;
     }
-- 
MST


