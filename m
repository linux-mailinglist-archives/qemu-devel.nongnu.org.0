Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5075B389483
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 19:16:09 +0200 (CEST)
Received: from localhost ([::1]:55384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljPnk-0005as-9d
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 13:16:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ljPFs-0005W9-7t
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:41:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ljPFq-0000pj-9h
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:41:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621442465;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tCV1Za5Y3GfDGVAVGVzU+TZJ0d4I09mBV8EIyDRaWPA=;
 b=CMPYX2YZm297j8jqFPHYhsUs+dOfi+Y9YeLbfuB3JQiC32w5V2ODtUHQKamRyGN0KYDpX/
 ugtOfCpG/ZS3CsBglNrEK77aA47nUZPnjvTXdmjiHAw1whZx9CJbotCDENchiWF1/BrBYk
 lwmCjNVIgkU9HsBhB9tYe3r+kJhlxqI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-GxVTY40MOR-jEfOsl5pzTg-1; Wed, 19 May 2021 12:41:01 -0400
X-MC-Unique: GxVTY40MOR-jEfOsl5pzTg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 943D71854E26;
 Wed, 19 May 2021 16:41:00 +0000 (UTC)
Received: from redhat.com (ovpn-115-106.ams2.redhat.com [10.36.115.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DC5910074E0;
 Wed, 19 May 2021 16:40:53 +0000 (UTC)
Date: Wed, 19 May 2021 17:40:51 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: A bug of Monitor Chardev ?
Message-ID: <YKU/k/DIJd6gMLvw@redhat.com>
References: <cd197959-7da0-ee50-1e65-e6b2e7107a86@huawei.com>
 <CAJ+F1C+4URqrZvAiBk+o-Ei4etL_oBtdPr0cugGmnMaYaZqGyA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1C+4URqrZvAiBk+o-Ei4etL_oBtdPr0cugGmnMaYaZqGyA@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
 QEMU <qemu-devel@nongnu.org>, "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Longpeng \(Mike,
 Cloud Infrastructure Service Product Dept.\)" <longpeng2@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 19, 2021 at 08:17:51PM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Mon, May 17, 2021 at 11:11 AM Longpeng (Mike, Cloud Infrastructure
> Service Product Dept.) <longpeng2@huawei.com> wrote:
> 
> > We find a race during QEMU starting, which would case the QEMU process
> > coredump.
> >
> > <main loop>                             |    <MON iothread>
> >                                         |
> > [1] create MON chardev                  |
> > qemu_create_early_backends              |
> >   chardev_init_func                     |
> >                                         |
> > [2] create MON iothread                 |
> > qemu_create_late_backends               |
> >   mon_init_func                         |
> >         aio_bh_schedule----------------------->
> > monitor_qmp_setup_handlers_bh
> > [3] enter main loog                     |    tcp_chr_update_read_handler
> > (* A client come in, e.g. Libvirt *)    |      update_ioc_handlers
> >
> tcp_chr_new_client                      |
> >   update_ioc_handlers                   |
> >                                         |
> >     [4] create new hup_source           |
> >         s->hup_source = *PTR1*          |
> >           g_source_attach(s->hup_source)|
> >                                         |        [5]
> > remove_hup_source(*PTR1*)
> >                                         |            (create new
> > hup_source)
> >                                         |             s->hup_source =
> > *PTR2*
> >         [6] g_source_attach_unlocked    |
> >               *PTR1* is freed by [5]    |
> >
> > Do you have any suggestion to fix this bug ? Thanks!
> >
> >
> I see.. I think the simplest would be for the chardev to not be dispatched
> in the original thread after monitor_init_qmp(). It looks like this should
> translate at least to calling qio_net_listener_set_client_func_full() with
> NULL handlers. I can't see where we could fit that in the chardev API.
> Perhaps add a new qemu_chr_be_disable_handlers() (until
> update_read_handlers is called again to enable them)?
> 
> Daniel? Paolo?

IIUC, the problem is:

  - when we first create the chardev, its IO watches are setup with
    the default (NULL) GMainContext which is processed by the main
    thread

  - when we create the monitor, we re-initialize the chardev to
    attach its IO watches to a custom GMainCOntext associated with
    the monitor thread.

  - The re-initialization is happening in a bottom half that runs
    in the monitor thread, thus the main thread can already start
    processing an IO event in parallel

Looking at the code in qmp.c monitor_init_qmp method it has a
comment:

        /*
         * We can't call qemu_chr_fe_set_handlers() directly here
         * since chardev might be running in the monitor I/O
         * thread.  Schedule a bottom half.
         */

AFAICT, that comment is wrong. monitor_init_qmp is called from
monitor_init, which is called from monitor_init_opts, which is
called from qemu_create_late_backends, which runs in the main
thread.

I think we should explicitly document that monitor_init_qmp
is *required* to be invoked from the main thread and then
remove the bottom half usage.  If we ever find a need to
create a new monitor from a non-main thread, that thread
could use an idle callback attached to the default GMainContext
to invoke monitor_init_qmp.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


