Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A754F63A2CE
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 09:23:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozZPx-00018z-K5; Mon, 28 Nov 2022 03:23:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ozZPr-00018D-0S
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 03:23:03 -0500
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ozZPo-0002xD-Sx
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 03:23:02 -0500
Received: by mail-lj1-x236.google.com with SMTP id z4so12245637ljq.6
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 00:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lHmRS0S3E/kvRauAdLfS7vKqoSq7XUpo6SBaUcZQ//E=;
 b=U6LgpoDdpH15/dZxC90vSnI7AeIQXI6ipjEddkbnhHFKRf8ItxsN2oU1uU7AJuBOGV
 pVLACnbE4XGlllZhU55dddYP/AUZWkkGPk9sE+Ax4kto0tQdoBr3CxdsYD54+kpp4myC
 JAYOVKsWQ+FoCRjOofmPbVWMyWRgnOyFtrhIrLjBLPzPWSh2ORglAG/qGGb82k/C/iBi
 /QTQSxeQrFAhXWZc3VmRLDwzyr6KpGpTSb+Y43/UkV7BrQHQuBhCKKaYK+Ff2fVpuVdx
 X5RobX0Or7n6KeT0OAItqSZfYuy3zlpMBBkBauUFlyp7WA9GqDkX0ILFO9P0hJDh9BhF
 wAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lHmRS0S3E/kvRauAdLfS7vKqoSq7XUpo6SBaUcZQ//E=;
 b=TsTBdOusKBLuW7Zjckc8nocSZoGUlQDEtDsdK7w1oc5YII9uDcjImz/mP+qgd4l4hb
 nN/Xb5fMScyV06IerxUvjJw/Un0J1V61n8AhROo4nJQoCKChVN5Ckoj2LWEjvSabM/JC
 0RYDpFghmSTatJO4tjEOfnAtaNp4d7bMmM420d8S2Ea5WYLfjLftkJB8f4MTY/w6xYJg
 feQEw0lkJq2V/e69K82VT0TnD07JT7DJM3Tcxv1AY+4VSiZYVrPgqQWdoBDuMhtJMl5B
 S7pNBVdKYrXPyxAGlOoKhGj8wMpqFySCWGaAyAYc+YmgLNLLJWMNI+vX4HcGFKnrmhOp
 0Tsg==
X-Gm-Message-State: ANoB5plJ2auZTtRww964kzxNvn/VMpIsXJ7lnGVg+ssdL2nsqGMtisSk
 uPL+k7HSjlXXRsHwSf4jR5KD2lpPihXYaC3lUfg=
X-Google-Smtp-Source: AA0mqf5zITu7f5kGjHoMtFXsdmbNqlslin69zrLpYypjC6uzFcMJV6HF8H8ldCHSA+LeyuLwrWEnewV0m+emTlA088A=
X-Received: by 2002:a2e:bc10:0:b0:279:99f6:7014 with SMTP id
 b16-20020a2ebc10000000b0027999f67014mr2493257ljf.94.1669623778384; Mon, 28
 Nov 2022 00:22:58 -0800 (PST)
MIME-Version: 1.0
References: <20221125154030.42108-1-philmd@linaro.org>
 <20221125173119.46665-1-philmd@linaro.org>
In-Reply-To: <20221125173119.46665-1-philmd@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 28 Nov 2022 12:22:46 +0400
Message-ID: <CAJ+F1C+k+_4SuvO9J4cZGutEqATjbP0oh7StKjT2=hHt6v96Vw@mail.gmail.com>
Subject: Re: [RFC PATCH-for-7.2 3/4] hw/display/qxl: Pass requested buffer
 size to qxl_phys2virt()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, Mauro Matteo Cascella <mcascell@redhat.com>, 
 Alexander Bulekov <alxndr@bu.edu>, Peter Maydell <peter.maydell@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x236.google.com
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

On Fri, Nov 25, 2022 at 9:35 PM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Currently qxl_phys2virt() doesn't check for buffer overrun.
> In order to do so in the next commit, pass the buffer size
> as argument.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>



> ---
> RFC: Please double-check qxl_render_update_area_unlocked()
> ---
>  hw/display/qxl-logger.c | 11 ++++++++---
>  hw/display/qxl-render.c | 11 +++++++----
>  hw/display/qxl.c        | 14 +++++++++-----
>  hw/display/qxl.h        |  4 +++-
>  4 files changed, 27 insertions(+), 13 deletions(-)
>
> diff --git a/hw/display/qxl-logger.c b/hw/display/qxl-logger.c
> index 1bcf803db6..35c38f6252 100644
> --- a/hw/display/qxl-logger.c
> +++ b/hw/display/qxl-logger.c
> @@ -106,7 +106,7 @@ static int qxl_log_image(PCIQXLDevice *qxl, QXLPHYSIC=
AL addr, int group_id)
>      QXLImage *image;
>      QXLImageDescriptor *desc;
>
> -    image =3D qxl_phys2virt(qxl, addr, group_id);
> +    image =3D qxl_phys2virt(qxl, addr, group_id, sizeof(QXLImage));
>      if (!image) {
>          return 1;
>      }
> @@ -214,7 +214,8 @@ int qxl_log_cmd_cursor(PCIQXLDevice *qxl, QXLCursorCm=
d *cmd, int group_id)
>                  cmd->u.set.position.y,
>                  cmd->u.set.visible ? "yes" : "no",
>                  cmd->u.set.shape);
> -        cursor =3D qxl_phys2virt(qxl, cmd->u.set.shape, group_id);
> +        cursor =3D qxl_phys2virt(qxl, cmd->u.set.shape, group_id,
> +                               sizeof(QXLCursor));
>          if (!cursor) {
>              return 1;
>          }
> @@ -236,6 +237,7 @@ int qxl_log_command(PCIQXLDevice *qxl, const char *ri=
ng, QXLCommandExt *ext)
>  {
>      bool compat =3D ext->flags & QXL_COMMAND_FLAG_COMPAT;
>      void *data;
> +    size_t datasz;
>      int ret;
>
>      if (!qxl->cmdlog) {
> @@ -249,15 +251,18 @@ int qxl_log_command(PCIQXLDevice *qxl, const char *=
ring, QXLCommandExt *ext)
>
>      switch (ext->cmd.type) {
>      case QXL_CMD_DRAW:
> +        datasz =3D compat ? sizeof(QXLCompatDrawable) : sizeof(QXLDrawab=
le);
>          break;
>      case QXL_CMD_SURFACE:
> +        datasz =3D sizeof(QXLSurfaceCmd);
>          break;
>      case QXL_CMD_CURSOR:
> +        datasz =3D sizeof(QXLCursorCmd);
>          break;
>      default:
>          goto out;
>      }
> -    data =3D qxl_phys2virt(qxl, ext->cmd.data, ext->group_id);
> +    data =3D qxl_phys2virt(qxl, ext->cmd.data, ext->group_id, datasz);
>      if (!data) {
>          return 1;
>      }
> diff --git a/hw/display/qxl-render.c b/hw/display/qxl-render.c
> index ca217004bf..1b0a50c1aa 100644
> --- a/hw/display/qxl-render.c
> +++ b/hw/display/qxl-render.c
> @@ -107,7 +107,8 @@ static void qxl_render_update_area_unlocked(PCIQXLDev=
ice *qxl)
>          qxl->guest_primary.resized =3D 0;
>          qxl->guest_primary.data =3D qxl_phys2virt(qxl,
>                                                  qxl->guest_primary.surfa=
ce.mem,
> -                                                MEMSLOT_GROUP_GUEST);
> +                                                MEMSLOT_GROUP_GUEST,
> +                                                sizeof(uint32_t) * width=
 * height);

It looks wrong, I think it should be:

qxl->guest_primary.abs_stride * height * qxl->guest_primary.bytes_pp

>          if (!qxl->guest_primary.data) {
>              goto end;
>          }
> @@ -228,7 +229,7 @@ static void qxl_unpack_chunks(void *dest, size_t size=
, PCIQXLDevice *qxl,
>          if (offset =3D=3D size) {
>              return;
>          }
> -        chunk =3D qxl_phys2virt(qxl, chunk->next_chunk, group_id);
> +        chunk =3D qxl_phys2virt(qxl, chunk->next_chunk, group_id, bytes)=
;
>          if (!chunk) {
>              return;
>          }
> @@ -295,7 +296,8 @@ fail:
>  /* called from spice server thread context only */
>  int qxl_render_cursor(PCIQXLDevice *qxl, QXLCommandExt *ext)
>  {
> -    QXLCursorCmd *cmd =3D qxl_phys2virt(qxl, ext->cmd.data, ext->group_i=
d);
> +    QXLCursorCmd *cmd =3D qxl_phys2virt(qxl, ext->cmd.data, ext->group_i=
d,
> +                                      sizeof(QXLCursorCmd));
>      QXLCursor *cursor;
>      QEMUCursor *c;
>
> @@ -314,7 +316,8 @@ int qxl_render_cursor(PCIQXLDevice *qxl, QXLCommandEx=
t *ext)
>      }
>      switch (cmd->type) {
>      case QXL_CURSOR_SET:
> -        cursor =3D qxl_phys2virt(qxl, cmd->u.set.shape, ext->group_id);
> +        cursor =3D qxl_phys2virt(qxl, cmd->u.set.shape, ext->group_id,
> +                               sizeof(QXLCursor));
>          if (!cursor) {
>              return 1;
>          }
> diff --git a/hw/display/qxl.c b/hw/display/qxl.c
> index 5b10f697f1..231d733250 100644
> --- a/hw/display/qxl.c
> +++ b/hw/display/qxl.c
> @@ -274,7 +274,8 @@ static void qxl_spice_monitors_config_async(PCIQXLDev=
ice *qxl, int replay)
>                                            QXL_IO_MONITORS_CONFIG_ASYNC))=
;
>      }
>
> -    cfg =3D qxl_phys2virt(qxl, qxl->guest_monitors_config, MEMSLOT_GROUP=
_GUEST);
> +    cfg =3D qxl_phys2virt(qxl, qxl->guest_monitors_config, MEMSLOT_GROUP=
_GUEST,
> +                        sizeof(QXLMonitorsConfig));
>      if (cfg !=3D NULL && cfg->count =3D=3D 1) {
>          qxl->guest_primary.resized =3D 1;
>          qxl->guest_head0_width  =3D cfg->heads[0].width;
> @@ -459,7 +460,8 @@ static int qxl_track_command(PCIQXLDevice *qxl, struc=
t QXLCommandExt *ext)
>      switch (le32_to_cpu(ext->cmd.type)) {
>      case QXL_CMD_SURFACE:
>      {
> -        QXLSurfaceCmd *cmd =3D qxl_phys2virt(qxl, ext->cmd.data, ext->gr=
oup_id);
> +        QXLSurfaceCmd *cmd =3D qxl_phys2virt(qxl, ext->cmd.data, ext->gr=
oup_id,
> +                                           sizeof(QXLSurfaceCmd));
>
>          if (!cmd) {
>              return 1;
> @@ -494,7 +496,8 @@ static int qxl_track_command(PCIQXLDevice *qxl, struc=
t QXLCommandExt *ext)
>      }
>      case QXL_CMD_CURSOR:
>      {
> -        QXLCursorCmd *cmd =3D qxl_phys2virt(qxl, ext->cmd.data, ext->gro=
up_id);
> +        QXLCursorCmd *cmd =3D qxl_phys2virt(qxl, ext->cmd.data, ext->gro=
up_id,
> +                                          sizeof(QXLCursorCmd));
>
>          if (!cmd) {
>              return 1;
> @@ -1456,7 +1459,8 @@ static bool qxl_get_check_slot_offset(PCIQXLDevice =
*qxl, QXLPHYSICAL pqxl,
>  }
>
>  /* can be also called from spice server thread context */
> -void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL pqxl, int group_id)
> +void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL pqxl, int group_id,
> +                    size_t size)
>  {
>      uint64_t offset;
>      uint32_t slot;
> @@ -1964,7 +1968,7 @@ static void qxl_dirty_surfaces(PCIQXLDevice *qxl)
>          }
>
>          cmd =3D qxl_phys2virt(qxl, qxl->guest_surfaces.cmds[i],
> -                            MEMSLOT_GROUP_GUEST);
> +                            MEMSLOT_GROUP_GUEST, sizeof(QXLSurfaceCmd));
>          assert(cmd);
>          assert(cmd->type =3D=3D QXL_SURFACE_CMD_CREATE);
>          qxl_dirty_one_surface(qxl, cmd->u.surface_create.data,
> diff --git a/hw/display/qxl.h b/hw/display/qxl.h
> index 78b3a6c9ba..bf03138ab4 100644
> --- a/hw/display/qxl.h
> +++ b/hw/display/qxl.h
> @@ -153,6 +153,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(PCIQXLDevice, PCI_QXL)
>   * @qxl: QXL device
>   * @phys: physical offset of buffer within the VRAM
>   * @group_id: memory slot group
> + * @size: size of the buffer
>   *
>   * Returns a host pointer to a buffer placed at offset @phys within the
>   * active slot @group_id of the PCI VGA RAM memory region associated wit=
h
> @@ -166,7 +167,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(PCIQXLDevice, PCI_QXL)
>   * the incoming ram_addr_t.
>   *
>   */
> -void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL phys, int group_id);
> +void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL phys, int group_id,
> +                    size_t size);
>  void qxl_set_guest_bug(PCIQXLDevice *qxl, const char *msg, ...)
>      G_GNUC_PRINTF(2, 3);
>
> --
> 2.38.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

