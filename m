Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C38494FCCD3
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 05:03:44 +0200 (CEST)
Received: from localhost ([::1]:37614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ne6oh-0005B1-EY
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 23:03:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1ne6n1-0004P5-R3
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 23:02:00 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:34515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1ne6my-0001MG-Kk
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 23:01:59 -0400
Received: by mail-wr1-x434.google.com with SMTP id c10so4614434wrb.1
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 20:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7gBXSIcbGlxuz2yagfct0kHA/bo3LZbpVETaOaZOnEY=;
 b=F2FjOT47A9tESbL8RPE7QuewcgMDHuJvXNW0lyUsLp8ovXl22gWJGooj0XIVPCGi2M
 uk+q3iLGFL2xd9aTplasnm6jjuAuCy0t98fRzQtIxGdZl97sIW4QTHPDUFUKi8n24eeE
 zHQBltP+F/btG72PRzgnNNPQNJy3HjQV/+mt9NrNoDM38MO909FtuTvvBogUYWnr3gb8
 Nxfa7RiTx/7o8vDwOErPZyQgEnCX1Y7ARMYMk6muc2pna/2AsfA4kaGQHRJQFdHi4vBa
 QUJ8a9s1hz6n7uItjJQu6kBOBOkl2t+8W9qXdpV4Gi7GEttsrqhHPGT1zni1fsJ3BU7F
 m0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7gBXSIcbGlxuz2yagfct0kHA/bo3LZbpVETaOaZOnEY=;
 b=hbptAEYBqs0jCFAp1zRB14SjzGtS6ojXQc+ZOxMVAx48F/9Znmy18dKiDFy6t40fK1
 DTjg12cv9v/PUJrffoMfCwk+0h73jjcu0MpQGP+FgwO4EdtYoTYu/XZN3v4CyytDGzWX
 TpNCnWG7M/SJVw+QAt9U37rRdGSjoisflVJKvYiFSXDxduQ0WzRwRru2ZzzgFhATwTXQ
 86QfakZM/38IzYcnfHejVCyuxLL7zn7aXN/Jk4mrjUjVNUw4NZJ4uVrth9osGZfwXAo0
 6F2/n7BYEYFSpccgtlsjj065rH3DNLSHYzjcOZgJnMyS27badwrVtXkTmI/VuNeN8VMU
 p7RA==
X-Gm-Message-State: AOAM532gFzLmOLB6uCQ91h0NBO/EaLmVi5Lz9SXCyvWt+BxS5YatCMza
 SEltb6MFG4zze2nU2mzuzAiBtWODhmMCl8+c6tdgqA==
X-Google-Smtp-Source: ABdhPJzPOaRtG1bWBrWtCsjfrxx4DZEjYwt0aj/JozyeM8G2axKwZBr04Em5yOV7ImddbJd6NRt4uqXhME2OCnsUONE=
X-Received: by 2002:adf:db86:0:b0:205:bccf:8cbf with SMTP id
 u6-20020adfdb86000000b00205bccf8cbfmr26523543wri.346.1649732512104; Mon, 11
 Apr 2022 20:01:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220401121842.2791796-1-ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <20220401121842.2791796-1-ralf.ramsauer@oth-regensburg.de>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 12 Apr 2022 08:31:39 +0530
Message-ID: <CAAhSdy0GnLVSaZCXsByQQruqmjQxExd=zw4hX2fV_wGmwOQkRw@mail.gmail.com>
Subject: Re: [PATCH v3] hw/riscv: virt: Exit if the user provided -bios in
 combination with KVM
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::434;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Anup Patel <apatel@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Stefan Huber <stefan.huber@oth-regensburg.de>,
 Alistair Francis <alistair23@gmail.com>, Jiangyifei <jiangyifei@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 1, 2022 at 5:48 PM Ralf Ramsauer
<ralf.ramsauer@oth-regensburg.de> wrote:
>
> The -bios option is silently ignored if used in combination with -enable-kvm.
> The reason is that the machine starts in S-Mode, and the bios typically runs in
> M-Mode.
>
> Better exit in that case to not confuse the user.
>
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  hw/riscv/virt.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index da50cbed43..09609c96e8 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1308,12 +1308,18 @@ static void virt_machine_init(MachineState *machine)
>
>      /*
>       * Only direct boot kernel is currently supported for KVM VM,
> -     * so the "-bios" parameter is ignored and treated like "-bios none"
> -     * when KVM is enabled.
> +     * so the "-bios" parameter is not supported when KVM is enabled.
>       */
>      if (kvm_enabled()) {
> -        g_free(machine->firmware);
> -        machine->firmware = g_strdup("none");
> +        if (machine->firmware) {
> +            if (strcmp(machine->firmware, "none")) {
> +                error_report("Machine mode firmware is not supported in "
> +                             "combination with KVM.");
> +                exit(1);
> +            }
> +        } else {
> +            machine->firmware = g_strdup("none");
> +        }
>      }
>
>      if (riscv_is_32bit(&s->soc[0])) {
> --
> 2.32.0
>

