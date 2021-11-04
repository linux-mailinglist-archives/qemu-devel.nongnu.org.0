Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 158ED445286
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 12:51:51 +0100 (CET)
Received: from localhost ([::1]:44306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mibHa-0003FF-7x
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 07:51:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1mibDe-0000xl-Pc
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 07:47:47 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:37524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1mibDb-00057R-Vi
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 07:47:46 -0400
Received: by mail-oi1-x22b.google.com with SMTP id o83so8783754oif.4
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 04:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sFQunZKX7zcACLbJIQ7KqUdb8rUHTzsSetfHItzFbyw=;
 b=rx7hMkNoiliZDkmP50B3n8aM+NKUVz6Uvi+V4w7Rt64JJl1+reSeQVODNub/iH9+ne
 IKD+hF4kyhZsFysJxO66QXFvVjdHX2aEIzFaqYC5IorFSvqNEvxbo1rO11at3Gawv8ek
 wiR7PGg86hXKpfwMomHbG23ZFf39xtxt4xVElsYW0BYvvm+cBx3UXtNwl1GLqFNy6eK2
 Rb4mRV7Rxo5jzuaEbr7+z4Q4e/NTuBrxFweW021wbK8asuIKxWvYyZ9Bzadv91IhQyzd
 SCY1QQ5opR1zzyrSWTDgEF1iEPwkwZvx71AnxX6uBR3Zd5uKR9Gmno71Mi6hNnyD42KW
 XLHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sFQunZKX7zcACLbJIQ7KqUdb8rUHTzsSetfHItzFbyw=;
 b=UJTt/BA7ExO8imbNRb3zknEdJio/OMegWFoe4mPu1sXk+YbGIin4DufEp3c1GLwlHf
 ZxMZz1GnNSMXsQaoNL5B1sv5+1McrGNdCYtGNd5w4lHDKrW62qC3Lp+6SU1DO/qBgabf
 epNmME2rMHwhMthPocl25JdLzm2YgTIyosXVUBqiHG3buwcnk7EhVa2UmOTL5fmvFrss
 eTxonXcQkWwRX13xp+IzTp1EI4k6xCBe1slL93o5isp8tO/L61CHuzFe1L+WrL7+HWXO
 7FeBBgf3j3maHDYQXBXacdFGowYbvj42xdFMvfULe0lIDwVIlwgYdC+WqzPauwxKU3Rt
 O6MA==
X-Gm-Message-State: AOAM533LcX7jhZQH/3hrfkHbbiCttH8eRhIkbuFtMIn4qIbiXFigY3UF
 X+nkuw5qmPWALqzgTepYloMsy75DX4RCSN8UiXWWWA==
X-Google-Smtp-Source: ABdhPJyvmJiSxYfUfvqxJ23icX8H3+XShyRH7uLomZJl+pnDQVsZHJ34yJc4f24vQcrHM4wLEU/8iRHIhI+2MQPqXDU=
X-Received: by 2002:aca:1a09:: with SMTP id a9mr5317457oia.54.1636026458049;
 Thu, 04 Nov 2021 04:47:38 -0700 (PDT)
MIME-Version: 1.0
References: <20211103161300.114741-1-viktor.prutyanov@phystech.edu>
 <20211103161300.114741-4-viktor.prutyanov@phystech.edu>
In-Reply-To: <20211103161300.114741-4-viktor.prutyanov@phystech.edu>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Thu, 4 Nov 2021 13:47:27 +0200
Message-ID: <CAOEp5OeZ4da6bcF6XotxLTDCH=ZO3iMj-Kv6kQhCHM3+dtJUMg@mail.gmail.com>
Subject: Re: [PATCH 3/3] contrib/elf2dmp: add PE name check and Windows Server
 2022 support
To: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::22b;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-oi1-x22b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Yan Vugenfirer <yan@daynix.com>, peter.maydell@linaro.org,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 3, 2021 at 6:13 PM Viktor Prutyanov
<viktor.prutyanov@phystech.edu> wrote:
>
> Since its inception elf2dmp has checked MZ signatures within an
> address space above IDT[0] interrupt vector and took first PE image
> found as Windows Kernel.
> But in Windows Server 2022 memory dump this address space range is
> full of invalid PE fragments and the tool must check that PE image
> is 'ntoskrnl.exe' actually.
> So, introduce additional validation by checking image name from
> Export Directory against 'ntoskrnl.exe'.
>
> Signed-off-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Tested-by: Yuri Benditovich <yuri.benditovich@daynix.com>
> ---
>  contrib/elf2dmp/main.c | 28 ++++++++++++++++++++++++++--
>  contrib/elf2dmp/pe.h   | 15 +++++++++++++++
>  2 files changed, 41 insertions(+), 2 deletions(-)
>
> diff --git a/contrib/elf2dmp/main.c b/contrib/elf2dmp/main.c
> index a62fde23cc..04cdd07292 100644
> --- a/contrib/elf2dmp/main.c
> +++ b/contrib/elf2dmp/main.c
> @@ -17,6 +17,7 @@
>
>  #define SYM_URL_BASE    "https://msdl.microsoft.com/download/symbols/"
>  #define PDB_NAME    "ntkrnlmp.pdb"
> +#define PE_NAME     "ntoskrnl.exe"
>
>  #define INITIAL_MXCSR   0x1f80
>
> @@ -399,6 +400,25 @@ static int write_dump(struct pa_space *ps,
>      return fclose(dmp_file);
>  }
>
> +static bool pe_check_export_name(uint64_t base, void *start_addr,
> +        struct va_space *vs)
> +{
> +    IMAGE_EXPORT_DIRECTORY export_dir;
> +    const char *pe_name;
> +
> +    if (pe_get_data_dir_entry(base, start_addr, IMAGE_FILE_EXPORT_DIRECTORY,
> +                &export_dir, sizeof(export_dir), vs)) {
> +        return false;
> +    }
> +
> +    pe_name = va_space_resolve(vs, base + export_dir.Name);
> +    if (!pe_name) {
> +        return false;
> +    }
> +
> +    return !strcmp(pe_name, PE_NAME);
> +}
> +
>  static int pe_get_pdb_symstore_hash(uint64_t base, void *start_addr,
>          char *hash, struct va_space *vs)
>  {
> @@ -483,6 +503,7 @@ int main(int argc, char *argv[])
>      uint64_t KdDebuggerDataBlock;
>      KDDEBUGGER_DATA64 *kdbg;
>      uint64_t KdVersionBlock;
> +    bool kernel_found = false;
>
>      if (argc != 3) {
>          eprintf("usage:\n\t%s elf_file dmp_file\n", argv[0]);
> @@ -530,11 +551,14 @@ int main(int argc, char *argv[])
>          }
>
>          if (*(uint16_t *)nt_start_addr == 0x5a4d) { /* MZ */
> -            break;
> +            if (pe_check_export_name(KernBase, nt_start_addr, &vs)) {
> +                kernel_found = true;
> +                break;
> +            }
>          }
>      }
>
> -    if (!nt_start_addr) {
> +    if (!kernel_found) {
>          eprintf("Failed to find NT kernel image\n");
>          err = 1;
>          goto out_ps;
> diff --git a/contrib/elf2dmp/pe.h b/contrib/elf2dmp/pe.h
> index 807d006364..71126af1ac 100644
> --- a/contrib/elf2dmp/pe.h
> +++ b/contrib/elf2dmp/pe.h
> @@ -88,6 +88,20 @@ typedef struct IMAGE_NT_HEADERS64 {
>      IMAGE_OPTIONAL_HEADER64 OptionalHeader;
>  } __attribute__ ((packed)) IMAGE_NT_HEADERS64;
>
> +typedef struct IMAGE_EXPORT_DIRECTORY {
> +    uint32_t    Characteristics;
> +    uint32_t    TimeDateStamp;
> +    uint16_t    MajorVersion;
> +    uint16_t    MinorVersion;
> +    uint32_t    Name;
> +    uint32_t    Base;
> +    uint32_t    NumberOfFunctions;
> +    uint32_t    NumberOfNames;
> +    uint32_t    AddressOfFunctions;
> +    uint32_t    AddressOfNames;
> +    uint32_t    AddressOfNameOrdinals;
> +} __attribute__ ((packed)) IMAGE_EXPORT_DIRECTORY;
> +
>  typedef struct IMAGE_DEBUG_DIRECTORY {
>      uint32_t Characteristics;
>      uint32_t TimeDateStamp;
> @@ -102,6 +116,7 @@ typedef struct IMAGE_DEBUG_DIRECTORY {
>  #define IMAGE_DEBUG_TYPE_CODEVIEW   2
>  #endif
>
> +#define IMAGE_FILE_EXPORT_DIRECTORY 0
>  #define IMAGE_FILE_DEBUG_DIRECTORY  6
>
>  typedef struct guid_t {
> --
> 2.31.1
>

