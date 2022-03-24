Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 286C74E5D58
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 03:48:08 +0100 (CET)
Received: from localhost ([::1]:44310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXDWA-00078I-Pf
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 22:48:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nXDUw-0006Rd-9w
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 22:46:50 -0400
Received: from [2607:f8b0:4864:20::d30] (port=43881
 helo=mail-io1-xd30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nXDUu-0007hB-KF
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 22:46:49 -0400
Received: by mail-io1-xd30.google.com with SMTP id 125so3970438iov.10
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 19:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9M3Hpw1PAnQqgPHDt9yrbF+B9+ePA5kEAy2Gm+w/lPs=;
 b=ShofYqnBAkhmX2zYmIpQ5cSR/wmMYZhWJTTp+M6b+XoaiJZe/gJmXbsdp9jN2XQFEf
 sQi+TAN+8RRNgZBDeshGGhnU+o7c5VNfeaODdtmZnO7XOsuzR90OlVAIuLu16H6BLEKl
 SoTHGPibhzWRmui6x4ew8v4vk0jWbfYcLsHjB+zPTiN1LTzU3W7eCirydg5+zBOShz30
 ps5iUU1S/KJAHQS17NqXp4vGyJuFZ0rzeLyqSNNQiQlTSzAiMbsXec5cHYVHSkEXxYEd
 Ede1DBMc6Owy0BMYaaDhYClStncrz+kfYlrUkaL48ONwId0wUtW4hgx/ZUGt5ojfzuGj
 ysEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9M3Hpw1PAnQqgPHDt9yrbF+B9+ePA5kEAy2Gm+w/lPs=;
 b=hVkv7GhBv8u+IBf4fvBBhVs0NN2psfErK6yYqWoKb/Vz0lBQp+nlHMuKaKmqxSGJYk
 VF3KLDOobRHbgE/ZtM5NQjduiVOFhazni3Sknc7c2XkAM/yp+IXL+829LzEm9bqLE9XU
 H3LcZUHQKg7EfMI3nQwUO7PX0p4E9eO/P9h8EkFVFaTsy+HO+X93SryR2kTdEr6Ru+Fg
 BQwCO/RKpRuZn5PwZ/BV8BPBWq5vwlGTtsiqtELuHkcOm/1WTJT4X1+W5iDeZ/VGxakf
 iM4N3cSfPPod6jeGOO/TrVhkIFRKHICOh9YQ/ldOdDMgTGbm7Aa0AFDva/tN3toAg2Ph
 pcyQ==
X-Gm-Message-State: AOAM530LiBSjnoXj8eyVDnmDA38jv8wyQGy/8IKwY2jnTqK1t05cBO05
 AjyzGQKfOWDBzGvHgwGndfMC53kJr8pK6d5Q1D0=
X-Google-Smtp-Source: ABdhPJzlWH695ai3cUAAFumzUfV6+7LtFcyKwgrYgUzmJRLeOUW+LnNc7Jy7ButTKriBk1mqzarh+HyXmkcVsjd94Ac=
X-Received: by 2002:a05:6602:2c0b:b0:63d:dfb2:9a95 with SMTP id
 w11-20020a0566022c0b00b0063ddfb29a95mr1727103iov.93.1648090006782; Wed, 23
 Mar 2022 19:46:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220323171346.792572-1-ralf.ramsauer@oth-regensburg.de>
 <20220323223150.1600194-1-ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <20220323223150.1600194-1-ralf.ramsauer@oth-regensburg.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 24 Mar 2022 12:46:20 +1000
Message-ID: <CAKmqyKNKTdskDLXMMbLwme0DYnJCjhYde0UQGCfkJAdhqtnFpA@mail.gmail.com>
Subject: Re: [PATCH v2] hw/riscv: virt: Warn the user if -bios is provided
 when using KVM
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd30.google.com
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

On Thu, Mar 24, 2022 at 8:31 AM Ralf Ramsauer
<ralf.ramsauer@oth-regensburg.de> wrote:
>
> The -bios option is silently ignored if used in combination with -enable-kvm.
> The reason is that the machine starts in S-Mode, and the bios typically runs in
> M-Mode.
>
> Warn the user that the bios won't be loaded.
>
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Thanks!

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index da50cbed43..0c477addbc 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1312,6 +1312,10 @@ static void virt_machine_init(MachineState *machine)
>       * when KVM is enabled.
>       */
>      if (kvm_enabled()) {
> +        if (machine->firmware && strcmp(machine->firmware, "none")) {
> +            warn_report("Machine mode firmware is not supported in combination "
> +                        "with KVM. Ignoring -bios.");
> +        }
>          g_free(machine->firmware);
>          machine->firmware = g_strdup("none");
>      }
> --
> 2.35.1
>

