Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F8A3068FD
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 01:57:43 +0100 (CET)
Received: from localhost ([::1]:33726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4vd0-00011I-3W
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 19:57:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1l4vYL-00086n-M8; Wed, 27 Jan 2021 19:52:54 -0500
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c]:42354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1l4vYJ-0007d2-Ir; Wed, 27 Jan 2021 19:52:53 -0500
Received: by mail-qv1-xf2c.google.com with SMTP id u16so2055912qvo.9;
 Wed, 27 Jan 2021 16:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YtdGfORM4+Ow1n+NOuDR+nFQbncmcrP/LkUiB9rdyMo=;
 b=G4P33oNVySUdY1I9ByMuWm/h+Xa+v/WdIipBOTzlnF5qhA//ELZp7fVOOKsCs2svej
 pP47RpkRj5C6pBuQWdPBOd6Jtq1MB2YwBDnMpnsga6JKpG/T8ExGKSsZVabKS8ao1yfv
 xZJLbA35+rjouQ6a9PUjuVJovj59ooiO0o2Fw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YtdGfORM4+Ow1n+NOuDR+nFQbncmcrP/LkUiB9rdyMo=;
 b=DprOOZrTYQ4WQc+g2QslQttyUkIrRSLyEuZj4z4ePaTKKGtio5x8mi3ZAN270YMMTS
 k7rLXvhZ72vyTg7QO7qEtmZwbzjs8seHW4tjcI2uoPyDsq6T5lJ/Np8Zf4FTAsxYTbMA
 RVXDNyknhtWn3oYmLrUfsCQa8IY4uXmMXdI9PpnJaSbOgKvG4esN/fXdSaE7OY25+JhL
 LnG9OsyyKc9yV/wGiZnPOiMly+gRtBZB/qOIg4FyVtewT6Jl1/alj3EW+gfMqRMY3OUM
 tSiWUFZ+Ghh8oDNzwnbahxTSMfi4UzbFE9Wjx7nL+tsr5hDriI/LTMphp2RJh5w9EvAl
 i+RA==
X-Gm-Message-State: AOAM5315852dfn1uJRR9Qj02+O5kKj+0wh6RUFYwfTxVwuCetYwSkmXb
 Tmar3DPlVzmqxX+wi2VE9SKS2cKKtpzfFIZTrss=
X-Google-Smtp-Source: ABdhPJxVleeEJtegPdDxe9BBPYLeTm6AFksQ9m2w5jgGjjetX1u0Q68qxu7WW6WmOcGqnIbya8F7Z2JxqUQheRkOm90=
X-Received: by 2002:a0c:a98c:: with SMTP id a12mr12844862qvb.43.1611795169840; 
 Wed, 27 Jan 2021 16:52:49 -0800 (PST)
MIME-Version: 1.0
References: <20210126171059.307867-1-clg@kaod.org>
 <20210126171059.307867-7-clg@kaod.org>
In-Reply-To: <20210126171059.307867-7-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 28 Jan 2021 00:52:38 +0000
Message-ID: <CACPK8Xc-zu4SdHeVd5tesdrNvDreJb1sX7_4KzeiEiac-xVzbg@mail.gmail.com>
Subject: Re: [PATCH 6/7] ppc/pnv: Remove default disablement of the PNOR
 contents
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=joel.stan@gmail.com; helo=mail-qv1-xf2c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Jan 2021 at 17:11, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On PowerNV systems, the BMC is in charge of mapping the PNOR contents
> on the LPC FW address space using the HIOMAP protocol. Under QEMU, we
> emulate this behavior and we also add an extra control on the flash
> accesses by letting the HIOMAP command handler decide whether the
> memory region is accessible or not depending on the firmware requests.
>
> However, this behavior is not compatible with hostboot like firmwares
> which need this mapping to be always available. For this reason, the
> PNOR memory region is initially disabled for skiboot mode only.
>
> This is badly placed under the LPC model and requires the use of the
> machine. Since it doesn't add much, simply remove the initial setting.
> The extra control in the HIOMAP command handler will still be performed.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  hw/ppc/pnv_lpc.c | 8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/hw/ppc/pnv_lpc.c b/hw/ppc/pnv_lpc.c
> index 590359022084..11739e397b27 100644
> --- a/hw/ppc/pnv_lpc.c
> +++ b/hw/ppc/pnv_lpc.c
> @@ -825,7 +825,6 @@ ISABus *pnv_lpc_isa_create(PnvLpcController *lpc, boo=
l use_cpld, Error **errp)
>      qemu_irq *irqs;
>      qemu_irq_handler handler;
>      PnvMachineState *pnv =3D PNV_MACHINE(qdev_get_machine());
> -    bool hostboot_mode =3D !!pnv->fw_load_addr;
>
>      /* let isa_bus_new() create its own bridge on SysBus otherwise
>       * devices specified on the command line won't find the bus and
> @@ -856,13 +855,6 @@ ISABus *pnv_lpc_isa_create(PnvLpcController *lpc, bo=
ol use_cpld, Error **errp)
>       */
>      memory_region_add_subregion(&lpc->isa_fw, PNOR_SPI_OFFSET,
>                                  &pnv->pnor->mmio);
> -    /*
> -     * Start disabled. The HIOMAP protocol will activate the mapping
> -     * with HIOMAP_C_CREATE_WRITE_WINDOW
> -     */
> -    if (!hostboot_mode) {
> -        memory_region_set_enabled(&pnv->pnor->mmio, false);
> -    }
>
>      return isa_bus;
>  }
> --
> 2.26.2
>
>

