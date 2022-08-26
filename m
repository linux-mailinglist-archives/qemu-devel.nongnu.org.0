Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFA45A265A
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 12:59:04 +0200 (CEST)
Received: from localhost ([::1]:50852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRX3H-00064b-06
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 06:59:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oRWvi-0004AL-0X
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 06:51:14 -0400
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a]:46070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oRWvf-0008OX-EY
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 06:51:13 -0400
Received: by mail-lj1-x22a.google.com with SMTP id q18so1190494ljg.12
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 03:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=STYXcAQw+b+cD/d+k7Va/mXdmZ9HsraWy91ZkJj2xoI=;
 b=Mm00fqWNY4qRyIWp/RfRuP18ATrwMLFm+lyJKpCoq18zTXPkUCZE/pvraz4EYW/3aZ
 AkcgFDVc9p5V1GgZhSgE8MAsq4Clx7U1ckEw6SNfBd4b2npwQIKVUxFnbwcINw8AUDtj
 3lJoLgpB+p6KsSqLwW6IOjWem9ndjzBfDfnKxAoj8v6uqOm0aytdNf6FDBqxgo9fp23p
 YTbF5jnk5kQ/XOnq67mik+g63w4LDl6DPCDgrANE9cFz7mdUjHRjV2Yvrpwh8MmfARVH
 vAEEn+Yem9T0Q7+XB79YhDcIiAjtuYBdhjfJrTNs4kG3hoSzmlQ3wfQ9jDbql2/8mirQ
 0WTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=STYXcAQw+b+cD/d+k7Va/mXdmZ9HsraWy91ZkJj2xoI=;
 b=t7U2xGTUARdkeDkBbEn+iyFnXRKQQJQfs05VbO/NQDOfOTurA9sMoitx2Jsc7N5c3L
 BEsXB66IXMyYE+NOx9ktyGEhUcRRfbIWekyFsVMisSoOrDe6ZPQSPf8mwd4hDEYYECMe
 OuUIkg+74Js6Ysa/WrUB86+W5EEPb05oFaNxjkXpSbR0vUVavX2RfED9yoLPPADkBqDl
 HkWzSJhRwfhP5ClXMIJ8uvaU6xuyY2CGfbkdooYgCFbq3tEOEtDqhxE3AmiVzOlI5IKD
 jsQstJr9RI3Re/eo0MCESvB3drO3YJ3e5bcjxTSVTBqxHuXAUu3q+dQ0diAr1rvyeJpY
 kmEg==
X-Gm-Message-State: ACgBeo3qHz1Te79nACnc/lXD73O8cV6eNOua2Vh9bP3UqenVTEFk3v6O
 mnXdQOizE7Iz3DjcOXKc6c1tUyCloK+fJSoYV/PK74hYvcffig==
X-Google-Smtp-Source: AA6agR4XnwdtUHyJBcVHeh5C72SAm4AknmQImM1qwwTeBOotGjEmHvYZUbuguJY8sJa35fqUlfI3EKt72PzLub34J5o=
X-Received: by 2002:a2e:9346:0:b0:261:8a31:b40c with SMTP id
 m6-20020a2e9346000000b002618a31b40cmr2060746ljh.267.1661511069566; Fri, 26
 Aug 2022 03:51:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220826100812.410773-1-antonio.caggiano@collabora.com>
 <20220826100812.410773-2-antonio.caggiano@collabora.com>
 <CAJ+F1CLr2rMACn_340z1iictXvXMRn0jhXbs=7XkSMY1eL3Upg@mail.gmail.com>
 <fc0bd38e-9082-cf52-6171-be822b77038d@collabora.com>
In-Reply-To: <fc0bd38e-9082-cf52-6171-be822b77038d@collabora.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 26 Aug 2022 14:50:57 +0400
Message-ID: <CAJ+F1CJwyhX+y6gWf3V0FJGZUZTfZHuBkerhy1TR4xsug4sG1w@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] virtio-gpu: CONTEXT_INIT feature
To: Antonio Caggiano <antonio.caggiano@collabora.com>
Cc: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000178b8a05e722b1ac"
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22a.google.com
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

--000000000000178b8a05e722b1ac
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Aug 26, 2022 at 2:45 PM Antonio Caggiano <
antonio.caggiano@collabora.com> wrote:

> Hi Marc-Andr=C3=A9,
>
> On 26/08/2022 12:16, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Fri, Aug 26, 2022 at 2:12 PM Antonio Caggiano
> > <antonio.caggiano@collabora.com <mailto:antonio.caggiano@collabora.com>=
>
>
> > wrote:
> >
> >     Create virgl renderer context with flags using context_id when vali=
d.
> >
> >     v2:
> >     - The feature can be enabled via the context_init config option.
> >     - A warning message will be emitted and the feature will not be use=
d
> >        when linking with virglrenderer versions without context_init
> >     support.
> >
> >     v3: Define HAVE_VIRGL_CONTEXT_INIT in config_host_data.
> >
> >     Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com
> >     <mailto:antonio.caggiano@collabora.com>>
> >     ---
> >       hw/display/virtio-gpu-base.c   |  3 +++
> >       hw/display/virtio-gpu-virgl.c  | 16 ++++++++++++++--
> >       hw/display/virtio-gpu.c        |  2 ++
> >       include/hw/virtio/virtio-gpu.h |  3 +++
> >       meson.build                    |  5 +++++
> >       5 files changed, 27 insertions(+), 2 deletions(-)
> >
> >     diff --git a/hw/display/virtio-gpu-base.c
> b/hw/display/virtio-gpu-base.c
> >     index a29f191aa8..6c5f1f327f 100644
> >     --- a/hw/display/virtio-gpu-base.c
> >     +++ b/hw/display/virtio-gpu-base.c
> >     @@ -215,6 +215,9 @@ virtio_gpu_base_get_features(VirtIODevice *vdev=
,
> >     uint64_t features,
> >           if (virtio_gpu_blob_enabled(g->conf)) {
> >               features |=3D (1 << VIRTIO_GPU_F_RESOURCE_BLOB);
> >           }
> >     +    if (virtio_gpu_context_init_enabled(g->conf)) {
> >     +        features |=3D (1 << VIRTIO_GPU_F_CONTEXT_INIT);
> >     +    }
> >
> >           return features;
> >       }
> >     diff --git a/hw/display/virtio-gpu-virgl.c
> >     b/hw/display/virtio-gpu-virgl.c
> >     index 73cb92c8d5..274cbc44de 100644
> >     --- a/hw/display/virtio-gpu-virgl.c
> >     +++ b/hw/display/virtio-gpu-virgl.c
> >     @@ -97,8 +97,20 @@ static void virgl_cmd_context_create(VirtIOGPU *=
g,
> >           trace_virtio_gpu_cmd_ctx_create(cc.hdr.ctx_id,
> >                                           cc.debug_name);
> >
> >     -    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen,
> >     -                                  cc.debug_name);
> >     +    if (cc.context_init) {
> >     +#ifdef HAVE_VIRGL_CONTEXT_INIT
> >     +        virgl_renderer_context_create_with_flags(cc.hdr.ctx_id,
> >     +                                                 cc.context_init,
> >     +                                                 cc.nlen,
> >     +                                                 cc.debug_name);
> >     +        return;
> >     +#else
> >     +        qemu_log_mask(LOG_UNIMP,
> >     +                      "Linked virglrenderer does not support
> >     context-init\n");
> >
> >
> > What is the outcome in that case?
>
> It's in the commit message: "A warning message will be emitted and the
> feature will not be used when linking with virglrenderer versions
> without context_init"
>
>
Ah ok, I didn't expect this to be under the changelog. We generally don't
put it in the commit message, but rather after the three-dash line.

>
> >     +#endif
> >     +    }
> >     +
> >     +    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen,
> >     cc.debug_name);
> >       }
> >
> >       static void virgl_cmd_context_destroy(VirtIOGPU *g,
> >     diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> >     index 20cc703dcc..fa667ec234 100644
> >     --- a/hw/display/virtio-gpu.c
> >     +++ b/hw/display/virtio-gpu.c
> >     @@ -1424,6 +1424,8 @@ static Property virtio_gpu_properties[] =3D {
> >                            256 * MiB),
> >           DEFINE_PROP_BIT("blob", VirtIOGPU, parent_obj.conf.flags,
> >                           VIRTIO_GPU_FLAG_BLOB_ENABLED, false),
> >     +    DEFINE_PROP_BIT("context_init", VirtIOGPU,
> parent_obj.conf.flags,
> >     +                    VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED, false),
> >           DEFINE_PROP_END_OF_LIST(),
> >       };
> >
> >     diff --git a/include/hw/virtio/virtio-gpu.h
> >     b/include/hw/virtio/virtio-gpu.h
> >     index 2e28507efe..c6f5cfde47 100644
> >     --- a/include/hw/virtio/virtio-gpu.h
> >     +++ b/include/hw/virtio/virtio-gpu.h
> >     @@ -90,6 +90,7 @@ enum virtio_gpu_base_conf_flags {
> >           VIRTIO_GPU_FLAG_EDID_ENABLED,
> >           VIRTIO_GPU_FLAG_DMABUF_ENABLED,
> >           VIRTIO_GPU_FLAG_BLOB_ENABLED,
> >     +    VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED,
> >       };
> >
> >       #define virtio_gpu_virgl_enabled(_cfg) \
> >     @@ -102,6 +103,8 @@ enum virtio_gpu_base_conf_flags {
> >           (_cfg.flags & (1 << VIRTIO_GPU_FLAG_DMABUF_ENABLED))
> >       #define virtio_gpu_blob_enabled(_cfg) \
> >           (_cfg.flags & (1 << VIRTIO_GPU_FLAG_BLOB_ENABLED))
> >     +#define virtio_gpu_context_init_enabled(_cfg) \
> >     +    (_cfg.flags & (1 << VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED))
> >
> >       struct virtio_gpu_base_conf {
> >           uint32_t max_outputs;
> >     diff --git a/meson.build b/meson.build
> >     index 20fddbd707..e1071b3563 100644
> >     --- a/meson.build
> >     +++ b/meson.build
> >     @@ -718,6 +718,11 @@ if not get_option('virglrenderer').auto() or
> >     have_system or have_vhost_user_gpu
> >                            method: 'pkg-config',
> >                            required: get_option('virglrenderer'),
> >                            kwargs: static_kwargs)
> >     +
> >     +  config_host_data.set('HAVE_VIRGL_CONTEXT_INIT',
> >     +
> >       cc.has_function('virgl_renderer_context_create_with_flags',
> >     +                                       prefix: '#include
> >     <virglrenderer.h>',
> >     +                                       dependencies: virgl))
> >       endif
> >       curl =3D not_found
> >       if not get_option('curl').auto() or have_block
> >     --
> >     2.34.1
> >
> >
> >
> > lgtm
> > Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com
> > <mailto:marcandre.lureau@redhat.com>>
> >
> > --
> > Marc-Andr=C3=A9 Lureau
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000178b8a05e722b1ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 26, 2022 at 2:45 PM Ant=
onio Caggiano &lt;<a href=3D"mailto:antonio.caggiano@collabora.com">antonio=
.caggiano@collabora.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Hi Marc-Andr=C3=A9,<br>
<br>
On 26/08/2022 12:16, Marc-Andr=C3=A9 Lureau wrote:<br>
&gt; Hi<br>
&gt; <br>
&gt; On Fri, Aug 26, 2022 at 2:12 PM Antonio Caggiano <br>
&gt; &lt;<a href=3D"mailto:antonio.caggiano@collabora.com" target=3D"_blank=
">antonio.caggiano@collabora.com</a> &lt;mailto:<a href=3D"mailto:antonio.c=
aggiano@collabora.com" target=3D"_blank">antonio.caggiano@collabora.com</a>=
&gt;&gt; <br>
&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Create virgl renderer context with flags using cont=
ext_id when valid.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0v2:<br>
&gt;=C2=A0 =C2=A0 =C2=A0- The feature can be enabled via the context_init c=
onfig option.<br>
&gt;=C2=A0 =C2=A0 =C2=A0- A warning message will be emitted and the feature=
 will not be used<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 when linking with virglrenderer versions wi=
thout context_init<br>
&gt;=C2=A0 =C2=A0 =C2=A0support.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0v3: Define HAVE_VIRGL_CONTEXT_INIT in config_host_d=
ata.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Antonio Caggiano &lt;<a href=3D"mail=
to:antonio.caggiano@collabora.com" target=3D"_blank">antonio.caggiano@colla=
bora.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:antonio.caggiano@colla=
bora.com" target=3D"_blank">antonio.caggiano@collabora.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0hw/display/virtio-gpu-base.c=C2=A0 =C2=A0|=
=C2=A0 3 +++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0hw/display/virtio-gpu-virgl.c=C2=A0 | 16 +++=
+++++++++++--<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0hw/display/virtio-gpu.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 2 ++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0include/hw/virtio/virtio-gpu.h |=C2=A0 3 +++=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 +++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A05 files changed, 27 insertions(+), 2 deletio=
ns(-)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/hw/display/virtio-gpu-base.c b/hw/disp=
lay/virtio-gpu-base.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0index a29f191aa8..6c5f1f327f 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/hw/display/virtio-gpu-base.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/hw/display/virtio-gpu-base.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -215,6 +215,9 @@ virtio_gpu_base_get_features(Vi=
rtIODevice *vdev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0uint64_t features,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (virtio_gpu_blob_enabled(g-=
&gt;conf)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0features |=3D (1=
 &lt;&lt; VIRTIO_GPU_F_RESOURCE_BLOB);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 if (virtio_gpu_context_init_enabled(=
g-&gt;conf)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 features |=3D (1 &lt;&=
lt; VIRTIO_GPU_F_CONTEXT_INIT);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 }<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return features;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/hw/display/virtio-gpu-virgl.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/hw/display/virtio-gpu-virgl.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 73cb92c8d5..274cbc44de 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/hw/display/virtio-gpu-virgl.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/hw/display/virtio-gpu-virgl.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -97,8 +97,20 @@ static void virgl_cmd_context_cr=
eate(VirtIOGPU *g,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trace_virtio_gpu_cmd_ctx_creat=
e(cc.hdr.ctx_id,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0cc.debug_name);<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 virgl_renderer_context_create(cc.hdr=
.ctx_id, cc.nlen,<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cc.de=
bug_name);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 if (cc.context_init) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#ifdef HAVE_VIRGL_CONTEXT_INIT<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 virgl_renderer_context=
_create_with_flags(cc.hdr.ctx_id,<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cc.context_init,<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cc.nlen,<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cc.debug_name);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#else<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_UNIM=
P,<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Linked virglrenderer does not support<br>
&gt;=C2=A0 =C2=A0 =C2=A0context-init\n&quot;);<br>
&gt; <br>
&gt; <br>
&gt; What is the outcome in that case?<br>
<br>
It&#39;s in the commit message: &quot;A warning message will be emitted and=
 the <br>
feature will not be used when linking with virglrenderer versions <br>
without context_init&quot;<br>
<br></blockquote><div><br></div><div>Ah ok, I didn&#39;t expect this to be =
under the changelog. We generally don&#39;t put it in the commit message, b=
ut rather after the three-dash line.</div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0+#endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 virgl_renderer_context_create(cc.hdr=
.ctx_id, cc.nlen,<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc.debug_name);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0static void virgl_cmd_context_destroy(VirtIO=
GPU *g,<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/hw/display/virtio-gpu.c b/hw/display/v=
irtio-gpu.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 20cc703dcc..fa667ec234 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/hw/display/virtio-gpu.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/hw/display/virtio-gpu.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -1424,6 +1424,8 @@ static Property virtio_gpu_pr=
operties[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 256 * MiB),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BIT(&quot;blob&quo=
t;, VirtIOGPU, parent_obj.conf.flags,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0VIRTIO_GPU_FLAG_BLOB_ENABLED, false),<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 DEFINE_PROP_BIT(&quot;context_init&q=
uot;, VirtIOGPU, parent_obj.conf.flags,<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED, false),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_END_OF_LIST(),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/include/hw/virtio/virtio-gpu.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/include/hw/virtio/virtio-gpu.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 2e28507efe..c6f5cfde47 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/include/hw/virtio/virtio-gpu.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/include/hw/virtio/virtio-gpu.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -90,6 +90,7 @@ enum virtio_gpu_base_conf_flags {=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VIRTIO_GPU_FLAG_EDID_ENABLED,<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VIRTIO_GPU_FLAG_DMABUF_ENABLED=
,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VIRTIO_GPU_FLAG_BLOB_ENABLED,<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED=
,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0#define virtio_gpu_virgl_enabled(_cfg) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -102,6 +103,8 @@ enum virtio_gpu_base_conf_flags=
 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(_cfg.flags &amp; (1 &lt;&lt; =
VIRTIO_GPU_FLAG_DMABUF_ENABLED))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0#define virtio_gpu_blob_enabled(_cfg) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(_cfg.flags &amp; (1 &lt;&lt; =
VIRTIO_GPU_FLAG_BLOB_ENABLED))<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#define virtio_gpu_context_init_enabled(_cfg) \<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 (_cfg.flags &amp; (1 &lt;&lt; VIRTIO=
_GPU_FLAG_CONTEXT_INIT_ENABLED))<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct virtio_gpu_base_conf {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t max_outputs;<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/meson.build b/meson.build<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 20fddbd707..e1071b3563 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/meson.build<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/meson.build<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -718,6 +718,11 @@ if not get_option(&#39;virglre=
nderer&#39;).auto() or<br>
&gt;=C2=A0 =C2=A0 =C2=A0have_system or have_vhost_user_gpu<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 method: &#39;pkg-config&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 required: get_option(&#39;virglrenderer&#39;),<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 kwargs: static_kwargs)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 config_host_data.set(&#39;HAVE_VIRGL_CONTEX=
T_INIT&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cc.has_function(&#39;virgl_renderer_context_=
create_with_flags&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0prefix: &#39;#include<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;virglrenderer.h&gt;&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0dependencies: virgl))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0curl =3D not_found<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if not get_option(&#39;curl&#39;).auto() or =
have_block<br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A02.34.1<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; lgtm<br>
&gt; Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lu=
reau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_b=
lank">marcandre.lureau@redhat.com</a>&gt;&gt;<br>
&gt; <br>
&gt; -- <br>
&gt; Marc-Andr=C3=A9 Lureau<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000178b8a05e722b1ac--

