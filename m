Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DE55E5F55
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 12:07:03 +0200 (CEST)
Received: from localhost ([::1]:40568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obJ6j-00076M-To
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 06:07:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1obIhI-0004lF-Sa; Thu, 22 Sep 2022 05:40:45 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:33491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1obIhG-0002Iw-79; Thu, 22 Sep 2022 05:40:44 -0400
Received: by mail-oi1-x229.google.com with SMTP id j188so11709481oih.0;
 Thu, 22 Sep 2022 02:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=7i42X+iTR+coSw+6qVyASJQU122NLoL3hYbJcw8rL/Q=;
 b=BOx1c6+4NNmPorZ9654YvC+PIXzICQUFsoJonTD5ZqBO4UIqNX8buDDKfDVNTDpY1E
 lihwMkIU0hp7T5LNvYT45uBNQZFOJESE3ZftZxMB7bU4eO7IALYoa2PjFc02Jzc9zmnq
 MnBXrCiF6jua7Fau0xLInpNuQ0UCvvqW5i9Ypj7QPuavC7Zd9Zl1nRNK5d087t3wuLOY
 QkzQwDB0Mmm1qCOvzjXxPZCNWAqOGUzrPowj8vkqQ0Y7SGnHFa/LCvvthCTtU3PXmf5N
 YmItWRUvlaosLHjEmG6GPW3zl5KpBA1XVb8gpkjU8mvwqzwy2BZVZKLhRQJEurb5F8ZL
 h6Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=7i42X+iTR+coSw+6qVyASJQU122NLoL3hYbJcw8rL/Q=;
 b=r81UWOceQWkrUQB2Z0vjdzrPGqkpEvkv9ElyRxG2lYNBgae4mTRIZYWPwd54S1KcMH
 0GsSo2OFLubGQcWUL2mR+ZonDQu89Yxtr/JtIJaDgQLd60MNQLYPGLbZ22L0AF+g5L6A
 WjGGVvYPbZVkwHqlpjuip77a+l4AJpBiE0R9NbOj3nUMwpVt7rK740Yci+mpyXp6Khed
 pF7EqMm55+29DCYRSfVBlbvwJe5aqOkMwACim8u+dcu6ulfBdNlHgY2MfjGfQ+1A1NSV
 uKvCnr0sCdA6FAd0FjWrCmt2n803W8G3U4iG21WZLenSgWZIidFSdgNgpuZZ/cL943ez
 RXHw==
X-Gm-Message-State: ACrzQf38E3s5Ieuq7u9i2rZ9dRxELzjziVQ2UUoo3IW08YWOO1fHGQFq
 5qAzCpzdwqTSu07CJ84GuRIiGjvebJ4=
X-Google-Smtp-Source: AMsMyM6wcz7wSsfb7sA00FyHcFV/k8tQ76/NdVwn9F38SHLpf3WVXORNtD/mYg7HlIvST4Q4z/2H0A==
X-Received: by 2002:a05:6808:15a2:b0:350:4f5c:1440 with SMTP id
 t34-20020a05680815a200b003504f5c1440mr6154421oiw.129.1663839639779; 
 Thu, 22 Sep 2022 02:40:39 -0700 (PDT)
Received: from [192.168.10.102] ([191.193.2.69])
 by smtp.gmail.com with ESMTPSA id
 q128-20020acad986000000b003458d346a60sm2208050oig.25.2022.09.22.02.40.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 02:40:39 -0700 (PDT)
Message-ID: <b1d5de4f-ce23-33af-573d-5cce960e7c13@gmail.com>
Date: Thu, 22 Sep 2022 06:40:36 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v7 00/14] QMP/HMP: introduce 'dumpdtb'
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org
References: <20220908194040.518400-1-danielhb413@gmail.com>
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220908194040.518400-1-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x229.google.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-3.702,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Ping

We're missing just patch 14/14. I'll leave non-acked patches behind and, if
no one is strongly against it, I'll push both the dumpdtb implementation and
the ppc parts via the ppc tree.

Alistair, I can also push the riscv bits through the ppc tree if it's easier
for you.


Thanks,

Daniel

On 9/8/22 16:40, Daniel Henrique Barboza wrote:
> Hi,
> 
> This new version implements all change requests from the v6.
> 
> - patch 5:
>    - change bamboo_load_device_tree() to use a MachineState pointer
> - patch 7:
>    - change xilinx_load_device_tree() to use a MachineState pointer
> - patch 14:
>    - placed SRST/ERST below the { }'s
>    - removed the '/tmp' reference in the command example
>    - removed all 'Requires libfdt' references
>    - changed qmp_dumpdtb() missing FDT error message to "This machine
>      doesn't have a FDT"
> - v6 link: https://lists.gnu.org/archive/html/qemu-devel/2022-09/msg00534.html
> 
> Daniel Henrique Barboza (14):
>    hw/arm: do not free machine->fdt in arm_load_dtb()
>    hw/microblaze: set machine->fdt in microblaze_load_dtb()
>    hw/nios2: set machine->fdt in nios2_load_dtb()
>    hw/ppc: set machine->fdt in ppce500_load_device_tree()
>    hw/ppc: set machine->fdt in bamboo_load_device_tree()
>    hw/ppc: set machine->fdt in sam460ex_load_device_tree()
>    hw/ppc: set machine->fdt in xilinx_load_device_tree()
>    hw/ppc: set machine->fdt in pegasos2_machine_reset()
>    hw/ppc: set machine->fdt in pnv_reset()
>    hw/ppc: set machine->fdt in spapr machine
>    hw/riscv: set machine->fdt in sifive_u_machine_init()
>    hw/riscv: set machine->fdt in spike_board_init()
>    hw/xtensa: set machine->fdt in xtfpga_init()
>    qmp/hmp, device_tree.c: introduce dumpdtb
> 
>   hmp-commands.hx              | 15 +++++++++++++++
>   hw/arm/boot.c                |  3 ++-
>   hw/microblaze/boot.c         |  8 +++++++-
>   hw/microblaze/meson.build    |  2 +-
>   hw/nios2/boot.c              |  8 +++++++-
>   hw/nios2/meson.build         |  2 +-
>   hw/ppc/e500.c                | 13 ++++++++++++-
>   hw/ppc/pegasos2.c            |  4 ++++
>   hw/ppc/pnv.c                 |  8 +++++++-
>   hw/ppc/ppc440_bamboo.c       | 25 ++++++++++++++-----------
>   hw/ppc/sam460ex.c            | 21 +++++++++++----------
>   hw/ppc/spapr.c               |  3 +++
>   hw/ppc/spapr_hcall.c         |  8 ++++++++
>   hw/ppc/virtex_ml507.c        | 25 ++++++++++++++-----------
>   hw/riscv/sifive_u.c          |  3 +++
>   hw/riscv/spike.c             |  6 ++++++
>   hw/xtensa/meson.build        |  2 +-
>   hw/xtensa/xtfpga.c           |  6 +++++-
>   include/sysemu/device_tree.h |  1 +
>   monitor/misc.c               |  1 +
>   qapi/machine.json            | 18 ++++++++++++++++++
>   softmmu/device_tree.c        | 31 +++++++++++++++++++++++++++++++
>   22 files changed, 172 insertions(+), 41 deletions(-)
> 

