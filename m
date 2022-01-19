Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A29494046
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 20:04:15 +0100 (CET)
Received: from localhost ([::1]:40130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAGFh-00018l-Nh
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 14:04:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nAFyR-0002CT-8d
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 13:46:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nAFyN-0005Lo-VB
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 13:46:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642617978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kL+oyr1KQgSHI5nilNMFyqi/QpH/BwbJ0YjA5sIoA9k=;
 b=VfWHtKsB1O2jaeJGE5QKZ/LADESxjCAPcRi5PyZ6d4OGk1WgLU9sT8/Gh5L1Vtexf+nn4o
 Zlf3aAZVCbUl3x3L1tfLXi3E+n4ZyBspWl1wTEi0BdQCYO+A+qJuQWyfAi3vPTEkjnfanr
 eq84A8OjdpVAwNCdE737lccdskzDhno=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-497-UrjE3ZiaPTOvpnbXqyb83Q-1; Wed, 19 Jan 2022 13:46:17 -0500
X-MC-Unique: UrjE3ZiaPTOvpnbXqyb83Q-1
Received: by mail-lf1-f71.google.com with SMTP id
 q14-20020ac2514e000000b0042d99ba0e3eso1970602lfd.20
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 10:46:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kL+oyr1KQgSHI5nilNMFyqi/QpH/BwbJ0YjA5sIoA9k=;
 b=ytgp27aXnnMoZZDVscf8NsnQe1huHmBO01GY1yZPUsoV79GcQFwjOH1pSNB0+zaWEW
 E71ykblYb1s/NL4+dExxalV2aD+y1xRx2Cdtu623pEUHmxb/W9WNIpueKPEjMvpiNBf/
 /WUI/nvGzzXehJD029tt51+JzYEhtwv9jfbAYysJiSxsBDI4XFLkxFpFJoJ/E4GIK3rM
 DTdfSIlXJhNeswPE7H3N2c8teZNJwqLcWtacaqOvuHAGA+R+Xfckoibf4a5CeCaLeTQX
 L6r+HQQ/E746fEAvzb5zwQQ0bxzzmDhvOB9aUVv/XEkB9A3VzBtNVzboxUm31Bq7UVNy
 xGKw==
X-Gm-Message-State: AOAM532jFWmnSJIJyyKeunUeRWpFOJhwFLLVbyQ8fUmXg03934NL8JMZ
 48NEG7bH6j4A/kjrKtA3VeAp7ltzwg1PeOJ9G/UE6z4QhohBUlqbZkq9J+gVMiNSH7US7cwg0gD
 wpXHC3PHgErAdS3e3hRVAkt9YIZamvL8=
X-Received: by 2002:a2e:601:: with SMTP id 1mr25218681ljg.442.1642617975619;
 Wed, 19 Jan 2022 10:46:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzMm1jIHRWsKRJ89iyhx19oF94f/eL09ThJzX99NOvwjERY+r5XYFY8EhzcQGX2MlnYsEF7cVFxOvNQ9SR8Who=
X-Received: by 2002:a2e:601:: with SMTP id 1mr25218663ljg.442.1642617975317;
 Wed, 19 Jan 2022 10:46:15 -0800 (PST)
MIME-Version: 1.0
References: <20220106221341.8779-1-leobras@redhat.com>
 <20220106221341.8779-4-leobras@redhat.com>
 <YeAkpTE0gqf1dj4C@redhat.com>
 <CAJ6HWG4GQV1N_=18TPqQygKCz36+VBx=b4EtUoZpMvcOQ6v0Vg@mail.gmail.com>
 <YehVMEL1hPaTbCIE@redhat.com>
In-Reply-To: <YehVMEL1hPaTbCIE@redhat.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Wed, 19 Jan 2022 15:46:04 -0300
Message-ID: <CAJ6HWG6pWzkxmi+o3j9u+O0K=o3rBEKMmfMYQNY0pfKzg-NeqQ@mail.gmail.com>
Subject: Re: [PATCH v7 3/5] migration: Add zero-copy parameter for QMP/HMP for
 Linux
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 19, 2022 at 3:16 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Wed, Jan 19, 2022 at 03:03:29PM -0300, Leonardo Bras Soares Passos wro=
te:
> > Hello Daniel,
> >
> > On Thu, Jan 13, 2022 at 10:10 AM Daniel P. Berrang=C3=A9 <berrange@redh=
at.com> wrote:
> > >
> > > On Thu, Jan 06, 2022 at 07:13:40PM -0300, Leonardo Bras wrote:
> > > > Add property that allows zero-copy migration of memory pages,
> > > > and also includes a helper function migrate_use_zero_copy() to chec=
k
> > > > if it's enabled.
> > > >
> > > > No code is introduced to actually do the migration, but it allow
> > > > future implementations to enable/disable this feature.
> > > >
> > > > On non-Linux builds this parameter is compiled-out.
> > > >
> > > > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > > > ---
> > > >  qapi/migration.json   | 24 ++++++++++++++++++++++++
> > > >  migration/migration.h |  5 +++++
> > > >  migration/migration.c | 32 ++++++++++++++++++++++++++++++++
> > > >  migration/socket.c    |  5 +++++
> > > >  monitor/hmp-cmds.c    |  6 ++++++
> > > >  5 files changed, 72 insertions(+)
> > >
> > > Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> >
> > Thanks!
> >
> > >
> > > >
> > > > diff --git a/qapi/migration.json b/qapi/migration.json
> > > > index bbfd48cf0b..2e62ea6ebd 100644
> > > > --- a/qapi/migration.json
> > > > +++ b/qapi/migration.json
> > > > @@ -730,6 +730,13 @@
> > > >  #                      will consume more CPU.
> > > >  #                      Defaults to 1. (Since 5.0)
> > > >  #
> > > > +# @zero-copy: Controls behavior on sending memory pages on migrati=
on.
> > > > +#             When true, enables a zero-copy mechanism for sending=
 memory
> > > > +#             pages, if host supports it.
> > > > +#             Requires that QEMU be permitted to use locked memory=
 for guest
> > > > +#             RAM pages.
> > > > +#             Defaults to false. (Since 7.0)
> > > > +#
> > > >  # @block-bitmap-mapping: Maps block nodes and bitmaps on them to
> > > >  #                        aliases for the purpose of dirty bitmap m=
igration.  Such
> > > >  #                        aliases may for example be the correspond=
ing names on the
> > > > @@ -769,6 +776,7 @@
> > > >             'xbzrle-cache-size', 'max-postcopy-bandwidth',
> > > >             'max-cpu-throttle', 'multifd-compression',
> > > >             'multifd-zlib-level' ,'multifd-zstd-level',
> > > > +           { 'name': 'zero-copy', 'if' : 'CONFIG_LINUX'},
> > > >             'block-bitmap-mapping' ] }
> > > >
> > > >  ##
> > > > @@ -895,6 +903,13 @@
> > > >  #                      will consume more CPU.
> > > >  #                      Defaults to 1. (Since 5.0)
> > > >  #
> > > > +# @zero-copy: Controls behavior on sending memory pages on migrati=
on.
> > > > +#             When true, enables a zero-copy mechanism for sending=
 memory
> > > > +#             pages, if host supports it.
> > > > +#             Requires that QEMU be permitted to use locked memory=
 for guest
> > > > +#             RAM pages.
> > > > +#             Defaults to false. (Since 7.0)
> > > > +#
> > > >  # @block-bitmap-mapping: Maps block nodes and bitmaps on them to
> > > >  #                        aliases for the purpose of dirty bitmap m=
igration.  Such
> > > >  #                        aliases may for example be the correspond=
ing names on the
> > > > @@ -949,6 +964,7 @@
> > > >              '*multifd-compression': 'MultiFDCompression',
> > > >              '*multifd-zlib-level': 'uint8',
> > > >              '*multifd-zstd-level': 'uint8',
> > > > +            '*zero-copy': { 'type': 'bool', 'if': 'CONFIG_LINUX' }=
,
> > > >              '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' =
] } }
> > >
> > > The current zerocopy impl is for the send path.
> > >
> > > Do you expect we might get zerocopy in the receive path
> > > later ?
> >
> > It's possible, but I haven't started the implementation yet.
> >
> > >
> > > If so then either call this 'send-zero-copy', or change it
> > > from a bool to an enum taking '["send", "recv", "both"]'.
> > >
> > > I'd probably take the former and just rename it.
> > >
> >
> > Well, my rationale:
> > - I want to set zero copy sending:
> > zero-copy is set in the sending host, start migration.
> >
> > - I want to set zero copy receiving:
> > zero-copy is set in the receiving host, wait for migration.
> > (Of course host support is checked when setting the parameter).
> >
> > The problem with the current approach is trying to enable zero-copy on
> > receive before it's implemented, which will 'fail' silently .
> > A possible solution would be to add a patch to check in the receiving
> > path if zero-copy is enabled, and fail for now.
>
> That's not good because mgmt apps cannot query the QAPI schema
> to find out if this feature is supported or not.
>
> If we wantt o support zero copy recv, then we need an explicit
> flag for it that is distinct from zero copy send, so that apps
> can introspect whether the feature is implemneted in QEMU or
> not.
>
> Distinct named bool flags feels better, and also makes it clear
> to anyone not familiar with the impl that the current  code is
> strictly send only.
>

Ok, I see the point.
I will try to refactor the code changing zero-copy to zero-copy-send
or something like that.

Best regards,
Leo


