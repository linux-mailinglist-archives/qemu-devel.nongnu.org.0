Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C08CA4E8B42
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 02:38:31 +0200 (CEST)
Received: from localhost ([::1]:36160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYdOw-0002JO-F3
	for lists+qemu-devel@lfdr.de; Sun, 27 Mar 2022 20:38:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nYdNA-0001cC-C9
 for qemu-devel@nongnu.org; Sun, 27 Mar 2022 20:36:40 -0400
Received: from [2607:f8b0:4864:20::d35] (port=42690
 helo=mail-io1-xd35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nYdN8-0003YT-4a
 for qemu-devel@nongnu.org; Sun, 27 Mar 2022 20:36:40 -0400
Received: by mail-io1-xd35.google.com with SMTP id r2so15236606iod.9
 for <qemu-devel@nongnu.org>; Sun, 27 Mar 2022 17:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PpSLXbiuyBhhXBp2yrkVC8uPNthkIUnLGshV8PnJWFM=;
 b=U10H32XyCwx0+0avTOUBiM+5upLrgAzTiebwqbZ37nKACXgC/WfLNraRxZy//n0+NL
 GtDwMIaHv8zidur8iXgVytdCOmaWwIRmgDWSlgb8qOVIA+pW7zihfV93HggPzaoeGm5F
 SGJDug+8vD+C2uP6U7i29cV7h4hqnTqxXRvZJQgrENfnFEe2DdpJnG+JLzAXwwCTEqX6
 e9A4uiR2xJd0R6Glq3WGu60/keAemf9fgtWDCZ3ScMGe3bxo163Mt4ULg6fSlaaYIA5T
 VNvHmm1Jlr/bNQweb3WRQrxxHbLH+ZZ4/5xlsOU6Kcyps/NivAY7A4Nax62CmxvKfwvd
 IY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PpSLXbiuyBhhXBp2yrkVC8uPNthkIUnLGshV8PnJWFM=;
 b=WrG3sFlDDxyuiRY7NepKOsDz8rrPHbZstwiflKXMhbpgVei9qYmz0EJFo2botFooYo
 /o7DFAyvyphIsTfRT7onZq9fBRzb9+QBD0DFOsNPlHh2fwht0bKyQOO2lBtiCe2NWgrl
 axJFC6Q88wxZRtzzKCSJVpvtprfTyDFtrm9Mex1T4MyWrUyVulpTeAuwAbGEAEnduyrZ
 1tcPlUXVRBvStun5qB4JmUC8lL5aHBXYa7GZec6G8DOmrU88rwj9QqPszOYb3Ah79qdB
 qz61PIIxdQmIjQzCXxDqev+9vCvnRJFQtfLJkGbj+p6GhNIt+4W+7FhvJagnheIcDS6c
 IRCg==
X-Gm-Message-State: AOAM533gLHfGykM2B4TQlCzJwQPHE+n/47a39MQeNizMMutoIfxOqR1F
 dbffQzxYXmScx4WSyWh+1OlO6xVizJp2SIfb4J8=
X-Google-Smtp-Source: ABdhPJywLWywWTQnwxNpswlqgl195/YDiklW+FZIue3/BkVpagEMLcMElObh05z57cxe3LIv0lw12ixs8VtO1uC1yUo=
X-Received: by 2002:a05:6638:191d:b0:321:3acb:ac8a with SMTP id
 p29-20020a056638191d00b003213acbac8amr11122922jal.212.1648427796932; Sun, 27
 Mar 2022 17:36:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220324082243.451107-1-bmeng.cn@gmail.com>
In-Reply-To: <20220324082243.451107-1-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 28 Mar 2022 10:36:11 +1000
Message-ID: <CAKmqyKOg_PVwPS1_VOZxhr2DcB6AtSA6arPPkPVuay43uiaG9A@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/core: Sync uboot_image.h from U-Boot v2022.01
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 24, 2022 at 6:40 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Sync uboot_image.h from upstream U-Boot v2022.01 release [1].
>
> [1] https://source.denx.de/u-boot/u-boot/-/blob/v2022.01/include/image.h
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/core/uboot_image.h | 213 ++++++++++++++++++++++++++++--------------
>  1 file changed, 142 insertions(+), 71 deletions(-)
>
> diff --git a/hw/core/uboot_image.h b/hw/core/uboot_image.h
> index 608022de6e..18ac293359 100644
> --- a/hw/core/uboot_image.h
> +++ b/hw/core/uboot_image.h
> @@ -1,23 +1,9 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
>  /*
> + * (C) Copyright 2008 Semihalf
> + *
>   * (C) Copyright 2000-2005
>   * Wolfgang Denk, DENX Software Engineering, wd@denx.de.
> - *
> - * See file CREDITS for list of people who contributed to this
> - * project.
> - *
> - * This program is free software; you can redistribute it and/or
> - * modify it under the terms of the GNU General Public License as
> - * published by the Free Software Foundation; either version 2 of
> - * the License, or (at your option) any later version.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.         See the
> - * GNU General Public License for more details.
> - *
> - * You should have received a copy of the GNU General Public License along
> - * with this program; if not, see <http://www.gnu.org/licenses/>.
> - *
>   ********************************************************************
>   * NOTE: This header file defines an interface to U-Boot. Including
>   * this (unmodified) header file in another file is considered normal
> @@ -31,50 +17,83 @@
>
>  /*
>   * Operating System Codes
> + *
> + * The following are exposed to uImage header.
> + * New IDs *MUST* be appended at the end of the list and *NEVER*
> + * inserted for backward compatibility.
>   */
> -#define IH_OS_INVALID          0       /* Invalid OS   */
> -#define IH_OS_OPENBSD          1       /* OpenBSD      */
> -#define IH_OS_NETBSD           2       /* NetBSD       */
> -#define IH_OS_FREEBSD          3       /* FreeBSD      */
> -#define IH_OS_4_4BSD           4       /* 4.4BSD       */
> -#define IH_OS_LINUX            5       /* Linux        */
> -#define IH_OS_SVR4             6       /* SVR4         */
> -#define IH_OS_ESIX             7       /* Esix         */
> -#define IH_OS_SOLARIS          8       /* Solaris      */
> -#define IH_OS_IRIX             9       /* Irix         */
> -#define IH_OS_SCO              10      /* SCO          */
> -#define IH_OS_DELL             11      /* Dell         */
> -#define IH_OS_NCR              12      /* NCR          */
> -#define IH_OS_LYNXOS           13      /* LynxOS       */
> -#define IH_OS_VXWORKS          14      /* VxWorks      */
> -#define IH_OS_PSOS             15      /* pSOS         */
> -#define IH_OS_QNX              16      /* QNX          */
> -#define IH_OS_U_BOOT           17      /* Firmware     */
> -#define IH_OS_RTEMS            18      /* RTEMS        */
> -#define IH_OS_ARTOS            19      /* ARTOS        */
> -#define IH_OS_UNITY            20      /* Unity OS     */
> +enum {
> +       IH_OS_INVALID           = 0,    /* Invalid OS   */
> +       IH_OS_OPENBSD,                  /* OpenBSD      */
> +       IH_OS_NETBSD,                   /* NetBSD       */
> +       IH_OS_FREEBSD,                  /* FreeBSD      */
> +       IH_OS_4_4BSD,                   /* 4.4BSD       */
> +       IH_OS_LINUX,                    /* Linux        */
> +       IH_OS_SVR4,                     /* SVR4         */
> +       IH_OS_ESIX,                     /* Esix         */
> +       IH_OS_SOLARIS,                  /* Solaris      */
> +       IH_OS_IRIX,                     /* Irix         */
> +       IH_OS_SCO,                      /* SCO          */
> +       IH_OS_DELL,                     /* Dell         */
> +       IH_OS_NCR,                      /* NCR          */
> +       IH_OS_LYNXOS,                   /* LynxOS       */
> +       IH_OS_VXWORKS,                  /* VxWorks      */
> +       IH_OS_PSOS,                     /* pSOS         */
> +       IH_OS_QNX,                      /* QNX          */
> +       IH_OS_U_BOOT,                   /* Firmware     */
> +       IH_OS_RTEMS,                    /* RTEMS        */
> +       IH_OS_ARTOS,                    /* ARTOS        */
> +       IH_OS_UNITY,                    /* Unity OS     */
> +       IH_OS_INTEGRITY,                /* INTEGRITY    */
> +       IH_OS_OSE,                      /* OSE          */
> +       IH_OS_PLAN9,                    /* Plan 9       */
> +       IH_OS_OPENRTOS,         /* OpenRTOS     */
> +       IH_OS_ARM_TRUSTED_FIRMWARE,     /* ARM Trusted Firmware */
> +       IH_OS_TEE,                      /* Trusted Execution Environment */
> +       IH_OS_OPENSBI,                  /* RISC-V OpenSBI */
> +       IH_OS_EFI,                      /* EFI Firmware (e.g. GRUB2) */
> +
> +       IH_OS_COUNT,
> +};
>
>  /*
>   * CPU Architecture Codes (supported by Linux)
> + *
> + * The following are exposed to uImage header.
> + * New IDs *MUST* be appended at the end of the list and *NEVER*
> + * inserted for backward compatibility.
>   */
> -#define IH_CPU_INVALID         0       /* Invalid CPU  */
> -#define IH_CPU_ALPHA           1       /* Alpha        */
> -#define IH_CPU_ARM             2       /* ARM          */
> -#define IH_CPU_I386            3       /* Intel x86    */
> -#define IH_CPU_IA64            4       /* IA64         */
> -#define IH_CPU_MIPS            5       /* MIPS         */
> -#define IH_CPU_MIPS64          6       /* MIPS  64 Bit */
> -#define IH_CPU_PPC             7       /* PowerPC      */
> -#define IH_CPU_S390            8       /* IBM S390     */
> -#define IH_CPU_SH              9       /* SuperH       */
> -#define IH_CPU_SPARC           10      /* Sparc        */
> -#define IH_CPU_SPARC64         11      /* Sparc 64 Bit */
> -#define IH_CPU_M68K            12      /* M68K         */
> -#define IH_CPU_NIOS            13      /* Nios-32      */
> -#define IH_CPU_MICROBLAZE      14      /* MicroBlaze   */
> -#define IH_CPU_NIOS2           15      /* Nios-II      */
> -#define IH_CPU_BLACKFIN                16      /* Blackfin     */
> -#define IH_CPU_AVR32           17      /* AVR32        */
> +enum {
> +       IH_ARCH_INVALID         = 0,    /* Invalid CPU  */
> +       IH_ARCH_ALPHA,                  /* Alpha        */
> +       IH_ARCH_ARM,                    /* ARM          */
> +       IH_ARCH_I386,                   /* Intel x86    */
> +       IH_ARCH_IA64,                   /* IA64         */
> +       IH_ARCH_MIPS,                   /* MIPS         */
> +       IH_ARCH_MIPS64,                 /* MIPS  64 Bit */
> +       IH_ARCH_PPC,                    /* PowerPC      */
> +       IH_ARCH_S390,                   /* IBM S390     */
> +       IH_ARCH_SH,                     /* SuperH       */
> +       IH_ARCH_SPARC,                  /* Sparc        */
> +       IH_ARCH_SPARC64,                /* Sparc 64 Bit */
> +       IH_ARCH_M68K,                   /* M68K         */
> +       IH_ARCH_NIOS,                   /* Nios-32      */
> +       IH_ARCH_MICROBLAZE,             /* MicroBlaze   */
> +       IH_ARCH_NIOS2,                  /* Nios-II      */
> +       IH_ARCH_BLACKFIN,               /* Blackfin     */
> +       IH_ARCH_AVR32,                  /* AVR32        */
> +       IH_ARCH_ST200,                  /* STMicroelectronics ST200  */
> +       IH_ARCH_SANDBOX,                /* Sandbox architecture (test only) */
> +       IH_ARCH_NDS32,                  /* ANDES Technology - NDS32  */
> +       IH_ARCH_OPENRISC,               /* OpenRISC 1000  */
> +       IH_ARCH_ARM64,                  /* ARM64        */
> +       IH_ARCH_ARC,                    /* Synopsys DesignWare ARC */
> +       IH_ARCH_X86_64,                 /* AMD x86_64, Intel and Via */
> +       IH_ARCH_XTENSA,                 /* Xtensa       */
> +       IH_ARCH_RISCV,                  /* RISC-V */
> +
> +       IH_ARCH_COUNT,
> +};
>
>  /*
>   * Image Types
> @@ -113,33 +132,85 @@
>   *     U-Boot's command interpreter; this feature is especially
>   *     useful when you configure U-Boot to use a real shell (hush)
>   *     as command interpreter (=> Shell Scripts).
> + *
> + * The following are exposed to uImage header.
> + * New IDs *MUST* be appended at the end of the list and *NEVER*
> + * inserted for backward compatibility.
>   */
>
> -#define IH_TYPE_INVALID                0       /* Invalid Image                */
> -#define IH_TYPE_STANDALONE     1       /* Standalone Program           */
> -#define IH_TYPE_KERNEL         2       /* OS Kernel Image              */
> -#define IH_TYPE_RAMDISK                3       /* RAMDisk Image                */
> -#define IH_TYPE_MULTI          4       /* Multi-File Image             */
> -#define IH_TYPE_FIRMWARE       5       /* Firmware Image               */
> -#define IH_TYPE_SCRIPT         6       /* Script file                  */
> -#define IH_TYPE_FILESYSTEM     7       /* Filesystem Image (any type)  */
> -#define IH_TYPE_FLATDT         8       /* Binary Flat Device Tree Blob */
> -#define IH_TYPE_KERNEL_NOLOAD  14      /* OS Kernel Image (noload)     */
> +enum {
> +       IH_TYPE_INVALID         = 0,    /* Invalid Image                */
> +       IH_TYPE_STANDALONE,             /* Standalone Program           */
> +       IH_TYPE_KERNEL,                 /* OS Kernel Image              */
> +       IH_TYPE_RAMDISK,                /* RAMDisk Image                */
> +       IH_TYPE_MULTI,                  /* Multi-File Image             */
> +       IH_TYPE_FIRMWARE,               /* Firmware Image               */
> +       IH_TYPE_SCRIPT,                 /* Script file                  */
> +       IH_TYPE_FILESYSTEM,             /* Filesystem Image (any type)  */
> +       IH_TYPE_FLATDT,                 /* Binary Flat Device Tree Blob */
> +       IH_TYPE_KWBIMAGE,               /* Kirkwood Boot Image          */
> +       IH_TYPE_IMXIMAGE,               /* Freescale IMXBoot Image      */
> +       IH_TYPE_UBLIMAGE,               /* Davinci UBL Image            */
> +       IH_TYPE_OMAPIMAGE,              /* TI OMAP Config Header Image  */
> +       IH_TYPE_AISIMAGE,               /* TI Davinci AIS Image         */
> +       /* OS Kernel Image, can run from any load address */
> +       IH_TYPE_KERNEL_NOLOAD,
> +       IH_TYPE_PBLIMAGE,               /* Freescale PBL Boot Image     */
> +       IH_TYPE_MXSIMAGE,               /* Freescale MXSBoot Image      */
> +       IH_TYPE_GPIMAGE,                /* TI Keystone GPHeader Image   */
> +       IH_TYPE_ATMELIMAGE,             /* ATMEL ROM bootable Image     */
> +       IH_TYPE_SOCFPGAIMAGE,           /* Altera SOCFPGA CV/AV Preloader */
> +       IH_TYPE_X86_SETUP,              /* x86 setup.bin Image          */
> +       IH_TYPE_LPC32XXIMAGE,           /* x86 setup.bin Image          */
> +       IH_TYPE_LOADABLE,               /* A list of typeless images    */
> +       IH_TYPE_RKIMAGE,                /* Rockchip Boot Image          */
> +       IH_TYPE_RKSD,                   /* Rockchip SD card             */
> +       IH_TYPE_RKSPI,                  /* Rockchip SPI image           */
> +       IH_TYPE_ZYNQIMAGE,              /* Xilinx Zynq Boot Image */
> +       IH_TYPE_ZYNQMPIMAGE,            /* Xilinx ZynqMP Boot Image */
> +       IH_TYPE_ZYNQMPBIF,              /* Xilinx ZynqMP Boot Image (bif) */
> +       IH_TYPE_FPGA,                   /* FPGA Image */
> +       IH_TYPE_VYBRIDIMAGE,    /* VYBRID .vyb Image */
> +       IH_TYPE_TEE,            /* Trusted Execution Environment OS Image */
> +       IH_TYPE_FIRMWARE_IVT,           /* Firmware Image with HABv4 IVT */
> +       IH_TYPE_PMMC,            /* TI Power Management Micro-Controller Firmware */
> +       IH_TYPE_STM32IMAGE,             /* STMicroelectronics STM32 Image */
> +       IH_TYPE_SOCFPGAIMAGE_V1,        /* Altera SOCFPGA A10 Preloader */
> +       IH_TYPE_MTKIMAGE,               /* MediaTek BootROM loadable Image */
> +       IH_TYPE_IMX8MIMAGE,             /* Freescale IMX8MBoot Image    */
> +       IH_TYPE_IMX8IMAGE,              /* Freescale IMX8Boot Image     */
> +       IH_TYPE_COPRO,                  /* Coprocessor Image for remoteproc*/
> +       IH_TYPE_SUNXI_EGON,             /* Allwinner eGON Boot Image */
> +
> +       IH_TYPE_COUNT,                  /* Number of image types */
> +};
>
>  /*
>   * Compression Types
> + *
> + * The following are exposed to uImage header.
> + * New IDs *MUST* be appended at the end of the list and *NEVER*
> + * inserted for backward compatibility.
>   */
> -#define IH_COMP_NONE           0       /*  No   Compression Used       */
> -#define IH_COMP_GZIP           1       /* gzip  Compression Used       */
> -#define IH_COMP_BZIP2          2       /* bzip2 Compression Used       */
> +enum {
> +       IH_COMP_NONE            = 0,    /*  No   Compression Used       */
> +       IH_COMP_GZIP,                   /* gzip  Compression Used       */
> +       IH_COMP_BZIP2,                  /* bzip2 Compression Used       */
> +       IH_COMP_LZMA,                   /* lzma  Compression Used       */
> +       IH_COMP_LZO,                    /* lzo   Compression Used       */
> +       IH_COMP_LZ4,                    /* lz4   Compression Used       */
> +       IH_COMP_ZSTD,                   /* zstd   Compression Used      */
> +
> +       IH_COMP_COUNT,
> +};
>
>  #define IH_MAGIC       0x27051956      /* Image Magic Number           */
>  #define IH_NMLEN               32      /* Image Name Length            */
>
>  /*
> - * all data in network byte order (aka natural aka bigendian)
> + * Legacy format image header,
> + * all data in network byte order (aka natural aka bigendian).
>   */
> -
>  typedef struct uboot_image_header {
>         uint32_t        ih_magic;       /* Image Header Magic Number    */
>         uint32_t        ih_hcrc;        /* Image Header CRC Checksum    */
> --
> 2.25.1
>
>

