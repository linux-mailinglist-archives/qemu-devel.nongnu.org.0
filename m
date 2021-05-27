Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A211392FFE
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 15:45:09 +0200 (CEST)
Received: from localhost ([::1]:41582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmGJw-0007J2-BV
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 09:45:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lmGAe-00065l-V1
 for qemu-devel@nongnu.org; Thu, 27 May 2021 09:35:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lmGAT-0001YN-PV
 for qemu-devel@nongnu.org; Thu, 27 May 2021 09:35:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622122521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l9fsJ31+rTPLd8u/chtez57Os/kGlwqfW2LwXf/+qUg=;
 b=EazpcDc932PnvEfusVMkF2mjbvm6dt7qsWdtR9d3HvOh8tRsh97yB+jyvt8esFBw6fSm9p
 seVnJrnEQ51vozc0eYF/gSoawrdSl8ZUgrRD85DurHKq4Li0uNj4fbZzCB1a2WEUfNH+OK
 ALdt6vlPrIACUvU6mw++ICVFDoRpJNM=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-lym9TL9yM5y6vbOD_5lolg-1; Thu, 27 May 2021 09:35:18 -0400
X-MC-Unique: lym9TL9yM5y6vbOD_5lolg-1
Received: by mail-qv1-f71.google.com with SMTP id
 bc3-20020ad456830000b02901f47dbd7ef6so105878qvb.6
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 06:35:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=l9fsJ31+rTPLd8u/chtez57Os/kGlwqfW2LwXf/+qUg=;
 b=BzvFxGyXOKPfYca7xJkOt5247ultNXXJHKCT28sDtN0BdfEEVTJZlTkvltRU6Mtxud
 0GPcrg4uDN9tpKSOewD0WKlQVscyxkBtwZAmtYTNuM1zxYdnwzDV6t365TSQGOcPfZio
 VfxLJgk7DDMN9PDZk4vpODbnY/Eth9qfAhZKfEWWLvHkffYZCGaS7MslCr/Q10V4UQV0
 1E5D458hT9WmskkjmRoHyytyN71l27eoFSdczup5YVKHwwov+dS3MJ0eIe25V7tHhMEk
 bumW/2IHhP+N4xWdEr8BIeikwg7dcoRUwsHR5WuHPFO2MmwTtCl4llnsk//dfZWsQONe
 kTRQ==
X-Gm-Message-State: AOAM531RQuF/P5n62fiztLID7kAz/DCyp1QzTeP6nHiKWWeLkw7XlSNZ
 rIVyIuaBg5am8Sn+tlHN3nGBGmLsWn7qGB4KSBew5rDfNXxfU6aRXc7w2yWNk1HRm/GWJD2KHD9
 nzZujGnCcGWrXr3Y=
X-Received: by 2002:a05:620a:f94:: with SMTP id
 b20mr3601045qkn.300.1622122517642; 
 Thu, 27 May 2021 06:35:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZzCknOenjkH77gvRiI52zhVZ5gn/YsJlSKqdMfHiIPg2yNUdPOaSCq1zTGfN0s5oKznJAPw==
X-Received: by 2002:a05:620a:f94:: with SMTP id
 b20mr3601006qkn.300.1622122517237; 
 Thu, 27 May 2021 06:35:17 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca.
 [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id x13sm1302398qtr.66.2021.05.27.06.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 06:35:16 -0700 (PDT)
Date: Thu, 27 May 2021 09:35:15 -0400
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 1/1] yank: Unregister function when using TLS migration
Message-ID: <YK+gE+/qqDCp4eEv@t490s>
References: <20210526200540.1088333-1-leobras.c@gmail.com>
 <YK6yQ9EVNlVPDMaS@t490s> <20210526232103.39e2a7d0@gecko.fritz.box>
 <YK7EotQbx/F9avls@t490s> <YK9cfiUx+vk/yxtf@redhat.com>
 <YK+PWHzpmnQqgYAw@t490s> <YK+SloySEG+O5wZV@redhat.com>
 <YK+Z9cUdjO+E6PCd@t490s> <YK+cA3Bl/MFGBhmy@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YK+cA3Bl/MFGBhmy@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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
Cc: qemu-devel@nongnu.org, Leonardo Bras <leobras.c@gmail.com>,
 Lukas Straub <lukasstraub2@web.de>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 27, 2021 at 02:17:55PM +0100, Daniel P. Berrangé wrote:
> On Thu, May 27, 2021 at 09:09:09AM -0400, Peter Xu wrote:
> > On Thu, May 27, 2021 at 01:37:42PM +0100, Daniel P. Berrangé wrote:
> > > On Thu, May 27, 2021 at 08:23:52AM -0400, Peter Xu wrote:
> > > > On Thu, May 27, 2021 at 09:46:54AM +0100, Daniel P. Berrangé wrote:
> > > > > On Wed, May 26, 2021 at 05:58:58PM -0400, Peter Xu wrote:
> > > > > > On Wed, May 26, 2021 at 11:21:03PM +0200, Lukas Straub wrote:
> > > > > > > On Wed, 26 May 2021 16:40:35 -0400
> > > > > > > Peter Xu <peterx@redhat.com> wrote:
> > > > > > > 
> > > > > > > > On Wed, May 26, 2021 at 05:05:40PM -0300, Leonardo Bras wrote:
> > > > > > > > > After yank feature was introduced, whenever migration is started using TLS,
> > > > > > > > > the following error happens in both source and destination hosts:
> > > > > > > > > 
> > > > > > > > > (qemu) qemu-kvm: ../util/yank.c:107: yank_unregister_instance:
> > > > > > > > > Assertion `QLIST_EMPTY(&entry->yankfns)' failed.
> > > > > > > > > 
> > > > > > > > > This happens because of a missing yank_unregister_function() when using
> > > > > > > > > qio-channel-tls.
> > > > > > > > > 
> > > > > > > > > Fix this by also allowing TYPE_QIO_CHANNEL_TLS object type to perform
> > > > > > > > > yank_unregister_function() in channel_close() and multifd_load_cleanup().
> > > > > > > > > 
> > > > > > > > > Fixes: 50186051f ("Introduce yank feature")
> > > > > > > > > Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1964326
> > > > > > > > > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>  
> > > > > > > > 
> > > > > > > > Leo,
> > > > > > > > 
> > > > > > > > Thanks for looking into it!
> > > > > > > > 
> > > > > > > > So before looking int the fix... I do have a doubt on why we only enable yank
> > > > > > > > on socket typed, as I think tls should also work with qio_channel_shutdown().
> > > > > > > > 
> > > > > > > > IIUC the confused thing here is we register only for qio-socket, however tls
> > > > > > > > will actually call migration_channel_connect() twice, first with a qio-socket,
> > > > > > > > then with the real tls-socket.  For tls I feel like we have registered with the
> > > > > > > > wrong channel - instead of the wrapper socket ioc, we should register to the
> > > > > > > > final tls ioc?
> > > > > > > > 
> > > > > > > > Lukas, is there a reason?
> > > > > > > > 
> > > > > > > 
> > > > > > > Hi,
> > > > > > > There is no specific reason. Both ways work equally well in preventing
> > > > > > > qemu from hanging. shutdown() for tls-channel just makes it abort a
> > > > > > > little sooner (by not attempting to encrypt and send data anymore).
> > > > > > > 
> > > > > > > I don't lean either way. I guess registering it on the tls-channel
> > > > > > > makes is a bit more explicit and clearer.
> > > > > > 
> > > > > > Agreed, because IMHO logically the migration code should not be aware of
> > > > > > internals of IOChannels, e.g., we shouldn't need to know ioc->master is the
> > > > > > socket ioc of tls ioc to unregister.
> > > > > 
> > > > > I think it is atually better to ignore the TLS channel and *always* yank
> > > > > on the undering socket IO channel. The yank functionality is intended to
> > > > > be used in a scenario where we know the channels are broken.  If yank
> > > > > calls the high level IO channel it is potentially going to try to do a
> > > > > cleanup shutdown that we know will fail because of the broken network.
> > > > 
> > > > Could you elaborate what's the "cleanup shutdown"?
> > > > 
> > > > The yank calls migration_yank_iochannel:
> > > > 
> > > > void migration_yank_iochannel(void *opaque)
> > > > {
> > > >     QIOChannel *ioc = QIO_CHANNEL(opaque);
> > > > 
> > > >     qio_channel_shutdown(ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
> > > > }
> > > > 
> > > > Where qio_channel_shutdown for tls is nothing but delivers that to the master
> > > > channel:
> > > > 
> > > > static int qio_channel_tls_shutdown(QIOChannel *ioc,
> > > >                                     QIOChannelShutdown how,
> > > >                                     Error **errp)
> > > > {
> > > >     QIOChannelTLS *tioc = QIO_CHANNEL_TLS(ioc);
> > > > 
> > > >     qatomic_or(&tioc->shutdown, how);
> > > > 
> > > >     return qio_channel_shutdown(tioc->master, how, errp);
> > > > }
> > > > 
> > > > So I thought it was a nice wrapper just for things like this, and I didn't see
> > > > anything it does more than the io_shutdown for the socket channel.  Did I miss
> > > > something?
> > > 
> > > Today thats the case, but don't assume it will be the case forever.
> > > There is a mechanism in TLS for doing clean shutdown which we've
> > > debated including.
> > > 
> > > In general apps *can* just call the shutdown method on the QIOChannelTLS
> > > object no matter what.  Yank is just a little bit special because of its
> > > need to be guaranteed to work even when the network is dead. So yank
> > > should always directly call the low level QIOChannelSocket, so thre is
> > > a strong guarantee it can't block on something.
> > 
> > Hmm, I am still not fully convinced that that's a valid reason the migration
> > code should be aware of how the socket is managed in tls channels...
> > 
> > Does that sound more like a good reason to introduce QIOChannelShutdown with
> > QIO_CHANNEL_SHUTDOWN_FORCE so it'll always not block if FORCE set?  Then we can
> > switch the yank function to use that.
> > 
> > What do you think?
> 
> I think that's unneccessary - the migration code already does similar
> things elsewhere when it wants to distinguish TLS usage, so this is not
> anything new conceptually.

But IMHO the other option is to reduce tls difference and treat it the same as
the other channels as much as possible.. probably starting from reworking the
yank calls..

And IIUC it's not only about migration.  E.g., all the existing yank functions
are based on the fact that current channel shutdown() won't block as it's
called in the QMP oob handler:

char_socket_yank_iochannel[409] qio_channel_shutdown(ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
nbd_yank[1783]                 qio_channel_shutdown(QIO_CHANNEL(s->sioc), QIO_CHANNEL_SHUTDOWN_BOTH, NULL);

I have no idea whether they'll use tls or not, I don't see strictly on why they
can't at least in the future... If tls starts to introduce shutdown() that can
block, IMHO the cleaner solution is to separate the use of block/nonblock
shutdown() because we do have scenarios that do not want shutdown() to block,
by either introduce QIO_CHANNEL_SHUTDOWN_FORCE or QIO_CHANNEL_SHUTDOWN_FULL
which guarantees full cleanup of the tls channel even slower.

We also have other call sites for channel shutdown()s besides yank, I didn't
check but I feel like it's always good to provide non-blocking solutions when
the caller wants, as it does look like a valid requirement as long as the
change is trivial (IIUC it'll be a small patch and conditionally do either
quick/slow version of shutdown for tls only).

Thanks,

-- 
Peter Xu


