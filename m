Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C9F31A6EB
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 22:32:28 +0100 (CET)
Received: from localhost ([::1]:54218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAg38-0003rx-LP
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 16:32:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lAg1B-0003H7-FT; Fri, 12 Feb 2021 16:30:25 -0500
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:42974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lAg16-0001xA-5s; Fri, 12 Feb 2021 16:30:23 -0500
Received: by mail-io1-xd34.google.com with SMTP id u20so635597iot.9;
 Fri, 12 Feb 2021 13:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SjoM0YfzxFr+TKdRX7Tg7swtwgby5GMV4p6Vk5/CYeY=;
 b=R9aQb6cK+9UgSn3NPebJ33ya89DVeYckGiYlEcKftWASxrJ/IOkFE67q0pBQc7jjJx
 aQOqFtt9yFiVbUsd2wpo20D+VnCqqqSwqFjXugP+Z0HilFj4F9Kww5hDiK7X/dVFAT7W
 5Y8PgjNMUtdI7v5r+/bRHd1YNFmFgI4JtCDPBTjp5szbvJK3TnLlbkmMDoLbhPYwZ1+q
 KcMeLC54uNas5T3xD8hS6gMra3nCKJUFAupvBd8eFaTM2zFQnWdg3uBoVWkYBRd8MGiQ
 kA4wjBLY4HUlqGhWhievjQtcwNf2FILA92pgdbWQBL1L/sr7NWKBcO+i2It8+om7QUkC
 Ykpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SjoM0YfzxFr+TKdRX7Tg7swtwgby5GMV4p6Vk5/CYeY=;
 b=StbGTmGXdw1jJfFgU9uqKlxJYmfvl2AJurcvQbPBYmbw2z+cjiw/Xygwsq9ALcvXf9
 L0Yfha0uMJUJm5+RjZA8qL7OBKRZgqm8HkUj+zBP+PyfmgOT3h+4sMHRLj+iyflrWdRR
 6QgSVOSe+zTLgvAkl/tK4N4PSFpB8iIm/mqAF6U25yh25YvWz6Xz1wIlNWukGY1hmdSE
 j/oYXrhfrhKnurKB3Q/Dqp6ucefm0g/t65n/mF7Si+10qWpBaoj2yNKfy5bjBPZEYuw2
 xKeG/n6EjDnyZF6sBt5IENjypxoXm3EQ47wE630JkqJt3USh41QFH2M29qA94UXu7s29
 YnMQ==
X-Gm-Message-State: AOAM533DJPKcdyuN5C83/NLJOK7JW8XSdGb3jXvRUhJ4ob6mwdC0dnpL
 XhlPtPCyv+Z9qPKumF8iD1X8lPuS2jFe4l4PI1k=
X-Google-Smtp-Source: ABdhPJyOk7vxHQN1QaKMJLcfTx2GYTvuB9/knLcZUghz3iD+MG5OBI8pivLX28iYs9Uv/jQnxkUMVH6ilxC27WG9pQU=
X-Received: by 2002:a05:6638:6b2:: with SMTP id
 d18mr4407346jad.26.1613165417322; 
 Fri, 12 Feb 2021 13:30:17 -0800 (PST)
MIME-Version: 1.0
References: <1613031446-22154-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1613031446-22154-2-git-send-email-sai.pavan.boddu@xilinx.com>
In-Reply-To: <1613031446-22154-2-git-send-email-sai.pavan.boddu@xilinx.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 12 Feb 2021 13:29:36 -0800
Message-ID: <CAKmqyKPsrH6RdeMtYVr42pnEGbr4p2zHqzhjju3fN=NAHEAiug@mail.gmail.com>
Subject: Re: [RFC PATCH 01/15] block: add eMMC block device type
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Vincent Palatin <vpalatin@chromium.org>,
 "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>,
 Qemu-block <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Sai Pavan Boddu <saipava@xilinx.com>, Luc Michel <luc.michel@greensocs.com>,
 Alistair Francis <alistair.francis@wdc.com>, Joel Stanley <joel@jms.id.au>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 11, 2021 at 12:15 AM Sai Pavan Boddu
<sai.pavan.boddu@xilinx.com> wrote:
>
> From: Vincent Palatin <vpalatin@chromium.org>
>
> Add new block device type.
>
> Signed-off-by: Vincent Palatin <vpalatin@chromium.org>
> [SPB: Rebased over 5.1 version]
> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  blockdev.c                | 1 +
>  include/sysemu/blockdev.h | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/blockdev.c b/blockdev.c
> index b250b9b..593ce44 100644
> --- a/blockdev.c
> +++ b/blockdev.c
> @@ -83,6 +83,7 @@ static const char *const if_name[IF_COUNT] =3D {
>      [IF_SD] =3D "sd",
>      [IF_VIRTIO] =3D "virtio",
>      [IF_XEN] =3D "xen",
> +    [IF_EMMC] =3D "emmc",
>  };
>
>  static int if_max_devs[IF_COUNT] =3D {
> diff --git a/include/sysemu/blockdev.h b/include/sysemu/blockdev.h
> index 3b5fcda..eefae9f 100644
> --- a/include/sysemu/blockdev.h
> +++ b/include/sysemu/blockdev.h
> @@ -24,6 +24,7 @@ typedef enum {
>       */
>      IF_NONE =3D 0,
>      IF_IDE, IF_SCSI, IF_FLOPPY, IF_PFLASH, IF_MTD, IF_SD, IF_VIRTIO, IF_=
XEN,
> +    IF_EMMC,
>      IF_COUNT
>  } BlockInterfaceType;
>
> --
> 2.7.4
>
>

