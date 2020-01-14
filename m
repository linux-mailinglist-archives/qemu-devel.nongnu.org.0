Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B01013B1B2
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 19:09:23 +0100 (CET)
Received: from localhost ([::1]:44362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irQd0-0006CR-80
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 13:09:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49986)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1irQbp-0005EM-Lr
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 13:08:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1irQbo-0000mB-A1
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 13:08:09 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:42737)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1irQbo-0000kP-1q
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 13:08:08 -0500
Received: by mail-wr1-x442.google.com with SMTP id q6so13095878wro.9
 for <qemu-devel@nongnu.org>; Tue, 14 Jan 2020 10:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=bfQXa+F+G5W4YkDVvqCaAu1rsWwqwH3QYGcrhX4a7CI=;
 b=v7WN3UDNMvsm697plR5QCt/zVRD1skO5t2d9cEuJQ99DIHROosnAUgy6ffHilau2KR
 Jpi3bh6EGEu/VlpcXWVKxAhUcyli7+Jyefh2DxjbUbsP53QVM8galBTZecKTIaCPU2yK
 ffNJDoMMMgHJrx9BWkK+MSeOJDkViP4EayjL8s7wdTTT6AVGdba1ezSdWd5wCdM1hUMW
 MGu95ugpokHG/mjKzQZZIbqcW9i3PxB6alBGCg8X3bx2eyBt1mnm2Ov/ZlMSc3f9rgvJ
 NE5l4ZUNvDKJ3KGv/aNYoLbvV35yKu4JWsFOrKtgeVNjh3BPj+hqRRhpaIIkhNi25LMg
 4ZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=bfQXa+F+G5W4YkDVvqCaAu1rsWwqwH3QYGcrhX4a7CI=;
 b=glhs164I5loOzuB10ZUZo15zVbP6L2aWKjpIcdmX48W4bIVH+9Cij9+0/OcCIb03sJ
 ahHDd7naqu49PqXxMVSfXis4MZyjqevCiQ5OFW+nwXlK0xu7Bbcwc0mLlNX/5nUrxx8u
 fgkCfEPW0tq3IQZg9Dkhz3smZsbLOTeI2tVMOGenzXzi2/CKr0XAjfqswIjpr0pA/H6V
 uSVHmBK5pnKeMMeeRAh/6p8VDx+ZKWCwRpj4hRV0z8Kcs52NrbhwYBdpXVlOtEpK+9dh
 IAKETPkMRg32oS56GteGmVWZJ+M/IHPa9gkAospg3prmPk2Jjv1U1jLTUDCXegApgA0V
 ViNA==
X-Gm-Message-State: APjAAAXgOWsdBOwhrQZghIY8JusaaYc3jypfDbgNiOeATMskrYdwrkra
 QipHznRvCmgS22LNnTXlAPznnQ==
X-Google-Smtp-Source: APXvYqx0/MmILonmGoP2ovBYi4abT6edY7Meji9+1GH8ff9j4rLyqZqWckYv4ZEitcoMv3Uh0LD2qQ==
X-Received: by 2002:a5d:608a:: with SMTP id w10mr25007698wrt.136.1579025286599; 
 Tue, 14 Jan 2020 10:08:06 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t5sm20407418wrr.35.2020.01.14.10.08.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2020 10:08:05 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C615F1FF87;
 Tue, 14 Jan 2020 18:08:04 +0000 (GMT)
References: <20200114145437.28382-1-berto@igalia.com>
User-agent: mu4e 1.3.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alberto Garcia <berto@igalia.com>
Subject: Re: [PATCH] qcow2: Use a GString in report_unsupported_feature()
In-reply-to: <20200114145437.28382-1-berto@igalia.com>
Date: Tue, 14 Jan 2020 18:08:04 +0000
Message-ID: <87blr5nc6z.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alberto Garcia <berto@igalia.com> writes:

> This is a bit more efficient than having to allocate and free memory
> for each item.
>
> The default size (60) is enough for all the existing incompatible
> features.
>
> Suggested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: Alberto Garcia <berto@igalia.com>
> ---
>  block/qcow2.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/block/qcow2.c b/block/qcow2.c
> index cef9d72b3a..ecf6827420 100644
> --- a/block/qcow2.c
> +++ b/block/qcow2.c
> @@ -453,16 +453,15 @@ static void cleanup_unknown_header_ext(BlockDriverS=
tate *bs)
>  static void report_unsupported_feature(Error **errp, Qcow2Feature *table,
>                                         uint64_t mask)
>  {
> -    char *features =3D g_strdup("");
> -    char *old;
> +    GString *features =3D g_string_sized_new(60);

       g_autoptr(GString) features =3D g_string_sized_new(60);

will save you the clean-up later.

>=20=20
>      while (table && table->name[0] !=3D '\0') {
>          if (table->type =3D=3D QCOW2_FEAT_TYPE_INCOMPATIBLE) {
>              if (mask & (1ULL << table->bit)) {
> -                old =3D features;
> -                features =3D g_strdup_printf("%s%s%.46s", old, *old ? ",=
 " : "",
> -                                           table->name);
> -                g_free(old);
> +                if (features->len > 0) {
> +                    g_string_append(features, ", ");
> +                }
> +                g_string_append_printf(features, "%.46s",
>      table->name);

We have a number of cases of this sort of idiom in the code base. I
wonder if it calls for a utility function:

       qemu_append_with_sep(features, ", ", "%.46s", table->name)

Anyway not mandatory for this patch so with the autoptr fix:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

>                  mask &=3D ~(1ULL << table->bit);
>              }
>          }
> @@ -470,14 +469,15 @@ static void report_unsupported_feature(Error **errp=
, Qcow2Feature *table,
>      }
>=20=20
>      if (mask) {
> -        old =3D features;
> -        features =3D g_strdup_printf("%s%sUnknown incompatible feature: =
%" PRIx64,
> -                                   old, *old ? ", " : "", mask);
> -        g_free(old);
> +        if (features->len > 0) {
> +            g_string_append(features, ", ");
> +        }
> +        g_string_append_printf(features,
> +                               "Unknown incompatible feature: %" PRIx64,=
 mask);
>      }
>=20=20
> -    error_setg(errp, "Unsupported qcow2 feature(s): %s", features);
> -    g_free(features);
> +    error_setg(errp, "Unsupported qcow2 feature(s): %s", features->str);
> +    g_string_free(features, TRUE);
>  }
>=20=20
>  /*


--=20
Alex Benn=C3=A9e

