Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E06C493FA1
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 19:07:04 +0100 (CET)
Received: from localhost ([::1]:60974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAFMM-0005ym-UN
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 13:07:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nAFJS-00051h-BH
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 13:04:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nAFJO-0007Gp-07
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 13:04:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642615436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jrWcxllNjBhm5uv+px86ZiR3FuChaxm7AaNrZWRkYuk=;
 b=XIqyo3uuA47XjDG2DLDhTI8ZC9eopTnbSa0x7p3JZIlBRvg2gHlW8TL7wGAf6RGKLmB3uD
 QpVtMagG81GcZZx1B0roltzfPub6bTdedW6zhc+2Q1asZ6LGtYOz1S+KOYq3HvgPMWt2B5
 T7FUlxwYClQvgE98OELZflONyJrbDNM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-201-k39ubjJCPyqZRmJTAsMpeQ-1; Wed, 19 Jan 2022 13:03:43 -0500
X-MC-Unique: k39ubjJCPyqZRmJTAsMpeQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 h21-20020aa7c955000000b0040390b2bfc5so3382103edt.15
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 10:03:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jrWcxllNjBhm5uv+px86ZiR3FuChaxm7AaNrZWRkYuk=;
 b=mD54csMIPxclKZIJTMXTc5CuzycAijhRhuUIPlAylRiL43hS0FS76UR7bG++DWZGym
 W4f28jGoMAKAHkNfiNH5RPtrBm4hX0goCgStkuz1k0SuSzP7C/pR7tpEeK0/2zWArYv2
 BOOO9x6mBwX6HlvvoEsra6vvQLeWlp58cm+LO6Z0wSWOpNNhjTX9OLbYD7n4ZVNBEmbn
 hPv3TirukRmHnPYnZirgBRFdIjRBFqt0AVflBXjbqxAbpWtvd+0BlqDTgQW5MPYrjNuG
 C5w3Q6O7gFlaQJjrvivdbXGHDwJOBD+SlDS4q7PtDlQ69sJUK5I/3AjPRKW6QF3qLOE/
 0CYQ==
X-Gm-Message-State: AOAM533NTMX6xmWnebl9dB4R6mae52tEmlrFIIZaZQz6ZAKhnlFprdV3
 ++8i8pL9X1tg/1WHo9dKsfF5X78ZxhENJRU8Azcx/GyeSGpTJDxCQtQTRh/Umm8ZiUVpEZworkR
 WbQLg5l6sfPDaWToRW5g7dkNglvCyI0I=
X-Received: by 2002:a05:651c:b28:: with SMTP id
 b40mr13415668ljr.434.1642615421684; 
 Wed, 19 Jan 2022 10:03:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZ6p+8FS7CWKZozo061k8ZPrCRAcw7CjMJt80cBHCzuqiz5ADo+Mr0luCjNYUn3fzQ0NMKnCxVNkGYgNCS6E0=
X-Received: by 2002:a05:651c:b28:: with SMTP id
 b40mr13415635ljr.434.1642615421394; 
 Wed, 19 Jan 2022 10:03:41 -0800 (PST)
MIME-Version: 1.0
References: <20220106221341.8779-1-leobras@redhat.com>
 <20220106221341.8779-4-leobras@redhat.com>
 <YeAkpTE0gqf1dj4C@redhat.com>
In-Reply-To: <YeAkpTE0gqf1dj4C@redhat.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Wed, 19 Jan 2022 15:03:29 -0300
Message-ID: <CAJ6HWG4GQV1N_=18TPqQygKCz36+VBx=b4EtUoZpMvcOQ6v0Vg@mail.gmail.com>
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

Hello Daniel,

On Thu, Jan 13, 2022 at 10:10 AM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
>
> On Thu, Jan 06, 2022 at 07:13:40PM -0300, Leonardo Bras wrote:
> > Add property that allows zero-copy migration of memory pages,
> > and also includes a helper function migrate_use_zero_copy() to check
> > if it's enabled.
> >
> > No code is introduced to actually do the migration, but it allow
> > future implementations to enable/disable this feature.
> >
> > On non-Linux builds this parameter is compiled-out.
> >
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > ---
> >  qapi/migration.json   | 24 ++++++++++++++++++++++++
> >  migration/migration.h |  5 +++++
> >  migration/migration.c | 32 ++++++++++++++++++++++++++++++++
> >  migration/socket.c    |  5 +++++
> >  monitor/hmp-cmds.c    |  6 ++++++
> >  5 files changed, 72 insertions(+)
>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Thanks!

>
> >
> > diff --git a/qapi/migration.json b/qapi/migration.json
> > index bbfd48cf0b..2e62ea6ebd 100644
> > --- a/qapi/migration.json
> > +++ b/qapi/migration.json
> > @@ -730,6 +730,13 @@
> >  #                      will consume more CPU.
> >  #                      Defaults to 1. (Since 5.0)
> >  #
> > +# @zero-copy: Controls behavior on sending memory pages on migration.
> > +#             When true, enables a zero-copy mechanism for sending mem=
ory
> > +#             pages, if host supports it.
> > +#             Requires that QEMU be permitted to use locked memory for=
 guest
> > +#             RAM pages.
> > +#             Defaults to false. (Since 7.0)
> > +#
> >  # @block-bitmap-mapping: Maps block nodes and bitmaps on them to
> >  #                        aliases for the purpose of dirty bitmap migra=
tion.  Such
> >  #                        aliases may for example be the corresponding =
names on the
> > @@ -769,6 +776,7 @@
> >             'xbzrle-cache-size', 'max-postcopy-bandwidth',
> >             'max-cpu-throttle', 'multifd-compression',
> >             'multifd-zlib-level' ,'multifd-zstd-level',
> > +           { 'name': 'zero-copy', 'if' : 'CONFIG_LINUX'},
> >             'block-bitmap-mapping' ] }
> >
> >  ##
> > @@ -895,6 +903,13 @@
> >  #                      will consume more CPU.
> >  #                      Defaults to 1. (Since 5.0)
> >  #
> > +# @zero-copy: Controls behavior on sending memory pages on migration.
> > +#             When true, enables a zero-copy mechanism for sending mem=
ory
> > +#             pages, if host supports it.
> > +#             Requires that QEMU be permitted to use locked memory for=
 guest
> > +#             RAM pages.
> > +#             Defaults to false. (Since 7.0)
> > +#
> >  # @block-bitmap-mapping: Maps block nodes and bitmaps on them to
> >  #                        aliases for the purpose of dirty bitmap migra=
tion.  Such
> >  #                        aliases may for example be the corresponding =
names on the
> > @@ -949,6 +964,7 @@
> >              '*multifd-compression': 'MultiFDCompression',
> >              '*multifd-zlib-level': 'uint8',
> >              '*multifd-zstd-level': 'uint8',
> > +            '*zero-copy': { 'type': 'bool', 'if': 'CONFIG_LINUX' },
> >              '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } =
}
>
> The current zerocopy impl is for the send path.
>
> Do you expect we might get zerocopy in the receive path
> later ?

It's possible, but I haven't started the implementation yet.

>
> If so then either call this 'send-zero-copy', or change it
> from a bool to an enum taking '["send", "recv", "both"]'.
>
> I'd probably take the former and just rename it.
>

Well, my rationale:
- I want to set zero copy sending:
zero-copy is set in the sending host, start migration.

- I want to set zero copy receiving:
zero-copy is set in the receiving host, wait for migration.
(Of course host support is checked when setting the parameter).

The problem with the current approach is trying to enable zero-copy on
receive before it's implemented, which will 'fail' silently .
A possible solution would be to add a patch to check in the receiving
path if zero-copy is enabled, and fail for now.

What do you think?

Best regards,
Leo

>
> Regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>


