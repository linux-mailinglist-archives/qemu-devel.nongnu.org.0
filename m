Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7983E133E
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 12:48:52 +0200 (CEST)
Received: from localhost ([::1]:37950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBavj-0003Cv-OX
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 06:48:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mBaqe-0005Qo-Aa
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 06:43:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mBaqc-0001WI-IH
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 06:43:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628160213;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rcHz98ivCd/nMWnM0XFk5rrAMSaPTfJC/TeGGBtBtrg=;
 b=UT0o/hgTOcYWxN81nrHVAnQAloymbhOFvTeH0p+N4NxWCjE3Q7121yssjvw0/gngMOvoA1
 Ql5Tpdtq1/FK8nwIiOlThviNh5P1DY0XtDtmIO1+md5CjcX7UnUUN0oSbRKsQELzA/7D6i
 EoJ0fCNpbcnh7uygoavmod8sj6Epv08=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-CinkePAIOKevfR1xiyNeXg-1; Thu, 05 Aug 2021 06:43:32 -0400
X-MC-Unique: CinkePAIOKevfR1xiyNeXg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 765AE801E72;
 Thu,  5 Aug 2021 10:43:31 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.147])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BABC5FC25;
 Thu,  5 Aug 2021 10:43:29 +0000 (UTC)
Date: Thu, 5 Aug 2021 11:43:26 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH v2 05/11] chardev: mark explicitly first argument as
 poisoned
Message-ID: <YQvAzo69ImiuyV+Y@redhat.com>
References: <20210804154848.557328-1-marcandre.lureau@redhat.com>
 <20210804154848.557328-6-marcandre.lureau@redhat.com>
 <YQu/PYUAhHzOP1UX@redhat.com>
 <CAJ+F1CJzZSjcfk5zag8ZdA-FdttQeTM_-HM_VnK5Qc8OJX=FAg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CJzZSjcfk5zag8ZdA-FdttQeTM_-HM_VnK5Qc8OJX=FAg@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 05, 2021 at 02:39:28PM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Thu, Aug 5, 2021 at 2:37 PM Daniel P. Berrangé <berrange@redhat.com>
> wrote:
> 
> > On Wed, Aug 04, 2021 at 07:48:42PM +0400, marcandre.lureau@redhat.com
> > wrote:
> > > From: Marc-André Lureau <marcandre.lureau@redhat.com>
> > >
> > > Since commit 9894dc0cdcc397ee5b26370bc53da6d360a363c2 "char: convert
> > > from GIOChannel to QIOChannel", the first argument to the watch callback
> > > can actually be a QIOChannel, which is not a GIOChannel (but a QEMU
> > > Object).
> > >
> > > Even though we never used that pointer, change the callback type to warn
> > > the users. Possibly a better fix later, we may want to store the
> > > callback and call it from intermediary functions.
> > >
> > > Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> > > ---
> > >  include/chardev/char-fe.h | 8 +++++++-
> > >  chardev/char-fe.c         | 2 +-
> > >  hw/char/cadence_uart.c    | 2 +-
> > >  hw/char/cmsdk-apb-uart.c  | 2 +-
> > >  hw/char/ibex_uart.c       | 2 +-
> > >  hw/char/nrf51_uart.c      | 2 +-
> > >  hw/char/serial.c          | 2 +-
> > >  hw/char/virtio-console.c  | 2 +-
> > >  hw/usb/redirect.c         | 2 +-
> > >  hw/virtio/vhost-user.c    | 2 +-
> > >  monitor/monitor.c         | 2 +-
> > >  net/vhost-user.c          | 4 ++--
> > >  12 files changed, 19 insertions(+), 13 deletions(-)
> > >
> > > diff --git a/include/chardev/char-fe.h b/include/chardev/char-fe.h
> > > index a553843364..867ef1b3b2 100644
> > > --- a/include/chardev/char-fe.h
> > > +++ b/include/chardev/char-fe.h
> > > @@ -174,6 +174,9 @@ void qemu_chr_fe_set_open(CharBackend *be, int
> > fe_open);
> > >  void qemu_chr_fe_printf(CharBackend *be, const char *fmt, ...)
> > >      GCC_FMT_ATTR(2, 3);
> > >
> > > +
> > > +typedef gboolean (*FEWatchFunc)(void *do_not_use, GIOCondition
> > condition, void *data);
> > > +
> > >  /**
> > >   * qemu_chr_fe_add_watch:
> > >   * @cond: the condition to poll for
> > > @@ -188,10 +191,13 @@ void qemu_chr_fe_printf(CharBackend *be, const
> > char *fmt, ...)
> > >   * Note that you are responsible to update the front-end sources if
> > >   * you are switching the main context with qemu_chr_fe_set_handlers().
> > >   *
> > > + * Warning: DO NOT use the first callback argument (it may be either
> > > + * a GIOChannel or a QIOChannel, depending on the underlying chardev)
> > > + *
> > >   * Returns: the source tag
> > >   */
> > >  guint qemu_chr_fe_add_watch(CharBackend *be, GIOCondition cond,
> > > -                            GIOFunc func, void *user_data);
> > > +                            FEWatchFunc func, void *user_data);
> > >
> > >  /**
> > >   * qemu_chr_fe_write:
> > > diff --git a/chardev/char-fe.c b/chardev/char-fe.c
> > > index 474715c5a9..7789f7be9c 100644
> > > --- a/chardev/char-fe.c
> > > +++ b/chardev/char-fe.c
> > > @@ -354,7 +354,7 @@ void qemu_chr_fe_set_open(CharBackend *be, int
> > fe_open)
> > >  }
> > >
> > >  guint qemu_chr_fe_add_watch(CharBackend *be, GIOCondition cond,
> > > -                            GIOFunc func, void *user_data)
> > > +                            FEWatchFunc func, void *user_data)
> > >  {
> > >      Chardev *s = be->chr;
> > >      GSource *src;
> > > diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> > > index ceb677bc5a..8ee6f74b8c 100644
> > > --- a/hw/char/cadence_uart.c
> > > +++ b/hw/char/cadence_uart.c
> > > @@ -288,7 +288,7 @@ static void uart_write_rx_fifo(void *opaque, const
> > uint8_t *buf, int size)
> > >      uart_update_status(s);
> > >  }
> > >
> > > -static gboolean cadence_uart_xmit(GIOChannel *chan, GIOCondition cond,
> > > +static gboolean cadence_uart_xmit(GIOChannel *do_not_use, GIOCondition
> > cond,
> > >                                    void *opaque)
> >
> > Why is this (and the next 3) left as GIOCondition, when you change others
> > later on to be void ?
> >
> 
> Good catch. It's a leftover. It is fixed in my branch
> https://gitlab.com/marcandre.lureau/qemu/-/tree/chardev

Ok, with that

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>



Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


