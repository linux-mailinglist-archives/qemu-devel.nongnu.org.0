Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D61538C965
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 16:44:40 +0200 (CEST)
Received: from localhost ([::1]:56470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk6OF-00063k-8y
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 10:44:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lk6NM-0005PA-O7
 for qemu-devel@nongnu.org; Fri, 21 May 2021 10:43:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lk6NK-00076A-3x
 for qemu-devel@nongnu.org; Fri, 21 May 2021 10:43:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621608221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hm9vu1I3PzMIAhzbuEMLEhoXnXnB7qz4nwVcUXkqRCo=;
 b=DCMXKbg3zJKBER3NM106PlMM5URDA8nj6AgizFWl18GAJc6eDrBSv8iuLcdzgeOj/pExVn
 GHqnOWBI3Wc6jlnC3yAx6USOSHBId0TW7d2mQ/ORs+VKud5kgCy0/iR3eDENbR+nkAeEAC
 S8EjE2/uefFydtR2ghKCzifhVhd/+hQ=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-LVBXm4ypMwe4mGTbV6UTDA-1; Fri, 21 May 2021 10:43:39 -0400
X-MC-Unique: LVBXm4ypMwe4mGTbV6UTDA-1
Received: by mail-qk1-f199.google.com with SMTP id
 b19-20020a05620a0893b02902e956b29f5dso16639413qka.16
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 07:43:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=hm9vu1I3PzMIAhzbuEMLEhoXnXnB7qz4nwVcUXkqRCo=;
 b=Z2kTFqKjGzhglP7T0Er350XqGhuc4c+UzXhFhBRRHRXjhLqjE1sW85J75Te4uJmcC8
 n2zeAqQ4Q9p6o+oyAT2Kn6v3imCcM48TVoxcOmQA9tj3x2CENq5wW3G7NUbQrh/k9XXp
 z9OFZJnxl//nsd+Jx4ZdQRWl3PPZUl0SClpOjyr3ripykyrJIS8bGeV+5JTEvEtkgo2Q
 H2zEhvvLhoiTXPuj51wygfm9NHoEdPAEj65g1FVldeAXj3+lOEt06rygw5XuNN/3eFlH
 hTZnVhA0d36sIn9wRtcZ5E8dRUwFdKILXYTSGrROXxC6z2N5fCcqBe+SVuoGnZbkqUe6
 FE5g==
X-Gm-Message-State: AOAM531+GSmYGp2o84Z7ARWQrhAjJ0wQt+zZxQbM1Q5uX69mA4GgISGr
 cv4aNWHdjJl7QhaXevcfphyWU1S3qtBeb4oYC2GAr2A/SIF8Xqym40K88drOpZBwyuHySiR1h4Q
 YHwZlaNI91im+THs=
X-Received: by 2002:ad4:4a01:: with SMTP id m1mr13089670qvz.6.1621608218918;
 Fri, 21 May 2021 07:43:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypkHLCen3RQEziZD9aGQcj9Dns/GbpB3h1ajO6fO51JPXToy+dC87PeJ/Jyo21YIlQpYsrTg==
X-Received: by 2002:ad4:4a01:: with SMTP id m1mr13089628qvz.6.1621608218553;
 Fri, 21 May 2021 07:43:38 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca.
 [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id j30sm5086307qki.60.2021.05.21.07.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 07:43:37 -0700 (PDT)
Date: Fri, 21 May 2021 10:43:36 -0400
From: Peter Xu <peterx@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: A bug of Monitor Chardev ?
Message-ID: <YKfHGC79w0uv41Zd@t490s>
References: <cd197959-7da0-ee50-1e65-e6b2e7107a86@huawei.com>
 <CAJ+F1C+4URqrZvAiBk+o-Ei4etL_oBtdPr0cugGmnMaYaZqGyA@mail.gmail.com>
 <YKU/k/DIJd6gMLvw@redhat.com> <87lf88pmyn.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87lf88pmyn.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
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
Cc: chenjiashang@huawei.com,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Longpeng \(Mike,
 Cloud Infrastructure Service Product Dept.\)" <longpeng2@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 21, 2021 at 09:25:52AM +0200, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > On Wed, May 19, 2021 at 08:17:51PM +0400, Marc-André Lureau wrote:
> >> Hi
> >> 
> >> On Mon, May 17, 2021 at 11:11 AM Longpeng (Mike, Cloud Infrastructure
> >> Service Product Dept.) <longpeng2@huawei.com> wrote:
> >> 
> >> > We find a race during QEMU starting, which would case the QEMU process
> >> > coredump.
> >> >
> >> > <main loop>                             |    <MON iothread>
> >> >                                         |
> >> > [1] create MON chardev                  |
> >> > qemu_create_early_backends              |
> >> >   chardev_init_func                     |
> >> >                                         |
> >> > [2] create MON iothread                 |
> >> > qemu_create_late_backends               |
> >> >   mon_init_func                         |
> >> >         aio_bh_schedule----------------------->
> >> > monitor_qmp_setup_handlers_bh
> >> > [3] enter main loog                     |    tcp_chr_update_read_handler
> >> > (* A client come in, e.g. Libvirt *)    |      update_ioc_handlers
> >> >
> >> tcp_chr_new_client                      |
> >> >   update_ioc_handlers                   |
> >> >                                         |
> >> >     [4] create new hup_source           |
> >> >         s->hup_source = *PTR1*          |
> >> >           g_source_attach(s->hup_source)|
> >> >                                         |        [5]
> >> > remove_hup_source(*PTR1*)
> >> >                                         |            (create new
> >> > hup_source)
> >> >                                         |             s->hup_source =
> >> > *PTR2*
> >> >         [6] g_source_attach_unlocked    |
> >> >               *PTR1* is freed by [5]    |
> >> >
> >> > Do you have any suggestion to fix this bug ? Thanks!
> >> >
> >> >
> >> I see.. I think the simplest would be for the chardev to not be dispatched
> >> in the original thread after monitor_init_qmp(). It looks like this should
> >> translate at least to calling qio_net_listener_set_client_func_full() with
> >> NULL handlers. I can't see where we could fit that in the chardev API.
> >> Perhaps add a new qemu_chr_be_disable_handlers() (until
> >> update_read_handlers is called again to enable them)?
> >> 
> >> Daniel? Paolo?
> >
> > IIUC, the problem is:
> >
> >   - when we first create the chardev, its IO watches are setup with
> >     the default (NULL) GMainContext which is processed by the main
> >     thread
> >
> >   - when we create the monitor, we re-initialize the chardev to
> >     attach its IO watches to a custom GMainCOntext associated with
> >     the monitor thread.
> >
> >   - The re-initialization is happening in a bottom half that runs
> >     in the monitor thread, thus the main thread can already start
> >     processing an IO event in parallel
> >
> > Looking at the code in qmp.c monitor_init_qmp method it has a
> > comment:
> >
> >         /*
> >          * We can't call qemu_chr_fe_set_handlers() directly here
> >          * since chardev might be running in the monitor I/O
> >          * thread.  Schedule a bottom half.
> >          */
> >
> > AFAICT, that comment is wrong. monitor_init_qmp is called from
> > monitor_init, which is called from monitor_init_opts, which is
> > called from qemu_create_late_backends, which runs in the main
> > thread.
> 
> Goes back to commit a5ed352596a8b7eb2f9acce34371b944ac3056c4
> Author: Peter Xu <peterx@redhat.com>
> Date:   Fri Mar 9 16:59:52 2018 +0800
> 
>     monitor: allow using IO thread for parsing
>     
>     For each Monitor, add one field "use_io_thr" to show whether it will be
>     using the dedicated monitor IO thread to handle input/output.  When set,
>     monitor IO parsing work will be offloaded to the dedicated monitor IO
>     thread, rather than the original main loop thread.
>     
>     This only works for QMP.  HMP will always be run on the main loop
>     thread.
>     
>     Currently we're still keeping use_io_thr off always.  Will turn it on
>     later at some point.
>     
>     One thing to mention is that we cannot set use_io_thr for every QMP
>     monitor.  The problem is that MUXed typed chardevs may not work well
>     with it now. When MUX is used, frontend of chardev can be the monitor
>     plus something else.  The only thing we know would be safe to be run
>     outside main thread so far is the monitor frontend. All the rest of the
>     frontends should still be run in main thread only.
>     
>     Signed-off-by: Peter Xu <peterx@redhat.com>
>     Message-Id: <20180309090006.10018-10-peterx@redhat.com>
>     Reviewed-by: Eric Blake <eblake@redhat.com>
>     [eblake: squash in Peter's followup patch to avoid test failures]
>     Signed-off-by: Eric Blake <eblake@redhat.com>
> 
> Peter, do you remember why you went for a bottom half?
> 
> Hmm, back then it was in monitor_init(), which was called from several
> places.  Did we manage to lose the need for a bottom half along the way?
> 
> Note that the initial comment was a bit different:
> 
>         if (mon->use_io_thr) {
>             /*
>              * Make sure the old iowatch is gone.  It's possible when
>              * e.g. the chardev is in client mode, with wait=on.
>              */
>             remove_fd_in_watch(chr);
>             /*
>              * We can't call qemu_chr_fe_set_handlers() directly here
>              * since during the procedure the chardev will be active
>              * and running in monitor iothread, while we'll still do
>              * something before returning from it, which is a possible
>              * race too.  To avoid that, we just create a BH to setup
>              * the handlers.
>              */
>             aio_bh_schedule_oneshot(monitor_get_aio_context(),
>                                     monitor_qmp_setup_handlers_bh, mon);
>             /* We'll add this to mon_list in the BH when setup done */
>             return;
>         } else {
>             qemu_chr_fe_set_handlers(&mon->chr, monitor_can_read,
>                                      monitor_qmp_read, monitor_qmp_event,
>                                      NULL, mon, NULL, true);
>         }
> 
> I changed it in commit 774a6b67a40.

I think the original problem was that if qemu_chr_fe_set_handlers() is called
in main thread, it can start to race somehow within execution of the function
qemu_chr_fe_set_handlers() right after we switch context at:

    qemu_chr_be_update_read_handlers(s, context);

Then the rest code in qemu_chr_fe_set_handlers() will continue to run in main
thread for sure, but the should be running with the new iothread context, which
introduce a race condition.

Running qemu_chr_be_update_read_handlers() in BH resolves that because then all
things run in the monitor iothread only and natually serialized.

So the new comment looks indeed not fully right, as the chr device should be
indeed within main thread context before qemu_chr_fe_set_handlers(), it's just
that the race may start right away if without BH when context switch happens
for the chr.

Thanks,

> 
> > I think we should explicitly document that monitor_init_qmp
> > is *required* to be invoked from the main thread and then
> > remove the bottom half usage.
> 
> Assert "running in main thread", so screwups crash reliably instead of
> creating a race.
> 
> >                                If we ever find a need to
> > create a new monitor from a non-main thread, that thread
> > could use an idle callback attached to the default GMainContext
> > to invoke monitor_init_qmp.
> >
> > Regards,
> > Daniel
> 

-- 
Peter Xu


