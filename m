Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB68477424
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 15:14:40 +0100 (CET)
Received: from localhost ([::1]:48730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxrWq-00018e-0Q
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 09:14:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mxrUr-0006mw-0Y
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 09:12:37 -0500
Received: from [2a00:1450:4864:20::42c] (port=38753
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mxrUn-0005i0-TG
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 09:12:36 -0500
Received: by mail-wr1-x42c.google.com with SMTP id e5so11028490wrc.5
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 06:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=DDiHgmiHlFcsJeWS3ktXfc20eUoDx/KAyreNGT/U+J8=;
 b=H5hV9efM38c2MXmAjKQHvXbCqWFwEMW6EwduuSY7NmEprA/9rcnyQso/8gxJdjDpt7
 G49m4Fl4e9J5LpUdbpNAuiBoxI+zY+SN/3ArFpdBxW1B2PLaFq9phZwqMM2OH488YX33
 vXb7ErSZ49BTPP+GgR90hL2UGoQjxXh5IbOWg5IGQvccIeM2Hq3iRZ7ou2N24PflfTKo
 U9yypl87w2GFLxPkjyurZ9FZM+wvpcXS7yG+ypzFgIWFsvrji09R0U+Wb5df1k9anw51
 Erzh1XZH1JtMqUoN/sPEsFltNq4jXQLrgW+u4DSMlLZ/TAXZN8Ga2ANoUCkAXF7EuaEq
 SOTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=DDiHgmiHlFcsJeWS3ktXfc20eUoDx/KAyreNGT/U+J8=;
 b=sw6aAbd0eJDS+ZZyYQ5a/74uDVBr0UbKU5VdQ5MJVgNK8XV+Lt0go4i8pYTyrcxr+c
 /8R9c3Bl8SMuA835O/8JrVgScgNesXOEIg6qAdFiuMeNSJsQaXhp0tXNtexD2LccUtYW
 MSVT1MB4YLloTwhFPus4RODVWMH2pb5dt0ikavGkDTyDNsLOrqVdNb6YI1OOcrE/rK95
 GPqcUHUUCK9shEqbe/Vy0pKRP+pzooZE3p0khVUjjtUrObxx6NjBW789fanWCyeKv4pc
 ySUdaXbJchzjzhHdU12thl5lU5aKO+rCaCnRb4ybWmKT7vYN/KXnii5PdM23V54TiJJh
 Whbw==
X-Gm-Message-State: AOAM532juywvMOiUNAvJWOoLPwSM10BcILbkUzGiLiysdefHu5ZtLoDf
 bpLg7zyXmiXFS3GM9uieFhdozg==
X-Google-Smtp-Source: ABdhPJzPAXCkiF0P5TcpeSfMJogKoeDFqmysCt8tZW5wxqJjBaEiSoy64hqsiuNDYFzrlWz0yTQjYw==
X-Received: by 2002:a5d:404a:: with SMTP id w10mr1129658wrp.573.1639663951713; 
 Thu, 16 Dec 2021 06:12:31 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r8sm1525063wru.107.2021.12.16.06.12.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 06:12:29 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1F6EE1FF96;
 Thu, 16 Dec 2021 14:12:29 +0000 (GMT)
References: <20210903174510.751630-1-philmd@redhat.com>
 <20210903174510.751630-3-philmd@redhat.com>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v3 02/28] glib-compat: Introduce g_memdup2() wrapper
Date: Thu, 16 Dec 2021 14:11:37 +0000
In-reply-to: <20210903174510.751630-3-philmd@redhat.com>
Message-ID: <875yrofxki.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, "Michael S.
 Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, "Daniel P
 . Berrange" <berrange@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> When experimenting raising GLIB_VERSION_MIN_REQUIRED to 2.68
> (Fedora 34 provides GLib 2.68.1) we get:
>
>   hw/virtio/virtio-crypto.c:245:24: error: 'g_memdup' is deprecated: Use =
'g_memdup2' instead [-Werror,-Wdeprecated-declarations]
>   ...
>
> g_memdup() has been updated by g_memdup2() to fix eventual security
> issues (size argument is 32-bit and could be truncated / wrapping).
> GLib recommends to copy their static inline version of g_memdup2():
> https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2=
-now/5538
>
> Our glib-compat.h provides a comment explaining how to deal with
> these deprecated declarations (see commit e71e8cc0355
> "glib: enforce the minimum required version and warn about old APIs").
>
> Following this comment suggestion, implement the g_memdup2_qemu()
> wrapper to g_memdup2(), and use the safer equivalent inlined when
> we are using pre-2.68 GLib.
>
> Reported-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  include/glib-compat.h | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>
> diff --git a/include/glib-compat.h b/include/glib-compat.h
> index 9e95c888f54..8d01a8c01fb 100644
> --- a/include/glib-compat.h
> +++ b/include/glib-compat.h
> @@ -68,6 +68,43 @@
>   * without generating warnings.
>   */
>=20=20
> +/*
> + * g_memdup2_qemu:
> + * @mem: (nullable): the memory to copy.
> + * @byte_size: the number of bytes to copy.
> + *
> + * Allocates @byte_size bytes of memory, and copies @byte_size bytes int=
o it
> + * from @mem. If @mem is %NULL it returns %NULL.
> + *
> + * This replaces g_memdup(), which was prone to integer overflows when
> + * converting the argument from a #gsize to a #guint.
> + *
> + * This static inline version is a backport of the new public API from
> + * GLib 2.68, kept internal to GLib for backport to older stable release=
s.
> + * See https://gitlab.gnome.org/GNOME/glib/-/issues/2319.
> + *
> + * Returns: (nullable): a pointer to the newly-allocated copy of the mem=
ory,
> + *          or %NULL if @mem is %NULL.
> + */
> +static inline gpointer g_memdup2_qemu(gconstpointer mem, gsize byte_size)
> +{
> +#if GLIB_CHECK_VERSION(2, 68, 0)
> +    return g_memdup2(mem, byte_size);
> +#else
> +    gpointer new_mem;
> +
> +    if (mem && byte_size !=3D 0) {
> +        new_mem =3D g_malloc(byte_size);
> +        memcpy(new_mem, mem, byte_size);
> +    } else {
> +        new_mem =3D NULL;
> +    }
> +
> +    return new_mem;
> +#endif
> +}
> +#define g_memdup2(m, s) g_memdup2_qemu(m, s)
> +

As per our style wouldn't it make sense to just call it qemu_memdup(m,
s)?

--=20
Alex Benn=C3=A9e

