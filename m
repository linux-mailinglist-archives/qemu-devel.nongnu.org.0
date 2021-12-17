Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E0F478F9C
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 16:28:20 +0100 (CET)
Received: from localhost ([::1]:57636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myF9f-0002jG-4q
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 10:28:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1myEdr-000116-OB
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:55:27 -0500
Received: from [2607:f8b0:4864:20::92c] (port=40623
 helo=mail-ua1-x92c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1myEdp-0000A6-Pr
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:55:27 -0500
Received: by mail-ua1-x92c.google.com with SMTP id y23so4797533uay.7
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 06:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=caQ+GawRU7q4sumBjAscV7/6W3K191EJqTdNQsMSpcM=;
 b=tAOzRWin3vQoUZBFvE275fF44cwoxUbodBcihR6nCxVKkLZTa4SgJRjVkySIKFP5EG
 IOciZjtLZeFgJxYgOgvEfFTLqQEOTAooAqrgxe3Vtw2VswkyNSkrGzWgky/FmueZS0f6
 Dcy2egGGVmdQj3l79ZnXyTi82ub1xS3FZW0GOABQGg6wBntiG0mnObXGn2WW6Kp6PgIS
 FBLWER2t8LEjukKl4QEUoZH30ZnvMJZwm4NJEz2OPvmxCciDCDkTtHOLOnorkDJfe/Ox
 SsElk0lO1INS7BEKnnscmItMsg/zE6+zCVttvM9j9SKZ0HYn7e304FhHSYrrqz0jpJ4P
 FlXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=caQ+GawRU7q4sumBjAscV7/6W3K191EJqTdNQsMSpcM=;
 b=laaNrHl2wE0Qy425+sjnW4LeK6V6Gxehxu7YhPfGd9gfWGiilJHhWG897kJ7K+8QFv
 eKLEpdP9MZST4hlS/0fDecLzz4zZ+YKnDiQaWAw7NO/Q9QMbB/t8YVSBII073Q5+GMQZ
 bBJ9qLuQdngbmSGrPOATdVluLCpYr95pCHUW5gOnZckzOlLt+2RdYWZWXrXxthD1soHa
 WZo4Ur3uoGnQCLw6vecO0xhXqaSegsUcgy72eGzjMP/mYhph6nHLYArZZYG3RjSWDgjt
 nE23G/eTx77ZReSbEx8lmf83aqvmSCumrX7htVjPCc7sOWHu60+Ev/NgtDeis77ba3dY
 +Waw==
X-Gm-Message-State: AOAM532GfAypybGGBXpvKw4/Cw11ex9wA92qRArryHI5Gh5wqJ8mbLGZ
 sfdq5ML1yyGrEN8Binf1fd/9og==
X-Google-Smtp-Source: ABdhPJy+wMLxHcbL50E8MCXn3x6NHJOaxLJdpBVskMblx+EkrkXE1Rk9nKgKD29Qval5I3DCDENWtQ==
X-Received: by 2002:ab0:b88:: with SMTP id c8mr1122747uak.130.1639752923868;
 Fri, 17 Dec 2021 06:55:23 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h7sm1201963vsk.5.2021.12.17.06.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 06:55:22 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1F0B71FF96;
 Fri, 17 Dec 2021 14:55:21 +0000 (GMT)
References: <20210903174510.751630-1-philmd@redhat.com>
 <20210903174510.751630-3-philmd@redhat.com> <875yrofxki.fsf@linaro.org>
 <YbyT7D/UpSGpmC24@redhat.com>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v3 02/28] glib-compat: Introduce g_memdup2() wrapper
Date: Fri, 17 Dec 2021 14:53:05 +0000
In-reply-to: <YbyT7D/UpSGpmC24@redhat.com>
Message-ID: <87ilvne0x2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ua1-x92c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Thu, Dec 16, 2021 at 02:11:37PM +0000, Alex Benn=C3=A9e wrote:
>>=20
>> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>>=20
>> > When experimenting raising GLIB_VERSION_MIN_REQUIRED to 2.68
>> > (Fedora 34 provides GLib 2.68.1) we get:
>> >
>> >   hw/virtio/virtio-crypto.c:245:24: error: 'g_memdup' is deprecated: U=
se 'g_memdup2' instead [-Werror,-Wdeprecated-declarations]
>> >   ...
>> >
>> > g_memdup() has been updated by g_memdup2() to fix eventual security
>> > issues (size argument is 32-bit and could be truncated / wrapping).
>> > GLib recommends to copy their static inline version of g_memdup2():
>> > https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memd=
up2-now/5538
>> >
>> > Our glib-compat.h provides a comment explaining how to deal with
>> > these deprecated declarations (see commit e71e8cc0355
>> > "glib: enforce the minimum required version and warn about old APIs").
>> >
>> > Following this comment suggestion, implement the g_memdup2_qemu()
>> > wrapper to g_memdup2(), and use the safer equivalent inlined when
>> > we are using pre-2.68 GLib.
>> >
>> > Reported-by: Eric Blake <eblake@redhat.com>
>> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> > ---
>> >  include/glib-compat.h | 37 +++++++++++++++++++++++++++++++++++++
>> >  1 file changed, 37 insertions(+)
>> >
>> > diff --git a/include/glib-compat.h b/include/glib-compat.h
>> > index 9e95c888f54..8d01a8c01fb 100644
>> > --- a/include/glib-compat.h
>> > +++ b/include/glib-compat.h
>> > @@ -68,6 +68,43 @@
>> >   * without generating warnings.
>> >   */
>> >=20=20
>> > +/*
>> > + * g_memdup2_qemu:
>> > + * @mem: (nullable): the memory to copy.
>> > + * @byte_size: the number of bytes to copy.
>> > + *
>> > + * Allocates @byte_size bytes of memory, and copies @byte_size bytes =
into it
>> > + * from @mem. If @mem is %NULL it returns %NULL.
>> > + *
>> > + * This replaces g_memdup(), which was prone to integer overflows when
>> > + * converting the argument from a #gsize to a #guint.
>> > + *
>> > + * This static inline version is a backport of the new public API from
>> > + * GLib 2.68, kept internal to GLib for backport to older stable rele=
ases.
>> > + * See https://gitlab.gnome.org/GNOME/glib/-/issues/2319.
>> > + *
>> > + * Returns: (nullable): a pointer to the newly-allocated copy of the =
memory,
>> > + *          or %NULL if @mem is %NULL.
>> > + */
>> > +static inline gpointer g_memdup2_qemu(gconstpointer mem, gsize byte_s=
ize)
>> > +{
>> > +#if GLIB_CHECK_VERSION(2, 68, 0)
>> > +    return g_memdup2(mem, byte_size);
>> > +#else
>> > +    gpointer new_mem;
>> > +
>> > +    if (mem && byte_size !=3D 0) {
>> > +        new_mem =3D g_malloc(byte_size);
>> > +        memcpy(new_mem, mem, byte_size);
>> > +    } else {
>> > +        new_mem =3D NULL;
>> > +    }
>> > +
>> > +    return new_mem;
>> > +#endif
>> > +}
>> > +#define g_memdup2(m, s) g_memdup2_qemu(m, s)
>> > +
>>=20
>> As per our style wouldn't it make sense to just call it qemu_memdup(m,
>> s)?
>
> Not in this case. We use suffix as we don't want people calling this
> directly with the suffix.
>
> In the glibcompat.h header we're attempting to transparently/secretly
> replace/wrap standard glib APIs.  All the callers should remain using
> the plain glib API name, never call the method with the suffix at
> all. This lets us delete the wrapper later and not have to update
> any callers. The suffix is basically just a hack of the impl we use
> for transparent replacement.

Right - at the risk of bike shedding names maybe we should choose a
suffix the better reflects the purpose like _alt or _internal rather
than overloading qemu?

We already document _locked for example.

> A method with a 'qemu_' prefix by constrast is something that callers
> are explicitly expected to call directly.
>
>
> Regards,
> Daniel


--=20
Alex Benn=C3=A9e

