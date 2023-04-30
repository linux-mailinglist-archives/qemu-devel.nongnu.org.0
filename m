Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A95A96F2AFC
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Apr 2023 23:49:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptEuO-0006EF-BZ; Sun, 30 Apr 2023 17:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1ptEuN-0006E5-4t
 for qemu-devel@nongnu.org; Sun, 30 Apr 2023 17:48:39 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1ptEuK-0000xu-VC
 for qemu-devel@nongnu.org; Sun, 30 Apr 2023 17:48:38 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-50bc1612940so1901247a12.2
 for <qemu-devel@nongnu.org>; Sun, 30 Apr 2023 14:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682891315; x=1685483315;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iqrs242LEPzRPsFAWZHXkzzqZMSp6D7LEEG6Nv8188g=;
 b=QJHxKJGJ+jG2wVkRLrtW5XPDu/rR3MZt4orON2iK95cvG2rPvUIiDUo7dXijVWVHVV
 GcGpPXVkpQ8CXPb/TrKPLa0+ets7E4hh39iJlogKQpVGm1ZImErlNFiFc3wx5K47euT0
 zdeiuOOTaxJgn59PDjye0WgoTAEIFmuNAaqhWaCRHg1R/jz7NNG/uoETKQdM6XksTB8h
 HEXq/asaViPzGblxqjaTEwBC0f5evV3l0hZ+VQ4ufsBvf8p35W9l/IpR6anAcDmGc48S
 dELVMCto1IIxgiz5m4+oKIoZXFJwz8ycbnueQHGKPCrOMYwmsscAhrzQXi7YljBV380X
 2N+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682891315; x=1685483315;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iqrs242LEPzRPsFAWZHXkzzqZMSp6D7LEEG6Nv8188g=;
 b=L+73PQAivlu3EEdD8Jl8dASzWXvpfY8IEJaJnoyee8AP4bbK4atecocs+lO+MOm0y7
 CQ+2iUstsmV9IScBxGY+2Pv06H5nru3r4dIaUYwDzoFCSCwxtMyMQCk9uqM9PdkPDy82
 aLb0gRcU+ZhjEPuz5FUPwR8FhWx3tskNjhNpxJ00oVj1n73+AwaNNO7janBVb903+2gd
 4JJjH4yyqJIikupq4pbpCDmgGv2jZ+lajSELKGSlp5DrUjXEGnTOJbRTDm6zG8nOe109
 UqXxX0Xbn2fMg9WFBUDgvvI5D/mlrrK12kkhBm1eymtWnhl1JpXEUyiPCOL2Numc6MVW
 uLEg==
X-Gm-Message-State: AC+VfDxsnfyKIT/b1QydgouwhZDrIKYfx5bnPMVRfpseAs2dUCqJAOVw
 zTfszkFkcSGX4HOzJvlnxXj+QfYe7UQ=
X-Google-Smtp-Source: ACHHUZ7C4CuHPnwBh8wrT/ybxRr8TgzgXcP5finGsNjN4PSaN0BdPJ1BOaKAdv4zuTWGj2ve2pduWQ==
X-Received: by 2002:aa7:cd90:0:b0:506:7304:15d3 with SMTP id
 x16-20020aa7cd90000000b00506730415d3mr4988830edv.14.1682891314521; 
 Sun, 30 Apr 2023 14:48:34 -0700 (PDT)
Received: from ?IPv6:::1?
 (p200300faaf258000e055bae1970322b5.dip0.t-ipconnect.de.
 [2003:fa:af25:8000:e055:bae1:9703:22b5])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a50fb0c000000b004bf999f8e57sm11278633edq.19.2023.04.30.14.48.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Apr 2023 14:48:34 -0700 (PDT)
Date: Sun, 30 Apr 2023 21:48:28 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org, Gurchetan Singh <gurchetansingh@chromium.org>
CC: philmd@linaro.org, kraxel@redhat.com, marcandre.lureau@redhat.com,
 akihiko.odaki@gmail.com, dmitry.osipenko@collabora.com, ray.huang@amd.com,
 alex.bennee@linaro.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_3/5=5D_hw/display/virtio-gpu-v?=
 =?US-ASCII?Q?irgl=3A_define_callbacks_in_realize_function?=
In-Reply-To: <20230428164823.789-3-gurchetansingh@google.com>
References: <20230428164823.789-1-gurchetansingh@google.com>
 <20230428164823.789-3-gurchetansingh@google.com>
Message-ID: <0DAAC63B-0C0F-44C4-B7EB-ACD6C9A36BF1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



Am 28=2E April 2023 16:48:21 UTC schrieb Gurchetan Singh <gurchetansingh@c=
hromium=2Eorg>:
>From: Gurchetan Singh <gurchetansingh@chromium=2Eorg>
>
>This reduces the amount of renderer backend specific needed to
>be exposed to the GL device=2E  We only need one realize function
>per renderer backend=2E
>
>Signed-off-by: Gurchetan Singh <gurchetansingh@chromium=2Eorg>
>Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>---
>v1: - Remove NULL inits (Philippe)
>    - Use VIRTIO_GPU_BASE where possible (Philippe)
>v2: - Fix unnecessary line break (Akihiko)
>
> hw/display/virtio-gpu-gl=2Ec     | 15 ++++++---------
> hw/display/virtio-gpu-virgl=2Ec  | 35 ++++++++++++++++++++++++----------
> include/hw/virtio/virtio-gpu=2Eh |  7 -------
> 3 files changed, 31 insertions(+), 26 deletions(-)
>
>diff --git a/hw/display/virtio-gpu-gl=2Ec b/hw/display/virtio-gpu-gl=2Ec
>index 2d140e8792=2E=2Ecdc9483e4d 100644
>--- a/hw/display/virtio-gpu-gl=2Ec
>+++ b/hw/display/virtio-gpu-gl=2Ec
>@@ -21,6 +21,11 @@
> #include "hw/virtio/virtio-gpu-pixman=2Eh"
> #include "hw/qdev-properties=2Eh"
>=20
>+static void virtio_gpu_gl_device_realize(DeviceState *qdev, Error **errp=
)
>+{
>+    virtio_gpu_virgl_device_realize(qdev, errp);
>+}
>+
> static Property virtio_gpu_gl_properties[] =3D {
>     DEFINE_PROP_BIT("stats", VirtIOGPU, parent_obj=2Econf=2Eflags,
>                     VIRTIO_GPU_FLAG_STATS_ENABLED, false),
>@@ -31,16 +36,8 @@ static void virtio_gpu_gl_class_init(ObjectClass *klas=
s, void *data)
> {
>     DeviceClass *dc =3D DEVICE_CLASS(klass);
>     VirtioDeviceClass *vdc =3D VIRTIO_DEVICE_CLASS(klass);
>-    VirtIOGPUBaseClass *vbc =3D VIRTIO_GPU_BASE_CLASS(klass);
>-    VirtIOGPUClass *vgc =3D VIRTIO_GPU_CLASS(klass);
>-
>-    vbc->gl_flushed =3D virtio_gpu_virgl_flushed;
>-    vgc->handle_ctrl =3D virtio_gpu_virgl_handle_ctrl;
>-    vgc->process_cmd =3D virtio_gpu_virgl_process_cmd;
>-    vgc->update_cursor_data =3D virtio_gpu_virgl_update_cursor;
>=20
>-    vdc->realize =3D virtio_gpu_virgl_device_realize;
>-    vdc->reset =3D virtio_gpu_virgl_reset;
>+    vdc->realize =3D virtio_gpu_gl_device_realize;
>     device_class_set_props(dc, virtio_gpu_gl_properties);
> }
>=20
>diff --git a/hw/display/virtio-gpu-virgl=2Ec b/hw/display/virtio-gpu-virg=
l=2Ec
>index 786351446c=2E=2Ed7e01f1c77 100644
>--- a/hw/display/virtio-gpu-virgl=2Ec
>+++ b/hw/display/virtio-gpu-virgl=2Ec
>@@ -401,8 +401,9 @@ static void virgl_cmd_get_capset(VirtIOGPU *g,
>     g_free(resp);
> }
>=20
>-void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
>-                                      struct virtio_gpu_ctrl_command *cm=
d)
>+static void
>+virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
>+                             struct virtio_gpu_ctrl_command *cmd)
> {
>     VIRTIO_GPU_FILL_CMD(cmd->cmd_hdr);
>=20
>@@ -637,7 +638,7 @@ static int virtio_gpu_virgl_get_num_capsets(VirtIOGPU=
 *g)
>     return capset2_max_ver ? 2 : 1;
> }
>=20
>-void virtio_gpu_virgl_update_cursor(VirtIOGPU *g,
>+static void virtio_gpu_virgl_update_cursor(VirtIOGPU *g,
>                                struct virtio_gpu_scanout *s,
>                                uint32_t resource_id)
> {
>@@ -660,14 +661,14 @@ void virtio_gpu_virgl_update_cursor(VirtIOGPU *g,
>     free(data);
> }
>=20
>-void virtio_gpu_virgl_flushed(VirtIOGPUBase *b)
>+static void virtio_gpu_virgl_flushed(VirtIOGPUBase *b)
> {
>     VirtIOGPU *g =3D VIRTIO_GPU(b);
>=20
>     virtio_gpu_process_cmdq(g);
> }
>=20
>-void virtio_gpu_virgl_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
>+static void virtio_gpu_virgl_handle_ctrl(VirtIODevice *vdev, VirtQueue *=
vq)
> {
>     VirtIOGPU *g =3D VIRTIO_GPU(vdev);
>     VirtIOGPUGL *gl =3D VIRTIO_GPU_GL(vdev);
>@@ -699,7 +700,7 @@ void virtio_gpu_virgl_handle_ctrl(VirtIODevice *vdev,=
 VirtQueue *vq)
>     virtio_gpu_virgl_fence_poll(g);
> }
>=20
>-void virtio_gpu_virgl_reset(VirtIODevice *vdev)
>+static void virtio_gpu_virgl_reset(VirtIODevice *vdev)
> {
>     VirtIOGPU *g =3D VIRTIO_GPU(vdev);
>     VirtIOGPUGL *gl =3D VIRTIO_GPU_GL(vdev);
>@@ -718,7 +719,21 @@ void virtio_gpu_virgl_reset(VirtIODevice *vdev)
>=20
> void virtio_gpu_virgl_device_realize(DeviceState *qdev, Error **errp)
> {
>-    VirtIOGPU *g =3D VIRTIO_GPU(qdev);
>+    VirtIODevice *vdev =3D VIRTIO_DEVICE(qdev);
>+    VirtioDeviceClass *vdc =3D VIRTIO_DEVICE_GET_CLASS(vdev);
>+
>+    VirtIOGPUBase *bdev =3D VIRTIO_GPU_BASE(qdev);
>+    VirtIOGPUBaseClass *vbc =3D VIRTIO_GPU_BASE_GET_CLASS(bdev);
>+
>+    VirtIOGPU *gpudev =3D VIRTIO_GPU(qdev);
>+    VirtIOGPUClass *vgc =3D VIRTIO_GPU_GET_CLASS(gpudev);
>+
>+    vbc->gl_flushed =3D virtio_gpu_virgl_flushed;
>+    vgc->handle_ctrl =3D virtio_gpu_virgl_handle_ctrl;
>+    vgc->process_cmd =3D virtio_gpu_virgl_process_cmd;
>+    vgc->update_cursor_data =3D virtio_gpu_virgl_update_cursor;
>+
>+    vdc->reset =3D virtio_gpu_virgl_reset;

A realize method is supposed to modify a single instance only while we're =
modifying the behavior of whole classes here, i=2Ee=2E will affect every in=
stance of these classes=2E This goes against QOM design principles and will=
 therefore be confusing for people who are familiar with QOM in particular =
and OOP in general=2E I think the code should be cleaned up in a different =
way if really needed=2E

Best regards,
Bernhard

>=20
> #if HOST_BIG_ENDIAN
>     error_setg(errp, "virgl is not supported on bigendian platforms");
>@@ -736,9 +751,9 @@ void virtio_gpu_virgl_device_realize(DeviceState *qde=
v, Error **errp)
>         return;
>     }
>=20
>-    g->parent_obj=2Econf=2Eflags |=3D (1 << VIRTIO_GPU_FLAG_VIRGL_ENABLE=
D);
>-    VIRTIO_GPU_BASE(g)->virtio_config=2Enum_capsets =3D
>-        virtio_gpu_virgl_get_num_capsets(g);
>+    VIRTIO_GPU_BASE(gpudev)->conf=2Eflags |=3D (1 << VIRTIO_GPU_FLAG_VIR=
GL_ENABLED);
>+    VIRTIO_GPU_BASE(gpudev)->virtio_config=2Enum_capsets =3D
>+        virtio_gpu_virgl_get_num_capsets(gpudev);
>=20
>     virtio_gpu_device_realize(qdev, errp);
> }
>diff --git a/include/hw/virtio/virtio-gpu=2Eh b/include/hw/virtio/virtio-=
gpu=2Eh
>index 89ee133f07=2E=2Ed5808f2ab6 100644
>--- a/include/hw/virtio/virtio-gpu=2Eh
>+++ b/include/hw/virtio/virtio-gpu=2Eh
>@@ -277,13 +277,6 @@ int virtio_gpu_update_dmabuf(VirtIOGPU *g,
>                              struct virtio_gpu_rect *r);
>=20
> /* virtio-gpu-3d=2Ec */
>-void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
>-                                  struct virtio_gpu_ctrl_command *cmd);
>-void virtio_gpu_virgl_update_cursor(VirtIOGPU *g, struct virtio_gpu_scan=
out *s,
>-                                    uint32_t resource_id);
>-void virtio_gpu_virgl_flushed(VirtIOGPUBase *b);
>-void virtio_gpu_virgl_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq);
>-void virtio_gpu_virgl_reset(VirtIODevice *vdev);
> void virtio_gpu_virgl_device_realize(DeviceState *qdev, Error **errp);
>=20
> #endif

