Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6EF48808C
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 02:29:21 +0100 (CET)
Received: from localhost ([::1]:53496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n60Xo-00065A-76
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 20:29:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n609e-0003yK-Ew
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:04:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n609d-0002M2-4T
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:04:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641603860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=igipHoFkqG9ZkUxoX09dBUcpAVne7E9NONhvrwx9lW4=;
 b=CHnDMPonfl2SfhSTSMzNrKJLf5XiLJC60Lhmo6MhonfR+mcHW9P6BOb42c/pAmlu1ZWWAk
 v6OT9BGKoVdIKjyQylZqiRm4endjJWtPngJu1vcmR2zLyauH39+Hg+OHxderzM/YSXlyDY
 UGfSrEvDLTkkXaWbmIulx25m7I4Krio=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-333-l21jsvHwMMmYFYJSgqHuYw-1; Fri, 07 Jan 2022 20:04:19 -0500
X-MC-Unique: l21jsvHwMMmYFYJSgqHuYw-1
Received: by mail-wm1-f69.google.com with SMTP id
 e19-20020a05600c4e5300b003458be97976so2503215wmq.7
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 17:04:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=igipHoFkqG9ZkUxoX09dBUcpAVne7E9NONhvrwx9lW4=;
 b=CIBgc8Am/BcWL/7aOAf7rlHX8P4PdeedVZ6w5TkZr0IA54hrBcDCSbDWCfeziTj0b4
 oy1yE4Kz/u5qGty4UwPFVDxOiSUc6oNK8FjF+UOBTyWIvn0Ho/zLTIMIbLfRDOVsB20I
 At+3IXJWK2JjAApMEBCEAOgMaP6UbBRWFqJztUZoukn+oU52M38BrF0iPMExwv09Cehr
 dS4Ooz8P42YUUHoCmRF5yXC5UVW6qDOs/zMa279w7CKCd8AXsjXMTC1+332tk+IvMHdp
 49/2ZbplnmprcUa6vIVZi9YXFW9FB/N60/t8lJydQD2JZAhn4QKUp25AIiNG6n7hAZtr
 C4ww==
X-Gm-Message-State: AOAM533GYpe58hJ8a/2npbCG/SkyUcV6UGA6pqvvB9IDyIBLWvDLYm3u
 PCCYcjhKIiiazSq7DqkTDMbzPMbvaSYPz2Da3pEzY9T1Z9NsT1di76sq9LXiVJWvZpHFJJgTw6Y
 /Ytjco09KVe9FUxoHeabBFnBOh8GO9bTSABkCD/ip1rpWbtah11kxr59SORDE
X-Received: by 2002:a05:6000:1563:: with SMTP id
 3mr56740409wrz.372.1641603858190; 
 Fri, 07 Jan 2022 17:04:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxV2jQFySf7+y9HwU3/+YPDeAJi3jwv1RllI0wlcpBRwgrJQEZI2+J8pUVgdETKXcJcoFgi0Q==
X-Received: by 2002:a05:6000:1563:: with SMTP id
 3mr56740394wrz.372.1641603858008; 
 Fri, 07 Jan 2022 17:04:18 -0800 (PST)
Received: from redhat.com ([147.161.13.99])
 by smtp.gmail.com with ESMTPSA id o3sm216602wry.98.2022.01.07.17.04.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 17:04:17 -0800 (PST)
Date: Fri, 7 Jan 2022 20:04:14 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 14/55] vhost-user-blk: reconnect on any error during realize
Message-ID: <20220108003423.15830-15-mst@redhat.com>
References: <20220108003423.15830-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220108003423.15830-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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


