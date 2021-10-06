Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4B9424273
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 18:19:55 +0200 (CEST)
Received: from localhost ([::1]:46680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY9e5-0002Tl-TO
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 12:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1mY8nw-00041C-U8
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:26:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1mY8nv-0003j0-4o
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:26:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633533958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZdXDErv+76XGux3Efnm/xRmFYu66o+YGAr4JnjZwQpo=;
 b=IH7yVtHJblmnWzPf4mwK16FwQIMx1bxk4IU1CaVxGVOBhUQ0AWvJ4v/+S0uWyHrs0Gtec3
 v8f0Bp+EaCoOxo5nPRr8IohcOl0kH+mVx3IOBPUr+vX4zWgLxXSQ6cwh+zU2EEic6mWTQt
 YhTa3qW/fMbn39W3Qva+TaEOaKNM2u4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-PttClCZpNcGkBrm27ox6iw-1; Wed, 06 Oct 2021 11:25:56 -0400
X-MC-Unique: PttClCZpNcGkBrm27ox6iw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B511814400;
 Wed,  6 Oct 2021 15:25:55 +0000 (UTC)
Received: from titinator (unknown [10.39.194.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E923E5C1A1;
 Wed,  6 Oct 2021 15:25:53 +0000 (UTC)
References: <20210930153037.1194279-1-vgoyal@redhat.com>
 <20210930153037.1194279-12-vgoyal@redhat.com>
User-agent: mu4e 1.5.13; emacs 27.2
From: Christophe de Dinechin <dinechin@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [Virtio-fs] [PATCH 11/13] virtiofsd: Shutdown notification
 queue in the end
Date: Wed, 06 Oct 2021 17:15:57 +0200
In-reply-to: <20210930153037.1194279-12-vgoyal@redhat.com>
Message-ID: <lytuhui39c.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dinechin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dinechin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org, stefanha@redhat.com,
 miklos@szeredi.hu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021-09-30 at 11:30 -04, Vivek Goyal <vgoyal@redhat.com> wrote...
> So far we did not have the notion of cross queue traffic. That is, we
> get request on a queue and send back response on same queue. So if a
> request be being processed and at the same time a stop queue request
> comes in, we wait for all pending requests to finish and then queue
> is stopped and associated data structure cleaned.
>
> But with notification queue, now it is possible that we get a locking
> request on request queue and send the notification back on a different
> queue (notificaiton queue). This means, we need to make sure that

typo: notification (I just saw Stefan noticed it too)

> notifiation queue has not already been shutdown or is not being

typo: notification ;-)

> shutdown in parallel while we are trying to send a notification back.
> Otherwise bad things are bound to happen.
>
> One way to solve this problem is that stop notification queue in the
> end. First stop hiprio and all request queues.

I do not understand that sentence. Maybe you meant to write "is to stop
notification queue in the end", but even so I don't understand if you mean
"in the end" (of what) or "last" (relative to other queues)? I guess you
meant last.

> That means by the
> time we are trying to stop notification queue, we know no other
> request can be in progress which can try to send something on
> notification queue.
>
> But problem is that currently we don't have any control on in what
> order queues should be stopped. If there was a notion of whole device
> being stopped, then we could decide in what order queues should be
> stopped.
>
> Stefan mentioned that there is a command to stop whole device
> VHOST_USER_SET_STATUS but it is not implemented in libvhost-user
> yet. Also we probably could not move away from per queue stop
> logic we have as of now.
>
> As an alternative, he said if we stop all queue when qidx 0 is
> being stopped, it should be fine and we can solve the issue of
> notification queue shutdown order.
>
> So in this patch I am shutting down all queues when queue 0
> is being shutdown. And also changed shutdown order in such a
> way that notification queue is shutdown last.

For my education: I assume there is no valid case where there is no queue
and only the notification queue?

>
> Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
>  tools/virtiofsd/fuse_virtio.c | 27 ++++++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
>
> diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
> index c67c2e0e7a..a87e88e286 100644
> --- a/tools/virtiofsd/fuse_virtio.c
> +++ b/tools/virtiofsd/fuse_virtio.c
> @@ -826,6 +826,11 @@ static void fv_queue_cleanup_thread(struct fv_VuDev *vud, int qidx)
>      assert(qidx < vud->nqueues);
>      ourqi = vud->qi[qidx];
>
> +    /* Queue is already stopped */
> +    if (!ourqi) {
> +        return;
> +    }
> +
>      /* qidx == 1 is the notification queue if notifications are enabled */
>      if (!se->notify_enabled || qidx != 1) {
>          /* Kill the thread */
> @@ -847,14 +852,25 @@ static void fv_queue_cleanup_thread(struct fv_VuDev *vud, int qidx)
>
>  static void stop_all_queues(struct fv_VuDev *vud)
>  {
> +    struct fuse_session *se = vud->se;
> +
>      for (int i = 0; i < vud->nqueues; i++) {
>          if (!vud->qi[i]) {
>              continue;
>          }
>
> +        /* Shutdown notification queue in the end */
> +        if (se->notify_enabled && i == 1) {
> +            continue;
> +        }
>          fuse_log(FUSE_LOG_INFO, "%s: Stopping queue %d thread\n", __func__, i);
>          fv_queue_cleanup_thread(vud, i);
>      }
> +
> +    if (se->notify_enabled) {
> +        fuse_log(FUSE_LOG_INFO, "%s: Stopping queue %d thread\n", __func__, 1);
> +        fv_queue_cleanup_thread(vud, 1);
> +    }
>  }
>
>  /* Callback from libvhost-user on start or stop of a queue */
> @@ -934,7 +950,16 @@ static void fv_queue_set_started(VuDev *dev, int qidx, bool started)
>           * the queue thread doesn't block in virtio_send_msg().
>           */
>          vu_dispatch_unlock(vud);
> -        fv_queue_cleanup_thread(vud, qidx);
> +
> +        /*
> +         * If queue 0 is being shutdown, treat it as if device is being
> +         * shutdown and stop all queues.
> +         */
> +        if (qidx == 0) {
> +            stop_all_queues(vud);
> +        } else {
> +            fv_queue_cleanup_thread(vud, qidx);
> +        }
>          vu_dispatch_wrlock(vud);
>      }
>  }

For my education: given that we dropped the write lock above, what prevents
queue 0 from being shutdown on one thread while another cleans up another
queue. What makes it safe in that case? I think this is worth a comment.

--
Cheers,
Christophe de Dinechin (IRC c3d)


