Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3642A6791CC
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 08:20:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKDbe-0001xB-01; Tue, 24 Jan 2023 02:20:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pKDbc-0001wy-6Y
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 02:20:32 -0500
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pKDba-0003yr-7J
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 02:20:31 -0500
Received: by mail-lf1-x134.google.com with SMTP id w11so18282918lfu.11
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 23:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n0TCONyJgMXo1OB/OgmyJ/2qX5G5J18JdPkcug6nOIo=;
 b=neVYHxrWqBub/vViJC23/wNUPL7UnDcP9PPGENKvjAJeFA4mhmdQ6jHwwh+68gJT37
 0wX3dMFwv14atS2Fy8S3yJu9VKZ5jWue/Hx+wEiJcr1YhA49+dS5Ucl0vEz8HcVm3CFU
 W09a1jUM6fEJDBe5R1/RGbOWggcatl/J0FbsNYBKMErFzp6IjFWzbsREWM9Bhr3uPZYp
 qHU3ycKpum8Ek/6LbwtCh5sc6TIZ/JjQAj7dhkTCjGoRa1sEk3Z0DkCv9R007VHn0VMK
 Cwws0cwHkLQdYXOE2cxiCMK8g1aGhpCOwUr/cENG/3Pdf22Y3nv60+FBwVkwkC7tE9v1
 zChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n0TCONyJgMXo1OB/OgmyJ/2qX5G5J18JdPkcug6nOIo=;
 b=7N95mlM6h4xAQiSW8OGh61NJROilOqKDEpakxEozq+S//kFwN99aeGoxeHgq2ksv9H
 /NL4BpwmTa1D02K6ExxYDtkbjwNCc6cF4+KjhZta5+9Q/vwPzZn123V6DAnGo56RUIGb
 dg+V3/yAUv7QZWqtoLjvO3cUW2T8KTJo1Vd4XWf3oWT+FwUYUfHgPmi+6KDH0NblkToG
 dAkIEekRigF7sMVfGQVDqTNdSce+7qWZDZc8sc52pp9AHYdp91NqvYxYkyOmPqZI1jPw
 oUNJbH3y5yUhUcXHxz+WpRYgRLjxt4KMyhfnxTDJKin9SdGe8cIRJtRf+fIEzK7WVLfn
 MXuA==
X-Gm-Message-State: AFqh2kqs3bf3vcmYiiJ9EcI+FB7ICcTaiiNXgkIaUYNtOhcDVU0FOOF7
 YmYWgLv2Zd2z5MP/yg1+3DDwZz0OTWpGfwKMxcg=
X-Google-Smtp-Source: AMrXdXuW1HzEx6o7T0dVaz0Eshm2ngUrcK7DThhRN8w6wXDMzQPihVhcG8/Is2FDmBjyvbVfrK3pGNPN+/BPdrDi4N4=
X-Received: by 2002:a05:6512:3f1b:b0:4c6:5879:2eb1 with SMTP id
 y27-20020a0565123f1b00b004c658792eb1mr1275169lfa.362.1674544827565; Mon, 23
 Jan 2023 23:20:27 -0800 (PST)
MIME-Version: 1.0
References: <20230124034632.1268545-1-anton.kochkov@proton.me>
In-Reply-To: <20230124034632.1268545-1-anton.kochkov@proton.me>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 24 Jan 2023 11:20:16 +0400
Message-ID: <CAJ+F1C+4KPqvT=8sdbBxC5cMLiKFJJkAi3Ra6Qg-gxDaosb62A@mail.gmail.com>
Subject: Re: [PATCH] po/meson: make i18n module optional
To: Anton Kochkov <anton.kochkov@proton.me>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi

On Tue, Jan 24, 2023 at 7:48 AM Anton Kochkov <anton.kochkov@proton.me> wro=
te:
>
> This is necessary for Muon build system compatibility and
> prevents the following error:
>
> meson.build:4:8: error module 'i18n' is unimplemented,
>   If you would like to make your build files portable to muon,
>   use `import('i18n', required: false)`,
>   and then check the .found() method before use.
>   4 |   i18n.gettext(meson.project_name(),
>              ^
> qemu/meson.build:3640:3: error in function subdir()
> 3640 |   subdir('po')
>          ^
>
> Signed-off-by: Anton Kochkov <anton.kochkov@proton.me>
> ---
>  po/meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/po/meson.build b/po/meson.build
> index a863f0575f..f7be95cf5f 100644
> --- a/po/meson.build
> +++ b/po/meson.build
> @@ -1,4 +1,4 @@
> -i18n =3D import('i18n')
> +i18n =3D import('i18n', required: false)

It should probably be "required: get_option('gettext')" instead,...

>
>  if find_program('xgettext', required: get_option('gettext')).found()
>    i18n.gettext(meson.project_name(),

..what if you move the import below here?

Fwiw, the i18n module is not the most complex. It may be a good idea
to try implementing it..

Impressive that muon can handle qemu though! I tried "configure
--meson=3Dmuon" but that didn't go far, how do you test it?

--=20
Marc-Andr=C3=A9 Lureau

