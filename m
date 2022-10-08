Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF165F84D3
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Oct 2022 12:54:26 +0200 (CEST)
Received: from localhost ([::1]:47744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oh7TM-0006J7-Ra
	for lists+qemu-devel@lfdr.de; Sat, 08 Oct 2022 06:54:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oh7Rr-0004wa-3f
 for qemu-devel@nongnu.org; Sat, 08 Oct 2022 06:52:51 -0400
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f]:42598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oh7Ro-00061J-Qd
 for qemu-devel@nongnu.org; Sat, 08 Oct 2022 06:52:50 -0400
Received: by mail-oo1-xc2f.google.com with SMTP id
 r15-20020a4abf0f000000b004761c7e6be1so5068570oop.9
 for <qemu-devel@nongnu.org>; Sat, 08 Oct 2022 03:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OSrOzDT5hPpf0f2pE9/BmEZjIfhFy60L4CD+QPDnXVo=;
 b=jOTB7/L5MUSc+64ZIM82fcJWT9STMvCMs0B+Uj/hEh+j7jyf6D1XhZ+Qppm0vwUYtI
 wvC+o10sZHcFm3xI/nSI8VHjxXRlKvcZwxAW0wrRZOc492XW4PkjTK341AseVM75rwJY
 q1v9qYHkrz+pZTOIDet150WEn2D7A6WQ6yxdJuntyQ8PNE0opKH0RNBn3JwRN2OmDjTQ
 GD6MigFN49wgTGywRM/j165bwSI/TkgesbtgQUZvyATkgxgHqn69E97ko70IPPjrKLLc
 4gStrLeZ/IKaJmTf1a0chuU2iB/noR69RIOY5qWIWKcaZFcj7Zuh+t2WjuZbGeB90FX0
 3Xnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OSrOzDT5hPpf0f2pE9/BmEZjIfhFy60L4CD+QPDnXVo=;
 b=T6Pd51XuD9tXjvkbdxS0+iFLYzDhmM87d7HjbrfjD2shitCs9ssjR/i538d3SdDU8D
 JiDLbOj9Mp0yEXSAIi2fFOu9F8R0FTD4pfNATrmnJibvPvSfcObtyfZRQuU9qeIVvHet
 rOUhevbPYABNyxqKIy0Pp+jkLhdWbWTHw+8xn5oM2Ellnu5YxXhzvCcyLkk0x8Atohrw
 C1R328muUs8A3Kem/nuzradjrkX9b2kig/de/SYiAEKroHbLWI6cFkEXMz1f/AEYINgV
 5GSziA90gNO5xs+KIWdmnqYS22eklfROO7NreH0MdbCgCQhJKlcutCU86Ukj7v9/cdRl
 p+SA==
X-Gm-Message-State: ACrzQf0wKdbU4nTUrU24KzuRmiR8wNbfBBCq5SSO4qsY4mQ/6AJlZvE8
 3B+daCOBl5qUCOV2CUckNHDj/dPqZwE=
X-Google-Smtp-Source: AMsMyM48DgIl5dfJYX4sEaxI03H/RK4RW89t2F7MotjJ43dqhLRBpCS5HiGzAGNR+Y1UfBYr27lWSQ==
X-Received: by 2002:a9d:6a0a:0:b0:655:fd57:a6aa with SMTP id
 g10-20020a9d6a0a000000b00655fd57a6aamr3817774otn.291.1665226366322; 
 Sat, 08 Oct 2022 03:52:46 -0700 (PDT)
Received: from [192.168.10.102] ([179.247.162.105])
 by smtp.gmail.com with ESMTPSA id
 93-20020a9d04e6000000b00637032a39a3sm2365866otm.6.2022.10.08.03.52.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Oct 2022 03:52:45 -0700 (PDT)
Message-ID: <7fdbd348-62ff-146a-a0d0-463e7b0c0808@gmail.com>
Date: Sat, 8 Oct 2022 07:52:41 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v8 00/16] QMP/HMP: introduce 'dumpdtb'
To: qemu-devel@nongnu.org
References: <20220926173855.1159396-1-danielhb413@gmail.com>
Content-Language: en-US
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220926173855.1159396-1-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2f;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc2f.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-2.699,
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

Philippe,


I'm going to push the acked patches to ppc-next. If you send a r-b for patches
2 and 4 I can push them as well.

Alistair, I intend to push the acked RISC-V patches (patches 14 and 15) via the
ppc-next tree as well. Let me know if you'd rather pick them via the RISC-V
tree.


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

