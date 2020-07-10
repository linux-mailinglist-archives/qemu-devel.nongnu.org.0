Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 601F721B333
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jul 2020 12:31:27 +0200 (CEST)
Received: from localhost ([::1]:48620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtqJS-0005eW-E0
	for lists+qemu-devel@lfdr.de; Fri, 10 Jul 2020 06:31:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1jtqI7-0004fi-5A
 for qemu-devel@nongnu.org; Fri, 10 Jul 2020 06:30:03 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:42742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1jtqI5-0003gF-4K
 for qemu-devel@nongnu.org; Fri, 10 Jul 2020 06:30:02 -0400
Received: by mail-oi1-x244.google.com with SMTP id t4so4383044oij.9
 for <qemu-devel@nongnu.org>; Fri, 10 Jul 2020 03:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YJC/NiW3tLRMMSn4Q0Af+nnBamovfoy0tO/zI7F0CfE=;
 b=oFCMQOIZipYdfykNj06pKVauz4KQGAXtxfS+riiK2Zsyp7QQjL/d7WwxXcXJ6XzqAE
 j1b7jSC06KedujrueFsznsRsycbjXYu/X5o2QN1WkyHDRpQfusuJ+Jkg7B9ZEWO3VT/A
 a1KbHsUOCTn1nWewENeP70xaLg/1p11ziu9RrcuTUS/lx3HAv7Ipe4fQ6ZcqEHvnX+rP
 2unprV0niKVL8VoQVbrT9X0A/4k5Ki9PFN7LeO6DaxyD1UKKCDFAuLBSmVy8pFQRROJh
 27HY0SkMCeXp0ihgbKr3ECA51KxsEgZdQtti90blY0xX3VZy9ayRVZtz1hsO00E3x8I7
 dNjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YJC/NiW3tLRMMSn4Q0Af+nnBamovfoy0tO/zI7F0CfE=;
 b=nHYW/F0iUZrKrdxHM0RvvDjASbwwTFdAvRwqzmZk87mqU2zZG9GRKiPArZfcQI+pVs
 vlyHYUNISviFhhe3vBUTYDBIpzhGM6gS5ILxGekKFMTgvo7RmlaECDA6F3XX8xOMvi/l
 yrAB9naS5PF5eo8yfakJmpSScfL61lGxbA4GkNcQ/RoBsaF0Q5yLXDaYl5lVIME8Vfwi
 ZKB5cKaEH+8Xq0VSvv7nTmbyLea7jfF2d6PHiz1BIrhQY5E2YrDkgEwRcedzN23i1+IP
 KLaHZN7sz4ieMkt1sRdJnBS1AjlfoeIa8jvdXZjjh1SAlIfrGAuxvk4FSKbgyfrEUYTk
 9s9w==
X-Gm-Message-State: AOAM532GKKIvVNsfEBUPSKT1ipLDcfcP+jz6mMZfynadeqYtXY1G7YDJ
 vbIIb31CWOjRcdrj2xzc3n6wYuywXBa00uVVnS0=
X-Google-Smtp-Source: ABdhPJyUwdb3AhUprQeU3SpKNa2DDvT9Dz1i4354q2eSNAsfiazRtN+CSWsI8YdkTS45XHIrdChJDcpN6Mf3/T+D5jA=
X-Received: by 2002:aca:524c:: with SMTP id g73mr3573176oib.150.1594376999700; 
 Fri, 10 Jul 2020 03:29:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200710064642.24505-1-lulu@redhat.com>
In-Reply-To: <20200710064642.24505-1-lulu@redhat.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Fri, 10 Jul 2020 18:29:23 +0800
Message-ID: <CAKXe6SLT6yTfRo=p+YQAeEAPmgEz2hX0h4MvCL4LRAAogSszcw@mail.gmail.com>
Subject: Re: [PATCH v2] vhost-vdpa :Fix Coverity CID 1430270 / CID 1420267
To: Cindy Lu <lulu@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=liq3ea@gmail.com; helo=mail-oi1-x244.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Qemu Developers <qemu-devel@nongnu.org>, rob.miller@broadcom.com,
 saugatm@xilinx.com, maxime.coquelin@redhat.com, hch@infradead.org,
 eperezma@redhat.com, jgg@mellanox.com, mhabets@solarflare.com,
 shahafs@mellanox.com, "Tian, Kevin" <kevin.tian@intel.com>, parav@mellanox.com,
 vmireyno@marvell.com, cunming.liang@intel.com, gdawar@xilinx.com,
 jiri@mellanox.com, xiao.w.wang@intel.com,
 Stefan Hajnoczi <stefanha@redhat.com>, zhihong.wang@intel.com,
 ian@iankelling.org, aadam@redhat.com, rdunlap@infradead.org, hanand@xilinx.com,
 lingshan.zhu@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cindy Lu <lulu@redhat.com> =E4=BA=8E2020=E5=B9=B47=E6=9C=8810=E6=97=A5=E5=
=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=882:47=E5=86=99=E9=81=93=EF=BC=9A
>
> In the function vhost_vdpa_dma_map/unmap, The struct msg was not initiali=
zed all its fields.
>
> Signed-off-by: Cindy Lu <lulu@redhat.com>

Reviewed-by: Li Qiang <liq3ea@gmail.com>

> ---
>  hw/virtio/vhost-vdpa.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index a3d17fe0f9..b9265f3761 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -38,7 +38,7 @@ static bool vhost_vdpa_listener_skipped_section(MemoryR=
egionSection *section)
>  static int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr =
size,
>                                void *vaddr, bool readonly)
>  {
> -    struct vhost_msg_v2 msg;
> +    struct vhost_msg_v2 msg =3D {};
>      int fd =3D v->device_fd;
>      int ret =3D 0;
>
> @@ -61,7 +61,7 @@ static int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwa=
ddr iova, hwaddr size,
>  static int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, hwaddr iova,
>                                  hwaddr size)
>  {
> -    struct vhost_msg_v2 msg;
> +    struct vhost_msg_v2 msg =3D {};
>      int fd =3D v->device_fd;
>      int ret =3D 0;
>
> --
> 2.21.1
>
>

