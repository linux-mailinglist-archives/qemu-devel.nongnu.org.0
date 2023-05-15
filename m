Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D9C7020E6
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 02:58:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyMWF-0001gL-IL; Sun, 14 May 2023 20:56:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pyMWA-0001fz-KL; Sun, 14 May 2023 20:56:51 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pyMW7-00038q-89; Sun, 14 May 2023 20:56:48 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-50bcb229adaso22135436a12.2; 
 Sun, 14 May 2023 17:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684112204; x=1686704204;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j4zr8SbQKdddhNOvk/XiTcVjCbgQXJxUCGwLe9TzGCc=;
 b=NXZd40+sfVxnysd+7HLv16OBELfa7aUsyzoA1YtTrGAX7Zl4waXEx9LjHgaNn3K2Ue
 9bU8Jh7xuwdVIgpwBnUObk3Y9d89YrD8nMzlZnNG01Xl+/Sp5eLauC0ZXe1t2y27Lmwy
 GhrNIg52Rqpx57CGmsZAm8dxG35vwuNO6dHiEiS4bTGOAPK2s7EZEX7hQP7PxVjwtlyF
 fmR6JAkGBWNOBMabulZClFkyF2Ih0NXXU3PbuR1rv5Y2gQSeDVFZm4SE2GLHrzmVTM3h
 xCQfKx1FofT54AeftNpK0AaxNOiZPaul45rOvxEsE7vBI0Qcm9YJZy0Dxm+m0Fyk0i9t
 Et2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684112204; x=1686704204;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j4zr8SbQKdddhNOvk/XiTcVjCbgQXJxUCGwLe9TzGCc=;
 b=h13o/gwhgGIZRkEUrO869XLjKuY/8boeQwnCA7oyw1gRgcN52wOg9EFjw9muWSqAZO
 z499fPcPChDUKjJh2dSwyrcLsPMjYxkD2Mo+MgO3VpwzS8j8Nj9eLfgdTorJNATufnGD
 cUzW5uaHMVo2F+md7TIyuHY2SfwURtbCnccwvGhRl1MoaZH+SrfyWkUYWml1wUFmqxWD
 NC67Pm5xNtO7ndpVUvQxad2p3U7W5uhpy8Uss/HWlINfWIGTnVMcoeNO8+nMZGtVEQlx
 3RIrINSIMDoSqBmFLChHfCNvpfb+X9QD8Quuc6n48dVBQ/0JXlnk60dv9VSQGJG49lQo
 z29Q==
X-Gm-Message-State: AC+VfDyOMZ+bz24URbpPjeqp4DlmY6xB8Il0k/WkWN9BHrrcijcwqeAN
 MK7JWTZkCUshkoQQar8lEGZJd8UxZl7mXbJ/Xv4=
X-Google-Smtp-Source: ACHHUZ5dO+M2J1JXQ+lo974UmAUBge2RwM6lb6KzL6ga3OYlbDOI2Zugp2us2JMfg8ACxMC5bq31g2i6haSADygLqbA=
X-Received: by 2002:a05:6402:213:b0:50b:c380:a929 with SMTP id
 t19-20020a056402021300b0050bc380a929mr26166287edv.10.1684112203451; Sun, 14
 May 2023 17:56:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230508120314.59274-1-thuth@redhat.com>
In-Reply-To: <20230508120314.59274-1-thuth@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 15 May 2023 10:56:11 +1000
Message-ID: <CAKmqyKNhy2esz6r1T6Ya+tfR+nurGD1bhRwPh=n+dtwhYXBmOg@mail.gmail.com>
Subject: Re: [PATCH] hw/net: Move xilinx_ethlite.c to the target-independent
 source set
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Alistair Francis <alistair@alistair23.me>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Mon, May 8, 2023 at 10:04=E2=80=AFPM Thomas Huth <thuth@redhat.com> wrot=
e:
>
> Now that the tswap() functions are available for target-independent
> code, too, we can move xilinx_ethlite.c from specific_ss to softmmu_ss
> to avoid that we have to compile this file multiple times.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/net/xilinx_ethlite.c | 2 +-
>  hw/net/meson.build      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
> index 99c22819ea..89f4f3b254 100644
> --- a/hw/net/xilinx_ethlite.c
> +++ b/hw/net/xilinx_ethlite.c
> @@ -25,7 +25,7 @@
>  #include "qemu/osdep.h"
>  #include "qemu/module.h"
>  #include "qom/object.h"
> -#include "cpu.h" /* FIXME should not use tswap* */
> +#include "exec/tswap.h"
>  #include "hw/sysbus.h"
>  #include "hw/irq.h"
>  #include "hw/qdev-properties.h"
> diff --git a/hw/net/meson.build b/hw/net/meson.build
> index e2be0654a1..a7860c5efe 100644
> --- a/hw/net/meson.build
> +++ b/hw/net/meson.build
> @@ -43,7 +43,7 @@ softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('=
npcm7xx_emc.c'))
>  softmmu_ss.add(when: 'CONFIG_ETRAXFS', if_true: files('etraxfs_eth.c'))
>  softmmu_ss.add(when: 'CONFIG_COLDFIRE', if_true: files('mcf_fec.c'))
>  specific_ss.add(when: 'CONFIG_PSERIES', if_true: files('spapr_llan.c'))
> -specific_ss.add(when: 'CONFIG_XILINX_ETHLITE', if_true: files('xilinx_et=
hlite.c'))
> +softmmu_ss.add(when: 'CONFIG_XILINX_ETHLITE', if_true: files('xilinx_eth=
lite.c'))
>
>  softmmu_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('net_rx_pkt.c')=
)
>  specific_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('virtio-net.c'=
))
> --
> 2.31.1
>
>

