Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D17C1D4D86
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Oct 2019 08:23:14 +0200 (CEST)
Received: from localhost ([::1]:59008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJAo5-0003Tm-KU
	for lists+qemu-devel@lfdr.de; Sat, 12 Oct 2019 02:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44956)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iJAnH-00031q-ID
 for qemu-devel@nongnu.org; Sat, 12 Oct 2019 02:22:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iJAnF-0003f5-RZ
 for qemu-devel@nongnu.org; Sat, 12 Oct 2019 02:22:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49440)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iJAnF-0003et-Ji
 for qemu-devel@nongnu.org; Sat, 12 Oct 2019 02:22:21 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A5C30368DA
 for <qemu-devel@nongnu.org>; Sat, 12 Oct 2019 06:22:19 +0000 (UTC)
Received: by mail-wr1-f72.google.com with SMTP id v18so5424759wro.16
 for <qemu-devel@nongnu.org>; Fri, 11 Oct 2019 23:22:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b+tIUaOFihmgy8P3au3FkjEKukkfUz93acJqgbshJus=;
 b=QnTVKVBYVbmL4RaUXNMFZOZ4ulIia7Ax0vglGStxZ9j9GxAF+8iz0zwRuYQRyb3fwv
 AInPapibs6g171Q6vF23aFYva8kwMzBveFIB86lWWV6BLGgIcBzAoDONnvNNMI75DK0N
 ByHB2AZ9NQv49N9f3uVqEIMVx8+1xqOdAfrfYBSGixdCjslqLRglVZWPlkJbE+gHeJ5N
 pxtz4aYvE/Mk11mHG3e8vJY8SsCFADpDGlkQWwbxNxSRHYd69nFiZ83T1khkpO9DHZzP
 sqM2vNsRewKYelI9pfrnMxwLPn4hz/MH3VxoeIxX5Efyl4cvyJe5nHbD1tb9+tSdCv1/
 jL2Q==
X-Gm-Message-State: APjAAAWCI+uDpYknrxEWJfJ9l4hYfihzwDapAYrSqOglZQyvESQneSvW
 JVC0yG9eDS9wx6rHhkjNUdiLGw8slm8EtAXha8+Jyfj8snP4DvTJOy672mP2o9SlQEtcHHAS0i2
 i66A2986r8Y1dHB4=
X-Received: by 2002:adf:f68f:: with SMTP id v15mr15754451wrp.234.1570861338229; 
 Fri, 11 Oct 2019 23:22:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyDq1BOQlpAmyEGyhgJo/0ebYiUFkjLKTWub1kf5LA0+OAHmPypmYlKoUcjbYHBnoUNeBEbpA==
X-Received: by 2002:adf:f68f:: with SMTP id v15mr15754431wrp.234.1570861337883; 
 Fri, 11 Oct 2019 23:22:17 -0700 (PDT)
Received: from [192.168.1.35] (46.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.46])
 by smtp.gmail.com with ESMTPSA id z125sm13820817wme.37.2019.10.11.23.22.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Oct 2019 23:22:16 -0700 (PDT)
Subject: Re: [RFC v5 034/126] MIPS Machines: introduce ERRP_AUTO_PROPAGATE
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20191011160552.22907-1-vsementsov@virtuozzo.com>
 <20191011160552.22907-35-vsementsov@virtuozzo.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0b59dbdc-a0b2-37a9-694c-ab3c034f70d5@redhat.com>
Date: Sat, 12 Oct 2019 08:22:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191011160552.22907-35-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paul Burton <pburton@wavecomp.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Greg Kurz <groug@kaod.org>,
 armbru@redhat.com, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Vladimir,

On 10/11/19 6:04 PM, Vladimir Sementsov-Ogievskiy wrote:
> If we want to add some info to errp (by error_prepend() or
> error_append_hint()), we must use the ERRP_AUTO_PROPAGATE macro.
> Otherwise, this info will not be added when errp =3D=3D &fatal_err
> (the program will exit prior to the error_append_hint() or
> error_prepend() call).  Fix such cases.
>=20
> If we want to check error after errp-function call, we need to
> introduce local_err and than propagate it to errp. Instead, use
> ERRP_AUTO_PROPAGATE macro, benefits are:
> 1. No need of explicit error_propagate call
> 2. No need of explicit local_err variable: use errp directly
> 3. ERRP_AUTO_PROPAGATE leaves errp as is if it's not NULL or
>     &error_fatel, this means that we don't break error_abort
>     (we'll abort on error_set, not on error_propagate)
>=20
> This commit (together with its neighbors) was generated by
>=20
> for f in $(git grep -l errp \*.[ch]); do \
>      spatch --sp-file scripts/coccinelle/auto-propagated-errp.cocci \
>      --macro-file scripts/cocci-macro-file.h --in-place --no-show-diff =
$f; \
> done;
>=20
> then fix a bit of compilation problems: coccinelle for some reason
> leaves several
> f() {
>      ...
>      goto out;
>      ...
>      out:
> }
> patterns, with "out:" at function end.
>=20
> then
> ./python/commit-per-subsystem.py MAINTAINERS "$(< auto-msg)"
>=20
> (auto-msg was a file with this commit message)
>=20
> Still, for backporting it may be more comfortable to use only the first
> command and then do one huge commit.
>=20
> Reported-by: Kevin Wolf <kwolf@redhat.com>
> Reported-by: Greg Kurz <groug@kaod.org>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   hw/core/loader-fit.c | 2 ++
>   1 file changed, 2 insertions(+)
>=20
> diff --git a/hw/core/loader-fit.c b/hw/core/loader-fit.c
> index 3ee9fb2f2e..84f35a1fe2 100644
> --- a/hw/core/loader-fit.c
> +++ b/hw/core/loader-fit.c
> @@ -120,6 +120,7 @@ static int fit_load_kernel(const struct fit_loader =
*ldr, const void *itb,
>                              int cfg, void *opaque, hwaddr *pend,
>                              Error **errp)
>   {
> +    ERRP_AUTO_PROPAGATE();

This certainly looks odd and took me some time to figure it out.

Per include/qapi/error.h:

/*
  * ERRP_AUTO_PROPAGATE
  *
  * This macro is created to be the first line of a function with Error=20
*errp
  * OUT parameter. It's needed only in cases where we want to use=20
rror_prepend,
  * error_append_hint or dereference *errp. It's still safe (but useless)=
 in
  * other cases.

This function indeed uses error_prepend():

     load_data =3D data =3D fit_load_image_alloc(itb, name, &img_off, &sz=
,=20
errp);
     if (!data) {
         error_prepend(errp, "unable to load kernel image from FIT: ");
         return -EINVAL;
     }

     err =3D fit_image_addr(itb, img_off, "load", &load_addr, errp);
     if (err) {
         error_prepend(errp, "unable to read kernel load address from=20
FIT: ");
         ret =3D err;
         goto out;
     }

     err =3D fit_image_addr(itb, img_off, "entry", &entry_addr, errp);
     if (err) {
         error_prepend(errp, "unable to read kernel entry address from=20
FIT: ");
         ret =3D err;
         goto out;
     }

Generating the patch with more lines context would have help a bit.

Can you add a line about error_prepend() in the commit description?

>       const char *name;
>       const void *data;
>       const void *load_data;
> @@ -178,6 +179,7 @@ static int fit_load_fdt(const struct fit_loader *ld=
r, const void *itb,
>                           int cfg, void *opaque, const void *match_data=
,
>                           hwaddr kernel_end, Error **errp)
>   {
> +    ERRP_AUTO_PROPAGATE();
>       const char *name;
>       const void *data;
>       const void *load_data;
>=20

Ditto:

     load_data =3D data =3D fit_load_image_alloc(itb, name, &img_off, &sz=
,=20
errp);
     if (!data) {
         error_prepend(errp, "unable to load FDT image from FIT: ");
         return -EINVAL;
     }

     err =3D fit_image_addr(itb, img_off, "load", &load_addr, errp);
     if (err =3D=3D -ENOENT) {
         load_addr =3D ROUND_UP(kernel_end, 64 * KiB) + (10 * MiB);
         error_free(*errp);
     } else if (err) {
         error_prepend(errp, "unable to read FDT load address from FIT: "=
);
         ret =3D err;
         goto out;
     }

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

