Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCE369FD7D
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 22:07:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUwKh-0006Eh-Nh; Wed, 22 Feb 2023 16:07:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1pUwKf-0006EA-0d
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 16:07:21 -0500
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1pUwKc-0002CP-Lb
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 16:07:20 -0500
Received: by mail-lj1-x231.google.com with SMTP id h9so9119065ljq.2
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 13:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MlXM6ZrIpRf8rBTizlTpeXxtFk14PmrQOHI6VbL5slc=;
 b=hz0sK8yPvJTMeHsJ92k/r0SUecdFRgkyVPMhM+BrU+MavYaJBXLK14WFACRgfM+tRe
 A1SUWfk9BqjOlU3scE/xiwxhUEiX/FoAYpm08xDGVgx2luzwAuJlpksJRSkT7lpTfduL
 HSQhy3/WItZlPNKCID1vXHgaEQFzMWqFLbDCgs2+2QAtxz9nc6h2sg4T3YAEoGI8aX/d
 A7iBK5MD7YAqKB10G9RIT2c1+5xLj/nAw6n1YlYjTkpDk52T0QHmrQ7JSuVjXsbWBOe8
 2VgrPoo4XyNUnItlyOPP8NNRGDEBYu7Lxgy/PktG6bXZ7OFvqY6hrdY0wLyQs/p0FUry
 eAIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MlXM6ZrIpRf8rBTizlTpeXxtFk14PmrQOHI6VbL5slc=;
 b=mNAeTYiZWKmNzrr9PkfDYUlj50JEwFXp+jjcIP4IJ9agtI9tQVTleoQ19Xeji6MuSx
 UpwIUYprn/grvJryZCccBoxBDlWybSCFqV6hE7XSdruBoZuNwgO9FDWPpmX7VOS2eLa0
 8ps7Scnk3IArUXJF6JA3otD3AuU4EMU2qaJyVv96z/ivfuGyaxm1AVPb+0uF30FUTaB6
 IOycyRiLgXobs9lEnGDwwyOyRjB1Yuz/yKwURFMd5seXECsS7gzN8g0b9XX1r53sc7Yi
 YEYgLYpT6VEKW5rx4GitxkQh6Q/+a+nN16V5DPUbb2bqJvz+t2wzehpcPJhdiHYPar1v
 X/SA==
X-Gm-Message-State: AO0yUKWhN3jMhPrMKP6+ERxDv6WujWC7ECBHNvZEzr0DsTmQ9zmUVeYV
 UYONFjOvWRGVAy3N0Zi4H8uwqQZC1KwqCtxgbs6Btg==
X-Google-Smtp-Source: AK7set9jgLNhBbidR7G/1TRj3xI6FojM5sF7RWLuB0vQWJ9N7MgW0MUcfVmfqa771wWjDTUdJHPNeDUwKkFidaQjnmY=
X-Received: by 2002:a2e:a269:0:b0:295:8c06:2501 with SMTP id
 k9-20020a2ea269000000b002958c062501mr2043949ljm.5.1677100036683; Wed, 22 Feb
 2023 13:07:16 -0800 (PST)
MIME-Version: 1.0
References: <20221130000320.287976-1-viktor@daynix.com>
 <20221130000320.287976-3-viktor@daynix.com>
 <da21c1d2-8e9f-ddf4-a03d-98bfd3d7ba1d@oracle.com>
In-Reply-To: <da21c1d2-8e9f-ddf4-a03d-98bfd3d7ba1d@oracle.com>
From: Viktor Prutyanov <viktor@daynix.com>
Date: Thu, 23 Feb 2023 00:07:05 +0300
Message-ID: <CAPv0NP7wsgR3b1VLiiiqBrqRV_3sVSkYRr37s6sj1J1g8NvtcQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] contrib/elf2dmp: move PE dir search to
 pe_get_data_dir_entry
To: "Annie.li" <annie.li@oracle.com>
Cc: pbonzini@redhat.com, viktor.prutyanov@phystech.edu, 
 yuri.benditovich@daynix.com, yan@daynix.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::231;
 envelope-from=viktor@daynix.com; helo=mail-lj1-x231.google.com
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

Hello,

On Wed, Feb 22, 2023 at 10:07 PM Annie.li <annie.li@oracle.com> wrote:
>
> Hello Viktor,
>
> See my following comments inline,
>
> On 11/29/2022 7:03 PM, Viktor Prutyanov wrote:
> > Move out PE directory search functionality to be reused not only
> > for Debug Directory processing but for arbitrary PE directory.
> >
> > Signed-off-by: Viktor Prutyanov <viktor@daynix.com>
> > ---
> >   contrib/elf2dmp/main.c | 66 +++++++++++++++++++++++-------------------
> >   1 file changed, 37 insertions(+), 29 deletions(-)
> >
> > diff --git a/contrib/elf2dmp/main.c b/contrib/elf2dmp/main.c
> > index 9224764239..f3052b3c64 100644
> > --- a/contrib/elf2dmp/main.c
> > +++ b/contrib/elf2dmp/main.c
> > @@ -333,6 +333,40 @@ static int fill_context(KDDEBUGGER_DATA64 *kdbg,
> >       return 0;
> >   }
> >
> > +static int pe_get_data_dir_entry(uint64_t base, void *start_addr, int idx,
> > +        void *entry, size_t size, struct va_space *vs)
> > +{
> > +    const char e_magic[2] = "MZ";
> > +    const char Signature[4] = "PE\0\0";
> > +    IMAGE_DOS_HEADER *dos_hdr = start_addr;
> > +    IMAGE_NT_HEADERS64 nt_hdrs;
> > +    IMAGE_FILE_HEADER *file_hdr = &nt_hdrs.FileHeader;
> > +    IMAGE_OPTIONAL_HEADER64 *opt_hdr = &nt_hdrs.OptionalHeader;
> > +    IMAGE_DATA_DIRECTORY *data_dir = nt_hdrs.OptionalHeader.DataDirectory;
> > +
> > +    if (memcmp(&dos_hdr->e_magic, e_magic, sizeof(e_magic))) {
> > +        return 1;
> > +    }
> > +
> > +    if (va_space_rw(vs, base + dos_hdr->e_lfanew,
> > +                &nt_hdrs, sizeof(nt_hdrs), 0)) {
> > +        return 1;
> > +    }
> > +
> > +    if (memcmp(&nt_hdrs.Signature, Signature, sizeof(Signature)) ||
> > +            file_hdr->Machine != 0x8664 || opt_hdr->Magic != 0x020b) {
> > +        return 1;
> > +    }
> > +
> > +    if (va_space_rw(vs,
> > +                base + data_dir[idx].VirtualAddress,
> > +                entry, size, 0)) {
> > +        return 1;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> >   static int write_dump(struct pa_space *ps,
> >           WinDumpHeader64 *hdr, const char *name)
> >   {
> > @@ -369,42 +403,16 @@ static int write_dump(struct pa_space *ps,
> >   static int pe_get_pdb_symstore_hash(uint64_t base, void *start_addr,
> >           char *hash, struct va_space *vs)
> >   {
> > -    const char e_magic[2] = "MZ";
> > -    const char Signature[4] = "PE\0\0";
> >       const char sign_rsds[4] = "RSDS";
> > -    IMAGE_DOS_HEADER *dos_hdr = start_addr;
> > -    IMAGE_NT_HEADERS64 nt_hdrs;
> > -    IMAGE_FILE_HEADER *file_hdr = &nt_hdrs.FileHeader;
> > -    IMAGE_OPTIONAL_HEADER64 *opt_hdr = &nt_hdrs.OptionalHeader;
> > -    IMAGE_DATA_DIRECTORY *data_dir = nt_hdrs.OptionalHeader.DataDirectory;
> >       IMAGE_DEBUG_DIRECTORY debug_dir;
> >       OMFSignatureRSDS rsds;
> >       char *pdb_name;
> >       size_t pdb_name_sz;
> >       size_t i;
> >
> > -    QEMU_BUILD_BUG_ON(sizeof(*dos_hdr) >= ELF2DMP_PAGE_SIZE);
>
> This BUG_ON gets removed due to encapsulating the code into function
> pe_get_data_dir_entry.
>
> Any reason of not keeping this check in pe_get_data_dir_entry?
> > -
> > -    if (memcmp(&dos_hdr->e_magic, e_magic, sizeof(e_magic))) {
> > -        return 1;
> > -    }
> > -
> > -    if (va_space_rw(vs, base + dos_hdr->e_lfanew,
> > -                &nt_hdrs, sizeof(nt_hdrs), 0)) {
> > -        return 1;
> > -    }
> > -
> > -    if (memcmp(&nt_hdrs.Signature, Signature, sizeof(Signature)) ||
> > -            file_hdr->Machine != 0x8664 || opt_hdr->Magic != 0x020b) {
> > -        return 1;
> > -    }
> > -
> > -    printf("Debug Directory RVA = 0x%08"PRIx32"\n",
> > -            (uint32_t)data_dir[IMAGE_FILE_DEBUG_DIRECTORY].VirtualAddress);
>
> Or add common log for both Debug and PE directory instead of removing it?

Sounds reasonable, I will send a new version.

Best regards,
Viktor Prutyanov

>
> Thanks
>
> Annie
>
> > -
> > -    if (va_space_rw(vs,
> > -                base + data_dir[IMAGE_FILE_DEBUG_DIRECTORY].VirtualAddress,
> > -                &debug_dir, sizeof(debug_dir), 0)) {
> > +    if (pe_get_data_dir_entry(base, start_addr, IMAGE_FILE_DEBUG_DIRECTORY,
> > +                &debug_dir, sizeof(debug_dir), vs)) {
> > +        eprintf("Failed to get Debug Directory\n");
> >           return 1;
> >       }
> >

