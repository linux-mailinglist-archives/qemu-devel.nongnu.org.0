Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D845C43D908
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 03:58:18 +0200 (CEST)
Received: from localhost ([::1]:56128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfugL-0008RO-Es
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 21:58:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mfufA-0007gi-Aa
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 21:57:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mfuf5-0001X8-N9
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 21:57:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635386217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aW6Z+nD2g5ePG310+zThVhrcZISwd3XbTaSIHxcMEAs=;
 b=NfvLQPUIQT3Ze+pGE20qE/U0SM2l6xDSThjbFz0FE8WBKSu/A3wW/ssHegCiCvVlAR2qxB
 yhGKZECREuX75Y8UoSVzPuh1vFMo91ZP4lrl70GV8Us8vKe6EdBzcKsW+vlVGVARMnLYuG
 jB8HFhyQ+5RLdJYUft4NAotG+/82KYs=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-QUVMy1cQNpezaY5Zn1oCRQ-1; Wed, 27 Oct 2021 21:56:50 -0400
X-MC-Unique: QUVMy1cQNpezaY5Zn1oCRQ-1
Received: by mail-lf1-f70.google.com with SMTP id
 bq29-20020a056512151d00b003ffce2467adso2132639lfb.3
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 18:56:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aW6Z+nD2g5ePG310+zThVhrcZISwd3XbTaSIHxcMEAs=;
 b=o4Q+iXcQi1MLPtYOk2ZdKSH0zysJdvI0lDLZ0ecMrS3RGW/bj3UiDADJVk+886D/tf
 uT949fK8jYsed7gxyHJkn9f09+aEegRXenCiUmBBM9hxJx84jGHntioI+j6sg37kFlfK
 VPFvFrBawBiDIdqEEUSw2HnKKFXk31t66FPb+RMUtXQXW+at7P8lz9kjCXt4GwGo29vH
 ZqGJg1Q8GiDqDC0vIpYKvLWHvse/xhOXP+c9NzJGfQ9wP61/O3H0MGu2q/cYzN9AUgHX
 CoecgCEv9qi79EJvMz2DqG/wfYQXngaBlv/qY0XoRqkl7YdxvY+wES0brd6FwTUk7qWI
 Xs5A==
X-Gm-Message-State: AOAM530JVu55TK3VZUhJIgHlK+G5zKZO0PTmgllwB7wVXe/WZ35RNZiK
 oPWw7BRsNIiI9MtqGzOtqgkdX6PzyFtnr15POS4UI2yVE37kI2acyUWewddNjZEFU9UxpRzoHF5
 qQyGyABR6RCQKP33LTJxuxtBUZ0hICRY=
X-Received: by 2002:a05:6512:3712:: with SMTP id
 z18mr1201013lfr.17.1635386208969; 
 Wed, 27 Oct 2021 18:56:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfe2zMspBR8XTCBSpeENofqWqFfUn9+wCeuEzXWhHQsEl0WhKnDb7a8edFYex4BXuKrv9rjjf+3jTh/jfAw1c=
X-Received: by 2002:a05:6512:3712:: with SMTP id
 z18mr1200981lfr.17.1635386208643; 
 Wed, 27 Oct 2021 18:56:48 -0700 (PDT)
MIME-Version: 1.0
References: <20211009075612.230283-1-leobras@redhat.com>
 <20211009075612.230283-4-leobras@redhat.com>
 <20211011193156.biedorxjetduaf7y@redhat.com>
 <CAJ6HWG5neqLVdO_o+uzykOj3S-N5T0XUHv1_7Qo37_pw0eP_ZQ@mail.gmail.com>
 <87sfx6g55m.fsf@dusky.pond.sub.org>
In-Reply-To: <87sfx6g55m.fsf@dusky.pond.sub.org>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Wed, 27 Oct 2021 22:56:51 -0300
Message-ID: <CAJ6HWG6a5zDR49LQa3iRKLPVWo7toEOgJugsx3oV1c++pT4rhw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] multifd: Implement zerocopy write in multifd
 migration (multifd-zerocopy)
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Markus!
(comments at the bottom)

On Tue, Oct 12, 2021 at 2:54 AM Markus Armbruster <armbru@redhat.com> wrote:
>
> Leonardo Bras Soares Passos <leobras@redhat.com> writes:
>
> > Hello Eric,
> >
> > On Mon, Oct 11, 2021 at 4:32 PM Eric Blake <eblake@redhat.com> wrote:
> >>
> >> On Sat, Oct 09, 2021 at 04:56:13AM -0300, Leonardo Bras wrote:
> >> > Implement zerocopy on nocomp_send_write(), by making use of QIOChannel
> >> > zerocopy interface.
> >> >
> >> > Change multifd_send_sync_main() so it can distinguish the last sync from
> >> > the setup and per-iteration ones, so a flush_zerocopy() can be called
> >> > at the last sync in order to make sure all RAM is sent before finishing
> >> > the migration.
> >> >
> >> > Also make it return -1 if flush_zerocopy() fails, in order to cancel
> >> > the migration process, and avoid resuming the guest in the target host
> >> > without receiving all current RAM.
> >> >
> >> > This will work fine on RAM migration because the RAM pages are not usually freed,
> >> > and there is no problem on changing the pages content between async_send() and
> >> > the actual sending of the buffer, because this change will dirty the page and
> >> > cause it to be re-sent on a next iteration anyway.
> >> >
> >> > Given a lot of locked memory may be needed in order to use multid migration
> >> > with zerocopy enabled, make it optional by creating a new parameter
> >> > multifd-zerocopy on qapi, so low-privileged users can still perform multifd
> >> > migrations.
> >> >
> >> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> >> > ---
> >> >  qapi/migration.json   | 18 ++++++++++++++++++
> >> >  migration/migration.h |  1 +
> >> >  migration/multifd.h   |  2 +-
> >> >  migration/migration.c | 20 ++++++++++++++++++++
> >> >  migration/multifd.c   | 33 ++++++++++++++++++++++++++++-----
> >> >  migration/ram.c       | 20 +++++++++++++-------
> >> >  monitor/hmp-cmds.c    |  4 ++++
> >> >  7 files changed, 85 insertions(+), 13 deletions(-)
> >> >
> >> > diff --git a/qapi/migration.json b/qapi/migration.json
> >> > index 88f07baedd..c4890cbb54 100644
> >> > --- a/qapi/migration.json
> >> > +++ b/qapi/migration.json
> >> > @@ -724,6 +724,11 @@
> >> >  #                      will consume more CPU.
> >> >  #                      Defaults to 1. (Since 5.0)
> >> >  #
> >> > +# @multifd-zerocopy: Controls behavior on sending memory pages on multifd migration.
> >> > +#                    When true, enables a zerocopy mechanism for sending memory
> >> > +#                    pages, if host does support it.
> >>
> >> s/does support/supports/ (several instances this patch)
> >
> > I will make sure to fix that in v5.
> >
> >>
> >> > +#                    Defaults to false. (Since 6.2)
> >> > +#
> >> >  # @block-bitmap-mapping: Maps block nodes and bitmaps on them to
> >> >  #                        aliases for the purpose of dirty bitmap migration.  Such
> >> >  #                        aliases may for example be the corresponding names on the
> >> > @@ -758,6 +763,7 @@
> >> >             'xbzrle-cache-size', 'max-postcopy-bandwidth',
> >> >             'max-cpu-throttle', 'multifd-compression',
> >> >             'multifd-zlib-level' ,'multifd-zstd-level',
> >> > +        'multifd-zerocopy',
> >> >             'block-bitmap-mapping' ] }
> >>
> >> Should this feature be guarded with 'if':'CONFIG_LINUX', since that's
> >> the only platform where you even compile the code (even then, it can
> >> still fail if the kernel doesn't support it).
> >
> > I think it makes sense for the feature to always be available, even
> > though it's not supported
> > outside linux > v4.14.
> >
> > IMHO it makes more sense for the user to get an error when it starts
> > migration, due to host
> > not supporting zerocopy, than the error happening in the config step,
> > which may cause the user
> > to question if it was the right parameter.
> >
> > The config message error here could also be ignored, and users can
> > think zerocopy is working, while it's not.
> >
> > For automated migrations, this feature should never be enabled  for
> > non-linux / older linux hosts anyway.
> >
> > Is there a good argument I am missing for this feature being disabled
> > on non-linux?
>
> The general argument for having QAPI schema 'if' mirror the C
> implementation's #if is introspection.  Let me explain why that matters.
>
> Consider a management application that supports a range of QEMU
> versions, say 5.0 to 6.2.  Say it wants to use an QMP command that is
> new in QEMU 6.2.  The sane way to do that is to probe for the command
> with query-qmp-schema.  Same for command arguments, and anything else
> QMP.
>
> If you doubt "sane", check out Part II of "QEMU interface introspection:
> From hacks to solutions"[*].
>
> The same technique works when a QMP command / argument / whatever is
> compile-time conditional ('if' in the schema).  The code the management
> application needs anyway to deal with older QEMU now also deals with
> "compiled out".  Nice.
>
> Of course, a command or argument present in QEMU can still fail, and the
> management application still needs to handle failure.  Distinguishing
> different failure modes can be bothersome and/or fragile.
>
> By making the QAPI schema conditional mirror the C conditional, you
> squash the failure mode "this version of QEMU supports it, but this
> build of QEMU does not" into "this version of QEMU does not support
> it".  Makes sense, doesn't it?
>
> A minor additional advantage is less generated code.
>
>
>
> [*] http://events17.linuxfoundation.org/sites/events/files/slides/armbru-qemu-introspection.pdf
>

This was very informative, thanks!
I now understand the rationale about this choice.

TBH I am not very used to this syntax.
I did a take a peek at some other json files, and ended adding this
lines in code, which compiled just fine:

for : enum MigrationParameter
{'name': 'multifd-zerocopy', 'if' : 'CONFIG_LINUX'},

for : struct MigrateSetParameters and struct MigrationParameters:
'*multifd-zerocopy': { 'type': 'bool', 'if': 'CONFIG_LINUX' },

Is that enough? Is there any other necessary change?

Thanks for reviewing and for helping out with this!

Best regards,
Leonardo Bras


