Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4617F57B144
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 08:55:29 +0200 (CEST)
Received: from localhost ([::1]:51584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE3cF-0007r8-To
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 02:55:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oE3ZL-0005xo-NT
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 02:52:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oE3ZH-0004zb-V7
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 02:52:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658299939;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3BhAqa2E+R/FtCSTqALTGIKDx3epo5zQQ9zoI1zLeg4=;
 b=EIdbND4uRg271Xcwy6pcRDJ6z9nHqDId5QR0pFgxpkVmGu8YOZyaIvwbTNCfnugV3uRRUU
 P0wIkRAr6ckEXY2kuoLkNBaspuDTfhXaKAAEKa3WL34SCuooZ0rHuQ0mvOWMzODaxgsdHf
 NtRonkdWMhhjk0RHX7QVLyYMnHt1oA0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-GYXhPB-4MF-ywPLkjmpLpg-1; Wed, 20 Jul 2022 02:52:17 -0400
X-MC-Unique: GYXhPB-4MF-ywPLkjmpLpg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6AC28802D1C;
 Wed, 20 Jul 2022 06:52:17 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A5D3C492C3B;
 Wed, 20 Jul 2022 06:52:16 +0000 (UTC)
Date: Wed, 20 Jul 2022 07:52:14 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Het Gala <het.gala@nutanix.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 3/4] Establishing connection between any non-default
 source and destination pair
Message-ID: <Ytel3tvt6b+YJhii@redhat.com>
References: <20220609073305.142515-1-het.gala@nutanix.com>
 <20220609073305.142515-4-het.gala@nutanix.com>
 <Yqtq2yRTe4xVNkx+@redhat.com>
 <54ca00c7-a108-11e3-1c8d-8771798aed6a@nutanix.com>
 <de0646c1-75d7-5f9d-32db-07c498c45715@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <de0646c1-75d7-5f9d-32db-07c498c45715@nutanix.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Re-adding the mailing list, please don't drop the list in
replies to discussions.

On Wed, Jul 20, 2022 at 02:08:23AM +0530, Het Gala wrote:
> 
> On 13/07/22 3:10 pm, Het Gala wrote:
> > 
> > On 16/06/22 11:09 pm, Daniel P. Berrangé wrote:
> > > On Thu, Jun 09, 2022 at 07:33:04AM +0000, Het Gala wrote:
> > > > i) Binding of the socket to source ip address and port on the
> > > > non-default
> > > >     interface has been implemented for multi-FD connection,
> > > > which was not
> > > >     necessary earlier because the binding was on the default
> > > > interface itself.
> > > > 
> > > > ii) Created an end to end connection between all multi-FD source and
> > > >      destination pairs.
> > > > 
> > > > Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
> > > > Signed-off-by: Het Gala <het.gala@nutanix.com>
> > > > ---
> > > >   chardev/char-socket.c               |  4 +-
> > > >   include/io/channel-socket.h         | 26 ++++++-----
> > > >   include/qemu/sockets.h              |  6 ++-
> > > >   io/channel-socket.c                 | 50 ++++++++++++++------
> > > >   migration/socket.c                  | 15 +++---
> > > >   nbd/client-connection.c             |  2 +-
> > > >   qemu-nbd.c                          |  4 +-
> > > >   scsi/pr-manager-helper.c            |  1 +
> > > >   tests/unit/test-char.c              |  8 ++--
> > > >   tests/unit/test-io-channel-socket.c |  4 +-
> > > >   tests/unit/test-util-sockets.c      | 16 +++----
> > > >   ui/input-barrier.c                  |  2 +-
> > > >   ui/vnc.c                            |  3 +-
> > > >   util/qemu-sockets.c                 | 71
> > > > ++++++++++++++++++++---------
> > > >   14 files changed, 135 insertions(+), 77 deletions(-)
> > > > 
> > > > diff --git a/chardev/char-socket.c b/chardev/char-socket.c
> > > > index dc4e218eeb..f3725238c5 100644
> > > > --- a/chardev/char-socket.c
> > > > +++ b/chardev/char-socket.c
> > > > @@ -932,7 +932,7 @@ static int
> > > > tcp_chr_connect_client_sync(Chardev *chr, Error **errp)
> > > >       QIOChannelSocket *sioc = qio_channel_socket_new();
> > > >       tcp_chr_change_state(s, TCP_CHARDEV_STATE_CONNECTING);
> > > >       tcp_chr_set_client_ioc_name(chr, sioc);
> > > > -    if (qio_channel_socket_connect_sync(sioc, s->addr, errp) < 0) {
> > > > +    if (qio_channel_socket_connect_sync(sioc, s->addr, NULL,
> > > > errp) < 0) {
> > > >           tcp_chr_change_state(s, TCP_CHARDEV_STATE_DISCONNECTED);
> > > >           object_unref(OBJECT(sioc));
> > > >           return -1;
> > > > @@ -1120,7 +1120,7 @@ static void
> > > > tcp_chr_connect_client_task(QIOTask *task,
> > > >       SocketAddress *addr = opaque;
> > > >       Error *err = NULL;
> > > >   -    qio_channel_socket_connect_sync(ioc, addr, &err);
> > > > +    qio_channel_socket_connect_sync(ioc, addr, NULL, &err);
> > > >         qio_task_set_error(task, err);
> > > >   }
> > > > diff --git a/include/io/channel-socket.h b/include/io/channel-socket.h
> > > > index 513c428fe4..59d5b1b349 100644
> > > > --- a/include/io/channel-socket.h
> > > > +++ b/include/io/channel-socket.h
> > > > @@ -83,41 +83,45 @@ qio_channel_socket_new_fd(int fd,
> > > >   /**
> > > >    * qio_channel_socket_connect_sync:
> > > >    * @ioc: the socket channel object
> > > > - * @addr: the address to connect to
> > > > + * @dst_addr: the destination address to connect to
> > > > + * @src_addr: the source address to be connected
> > > >    * @errp: pointer to a NULL-initialized error object
> > > >    *
> > > > - * Attempt to connect to the address @addr. This method
> > > > - * will run in the foreground so the caller will not regain
> > > > - * execution control until the connection is established or
> > > > + * Attempt to connect to the address @dst_addr with @src_addr.
> > > > + * This method will run in the foreground so the caller will not
> > > > + * regain execution control until the connection is established or
> > > >    * an error occurs.
> > > >    */
> > > >   int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
> > > > -                                    SocketAddress *addr,
> > > > +                                    SocketAddress *dst_addr,
> > > > +                                    SocketAddress *src_addr,
> > > >                                       Error **errp);
> > > >     /**
> > > >    * qio_channel_socket_connect_async:
> > > >    * @ioc: the socket channel object
> > > > - * @addr: the address to connect to
> > > > + * @dst_addr: the destination address to connect to
> > > >    * @callback: the function to invoke on completion
> > > >    * @opaque: user data to pass to @callback
> > > >    * @destroy: the function to free @opaque
> > > >    * @context: the context to run the async task. If %NULL, the default
> > > >    *           context will be used.
> > > > + * @src_addr: the source address to be connected
> > > >    *
> > > > - * Attempt to connect to the address @addr. This method
> > > > - * will run in the background so the caller will regain
> > > > + * Attempt to connect to the address @dst_addr with the @src_addr.
> > > > + * This method will run in the background so the caller will regain
> > > >    * execution control immediately. The function @callback
> > > > - * will be invoked on completion or failure. The @addr
> > > > + * will be invoked on completion or failure. The @dst_addr
> > > >    * parameter will be copied, so may be freed as soon
> > > >    * as this function returns without waiting for completion.
> > > >    */
> > > >   void qio_channel_socket_connect_async(QIOChannelSocket *ioc,
> > > > -                                      SocketAddress *addr,
> > > > +                                      SocketAddress *dst_addr,
> > > >                                         QIOTaskFunc callback,
> > > >                                         gpointer opaque,
> > > >                                         GDestroyNotify destroy,
> > > > -                                      GMainContext *context);
> > > > +                                      GMainContext *context,
> > > > +                                      SocketAddress *src_addr);
> > > Lets avoid modifying these two methods, and thus avoid
> > > updating countless callers.
> > > 
> > > In common with typical pattern in QIO code, lets add
> > > a second variant
> > > 
> > >    qio_channel_socket_connect_full
> > >    qio_channel_socket_connect_full_async
> > > 
> > > which has the extra parameters, then make the existing
> > > simpler methods call the new ones.
> > > 
> > > ie qio_channel_socket_connect should call
> > > qio_channel_socket_connect_full, pasing NULL for the
> > > src_addr.
> > > 
> > > Thanks for the suggestion Daniel. Will modify the same structure as
> > 
> > suggested above in the v2 patchset.
> 
> > Hi Daniel. I agree with your suggestion here, but I have couple of doubts
> in implementing this type.
> 
> 1. You meant to say qio_channel_socket_connect_async calls ->
> qio_channel_socket_connect_all_async and the later function would have a
> extra parameter for src_addr as NULL right. But if you see this approach
> works well for connecting non-multifd channels where source uri is passed as
> NULL, but for multifd channels, as you see the function
> socket_send_channel_create also calls qio_channel_socket_connect_async, but
> this time instead of NULL, it should actually pass a src_addr parameter. So
> in my opion, whatever function multifd function is calling it should have
> extra parameter to pass src_addr.
> 
> 2. Same goes for qio_channel_socket_connect_sync func, for multifd path, it
> should be passed with src_addr instead of NULL.
> 
> 3. I agree, modifying these methods would lead to updating endless callers
> from test cases. But I don't see a better way that this at the moment. And
> out of the two methods, one method is called only for single unit test case
> in qemu.
> 
> We would love to have suggestions from your side Daniel.

Do not modify this existing method signature at all:

 int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
                                     SocketAddress *addr,
                                     Error **errp);

Only add a new method:

 int qio_channel_socket_connect_full_sync(QIOChannelSocket *ioc,
                                          SocketAddress *dst_addr,
                                          SocketAddress *src_addr,
                                          Error **errp);

Internally the former method calls the latter, assing NULL for
src_addr.

Externally, only the migration code needs to use the new method,
all the rest of QEMU code must remain unchanged calling the simpler
method.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


