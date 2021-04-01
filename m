Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD36351ACC
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 20:07:35 +0200 (CEST)
Received: from localhost ([::1]:46766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lS1jC-0004vV-I5
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 14:07:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lS1ew-0003CL-4T
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 14:03:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lS1er-0005un-Nn
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 14:03:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617300182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h65aMxnNkYxHbHEHjKmqfyD+Jd/8b7KZUucec9Sz/nI=;
 b=HxfWBX2wneP/zgtBNmHCCgIWtpAepxbYOCO0A9cQKvmJnzo/9mYONjnPjf4cxliK3x03F/
 eEGRK/vH7Ws8IEQ5igeLnXwwH2DwiUux7T2PTsjM3r3N9615fTMtdACLuhMukT721P3Hi4
 EaO7aNauCeWbsUFzpp4gmCjJzzZTlTc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-7FWMNU_kPsmjminnAZP6ew-1; Thu, 01 Apr 2021 14:02:59 -0400
X-MC-Unique: 7FWMNU_kPsmjminnAZP6ew-1
Received: by mail-wr1-f71.google.com with SMTP id n16so3133700wro.1
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 11:02:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=h65aMxnNkYxHbHEHjKmqfyD+Jd/8b7KZUucec9Sz/nI=;
 b=A1lS8J9TrZ4zbCdWDjsxvDCthG8UpzrupasAC1gvJKLQmlI04vZQQ8+RiqN88nUJIn
 fsOnjX7l0mIEcfEEuOYpaNYuqH8lXxWuQgP6+Gu1DnOscx9Q8SNVf21WnNUP1k8n6RoT
 B85fvdqyR/5WQRfJBXqve6Oruxf1Y9J5onpyj3eHPaVKho4J4QDOrxLErNzQb3vwdjiY
 48m7pmC9qNUQ4/Jq0VaPCkzel/0b0by6Av2L2WzBde45fYICIMRkOsVXj8oglXvDbjYQ
 hJjR14X1bmwC56f8clThCnNUDSKt0gpKU+UCtjbMTHvMg0Mjgq/282kVR6WWpBz09At5
 o27w==
X-Gm-Message-State: AOAM533csETjaMGbJkDDjjoLoJRD3OX9uwp6qJcpH6uZvTo9h8fO8wN3
 TRlVFeIMdUIyEBR3fMpt8vkuL7SmFDmfYNfL+cHHhIOTh8cv9/yqL47yJ+sHTWFHvEUJKwBA+tC
 CVtq0ZhleGJsi355J6+YLEugtSndWW6Np1Y1Kqt4S7R/uoTIMk/M3YO5OQFD1
X-Received: by 2002:a1c:6241:: with SMTP id w62mr9195115wmb.79.1617300177875; 
 Thu, 01 Apr 2021 11:02:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYzXeNCl9liCe54HbxD5jXdKA0VYL/ZhUdp0P7KfuqfjSXopdm4aFNF+4NZWZrkpmveQ6BsQ==
X-Received: by 2002:a1c:6241:: with SMTP id w62mr9194999wmb.79.1617300176373; 
 Thu, 01 Apr 2021 11:02:56 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id u9sm8389352wmq.30.2021.04.01.11.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 11:02:55 -0700 (PDT)
Date: Thu, 1 Apr 2021 14:02:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/9] vhost-user-blk: perform immediate cleanup if disconnect
 on initialization
Message-ID: <20210401180235.226321-3-mst@redhat.com>
References: <20210401180235.226321-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210401180235.226321-1-mst@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Denis Plotnikov <den-plotnikov@yandex-team.ru>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Denis Plotnikov <den-plotnikov@yandex-team.ru>

Commit 4bcad76f4c39 ("vhost-user-blk: delay vhost_user_blk_disconnect")
introduced postponing vhost_dev cleanup aiming to eliminate qemu aborts
because of connection problems with vhost-blk daemon.

However, it introdues a new problem. Now, any communication errors
during execution of vhost_dev_init() called by vhost_user_blk_device_realize()
lead to qemu abort on assert in vhost_dev_get_config().

This happens because vhost_user_blk_disconnect() is postponed but
it should have dropped s->connected flag by the time
vhost_user_blk_device_realize() performs a new connection opening.
On the connection opening, vhost_dev initialization in
vhost_user_blk_connect() relies on s->connection flag and
if it's not dropped, it skips vhost_dev initialization and returns
with success. Then, vhost_user_blk_device_realize()'s execution flow
goes to vhost_dev_get_config() where it's aborted on the assert.

To fix the problem this patch adds immediate cleanup on device
initialization(in vhost_user_blk_device_realize()) using different
event handlers for initialization and operation introduced in the
previous patch.
On initialization (in vhost_user_blk_device_realize()) we fully
control the initialization process. At that point, nobody can use the
device since it isn't initialized and we don't need to postpone any
cleanups, so we can do cleaup right away when there is a communication
problem with the vhost-blk daemon.
On operation we leave it as is, since the disconnect may happen when
the device is in use, so the device users may want to use vhost_dev's data
to do rollback before vhost_dev is re-initialized (e.g. in vhost_dev_set_log()).

Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Message-Id: <20210325151217.262793-3-den-plotnikov@yandex-team.ru>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/block/vhost-user-blk.c | 48 +++++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index 1af95ec6aa..4e215f71f1 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -402,38 +402,38 @@ static void vhost_user_blk_event(void *opaque, QEMUChrEvent event,
         break;
     case CHR_EVENT_CLOSED:
         /*
-         * A close event may happen during a read/write, but vhost
-         * code assumes the vhost_dev remains setup, so delay the
-         * stop & clear. There are two possible paths to hit this
-         * disconnect event:
-         * 1. When VM is in the RUN_STATE_PRELAUNCH state. The
-         * vhost_user_blk_device_realize() is a caller.
-         * 2. In tha main loop phase after VM start.
-         *
-         * For p2 the disconnect event will be delayed. We can't
-         * do the same for p1, because we are not running the loop
-         * at this moment. So just skip this step and perform
-         * disconnect in the caller function.
-         *
-         * TODO: maybe it is a good idea to make the same fix
-         * for other vhost-user devices.
+         * Closing the connection should happen differently on device
+         * initialization and operation stages.
+         * On initalization, we want to re-start vhost_dev initialization
+         * from the very beginning right away when the connection is closed,
+         * so we clean up vhost_dev on each connection closing.
+         * On operation, we want to postpone vhost_dev cleanup to let the
+         * other code perform its own cleanup sequence using vhost_dev data
+         * (e.g. vhost_dev_set_log).
          */
         if (realized) {
+            /*
+             * A close event may happen during a read/write, but vhost
+             * code assumes the vhost_dev remains setup, so delay the
+             * stop & clear.
+             */
             AioContext *ctx = qemu_get_current_aio_context();
 
             qemu_chr_fe_set_handlers(&s->chardev, NULL, NULL, NULL, NULL,
                     NULL, NULL, false);
             aio_bh_schedule_oneshot(ctx, vhost_user_blk_chr_closed_bh, opaque);
-        }
 
-        /*
-         * Move vhost device to the stopped state. The vhost-user device
-         * will be clean up and disconnected in BH. This can be useful in
-         * the vhost migration code. If disconnect was caught there is an
-         * option for the general vhost code to get the dev state without
-         * knowing its type (in this case vhost-user).
-         */
-        s->dev.started = false;
+            /*
+             * Move vhost device to the stopped state. The vhost-user device
+             * will be clean up and disconnected in BH. This can be useful in
+             * the vhost migration code. If disconnect was caught there is an
+             * option for the general vhost code to get the dev state without
+             * knowing its type (in this case vhost-user).
+             */
+            s->dev.started = false;
+        } else {
+            vhost_user_blk_disconnect(dev);
+        }
         break;
     case CHR_EVENT_BREAK:
     case CHR_EVENT_MUX_IN:
-- 
MST


