Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E815A25BE
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 12:21:56 +0200 (CEST)
Received: from localhost ([::1]:37366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRWTG-0004bs-Dz
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 06:21:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oRWOB-0000Ta-EZ
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 06:16:36 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:47056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oRWO6-0001AJ-UP
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 06:16:34 -0400
Received: by mail-lf1-x130.google.com with SMTP id d23so1363677lfl.13
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 03:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=8fedC5mxe90H7Iupo6WJVp4p2MeFWfXE+uXRtIL1hJA=;
 b=dmT4tzHyHmJfPXbbHrSRpuMYvddY5BNhae+Ae+Wcrv6jW95OqqTT+F9su3FOwF9TH8
 NctM1ZoikufOf+X7GTgxzamNaVZoltH7SRvj1Oq5oucaej4eOQYyFU4QyKPZhSrVzUX0
 JXLSLuyNc5JHZwSynBXhjTSntfF8MGJLnIfKNSX6peU7CoobBWFkhYC4S+lqbni9GnyR
 wM2bgnTrkRJMaF0Ked78/uodXd/ZL56sMLjj3QGxFG5+6fWURp1+yGn1Lz3eYbcje0g+
 w15ep8P939ErWt6Nis5j3Oxd49ckDjC2AmWewmNd0Ucjc5+tl95tsenoPSBGpCwGua94
 FEuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=8fedC5mxe90H7Iupo6WJVp4p2MeFWfXE+uXRtIL1hJA=;
 b=06QWO92LNSkZeH/wJHNXiptjtKCd+GL0TJRuxSiYEdbt7kvg6/CcNiS9gHEpaLquzt
 iZmc9oHAojthShuZiOXziMoZ6zaeQyjri5pK6Y8HFV6yMc9+5XCOqNGxKh2a80Aka0+q
 6+Fc/ua9fqs7+0eSv4hc7CnNY+ycXI9fuc1M94jm6PxYBkim4Zs0jWqZ3wKuamA5EfBH
 bUyFKMUQ0oIo48VtN5tKUEA64Og/L72Z8y34pXFp3FSjyhZRzlcULqugL70Fl+MPR7CO
 gVdRIOIpHWC8dWNN4BTVSqIqKRx2W+fR1Dn8XjkLwLXP+TUJLxXjaPtW+WtpfwFkGAHp
 XKAA==
X-Gm-Message-State: ACgBeo1XRvZwGZppR9rKYjJ2ZnOd4DUgFHNqxfI3pdUEIm4X6e3NiRBF
 yIfGOP7DUNNBqegtcxa+ML80Qi8Ff8wz54zLaTQ=
X-Google-Smtp-Source: AA6agR4pkFqzHquicAxd84zrr1K4NcUFDV6fZ2/TDP+Yj1HlLf/uW9CptFSA5kVH4KCsOe9OgX4kxeCV9efbCh9SnJQ=
X-Received: by 2002:a05:6512:2394:b0:492:df50:28ce with SMTP id
 c20-20020a056512239400b00492df5028cemr2496189lfv.328.1661508988369; Fri, 26
 Aug 2022 03:16:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220826100812.410773-1-antonio.caggiano@collabora.com>
 <20220826100812.410773-2-antonio.caggiano@collabora.com>
In-Reply-To: <20220826100812.410773-2-antonio.caggiano@collabora.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 26 Aug 2022 14:16:16 +0400
Message-ID: <CAJ+F1CLr2rMACn_340z1iictXvXMRn0jhXbs=7XkSMY1eL3Upg@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] virtio-gpu: CONTEXT_INIT feature
To: Antonio Caggiano <antonio.caggiano@collabora.com>
Cc: qemu-devel@nongnu.org, gert.wollny@collabora.com, 
 dmitry.osipenko@collabora.com, "Michael S. Tsirkin" <mst@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000000b016305e72235da"
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x130.google.com
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

--0000000000000b016305e72235da
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Aug 26, 2022 at 2:12 PM Antonio Caggiano <
antonio.caggiano@collabora.com> wrote:

> Create virgl renderer context with flags using context_id when valid.
>
> v2:
> - The feature can be enabled via the context_init config option.
> - A warning message will be emitted and the feature will not be used
>   when linking with virglrenderer versions without context_init support.
>
> v3: Define HAVE_VIRGL_CONTEXT_INIT in config_host_data.
>
> Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> ---
>  hw/display/virtio-gpu-base.c   |  3 +++
>  hw/display/virtio-gpu-virgl.c  | 16 ++++++++++++++--
>  hw/display/virtio-gpu.c        |  2 ++
>  include/hw/virtio/virtio-gpu.h |  3 +++
>  meson.build                    |  5 +++++
>  5 files changed, 27 insertions(+), 2 deletions(-)
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
> index 73cb92c8d5..274cbc44de 100644
> --- a/hw/display/virtio-gpu-virgl.c
> +++ b/hw/display/virtio-gpu-virgl.c
> @@ -97,8 +97,20 @@ static void virgl_cmd_context_create(VirtIOGPU *g,
>      trace_virtio_gpu_cmd_ctx_create(cc.hdr.ctx_id,
>                                      cc.debug_name);
>
> -    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen,
> -                                  cc.debug_name);
> +    if (cc.context_init) {
> +#ifdef HAVE_VIRGL_CONTEXT_INIT
> +        virgl_renderer_context_create_with_flags(cc.hdr.ctx_id,
> +                                                 cc.context_init,
> +                                                 cc.nlen,
> +                                                 cc.debug_name);
> +        return;
> +#else
> +        qemu_log_mask(LOG_UNIMP,
> +                      "Linked virglrenderer does not support
> context-init\n");
>

What is the outcome in that case?


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
> index 20fddbd707..e1071b3563 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -718,6 +718,11 @@ if not get_option('virglrenderer').auto() or
> have_system or have_vhost_user_gpu
>                       method: 'pkg-config',
>                       required: get_option('virglrenderer'),
>                       kwargs: static_kwargs)
> +
> +  config_host_data.set('HAVE_VIRGL_CONTEXT_INIT',
> +
>  cc.has_function('virgl_renderer_context_create_with_flags',
> +                                       prefix: '#include
> <virglrenderer.h>',
> +                                       dependencies: virgl))
>  endif
>  curl =3D not_found
>  if not get_option('curl').auto() or have_block
> --
> 2.34.1
>
>
>
lgtm
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000000b016305e72235da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 26, 2022 at 2:12 PM Ant=
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
v3: Define HAVE_VIRGL_CONTEXT_INIT in config_host_data.<br>
<br>
Signed-off-by: Antonio Caggiano &lt;<a href=3D"mailto:antonio.caggiano@coll=
abora.com" target=3D"_blank">antonio.caggiano@collabora.com</a>&gt;<br>
---<br>
=C2=A0hw/display/virtio-gpu-base.c=C2=A0 =C2=A0|=C2=A0 3 +++<br>
=C2=A0hw/display/virtio-gpu-virgl.c=C2=A0 | 16 ++++++++++++++--<br>
=C2=A0hw/display/virtio-gpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 ++<br>
=C2=A0include/hw/virtio/virtio-gpu.h |=C2=A0 3 +++<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 5 +++++<br>
=C2=A05 files changed, 27 insertions(+), 2 deletions(-)<br>
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
index 73cb92c8d5..274cbc44de 100644<br>
--- a/hw/display/virtio-gpu-virgl.c<br>
+++ b/hw/display/virtio-gpu-virgl.c<br>
@@ -97,8 +97,20 @@ static void virgl_cmd_context_create(VirtIOGPU *g,<br>
=C2=A0 =C2=A0 =C2=A0trace_virtio_gpu_cmd_ctx_create(cc.hdr.ctx_id,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cc.debug_name);<=
br>
<br>
-=C2=A0 =C2=A0 virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cc.debug_name);<br>
+=C2=A0 =C2=A0 if (cc.context_init) {<br>
+#ifdef HAVE_VIRGL_CONTEXT_INIT<br>
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
=A0 &quot;Linked virglrenderer does not support context-init\n&quot;);<br><=
/blockquote><div><br></div><div>What is the outcome in that case? <br></div=
><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
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
index 20fddbd707..e1071b3563 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -718,6 +718,11 @@ if not get_option(&#39;virglrenderer&#39;).auto() or h=
ave_system or have_vhost_user_gpu<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 method: &#39;pkg-config&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 required: get_option(&#39;virglrenderer&#39;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 kwargs: static_kwargs)<br>
+<br>
+=C2=A0 config_host_data.set(&#39;HAVE_VIRGL_CONTEXT_INIT&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0cc.has_function(&#39;virgl_renderer_context_create_with_flags&#39=
;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prefix: &=
#39;#include &lt;virglrenderer.h&gt;&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dependenc=
ies: virgl))<br>
=C2=A0endif<br>
=C2=A0curl =3D not_found<br>
=C2=A0if not get_option(&#39;curl&#39;).auto() or have_block<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><div><br></div><div>lgtm</div><div>Reviewed-by: Marc-And=
r=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre=
.lureau@redhat.com</a>&gt;<br></div><br>-- <br><div dir=3D"ltr" class=3D"gm=
ail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000000b016305e72235da--

