Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D0F424590
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 20:03:46 +0200 (CEST)
Received: from localhost ([::1]:48232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYBGb-0003KV-3d
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 14:03:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mYBBr-0006iO-98
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:58:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mYBBp-0000Su-EM
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:58:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633543128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q0N5VvMU0scWJrMK2+M+MrCoCTE4QU+bc2FwP40mKk0=;
 b=Qz/wVugE9c131OoW3r54Bc2JTHT4PfhgUxrPkC/rDOoeora61HvIgRGI6sEm+TfQ7c0vnK
 mzMckkF57gKb4DQB/q17bAIxcNyfGt4hu+T2B2242rLXogozmhPDKCbcyKCgKIoCBKmCgu
 yMW3M92Vix9OzmuKWfkt/Yc3VPCv3Zo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-pRLn07luNn-msDr56sUUxw-1; Wed, 06 Oct 2021 13:58:47 -0400
X-MC-Unique: pRLn07luNn-msDr56sUUxw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99A45835DE3;
 Wed,  6 Oct 2021 17:58:46 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.17.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 183FB10013D7;
 Wed,  6 Oct 2021 17:58:30 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 7085F220BDB; Wed,  6 Oct 2021 13:58:29 -0400 (EDT)
Date: Wed, 6 Oct 2021 13:58:29 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Christophe de Dinechin <dinechin@redhat.com>
Subject: Re: [Virtio-fs] [PATCH 11/13] virtiofsd: Shutdown notification queue
 in the end
Message-ID: <YV3jxV80xchqTAo6@redhat.com>
References: <20210930153037.1194279-1-vgoyal@redhat.com>
 <20210930153037.1194279-12-vgoyal@redhat.com>
 <lytuhui39c.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <lytuhui39c.fsf@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
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

On Wed, Oct 06, 2021 at 05:15:57PM +0200, Christophe de Dinechin wrote:
> 
> On 2021-09-30 at 11:30 -04, Vivek Goyal <vgoyal@redhat.com> wrote...
> > So far we did not have the notion of cross queue traffic. That is, we
> > get request on a queue and send back response on same queue. So if a
> > request be being processed and at the same time a stop queue request
> > comes in, we wait for all pending requests to finish and then queue
> > is stopped and associated data structure cleaned.
> >
> > But with notification queue, now it is possible that we get a locking
> > request on request queue and send the notification back on a different
> > queue (notificaiton queue). This means, we need to make sure that
> 
> typo: notification (I just saw Stefan noticed it too)
> 
> > notifiation queue has not already been shutdown or is not being
> 
> typo: notification ;-)
> 
> > shutdown in parallel while we are trying to send a notification back.
> > Otherwise bad things are bound to happen.
> >
> > One way to solve this problem is that stop notification queue in the
> > end. First stop hiprio and all request queues.
> 
> I do not understand that sentence. Maybe you meant to write "is to stop
> notification queue in the end", but even so I don't understand if you mean
> "in the end" (of what) or "last" (relative to other queues)? I guess you
> meant last.

I meant "is to stop notification queue last". Will fix it.

> 
> > That means by the
> > time we are trying to stop notification queue, we know no other
> > request can be in progress which can try to send something on
> > notification queue.
> >
> > But problem is that currently we don't have any control on in what
> > order queues should be stopped. If there was a notion of whole device
> > being stopped, then we could decide in what order queues should be
> > stopped.
> >
> > Stefan mentioned that there is a command to stop whole device
> > VHOST_USER_SET_STATUS but it is not implemented in libvhost-user
> > yet. Also we probably could not move away from per queue stop
> > logic we have as of now.
> >
> > As an alternative, he said if we stop all queue when qidx 0 is
> > being stopped, it should be fine and we can solve the issue of
> > notification queue shutdown order.
> >
> > So in this patch I am shutting down all queues when queue 0
> > is being shutdown. And also changed shutdown order in such a
> > way that notification queue is shutdown last.
> 
> For my education: I assume there is no valid case where there is no queue
> and only the notification queue?

Yes. Minimum two queues have to be there. queue 0 is hiprio requests
and queue 1 is regular requests.

> >
> > Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
> > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> > ---
> >  tools/virtiofsd/fuse_virtio.c | 27 ++++++++++++++++++++++++++-
> >  1 file changed, 26 insertions(+), 1 deletion(-)
> >
> > diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
> > index c67c2e0e7a..a87e88e286 100644
> > --- a/tools/virtiofsd/fuse_virtio.c
> > +++ b/tools/virtiofsd/fuse_virtio.c
> > @@ -826,6 +826,11 @@ static void fv_queue_cleanup_thread(struct fv_VuDev *vud, int qidx)
> >      assert(qidx < vud->nqueues);
> >      ourqi = vud->qi[qidx];
> >
> > +    /* Queue is already stopped */
> > +    if (!ourqi) {
> > +        return;
> > +    }
> > +
> >      /* qidx == 1 is the notification queue if notifications are enabled */
> >      if (!se->notify_enabled || qidx != 1) {
> >          /* Kill the thread */
> > @@ -847,14 +852,25 @@ static void fv_queue_cleanup_thread(struct fv_VuDev *vud, int qidx)
> >
> >  static void stop_all_queues(struct fv_VuDev *vud)
> >  {
> > +    struct fuse_session *se = vud->se;
> > +
> >      for (int i = 0; i < vud->nqueues; i++) {
> >          if (!vud->qi[i]) {
> >              continue;
> >          }
> >
> > +        /* Shutdown notification queue in the end */
> > +        if (se->notify_enabled && i == 1) {
> > +            continue;
> > +        }
> >          fuse_log(FUSE_LOG_INFO, "%s: Stopping queue %d thread\n", __func__, i);
> >          fv_queue_cleanup_thread(vud, i);
> >      }
> > +
> > +    if (se->notify_enabled) {
> > +        fuse_log(FUSE_LOG_INFO, "%s: Stopping queue %d thread\n", __func__, 1);
> > +        fv_queue_cleanup_thread(vud, 1);
> > +    }
> >  }
> >
> >  /* Callback from libvhost-user on start or stop of a queue */
> > @@ -934,7 +950,16 @@ static void fv_queue_set_started(VuDev *dev, int qidx, bool started)
> >           * the queue thread doesn't block in virtio_send_msg().
> >           */
> >          vu_dispatch_unlock(vud);
> > -        fv_queue_cleanup_thread(vud, qidx);
> > +
> > +        /*
> > +         * If queue 0 is being shutdown, treat it as if device is being
> > +         * shutdown and stop all queues.
> > +         */
> > +        if (qidx == 0) {
> > +            stop_all_queues(vud);
> > +        } else {
> > +            fv_queue_cleanup_thread(vud, qidx);
> > +        }
> >          vu_dispatch_wrlock(vud);
> >      }
> >  }
> 
> For my education: given that we dropped the write lock above, what prevents
> queue 0 from being shutdown on one thread while another cleans up another
> queue. What makes it safe in that case? I think this is worth a comment.

I think only one queue shutdown message can progress at a time. These
are processed in virtio_loop() and that in turn calls
fv_queue_set_started(started = false).

So while one queue shutdown is in progress, virtio_loop() will go back
to reading next message only after current queue shutdown has finished.

Thanks
Vivek


