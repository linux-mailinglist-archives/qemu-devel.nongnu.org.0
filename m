Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6686499F8
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 09:22:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4e4s-0005sU-Li; Mon, 12 Dec 2022 03:22:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1p4e4f-0005qA-QH
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 03:22:13 -0500
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1p4e4d-00014x-1C
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 03:22:08 -0500
Received: by mail-lj1-x22d.google.com with SMTP id f16so11689919ljc.8
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 00:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TNpQU1jKOAteMk5vwY7fEXkWg/FZoWrmMZdIXIsU+tc=;
 b=X83OpgMG2HkOmXei2ZvCh6FKjekEyTQX138onbNMKmgahxBcQRHxlOVSDBnYVz+sKg
 wvDxlljodCuwrQaaLxJUAlQU0DZlfisCCKJFwfwzyieGtq24YHFKapmSEb6mfZsFPfWI
 +I9BXMCKU1FDbCbADdQbAnbprkQNQAcX9QoP5tfrrv67baBYkkh0OncfBVDclYEBY+zY
 FeyFa0qw2kg+zvc1uhV+f7vIWf2o15yJ47FIHdAEyIWMhLO41etl7jsVJGkBqig8f1Wm
 5KzUAnfSfz8UXpGgn7zoCISXWCYDMrylJsKicwUlDFgW4CDKMO3igAAPcwDYM49QQom+
 fSVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TNpQU1jKOAteMk5vwY7fEXkWg/FZoWrmMZdIXIsU+tc=;
 b=w4FAJBq+UGwyCiphbpYsPgzLeGIXwbvY9fPBnzfmd4tyMlCW0IPLKGWaTCR/m6mqXt
 LzsCzomVVlkzhzSuEJIzpl9bNpUZSUYG8Ys7EwaZtr3Soo1fF4m5+hZ8SNuDq/66QzTf
 2jASEXh+XiRFQ18L4qgqCJ1OHH8qiwTu1b5g1OzrVSZC8L4vf44YGL4QkSKsmoiw5dsg
 KyeD8KedFhkfxfjbxSgLytaCS9lb6KhNwBjwsnYa2tyZOD3d6pXGwW8AMixxLYr2BRHz
 jGjMC2vb7QrTvYdyaExRe2rgkKIYuV4iebNvzBY8F+B6gxYV0nLxaiXDmQycfDKOK2f9
 5W3Q==
X-Gm-Message-State: ANoB5pk7a8iCUJww8klsYluy4sYWQTbPhUBD0udQqpWQEET/I9fdqyMd
 nLiIBA2vQpdfosDWY02toEicKCgLbqe8yKEdpn7MikQdBl0=
X-Google-Smtp-Source: AA0mqf4GSKex01qf9+olC+QuTt732sQVB2/YHF5HvPFzO0uSXXpUhM+lIQauXqTEmHAjlubAPoh8mEfLUIWDVqvyp6c=
X-Received: by 2002:a2e:3506:0:b0:279:ee82:f32e with SMTP id
 z6-20020a2e3506000000b00279ee82f32emr7407382ljz.452.1670833324195; Mon, 12
 Dec 2022 00:22:04 -0800 (PST)
MIME-Version: 1.0
References: <20221209112409.184703-1-pbonzini@redhat.com>
 <20221209112409.184703-8-pbonzini@redhat.com>
In-Reply-To: <20221209112409.184703-8-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 12 Dec 2022 12:21:52 +0400
Message-ID: <CAJ+F1CJBbcGntHDOfAzQvvPD4m6RdPqHbfYVyFvx=J6j5rz3Lg@mail.gmail.com>
Subject: Re: [PATCH 07/30] meson: support meson 0.64 -Doptimization=plain
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22d.google.com
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

On Fri, Dec 9, 2022 at 3:31 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> In Meson 0.64, the optimization built-in option now accepts the "plain" v=
alue,
> which will not set any optimization flags.  While QEMU does not check the
> contents of the option and therefore does not suffer any ill effect
> from the new value, it uses get_option to print the optimization flags
> in the summary.  Clean the code up to remove duplication, and check for
> -Doptimization=3Dplain at the same time.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  meson.build | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
>
> diff --git a/meson.build b/meson.build
> index d61c7a82f112..dbd0b5563446 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -3752,18 +3752,16 @@ endif
>  if targetos =3D=3D 'darwin'
>    summary_info +=3D {'Objective-C compiler': ' '.join(meson.get_compiler=
('objc').cmd_array())}
>  endif
> -summary_info +=3D {'CFLAGS':            ' '.join(get_option('c_args')
> -                                               + ['-O' + get_option('opt=
imization')]
> -                                               + (get_option('debug') ? =
['-g'] : []))}
> +option_cflags =3D (get_option('debug') ? ['-g'] : [])
> +if get_option('optimization') !=3D 'plain'
> +  option_cflags +=3D ['-O' + get_option('optimization')]
> +endif
> +summary_info +=3D {'CFLAGS':            ' '.join(get_option('c_args') + =
option_cflags)}
>  if link_language =3D=3D 'cpp'
> -  summary_info +=3D {'CXXFLAGS':        ' '.join(get_option('cpp_args')
> -                                               + ['-O' + get_option('opt=
imization')]
> -                                               + (get_option('debug') ? =
['-g'] : []))}
> +  summary_info +=3D {'CXXFLAGS':        ' '.join(get_option('cpp_args') =
+ option_cflags)}
>  endif
>  if targetos =3D=3D 'darwin'
> -  summary_info +=3D {'OBJCFLAGS':       ' '.join(get_option('objc_args')
> -                                               + ['-O' + get_option('opt=
imization')]
> -                                               + (get_option('debug') ? =
['-g'] : []))}
> +  summary_info +=3D {'OBJCFLAGS':       ' '.join(get_option('objc_args')=
 + option_cflags)}
>  endif
>  link_args =3D get_option(link_language + '_link_args')
>  if link_args.length() > 0
> --
> 2.38.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

