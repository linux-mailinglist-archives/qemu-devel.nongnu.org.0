Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B4448766B
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 12:24:49 +0100 (CET)
Received: from localhost ([::1]:48454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5nMW-0006BD-CB
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 06:24:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n2H-0007aD-F0
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:03:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n2F-0001q0-Px
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:03:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641553431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=igipHoFkqG9ZkUxoX09dBUcpAVne7E9NONhvrwx9lW4=;
 b=g8uWJK36Qs9Zv41V7UuZjIqqY4Ht3rX89i1/ud70qMoliheIPXB5x9I5GDA6J6fphUQpmd
 CFAV0HUjZlf2+jcPY7izJ0QxGjwOECWMWhwZQVTU1JdhZ9TLq78ll+VydhjskCm+bO7PKz
 qrNQ6FDFdUfQbwk1ryuEWqJvy9HA8Lk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-10-WSSzkhwgNpuMqcQ7dUZyuw-1; Fri, 07 Jan 2022 06:03:50 -0500
X-MC-Unique: WSSzkhwgNpuMqcQ7dUZyuw-1
Received: by mail-wm1-f71.google.com with SMTP id
 m15-20020a7bce0f000000b003473d477618so1969553wmc.8
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 03:03:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=igipHoFkqG9ZkUxoX09dBUcpAVne7E9NONhvrwx9lW4=;
 b=OgqCoES55XfcA697CvuREQvVGQ5Rzv06UxckiDxJ+4+B2FvDCPXaU3SoELpVwCTvS7
 z+jy1x4DXodeeDrWYAbXD/AVC5Nuc5YW5xfJtiMsYcJW+Mz8oNx1nK1Qc+bhrSChiiQu
 f8Rp0zSSXD89/8q+qsNADaFGNAs+yLv9RB11WsuenAjF7b7HySfzVFTNawM1FqQwHZyP
 mlFenSjsA651zxQWpBAMVaOOZUcECJsLZ9rPUZCIG5Nv1pTdIH3kvC7+SJbTugEtKIkh
 61Z43a2PAi9jVXJLuk0Sfqzs13JeuL26Vd9z0YQkMOY7ESeqycgjuGCy1HVVebfCcasg
 3QJg==
X-Gm-Message-State: AOAM531/4DZ2jNNNikONlTLVSarxI7A7Omj7SdGPY1BPR//V/N2oPMGA
 NZlgSGBVXaNrL218lSw4/Oi4Duta9EEB1/JMT8JE0rNZ7nF3++xDHtgYPCIAze0oMP9R51f74il
 YLxC+1gBrpuIxvo8NNNh3Pq+S6HWVf6HWjkwO5mYMt/sK3CGERLz/T5aP7Wbj
X-Received: by 2002:adf:d21b:: with SMTP id j27mr8345077wrh.381.1641553429000; 
 Fri, 07 Jan 2022 03:03:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwbEPX3htG5I/RDaRHR2NUunJSFURn8o4d99aOutFgSXGED1QayyTDoZbLdV6eyQKygPmXRdQ==
X-Received: by 2002:adf:d21b:: with SMTP id j27mr8345049wrh.381.1641553428724; 
 Fri, 07 Jan 2022 03:03:48 -0800 (PST)
Received: from redhat.com ([2.55.16.192])
 by smtp.gmail.com with ESMTPSA id m15sm5103562wrw.27.2022.01.07.03.03.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 03:03:48 -0800 (PST)
Date: Fri, 7 Jan 2022 06:03:45 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 14/55] vhost-user-blk: reconnect on any error during realize
Message-ID: <20220107102526.39238-15-mst@redhat.com>
References: <20220107102526.39238-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220107102526.39238-1-mst@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Roman Kagan <rvkagan@yandex-team.ru>, Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Roman Kagan <rvkagan@yandex-team.ru>

vhost-user-blk realize only attempts to reconnect if the previous
connection attempt failed on "a problem with the connection and not an
error related to the content (which would fail again the same way in the
next attempt)".

However this distinction is very subtle, and may be inadvertently broken
if the code changes somewhere deep down the stack and a new error gets
propagated up to here.

OTOH now that the number of reconnection attempts is limited it seems
harmless to try reconnecting on any error.

So relax the condition of whether to retry connecting to check for any
error.

This patch amends a527e312b5 "vhost-user-blk: Implement reconnection
during realize".

Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
Message-Id: <20211111153354.18807-2-rvkagan@yandex-team.ru>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
---
 hw/block/vhost-user-blk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index ba13cb87e5..f9b17f6813 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -511,7 +511,7 @@ static void vhost_user_blk_device_realize(DeviceState *dev, Error **errp)
             *errp = NULL;
         }
         ret = vhost_user_blk_realize_connect(s, errp);
-    } while (ret == -EPROTO && retries--);
+    } while (ret < 0 && retries--);
 
     if (ret < 0) {
         goto virtio_err;
-- 
MST


