Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0162623A
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 12:50:02 +0200 (CEST)
Received: from localhost ([127.0.0.1]:40036 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTOos-0001nu-7M
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 06:50:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59517)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1hTOmu-0000xa-Vr
	for qemu-devel@nongnu.org; Wed, 22 May 2019 06:48:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1hTOmt-00027C-NZ
	for qemu-devel@nongnu.org; Wed, 22 May 2019 06:48:00 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:34271)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1hTOmt-00026W-Gc
	for qemu-devel@nongnu.org; Wed, 22 May 2019 06:47:59 -0400
Received: by mail-wm1-x341.google.com with SMTP id j187so4411528wma.1
	for <qemu-devel@nongnu.org>; Wed, 22 May 2019 03:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Pc/Erk4y3BJymyurhTj2sVvExNznV2zRRH9Fyqb7aHs=;
	b=QvOuK0dwxNe14G1hJJ0Uu0Jbo23uN8cgjQvURINfSERpr38KvoEDDDRP3NGCOx3CMP
	1rd4OxPgiwlTcVeZDqcsVcuQVp2FleLSibj4rsnZXze1xdwuQH+Hp0512kFy9tBsNbMY
	bJiJJkZdvVwXn4fq0T6GEtiKzca9XW+bYQvx/MKrYg3Yu06k/S11LQnMdoR67MbyWc1i
	GLO+NB2LTkXtKvTvL/SUXBvAHwmK4D5jZfq3txY+VO/HnGOv809/IylJcIUqOJW4dXea
	ZZeW3ZqM/XG5dxItPyXBwI26hW0RpESo/fzGsEqLzPTIXHQnnO/hun9IYwIsjtwcCWhz
	P93g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Pc/Erk4y3BJymyurhTj2sVvExNznV2zRRH9Fyqb7aHs=;
	b=fRGbTBjin0CXdPYD1sqbpveZ9P5luQ19eucnNef6LxszChVpuFVw8j286P/1M98vQQ
	2m4/hV4t+4XfFKaDCzWeT5wnFu7CTfpUWIxAf8NYdGAx/J/FhKsyfH1LAwV6vHeHvUWr
	G37TWSxEXTSAtlTm//3pm0+Y5uNdUZ4wn3HKY2LipwDIvE3c417yu8Ar6ZUv6Irpxv/B
	DMUFT/Bh8o9bJMNeAiyu7SLC9mQL4ImkJG8VJ4ybB6SZmt82CsvnWtBC2AhmWsaq4Cj9
	lqUN90um19wGDPkxwTp07QwJILHgaB8uy451oLMfGxvMtqakDFuNItrQN0o+ZWbLwXRZ
	9bzA==
X-Gm-Message-State: APjAAAXjoIAIbeJTImh5ra37epLeJomYglOkHYPhYeld12n5qMR0Mw8X
	qBj2P8WOUnFV98jdiaxU96vOex8Mh/gXQWQgzKQ=
X-Google-Smtp-Source: APXvYqwfvc16fsTonrcqgDowaLn/5v+1+UKd6p/wHDMoPnPn4ht1JidPVTldt5M8Gng0uBieSzxbKP1YD39SvU4ST0Q=
X-Received: by 2002:a1c:e009:: with SMTP id x9mr6744191wmg.117.1558522078356; 
	Wed, 22 May 2019 03:47:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190522095821.15240-1-kraxel@redhat.com>
	<20190522095821.15240-4-kraxel@redhat.com>
In-Reply-To: <20190522095821.15240-4-kraxel@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 22 May 2019 12:47:47 +0200
Message-ID: <CAJ+F1C+n0+N--o93WrzPa4mDfezahv4wxOJqVTuOfTrmqqmLrQ@mail.gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: Re: [Qemu-devel] [PATCH 3/3] egl-helpers: add dmabuf modifier
 support.
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alex Williamson <alex.williamson@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Wed, May 22, 2019 at 12:04 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> Add modifier parameter to egl_get_fd_for_texture(), to return the used
> modifier on dmabuf exports.

But nothing uses it yet?

>
> Check and use QemuDmaBuf->modifier in egl_dmabuf_import_texture() for
> dmabuf imports.

That could be a separate patch, or merged with the first patch.

>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/ui/egl-helpers.h |  3 ++-
>  ui/egl-helpers.c         | 37 ++++++++++++++++++++++++++-----------
>  ui/spice-display.c       |  7 ++++---
>  3 files changed, 32 insertions(+), 15 deletions(-)
>
> diff --git a/include/ui/egl-helpers.h b/include/ui/egl-helpers.h
> index b976cb872821..d71412779913 100644
> --- a/include/ui/egl-helpers.h
> +++ b/include/ui/egl-helpers.h
> @@ -36,7 +36,8 @@ extern struct gbm_device *qemu_egl_rn_gbm_dev;
>  extern EGLContext qemu_egl_rn_ctx;
>
>  int egl_rendernode_init(const char *rendernode, DisplayGLMode mode);
> -int egl_get_fd_for_texture(uint32_t tex_id, EGLint *stride, EGLint *four=
cc);
> +int egl_get_fd_for_texture(uint32_t tex_id, EGLint *stride, EGLint *four=
cc,
> +                           EGLuint64KHR *modifier);
>
>  void egl_dmabuf_import_texture(QemuDmaBuf *dmabuf);
>  void egl_dmabuf_release_texture(QemuDmaBuf *dmabuf);
> diff --git a/ui/egl-helpers.c b/ui/egl-helpers.c
> index e90eef8c9c3a..87bfd32e8ddb 100644
> --- a/ui/egl-helpers.c
> +++ b/ui/egl-helpers.c
> @@ -200,7 +200,8 @@ err:
>      return -1;
>  }
>
> -int egl_get_fd_for_texture(uint32_t tex_id, EGLint *stride, EGLint *four=
cc)
> +int egl_get_fd_for_texture(uint32_t tex_id, EGLint *stride, EGLint *four=
cc,
> +                           EGLuint64KHR *modifier)
>  {
>      EGLImageKHR image;
>      EGLint num_planes, fd;
> @@ -214,7 +215,7 @@ int egl_get_fd_for_texture(uint32_t tex_id, EGLint *s=
tride, EGLint *fourcc)
>      }
>
>      eglExportDMABUFImageQueryMESA(qemu_egl_display, image, fourcc,
> -                                  &num_planes, NULL);
> +                                  &num_planes, modifier);
>      if (num_planes !=3D 1) {
>          eglDestroyImageKHR(qemu_egl_display, image);
>          return -1;
> @@ -228,20 +229,34 @@ int egl_get_fd_for_texture(uint32_t tex_id, EGLint =
*stride, EGLint *fourcc)
>  void egl_dmabuf_import_texture(QemuDmaBuf *dmabuf)
>  {
>      EGLImageKHR image =3D EGL_NO_IMAGE_KHR;
> -    EGLint attrs[] =3D {
> -        EGL_DMA_BUF_PLANE0_FD_EXT,      dmabuf->fd,
> -        EGL_DMA_BUF_PLANE0_PITCH_EXT,   dmabuf->stride,
> -        EGL_DMA_BUF_PLANE0_OFFSET_EXT,  0,
> -        EGL_WIDTH,                      dmabuf->width,
> -        EGL_HEIGHT,                     dmabuf->height,
> -        EGL_LINUX_DRM_FOURCC_EXT,       dmabuf->fourcc,
> -        EGL_NONE, /* end of list */
> -    };
> +    EGLint attrs[64];
> +    int i =3D 0;
>
>      if (dmabuf->texture !=3D 0) {
>          return;
>      }
>
> +    attrs[i++] =3D EGL_WIDTH;
> +    attrs[i++] =3D dmabuf->width;
> +    attrs[i++] =3D EGL_HEIGHT;
> +    attrs[i++] =3D dmabuf->height;
> +    attrs[i++] =3D EGL_LINUX_DRM_FOURCC_EXT;
> +    attrs[i++] =3D dmabuf->fourcc;
> +
> +    attrs[i++] =3D EGL_DMA_BUF_PLANE0_FD_EXT;
> +    attrs[i++] =3D dmabuf->fd;
> +    attrs[i++] =3D EGL_DMA_BUF_PLANE0_PITCH_EXT;
> +    attrs[i++] =3D dmabuf->stride;
> +    attrs[i++] =3D EGL_DMA_BUF_PLANE0_OFFSET_EXT;
> +    attrs[i++] =3D 0;
> +    if (dmabuf->modifier) {
> +        attrs[i++] =3D EGL_DMA_BUF_PLANE0_MODIFIER_LO_EXT;
> +        attrs[i++] =3D (dmabuf->modifier >>  0) & 0xffffffff;
> +        attrs[i++] =3D EGL_DMA_BUF_PLANE0_MODIFIER_HI_EXT;
> +        attrs[i++] =3D (dmabuf->modifier >> 32) & 0xffffffff;
> +    }
> +    attrs[i++] =3D EGL_NONE;
> +
>      image =3D eglCreateImageKHR(qemu_egl_display,
>                                EGL_NO_CONTEXT,
>                                EGL_LINUX_DMA_BUF_EXT,
> diff --git a/ui/spice-display.c b/ui/spice-display.c
> index a5e26479a866..104df2302575 100644
> --- a/ui/spice-display.c
> +++ b/ui/spice-display.c
> @@ -888,7 +888,8 @@ static void spice_gl_switch(DisplayChangeListener *dc=
l,
>      if (ssd->ds) {
>          surface_gl_create_texture(ssd->gls, ssd->ds);
>          fd =3D egl_get_fd_for_texture(ssd->ds->texture,
> -                                    &stride, &fourcc);
> +                                    &stride, &fourcc,
> +                                    NULL);
>          if (fd < 0) {
>              surface_gl_destroy_texture(ssd->gls, ssd->ds);
>              return;
> @@ -945,7 +946,7 @@ static void qemu_spice_gl_scanout_texture(DisplayChan=
geListener *dcl,
>      int fd =3D -1;
>
>      assert(tex_id);
> -    fd =3D egl_get_fd_for_texture(tex_id, &stride, &fourcc);
> +    fd =3D egl_get_fd_for_texture(tex_id, &stride, &fourcc, NULL);
>      if (fd < 0) {
>          fprintf(stderr, "%s: failed to get fd for texture\n", __func__);
>          return;
> @@ -1063,7 +1064,7 @@ static void qemu_spice_gl_update(DisplayChangeListe=
ner *dcl,
>                  egl_fb_setup_new_tex(&ssd->blit_fb,
>                                       dmabuf->width, dmabuf->height);
>                  fd =3D egl_get_fd_for_texture(ssd->blit_fb.texture,
> -                                            &stride, &fourcc);
> +                                            &stride, &fourcc, NULL);
>                  spice_qxl_gl_scanout(&ssd->qxl, fd,
>                                       dmabuf->width, dmabuf->height,
>                                       stride, fourcc, false);
> --
> 2.18.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

