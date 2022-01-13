Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E2F48DAAA
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 16:26:50 +0100 (CET)
Received: from localhost ([::1]:40534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8201-0001lD-O5
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 10:26:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n81y1-0000my-Io
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 10:24:45 -0500
Received: from [2a00:1450:4864:20::32d] (port=52747
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n81xw-0007Rv-4q
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 10:24:43 -0500
Received: by mail-wm1-x32d.google.com with SMTP id v123so4128045wme.2
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 07:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=m670muHTyTe4gL5bLaUiWvIx2626hBG/pkpJcqQMJ1g=;
 b=t+Cax+NGupYsQpIk3cqbVcVfSikOEYFM0YJlhjkcFI3O/e30cvLUQFhXpjDA547khI
 egtB+ZHBCLnkKMhwqexwgh+ptOgVUWsakrdV06gddgZcxyfXaOSsff2SR52PyCb6xARK
 Kjph7fcOzuwdg5bvUjubN4ks+2/ZeLv5plJ4FZssQ/Ono2ZJL70oCtIl701RwnnSOdxo
 X0xu/6heBqN+/P9hJpj0IR4y2U+Y/67K/YTnUGX5YI6pW8OcR2nkjO72bt9lzY7yQl3e
 DJdZr4R1HLsxbRot1kcT4jR3bPHSIy1BXEsa2cgt+kfodahX25uQkSgIeRTAiBYQcM0o
 P0lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=m670muHTyTe4gL5bLaUiWvIx2626hBG/pkpJcqQMJ1g=;
 b=a5JKGtTI680mSeHO416d/2qUGSsYCHWaSM0cdqYu5Q7iT9k6+R7dFqY3EURHfjHMwS
 hnEyYExUm/jdK03fmgll8xeF5Dmw82dSEAW/qxnMCGPinBzNcXxomnUMj1DS8JHXGfyx
 FOtaTN9mpCaf86pW9NXEzEq4imxr2MAerGum7NAN0vyZIC5EVaWzDwZts9Iu+GFqAdd8
 sZ/BZ98qRIoMr/9gzBjXxFtRdkNxVCyoMbuska7DuLcvzMmrYPqoTSDg6YEUEGCEvxfL
 5vamgC343E4Aja17j5wrg8+LzOqi2C8eluAwwZyYa4GJpIoa9+3DlgG07Iuxi7d9Dw2P
 udIA==
X-Gm-Message-State: AOAM530KBmHkWI/OeZZ0dkRqeSVZ4bcoiC6+2ShiZfD4X2YoYUW0QmEM
 P5D6gwruAs3Hn1vjpj/FFkyMU4VOaE2R3Qsp8p+/OQ==
X-Google-Smtp-Source: ABdhPJxrTpixqENpdn8MhxzwzY05E3CDBX7M37ZtuTKdJI+XApGWH0nKvBinLJQD/RT0mU+WyzzdNGCWotB3bRmsV5c=
X-Received: by 2002:a05:600c:28c8:: with SMTP id
 h8mr11492069wmd.37.1642087478694; 
 Thu, 13 Jan 2022 07:24:38 -0800 (PST)
MIME-Version: 1.0
References: <20211221065855.142578-1-marcandre.lureau@redhat.com>
 <20211221065855.142578-22-marcandre.lureau@redhat.com>
In-Reply-To: <20211221065855.142578-22-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jan 2022 15:24:27 +0000
Message-ID: <CAFEAcA-sidR3uDDFw4dPk+LChWqGcaMzPMgruVjyMCoUZMt0Lg@mail.gmail.com>
Subject: Re: [PULL v2 21/36] backends: move dbus-vmstate1.xml to backends/
To: marcandre.lureau@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, richard.henderson@linaro.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 21 Dec 2021 at 07:04, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Although not used by the backend itself, use a common location for
> documentation and sharing purposes.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  {tests/qtest =3D> backends}/dbus-vmstate1.xml | 0
>  tests/qtest/meson.build                     | 2 +-
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename {tests/qtest =3D> backends}/dbus-vmstate1.xml (100%)
>
> diff --git a/tests/qtest/dbus-vmstate1.xml b/backends/dbus-vmstate1.xml
> similarity index 100%
> rename from tests/qtest/dbus-vmstate1.xml
> rename to backends/dbus-vmstate1.xml
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index ebeac59b3f95..913e987409d5 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -98,7 +98,7 @@ if dbus_daemon.found() and config_host.has_key('GDBUS_C=
ODEGEN')
>    #qtests_i386 +=3D ['dbus-vmstate-test']
>    dbus_vmstate1 =3D custom_target('dbus-vmstate description',
>                                  output: ['dbus-vmstate1.h', 'dbus-vmstat=
e1.c'],
> -                                input: files('dbus-vmstate1.xml'),
> +                                input: meson.source_root() / 'backends/d=
bus-vmstate1.xml',
>                                  command: [config_host['GDBUS_CODEGEN'],
>                                            '@INPUT@',
>                                            '--interface-prefix', 'org.qem=
u',

This use of meson.source_root() makes meson complain:

WARNING: Project targeting '>=3D0.58.2' but tried to use feature
deprecated since '0.56.0': meson.source_root. use
meson.project_source_root() or meson.global_source_root() instead.
[...]
WARNING: Deprecated features used:
 * 0.56.0: {'meson.source_root'}

I'm not sure which of the two suggested replacements is correct here,
but could you find out and send a patch, please ?

thanks
-- PMM

