Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 304C64F9D9E
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 21:21:36 +0200 (CEST)
Received: from localhost ([::1]:51192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncuAo-00060q-Sj
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 15:21:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ncu9B-0005A4-OI; Fri, 08 Apr 2022 15:19:53 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:39901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ncu99-0001rj-8f; Fri, 08 Apr 2022 15:19:53 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 a17-20020a9d3e11000000b005cb483c500dso6746586otd.6; 
 Fri, 08 Apr 2022 12:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=o6j/12r/9f6m1J1iP6NPffGeM+eW//jwZPf3pjW2bbY=;
 b=oz5Ky2fLlueqE+ZFyLCPQlceZuzwMcSaqvcJGGkdkYRzH+CZcjux5xX+vjSz3K/5nU
 8XH1HQuNhKWA6m7wzmV6/bulLl0t4CSy2Oy897jn1UuadnjEIIqwKBJdP2dBYwhfrjbR
 Su9ucUkd3ALIapU65ou1rVB39HmS0eawIklIAOloPT6uV6AIO/HOfl1sW/RNDO4TcJ+c
 r2xrn5YYok28eLeWFN2jysjWrh0c1w09QGSr8MaXbyh9Y+J7+GSU7czBvFqicMxT5Bnj
 NWRWl+oxx9rtMIeaMmUOUv8zYQjMdw3fENIvBKeAg/r7dhrfhimYDz0zNfd9tEAjSAlb
 FTUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=o6j/12r/9f6m1J1iP6NPffGeM+eW//jwZPf3pjW2bbY=;
 b=DlKScRhHvfYOe1kStEMD8V8FcYeto9xDjc++6ZOB4Kn5kTwd2XrtRPTx242cBmOQR+
 C8Vax27gR2jKSuw2qLU03BChq9fGT1M7F9k+2odMulCVstPnVXBJIsS/qFcmobZ+JQAi
 m6oHNYDizTVIEQROqDzJ7R9XVtyZimtlypim/MeYXs/T1Fu/LN9p0oNasa1EUQcBqpRP
 xpvD+b0sqLPT1IfaGKZZPN3u8akThlYLNQ/5WMJii/F3PpW8FolnEjlkVMo7EwgD3jCp
 A4YjZiEj+CNkYK/zcn23Ml6AKBciNDaHvTPzmyYoLodOhqbqEq/wGCtOTCKnoPWUDcm9
 QwlQ==
X-Gm-Message-State: AOAM5313RzoPoxrnPZw/LcP2/Siv1J4iM17f+gWyGxAmUzlW9ukMEOem
 SiQ2JFv/TETkQt+E8/rB5No=
X-Google-Smtp-Source: ABdhPJweiweB17zRHQHTMsLW433JGGZ9BTecIWQqZF2j/5p71dHLth1y1zp7xdoE9bP2DPDX7bRYbg==
X-Received: by 2002:a9d:6285:0:b0:5b2:5993:a180 with SMTP id
 x5-20020a9d6285000000b005b25993a180mr7240526otk.168.1649445589624; 
 Fri, 08 Apr 2022 12:19:49 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c7:7ee3:afd9:f010:3a9:fd23?
 ([2804:431:c7c7:7ee3:afd9:f010:3a9:fd23])
 by smtp.gmail.com with ESMTPSA id
 o187-20020a4a2cc4000000b00324f07ed8basm8683223ooo.32.2022.04.08.12.19.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 12:19:49 -0700 (PDT)
Message-ID: <ff00d8f2-be00-ac9d-0b43-4a73ae8b3b5b@gmail.com>
Date: Fri, 8 Apr 2022 16:19:45 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1] hw/ppc: change indentation to spaces from TABs
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, Guo Zhi <qtxuning1999@sjtu.edu.cn>
References: <20220405121950.3528296-1-qtxuning1999@sjtu.edu.cn>
 <CAEUhbmXBxU8-5qnVSbfcSqq0RJHdH+CtKUnhRiXXJB+cmmX3kA@mail.gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <CAEUhbmXBxU8-5qnVSbfcSqq0RJHdH+CtKUnhRiXXJB+cmmX3kA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Greg Kurz <groug@kaod.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/6/22 07:08, Bin Meng wrote:
> On Tue, Apr 5, 2022 at 10:36 PM Guo Zhi <qtxuning1999@sjtu.edu.cn> wrote:
>>
>> There are still some files in the QEMU PPC code base that use TABs for indentation instead of using  spaces.
>> The TABs should be replaced so that we have a consistent coding style.
>>
>> If this patch is applied, issue:
>>
>> https://gitlab.com/qemu-project/qemu/-/issues/374
>>
>> can be closed.

Please add the following tag in the commit:


Resolves: https://gitlab.com/qemu-project/qemu/-/issues/374


This will make Gitlab automatically close the issue when the patch is accepted.

>>
>> Signed-off-by: Guo Zhi <qtxuning1999@sjtu.edu.cn>
>> ---
>>   hw/core/uboot_image.h  | 185 ++++++++++++++++++++---------------------
>>   hw/ppc/ppc440_bamboo.c |   6 +-
>>   hw/ppc/spapr_rtas.c    |  18 ++--
>>   include/hw/ppc/ppc.h   |  10 +--
>>   4 files changed, 109 insertions(+), 110 deletions(-)
>>
>> diff --git a/hw/core/uboot_image.h b/hw/core/uboot_image.h
> 
> uboot_image.h was taken from the U-Boot source, I believe it should be
> kept as it is.


(CCing Thomas since het explictly listed hw/core/uboot_image.h in the bug)


I am not sure about keeping this file as is. Commit f831f955d42096 added lines to this
header, for example:



diff --git a/hw/core/uboot_image.h b/hw/core/uboot_image.h
index 34c11a70a6..608022de6e 100644
--- a/hw/core/uboot_image.h
+++ b/hw/core/uboot_image.h
@@ -124,6 +124,7 @@
  #define IH_TYPE_SCRIPT         6       /* Script file                  */
  #define IH_TYPE_FILESYSTEM     7       /* Filesystem Image (any type)  */
  #define IH_TYPE_FLATDT         8       /* Binary Flat Device Tree Blob */
+#define IH_TYPE_KERNEL_NOLOAD  14      /* OS Kernel Image (noload)     */
  

I personally don't mind changing tabs from spaces in this file.



Thanks,


Daniel





> 
>> index 608022de6e..980e9cc014 100644
>> --- a/hw/core/uboot_image.h
>> +++ b/hw/core/uboot_image.h
>> @@ -12,7 +12,7 @@
>>    *
>>    * This program is distributed in the hope that it will be useful,
>>    * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.         See the
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
>>    * GNU General Public License for more details.
>>    *
>>    * You should have received a copy of the GNU General Public License along
>> @@ -32,128 +32,127 @@
>>   /*
>>    * Operating System Codes
>>    */
>> -#define IH_OS_INVALID          0       /* Invalid OS   */
>> -#define IH_OS_OPENBSD          1       /* OpenBSD      */
>> -#define IH_OS_NETBSD           2       /* NetBSD       */
>> -#define IH_OS_FREEBSD          3       /* FreeBSD      */
>> -#define IH_OS_4_4BSD           4       /* 4.4BSD       */
>> -#define IH_OS_LINUX            5       /* Linux        */
>> -#define IH_OS_SVR4             6       /* SVR4         */
>> -#define IH_OS_ESIX             7       /* Esix         */
>> -#define IH_OS_SOLARIS          8       /* Solaris      */
>> -#define IH_OS_IRIX             9       /* Irix         */
>> -#define IH_OS_SCO              10      /* SCO          */
>> -#define IH_OS_DELL             11      /* Dell         */
>> -#define IH_OS_NCR              12      /* NCR          */
>> -#define IH_OS_LYNXOS           13      /* LynxOS       */
>> -#define IH_OS_VXWORKS          14      /* VxWorks      */
>> -#define IH_OS_PSOS             15      /* pSOS         */
>> -#define IH_OS_QNX              16      /* QNX          */
>> -#define IH_OS_U_BOOT           17      /* Firmware     */
>> -#define IH_OS_RTEMS            18      /* RTEMS        */
>> -#define IH_OS_ARTOS            19      /* ARTOS        */
>> -#define IH_OS_UNITY            20      /* Unity OS     */
>> +#define IH_OS_INVALID 0 /* Invalid OS */
>> +#define IH_OS_OPENBSD 1 /* OpenBSD */
>> +#define IH_OS_NETBSD  2 /* NetBSD */
>> +#define IH_OS_FREEBSD 3 /* FreeBSD */
>> +#define IH_OS_4_4BSD  4 /* 4.4BSD */
>> +#define IH_OS_LINUX   5 /* Linux */
>> +#define IH_OS_SVR4    6 /* SVR4 */
>> +#define IH_OS_ESIX    7 /* Esix */
>> +#define IH_OS_SOLARIS 8 /* Solaris */
>> +#define IH_OS_IRIX    9 /* Irix */
>> +#define IH_OS_SCO     10 /* SCO */
>> +#define IH_OS_DELL    11 /* Dell */
>> +#define IH_OS_NCR     12 /* NCR */
>> +#define IH_OS_LYNXOS  13 /* LynxOS */
>> +#define IH_OS_VXWORKS 14 /* VxWorks */
>> +#define IH_OS_PSOS    15 /* pSOS */
>> +#define IH_OS_QNX     16 /* QNX */
>> +#define IH_OS_U_BOOT  17 /* Firmware */
>> +#define IH_OS_RTEMS   18 /* RTEMS */
>> +#define IH_OS_ARTOS   19 /* ARTOS */
>> +#define IH_OS_UNITY   20 /* Unity OS */
>>
>>   /*
>>    * CPU Architecture Codes (supported by Linux)
>>    */
>> -#define IH_CPU_INVALID         0       /* Invalid CPU  */
>> -#define IH_CPU_ALPHA           1       /* Alpha        */
>> -#define IH_CPU_ARM             2       /* ARM          */
>> -#define IH_CPU_I386            3       /* Intel x86    */
>> -#define IH_CPU_IA64            4       /* IA64         */
>> -#define IH_CPU_MIPS            5       /* MIPS         */
>> -#define IH_CPU_MIPS64          6       /* MIPS  64 Bit */
>> -#define IH_CPU_PPC             7       /* PowerPC      */
>> -#define IH_CPU_S390            8       /* IBM S390     */
>> -#define IH_CPU_SH              9       /* SuperH       */
>> -#define IH_CPU_SPARC           10      /* Sparc        */
>> -#define IH_CPU_SPARC64         11      /* Sparc 64 Bit */
>> -#define IH_CPU_M68K            12      /* M68K         */
>> -#define IH_CPU_NIOS            13      /* Nios-32      */
>> -#define IH_CPU_MICROBLAZE      14      /* MicroBlaze   */
>> -#define IH_CPU_NIOS2           15      /* Nios-II      */
>> -#define IH_CPU_BLACKFIN                16      /* Blackfin     */
>> -#define IH_CPU_AVR32           17      /* AVR32        */
>> +#define IH_CPU_INVALID    0 /* Invalid CPU */
>> +#define IH_CPU_ALPHA      1 /* Alpha */
>> +#define IH_CPU_ARM        2 /* ARM */
>> +#define IH_CPU_I386       3 /* Intel x86 */
>> +#define IH_CPU_IA64       4 /* IA64 */
>> +#define IH_CPU_MIPS       5 /* MIPS */
>> +#define IH_CPU_MIPS64     6 /* MIPS  64 Bit */
>> +#define IH_CPU_PPC        7 /* PowerPC */
>> +#define IH_CPU_S390       8 /* IBM S390 */
>> +#define IH_CPU_SH         9 /* SuperH */
>> +#define IH_CPU_SPARC      10 /* Sparc */
>> +#define IH_CPU_SPARC64    11 /* Sparc 64 Bit */
>> +#define IH_CPU_M68K       12 /* M68K */
>> +#define IH_CPU_NIOS       13 /* Nios-32 */
>> +#define IH_CPU_MICROBLAZE 14 /* MicroBlaze   */
>> +#define IH_CPU_NIOS2      15 /* Nios-II */
>> +#define IH_CPU_BLACKFIN   16 /* Blackfin */
>> +#define IH_CPU_AVR32      17 /* AVR32 */
>>
>>   /*
>>    * Image Types
>>    *
>>    * "Standalone Programs" are directly runnable in the environment
>> - *     provided by U-Boot; it is expected that (if they behave
>> - *     well) you can continue to work in U-Boot after return from
>> - *     the Standalone Program.
>> + * provided by U-Boot; it is expected that (if they behave
>> + * well) you can continue to work in U-Boot after return from
>> + * the Standalone Program.
>>    * "OS Kernel Images" are usually images of some Embedded OS which
>> - *     will take over control completely. Usually these programs
>> - *     will install their own set of exception handlers, device
>> - *     drivers, set up the MMU, etc. - this means, that you cannot
>> - *     expect to re-enter U-Boot except by resetting the CPU.
>> + * will take over control completely. Usually these programs
>> + * will install their own set of exception handlers, device
>> + * drivers, set up the MMU, etc. - this means, that you cannot
>> + * expect to re-enter U-Boot except by resetting the CPU.
>>    * "RAMDisk Images" are more or less just data blocks, and their
>> - *     parameters (address, size) are passed to an OS kernel that is
>> - *     being started.
>> + * parameters (address, size) are passed to an OS kernel that is
>> + * being started.
>>    * "Multi-File Images" contain several images, typically an OS
>> - *     (Linux) kernel image and one or more data images like
>> - *     RAMDisks. This construct is useful for instance when you want
>> - *     to boot over the network using BOOTP etc., where the boot
>> - *     server provides just a single image file, but you want to get
>> - *     for instance an OS kernel and a RAMDisk image.
>> + * (Linux) kernel image and one or more data images like
>> + * RAMDisks. This construct is useful for instance when you want
>> + * to boot over the network using BOOTP etc., where the boot
>> + * server provides just a single image file, but you want to get
>> + * for instance an OS kernel and a RAMDisk image.
>>    *
>> - *     "Multi-File Images" start with a list of image sizes, each
>> - *     image size (in bytes) specified by an "uint32_t" in network
>> - *     byte order. This list is terminated by an "(uint32_t)0".
>> - *     Immediately after the terminating 0 follow the images, one by
>> - *     one, all aligned on "uint32_t" boundaries (size rounded up to
>> - *     a multiple of 4 bytes - except for the last file).
>> + * "Multi-File Images" start with a list of image sizes, each
>> + * image size (in bytes) specified by an "uint32_t" in network
>> + * byte order. This list is terminated by an "(uint32_t)0".
>> + * Immediately after the terminating 0 follow the images, one by
>> + * one, all aligned on "uint32_t" boundaries (size rounded up to
>> + * a multiple of 4 bytes - except for the last file).
>>    *
>>    * "Firmware Images" are binary images containing firmware (like
>> - *     U-Boot or FPGA images) which usually will be programmed to
>> - *     flash memory.
>> + * U-Boot or FPGA images) which usually will be programmed to
>> + * flash memory.
>>    *
>>    * "Script files" are command sequences that will be executed by
>> - *     U-Boot's command interpreter; this feature is especially
>> - *     useful when you configure U-Boot to use a real shell (hush)
>> - *     as command interpreter (=> Shell Scripts).
>> + * U-Boot's command interpreter; this feature is especially
>> + * useful when you configure U-Boot to use a real shell (hush)
>> + * as command interpreter (=> Shell Scripts).
>>    */
>>
>> -#define IH_TYPE_INVALID                0       /* Invalid Image                */
>> -#define IH_TYPE_STANDALONE     1       /* Standalone Program           */
>> -#define IH_TYPE_KERNEL         2       /* OS Kernel Image              */
>> -#define IH_TYPE_RAMDISK                3       /* RAMDisk Image                */
>> -#define IH_TYPE_MULTI          4       /* Multi-File Image             */
>> -#define IH_TYPE_FIRMWARE       5       /* Firmware Image               */
>> -#define IH_TYPE_SCRIPT         6       /* Script file                  */
>> -#define IH_TYPE_FILESYSTEM     7       /* Filesystem Image (any type)  */
>> -#define IH_TYPE_FLATDT         8       /* Binary Flat Device Tree Blob */
>> -#define IH_TYPE_KERNEL_NOLOAD  14      /* OS Kernel Image (noload)     */
>> +#define IH_TYPE_INVALID       0 /* Invalid Image */
>> +#define IH_TYPE_STANDALONE    1 /* Standalone Program */
>> +#define IH_TYPE_KERNEL        2 /* OS Kernel Image */
>> +#define IH_TYPE_RAMDISK       3 /* RAMDisk Image */
>> +#define IH_TYPE_MULTI         4 /* Multi-File Image */
>> +#define IH_TYPE_FIRMWARE      5 /* Firmware Image */
>> +#define IH_TYPE_SCRIPT        6 /* Script file */
>> +#define IH_TYPE_FILESYSTEM    7 /* Filesystem Image (any type) */
>> +#define IH_TYPE_FLATDT        8 /* Binary Flat Device Tree Blob */
>> +#define IH_TYPE_KERNEL_NOLOAD 14 /* OS Kernel Image (noload) */
>>
>>   /*
>>    * Compression Types
>>    */
>> -#define IH_COMP_NONE           0       /*  No   Compression Used       */
>> -#define IH_COMP_GZIP           1       /* gzip  Compression Used       */
>> -#define IH_COMP_BZIP2          2       /* bzip2 Compression Used       */
>> +#define IH_COMP_NONE  0 /*  No  Compression Used */
>> +#define IH_COMP_GZIP  1 /* gzip  Compression Used */
>> +#define IH_COMP_BZIP2 2 /* bzip2 Compression Used */
>>
>> -#define IH_MAGIC       0x27051956      /* Image Magic Number           */
>> -#define IH_NMLEN               32      /* Image Name Length            */
>> +#define IH_MAGIC 0x27051956 /* Image Magic Number */
>> +#define IH_NMLEN 32 /* Image Name Length */
>>
>>   /*
>>    * all data in network byte order (aka natural aka bigendian)
>>    */
>>
>>   typedef struct uboot_image_header {
>> -       uint32_t        ih_magic;       /* Image Header Magic Number    */
>> -       uint32_t        ih_hcrc;        /* Image Header CRC Checksum    */
>> -       uint32_t        ih_time;        /* Image Creation Timestamp     */
>> -       uint32_t        ih_size;        /* Image Data Size              */
>> -       uint32_t        ih_load;        /* Data  Load  Address          */
>> -       uint32_t        ih_ep;          /* Entry Point Address          */
>> -       uint32_t        ih_dcrc;        /* Image Data CRC Checksum      */
>> -       uint8_t         ih_os;          /* Operating System             */
>> -       uint8_t         ih_arch;        /* CPU architecture             */
>> -       uint8_t         ih_type;        /* Image Type                   */
>> -       uint8_t         ih_comp;        /* Compression Type             */
>> -       uint8_t         ih_name[IH_NMLEN];      /* Image Name           */
>> +        uint32_t ih_magic;         /* Image Header Magic Number */
>> +        uint32_t ih_hcrc;          /* Image Header CRC Checksum */
>> +        uint32_t ih_time;          /* Image Creation Timestamp */
>> +        uint32_t ih_size;          /* Image Data Size */
>> +        uint32_t ih_load;          /* Data  Load  Address */
>> +        uint32_t ih_ep;            /* Entry Point Address */
>> +        uint32_t ih_dcrc;          /* Image Data CRC Checksum */
>> +        uint8_t ih_os;             /* Operating System */
>> +        uint8_t ih_arch;           /* CPU architecture */
>> +        uint8_t ih_type;           /* Image Type */
>> +        uint8_t ih_comp;           /* Compression Type */
>> +        uint8_t ih_name[IH_NMLEN]; /* Image Name */
>>   } uboot_image_header_t;
>>
>> -
>>   #endif /* UBOOT_IMAGE_H */
>> diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
>> index 7fb620b9a0..5ec3a9a17f 100644
>> --- a/hw/ppc/ppc440_bamboo.c
>> +++ b/hw/ppc/ppc440_bamboo.c
>> @@ -3,9 +3,9 @@
>>    *
>>    * Copyright 2007 IBM Corporation.
>>    * Authors:
>> - *     Jerone Young <jyoung5@us.ibm.com>
>> - *     Christian Ehrhardt <ehrhardt@linux.vnet.ibm.com>
>> - *     Hollis Blanchard <hollisb@us.ibm.com>
>> + *  Jerone Young <jyoung5@us.ibm.com>
>> + *  Christian Ehrhardt <ehrhardt@linux.vnet.ibm.com>
>> + *  Hollis Blanchard <hollisb@us.ibm.com>
>>    *
>>    * This work is licensed under the GNU GPL license version 2 or later.
>>    *
>> diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
>> index d7c04237fe..d58b65e88f 100644
>> --- a/hw/ppc/spapr_rtas.c
>> +++ b/hw/ppc/spapr_rtas.c
>> @@ -474,16 +474,16 @@ static void rtas_ibm_nmi_interlock(PowerPCCPU *cpu,
>>
>>       if (spapr->fwnmi_machine_check_interlock != cpu->vcpu_id) {
>>           /*
>> -        * The vCPU that hit the NMI should invoke "ibm,nmi-interlock"
>> +         * The vCPU that hit the NMI should invoke "ibm,nmi-interlock"
>>            * This should be PARAM_ERROR, but Linux calls "ibm,nmi-interlock"
>> -        * for system reset interrupts, despite them not being interlocked.
>> -        * PowerVM silently ignores this and returns success here. Returning
>> -        * failure causes Linux to print the error "FWNMI: nmi-interlock
>> -        * failed: -3", although no other apparent ill effects, this is a
>> -        * regression for the user when enabling FWNMI. So for now, match
>> -        * PowerVM. When most Linux clients are fixed, this could be
>> -        * changed.
>> -        */
>> +         * for system reset interrupts, despite them not being interlocked.
>> +         * PowerVM silently ignores this and returns success here. Returning
>> +         * failure causes Linux to print the error "FWNMI: nmi-interlock
>> +         * failed: -3", although no other apparent ill effects, this is a
>> +         * regression for the user when enabling FWNMI. So for now, match
>> +         * PowerVM. When most Linux clients are fixed, this could be
>> +         * changed.
>> +         */
>>           rtas_st(rets, 0, RTAS_OUT_SUCCESS);
>>           return;
>>       }
>> diff --git a/include/hw/ppc/ppc.h b/include/hw/ppc/ppc.h
>> index 364f165b4b..02af03ada2 100644
>> --- a/include/hw/ppc/ppc.h
>> +++ b/include/hw/ppc/ppc.h
>> @@ -99,11 +99,11 @@ enum {
>>       ARCH_MAC99_U3,
>>   };
>>
>> -#define FW_CFG_PPC_WIDTH       (FW_CFG_ARCH_LOCAL + 0x00)
>> -#define FW_CFG_PPC_HEIGHT      (FW_CFG_ARCH_LOCAL + 0x01)
>> -#define FW_CFG_PPC_DEPTH       (FW_CFG_ARCH_LOCAL + 0x02)
>> -#define FW_CFG_PPC_TBFREQ      (FW_CFG_ARCH_LOCAL + 0x03)
>> -#define FW_CFG_PPC_CLOCKFREQ   (FW_CFG_ARCH_LOCAL + 0x04)
>> +#define FW_CFG_PPC_WIDTH        (FW_CFG_ARCH_LOCAL + 0x00)
>> +#define FW_CFG_PPC_HEIGHT       (FW_CFG_ARCH_LOCAL + 0x01)
>> +#define FW_CFG_PPC_DEPTH        (FW_CFG_ARCH_LOCAL + 0x02)
>> +#define FW_CFG_PPC_TBFREQ       (FW_CFG_ARCH_LOCAL + 0x03)
>> +#define FW_CFG_PPC_CLOCKFREQ    (FW_CFG_ARCH_LOCAL + 0x04)
>>   #define FW_CFG_PPC_IS_KVM       (FW_CFG_ARCH_LOCAL + 0x05)
>>   #define FW_CFG_PPC_KVM_HC       (FW_CFG_ARCH_LOCAL + 0x06)
>>   #define FW_CFG_PPC_KVM_PID      (FW_CFG_ARCH_LOCAL + 0x07)
>> --
> 
> 
> Regards,
> Bin

