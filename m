Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E545E6294
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 14:38:52 +0200 (CEST)
Received: from localhost ([::1]:40732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obLTf-0005gu-5L
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 08:38:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obK41-00074D-Rx; Thu, 22 Sep 2022 07:08:25 -0400
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34]:43569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obK3z-0005rV-BE; Thu, 22 Sep 2022 07:08:17 -0400
Received: by mail-oo1-xc34.google.com with SMTP id
 a1-20020a4ab101000000b0044acf001f83so1344251ooo.10; 
 Thu, 22 Sep 2022 04:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=w+XXOLaHxHOxpz0JARs4PKfqxrDsKmIdsfyADw94ul0=;
 b=pdAJRTEjZ2fCo0VfOvyXvOSjMebwDkkm6+3YMkmBzvU5cyT5nEmeLxTHNzZOXqlsWu
 nSx4cHuVITjl7mJM98tdRhnGSEo/gRIg8teGTxEV0LdtOJskMSC/ZIGwQwXDMjlfzuNF
 3JXxwWfowkxhBvFdz5LKJ9nifSk7mQUtU+GFY54Km37i0kPoL5qau2pBF64KBcIjCMLN
 CSjzMvajDFAu4Xdz5MqmstC0/qchIERQTl6D320ndY+kr8Dq9J95k1shkEEWR+dQjLyO
 /hXn9ovis0/uKTPtsAASYxegiBOgCmkfN9JGV3X8M4tq7hwMaEXMzcQuSA8pz8XRa4zM
 Af6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=w+XXOLaHxHOxpz0JARs4PKfqxrDsKmIdsfyADw94ul0=;
 b=pb8OWyUjCJ2ql4elqdZq4v+OM6nsvnkSs0dGAOxgqfej5/NZelvFx7V0TFvxdNQH9d
 bu1wDe1qAWQkrX18L4vqxdJvFf7Cj6J4vSRotbcQQb32EQGWnBCwmECJt+O6ZBBXlaiZ
 bQA6t13XvA6rCAGTHp7cjJBD6WhCAUU+XYykaLonFOlh/0M4V6s8OUO8eaSHf6OtbE/P
 q9I16xihwY89gCIAQ91C0SGBXPmh1PYV3q6b5KDF8xyjzxRMQVU9ae2ZEx2YlSo4cdxg
 KDjbtpEEUoQBfZuqZzaZlwMxp3M7qY2p81/CG8XzcfDd1+1vzLMT2uzXx7bp5JjY69DF
 7PhA==
X-Gm-Message-State: ACrzQf3w2zzymhaq9N4+8uLCwk5Yoh1Jy7Ink12K/HHRg7cz8QQ9syhs
 Fh4T/FfW2EDd6MHYClPIbYo=
X-Google-Smtp-Source: AMsMyM6f3Htl1d5pLOUkPgacXFCzZhWTDbfA4+RJM4m5uDGriH7jTTSKvg3LfQqShV4XItZlHSoG9A==
X-Received: by 2002:a4a:1ac1:0:b0:475:f7da:ab98 with SMTP id
 184-20020a4a1ac1000000b00475f7daab98mr1086859oof.88.1663844893323; 
 Thu, 22 Sep 2022 04:08:13 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 c36-20020a05687047a400b0011dca1bd2cdsm3386924oaq.0.2022.09.22.04.08.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 04:08:12 -0700 (PDT)
Message-ID: <d9ac460f-ccb1-c03b-ad8d-71c79dd6e65b@amsat.org>
Date: Thu, 22 Sep 2022 13:08:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v7 00/14] QMP/HMP: introduce 'dumpdtb'
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org
References: <20220908194040.518400-1-danielhb413@gmail.com>
In-Reply-To: <20220908194040.518400-1-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c34;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oo1-xc34.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.893,
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

Hi Daniel,

On 8/9/22 21:40, Daniel Henrique Barboza wrote:
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


- What about the MIPS Boston machine?

- We need to free ms->fdt in machine_finalize().

