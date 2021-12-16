Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC04476A2E
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 07:02:18 +0100 (CET)
Received: from localhost ([::1]:49026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxjqM-0007H3-0Y
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 01:02:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mxjmc-0004fd-Lr
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 00:58:26 -0500
Received: from [2a00:1450:4864:20::433] (port=37636
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mxjmb-0001d5-5d
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 00:58:26 -0500
Received: by mail-wr1-x433.google.com with SMTP id t26so5731607wrb.4
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 21:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c41tIVzFGawss7XCLy1uCOAjcGULbVDr63K0n2a/lLA=;
 b=kyYT30lIkEsHNo7u+0kP0B73+gZN+Jm9sdZQgDmpAwDA4WqcOJGKfdbVfNr++HpvmV
 DOJs1XRso+fWMENSDOJLqvDr8tsHLw2Q4XLLysLHoV5d4n6s5wslRDBMWO48o1VEVyZ7
 l+5pOOehZOC7TxietPZ8MDfPOjNwcdQpCwH/qMZTxYzOiibv4z6poEnMTIuMvzgSXrRL
 Qv9GUqh8EYvYBqnG2tPOPJr1c+Y7K7KxikL1uKShPCa3D9UeqzAYvemYgjkA4GH8eqvy
 fULzB13SWjTSYZwLasC7LEk3WwVO1T3zKokq8a8jPUTqbdFhXw6ErUsljnRgttLTQm7y
 Av+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c41tIVzFGawss7XCLy1uCOAjcGULbVDr63K0n2a/lLA=;
 b=vTHY0MRGfDoEbHQ7A6+blG/AlWfcFaGWt0tG+kOlO7CVpgbRbAKc2IyTV7B8cjh8AU
 imoMMeGXHFtM27apRz4ScldOGlDBlVH4GNVL+OrwAKon1rTogDb6yACxVmdwknGfu/OA
 XE511PRlKLWKavjoqPmHOTyv07rYtxe4LMWamKtqHKZkbxEE37krxnVgjbVpkD9KO5QX
 FCWUcC32dWBGc0zkX2gcvvue8154einMnE/qoWhmYSGih6/wyXA8UKD54NS6rC/Zuldl
 BhDr5QGhY4/oXPuRRkL+/p/tpvH+AnG5MCcqjEqGMHzSMO9nlGOYBFGxmeP2xCOj5Zda
 ftcg==
X-Gm-Message-State: AOAM530Khw7f9qYHHW+Y+aMwrhzVfF7j5wZZlB6VRKOEE8aKkODVlOHN
 rtyOwPLZq+pE+aQ42RBnUA6IVXSFo3KoLmBCBEBTVA==
X-Google-Smtp-Source: ABdhPJwp/JdTsQ3mhO24aoDz5XPnnu9mWGISR79rEFe/3UtQFHrNNXgowXOg9oTzTazS7SkylrsDiMoJ71tiMXog2ms=
X-Received: by 2002:adf:d1e2:: with SMTP id g2mr7415987wrd.346.1639634303827; 
 Wed, 15 Dec 2021 21:58:23 -0800 (PST)
MIME-Version: 1.0
References: <20211216045427.757779-1-alistair.francis@opensource.wdc.com>
 <20211216045427.757779-9-alistair.francis@opensource.wdc.com>
In-Reply-To: <20211216045427.757779-9-alistair.francis@opensource.wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 16 Dec 2021 11:28:12 +0530
Message-ID: <CAAhSdy0ruRoGvxby2Y44NwSmtPWyGqO03es-W4fegmcWa0mxJw@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] hw/riscv: virt: Allow support for 32 cores
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::433;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Alistair Francis <alistair23@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 16, 2021 at 10:27 AM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Linux supports up to 32 cores for both 32-bit and 64-bit RISC-V, so
> let's set that as the maximum for the virt board.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/435
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Overall, no issues with this patch. I have added PATCH23 in
the AIA v5 series which allows upto 512 CPUs . This is a hard
limit based on address space based on PLIC, ACLINT, IMSIC,
and APLIC address utilization and is also suitable for both RV32
and RV64.

IMO, we should keep QEMU VIRT_CPUS_MAX as high as
possible to allow any kind of software Linux, OpenSBI, FreeBSD,
Xvisor, Xen, etc. Let the guest software decide it's own limit (such
as NR_CPUS of Linux).

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Regards,
Anup

> ---
>  include/hw/riscv/virt.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index b8ef99f348..6e9f61ccd9 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -24,7 +24,7 @@
>  #include "hw/block/flash.h"
>  #include "qom/object.h"
>
> -#define VIRT_CPUS_MAX 8
> +#define VIRT_CPUS_MAX 32
>  #define VIRT_SOCKETS_MAX 8
>
>  #define TYPE_RISCV_VIRT_MACHINE MACHINE_TYPE_NAME("virt")
> --
> 2.31.1
>
>

