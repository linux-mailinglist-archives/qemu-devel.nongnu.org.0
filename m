Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3FA4297E1
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 21:58:38 +0200 (CEST)
Received: from localhost ([::1]:33574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ma1RU-00054K-Fk
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 15:58:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1ma1PZ-0004C3-GZ
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 15:56:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1ma1PR-0000fB-VT
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 15:56:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633982186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iV+x4gCjJjoEbGckQcckzIYtaBx4jcwR+QWHXPq8u7Q=;
 b=eg019jBAAwSUPvNM3CbrhsIlerm6dLxB0Rok7coK1ByF24+un8QB7PJ18PA/6MWX9t1y5D
 x6dra7SUDTqKy4fb/UiPuPOPZHibAkADWeH2PpHdx5FqjeQYOXUf6ttpEA0/a9MfYVJlt4
 1Iun5D8+Wyng+P0+9HQHc3RV2uVvOIA=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-nUtu3CiNNuOimWsmH-B0GQ-1; Mon, 11 Oct 2021 15:56:23 -0400
X-MC-Unique: nUtu3CiNNuOimWsmH-B0GQ-1
Received: by mail-lf1-f72.google.com with SMTP id
 p42-20020a05651213aa00b003fd8935b8d6so3728687lfa.10
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 12:56:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iV+x4gCjJjoEbGckQcckzIYtaBx4jcwR+QWHXPq8u7Q=;
 b=TITaRZVLaocgjbtHgEdmAl5Pp0POlYCkKrs57HzaKpGeyPq9kjnZvBR44ERgUfonuy
 4yVgi2iWTwq7/BIngZzfb5+8edw6QqvvJa9/mLr3xlZir4mHburxb8RrKBT8YNQL8har
 vHduhS+2QUVIURifHAv0bLC7+SpKhZQdOvo3X2cHttbrf1gYnRzb8mpWO2ouhDI5bfvF
 wfUCc5I0gzDgdkER5a8Okx3yT1a/vIXfyao+pUel21WVh/OoSCkq+7CMBJNdEwG2Tjbc
 uRktPxtxIs7SMMkfflGnZiwKj5ZNUjKGFXMCW94l9Pyo5+vLmSHhPx25YCm8bYrGU5D+
 xO7A==
X-Gm-Message-State: AOAM533gFRxQvIWgcoMPFOhQgn2y61uPZ9GN76VCT7zGfa1S6vHoGYdC
 Cm4zP+ldaoKEVGf7ZtaKgNTGCOWkkfI9ZDR3GSLGb/1DOUlTEGGSoiplUhIO8Hrwm1VJuEApf2N
 XJO8ojrPD0Kxqj14/VZ6BJLYiqTKwCjU=
X-Received: by 2002:a19:c38d:: with SMTP id
 t135mr28790149lff.187.1633982181815; 
 Mon, 11 Oct 2021 12:56:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdZpZTE1r32CppTqLh82jK/cVaHpAC8N6ZIIFuuE9eP4oZBWj1Gso7ye89Xe7TT6+7kPQX5ysimO6dw4SJJe8=
X-Received: by 2002:a19:c38d:: with SMTP id
 t135mr28790126lff.187.1633982181493; 
 Mon, 11 Oct 2021 12:56:21 -0700 (PDT)
MIME-Version: 1.0
References: <20211009075612.230283-1-leobras@redhat.com>
 <20211009075612.230283-4-leobras@redhat.com>
 <20211011193156.biedorxjetduaf7y@redhat.com>
In-Reply-To: <20211011193156.biedorxjetduaf7y@redhat.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Mon, 11 Oct 2021 16:56:22 -0300
Message-ID: <CAJ6HWG5neqLVdO_o+uzykOj3S-N5T0XUHv1_7Qo37_pw0eP_ZQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] multifd: Implement zerocopy write in multifd
 migration (multifd-zerocopy)
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Eric,

On Mon, Oct 11, 2021 at 4:32 PM Eric Blake <eblake@redhat.com> wrote:
>
> On Sat, Oct 09, 2021 at 04:56:13AM -0300, Leonardo Bras wrote:
> > Implement zerocopy on nocomp_send_write(), by making use of QIOChannel
> > zerocopy interface.
> >
> > Change multifd_send_sync_main() so it can distinguish the last sync from
> > the setup and per-iteration ones, so a flush_zerocopy() can be called
> > at the last sync in order to make sure all RAM is sent before finishing
> > the migration.
> >
> > Also make it return -1 if flush_zerocopy() fails, in order to cancel
> > the migration process, and avoid resuming the guest in the target host
> > without receiving all current RAM.
> >
> > This will work fine on RAM migration because the RAM pages are not usually freed,
> > and there is no problem on changing the pages content between async_send() and
> > the actual sending of the buffer, because this change will dirty the page and
> > cause it to be re-sent on a next iteration anyway.
> >
> > Given a lot of locked memory may be needed in order to use multid migration
> > with zerocopy enabled, make it optional by creating a new parameter
> > multifd-zerocopy on qapi, so low-privileged users can still perform multifd
> > migrations.
> >
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > ---
> >  qapi/migration.json   | 18 ++++++++++++++++++
> >  migration/migration.h |  1 +
> >  migration/multifd.h   |  2 +-
> >  migration/migration.c | 20 ++++++++++++++++++++
> >  migration/multifd.c   | 33 ++++++++++++++++++++++++++++-----
> >  migration/ram.c       | 20 +++++++++++++-------
> >  monitor/hmp-cmds.c    |  4 ++++
> >  7 files changed, 85 insertions(+), 13 deletions(-)
> >
> > diff --git a/qapi/migration.json b/qapi/migration.json
> > index 88f07baedd..c4890cbb54 100644
> > --- a/qapi/migration.json
> > +++ b/qapi/migration.json
> > @@ -724,6 +724,11 @@
> >  #                      will consume more CPU.
> >  #                      Defaults to 1. (Since 5.0)
> >  #
> > +# @multifd-zerocopy: Controls behavior on sending memory pages on multifd migration.
> > +#                    When true, enables a zerocopy mechanism for sending memory
> > +#                    pages, if host does support it.
>
> s/does support/supports/ (several instances this patch)

I will make sure to fix that in v5.

>
> > +#                    Defaults to false. (Since 6.2)
> > +#
> >  # @block-bitmap-mapping: Maps block nodes and bitmaps on them to
> >  #                        aliases for the purpose of dirty bitmap migration.  Such
> >  #                        aliases may for example be the corresponding names on the
> > @@ -758,6 +763,7 @@
> >             'xbzrle-cache-size', 'max-postcopy-bandwidth',
> >             'max-cpu-throttle', 'multifd-compression',
> >             'multifd-zlib-level' ,'multifd-zstd-level',
> > +        'multifd-zerocopy',
> >             'block-bitmap-mapping' ] }
>
> Should this feature be guarded with 'if':'CONFIG_LINUX', since that's
> the only platform where you even compile the code (even then, it can
> still fail if the kernel doesn't support it).

I think it makes sense for the feature to always be available, even
though it's not supported
outside linux > v4.14.

IMHO it makes more sense for the user to get an error when it starts
migration, due to host
not supporting zerocopy, than the error happening in the config step,
which may cause the user
to question if it was the right parameter.

The config message error here could also be ignored, and users can
think zerocopy is working, while it's not.

For automated migrations, this feature should never be enabled  for
non-linux / older linux hosts anyway.

Is there a good argument I am missing for this feature being disabled
on non-linux?

>
> --
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3266
> Virtualization:  qemu.org | libvirt.org
>

Best regards,
Leo


