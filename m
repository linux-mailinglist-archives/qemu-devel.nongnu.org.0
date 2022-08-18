Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D09D597D0F
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 06:19:16 +0200 (CEST)
Received: from localhost ([::1]:35950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOWzy-0005aV-P1
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 00:19:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oOWwA-0003eh-TJ; Thu, 18 Aug 2022 00:15:18 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:46649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oOWw9-0006xn-CF; Thu, 18 Aug 2022 00:15:18 -0400
Received: by mail-pg1-x531.google.com with SMTP id d71so345488pgc.13;
 Wed, 17 Aug 2022 21:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=w7GoYBRnrKE92xQ4JzfKsWJPoRL+jsyGzmq0T0ZxZns=;
 b=CPy0iTkbQKWmGK3nwCBWRzRLP6HQLXX0ns3PNC64HoihTNqx8Y78eaItUNETixSMtS
 wmW98B2ZbTtw7oGwiK7StLiLNk+wfSdLuyCE3aGl6SvhakUZgdh2gnR1bYEYMbcXr3kw
 AfnUXotxiUnvqpv27vHGJUvW9oyWz/TIftSzxMiM0NbxXq+LN832tP0Y2APPVagtIQi9
 dQnhWUgo6T45bIogXwM84/H8JDNC8nx1E122HUSz5B35R4fWWTpNKcxUteMvNxwq1PTe
 uQ3gmqDgOsuQKYfoeHTqSd0Y80ZeT0rRW73TW7z46trdP0OyuN+B989iw16z0IhWTupk
 RL1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=w7GoYBRnrKE92xQ4JzfKsWJPoRL+jsyGzmq0T0ZxZns=;
 b=tNhUZ8zt3Uq/MGgU+C0Awl2YgSqOFNgjkcCcfXTj6jNNIigwGEFS7BdUUNI7Igt6Kj
 kjniKwyLcYtVov+T0ZyqWkd+P34xhwQS6xpSggU+l+KsXvFV6KCH1/MSUb7/NAv5c02O
 4nV/95B6qKWznI33aTEJt5sZYz+GshSrkb73yxdGedgdxBdCSRpcenpuV7h6Umi3LmEp
 iU1DKlW6hIbZ77GihL8YCaDDmd7WZptGknjHGdDmzgVkI5abk09JGvYsoRiXOryGvsG9
 ag983ebMDIE9bXXwwZ+1Saik9KYKwaiai+tG3zQkJBSPGfbXdN9oqpvQtzfwVibpceif
 Dgpw==
X-Gm-Message-State: ACgBeo1Nq6vEU/LThnbuKZVdNq0V7LVO6RIhiH2h3Y3PJTQg4aJU8r5r
 svZ21sEDjt8+L24veqh3B+eHeb5IEWyB57o9y28=
X-Google-Smtp-Source: AA6agR5djN2ApQJDtm3KPXGhNNlV06xHVenPTO8hL7vAtykb051QLbbBlLaCZbvtmzoTGdR/CgezbBEVRPcZgr1r6kc=
X-Received: by 2002:a05:6a00:88e:b0:52c:65a3:fdb4 with SMTP id
 q14-20020a056a00088e00b0052c65a3fdb4mr1211611pfj.83.1660796115351; Wed, 17
 Aug 2022 21:15:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220816045408.1231135-1-rpathak@ventanamicro.com>
In-Reply-To: <20220816045408.1231135-1-rpathak@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 18 Aug 2022 14:14:49 +1000
Message-ID: <CAKmqyKM7ZtQAFz=9SJ0bzwVVxmOCS-w0fT=+xWS3HAJVuX-C9Q@mail.gmail.com>
Subject: Re: [PATCH v1] target/riscv: Add xicondops in ISA entry
To: Rahul Pathak <rpathak@ventanamicro.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Anup Patel <anup@brainfault.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x531.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 16, 2022 at 2:54 PM Rahul Pathak <rpathak@ventanamicro.com> wrote:
>
> XVentanaCondOps is Ventana custom extension. Add
> its extension entry in the ISA Ext array
>
> Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
> This patch is based on branch riscv-to-apply.next (Alistair qemu tree)
> Based on top commit: f2a91d8b78
>
>  target/riscv/cpu.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 2498b93105..27d10bd6a6 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -104,6 +104,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
>      ISA_EXT_DATA_ENTRY(svinval, true, PRIV_VERSION_1_12_0, ext_svinval),
>      ISA_EXT_DATA_ENTRY(svnapot, true, PRIV_VERSION_1_12_0, ext_svnapot),
>      ISA_EXT_DATA_ENTRY(svpbmt, true, PRIV_VERSION_1_12_0, ext_svpbmt),
> +    ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VERSION_1_12_0, ext_XVentanaCondOps),
>  };
>
>  static bool isa_ext_is_enabled(RISCVCPU *cpu,
> --
> 2.34.1
>
>

