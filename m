Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1115F380242
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 05:05:34 +0200 (CEST)
Received: from localhost ([::1]:40528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhO8r-0002s0-1p
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 23:05:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lhO6a-0001f8-HR; Thu, 13 May 2021 23:03:12 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:42923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lhO6W-0003tm-P3; Thu, 13 May 2021 23:03:11 -0400
Received: by mail-yb1-xb29.google.com with SMTP id r8so37211680ybb.9;
 Thu, 13 May 2021 20:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=F42KtqwgpoYxl74o77eSqJhQ2U7nTSaw4gxVD7Wh6N4=;
 b=m29UIZpszaH7sy32d5DEAM4U9O1Bm8QFtDQwBIsk4UWKIFd1kJBlj1zkF7Xt0eD7JA
 B3+Sh+YjK8N2+90pTZm0hIRscLkHbTMsTmQk6h9F0zy30tlxVgo9+AcrmmLF4D19dQLQ
 HUR/ikvSFBjE070/xkDElmp+TQu4u1xkKpPRJbQxSduw1Gbzk07/WezKHPFUgsPv3mJs
 wmsv2NWGpdYp+VzbfpcMKjzIXnC1QRQViWU9k+ekk8Sgm9PjxlbzLHFA2n2Gu5Y0b3td
 9+DzEG0LCMS6f+j4oolz5X4IfWGM+AfBKFET0Y5ub/p1tHgJttD+IbFBfH005hWkMRSi
 w6cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=F42KtqwgpoYxl74o77eSqJhQ2U7nTSaw4gxVD7Wh6N4=;
 b=PZPiPflTJ54QyKcad5V7FnHxI/891a3hMULLuuC/lYA+oZr/jkfC6sPQtfThez8aTo
 yUaY+629kbB+JEas2SZ1QkvFemhe2eezJnvGrU6Qwq0Wi+RWC/mv93J85fYpyC48Ar4D
 of3ADnZyt+WU6TP+F6BEWK6DxWwHrgaYdMsJy+QYflhVnEJPl5UCpHx29EOrb48OB22f
 FLngW0GqgqPbTi0BU98DibRvTg5z5KzAR86hh9tdD8itZzVEARSP0IOegfl7IHeGZJZg
 PVskD0ZqKbd4fz3JuNv/1laKsUkYVd55W7/yYN7xyjtGClJ3roKM5zErylRUvDBoY1jG
 l1Mg==
X-Gm-Message-State: AOAM532V+98XxmgjF66I6sYn2bawu3to+yMhJFsG2t5xyeXp+PDQOKaS
 Xk/L4cTJVSrc95PO4/GkpMYegLyA5ZdEiSUgBqo=
X-Google-Smtp-Source: ABdhPJw024lW5+C70MThJwQ1BHbeJZuubBKYyZeUqpLBI2RqOagG8Mh8UCJ0Yk9TABDwoYMCrM3kpA5P9wqDCMBPpu8=
X-Received: by 2002:a25:be09:: with SMTP id h9mr63741013ybk.239.1620961385880; 
 Thu, 13 May 2021 20:03:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210513163858.3928976-1-philmd@redhat.com>
 <20210513163858.3928976-2-philmd@redhat.com>
In-Reply-To: <20210513163858.3928976-2-philmd@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 14 May 2021 11:02:54 +0800
Message-ID: <CAEUhbmW0h+kvTyrDjum8pVmm9sjn9mkTf-bLRRJqf-ocs1mgqg@mail.gmail.com>
Subject: Re: [PATCH 01/10] hw/mem/nvdimm: Use Kconfig 'imply' instead of
 'depends on'
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb29.google.com
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
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 14, 2021 at 12:53 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Per the kconfig.rst:
>
>   A device should be listed [...] ``imply`` if (depending on
>   the QEMU command line) the board may or  may not be started
>   without it.
>
> This is the case with the NVDIMM device (it is certainly possible
> to start a machine without NVDIMM) , so use the 'imply' weak
> reverse dependency to select the symbol.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  default-configs/devices/ppc64-softmmu.mak | 1 -
>  hw/arm/Kconfig                            | 1 +
>  hw/i386/Kconfig                           | 1 +
>  hw/mem/Kconfig                            | 2 --
>  hw/ppc/Kconfig                            | 1 +
>  5 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/default-configs/devices/ppc64-softmmu.mak b/default-configs/=
devices/ppc64-softmmu.mak
> index ae0841fa3a1..cca52665d90 100644
> --- a/default-configs/devices/ppc64-softmmu.mak
> +++ b/default-configs/devices/ppc64-softmmu.mak
> @@ -8,4 +8,3 @@ CONFIG_POWERNV=3Dy
>
>  # For pSeries
>  CONFIG_PSERIES=3Dy
> -CONFIG_NVDIMM=3Dy

I think only removing this one makes sense. I fail to see any
difference of other changes in this patch.

> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index b887f6a5b17..67723d9ea6a 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -6,6 +6,7 @@ config ARM_VIRT
>      imply VFIO_PLATFORM
>      imply VFIO_XGMAC
>      imply TPM_TIS_SYSBUS
> +    imply NVDIMM
>      select ARM_GIC
>      select ACPI
>      select ARM_SMMUV3
> diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
> index 7f91f30877f..66838fa397b 100644
> --- a/hw/i386/Kconfig
> +++ b/hw/i386/Kconfig
> @@ -23,6 +23,7 @@ config PC
>      imply TPM_TIS_ISA
>      imply VGA_PCI
>      imply VIRTIO_VGA
> +    imply NVDIMM
>      select FDC
>      select I8259
>      select I8254
> diff --git a/hw/mem/Kconfig b/hw/mem/Kconfig
> index a0ef2cf648e..8b19fdc49f1 100644
> --- a/hw/mem/Kconfig
> +++ b/hw/mem/Kconfig
> @@ -7,6 +7,4 @@ config MEM_DEVICE
>
>  config NVDIMM
>      bool
> -    default y
> -    depends on (PC || PSERIES || ARM_VIRT)
>      select MEM_DEVICE
> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> index e51e0e5e5ac..66e0b15d9ef 100644
> --- a/hw/ppc/Kconfig
> +++ b/hw/ppc/Kconfig
> @@ -3,6 +3,7 @@ config PSERIES
>      imply PCI_DEVICES
>      imply TEST_DEVICES
>      imply VIRTIO_VGA
> +    imply NVDIMM
>      select DIMM
>      select PCI
>      select SPAPR_VSCSI

Regards,
Bin

