Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F64D69FC97
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 20:57:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUvDx-0000JX-Kh; Wed, 22 Feb 2023 14:56:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1pUvDn-0000Iu-Q7
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 14:56:13 -0500
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1pUvDi-0003lC-8n
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 14:56:09 -0500
Received: by mail-lj1-x22b.google.com with SMTP id j17so9211872ljq.11
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 11:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DkUo6IgcgiDFuNcKiqZXynIGHBiV5HVMxU+752Shms4=;
 b=N5XSBYH31wQ6DYN3idlmwopRDQBqfsB7XLQLuQcHebjy7Xgdk375YHr5WDyPKFsvTH
 TbnAWcbVMBh8YYtltX0DxNZkTc/0ZoXSgx6X0Bd+gSKGT6skF224o5FAWLCtc2kCiNGQ
 JeC9MvBGVAAWckTuDdHRQR58anAEmZEJ3/JNYhcO/VteoJZaCrxea31Gzv6418E5HkXo
 GtHiMEIkZDmBoAG+dTKDemuqh2cuA0CPuRR3NwkEKdWq7Xf8zHk1hrKcBl7BYr7QQIDa
 ZssloHEXSeRd2H/Y02yW6GE6F38vt6vPvFCHh8Xt5//BuSqfLXeuCkzb643Nxh9lzsAh
 mXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DkUo6IgcgiDFuNcKiqZXynIGHBiV5HVMxU+752Shms4=;
 b=i3aYBEavnWAfb+0g7bxFJquypPj5OZnZE1mkSAZYZL2hianXtDBu99KY0VTyKeHsX3
 TWB6LU+DJGXcguriBUfTE/9Fje8F+Us2xunhxaWGd5PVavFPU9lZ3WLvXW7lxcYg3pi7
 a5cEbWAOVI1Ke87M0/9TLUTRUzfw6XWbBrmrm6u6K7Hk5ckDLT+3648fe4TbOxXBzSs/
 STvf/Jwqp9sPgivrsR0OXSHHA4m5ASJobOmosSNROE4y7kUIlZHashPEgogsUSHKsZ9O
 +j2o5A7LVTVe/JqsilYE5MjrDK8LOuNBl6koflWxjh+3a9Bd23OakvyYbN7qVXDO1hSQ
 uSVg==
X-Gm-Message-State: AO0yUKUhfFNlPGuJQRFZCPraW7qgSrh2HkaG4tYAj33QV8rSIauDX1PY
 LPI224Gcs5OxqEH31nqPX56bnEoNT/TDHUSPN6r0rQ==
X-Google-Smtp-Source: AK7set+qTXsF89akqWTdQGSGYcyULtB68wCDCX+zvsJGPFS4yJWz5vy8dmOUpWZ/H3Rb3fP2GYhczmh3A9pX1nY4Lho=
X-Received: by 2002:a05:651c:1699:b0:294:6f14:235b with SMTP id
 bd25-20020a05651c169900b002946f14235bmr3045382ljb.5.1677095763892; Wed, 22
 Feb 2023 11:56:03 -0800 (PST)
MIME-Version: 1.0
References: <20221130000320.287976-1-viktor@daynix.com>
 <20221130000320.287976-4-viktor@daynix.com>
 <e0498f45-3b4f-1bd1-ad53-628fbb807abc@oracle.com>
In-Reply-To: <e0498f45-3b4f-1bd1-ad53-628fbb807abc@oracle.com>
From: Viktor Prutyanov <viktor@daynix.com>
Date: Wed, 22 Feb 2023 22:55:53 +0300
Message-ID: <CAPv0NP7RJp6aazO2VPYjscc6QT4cHEEDdNjDfJxrtZCYH4J0YA@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] contrib/elf2dmp: add PE name check and Windows
 Server 2022 support
To: "Annie.li" <annie.li@oracle.com>
Cc: pbonzini@redhat.com, viktor.prutyanov@phystech.edu, 
 yuri.benditovich@daynix.com, yan@daynix.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::22b;
 envelope-from=viktor@daynix.com; helo=mail-lj1-x22b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Feb 22, 2023 at 10:07 PM Annie.li <annie.li@oracle.com> wrote:
>
>
> On 11/29/2022 7:03 PM, Viktor Prutyanov wrote:
> > Since its inception elf2dmp has checked MZ signatures within an
> > address space above IDT[0] interrupt vector and took first PE image
> > found as Windows Kernel.
> > But in Windows Server 2022 memory dump this address space range is
> > full of invalid PE fragments and the tool must check that PE image
> > is 'ntoskrnl.exe' actually.
> > So, introduce additional validation by checking image name from
> > Export Directory against 'ntoskrnl.exe'.
> >
> > Signed-off-by: Viktor Prutyanov <viktor@daynix.com>
> > Tested-by: Yuri Benditovich <yuri.benditovich@daynix.com>
> > ---
> >   contrib/elf2dmp/main.c | 28 ++++++++++++++++++++++++++--
> >   contrib/elf2dmp/pe.h   | 15 +++++++++++++++
> >   2 files changed, 41 insertions(+), 2 deletions(-)
> >
> > diff --git a/contrib/elf2dmp/main.c b/contrib/elf2dmp/main.c
> > index f3052b3c64..f7de82a03e 100644
> > --- a/contrib/elf2dmp/main.c
> > +++ b/contrib/elf2dmp/main.c
> > @@ -17,6 +17,7 @@
> >
> >   #define SYM_URL_BASE    "https://msdl.microsoft.com/download/symbols/"
> >   #define PDB_NAME    "ntkrnlmp.pdb"
> > +#define PE_NAME     "ntoskrnl.exe"
>
> As what has been clarified earlier in the meeting, this elf2dmp is only for
> 64bits systems, so the name "ntoskrnl.exe" suffices here. Otherwise, it
> won't work
> for 32bits PAE systems.
>
> A question about elf2dmp on ARM platform, has it been validated there?
>
> Thanks
>
> Annie
>
> >
> >   #define INITIAL_MXCSR   0x1f80
> >
> > @@ -400,6 +401,25 @@ static int write_dump(struct pa_space *ps,
> >       return fclose(dmp_file);
> >   }
> >
> > +static bool pe_check_export_name(uint64_t base, void *start_addr,
> > +        struct va_space *vs)
> > +{
> > +    IMAGE_EXPORT_DIRECTORY export_dir;
> > +    const char *pe_name;
> > +
> > +    if (pe_get_data_dir_entry(base, start_addr, IMAGE_FILE_EXPORT_DIRECTORY,
> > +                &export_dir, sizeof(export_dir), vs)) {
> > +        return false;
> > +    }
> > +
> > +    pe_name = va_space_resolve(vs, base + export_dir.Name);
> > +    if (!pe_name) {
> > +        return false;
> > +    }
> > +
> > +    return !strcmp(pe_name, PE_NAME);
> > +}
> > +
> >   static int pe_get_pdb_symstore_hash(uint64_t base, void *start_addr,
> >           char *hash, struct va_space *vs)
> >   {
> > @@ -484,6 +504,7 @@ int main(int argc, char *argv[])
> >       uint64_t KdDebuggerDataBlock;
> >       KDDEBUGGER_DATA64 *kdbg;
> >       uint64_t KdVersionBlock;
> > +    bool kernel_found = false;
> >
> >       if (argc != 3) {
> >           eprintf("usage:\n\t%s elf_file dmp_file\n", argv[0]);
> > @@ -531,11 +552,14 @@ int main(int argc, char *argv[])
> >           }
> >
> >           if (*(uint16_t *)nt_start_addr == 0x5a4d) { /* MZ */
> > -            break;
> > +            if (pe_check_export_name(KernBase, nt_start_addr, &vs)) {
> > +                kernel_found = true;
> > +                break;
> > +            }
> >           }
> >       }
> >
> > -    if (!nt_start_addr) {
> > +    if (!kernel_found) {
> >           eprintf("Failed to find NT kernel image\n");
> >           err = 1;
> >           goto out_ps;
> > diff --git a/contrib/elf2dmp/pe.h b/contrib/elf2dmp/pe.h
> > index 807d006364..71126af1ac 100644
> > --- a/contrib/elf2dmp/pe.h
> > +++ b/contrib/elf2dmp/pe.h
> > @@ -88,6 +88,20 @@ typedef struct IMAGE_NT_HEADERS64 {
> >       IMAGE_OPTIONAL_HEADER64 OptionalHeader;
> >   } __attribute__ ((packed)) IMAGE_NT_HEADERS64;
> >
> > +typedef struct IMAGE_EXPORT_DIRECTORY {
> > +    uint32_t    Characteristics;
> > +    uint32_t    TimeDateStamp;
> > +    uint16_t    MajorVersion;
> > +    uint16_t    MinorVersion;
> > +    uint32_t    Name;
> > +    uint32_t    Base;
> > +    uint32_t    NumberOfFunctions;
> > +    uint32_t    NumberOfNames;
> > +    uint32_t    AddressOfFunctions;
> > +    uint32_t    AddressOfNames;
> > +    uint32_t    AddressOfNameOrdinals;
> > +} __attribute__ ((packed)) IMAGE_EXPORT_DIRECTORY;
> > +
> >   typedef struct IMAGE_DEBUG_DIRECTORY {
> >       uint32_t Characteristics;
> >       uint32_t TimeDateStamp;
> > @@ -102,6 +116,7 @@ typedef struct IMAGE_DEBUG_DIRECTORY {
> >   #define IMAGE_DEBUG_TYPE_CODEVIEW   2
> >   #endif
> >
> > +#define IMAGE_FILE_EXPORT_DIRECTORY 0
> >   #define IMAGE_FILE_DEBUG_DIRECTORY  6
> >
> >   typedef struct guid_t {

Hi Annie,

Thank you for the review!
At the moment, elf2dmp only addresses the x86_64 platform.

Best regards,
Viktor Prutyanov

