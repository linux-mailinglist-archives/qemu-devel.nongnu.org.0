Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E575E760A
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 10:44:18 +0200 (CEST)
Received: from localhost ([::1]:51148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obeIC-0002jq-QG
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 04:44:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1obeCv-0000PQ-Up
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 04:38:49 -0400
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e]:43703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1obeCt-000236-8g
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 04:38:49 -0400
Received: by mail-lj1-x22e.google.com with SMTP id b6so13806583ljr.10
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 01:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=HXdzxCLo8b/h+UEDrc3Oijbx+AOfnVBK0EmJUH2LWVo=;
 b=YxJd4kwSGZuU9OhEAUaeShuGe2f7wXV28/dJWm2meuUuNdv5ewrfuBbqSQYD8Z5CLB
 AAxhNTohSgZld7EDZ3nMZmnBw2c3uQ+6nZXlbL6y2vxo1GXYxCbKYDbZuKmqyrPSgA5m
 Yi4c+2wDzASFKqpZS2hXRoUg4PnXQE9TJ1IbVa7LSbGAquS5mGTh6hG4QfSfCAidjjay
 YvKEMEa6+j7zjOJgoan0119mzV3IAsmHqjYzjWYg+lIgInve0oetUrVq+zIcLgOUq6WK
 EPbFvrl1zcE02MlwcXdtmjw6uB8vtWQHcmSazXwWsq/jCuUQ7oK/i0z4uSLCC5kqf/fi
 sEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=HXdzxCLo8b/h+UEDrc3Oijbx+AOfnVBK0EmJUH2LWVo=;
 b=Zt1bQLjnORMgiaeYd7glA9D6OZw/2LHm/xBnv8DyIwyT2jFOGsqsvt+AoN71m/VUKK
 yOlfg7fJQpBgQ1a/Z+yAnkox47Zrz0EwmYNz444c7Z7HMtF12o2baWrDr07SqA2E6H0c
 zvr10ef+Gsf9NtjR7kU29k/4fTh7rNnRrzF24JTVpbWxH5yktpy3p58d4sPUHAGZAVw2
 x6Eiw91cvpd2mptlpOw3eHUwIZcPeWykIqbj3MqveCPwBatAyrzvx/vLBip5ezm1ejbD
 pwMv/9JxUM6J7sXqenfUamXtgZhCJg1RffS7lkdkbk1i0xeuq/PT6MMEhYZr+IrUFBsG
 GzAg==
X-Gm-Message-State: ACrzQf1asi+QNPV+vtbTrf4/hV6gXJurETAZwGy01IWND3dfWVriaxsU
 SPsrtHPOgnZLE5Vi7a3AX8zO8ozY8Sq6qLN5LDo=
X-Google-Smtp-Source: AMsMyM7/8J5YO2RTR26THGx8AIa2kY+m4CGXmZAPWYji0dck+cTtLp5edN32/94vJCfNoP0VTtvZ5JPQr0lvmBFG59I=
X-Received: by 2002:a05:651c:1692:b0:26c:37bb:de2 with SMTP id
 bd18-20020a05651c169200b0026c37bb0de2mr2286792ljb.463.1663922325313; Fri, 23
 Sep 2022 01:38:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220921110326.226981-1-antonio.caggiano@collabora.com>
In-Reply-To: <20220921110326.226981-1-antonio.caggiano@collabora.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 23 Sep 2022 10:38:33 +0200
Message-ID: <CAJ+F1C+0Q5Q70gktghLUMcxYzXM0f+jFkdG7EPET9OohqpAuwA@mail.gmail.com>
Subject: Re: [PATCH] virtio-gpu: Resource UUID
To: Antonio Caggiano <antonio.caggiano@collabora.com>
Cc: qemu-devel@nongnu.org, gert.wollny@collabora.com, 
 dmitry.osipenko@collabora.com, "Michael S. Tsirkin" <mst@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000225fa905e9541b7f"
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000225fa905e9541b7f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Sep 21, 2022 at 1:24 PM Antonio Caggiano <
antonio.caggiano@collabora.com> wrote:

> Enable resource UUID feature and implement command resource assign UUID.
> This is done by introducing a hash table to map resource IDs to their
> UUIDs.
>
> Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> ---
>  hw/display/trace-events        |  1 +
>  hw/display/virtio-gpu-base.c   |  2 ++
>  hw/display/virtio-gpu-virgl.c  | 11 ++++++++++
>  hw/display/virtio-gpu.c        | 40 ++++++++++++++++++++++++++++++++++
>  include/hw/virtio/virtio-gpu.h |  4 ++++
>  5 files changed, 58 insertions(+)
>
> diff --git a/hw/display/trace-events b/hw/display/trace-events
> index 0c0ffcbe42..6632344322 100644
> --- a/hw/display/trace-events
> +++ b/hw/display/trace-events
> @@ -41,6 +41,7 @@ virtio_gpu_cmd_res_create_blob(uint32_t res, uint64_t
> size) "res 0x%x, size %" P
>  virtio_gpu_cmd_res_unref(uint32_t res) "res 0x%x"
>  virtio_gpu_cmd_res_back_attach(uint32_t res) "res 0x%x"
>  virtio_gpu_cmd_res_back_detach(uint32_t res) "res 0x%x"
> +virtio_gpu_cmd_res_assign_uuid(uint32_t res) "res 0x%x"
>  virtio_gpu_cmd_res_xfer_toh_2d(uint32_t res) "res 0x%x"
>  virtio_gpu_cmd_res_xfer_toh_3d(uint32_t res) "res 0x%x"
>  virtio_gpu_cmd_res_xfer_fromh_3d(uint32_t res) "res 0x%x"
> diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
> index a29f191aa8..157d280b14 100644
> --- a/hw/display/virtio-gpu-base.c
> +++ b/hw/display/virtio-gpu-base.c
> @@ -216,6 +216,8 @@ virtio_gpu_base_get_features(VirtIODevice *vdev,
> uint64_t features,
>          features |=3D (1 << VIRTIO_GPU_F_RESOURCE_BLOB);
>      }
>
> +    features |=3D (1 << VIRTIO_GPU_F_RESOURCE_UUID);
> +
>      return features;
>  }
>
> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.=
c
> index 73cb92c8d5..7adb6be993 100644
> --- a/hw/display/virtio-gpu-virgl.c
> +++ b/hw/display/virtio-gpu-virgl.c
> @@ -43,6 +43,10 @@ static void virgl_cmd_create_resource_2d(VirtIOGPU *g,
>      args.nr_samples =3D 0;
>      args.flags =3D VIRTIO_GPU_RESOURCE_FLAG_Y_0_TOP;
>      virgl_renderer_resource_create(&args, NULL, 0);
> +
> +    struct virtio_gpu_simple_resource *res =3D g_new0(struct
> virtio_gpu_simple_resource, 1);
> +    res->resource_id =3D c2d.resource_id;
> +    QTAILQ_INSERT_HEAD(&g->reslist, res, next);
>  }
>
>  static void virgl_cmd_create_resource_3d(VirtIOGPU *g,
> @@ -67,6 +71,10 @@ static void virgl_cmd_create_resource_3d(VirtIOGPU *g,
>      args.nr_samples =3D c3d.nr_samples;
>      args.flags =3D c3d.flags;
>      virgl_renderer_resource_create(&args, NULL, 0);
> +
> +    struct virtio_gpu_simple_resource *res =3D g_new0(struct
> virtio_gpu_simple_resource, 1);
> +    res->resource_id =3D c3d.resource_id;
> +    QTAILQ_INSERT_HEAD(&g->reslist, res, next);
>  }
>
>  static void virgl_cmd_resource_unref(VirtIOGPU *g,
> @@ -452,6 +460,9 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
>          /* TODO add security */
>          virgl_cmd_ctx_detach_resource(g, cmd);
>          break;
> +    case VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID:
> +        virtio_gpu_resource_assign_uuid(g, cmd);
> +        break;
>      case VIRTIO_GPU_CMD_GET_CAPSET_INFO:
>          virgl_cmd_get_capset_info(g, cmd);
>          break;
> diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> index 20cc703dcc..67e39fa839 100644
> --- a/hw/display/virtio-gpu.c
> +++ b/hw/display/virtio-gpu.c
> @@ -937,6 +937,37 @@ virtio_gpu_resource_detach_backing(VirtIOGPU *g,
>      virtio_gpu_cleanup_mapping(g, res);
>  }
>
> +void virtio_gpu_resource_assign_uuid(VirtIOGPU *g,
> +                                     struct virtio_gpu_ctrl_command *cmd=
)
> +{
> +    struct virtio_gpu_simple_resource *res;
> +    struct virtio_gpu_resource_assign_uuid assign;
> +    struct virtio_gpu_resp_resource_uuid resp;
> +    QemuUUID *uuid =3D NULL;
> +
> +    VIRTIO_GPU_FILL_CMD(assign);
> +    virtio_gpu_bswap_32(&assign, sizeof(assign));
> +    trace_virtio_gpu_cmd_res_assign_uuid(assign.resource_id);
> +
> +    res =3D virtio_gpu_find_check_resource(g, assign.resource_id, false,
> __func__, &cmd->error);
> +    if (!res) {
> +        return;
>

I think we need:
        cmd->error =3D VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;



> +    }
> +
> +    memset(&resp, 0, sizeof(resp));
> +    resp.hdr.type =3D VIRTIO_GPU_RESP_OK_RESOURCE_UUID;
> +
> +    uuid =3D g_hash_table_lookup(g->resource_uuids,
> GUINT_TO_POINTER(assign.resource_id));
> +    if (!uuid) {
> +        uuid =3D g_new(QemuUUID, 1);
> +        qemu_uuid_generate(uuid);
> +        g_hash_table_insert(g->resource_uuids,
> GUINT_TO_POINTER(assign.resource_id), uuid);
> +    }
> +
> +    memcpy(resp.uuid, uuid, sizeof(QemuUUID));
> +    virtio_gpu_ctrl_response(g, cmd, &resp.hdr, sizeof(resp));
> +}
> +
>  void virtio_gpu_simple_process_cmd(VirtIOGPU *g,
>                                     struct virtio_gpu_ctrl_command *cmd)
>  {
> @@ -985,6 +1016,9 @@ void virtio_gpu_simple_process_cmd(VirtIOGPU *g,
>      case VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING:
>          virtio_gpu_resource_detach_backing(g, cmd);
>          break;
> +    case VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID:
> +        virtio_gpu_resource_assign_uuid(g, cmd);
> +        break;
>      default:
>          cmd->error =3D VIRTIO_GPU_RESP_ERR_UNSPEC;
>          break;
> @@ -1343,6 +1377,8 @@ void virtio_gpu_device_realize(DeviceState *qdev,
> Error **errp)
>      QTAILQ_INIT(&g->reslist);
>      QTAILQ_INIT(&g->cmdq);
>      QTAILQ_INIT(&g->fenceq);
> +
> +    g->resource_uuids =3D g_hash_table_new_full(NULL, NULL, NULL, g_free=
);
>

hmm, we are missing an unrealize function, we are leaking. Could you look
at fixing it?


>  }
>
>  void virtio_gpu_reset(VirtIODevice *vdev)
> @@ -1368,6 +1404,10 @@ void virtio_gpu_reset(VirtIODevice *vdev)
>          g_free(cmd);
>      }
>
> +    if (g->resource_uuids) {
> +        g_hash_table_remove_all(g->resource_uuids);
> +    }
> +
>      virtio_gpu_base_reset(VIRTIO_GPU_BASE(vdev));
>  }
>
> diff --git a/include/hw/virtio/virtio-gpu.h
> b/include/hw/virtio/virtio-gpu.h
> index 2e28507efe..41aed312f5 100644
> --- a/include/hw/virtio/virtio-gpu.h
> +++ b/include/hw/virtio/virtio-gpu.h
> @@ -189,6 +189,8 @@ struct VirtIOGPU {
>          QTAILQ_HEAD(, VGPUDMABuf) bufs;
>          VGPUDMABuf *primary[VIRTIO_GPU_MAX_SCANOUTS];
>      } dmabuf;
> +
> +    GHashTable *resource_uuids;
>  };
>
>  struct VirtIOGPUClass {
> @@ -258,6 +260,8 @@ int virtio_gpu_create_mapping_iov(VirtIOGPU *g,
>                                    uint32_t *niov);
>  void virtio_gpu_cleanup_mapping_iov(VirtIOGPU *g,
>                                      struct iovec *iov, uint32_t count);
> +void virtio_gpu_resource_assign_uuid(VirtIOGPU *g,
> +                                     struct virtio_gpu_ctrl_command *cmd=
);
>  void virtio_gpu_process_cmdq(VirtIOGPU *g);
>  void virtio_gpu_device_realize(DeviceState *qdev, Error **errp);
>  void virtio_gpu_reset(VirtIODevice *vdev);
> --
> 2.34.1
>
>
>
lgtm otherwise

--=20
Marc-Andr=C3=A9 Lureau

--000000000000225fa905e9541b7f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 21, 2022 at 1:24 P=
M Antonio Caggiano &lt;<a href=3D"mailto:antonio.caggiano@collabora.com">an=
tonio.caggiano@collabora.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Enable resource UUID feature and implement comm=
and resource assign UUID.<br>
This is done by introducing a hash table to map resource IDs to their<br>
UUIDs.<br>
<br>
Signed-off-by: Antonio Caggiano &lt;<a href=3D"mailto:antonio.caggiano@coll=
abora.com" target=3D"_blank">antonio.caggiano@collabora.com</a>&gt;<br>
---<br>
=C2=A0hw/display/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0hw/display/virtio-gpu-base.c=C2=A0 =C2=A0|=C2=A0 2 ++<br>
=C2=A0hw/display/virtio-gpu-virgl.c=C2=A0 | 11 ++++++++++<br>
=C2=A0hw/display/virtio-gpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 40 +++++++++++++=
+++++++++++++++++++++<br>
=C2=A0include/hw/virtio/virtio-gpu.h |=C2=A0 4 ++++<br>
=C2=A05 files changed, 58 insertions(+)<br>
<br>
diff --git a/hw/display/trace-events b/hw/display/trace-events<br>
index 0c0ffcbe42..6632344322 100644<br>
--- a/hw/display/trace-events<br>
+++ b/hw/display/trace-events<br>
@@ -41,6 +41,7 @@ virtio_gpu_cmd_res_create_blob(uint32_t res, uint64_t siz=
e) &quot;res 0x%x, size %&quot; P<br>
=C2=A0virtio_gpu_cmd_res_unref(uint32_t res) &quot;res 0x%x&quot;<br>
=C2=A0virtio_gpu_cmd_res_back_attach(uint32_t res) &quot;res 0x%x&quot;<br>
=C2=A0virtio_gpu_cmd_res_back_detach(uint32_t res) &quot;res 0x%x&quot;<br>
+virtio_gpu_cmd_res_assign_uuid(uint32_t res) &quot;res 0x%x&quot;<br>
=C2=A0virtio_gpu_cmd_res_xfer_toh_2d(uint32_t res) &quot;res 0x%x&quot;<br>
=C2=A0virtio_gpu_cmd_res_xfer_toh_3d(uint32_t res) &quot;res 0x%x&quot;<br>
=C2=A0virtio_gpu_cmd_res_xfer_fromh_3d(uint32_t res) &quot;res 0x%x&quot;<b=
r>
diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c<br=
>
index a29f191aa8..157d280b14 100644<br>
--- a/hw/display/virtio-gpu-base.c<br>
+++ b/hw/display/virtio-gpu-base.c<br>
@@ -216,6 +216,8 @@ virtio_gpu_base_get_features(VirtIODevice *vdev, uint64=
_t features,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0features |=3D (1 &lt;&lt; VIRTIO_GPU_F_RE=
SOURCE_BLOB);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 features |=3D (1 &lt;&lt; VIRTIO_GPU_F_RESOURCE_UUID);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0return features;<br>
=C2=A0}<br>
<br>
diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c<=
br>
index 73cb92c8d5..7adb6be993 100644<br>
--- a/hw/display/virtio-gpu-virgl.c<br>
+++ b/hw/display/virtio-gpu-virgl.c<br>
@@ -43,6 +43,10 @@ static void virgl_cmd_create_resource_2d(VirtIOGPU *g,<b=
r>
=C2=A0 =C2=A0 =C2=A0args.nr_samples =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0args.flags =3D VIRTIO_GPU_RESOURCE_FLAG_Y_0_TOP;<br>
=C2=A0 =C2=A0 =C2=A0virgl_renderer_resource_create(&amp;args, NULL, 0);<br>
+<br>
+=C2=A0 =C2=A0 struct virtio_gpu_simple_resource *res =3D g_new0(struct vir=
tio_gpu_simple_resource, 1);<br>
+=C2=A0 =C2=A0 res-&gt;resource_id =3D c2d.resource_id;<br>
+=C2=A0 =C2=A0 QTAILQ_INSERT_HEAD(&amp;g-&gt;reslist, res, next);<br>
=C2=A0}<br>
<br>
=C2=A0static void virgl_cmd_create_resource_3d(VirtIOGPU *g,<br>
@@ -67,6 +71,10 @@ static void virgl_cmd_create_resource_3d(VirtIOGPU *g,<b=
r>
=C2=A0 =C2=A0 =C2=A0args.nr_samples =3D c3d.nr_samples;<br>
=C2=A0 =C2=A0 =C2=A0args.flags =3D c3d.flags;<br>
=C2=A0 =C2=A0 =C2=A0virgl_renderer_resource_create(&amp;args, NULL, 0);<br>
+<br>
+=C2=A0 =C2=A0 struct virtio_gpu_simple_resource *res =3D g_new0(struct vir=
tio_gpu_simple_resource, 1);<br>
+=C2=A0 =C2=A0 res-&gt;resource_id =3D c3d.resource_id;<br>
+=C2=A0 =C2=A0 QTAILQ_INSERT_HEAD(&amp;g-&gt;reslist, res, next);<br>
=C2=A0}<br>
<br>
=C2=A0static void virgl_cmd_resource_unref(VirtIOGPU *g,<br>
@@ -452,6 +460,9 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* TODO add security */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virgl_cmd_ctx_detach_resource(g, cmd);<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 case VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 virtio_gpu_resource_assign_uuid(g, cmd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0case VIRTIO_GPU_CMD_GET_CAPSET_INFO:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virgl_cmd_get_capset_info(g, cmd);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c<br>
index 20cc703dcc..67e39fa839 100644<br>
--- a/hw/display/virtio-gpu.c<br>
+++ b/hw/display/virtio-gpu.c<br>
@@ -937,6 +937,37 @@ virtio_gpu_resource_detach_backing(VirtIOGPU *g,<br>
=C2=A0 =C2=A0 =C2=A0virtio_gpu_cleanup_mapping(g, res);<br>
=C2=A0}<br>
<br>
+void virtio_gpu_resource_assign_uuid(VirtIOGPU *g,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct virtio_gp=
u_ctrl_command *cmd)<br>
+{<br>
+=C2=A0 =C2=A0 struct virtio_gpu_simple_resource *res;<br>
+=C2=A0 =C2=A0 struct virtio_gpu_resource_assign_uuid assign;<br>
+=C2=A0 =C2=A0 struct virtio_gpu_resp_resource_uuid resp;<br>
+=C2=A0 =C2=A0 QemuUUID *uuid =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 VIRTIO_GPU_FILL_CMD(assign);<br>
+=C2=A0 =C2=A0 virtio_gpu_bswap_32(&amp;assign, sizeof(assign));<br>
+=C2=A0 =C2=A0 trace_virtio_gpu_cmd_res_assign_uuid(assign.resource_id);<br=
>
+<br>
+=C2=A0 =C2=A0 res =3D virtio_gpu_find_check_resource(g, assign.resource_id=
, false, __func__, &amp;cmd-&gt;error);<br>
+=C2=A0 =C2=A0 if (!res) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br></blockquote><div><br></div>I think=
 we need:<br></div><div class=3D"gmail_quote"><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 cmd-&gt;error =3D VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;<br></div><div>=
<br>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 memset(&amp;resp, 0, sizeof(resp));<br>
+=C2=A0 =C2=A0 resp.hdr.type =3D VIRTIO_GPU_RESP_OK_RESOURCE_UUID;<br>
+<br>
+=C2=A0 =C2=A0 uuid =3D g_hash_table_lookup(g-&gt;resource_uuids, GUINT_TO_=
POINTER(assign.resource_id));<br>
+=C2=A0 =C2=A0 if (!uuid) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uuid =3D g_new(QemuUUID, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_uuid_generate(uuid);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_hash_table_insert(g-&gt;resource_uuids, GUIN=
T_TO_POINTER(assign.resource_id), uuid);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 memcpy(resp.uuid, uuid, sizeof(QemuUUID));<br>
+=C2=A0 =C2=A0 virtio_gpu_ctrl_response(g, cmd, &amp;resp.hdr, sizeof(resp)=
);<br>
+}<br>
+<br>
=C2=A0void virtio_gpu_simple_process_cmd(VirtIOGPU *g,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_gpu_ctrl=
_command *cmd)<br>
=C2=A0{<br>
@@ -985,6 +1016,9 @@ void virtio_gpu_simple_process_cmd(VirtIOGPU *g,<br>
=C2=A0 =C2=A0 =C2=A0case VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virtio_gpu_resource_detach_backing(g, cmd=
);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 case VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 virtio_gpu_resource_assign_uuid(g, cmd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd-&gt;error =3D VIRTIO_GPU_RESP_ERR_UNS=
PEC;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
@@ -1343,6 +1377,8 @@ void virtio_gpu_device_realize(DeviceState *qdev, Err=
or **errp)<br>
=C2=A0 =C2=A0 =C2=A0QTAILQ_INIT(&amp;g-&gt;reslist);<br>
=C2=A0 =C2=A0 =C2=A0QTAILQ_INIT(&amp;g-&gt;cmdq);<br>
=C2=A0 =C2=A0 =C2=A0QTAILQ_INIT(&amp;g-&gt;fenceq);<br>
+<br>
+=C2=A0 =C2=A0 g-&gt;resource_uuids =3D g_hash_table_new_full(NULL, NULL, N=
ULL, g_free);<br></blockquote><div><br></div><div>hmm, we are missing an un=
realize function, we are leaking. Could you look at fixing it?<br></div><di=
v>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0}<br>
<br>
=C2=A0void virtio_gpu_reset(VirtIODevice *vdev)<br>
@@ -1368,6 +1404,10 @@ void virtio_gpu_reset(VirtIODevice *vdev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_free(cmd);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 if (g-&gt;resource_uuids) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_hash_table_remove_all(g-&gt;resource_uuids);=
<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0virtio_gpu_base_reset(VIRTIO_GPU_BASE(vdev));<br>
=C2=A0}<br>
<br>
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.=
h<br>
index 2e28507efe..41aed312f5 100644<br>
--- a/include/hw/virtio/virtio-gpu.h<br>
+++ b/include/hw/virtio/virtio-gpu.h<br>
@@ -189,6 +189,8 @@ struct VirtIOGPU {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QTAILQ_HEAD(, VGPUDMABuf) bufs;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VGPUDMABuf *primary[VIRTIO_GPU_MAX_SCANOU=
TS];<br>
=C2=A0 =C2=A0 =C2=A0} dmabuf;<br>
+<br>
+=C2=A0 =C2=A0 GHashTable *resource_uuids;<br>
=C2=A0};<br>
<br>
=C2=A0struct VirtIOGPUClass {<br>
@@ -258,6 +260,8 @@ int virtio_gpu_create_mapping_iov(VirtIOGPU *g,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t *niov);<br>
=C2=A0void virtio_gpu_cleanup_mapping_iov(VirtIOGPU *g,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct iovec *io=
v, uint32_t count);<br>
+void virtio_gpu_resource_assign_uuid(VirtIOGPU *g,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct virtio_gp=
u_ctrl_command *cmd);<br>
=C2=A0void virtio_gpu_process_cmdq(VirtIOGPU *g);<br>
=C2=A0void virtio_gpu_device_realize(DeviceState *qdev, Error **errp);<br>
=C2=A0void virtio_gpu_reset(VirtIODevice *vdev);<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"></div><div>lgtm otherwise</div><div><b=
r></div><div>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=
=A9 Lureau<br></div></div></div>

--000000000000225fa905e9541b7f--

