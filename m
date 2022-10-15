Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F935FF9FD
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Oct 2022 14:11:47 +0200 (CEST)
Received: from localhost ([::1]:43886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojg14-0000Z0-II
	for lists+qemu-devel@lfdr.de; Sat, 15 Oct 2022 08:11:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ojfvc-00035r-5a
 for qemu-devel@nongnu.org; Sat, 15 Oct 2022 08:06:08 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a]:39462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ojfva-0007FJ-DF
 for qemu-devel@nongnu.org; Sat, 15 Oct 2022 08:06:07 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1322fa1cf6fso8753659fac.6
 for <qemu-devel@nongnu.org>; Sat, 15 Oct 2022 05:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0zV9Ty63qM9xxqaXJwuKop8QULYlN3bWP/qUUsWMXGI=;
 b=LUFMFm3jy3ydOxDhRNdVZvW+pzQ3nmg8EnI7LBvEnmgc1Wkw+F+BTtGtQ1yGCfkNCU
 2FGTlN1bMoxTPwzpmZdr3W1RuLbf3Ck1I2WiUi3ycxfJF5SuRRbBuAobcd92EtU5mr5I
 axEEGAYswdcWMiq4OfoESHpNYXgdfetNO9oYofwtavwObGB1hB8BZ0qLeEx98BwPkv/6
 A5b6qPTqLO6x+tHiDEkA4nEndIpU28PipCPi8S54bOSQrb8QWKW3uLwoy2hf6EDom0Yu
 Wuv1nsEev4/SXjQGpkIT+jqIJbe5I8ZClPKYgQMuYwaOfIo92Ygd2TvDof+GaWsZzPZk
 O/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0zV9Ty63qM9xxqaXJwuKop8QULYlN3bWP/qUUsWMXGI=;
 b=L3N6yhtkmMc1HpGarZEBslqFU2Y7goa7KCb2oMXET/UfAVQ3+JkbX9Kvl/XMdneveL
 VHbs/Yt7sGSyvJoK/2ed+MSR2z3Bh/5Rdl2g+911QEY8pZf91YymymoWaNIz1HI4D/qG
 eQO8A3xotkQ01JMYzCn6EDjJdL9YpmJmh4him1w9nx2o2hfVvkmO3Xau76sB7P9hN1Ue
 Zi/sz4pbenNf4rd8IFGRWJEJwYPfUFyelIB97nImRx8HHKNQh1yUY7x2NILRTRwex7Sa
 bzzvD2IBcUl/mnuoL/K8QEFxMRBQSMF/iHrx/JV9z69/5+vQUjVletE88SbxgheYzNfv
 aKyw==
X-Gm-Message-State: ACrzQf13FNSUqilwXgqubtO9tB0mivZwZi6ea8N7URdTOlCH/S/SbpzF
 fmHuL/C9IiV2Uf9mcJJ9b+kAAGGhwfQ=
X-Google-Smtp-Source: AMsMyM6R/J9e9PT3LQIxELPn3H4G7o1U3vraKuJvCSsbU1QNe0H6q8bUfxtukd0EyXMsweX4wWlR3Q==
X-Received: by 2002:a05:6870:e750:b0:132:9b8a:7b1e with SMTP id
 t16-20020a056870e75000b001329b8a7b1emr1219665oak.67.1665835564511; 
 Sat, 15 Oct 2022 05:06:04 -0700 (PDT)
Received: from [192.168.10.102] ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 cn5-20020a056830658500b00661af2f9a1asm2477031otb.49.2022.10.15.05.06.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 Oct 2022 05:06:04 -0700 (PDT)
Message-ID: <055fa631-acf5-c31a-17f1-894a292e4f5e@gmail.com>
Date: Sat, 15 Oct 2022 09:06:00 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v8 00/16] QMP/HMP: introduce 'dumpdtb'
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20220926173855.1159396-1-danielhb413@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220926173855.1159396-1-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2a.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-2.961,
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

Patches 1, 6 and 8-15 applied to ppc-next.


Thanks,


Daniel

On 9/26/22 14:38, Daniel Henrique Barboza wrote:
> Hi,
> 
> This new version contains all changes proposed during the review process,
> all of them done in the patch that introduces dumpdtb.
> 
> Other changes made:
> 
> - Patch 14/14, the one that introduces the command, is now patch 1. This
> change is to make the other machine patches referencing 'dumpdtb QMP/HMP'
> to reference an existing command.
> 
> - added two new patches based on Philippe's feedback: patch 2 and patch 4.
> 
> Mandatory patch pending review: patch 2
> Optional machine patches pending review: 3, 4, 5, 7, 16
> 
> Changes from v7:
> - patch 14: switched to start of the series, now patch 1
> - patch 1:
>    - changed hmp-commands.hx help to:
>     "dump the FDT in dtb format to 'filename'"
> 
>    - changed 'filename' to *filename*
> 
>    - changed filename description in machine.json to
>      "name of the binary FDT file to be created"
> 
>    - changed 'size' to uint32_t
>    - added a g_assert() for FDT size == zero
>    - added a success message in hmp_dumpdtb()
> - patch 2 (new):
>    - free ms->fdt in machine_finalize()
> - patch 4 (new):
>    - assign ms->fdt in boston_mach_init()
> - v7 link: https://lists.gnu.org/archive/html/qemu-devel/2022-09/msg01350.html
> 
> Daniel Henrique Barboza (16):
>    qmp/hmp, device_tree.c: introduce dumpdtb
>    hw/core: free ms->fdt in machine_finalize()
>    hw/arm: do not free machine->fdt in arm_load_dtb()
>    hw/mips: set machine->fdt in boston_mach_init()
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
> 
>   hmp-commands.hx              | 15 +++++++++++++++
>   hw/arm/boot.c                |  3 ++-
>   hw/core/machine.c            |  1 +
>   hw/microblaze/boot.c         |  8 +++++++-
>   hw/microblaze/meson.build    |  2 +-
>   hw/mips/boston.c             |  5 ++++-
>   hw/nios2/boot.c              |  8 +++++++-
>   hw/nios2/meson.build         |  2 +-
>   hw/ppc/e500.c                | 13 ++++++++++++-
>   hw/ppc/pegasos2.c            |  4 ++++
>   hw/ppc/pnv.c                 |  8 +++++++-
>   hw/ppc/ppc440_bamboo.c       | 25 +++++++++++++-----------
>   hw/ppc/sam460ex.c            | 21 ++++++++++----------
>   hw/ppc/spapr.c               |  3 +++
>   hw/ppc/spapr_hcall.c         |  8 ++++++++
>   hw/ppc/virtex_ml507.c        | 25 +++++++++++++-----------
>   hw/riscv/sifive_u.c          |  3 +++
>   hw/riscv/spike.c             |  6 ++++++
>   hw/xtensa/meson.build        |  2 +-
>   hw/xtensa/xtfpga.c           |  6 +++++-
>   include/sysemu/device_tree.h |  1 +
>   monitor/misc.c               |  1 +
>   qapi/machine.json            | 18 ++++++++++++++++++
>   softmmu/device_tree.c        | 37 ++++++++++++++++++++++++++++++++++++
>   24 files changed, 183 insertions(+), 42 deletions(-)
> 

