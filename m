Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AA76F87FC
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 19:49:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puzXT-0002Ju-Tq; Fri, 05 May 2023 13:48:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1puzXR-0002Jb-VK
 for qemu-devel@nongnu.org; Fri, 05 May 2023 13:48:13 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1puzXP-0002i0-IV
 for qemu-devel@nongnu.org; Fri, 05 May 2023 13:48:13 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-9659f452148so365384866b.1
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 10:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683308889; x=1685900889;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VXsiXpoBEqZ9gVERLRv5txGBQz69VASVlMJeMLyMj1k=;
 b=ftMNMITAFApsjJLsgNTNJL4TLazHi4mXf7+gilHuPVhIb0xSDfbFF0xBGfFEUQzGPd
 +kV0NJRcBuUL24kKAuslhAdE0LV1fHV3o3PEG+aA/DbwMQhOMU/fW27Dn9gAbHqxitDg
 NTbMEEh+gYcixVEQWYHgqXchvtVPGo5mZnCvqP+C5j6Q8jSUTrt34DcV5suv/oxJFTR/
 0J9MOaHiRxkCmJO28BdPCwnMq7USColGgR/xxAJ7hA5FSxYvwwogDe9+T1BjefxsRo9v
 QVSDV7Q5E1Jg4l2DLPL9IfIsHTzktGlsNvnIKL7WD6AcLoWgC1HadXANcphUQXb+AWX3
 nRMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683308889; x=1685900889;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VXsiXpoBEqZ9gVERLRv5txGBQz69VASVlMJeMLyMj1k=;
 b=LHu3pBGfpQEfRJzZE3dDHa3jwbIt0mPjw+faNbkJp2afpEY3QbckNNjceUXp2bTM8H
 F3FMJh2CvKtE6pbAYG9mdyG6L07mF3w40b26eoCYTF36qKn0GrxjG5cBfOPIMTYk5R4s
 z0LrDYbtv7pvP4bK9LRU21vNVuLW5P7HMB/ffMiE5rnRYwdJp/42cemgLgmaS8wk4Kf3
 G6Hdj8mvdsKXFPeb4HBgJ3AWGIQGBI34Chb6j3gCJjT/l1Y7x7l9ByIF0SgpiOqE+/6v
 o+HlJTasAlZ1B+R65kNV9q4aiWp/RoUF8UISKkScjIWKaKcvD8VxkmcZbDyCjadg1ipX
 KJ8A==
X-Gm-Message-State: AC+VfDwXlM5dHGeDOInBNB0dOA3DPl6e2rgzBVn+r4s14RM727kUGQ4r
 t9CvUvOw+qhM5PC+5+AcpG4=
X-Google-Smtp-Source: ACHHUZ7jCkm+caMwg5ZzdsMP1lZUs18LMgVs77ic2e3RbkbGfZnPC3yeqftI0G534slBye9Xt6A9tw==
X-Received: by 2002:a17:907:9281:b0:960:ddba:e5c5 with SMTP id
 bw1-20020a170907928100b00960ddbae5c5mr2050173ejc.11.1683308889022; 
 Fri, 05 May 2023 10:48:09 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-011-099-137.77.11.pool.telefonica.de.
 [77.11.99.137]) by smtp.gmail.com with ESMTPSA id
 bj6-20020a170906b04600b0096595cc0810sm1235013ejb.72.2023.05.05.10.48.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 May 2023 10:48:08 -0700 (PDT)
Date: Fri, 05 May 2023 17:47:57 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
CC: qemu-devel@nongnu.org, philmd@linaro.org, kraxel@redhat.com,
 marcandre.lureau@redhat.com, akihiko.odaki@gmail.com,
 dmitry.osipenko@collabora.com, ray.huang@amd.com, alex.bennee@linaro.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_3/5=5D_hw/display/virtio-gpu-v?=
 =?US-ASCII?Q?irgl=3A_define_callbacks_in_realize_function?=
In-Reply-To: <CAAfnVB=8C3S8wzBQiSrPyNk0CwCLPeb3cvS6x9VS55J4aJncfA@mail.gmail.com>
References: <20230428164823.789-1-gurchetansingh@google.com>
 <20230428164823.789-3-gurchetansingh@google.com>
 <0DAAC63B-0C0F-44C4-B7EB-ACD6C9A36BF1@gmail.com>
 <CAAfnVB=8C3S8wzBQiSrPyNk0CwCLPeb3cvS6x9VS55J4aJncfA@mail.gmail.com>
Message-ID: <6E514B4B-9185-424E-832E-01813DE8E83F@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x631.google.com
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

Am 1=2E Mai 2023 16:53:03 UTC schrieb Gurchetan Singh <gurchetansingh@chrom=
ium=2Eorg>:
>On Sun, Apr 30, 2023 at 2:48=E2=80=AFPM Bernhard Beschow <shentey@gmail=
=2Ecom> wrote:
>
>>
>>
>> Am 28=2E April 2023 16:48:21 UTC schrieb Gurchetan Singh <
>> gurchetansingh@chromium=2Eorg>:
>> >From: Gurchetan Singh <gurchetansingh@chromium=2Eorg>
>> >
>> >This reduces the amount of renderer backend specific needed to
>> >be exposed to the GL device=2E  We only need one realize function
>> >per renderer backend=2E
>> >
>> >Signed-off-by: Gurchetan Singh <gurchetansingh@chromium=2Eorg>
>> >Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>> >---
>> >v1: - Remove NULL inits (Philippe)
>> >    - Use VIRTIO_GPU_BASE where possible (Philippe)
>> >v2: - Fix unnecessary line break (Akihiko)
>> >
>> > hw/display/virtio-gpu-gl=2Ec     | 15 ++++++---------
>> > hw/display/virtio-gpu-virgl=2Ec  | 35 ++++++++++++++++++++++++-------=
---
>> > include/hw/virtio/virtio-gpu=2Eh |  7 -------
>> > 3 files changed, 31 insertions(+), 26 deletions(-)
>> >
>> >diff --git a/hw/display/virtio-gpu-gl=2Ec b/hw/display/virtio-gpu-gl=
=2Ec
>> >index 2d140e8792=2E=2Ecdc9483e4d 100644
>> >--- a/hw/display/virtio-gpu-gl=2Ec
>> >+++ b/hw/display/virtio-gpu-gl=2Ec
>> >@@ -21,6 +21,11 @@
>> > #include "hw/virtio/virtio-gpu-pixman=2Eh"
>> > #include "hw/qdev-properties=2Eh"
>> >
>> >+static void virtio_gpu_gl_device_realize(DeviceState *qdev, Error **e=
rrp)
>> >+{
>> >+    virtio_gpu_virgl_device_realize(qdev, errp);
>> >+}
>> >+
>> > static Property virtio_gpu_gl_properties[] =3D {
>> >     DEFINE_PROP_BIT("stats", VirtIOGPU, parent_obj=2Econf=2Eflags,
>> >                     VIRTIO_GPU_FLAG_STATS_ENABLED, false),
>> >@@ -31,16 +36,8 @@ static void virtio_gpu_gl_class_init(ObjectClass
>> *klass, void *data)
>> > {
>> >     DeviceClass *dc =3D DEVICE_CLASS(klass);
>> >     VirtioDeviceClass *vdc =3D VIRTIO_DEVICE_CLASS(klass);
>> >-    VirtIOGPUBaseClass *vbc =3D VIRTIO_GPU_BASE_CLASS(klass);
>> >-    VirtIOGPUClass *vgc =3D VIRTIO_GPU_CLASS(klass);
>> >-
>> >-    vbc->gl_flushed =3D virtio_gpu_virgl_flushed;
>> >-    vgc->handle_ctrl =3D virtio_gpu_virgl_handle_ctrl;
>> >-    vgc->process_cmd =3D virtio_gpu_virgl_process_cmd;
>> >-    vgc->update_cursor_data =3D virtio_gpu_virgl_update_cursor;
>> >
>> >-    vdc->realize =3D virtio_gpu_virgl_device_realize;
>> >-    vdc->reset =3D virtio_gpu_virgl_reset;
>> >+    vdc->realize =3D virtio_gpu_gl_device_realize;
>> >     device_class_set_props(dc, virtio_gpu_gl_properties);
>> > }
>> >
>> >diff --git a/hw/display/virtio-gpu-virgl=2Ec b/hw/display/virtio-gpu-v=
irgl=2Ec
>> >index 786351446c=2E=2Ed7e01f1c77 100644
>> >--- a/hw/display/virtio-gpu-virgl=2Ec
>> >+++ b/hw/display/virtio-gpu-virgl=2Ec
>> >@@ -401,8 +401,9 @@ static void virgl_cmd_get_capset(VirtIOGPU *g,
>> >     g_free(resp);
>> > }
>> >
>> >-void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
>> >-                                      struct virtio_gpu_ctrl_command
>> *cmd)
>> >+static void
>> >+virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
>> >+                             struct virtio_gpu_ctrl_command *cmd)
>> > {
>> >     VIRTIO_GPU_FILL_CMD(cmd->cmd_hdr);
>> >
>> >@@ -637,7 +638,7 @@ static int virtio_gpu_virgl_get_num_capsets(VirtIO=
GPU
>> *g)
>> >     return capset2_max_ver ? 2 : 1;
>> > }
>> >
>> >-void virtio_gpu_virgl_update_cursor(VirtIOGPU *g,
>> >+static void virtio_gpu_virgl_update_cursor(VirtIOGPU *g,
>> >                                struct virtio_gpu_scanout *s,
>> >                                uint32_t resource_id)
>> > {
>> >@@ -660,14 +661,14 @@ void virtio_gpu_virgl_update_cursor(VirtIOGPU *g=
,
>> >     free(data);
>> > }
>> >
>> >-void virtio_gpu_virgl_flushed(VirtIOGPUBase *b)
>> >+static void virtio_gpu_virgl_flushed(VirtIOGPUBase *b)
>> > {
>> >     VirtIOGPU *g =3D VIRTIO_GPU(b);
>> >
>> >     virtio_gpu_process_cmdq(g);
>> > }
>> >
>> >-void virtio_gpu_virgl_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
>> >+static void virtio_gpu_virgl_handle_ctrl(VirtIODevice *vdev, VirtQueu=
e
>> *vq)
>> > {
>> >     VirtIOGPU *g =3D VIRTIO_GPU(vdev);
>> >     VirtIOGPUGL *gl =3D VIRTIO_GPU_GL(vdev);
>> >@@ -699,7 +700,7 @@ void virtio_gpu_virgl_handle_ctrl(VirtIODevice *vd=
ev,
>> VirtQueue *vq)
>> >     virtio_gpu_virgl_fence_poll(g);
>> > }
>> >
>> >-void virtio_gpu_virgl_reset(VirtIODevice *vdev)
>> >+static void virtio_gpu_virgl_reset(VirtIODevice *vdev)
>> > {
>> >     VirtIOGPU *g =3D VIRTIO_GPU(vdev);
>> >     VirtIOGPUGL *gl =3D VIRTIO_GPU_GL(vdev);
>> >@@ -718,7 +719,21 @@ void virtio_gpu_virgl_reset(VirtIODevice *vdev)
>> >
>> > void virtio_gpu_virgl_device_realize(DeviceState *qdev, Error **errp)
>> > {
>> >-    VirtIOGPU *g =3D VIRTIO_GPU(qdev);
>> >+    VirtIODevice *vdev =3D VIRTIO_DEVICE(qdev);
>> >+    VirtioDeviceClass *vdc =3D VIRTIO_DEVICE_GET_CLASS(vdev);
>> >+
>> >+    VirtIOGPUBase *bdev =3D VIRTIO_GPU_BASE(qdev);
>> >+    VirtIOGPUBaseClass *vbc =3D VIRTIO_GPU_BASE_GET_CLASS(bdev);
>> >+
>> >+    VirtIOGPU *gpudev =3D VIRTIO_GPU(qdev);
>> >+    VirtIOGPUClass *vgc =3D VIRTIO_GPU_GET_CLASS(gpudev);
>> >+
>> >+    vbc->gl_flushed =3D virtio_gpu_virgl_flushed;
>> >+    vgc->handle_ctrl =3D virtio_gpu_virgl_handle_ctrl;
>> >+    vgc->process_cmd =3D virtio_gpu_virgl_process_cmd;
>> >+    vgc->update_cursor_data =3D virtio_gpu_virgl_update_cursor;
>> >+
>> >+    vdc->reset =3D virtio_gpu_virgl_reset;
>>
>> A realize method is supposed to modify a single instance only while we'=
re
>> modifying the behavior of whole classes here, i=2Ee=2E will affect ever=
y
>> instance of these classes=2E
>
>This goes against QOM design principles and will therefore be confusing f=
or
>> people who are familiar with QOM in particular and OOP in general=2E
>
>
>Context: this is a cleanup in preparation for the gfxstream/rutabaga
>support:
>
> https://patchew=2Eorg/QEMU/20230421011223=2E718-1-gurchetansingh@chromiu=
m=2Eorg/

Judging from this series the benefit of having a common -gl class isn't th=
at big: AFAICS the only synergy effect is sharing a few properties which IM=
O don't warrant sharing=2E IOW the almost non-existant benefit rather confi=
rms the current design=2E The last word needs to be spoken by the maintaine=
rs though=2E

>
>I explored creating a separate "virtio-gpu-rutabaga" device,

Although this approach requires another -pci class it seems cleaner to me =
due to how the QEMU object model works=2E See below=2E

> but felt it
>added too much duplicate code (such as virtio-gpu-pci-rutabaga=2Ec and
>virtio-vga-rutabaga=2Ec)=2E  Please see here:
>
>https://gitlab=2Efreedesktop=2Eorg/gurchetansingh/qemu-gfxstream/-/commit=
s/master
>
>for that approach (current approach is in "qemu-gfxstream2" branch)=2E
>
>In the current approach, function pointers are modified in realize(=2E=2E=
)
>instead of class_init(=2E=2E) since "capset_names" can choose the appropr=
iate
>backend, but that variable is only accessible after class_init(=2E=2E)=2E

Yeah, your're selecting a backend at runtime by changing a whole class' be=
havior inside an *instance* of that class=2E This is not how the QEMU objec=
t model is supposed to work=2E=2E=2E

>
>The difference between instance_init() and the realize() has also come up
>before here:
>
>https://lore=2Ekernel=2Eorg/all/268082DD-5FBB-41CC-8718-7D6BAA0D323A@livi=
us=2Enet/T/#m52be60860e2bf598816ed162f7b6dd070b52cd1d

The link is about a related but different topic=2E It discusses =2Einstanc=
e_init vs=2E =2Erealize=2E This patch is essentially confusing =2Einstance_=
init/=2Erealize and =2Eclass_init=2E You can read more about the QEMU objec=
t model in general and class initialization in particular here: https://www=
=2Eqemu=2Eorg/docs/master/devel/qom=2Ehtml#class-initialization

>
>
>> I think the code should be cleaned up in a different way if really need=
ed=2E
>>
>
>Sure, if there's a cleaner way, we should definitely explore it=2E  Given=
 the
>goal of adding another backend for virtio-gpu, how do you suggest
>refactoring the code?

I'm no maintainer but my suggestion would be this: Use your first approach=
 with dedicated classes=2E This would also allow to force the new backend v=
ia the command line=2E If you really need detection at runtime you could ei=
ther delegate this to Android Studio (by having it select the best (tm) bac=
kend via command line) or you might be able to add a so called "sugar prope=
rty" and have QEMU make the choice (sugar properties exceed my knowledge th=
ough)=2E

Regarding rutabaga I have the following comments:

Given that rutabaga seems to be an abstraction layer over virgl and gfxstr=
eam it seems redundant to me=2E QEMU already has an abstraction layer for v=
arious graphics backends so IMO using another just introduces a maintenance=
 burden=2E Therefore I suggest introducing a dedicated class wich uses gfxs=
tream directly=2E The class name could end with -gfxstream to match the tec=
hnology=2E

Furthermore, rutabaga abstracts two C APIs and is used as C API=2E So the =
benefit of using Rust seems to be low -- not even mentioning the packaging =
issues this causes for Linux distributions=2E

Last but not least rutabaga seems to be a personal pet project rather than=
 something official=2E I guess that QEMU would't want to rely on a personal=
 pet project=2E

In any case I'd leave the last word to the maintainers=2E

Best regards,
Bernhard
>
>
>>
>> Best regards,
>> Bernhard
>>
>> >
>> > #if HOST_BIG_ENDIAN
>> >     error_setg(errp, "virgl is not supported on bigendian platforms")=
;
>> >@@ -736,9 +751,9 @@ void virtio_gpu_virgl_device_realize(DeviceState
>> *qdev, Error **errp)
>> >         return;
>> >     }
>> >
>> >-    g->parent_obj=2Econf=2Eflags |=3D (1 << VIRTIO_GPU_FLAG_VIRGL_ENA=
BLED);
>> >-    VIRTIO_GPU_BASE(g)->virtio_config=2Enum_capsets =3D
>> >-        virtio_gpu_virgl_get_num_capsets(g);
>> >+    VIRTIO_GPU_BASE(gpudev)->conf=2Eflags |=3D (1 <<
>> VIRTIO_GPU_FLAG_VIRGL_ENABLED);
>> >+    VIRTIO_GPU_BASE(gpudev)->virtio_config=2Enum_capsets =3D
>> >+        virtio_gpu_virgl_get_num_capsets(gpudev);
>> >
>> >     virtio_gpu_device_realize(qdev, errp);
>> > }
>> >diff --git a/include/hw/virtio/virtio-gpu=2Eh
>> b/include/hw/virtio/virtio-gpu=2Eh
>> >index 89ee133f07=2E=2Ed5808f2ab6 100644
>> >--- a/include/hw/virtio/virtio-gpu=2Eh
>> >+++ b/include/hw/virtio/virtio-gpu=2Eh
>> >@@ -277,13 +277,6 @@ int virtio_gpu_update_dmabuf(VirtIOGPU *g,
>> >                              struct virtio_gpu_rect *r);
>> >
>> > /* virtio-gpu-3d=2Ec */
>> >-void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
>> >-                                  struct virtio_gpu_ctrl_command *cmd=
);
>> >-void virtio_gpu_virgl_update_cursor(VirtIOGPU *g, struct
>> virtio_gpu_scanout *s,
>> >-                                    uint32_t resource_id);
>> >-void virtio_gpu_virgl_flushed(VirtIOGPUBase *b);
>> >-void virtio_gpu_virgl_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq);
>> >-void virtio_gpu_virgl_reset(VirtIODevice *vdev);
>> > void virtio_gpu_virgl_device_realize(DeviceState *qdev, Error **errp)=
;
>> >
>> > #endif
>>

