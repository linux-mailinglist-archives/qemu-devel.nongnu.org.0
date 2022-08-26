Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C735A23D2
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 11:12:43 +0200 (CEST)
Received: from localhost ([::1]:58978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRVOM-0007hh-5H
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 05:12:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oRVMJ-0006DR-5H
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 05:10:35 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:46880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oRVMF-0007WP-MY
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 05:10:33 -0400
Received: by mail-lf1-x134.google.com with SMTP id d23so1166835lfl.13
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 02:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=wKJqEh/dumabZqGx6LbpDVSCF0zAElxM7JyYfBTVSlk=;
 b=E7YUD9dE4w8GjOPV7NttED8/P5DuhIiV4IBbHdESsvjQ69WdAiunneNS1Z2mprKcBl
 WlsIahcxR5gIbsPxuyZQlLZohp2jurV5CJu+dO4Jz9ZEyWr7eQmRsYWv/v5yuJm+J9qX
 dZXsl9/k7kEv5ZDaw8tYkmv6iHM/PHEJ9/Q6OXb64GRJRQASJjNLNE/oLLoOlwNsGA29
 Sgo9Hpn38RKXWzcYWv9GSsZHcYJrAqD0tos7ABvWpIdr9hV6x4zthHcgAOlck8V8Npn9
 oyl0f00vYGqydNaYKYP3isDFlxRgOmHmLPTFlMKPCk38MtuB2GmpLFJr+J8x29PQVsH/
 xMlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=wKJqEh/dumabZqGx6LbpDVSCF0zAElxM7JyYfBTVSlk=;
 b=OoQimP8JELlqm9mgZKgaeX1dQetlsZsPInduUvE5fHbFYEolvoE0KWcUF9mLka3yIC
 rNcQ8KEIyIldmrS0zomqZ/H6p7lcJJJny3Rq5ZWhejS1tAMVgK3/DnvwhZKkdxExukvu
 CKDtR9pnsIqakIrIc97DMqmm5EVa+d7kh1arl6D/aUGzBn7VPQUxoW7AvNev89hM1gNx
 x5brExLFSslVyfZ5aGtMUSNsiUdcd0J+2Wls/zEJC0yvrBWc7SF9CQpmSX/mb3zaz5yo
 qOuXaRNfkQ9PjQkxELsMzSxUK92EjI4kJNzYIiZpJJPhfuRUUX/9FH0Iwp9mGwg7ell7
 taYA==
X-Gm-Message-State: ACgBeo31SzW9lfNfISMXa7l3drhDrM0yt2X2ds27OArDR0Nz3YP5ZlTs
 RSPCZTm8MZQUcFDTGLBnO5oyMyRSK7c73s9EolI=
X-Google-Smtp-Source: AA6agR4q4f4wKOXhK2aKNUO9NimpHOAiB/odaubq0QS0Us2fdovH5Py+9F+Od3csJ5zjf91Dn/aYSIdFu23bBO+yTVU=
X-Received: by 2002:ac2:4f03:0:b0:48b:2179:5249 with SMTP id
 k3-20020ac24f03000000b0048b21795249mr2551756lfr.356.1661505029836; Fri, 26
 Aug 2022 02:10:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220825161013.385296-1-antonio.caggiano@collabora.com>
 <20220825161013.385296-2-antonio.caggiano@collabora.com>
In-Reply-To: <20220825161013.385296-2-antonio.caggiano@collabora.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 26 Aug 2022 13:10:18 +0400
Message-ID: <CAJ+F1CLyHoEEe0Th_vUzb4k5paWskYGx0wZN74mn0UEvFx7ktA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] virtio-gpu: CONTEXT_INIT feature
To: Antonio Caggiano <antonio.caggiano@collabora.com>
Cc: qemu-devel@nongnu.org, gert.wollny@collabora.com, 
 dmitry.osipenko@collabora.com, Gerd Hoffmann <kraxel@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000018948d05e72149f9"
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000018948d05e72149f9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Aug 25, 2022 at 8:10 PM Antonio Caggiano <
antonio.caggiano@collabora.com> wrote:

> Create virgl renderer context with flags using context_id when valid.
>
> v2:
> - The feature can be enabled via the context_init config option.
> - A warning message will be emitted and the feature will not be used
>   when linking with virglrenderer versions without context_init support.
>
> Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> ---
>  hw/display/virtio-gpu-base.c   |  3 +++
>  hw/display/virtio-gpu-virgl.c  | 19 +++++++++++++++++--
>  hw/display/virtio-gpu.c        |  2 ++
>  include/hw/virtio/virtio-gpu.h |  3 +++
>  meson.build                    | 18 ++++++++++++++++++
>  5 files changed, 43 insertions(+), 2 deletions(-)
>
> diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
> index a29f191aa8..6c5f1f327f 100644
> --- a/hw/display/virtio-gpu-base.c
> +++ b/hw/display/virtio-gpu-base.c
> @@ -215,6 +215,9 @@ virtio_gpu_base_get_features(VirtIODevice *vdev,
> uint64_t features,
>      if (virtio_gpu_blob_enabled(g->conf)) {
>          features |=3D (1 << VIRTIO_GPU_F_RESOURCE_BLOB);
>      }
> +    if (virtio_gpu_context_init_enabled(g->conf)) {
> +        features |=3D (1 << VIRTIO_GPU_F_CONTEXT_INIT);
> +    }
>
>      return features;
>  }
> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.=
c
> index 73cb92c8d5..d70a0006b1 100644
> --- a/hw/display/virtio-gpu-virgl.c
> +++ b/hw/display/virtio-gpu-virgl.c
> @@ -97,8 +97,23 @@ static void virgl_cmd_context_create(VirtIOGPU *g,
>      trace_virtio_gpu_cmd_ctx_create(cc.hdr.ctx_id,
>                                      cc.debug_name);
>
> -    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen,
> -                                  cc.debug_name);
> +    if (cc.context_init) {
> +#if VIRGL_RENDERER_HAS_CONTEXT_INIT
> +        virgl_renderer_context_create_with_flags(cc.hdr.ctx_id,
> +                                                 cc.context_init,
> +                                                 cc.nlen,
> +                                                 cc.debug_name);
> +        return;
> +#else
> +        qemu_log_mask(LOG_UNIMP,
> +                      "Virglrenderer %d.%d.%d does not support
> context-init\n",
> +                      VIRGL_RENDERER_VERSION_MAJOR,
> +                      VIRGL_RENDERER_VERSION_MINOR,
> +                      VIRGL_RENDERER_VERSION_MICRO);
> +#endif
> +    }
> +
> +    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen, cc.debug_name)=
;
>  }
>
>  static void virgl_cmd_context_destroy(VirtIOGPU *g,
> diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> index 20cc703dcc..fa667ec234 100644
> --- a/hw/display/virtio-gpu.c
> +++ b/hw/display/virtio-gpu.c
> @@ -1424,6 +1424,8 @@ static Property virtio_gpu_properties[] =3D {
>                       256 * MiB),
>      DEFINE_PROP_BIT("blob", VirtIOGPU, parent_obj.conf.flags,
>                      VIRTIO_GPU_FLAG_BLOB_ENABLED, false),
> +    DEFINE_PROP_BIT("context_init", VirtIOGPU, parent_obj.conf.flags,
> +                    VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED, false),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> diff --git a/include/hw/virtio/virtio-gpu.h
> b/include/hw/virtio/virtio-gpu.h
> index 2e28507efe..c6f5cfde47 100644
> --- a/include/hw/virtio/virtio-gpu.h
> +++ b/include/hw/virtio/virtio-gpu.h
> @@ -90,6 +90,7 @@ enum virtio_gpu_base_conf_flags {
>      VIRTIO_GPU_FLAG_EDID_ENABLED,
>      VIRTIO_GPU_FLAG_DMABUF_ENABLED,
>      VIRTIO_GPU_FLAG_BLOB_ENABLED,
> +    VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED,
>  };
>
>  #define virtio_gpu_virgl_enabled(_cfg) \
> @@ -102,6 +103,8 @@ enum virtio_gpu_base_conf_flags {
>      (_cfg.flags & (1 << VIRTIO_GPU_FLAG_DMABUF_ENABLED))
>  #define virtio_gpu_blob_enabled(_cfg) \
>      (_cfg.flags & (1 << VIRTIO_GPU_FLAG_BLOB_ENABLED))
> +#define virtio_gpu_context_init_enabled(_cfg) \
> +    (_cfg.flags & (1 << VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED))
>
>  struct virtio_gpu_base_conf {
>      uint32_t max_outputs;
> diff --git a/meson.build b/meson.build
> index 20fddbd707..0d834ff027 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -718,6 +718,24 @@ if not get_option('virglrenderer').auto() or
> have_system or have_vhost_user_gpu
>                       method: 'pkg-config',
>                       required: get_option('virglrenderer'),
>                       kwargs: static_kwargs)
> +
> +  if virgl.found()
> +    virgl_compile_args =3D [
> +      '-DVIRGL_RENDERER_VERSION_MAJOR=3D' + virgl.version().split('.')[0=
],
> +      '-DVIRGL_RENDERER_VERSION_MINOR=3D' + virgl.version().split('.')[1=
],
> +      '-DVIRGL_RENDERER_VERSION_MICRO=3D' + virgl.version().split('.')[2=
],
> +    ]
>

It would be better to avoid using the VIRGL_ prefix, as it may conflict
with future updates.

You don't use those (yet). Perhaps the library header should define those
instead..


+    if cc.has_function('virgl_renderer_context_create_with_flags',
> +                       prefix: '#include <virglrenderer.h>',
> +                       dependencies: virgl)
> +                       message('context_init')
> +      virgl_compile_args +=3D ['-DVIRGL_RENDERER_HAS_CONTEXT_INIT']
>

We usually put those kinds of defines in config-host.h (HAVE_VIRGL_ ...)


> +    endif
> +
> +    virgl =3D declare_dependency(version: virgl.version(),
> +                               compile_args: virgl_compile_args,
> +                               dependencies: virgl)
> +  endif
>  endif
>  curl =3D not_found
>  if not get_option('curl').auto() or have_block
> --
> 2.34.1
>
>
>


--=20
Marc-Andr=C3=A9 Lureau

--00000000000018948d05e72149f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 25, 2022 at 8:10 PM Ant=
onio Caggiano &lt;<a href=3D"mailto:antonio.caggiano@collabora.com">antonio=
.caggiano@collabora.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Create virgl renderer context with flags using conte=
xt_id when valid.<br>
<br>
v2:<br>
- The feature can be enabled via the context_init config option.<br>
- A warning message will be emitted and the feature will not be used<br>
=C2=A0 when linking with virglrenderer versions without context_init suppor=
t.<br>
<br>
Signed-off-by: Antonio Caggiano &lt;<a href=3D"mailto:antonio.caggiano@coll=
abora.com" target=3D"_blank">antonio.caggiano@collabora.com</a>&gt;<br>
---<br>
=C2=A0hw/display/virtio-gpu-base.c=C2=A0 =C2=A0|=C2=A0 3 +++<br>
=C2=A0hw/display/virtio-gpu-virgl.c=C2=A0 | 19 +++++++++++++++++--<br>
=C2=A0hw/display/virtio-gpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 ++<br>
=C2=A0include/hw/virtio/virtio-gpu.h |=C2=A0 3 +++<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 18 ++++++++++++++++++<br>
=C2=A05 files changed, 43 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c<br=
>
index a29f191aa8..6c5f1f327f 100644<br>
--- a/hw/display/virtio-gpu-base.c<br>
+++ b/hw/display/virtio-gpu-base.c<br>
@@ -215,6 +215,9 @@ virtio_gpu_base_get_features(VirtIODevice *vdev, uint64=
_t features,<br>
=C2=A0 =C2=A0 =C2=A0if (virtio_gpu_blob_enabled(g-&gt;conf)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0features |=3D (1 &lt;&lt; VIRTIO_GPU_F_RE=
SOURCE_BLOB);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 if (virtio_gpu_context_init_enabled(g-&gt;conf)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 features |=3D (1 &lt;&lt; VIRTIO_GPU_F_CONTEXT=
_INIT);<br>
+=C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0return features;<br>
=C2=A0}<br>
diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c<=
br>
index 73cb92c8d5..d70a0006b1 100644<br>
--- a/hw/display/virtio-gpu-virgl.c<br>
+++ b/hw/display/virtio-gpu-virgl.c<br>
@@ -97,8 +97,23 @@ static void virgl_cmd_context_create(VirtIOGPU *g,<br>
=C2=A0 =C2=A0 =C2=A0trace_virtio_gpu_cmd_ctx_create(cc.hdr.ctx_id,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cc.debug_name);<=
br>
<br>
-=C2=A0 =C2=A0 virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cc.debug_name);<br>
+=C2=A0 =C2=A0 if (cc.context_init) {<br>
+#if VIRGL_RENDERER_HAS_CONTEXT_INIT<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 virgl_renderer_context_create_with_flags(cc.hd=
r.ctx_id,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0cc.context_init,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0cc.nlen,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0cc.debug_name);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+#else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_UNIMP,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;Virglrenderer %d.%d.%d does not support context-init\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 VIRGL_RENDERER_VERSION_MAJOR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 VIRGL_RENDERER_VERSION_MINOR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 VIRGL_RENDERER_VERSION_MICRO);<br>
+#endif<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 <br>
+=C2=A0 =C2=A0 virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen, cc.deb=
ug_name);<br>
=C2=A0}<br>
<br>
=C2=A0static void virgl_cmd_context_destroy(VirtIOGPU *g,<br>
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c<br>
index 20cc703dcc..fa667ec234 100644<br>
--- a/hw/display/virtio-gpu.c<br>
+++ b/hw/display/virtio-gpu.c<br>
@@ -1424,6 +1424,8 @@ static Property virtio_gpu_properties[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 256 * MiB),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BIT(&quot;blob&quot;, VirtIOGPU, parent_obj=
.conf.flags,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0VIRTIO_GPU_FLAG_BLOB_ENABLED, false),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_BIT(&quot;context_init&quot;, VirtIOGPU, parent_=
obj.conf.flags,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VIRT=
IO_GPU_FLAG_CONTEXT_INIT_ENABLED, false),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_END_OF_LIST(),<br>
=C2=A0};<br>
<br>
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.=
h<br>
index 2e28507efe..c6f5cfde47 100644<br>
--- a/include/hw/virtio/virtio-gpu.h<br>
+++ b/include/hw/virtio/virtio-gpu.h<br>
@@ -90,6 +90,7 @@ enum virtio_gpu_base_conf_flags {<br>
=C2=A0 =C2=A0 =C2=A0VIRTIO_GPU_FLAG_EDID_ENABLED,<br>
=C2=A0 =C2=A0 =C2=A0VIRTIO_GPU_FLAG_DMABUF_ENABLED,<br>
=C2=A0 =C2=A0 =C2=A0VIRTIO_GPU_FLAG_BLOB_ENABLED,<br>
+=C2=A0 =C2=A0 VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED,<br>
=C2=A0};<br>
<br>
=C2=A0#define virtio_gpu_virgl_enabled(_cfg) \<br>
@@ -102,6 +103,8 @@ enum virtio_gpu_base_conf_flags {<br>
=C2=A0 =C2=A0 =C2=A0(_cfg.flags &amp; (1 &lt;&lt; VIRTIO_GPU_FLAG_DMABUF_EN=
ABLED))<br>
=C2=A0#define virtio_gpu_blob_enabled(_cfg) \<br>
=C2=A0 =C2=A0 =C2=A0(_cfg.flags &amp; (1 &lt;&lt; VIRTIO_GPU_FLAG_BLOB_ENAB=
LED))<br>
+#define virtio_gpu_context_init_enabled(_cfg) \<br>
+=C2=A0 =C2=A0 (_cfg.flags &amp; (1 &lt;&lt; VIRTIO_GPU_FLAG_CONTEXT_INIT_E=
NABLED))<br>
<br>
=C2=A0struct virtio_gpu_base_conf {<br>
=C2=A0 =C2=A0 =C2=A0uint32_t max_outputs;<br>
diff --git a/meson.build b/meson.build<br>
index 20fddbd707..0d834ff027 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -718,6 +718,24 @@ if not get_option(&#39;virglrenderer&#39;).auto() or h=
ave_system or have_vhost_user_gpu<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 method: &#39;pkg-config&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 required: get_option(&#39;virglrenderer&#39;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 kwargs: static_kwargs)<br>
+<br>
+=C2=A0 if virgl.found()<br>
+=C2=A0 =C2=A0 virgl_compile_args =3D [<br>
+=C2=A0 =C2=A0 =C2=A0 &#39;-DVIRGL_RENDERER_VERSION_MAJOR=3D&#39; + virgl.v=
ersion().split(&#39;.&#39;)[0],<br>
+=C2=A0 =C2=A0 =C2=A0 &#39;-DVIRGL_RENDERER_VERSION_MINOR=3D&#39; + virgl.v=
ersion().split(&#39;.&#39;)[1],<br>
+=C2=A0 =C2=A0 =C2=A0 &#39;-DVIRGL_RENDERER_VERSION_MICRO=3D&#39; + virgl.v=
ersion().split(&#39;.&#39;)[2],<br>
+=C2=A0 =C2=A0 ]<br></blockquote><div><br></div><div>It would be better to =
avoid using the VIRGL_ prefix, as it may conflict with future updates.</div=
><div><br></div><div>You don&#39;t use those (yet). Perhaps the library hea=
der should define those instead..<br></div><div><br></div><div><br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 if cc.has_function(&#39;virgl_renderer_context_create_with_f=
lags&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0prefix: &#39;#include &lt;virglrenderer.h&gt;&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dependencies: virgl)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0message(&#39;context_init&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 virgl_compile_args +=3D [&#39;-DVIRGL_RENDERER_HAS_CO=
NTEXT_INIT&#39;]<br></blockquote><div><br></div><div>We usually put those k=
inds of defines in config-host.h (HAVE_VIRGL_ ...)</div><div>=C2=A0<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 endif<br>
+<br>
+=C2=A0 =C2=A0 virgl =3D declare_dependency(version: virgl.version(),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compile_args: virgl_compile_args,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dependencies: virgl)<br>
+=C2=A0 endif<br>
=C2=A0endif<br>
=C2=A0curl =3D not_found<br>
=C2=A0if not get_option(&#39;curl&#39;).auto() or have_block<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><div><br></div><div><br></div><br>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000018948d05e72149f9--

