Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFBC65B199
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 12:57:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCJR5-0004xO-B4; Mon, 02 Jan 2023 06:56:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pCJQy-0004vY-Ee
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 06:56:55 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pCJQw-0003tm-Ky
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 06:56:52 -0500
Received: by mail-ej1-x631.google.com with SMTP id tz12so66156453ejc.9
 for <qemu-devel@nongnu.org>; Mon, 02 Jan 2023 03:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=waf9CXgtnSCt92lFyIyJSXOBe/U9iZfW6IbZevKQrUU=;
 b=Pn6tLn3rSoOb8faC82vpoD+cQnFGPo9SXVLI0onVunNA1Z6hglX2q/6hcsIuvXgH9a
 DlTTIr2ISIDbrxh62v++Ob3yo21jd7PnTtv7Xxe9p3iJKwSy+Y1r8WdUWgsMCuFrHgU/
 1zZDwb+eKmCUusBKybANcM3vvR3U5+ldSaeptnNLzGV1AXSkU8hQOocic197m2ti+znY
 Vhm8X+gpcigX2HkKNxArJOX7tCIk4N6XVqBON3IOsfAlg3uN19mCR++iO4lbazSfKOVv
 ILPqdqtGa4R9oQ5N53z5Xa0Ds5f7OVtCHy/9Wiz/wj7oRd0qxy5gmUJ0jYQRPj3jeenO
 dTfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=waf9CXgtnSCt92lFyIyJSXOBe/U9iZfW6IbZevKQrUU=;
 b=xkg5qTBr712dvPPAbepTPz9hpZ3qXQ4ESu2eADs0DEBKdLTmZT4vGJ9YOgmpP4eA5v
 wkk3Y+3mRoZ3q0mdxX2Smyrrt/yPwkhmJuT6LQL2Nwiy+6ZbnGf3M4CSRQBM6iAjFIE7
 g08nTOSM+j3WZTDkl3yZwbPEsfkPlvqIlt6V65Af/6LFLJIzgGGI0qncsxEdb3MHhvmK
 uV/ZMs9eUtcVSOa1O4nUPeKI27KmJiikUa6sFOTiXFEaHRc8sb5OjC9AVKc1QuTcgsx+
 ni0IobfAekf9UQK7z+i5vQHOh2u8KCbzM2TYyjVIz8bZUmmy51dcBZQTZB60f4YVxwiy
 q93Q==
X-Gm-Message-State: AFqh2kpFScoOyooc5dmUJOxYmqUalava4jXzgjkU96FA714LmmP3G31E
 TXVNRPtqZO5ePYUVjlb7j69YhGraU2d7CHLPjZqq1tG93+ts2w==
X-Google-Smtp-Source: AMrXdXsWXm+5QhQ6zomOUBpFiV0kPkMJDP8wTIEwWxFaPgBaFTvCkwPT6D8Kt7VYC6RghTg0VJI/msvTyXteaSQ+2OA=
X-Received: by 2002:a05:651c:23a7:b0:27f:e6e7:4ece with SMTP id
 bk39-20020a05651c23a700b0027fe6e74ecemr253880ljb.463.1672660598382; Mon, 02
 Jan 2023 03:56:38 -0800 (PST)
MIME-Version: 1.0
References: <20221222073800.856970-1-pbonzini@redhat.com>
In-Reply-To: <20221222073800.856970-1-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 2 Jan 2023 15:56:26 +0400
Message-ID: <CAJ+F1CL-tVFb6z51k3OGT94XP5y4Axz9rpUF5w+PT_r5W_+4Lw@mail.gmail.com>
Subject: Re: [PATCH] chardev: clean up chardev-parallel.c
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x631.google.com
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

On Thu, Dec 22, 2022 at 11:42 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Replace HAVE_CHARDEV_PARPORT with a Meson conditional, remove unnecessary
> defines, and close the file descriptor on FreeBSD/DragonFly.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  chardev/char-parallel.c | 15 ++-------------
>  chardev/meson.build     |  5 ++++-
>  include/qemu/osdep.h    |  5 -----
>  3 files changed, 6 insertions(+), 19 deletions(-)
>
> diff --git a/chardev/char-parallel.c b/chardev/char-parallel.c
> index 05e7efbd6ca9..a5164f975af3 100644
> --- a/chardev/char-parallel.c
> +++ b/chardev/char-parallel.c
> @@ -238,7 +238,6 @@ static void qemu_chr_open_pp_fd(Chardev *chr,
>  }
>  #endif
>
> -#ifdef HAVE_CHARDEV_PARPORT
>  static void qmp_chardev_open_parallel(Chardev *chr,
>                                        ChardevBackend *backend,
>                                        bool *be_opened,
> @@ -276,29 +275,21 @@ static void char_parallel_class_init(ObjectClass *o=
c, void *data)
>
>      cc->parse =3D qemu_chr_parse_parallel;
>      cc->open =3D qmp_chardev_open_parallel;
> -#if defined(__linux__)
>      cc->chr_ioctl =3D pp_ioctl;
> -#elif defined(__FreeBSD__) || defined(__FreeBSD_kernel__) || \
> -    defined(__DragonFly__)
> -    cc->chr_ioctl =3D pp_ioctl;
> -#endif
>  }
>
>  static void char_parallel_finalize(Object *obj)
>  {
> -#if defined(__linux__)
>      Chardev *chr =3D CHARDEV(obj);
>      ParallelChardev *drv =3D PARALLEL_CHARDEV(chr);
>      int fd =3D drv->fd;
>
> +#if defined(__linux__)
>      pp_hw_mode(drv, IEEE1284_MODE_COMPAT);
>      ioctl(fd, PPRELEASE);
> +#endif
>      close(fd);
>      qemu_chr_be_event(chr, CHR_EVENT_CLOSED);
> -#elif defined(__FreeBSD__) || defined(__FreeBSD_kernel__) || \
> -    defined(__DragonFly__)
> -    /* FIXME: close fd? */
> -#endif
>  }
>
>  static const TypeInfo char_parallel_type_info =3D {
> @@ -315,5 +306,3 @@ static void register_types(void)
>  }
>
>  type_init(register_types);
> -
> -#endif
> diff --git a/chardev/meson.build b/chardev/meson.build
> index 664f77b8879a..ceedb68d4f95 100644
> --- a/chardev/meson.build
> +++ b/chardev/meson.build
> @@ -14,9 +14,12 @@ chardev_ss.add(files(
>  ))
>  chardev_ss.add(when: 'CONFIG_POSIX', if_true: [files(
>    'char-fd.c',
> -  'char-parallel.c',
>    'char-pty.c',
>  ), util])
> +if targetos in ['linux', 'gnu/kfreebsd', 'freebsd', 'dragonfly']
> +  'char-parallel.c',

diff --git a/chardev/meson.build b/chardev/meson.build
index ceedb68d4f..789b50056a 100644
--- a/chardev/meson.build
+++ b/chardev/meson.build
@@ -17,7 +17,7 @@ chardev_ss.add(when: 'CONFIG_POSIX', if_true: [files(
   'char-pty.c',
 ), util])
 if targetos in ['linux', 'gnu/kfreebsd', 'freebsd', 'dragonfly']
-  'char-parallel.c',
+  chardev_ss.add(files('char-parallel.c'))
 endif


With that:
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Feel free to queue in the next build-sys/meson PR.

thanks

> +endif
> +
>  chardev_ss.add(when: 'CONFIG_WIN32', if_true: files(
>    'char-console.c',
>    'char-win-stdio.c',
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index b9c4307779c5..4886361be6a7 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -421,11 +421,6 @@ void qemu_anon_ram_free(void *ptr, size_t size);
>  #define HAVE_CHARDEV_SERIAL 1
>  #endif
>
> -#if defined(__linux__) || defined(__FreeBSD__) ||               \
> -    defined(__FreeBSD_kernel__) || defined(__DragonFly__)
> -#define HAVE_CHARDEV_PARPORT 1
> -#endif
> -
>  #if defined(__HAIKU__)
>  #define SIGIO SIGPOLL
>  #endif
> --
> 2.38.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

