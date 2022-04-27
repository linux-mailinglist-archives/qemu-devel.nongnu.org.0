Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B845115D3
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 13:33:32 +0200 (CEST)
Received: from localhost ([::1]:41280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njfvH-0001ck-6P
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 07:33:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1njftX-0007dd-CM
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 07:31:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1njftV-0001g2-0x
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 07:31:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651059100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QmdEZ78Xp5zUOyVFxCkFonIoeOy/D70rU7NtBMalUOo=;
 b=ZgT8GPa6+fDatROnu4hFyie56XD653RQNA5CsYiDGolZh7mJWBhZA4h+c1ByFPZYKcW3oJ
 QN3J/nq9xZ4bqOK5MjZEvGfUETYjyO8/RvUSQe9QFN8mGq6YYfR1QZvUYOSvaAl9QVHK7R
 XK49YTgzso8Q1dju4eTujSV5A7AlmxA=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-153-CNOuaqs2PZmBpq9vbUgzjA-1; Wed, 27 Apr 2022 07:31:39 -0400
X-MC-Unique: CNOuaqs2PZmBpq9vbUgzjA-1
Received: by mail-lf1-f69.google.com with SMTP id
 c11-20020a056512104b00b00471f86be758so640022lfb.1
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 04:31:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QmdEZ78Xp5zUOyVFxCkFonIoeOy/D70rU7NtBMalUOo=;
 b=iwhHPBXMBUcbMgQwJ0ObrwDX6YaQNF2vx9Q7NXva6eHt5zhDqkbP1Ehqm1Y/BBI0pp
 21fSTywTv6J2XE4kiMD8/SI1uJVsueXFl6uC9wAy/VvMjYKoVJOU0weDZ64k/W9onk7w
 9Ax6TSORhuMblZzogMFgAttqaPGtZyDoMXaSURrlArhfKXC53KydSvvLzoe/wIFI/6Fv
 K0twvIZ1L0GFYZerBvWXAA4K5NOeQgSICiUXNvLQdIVUhyKvrRzTS2K+lLg7E+yLvTgX
 rZJouV807UrxbW0MLL/vAmK0qoHvo+xTPlDwXJscqMree6iu9TmjmpNUNwVwJEoJU23+
 mk1Q==
X-Gm-Message-State: AOAM533dDy74H6zcYyghkMd3AHtB0ObYqXQK/yEVyd1tvY4dU3MqsiuO
 GiKizj5Nxhs47K3ONeTx3Jfvwx8GsOC/TPqo2ZM83v/N8ninhnj+2FHaiHQb+N+MZMz39D5xIGo
 AqjjHrbDLlHXFZcISDwbKlcJLPd3d2C0=
X-Received: by 2002:a19:4f53:0:b0:472:1714:61f1 with SMTP id
 a19-20020a194f53000000b00472171461f1mr5947302lfk.473.1651059097625; 
 Wed, 27 Apr 2022 04:31:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMDDgJmNpF8ObClA73PyPC1KlzgG/sqANVwPOPXAWYLtOiHKkNDpOY1pEb0glmAhQlDNe4R16k/nLY6+s0eSs=
X-Received: by 2002:a19:4f53:0:b0:472:1714:61f1 with SMTP id
 a19-20020a194f53000000b00472171461f1mr5947290lfk.473.1651059097432; Wed, 27
 Apr 2022 04:31:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220426230654.637939-1-leobras@redhat.com>
 <20220426230654.637939-8-leobras@redhat.com>
 <YmkC51KEA1+SOoc9@redhat.com>
In-Reply-To: <YmkC51KEA1+SOoc9@redhat.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Wed, 27 Apr 2022 08:31:26 -0300
Message-ID: <CAJ6HWG6b=ShhO5E+bW7Y65eWRbBYpW=B3S=tFoOYaeT4hMfySA@mail.gmail.com>
Subject: Re: [PATCH v10 7/7] multifd: Implement zero copy write in multifd
 migration (multifd-zero-copy)
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 27, 2022 at 5:46 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Tue, Apr 26, 2022 at 08:06:56PM -0300, Leonardo Bras wrote:
> > Implement zero copy send on nocomp_send_write(), by making use of QIOCh=
annel
> > writev + flags & flush interface.
> >
> > Change multifd_send_sync_main() so flush_zero_copy() can be called
> > after each iteration in order to make sure all dirty pages are sent bef=
ore
> > a new iteration is started. It will also flush at the beginning and at =
the
> > end of migration.
> >
> > Also make it return -1 if flush_zero_copy() fails, in order to cancel
> > the migration process, and avoid resuming the guest in the target host
> > without receiving all current RAM.
> >
> > This will work fine on RAM migration because the RAM pages are not usua=
lly freed,
> > and there is no problem on changing the pages content between writev_ze=
ro_copy() and
> > the actual sending of the buffer, because this change will dirty the pa=
ge and
> > cause it to be re-sent on a next iteration anyway.
> >
> > A lot of locked memory may be needed in order to use multifd migration
> > with zero-copy enabled, so disabling the feature should be necessary fo=
r
> > low-privileged users trying to perform multifd migrations.
> >
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > ---
> >  migration/multifd.h   |  2 ++
> >  migration/migration.c | 11 ++++++++++-
> >  migration/multifd.c   | 37 +++++++++++++++++++++++++++++++++++--
> >  migration/socket.c    |  5 +++--
> >  4 files changed, 50 insertions(+), 5 deletions(-)
>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>
>
> With regards,
> Daniel

Thanks for reviewing, Daniel!

Best regards,
Leo

> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>


