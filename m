Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C81F1343BA0
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 09:23:26 +0100 (CET)
Received: from localhost ([::1]:34584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOFqP-00049Y-BV
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 04:23:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1lOFp4-0003gJ-Ui; Mon, 22 Mar 2021 04:22:03 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:39294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1lOFov-0008Nh-AI; Mon, 22 Mar 2021 04:22:01 -0400
Received: from iva8-d077482f1536.qloud-c.yandex.net
 (iva8-d077482f1536.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2f26:0:640:d077:482f])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id A84122E173D;
 Mon, 22 Mar 2021 11:21:42 +0300 (MSK)
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net [2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by iva8-d077482f1536.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 HD0dAJ2GwV-LfxeX6XK; Mon, 22 Mar 2021 11:21:42 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1616401302; bh=bueOXvHPnEmtPjmQo8S3jADFT/WbHtwHU0h+WfUziWU=;
 h=In-Reply-To:References:Date:Message-ID:To:From:Subject:Cc;
 b=LzD/6XnLhCz+izojjf1tajtvfXSbAxM3wnsq0pbiOWEcI67mI4nJBsbx9JK+rk2qY
 BnIF+zgWheOChU56qjpGV9qrgIUQnB4DeBaRuN479+v2ka3b+J4O05JaN5IQWr40H5
 Q4g9EDKO6vl56DwiUKgIo03SIeGcJhu9S66K8L0Y=
Authentication-Results: iva8-d077482f1536.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-iva.dhcp.yndx.net (dynamic-iva.dhcp.yndx.net
 [2a02:6b8:b080:8825::1:0])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 l0xIcrfkY1-Lfnms8PB; Mon, 22 Mar 2021 11:21:41 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Subject: Re: [PATCH v1] vhost-user-blk: use different event handlers on init
 and operation
From: Denis Plotnikov <den-plotnikov@yandex-team.ru>
To: qemu-devel@nongnu.org
References: <20210311081045.271217-1-den-plotnikov@yandex-team.ru>
Message-ID: <93aeca14-2dd4-13a0-cceb-48a4a2303d69@yandex-team.ru>
Date: Mon, 22 Mar 2021 11:21:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210311081045.271217-1-den-plotnikov@yandex-team.ru>
Content-Type: multipart/alternative;
 boundary="------------E019C4E4325511FCA48E3D27"
Content-Language: en-US
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=den-plotnikov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, qemu-block@nongnu.org, mst@redhat.com,
 raphael.norwitz@nutanix.com, yc-core@yandex-team.ru, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------E019C4E4325511FCA48E3D27
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

ping!


On 11.03.2021 11:10, Denis Plotnikov wrote:
> Commit a1a20d06b73e "vhost-user-blk: delay vhost_user_blk_disconnect"
> introduced postponing vhost_dev cleanup aiming to eliminate qemu aborts
> because of connection problems with vhost-blk daemon.
>
> However, it introdues a new problem. Now, any communication errors
> during execution of vhost_dev_init() called by vhost_user_blk_device_realize()
> lead to qemu abort on assert in vhost_dev_get_config().
>
> This happens because vhost_user_blk_disconnect() is postponed but
> it should have dropped s->connected flag by the time
> vhost_user_blk_device_realize() performs a new connection opening.
> On the connection opening, vhost_dev initialization in
> vhost_user_blk_connect() relies on s->connection flag and
> if it's not dropped, it skips vhost_dev initialization and returns
> with success. Then, vhost_user_blk_device_realize()'s execution flow
> goes to vhost_dev_get_config() where it's aborted on the assert.
>
> It seems connection/disconnection processing should happen
> differently on initialization and operation of vhost-user-blk.
> On initialization (in vhost_user_blk_device_realize()) we fully
> control the initialization process. At that point, nobody can use the
> device since it isn't initialized and we don't need to postpone any
> cleanups, so we can do cleanup right away when there is communication
> problems with the vhost-blk daemon.
> On operation the disconnect may happen when the device is in use, so
> the device users may want to use vhost_dev's data to do rollback before
> vhost_dev is re-initialized (e.g. in vhost_dev_set_log()), so we
> postpone the cleanup.
>
> The patch splits those two cases, and performs the cleanup immediately on
> initialization, and postpones cleanup when the device is initialized and
> in use.
>
> Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
> ---
>   hw/block/vhost-user-blk.c | 88 ++++++++++++++++++++++++---------------
>   1 file changed, 54 insertions(+), 34 deletions(-)
>
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index b870a50e6b20..84940122b8ca 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -362,7 +362,17 @@ static void vhost_user_blk_disconnect(DeviceState *dev)
>       vhost_dev_cleanup(&s->dev);
>   }
>   
> -static void vhost_user_blk_event(void *opaque, QEMUChrEvent event);
> +static void vhost_user_blk_event(void *opaque, QEMUChrEvent event, bool init);
> +
> +static void vhost_user_blk_event_init(void *opaque, QEMUChrEvent event)
> +{
> +    vhost_user_blk_event(opaque, event, true);
> +}
> +
> +static void vhost_user_blk_event_oper(void *opaque, QEMUChrEvent event)
> +{
> +    vhost_user_blk_event(opaque, event, false);
> +}
>   
>   static void vhost_user_blk_chr_closed_bh(void *opaque)
>   {
> @@ -371,11 +381,11 @@ static void vhost_user_blk_chr_closed_bh(void *opaque)
>       VHostUserBlk *s = VHOST_USER_BLK(vdev);
>   
>       vhost_user_blk_disconnect(dev);
> -    qemu_chr_fe_set_handlers(&s->chardev, NULL, NULL, vhost_user_blk_event,
> -            NULL, opaque, NULL, true);
> +    qemu_chr_fe_set_handlers(&s->chardev, NULL, NULL,
> +            vhost_user_blk_event_oper, NULL, opaque, NULL, true);
>   }
>   
> -static void vhost_user_blk_event(void *opaque, QEMUChrEvent event)
> +static void vhost_user_blk_event(void *opaque, QEMUChrEvent event, bool init)
>   {
>       DeviceState *dev = opaque;
>       VirtIODevice *vdev = VIRTIO_DEVICE(dev);
> @@ -390,38 +400,42 @@ static void vhost_user_blk_event(void *opaque, QEMUChrEvent event)
>           break;
>       case CHR_EVENT_CLOSED:
>           /*
> -         * A close event may happen during a read/write, but vhost
> -         * code assumes the vhost_dev remains setup, so delay the
> -         * stop & clear. There are two possible paths to hit this
> -         * disconnect event:
> -         * 1. When VM is in the RUN_STATE_PRELAUNCH state. The
> -         * vhost_user_blk_device_realize() is a caller.
> -         * 2. In tha main loop phase after VM start.
> -         *
> -         * For p2 the disconnect event will be delayed. We can't
> -         * do the same for p1, because we are not running the loop
> -         * at this moment. So just skip this step and perform
> -         * disconnect in the caller function.
> -         *
> -         * TODO: maybe it is a good idea to make the same fix
> -         * for other vhost-user devices.
> +         * Closing the connection should happen differently on device
> +         * initialization and operation stages.
> +         * On initalization, we want to re-start vhost_dev initialization
> +         * from the very beginning right away when the connection is closed,
> +         * so we clean up vhost_dev on each connection closing.
> +         * On operation, we want to postpone vhost_dev cleanup to let the
> +         * other code perform its own cleanup sequence using vhost_dev data
> +         * (e.g. vhost_dev_set_log).
>            */
> -        if (runstate_is_running()) {
> +        if (init) {
> +            vhost_user_blk_disconnect(dev);
> +        } else {
> +            /*
> +             * A close event may happen during a read/write, but vhost
> +             * code assumes the vhost_dev remains setup, so delay the
> +             * stop & clear.
> +             */
>               AioContext *ctx = qemu_get_current_aio_context();
>   
> -            qemu_chr_fe_set_handlers(&s->chardev, NULL, NULL, NULL, NULL,
> -                    NULL, NULL, false);
> -            aio_bh_schedule_oneshot(ctx, vhost_user_blk_chr_closed_bh, opaque);
> +            /*
> +             * Prevent any re-connection until cleanup is done in
> +             * vhost_user_blk_chr_closed_bh
> +             */
> +             qemu_chr_fe_set_handlers(&s->chardev, NULL, NULL, NULL, NULL,
> +                     NULL, NULL, false);
> +             aio_bh_schedule_oneshot(ctx, vhost_user_blk_chr_closed_bh, opaque);
> +
> +            /*
> +             * Move vhost device to the stopped state. The vhost-user device
> +             * will be clean up and disconnected in BH. This can be useful in
> +             * the vhost migration code. If disconnect was caught there is an
> +             * option for the general vhost code to get the dev state without
> +             * knowing its type (in this case vhost-user).
> +             */
> +            s->dev.started = false;
>           }
> -
> -        /*
> -         * Move vhost device to the stopped state. The vhost-user device
> -         * will be clean up and disconnected in BH. This can be useful in
> -         * the vhost migration code. If disconnect was caught there is an
> -         * option for the general vhost code to get the dev state without
> -         * knowing its type (in this case vhost-user).
> -         */
> -        s->dev.started = false;
>           break;
>       case CHR_EVENT_BREAK:
>       case CHR_EVENT_MUX_IN:
> @@ -473,8 +487,10 @@ static void vhost_user_blk_device_realize(DeviceState *dev, Error **errp)
>       s->vhost_vqs = g_new0(struct vhost_virtqueue, s->num_queues);
>       s->connected = false;
>   
> -    qemu_chr_fe_set_handlers(&s->chardev,  NULL, NULL, vhost_user_blk_event,
> -                             NULL, (void *)dev, NULL, true);
> +    /* set the handler performing immediate cleanup on each disconnect */
> +    qemu_chr_fe_set_handlers(&s->chardev,  NULL, NULL,
> +                             vhost_user_blk_event_init, NULL, (void *)dev,
> +                             NULL, true);
>   
>   reconnect:
>       if (qemu_chr_fe_wait_connected(&s->chardev, &err) < 0) {
> @@ -494,6 +510,10 @@ reconnect:
>           goto reconnect;
>       }
>   
> +    /* we're fully initialized, now we can operate, so change the handler */
> +    qemu_chr_fe_set_handlers(&s->chardev,  NULL, NULL,
> +                             vhost_user_blk_event_oper, NULL, (void *)dev,
> +                             NULL, true);
>       return;
>   
>   virtio_err:

--------------E019C4E4325511FCA48E3D27
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><tt><font size="+1">ping!</font></tt></p>
    <p><tt><font size="+1"><br>
        </font></tt></p>
    <div class="moz-cite-prefix">On 11.03.2021 11:10, Denis Plotnikov
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20210311081045.271217-1-den-plotnikov@yandex-team.ru">
      <pre class="moz-quote-pre" wrap="">Commit a1a20d06b73e "vhost-user-blk: delay vhost_user_blk_disconnect"
introduced postponing vhost_dev cleanup aiming to eliminate qemu aborts
because of connection problems with vhost-blk daemon.

However, it introdues a new problem. Now, any communication errors
during execution of vhost_dev_init() called by vhost_user_blk_device_realize()
lead to qemu abort on assert in vhost_dev_get_config().

This happens because vhost_user_blk_disconnect() is postponed but
it should have dropped s-&gt;connected flag by the time
vhost_user_blk_device_realize() performs a new connection opening.
On the connection opening, vhost_dev initialization in
vhost_user_blk_connect() relies on s-&gt;connection flag and
if it's not dropped, it skips vhost_dev initialization and returns
with success. Then, vhost_user_blk_device_realize()'s execution flow
goes to vhost_dev_get_config() where it's aborted on the assert.

It seems connection/disconnection processing should happen
differently on initialization and operation of vhost-user-blk.
On initialization (in vhost_user_blk_device_realize()) we fully
control the initialization process. At that point, nobody can use the
device since it isn't initialized and we don't need to postpone any
cleanups, so we can do cleanup right away when there is communication
problems with the vhost-blk daemon.
On operation the disconnect may happen when the device is in use, so
the device users may want to use vhost_dev's data to do rollback before
vhost_dev is re-initialized (e.g. in vhost_dev_set_log()), so we
postpone the cleanup.

The patch splits those two cases, and performs the cleanup immediately on
initialization, and postpones cleanup when the device is initialized and
in use.

Signed-off-by: Denis Plotnikov <a class="moz-txt-link-rfc2396E" href="mailto:den-plotnikov@yandex-team.ru">&lt;den-plotnikov@yandex-team.ru&gt;</a>
---
 hw/block/vhost-user-blk.c | 88 ++++++++++++++++++++++++---------------
 1 file changed, 54 insertions(+), 34 deletions(-)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index b870a50e6b20..84940122b8ca 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -362,7 +362,17 @@ static void vhost_user_blk_disconnect(DeviceState *dev)
     vhost_dev_cleanup(&amp;s-&gt;dev);
 }
 
-static void vhost_user_blk_event(void *opaque, QEMUChrEvent event);
+static void vhost_user_blk_event(void *opaque, QEMUChrEvent event, bool init);
+
+static void vhost_user_blk_event_init(void *opaque, QEMUChrEvent event)
+{
+    vhost_user_blk_event(opaque, event, true);
+}
+
+static void vhost_user_blk_event_oper(void *opaque, QEMUChrEvent event)
+{
+    vhost_user_blk_event(opaque, event, false);
+}
 
 static void vhost_user_blk_chr_closed_bh(void *opaque)
 {
@@ -371,11 +381,11 @@ static void vhost_user_blk_chr_closed_bh(void *opaque)
     VHostUserBlk *s = VHOST_USER_BLK(vdev);
 
     vhost_user_blk_disconnect(dev);
-    qemu_chr_fe_set_handlers(&amp;s-&gt;chardev, NULL, NULL, vhost_user_blk_event,
-            NULL, opaque, NULL, true);
+    qemu_chr_fe_set_handlers(&amp;s-&gt;chardev, NULL, NULL,
+            vhost_user_blk_event_oper, NULL, opaque, NULL, true);
 }
 
-static void vhost_user_blk_event(void *opaque, QEMUChrEvent event)
+static void vhost_user_blk_event(void *opaque, QEMUChrEvent event, bool init)
 {
     DeviceState *dev = opaque;
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
@@ -390,38 +400,42 @@ static void vhost_user_blk_event(void *opaque, QEMUChrEvent event)
         break;
     case CHR_EVENT_CLOSED:
         /*
-         * A close event may happen during a read/write, but vhost
-         * code assumes the vhost_dev remains setup, so delay the
-         * stop &amp; clear. There are two possible paths to hit this
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
-        if (runstate_is_running()) {
+        if (init) {
+            vhost_user_blk_disconnect(dev);
+        } else {
+            /*
+             * A close event may happen during a read/write, but vhost
+             * code assumes the vhost_dev remains setup, so delay the
+             * stop &amp; clear.
+             */
             AioContext *ctx = qemu_get_current_aio_context();
 
-            qemu_chr_fe_set_handlers(&amp;s-&gt;chardev, NULL, NULL, NULL, NULL,
-                    NULL, NULL, false);
-            aio_bh_schedule_oneshot(ctx, vhost_user_blk_chr_closed_bh, opaque);
+            /*
+             * Prevent any re-connection until cleanup is done in
+             * vhost_user_blk_chr_closed_bh
+             */
+             qemu_chr_fe_set_handlers(&amp;s-&gt;chardev, NULL, NULL, NULL, NULL,
+                     NULL, NULL, false);
+             aio_bh_schedule_oneshot(ctx, vhost_user_blk_chr_closed_bh, opaque);
+
+            /*
+             * Move vhost device to the stopped state. The vhost-user device
+             * will be clean up and disconnected in BH. This can be useful in
+             * the vhost migration code. If disconnect was caught there is an
+             * option for the general vhost code to get the dev state without
+             * knowing its type (in this case vhost-user).
+             */
+            s-&gt;dev.started = false;
         }
-
-        /*
-         * Move vhost device to the stopped state. The vhost-user device
-         * will be clean up and disconnected in BH. This can be useful in
-         * the vhost migration code. If disconnect was caught there is an
-         * option for the general vhost code to get the dev state without
-         * knowing its type (in this case vhost-user).
-         */
-        s-&gt;dev.started = false;
         break;
     case CHR_EVENT_BREAK:
     case CHR_EVENT_MUX_IN:
@@ -473,8 +487,10 @@ static void vhost_user_blk_device_realize(DeviceState *dev, Error **errp)
     s-&gt;vhost_vqs = g_new0(struct vhost_virtqueue, s-&gt;num_queues);
     s-&gt;connected = false;
 
-    qemu_chr_fe_set_handlers(&amp;s-&gt;chardev,  NULL, NULL, vhost_user_blk_event,
-                             NULL, (void *)dev, NULL, true);
+    /* set the handler performing immediate cleanup on each disconnect */
+    qemu_chr_fe_set_handlers(&amp;s-&gt;chardev,  NULL, NULL,
+                             vhost_user_blk_event_init, NULL, (void *)dev,
+                             NULL, true);
 
 reconnect:
     if (qemu_chr_fe_wait_connected(&amp;s-&gt;chardev, &amp;err) &lt; 0) {
@@ -494,6 +510,10 @@ reconnect:
         goto reconnect;
     }
 
+    /* we're fully initialized, now we can operate, so change the handler */
+    qemu_chr_fe_set_handlers(&amp;s-&gt;chardev,  NULL, NULL,
+                             vhost_user_blk_event_oper, NULL, (void *)dev,
+                             NULL, true);
     return;
 
 virtio_err:
</pre>
    </blockquote>
  </body>
</html>

--------------E019C4E4325511FCA48E3D27--

