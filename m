Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B254F5A77
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 12:11:03 +0200 (CEST)
Received: from localhost ([::1]:47178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc2cv-0004is-4b
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 06:11:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nc2aa-0003pq-In; Wed, 06 Apr 2022 06:08:36 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:43575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nc2aY-0006M7-43; Wed, 06 Apr 2022 06:08:36 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2e5e31c34bfso20231387b3.10; 
 Wed, 06 Apr 2022 03:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nIyZ/ECWm3b/PjxDl9ca8kwVpUb+gZ+SWQfior1fJDM=;
 b=ByPVyQboqzP+o2i0NbfuMPfuxTptRfuv3kFAd7p8ystJ6TwWUT+tSgcZlJxzNop6pS
 RnVaRjZ1+L9tvpiJv9VsZYpsQB+l1iT/byo/a1cdz1e9kmV1Jl12vN8CT/4Ssm+qEw/a
 p/pUUbF49VXx/SnqaiTyHkBkNnHEbFX908Brpo6PgZHPLDVDsQzhl+Bdb1mvAvY1m67k
 dxCf3SKSILuwVQAPRADrYaSygoJ/gPVdb5TEez8BuDQhxQiVvNkFcfCHfxocZEmsvbG8
 hqJTPBPzuWAzQNCqIn+znukeTFtxoGIBXbK9vbmvrrQK0iEmaW8ZSVV+7gyfupQqRBbF
 o6Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nIyZ/ECWm3b/PjxDl9ca8kwVpUb+gZ+SWQfior1fJDM=;
 b=lZ8ZsNNCG1XzKdk/HCXhCJlHfLTuJGuzqb2sxxvHXiWzs8CVihpIa4nYHQGoPNjt/B
 5vqWhrTsblxyDW3vPbQmFT/ESsnRoChSWSjQqlm43CCcw9M6PVTp4/tvsUCQe6SsFRof
 Ol19vxQzZ/j3bo4GPaxIw0710myCFRh5AyPP+5UDCjVHkIpkhl9riI8JR7IZwhaucjyQ
 l2pCA/UH/ucCyRqVVxMx/eTjpXwEO/J4znUJH9xdS5QHk90yn5qFnKgOjcUYDI1ndIPO
 ohNHHsUUJjLEubk/b+1rFris8V4oMsxHXvWHKL5tbL7Ry7hCtREyQ5aDXbIQc6q93mF4
 6biQ==
X-Gm-Message-State: AOAM530m/gwbaCD9pjhxeC/AnsTc2kq8ACkSNVO2CoIOIkGmN79J4OfG
 IDwQKRP5jcKSBTi/M2QRL7e5TlU3rn3MbQ38qZJklRVO8Ys=
X-Google-Smtp-Source: ABdhPJwQRuwC/IBOeYyFKXclHr3ux/cb+a7Rm60R8ShHTSRphz/cEvxpMybqKrVRbq/2aO9Vzk/FVsPpL5oyJ6GP+PA=
X-Received: by 2002:a81:1bc3:0:b0:2e3:aa1:f553 with SMTP id
 b186-20020a811bc3000000b002e30aa1f553mr6258600ywb.491.1649239712397; Wed, 06
 Apr 2022 03:08:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220405121950.3528296-1-qtxuning1999@sjtu.edu.cn>
In-Reply-To: <20220405121950.3528296-1-qtxuning1999@sjtu.edu.cn>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 6 Apr 2022 18:08:21 +0800
Message-ID: <CAEUhbmXBxU8-5qnVSbfcSqq0RJHdH+CtKUnhRiXXJB+cmmX3kA@mail.gmail.com>
Subject: Re: [PATCH v1] hw/ppc: change indentation to spaces from TABs
To: Guo Zhi <qtxuning1999@sjtu.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Greg Kurz <groug@kaod.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 5, 2022 at 10:36 PM Guo Zhi <qtxuning1999@sjtu.edu.cn> wrote:
>
> There are still some files in the QEMU PPC code base that use TABs for indentation instead of using  spaces.
> The TABs should be replaced so that we have a consistent coding style.
>
> If this patch is applied, issue:
>
> https://gitlab.com/qemu-project/qemu/-/issues/374
>
> can be closed.
>
> Signed-off-by: Guo Zhi <qtxuning1999@sjtu.edu.cn>
> ---
>  hw/core/uboot_image.h  | 185 ++++++++++++++++++++---------------------
>  hw/ppc/ppc440_bamboo.c |   6 +-
>  hw/ppc/spapr_rtas.c    |  18 ++--
>  include/hw/ppc/ppc.h   |  10 +--
>  4 files changed, 109 insertions(+), 110 deletions(-)
>
> diff --git a/hw/core/uboot_image.h b/hw/core/uboot_image.h

uboot_image.h was taken from the U-Boot source, I believe it should be
kept as it is.

> index 608022de6e..980e9cc014 100644
> --- a/hw/core/uboot_image.h
> +++ b/hw/core/uboot_image.h
> @@ -12,7 +12,7 @@
>   *
>   * This program is distributed in the hope that it will be useful,
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.         See the
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
>   * GNU General Public License for more details.
>   *
>   * You should have received a copy of the GNU General Public License along
> @@ -32,128 +32,127 @@
>  /*
>   * Operating System Codes
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
> +#define IH_OS_INVALID 0 /* Invalid OS */
> +#define IH_OS_OPENBSD 1 /* OpenBSD */
> +#define IH_OS_NETBSD  2 /* NetBSD */
> +#define IH_OS_FREEBSD 3 /* FreeBSD */
> +#define IH_OS_4_4BSD  4 /* 4.4BSD */
> +#define IH_OS_LINUX   5 /* Linux */
> +#define IH_OS_SVR4    6 /* SVR4 */
> +#define IH_OS_ESIX    7 /* Esix */
> +#define IH_OS_SOLARIS 8 /* Solaris */
> +#define IH_OS_IRIX    9 /* Irix */
> +#define IH_OS_SCO     10 /* SCO */
> +#define IH_OS_DELL    11 /* Dell */
> +#define IH_OS_NCR     12 /* NCR */
> +#define IH_OS_LYNXOS  13 /* LynxOS */
> +#define IH_OS_VXWORKS 14 /* VxWorks */
> +#define IH_OS_PSOS    15 /* pSOS */
> +#define IH_OS_QNX     16 /* QNX */
> +#define IH_OS_U_BOOT  17 /* Firmware */
> +#define IH_OS_RTEMS   18 /* RTEMS */
> +#define IH_OS_ARTOS   19 /* ARTOS */
> +#define IH_OS_UNITY   20 /* Unity OS */
>
>  /*
>   * CPU Architecture Codes (supported by Linux)
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
> +#define IH_CPU_INVALID    0 /* Invalid CPU */
> +#define IH_CPU_ALPHA      1 /* Alpha */
> +#define IH_CPU_ARM        2 /* ARM */
> +#define IH_CPU_I386       3 /* Intel x86 */
> +#define IH_CPU_IA64       4 /* IA64 */
> +#define IH_CPU_MIPS       5 /* MIPS */
> +#define IH_CPU_MIPS64     6 /* MIPS  64 Bit */
> +#define IH_CPU_PPC        7 /* PowerPC */
> +#define IH_CPU_S390       8 /* IBM S390 */
> +#define IH_CPU_SH         9 /* SuperH */
> +#define IH_CPU_SPARC      10 /* Sparc */
> +#define IH_CPU_SPARC64    11 /* Sparc 64 Bit */
> +#define IH_CPU_M68K       12 /* M68K */
> +#define IH_CPU_NIOS       13 /* Nios-32 */
> +#define IH_CPU_MICROBLAZE 14 /* MicroBlaze   */
> +#define IH_CPU_NIOS2      15 /* Nios-II */
> +#define IH_CPU_BLACKFIN   16 /* Blackfin */
> +#define IH_CPU_AVR32      17 /* AVR32 */
>
>  /*
>   * Image Types
>   *
>   * "Standalone Programs" are directly runnable in the environment
> - *     provided by U-Boot; it is expected that (if they behave
> - *     well) you can continue to work in U-Boot after return from
> - *     the Standalone Program.
> + * provided by U-Boot; it is expected that (if they behave
> + * well) you can continue to work in U-Boot after return from
> + * the Standalone Program.
>   * "OS Kernel Images" are usually images of some Embedded OS which
> - *     will take over control completely. Usually these programs
> - *     will install their own set of exception handlers, device
> - *     drivers, set up the MMU, etc. - this means, that you cannot
> - *     expect to re-enter U-Boot except by resetting the CPU.
> + * will take over control completely. Usually these programs
> + * will install their own set of exception handlers, device
> + * drivers, set up the MMU, etc. - this means, that you cannot
> + * expect to re-enter U-Boot except by resetting the CPU.
>   * "RAMDisk Images" are more or less just data blocks, and their
> - *     parameters (address, size) are passed to an OS kernel that is
> - *     being started.
> + * parameters (address, size) are passed to an OS kernel that is
> + * being started.
>   * "Multi-File Images" contain several images, typically an OS
> - *     (Linux) kernel image and one or more data images like
> - *     RAMDisks. This construct is useful for instance when you want
> - *     to boot over the network using BOOTP etc., where the boot
> - *     server provides just a single image file, but you want to get
> - *     for instance an OS kernel and a RAMDisk image.
> + * (Linux) kernel image and one or more data images like
> + * RAMDisks. This construct is useful for instance when you want
> + * to boot over the network using BOOTP etc., where the boot
> + * server provides just a single image file, but you want to get
> + * for instance an OS kernel and a RAMDisk image.
>   *
> - *     "Multi-File Images" start with a list of image sizes, each
> - *     image size (in bytes) specified by an "uint32_t" in network
> - *     byte order. This list is terminated by an "(uint32_t)0".
> - *     Immediately after the terminating 0 follow the images, one by
> - *     one, all aligned on "uint32_t" boundaries (size rounded up to
> - *     a multiple of 4 bytes - except for the last file).
> + * "Multi-File Images" start with a list of image sizes, each
> + * image size (in bytes) specified by an "uint32_t" in network
> + * byte order. This list is terminated by an "(uint32_t)0".
> + * Immediately after the terminating 0 follow the images, one by
> + * one, all aligned on "uint32_t" boundaries (size rounded up to
> + * a multiple of 4 bytes - except for the last file).
>   *
>   * "Firmware Images" are binary images containing firmware (like
> - *     U-Boot or FPGA images) which usually will be programmed to
> - *     flash memory.
> + * U-Boot or FPGA images) which usually will be programmed to
> + * flash memory.
>   *
>   * "Script files" are command sequences that will be executed by
> - *     U-Boot's command interpreter; this feature is especially
> - *     useful when you configure U-Boot to use a real shell (hush)
> - *     as command interpreter (=> Shell Scripts).
> + * U-Boot's command interpreter; this feature is especially
> + * useful when you configure U-Boot to use a real shell (hush)
> + * as command interpreter (=> Shell Scripts).
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
> +#define IH_TYPE_INVALID       0 /* Invalid Image */
> +#define IH_TYPE_STANDALONE    1 /* Standalone Program */
> +#define IH_TYPE_KERNEL        2 /* OS Kernel Image */
> +#define IH_TYPE_RAMDISK       3 /* RAMDisk Image */
> +#define IH_TYPE_MULTI         4 /* Multi-File Image */
> +#define IH_TYPE_FIRMWARE      5 /* Firmware Image */
> +#define IH_TYPE_SCRIPT        6 /* Script file */
> +#define IH_TYPE_FILESYSTEM    7 /* Filesystem Image (any type) */
> +#define IH_TYPE_FLATDT        8 /* Binary Flat Device Tree Blob */
> +#define IH_TYPE_KERNEL_NOLOAD 14 /* OS Kernel Image (noload) */
>
>  /*
>   * Compression Types
>   */
> -#define IH_COMP_NONE           0       /*  No   Compression Used       */
> -#define IH_COMP_GZIP           1       /* gzip  Compression Used       */
> -#define IH_COMP_BZIP2          2       /* bzip2 Compression Used       */
> +#define IH_COMP_NONE  0 /*  No  Compression Used */
> +#define IH_COMP_GZIP  1 /* gzip  Compression Used */
> +#define IH_COMP_BZIP2 2 /* bzip2 Compression Used */
>
> -#define IH_MAGIC       0x27051956      /* Image Magic Number           */
> -#define IH_NMLEN               32      /* Image Name Length            */
> +#define IH_MAGIC 0x27051956 /* Image Magic Number */
> +#define IH_NMLEN 32 /* Image Name Length */
>
>  /*
>   * all data in network byte order (aka natural aka bigendian)
>   */
>
>  typedef struct uboot_image_header {
> -       uint32_t        ih_magic;       /* Image Header Magic Number    */
> -       uint32_t        ih_hcrc;        /* Image Header CRC Checksum    */
> -       uint32_t        ih_time;        /* Image Creation Timestamp     */
> -       uint32_t        ih_size;        /* Image Data Size              */
> -       uint32_t        ih_load;        /* Data  Load  Address          */
> -       uint32_t        ih_ep;          /* Entry Point Address          */
> -       uint32_t        ih_dcrc;        /* Image Data CRC Checksum      */
> -       uint8_t         ih_os;          /* Operating System             */
> -       uint8_t         ih_arch;        /* CPU architecture             */
> -       uint8_t         ih_type;        /* Image Type                   */
> -       uint8_t         ih_comp;        /* Compression Type             */
> -       uint8_t         ih_name[IH_NMLEN];      /* Image Name           */
> +        uint32_t ih_magic;         /* Image Header Magic Number */
> +        uint32_t ih_hcrc;          /* Image Header CRC Checksum */
> +        uint32_t ih_time;          /* Image Creation Timestamp */
> +        uint32_t ih_size;          /* Image Data Size */
> +        uint32_t ih_load;          /* Data  Load  Address */
> +        uint32_t ih_ep;            /* Entry Point Address */
> +        uint32_t ih_dcrc;          /* Image Data CRC Checksum */
> +        uint8_t ih_os;             /* Operating System */
> +        uint8_t ih_arch;           /* CPU architecture */
> +        uint8_t ih_type;           /* Image Type */
> +        uint8_t ih_comp;           /* Compression Type */
> +        uint8_t ih_name[IH_NMLEN]; /* Image Name */
>  } uboot_image_header_t;
>
> -
>  #endif /* UBOOT_IMAGE_H */
> diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
> index 7fb620b9a0..5ec3a9a17f 100644
> --- a/hw/ppc/ppc440_bamboo.c
> +++ b/hw/ppc/ppc440_bamboo.c
> @@ -3,9 +3,9 @@
>   *
>   * Copyright 2007 IBM Corporation.
>   * Authors:
> - *     Jerone Young <jyoung5@us.ibm.com>
> - *     Christian Ehrhardt <ehrhardt@linux.vnet.ibm.com>
> - *     Hollis Blanchard <hollisb@us.ibm.com>
> + *  Jerone Young <jyoung5@us.ibm.com>
> + *  Christian Ehrhardt <ehrhardt@linux.vnet.ibm.com>
> + *  Hollis Blanchard <hollisb@us.ibm.com>
>   *
>   * This work is licensed under the GNU GPL license version 2 or later.
>   *
> diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
> index d7c04237fe..d58b65e88f 100644
> --- a/hw/ppc/spapr_rtas.c
> +++ b/hw/ppc/spapr_rtas.c
> @@ -474,16 +474,16 @@ static void rtas_ibm_nmi_interlock(PowerPCCPU *cpu,
>
>      if (spapr->fwnmi_machine_check_interlock != cpu->vcpu_id) {
>          /*
> -        * The vCPU that hit the NMI should invoke "ibm,nmi-interlock"
> +         * The vCPU that hit the NMI should invoke "ibm,nmi-interlock"
>           * This should be PARAM_ERROR, but Linux calls "ibm,nmi-interlock"
> -        * for system reset interrupts, despite them not being interlocked.
> -        * PowerVM silently ignores this and returns success here. Returning
> -        * failure causes Linux to print the error "FWNMI: nmi-interlock
> -        * failed: -3", although no other apparent ill effects, this is a
> -        * regression for the user when enabling FWNMI. So for now, match
> -        * PowerVM. When most Linux clients are fixed, this could be
> -        * changed.
> -        */
> +         * for system reset interrupts, despite them not being interlocked.
> +         * PowerVM silently ignores this and returns success here. Returning
> +         * failure causes Linux to print the error "FWNMI: nmi-interlock
> +         * failed: -3", although no other apparent ill effects, this is a
> +         * regression for the user when enabling FWNMI. So for now, match
> +         * PowerVM. When most Linux clients are fixed, this could be
> +         * changed.
> +         */
>          rtas_st(rets, 0, RTAS_OUT_SUCCESS);
>          return;
>      }
> diff --git a/include/hw/ppc/ppc.h b/include/hw/ppc/ppc.h
> index 364f165b4b..02af03ada2 100644
> --- a/include/hw/ppc/ppc.h
> +++ b/include/hw/ppc/ppc.h
> @@ -99,11 +99,11 @@ enum {
>      ARCH_MAC99_U3,
>  };
>
> -#define FW_CFG_PPC_WIDTH       (FW_CFG_ARCH_LOCAL + 0x00)
> -#define FW_CFG_PPC_HEIGHT      (FW_CFG_ARCH_LOCAL + 0x01)
> -#define FW_CFG_PPC_DEPTH       (FW_CFG_ARCH_LOCAL + 0x02)
> -#define FW_CFG_PPC_TBFREQ      (FW_CFG_ARCH_LOCAL + 0x03)
> -#define FW_CFG_PPC_CLOCKFREQ   (FW_CFG_ARCH_LOCAL + 0x04)
> +#define FW_CFG_PPC_WIDTH        (FW_CFG_ARCH_LOCAL + 0x00)
> +#define FW_CFG_PPC_HEIGHT       (FW_CFG_ARCH_LOCAL + 0x01)
> +#define FW_CFG_PPC_DEPTH        (FW_CFG_ARCH_LOCAL + 0x02)
> +#define FW_CFG_PPC_TBFREQ       (FW_CFG_ARCH_LOCAL + 0x03)
> +#define FW_CFG_PPC_CLOCKFREQ    (FW_CFG_ARCH_LOCAL + 0x04)
>  #define FW_CFG_PPC_IS_KVM       (FW_CFG_ARCH_LOCAL + 0x05)
>  #define FW_CFG_PPC_KVM_HC       (FW_CFG_ARCH_LOCAL + 0x06)
>  #define FW_CFG_PPC_KVM_PID      (FW_CFG_ARCH_LOCAL + 0x07)
> --


Regards,
Bin

