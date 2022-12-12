Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E09B3649A7C
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 09:55:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4eb4-0002ip-Kc; Mon, 12 Dec 2022 03:55:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1p4eaq-0002dI-Ay
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 03:55:25 -0500
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1p4ean-0004BY-Si
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 03:55:23 -0500
Received: by mail-lj1-x22f.google.com with SMTP id y4so2819381ljc.9
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 00:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Aga9fUJwXC3aEOZm7SW/XV/P+VmXTJrtr3e3NwtJNeU=;
 b=VdxRfa28kDljYpB/l0HNP/1TyEujA0Uqw5m/N2B/0TIzKLsEqNS2XUNNg9jiVtcPl5
 7Oru+FkznrkTRLCeRgZTUtYo0gIdk/8Sjc5c4zeHaSIA6TMOQ2ttFbJHoBbPkH7dRlX1
 hSfN/CbLCltEHpXzryYkV1rQtYdlGFrftg5slLtZbuG5BcXgVLCQE7sDGBgOj4WBDN4q
 fnFDi5NhtP+UbJor3PgjyhAvsJ+0Os4k7Tqg0FPhrDAXTkgYgB6T4AFSzqcAdO6ZClM/
 zq9Um4F/t3jtUZ18fGgU35Z8JvIxfZRPUsdvgQZ+jpdgj5aftQ5zItibCUDu8dYAfuB3
 GpwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Aga9fUJwXC3aEOZm7SW/XV/P+VmXTJrtr3e3NwtJNeU=;
 b=cwizYQVrH29WfwzWMXI2tcX1zfwmhploOihbgbkAI3t7Zon1vdOFeBN2SDmIDJk3V2
 fjoqDl9gRDJFW34Bu+ts9tc5b7iNbK+g4SkRFy6dR5qfZFWg6AYuQTfL3/WpjzQ1HE/x
 UWfbH7WgQ0+1tPwMVHdu8Dq5EYCwBzSZhN3Lxt4fYNzXG6zOudHAJcUdHUwDC8TOohvR
 SmhIYa0FxC0D+A1AG1ZK/hxwFa9R5B/O7mWX9bUAPS2iX/t8Z//UGOf7Zf5XE+/MF8qN
 Rtka0Zn31uJprVkx4kycoyvgX4XnZH4KeL7DD31Ovv6hE8YB2SeWRVf8kKB7W8mMGJhT
 G4iA==
X-Gm-Message-State: ANoB5plnF4urw+PQNY4SHDJwhwphXk+jD07GTKgs5Rrz0XY6+Xzm+KcO
 0+tYhjG8VAzkUxt0mkElVJEHwM8QA83yD91/vSE=
X-Google-Smtp-Source: AA0mqf4S/DTe5Jh4d+X31vWW7DSBLA7OmmQSnyigDUikSOZWiuozO6VXDftYvnMFS71TI6k0ExyR8kZqMwPpXL7eADs=
X-Received: by 2002:a05:651c:38a:b0:26e:85d5:7e8 with SMTP id
 e10-20020a05651c038a00b0026e85d507e8mr28902431ljp.449.1670835319990; Mon, 12
 Dec 2022 00:55:19 -0800 (PST)
MIME-Version: 1.0
References: <20221209112409.184703-1-pbonzini@redhat.com>
 <20221209112409.184703-14-pbonzini@redhat.com>
In-Reply-To: <20221209112409.184703-14-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 12 Dec 2022 12:55:07 +0400
Message-ID: <CAJ+F1CLkKUW8DKrp8MNkUQZUBujt3g=6nq-MthxKpD3f4=BaJQ@mail.gmail.com>
Subject: Re: [PATCH 13/30] configure: remove backwards-compatibility code
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22f.google.com
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

On Fri, Dec 9, 2022 at 3:28 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The cmd_line.txt mangling is only needed when rebuilding from very old
> trees and is kept mostly as an example of how to extend it.  However,
> Meson 0.63 introduces a deprecation mechanism for meson_options.txt
> that can be used instead, so get rid of our home-grown hack.

For the curious
https://mesonbuild.com/Release-notes-for-0-63-0.html#deprecate-an-option-an=
d-replace-it-with-a-new-one

>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  configure | 10 ----------
>  1 file changed, 10 deletions(-)
>
> diff --git a/configure b/configure
> index 6efc2055ce09..113db838a16f 100755
> --- a/configure
> +++ b/configure
> @@ -2556,16 +2556,6 @@ if test "$skip_meson" =3D no; then
>    if test "$?" -ne 0 ; then
>        error_exit "meson setup failed"
>    fi
> -else
> -  if test -f meson-private/cmd_line.txt; then
> -    # Adjust old command line options whose type was changed
> -    # Avoids having to use "setup --wipe" when Meson is upgraded
> -    perl -i -ne '
> -      s/^gettext =3D true$/gettext =3D auto/;
> -      s/^gettext =3D false$/gettext =3D disabled/;
> -      /^b_staticpic/ && next;
> -      print;' meson-private/cmd_line.txt
> -  fi
>  fi

It's unlikely that users will jump directly from those old versions to
this, so it's fine to me if don't handle adjustments in that case.

>
>  # Save the configure command line for later reuse.
> --
> 2.38.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

