Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FB038CB94
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 19:09:38 +0200 (CEST)
Received: from localhost ([::1]:59244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk8eX-0004pw-Ji
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 13:09:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lk8d9-00048M-ND
 for qemu-devel@nongnu.org; Fri, 21 May 2021 13:08:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lk8d7-0000BG-Lh
 for qemu-devel@nongnu.org; Fri, 21 May 2021 13:08:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621616888;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SotC8rRWBnbnXQfwPCkaoFO7CTkTOztXsn39H4ZCGaQ=;
 b=OEjxBR0iZYGhHG+jtZ8j2M7+YJV+RfVfDjyluTdEGTej/rKKZwXh1lSOFbCZiRBrsJTIQM
 s74+7MeAm4T6rO3wU3ZVtrA4SAley3S3lty4wt8vKWyoxmwHUmnTXJudfS+MQjbod1IZ27
 dj3a+mggtq9T2JqM0pxKm08x7/vCi30=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-UrnQ7MCjNB2DNS2CfuaMnA-1; Fri, 21 May 2021 13:08:05 -0400
X-MC-Unique: UrnQ7MCjNB2DNS2CfuaMnA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B18FC8042A3;
 Fri, 21 May 2021 17:08:04 +0000 (UTC)
Received: from redhat.com (ovpn-114-5.ams2.redhat.com [10.36.114.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E093B5D6DC;
 Fri, 21 May 2021 17:07:58 +0000 (UTC)
Date: Fri, 21 May 2021 18:07:56 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: A bug of Monitor Chardev ?
Message-ID: <YKfo7Kuazs8ayiwb@redhat.com>
References: <cd197959-7da0-ee50-1e65-e6b2e7107a86@huawei.com>
 <CAJ+F1C+4URqrZvAiBk+o-Ei4etL_oBtdPr0cugGmnMaYaZqGyA@mail.gmail.com>
 <YKU/k/DIJd6gMLvw@redhat.com> <87lf88pmyn.fsf@dusky.pond.sub.org>
 <YKfHGC79w0uv41Zd@t490s> <YKfg6j4mPjvjSrcF@redhat.com>
 <YKfmLgz59nv5Ef5u@redhat.com>
 <CAJ+F1CL_fTN8W2McRA-XXmY6HTy47GZdHz8aB4wxee_7hnyL2g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CL_fTN8W2McRA-XXmY6HTy47GZdHz8aB4wxee_7hnyL2g@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: chenjiashang@huawei.com, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Longpeng \(Mike,
 Cloud Infrastructure Service Product Dept.\)" <longpeng2@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 21, 2021 at 08:59:17PM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Fri, May 21, 2021 at 8:56 PM Daniel P. Berrangé <berrange@redhat.com>
> wrote:
> 
> > On Fri, May 21, 2021 at 05:33:46PM +0100, Daniel P. Berrangé wrote:
> > > On Fri, May 21, 2021 at 10:43:36AM -0400, Peter Xu wrote:
> > > >
> > > > I think the original problem was that if qemu_chr_fe_set_handlers() is
> > called
> > > > in main thread, it can start to race somehow within execution of the
> > function
> > > > qemu_chr_fe_set_handlers() right after we switch context at:
> > > >
> > > >     qemu_chr_be_update_read_handlers(s, context);
> > > >
> > > > Then the rest code in qemu_chr_fe_set_handlers() will continue to run
> > in main
> > > > thread for sure, but the should be running with the new iothread
> > context, which
> > > > introduce a race condition.
> > > >
> > > > Running qemu_chr_be_update_read_handlers() in BH resolves that because
> > then all
> > > > things run in the monitor iothread only and natually serialized.
> > >
> > > The first message in this thread, however, claims that it is *not*
> > > in fact serialized, when using the BH.
> > >
> > > > So the new comment looks indeed not fully right, as the chr device
> > should be
> > > > indeed within main thread context before qemu_chr_fe_set_handlers(),
> > it's just
> > > > that the race may start right away if without BH when context switch
> > happens
> > > > for the chr.
> > >
> > > It sounds like both the comment and the code are potentially wrong.
> >
> >
> > I feel like our root cause problem that the original code was trying to
> > workaround, is that the chardev is "active" from the very moment it is
> > created, regardless of whether the frontend is ready to use it.
> >
> > IIUC, in this case the socket chardev is already listen()ing and
> > accept()ing incoming clients off the network, before the monitor
> > has finished configuring its hooks into the chardev. This means
> > that the initial listen()/accept() I/O watches are using the
> > default GMainContext, and the monitor *has* to remove them and
> > put in new watches on the thread private GMainContext.
> >
> > To eliminate any risk of races, we need to make it possible for the
> > monitor to configure the GMainContext on the chardevs *before* any
> > I/O watches are configured.
> >
> > This in turn suggests that we need to split the chardev initialization
> > into two phases. First we have the basic chardev creation, with object
> > creation, option parsing/sanity checking, socket creation, and then
> > second we have the actual activation where the I/O watches are added.
> >
> > IOW,  qemu_chr_new() is the former and gets run from generic code in
> > the main() method, or in QMP chardev_add.  A new 'qemu_chr_activate'
> > method would be called by whatever frontend is using the chardev,
> > after registering a custom GMainContext.
> >
> > This would involve updating every single existing user of chardevs
> > to add a call to qemu_chr_activate, but that's worth it to eliminate
> > the race by design, rather than workaround it.
> >
> 
> 
> What about my earlier suggestion to add a new
> "qemu_chr_be_disable_handlers()" (until update_read_handlers is called
> again to enable them and the set a different context)?

It could probably work, but it still feels like a bit of a hack to me,
because there's still a window between the chardev create and the
qemu_chr_be_disable_handlers call where new clients arrive.

This may not be a problem in the scenario we're in with the monitor
here, because the mainloop isn't running yet IIUC, but for long term
think we're better off fixing the general problem rather than
introducing more special workarounds.

For example, I think your suggestion will still be racey if we ever
add support for hotplugging additional monitor instances, which
has been talked around recently.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


