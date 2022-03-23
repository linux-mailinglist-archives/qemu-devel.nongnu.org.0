Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4EC4E5A6B
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 22:07:46 +0100 (CET)
Received: from localhost ([::1]:33194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX8Cm-0007O4-Qk
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 17:07:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nX8Ai-0006b5-3n
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 17:05:36 -0400
Received: from [2607:f8b0:4864:20::129] (port=33323
 helo=mail-il1-x129.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nX8Ag-0000k4-2O
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 17:05:35 -0400
Received: by mail-il1-x129.google.com with SMTP id i1so1925182ila.0
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 14:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=94RI7Z4U7n9/rl3ingrhG3jpTC3aQxwOC+7fQ4PZDBA=;
 b=ks1zdQzBESFPclRvgk2Jpt5lT/avPeq2ZPM/gKjQ+7Hp7aS7PT6wrgYybbYjCGZmKA
 itZVBeSLE9GyXhI//JOlc+bGKxzvMdDkujRXqAdJ/rCDatw7XOV58ZHX7FIn5fMJVxcj
 PMgufrrnDLu/wOMFWHiKpSPBfiu/RXMcluSf0ilinSeAqRgYmG0u9NXEZYJ67Fe1yQNm
 V/uXjXL5w0nLiBt10iWr4/0/AkGHuBrb4M7e7g/mQdF4LIgbsGD8DDtb+NRdSF3SH9Yd
 yMTjWD1Rxh/VQDeQBr4KqJzmEAsC2sDjBS9o+NQvVtHLT72wxuPblQaSH5/MqdhQob48
 Nelw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=94RI7Z4U7n9/rl3ingrhG3jpTC3aQxwOC+7fQ4PZDBA=;
 b=M9k6jQXxBF/Ht92KoR7EmE8/uCmsk9G9Xsy/hjV5u88Gj3JEOnghSTjdbeusUAacZb
 jkrGrob5ZgwwS4idp3jy2tVj3Pe84yJm/yarv3S3BNI8RuceIQw5+oy1sEtKx9vZsTuv
 SRpi9Wpxa4aUakmL0wryDTWziiQftyoXBs0w20QSpeIoAlAX8g5agQq+9+6qzHhgqH8x
 aaH+RhYTPnB9eqZdhqHARBwE9oT4+kyaLCIDC2ib7/I72m1pmfzHM8tJ1q8P4YoxxMTS
 2n/Yb4LlIfDCixNPCI8I52tcXhDqtajJveTIlFRlsdXP1zqA8CN4O0CC2muIbCcgTEG6
 JrnA==
X-Gm-Message-State: AOAM5321PBbVV3PeGqUj1SnAsa4ayE2gwcbJnE0l6bhQ8pAvef++PGhN
 Tu6sP4SXtMt4FhclFAgNxdpsF/ir3rPGBIHnUJCC5A1E5CPo62Ai
X-Google-Smtp-Source: ABdhPJxED3qsEo280G/KszdiZ8NBElGvpCxiv6tWcEwiw7tDG0XnIyG6zWBAKXrJK6LffdpHhcFpZMJMBPVIGeqHL3s=
X-Received: by 2002:a05:6e02:20ec:b0:2c6:158a:cb33 with SMTP id
 q12-20020a056e0220ec00b002c6158acb33mr1000658ilv.113.1648069532490; Wed, 23
 Mar 2022 14:05:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220323171346.792572-1-ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <20220323171346.792572-1-ralf.ramsauer@oth-regensburg.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 24 Mar 2022 07:05:06 +1000
Message-ID: <CAKmqyKP8Nf5X7-X8Y+-xdczn2nauzhh1GEwj77_S6GFTMGmPTQ@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: virt: Warn the user if -bios is provided when
 using KVM
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::129
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::129;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x129.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 Peter Maydell <peter.maydell@linaro.org>, Anup Patel <anup@brainfault.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Stefan Huber <stefan.huber@oth-regensburg.de>,
 Jiangyifei <jiangyifei@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 24, 2022 at 3:13 AM Ralf Ramsauer
<ralf.ramsauer@oth-regensburg.de> wrote:
>
> The -bios option is silently ignored if used in combination with -enable-kvm.
> The reason is that the machine starts in S-Mode, and the bios typically runs in
> M-Mode.
>
> Warn the user that the bios won't be loaded.
>
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Thanks for the patch.

> ---
>  hw/riscv/virt.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 4496a15346..a4d13114ee 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1312,6 +1312,9 @@ static void virt_machine_init(MachineState *machine)
>       * when KVM is enabled.
>       */
>      if (kvm_enabled()) {
> +        if (machine->firmware && strcmp(machine->firmware, "none"))

You need curly braces around the if statement. You can run checkpatch
on the patch to catch issues like this with:

git show | ./scripts/checkpatch.pl -

> +            warn_report("BIOS is not supported in combination with KVM. "
> +                        "Ignoring BIOS.");

Maybe say

"Machine mode firmware is not supported in combination with KVM. Ignoring -bios"

Alistair

>          g_free(machine->firmware);
>          machine->firmware = g_strdup("none");
>      }
> --
> 2.32.0
>

