Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CF03FA123
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 23:25:54 +0200 (CEST)
Received: from localhost ([::1]:57952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJjMH-0001it-4U
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 17:25:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mJjKI-0000Sm-9L
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 17:23:50 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:46913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mJjKF-0006fI-Bz
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 17:23:50 -0400
Received: by mail-il1-x12f.google.com with SMTP id r6so8359940ilt.13
 for <qemu-devel@nongnu.org>; Fri, 27 Aug 2021 14:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=fcDVZGqzUpm/yS3qFNmMD92VnTL6U9myss2qSB/OaGE=;
 b=OxPxZ2yHQ2w+8ZVP1aOSshuVIA8z7+o495VKU1cwYkZtfQQkvcjckDMi/X2KCCX+sM
 3J/fkuLDfVvoB0Y6ZZhqzIC0ISN/ouuPI1nQQIwztSY9RIO/NhjuRUxCMl4tHzeQiKmT
 TylETVvgFdy5j1+dO5xNDn8yIbcM8UVxt9Ii39yPPDsZYtfebdZZchs9t4Sjv5CWQiuS
 /S89koUHjtUwCvGabhJauKpZdxWBW5TIBr9HUzuHX+82xfjlQxkAehkt4yOT83D0HfZS
 Rel01fWmpYATCBBUXI0KVqOeWsNOcLdf93IY3SbpXXg9g4gre/QoDMi7ygLM0ce0zspO
 czkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=fcDVZGqzUpm/yS3qFNmMD92VnTL6U9myss2qSB/OaGE=;
 b=ZzKsVRQy3vcYBK0SH9RHYZ1ESowWhT6fB9BsiU00eYS8OuP89kMuLQBgzVly5ipCgT
 YVghUKy7wliijeJnZUgVj/eSB18hVuclUHuui/YFr3AMooIbjF7eQgDzSlZ9D9iFbsj1
 U8xtqPG1prT86AOeJt0aXvjVrGXkF0c2tpddJAE+WWCpTiDd9VMuepYcXjseCINw9QHE
 ZeZmDRs/eWpyO4Ge8HwCa3QPs+VNckMXpr5jsyNhehrT8BfmOTprSbhFnE9tmGUxpFcT
 WhLt7muWBdrCYo3pSfy9m6vSDCirBx7556fXlpR6eriiCFpqgKoDnhq+bxeQHW/4FVPz
 FaCQ==
X-Gm-Message-State: AOAM533LyWntbt/8LYtH3rYxVLOmOYZQvVW1fS/qGB0vXNb9CuEi1Iub
 YpHlvQz1RbVLOg72epcegFevJdYQPZVLlw==
X-Google-Smtp-Source: ABdhPJyq4off8UC6N46iG0SjvGi+LBjqp4c0CIg0dw21vKGQU43n6/5/n0C0oIYGmZRB0mKetsgsQA==
X-Received: by 2002:a05:6e02:12a2:: with SMTP id
 f2mr7747324ilr.222.1630099425680; 
 Fri, 27 Aug 2021 14:23:45 -0700 (PDT)
Received: from ?IPv6:2603:300b:6:5100:c17e:7522:3652:c9d4?
 ([2603:300b:6:5100:c17e:7522:3652:c9d4])
 by smtp.gmail.com with ESMTPSA id x5sm3924463ioa.35.2021.08.27.14.23.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 27 Aug 2021 14:23:44 -0700 (PDT)
From: Warner Losh <wlosh@bsdimp.com>
Message-Id: <953824AA-A76D-4522-A93E-58F31FFCECA2@bsdimp.com>
Content-Type: multipart/signed;
 boundary="Apple-Mail=_BB3B0887-F4CE-4BF7-8815-BFE3D2CA0D9A";
 protocol="application/pgp-signature"; micalg=pgp-sha512
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [PATCH v2 38/43] bsd-user: Refactor load_elf_sections and
 is_target_elf_binary
Date: Fri, 27 Aug 2021 15:23:43 -0600
In-Reply-To: <20210826211201.98877-39-imp@bsdimp.com>
To: Warner Losh <imp@bsdimp.com>
References: <20210826211201.98877-1-imp@bsdimp.com>
 <20210826211201.98877-39-imp@bsdimp.com>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
Received-SPF: none client-ip=2607:f8b0:4864:20::12f;
 envelope-from=wlosh@bsdimp.com; helo=mail-il1-x12f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Stacey Son <sson@FreeBSD.org>, Warner Losh <imp@FreeBSD.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?utf-8?Q?Mika=C3=ABl_Urankar?= <mikael.urankar@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Apple-Mail=_BB3B0887-F4CE-4BF7-8815-BFE3D2CA0D9A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Aug 26, 2021, at 3:11 PM, imp@bsdimp.com wrote:
>=20
> From: Warner Losh <imp@FreeBSD.org>
>=20
> Factor out load_elf_sections and is_target_elf_binary out of
> load_elf_interp.
>=20
> Signed-off-by: Mika=C3=ABl Urankar <mikael.urankar@gmail.com>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
> bsd-user/elfload.c | 350 +++++++++++++++++++++------------------------
> 1 file changed, 164 insertions(+), 186 deletions(-)
>=20
> diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
> index bdf18f3dce..aed28f2f73 100644
> --- a/bsd-user/elfload.c
> +++ b/bsd-user/elfload.c
> @@ -36,6 +36,8 @@ abi_ulong target_stksiz;
> abi_ulong target_stkbas;
>=20
> static int elf_core_dump(int signr, CPUArchState *env);
> +static int load_elf_sections(const struct elfhdr *hdr, struct =
elf_phdr *phdr,
> +    int fd, abi_ulong rbase, abi_ulong *baddrp);
>=20
> static inline void memcpy_fromfs(void *to, const void *from, unsigned =
long n)
> {
> @@ -271,16 +273,10 @@ static abi_ulong load_elf_interp(struct elfhdr =
*interp_elf_ex,
>                                  abi_ulong *interp_load_addr)
> {
>     struct elf_phdr *elf_phdata  =3D  NULL;
> -    struct elf_phdr *eppnt;
> -    abi_ulong load_addr =3D 0;
> -    int load_addr_set =3D 0;
> +    abi_ulong rbase;
>     int retval;
> -    abi_ulong last_bss, elf_bss;
> -    abi_ulong error;
> -    int i;
> +    abi_ulong baddr, error;
>=20
> -    elf_bss =3D 0;
> -    last_bss =3D 0;
>     error =3D 0;
>=20
>     bswap_ehdr(interp_elf_ex);
> @@ -325,6 +321,7 @@ static abi_ulong load_elf_interp(struct elfhdr =
*interp_elf_ex,
>     }
>     bswap_phdr(elf_phdata, interp_elf_ex->e_phnum);
>=20
> +    rbase =3D 0;
>     if (interp_elf_ex->e_type =3D=3D ET_DYN) {
>         /*
>          * In order to avoid hardcoding the interpreter load
> @@ -332,86 +329,25 @@ static abi_ulong load_elf_interp(struct elfhdr =
*interp_elf_ex,
>          */
>         error =3D target_mmap(0, INTERP_MAP_SIZE, PROT_NONE,
>                 MAP_PRIVATE | MAP_ANON, -1, 0);

s/error =3D /rbase =3D /

so that the test below worked properly.

> -        if (error =3D=3D -1) {
> +        if (rbase =3D=3D -1) {
>             perror("mmap");
>             exit(-1);
>         }
> -        load_addr =3D error;
> -        load_addr_set =3D 1;
> -    }
> -
> -    eppnt =3D elf_phdata;
> -    for (i =3D 0; i < interp_elf_ex->e_phnum; i++, eppnt++)
> -        if (eppnt->p_type =3D=3D PT_LOAD) {
> -            int elf_type =3D MAP_PRIVATE | MAP_DENYWRITE;
> -            int elf_prot =3D 0;
> -            abi_ulong vaddr =3D 0;
> -            abi_ulong k;
> -
> -            if (eppnt->p_flags & PF_R) elf_prot =3D  PROT_READ;
> -            if (eppnt->p_flags & PF_W) elf_prot |=3D PROT_WRITE;
> -            if (eppnt->p_flags & PF_X) elf_prot |=3D PROT_EXEC;
> -            if (interp_elf_ex->e_type =3D=3D ET_EXEC || =
load_addr_set) {
> -                elf_type |=3D MAP_FIXED;
> -                vaddr =3D eppnt->p_vaddr;
> -            }
> -            error =3D target_mmap(load_addr + =
TARGET_ELF_PAGESTART(vaddr),
> -                                eppnt->p_filesz + =
TARGET_ELF_PAGEOFFSET(eppnt->p_vaddr),
> -                                elf_prot,
> -                                elf_type,
> -                                interpreter_fd,
> -                                eppnt->p_offset - =
TARGET_ELF_PAGEOFFSET(eppnt->p_vaddr));
> -
> -            if (error =3D=3D -1) {
> -                /* Real error */
> -                close(interpreter_fd);
> -                free(elf_phdata);
> -                return ~((abi_ulong)0UL);
> -            }
> -
> -            if (!load_addr_set && interp_elf_ex->e_type =3D=3D =
ET_DYN) {
> -                load_addr =3D error;
> -                load_addr_set =3D 1;
> -            }
> -
> -            /*
> -             * Find the end of the file  mapping for this phdr, and =
keep
> -             * track of the largest address we see for this.
> -             */
> -            k =3D load_addr + eppnt->p_vaddr + eppnt->p_filesz;
> -            if (k > elf_bss) elf_bss =3D k;
> +    }
>=20
> -            /*
> -             * Do the same thing for the memory mapping - between
> -             * elf_bss and last_bss is the bss section.
> -             */
> -            k =3D load_addr + eppnt->p_memsz + eppnt->p_vaddr;
> -            if (k > last_bss) last_bss =3D k;
> -        }
> +    error =3D load_elf_sections(interp_elf_ex, elf_phdata, =
interpreter_fd, rbase,
> +        &baddr);
> +    if (error !=3D 0) {
> +        perror("load_elf_sections");
> +        exit(-1);
> +    }
>=20
>     /* Now use mmap to map the library into memory. */
> -
>     close(interpreter_fd);
> -
> -    /*
> -     * Now fill out the bss section.  First pad the last page up
> -     * to the page boundary, and then perform a mmap to make sure
> -     * that there are zeromapped pages up to and including the last
> -     * bss page.
> -     */
> -    padzero(elf_bss, last_bss);
> -    elf_bss =3D TARGET_ELF_PAGESTART(elf_bss + qemu_host_page_size - =
1); /* What we have mapped so far */
> -
> -    /* Map the last of the bss segment */
> -    if (last_bss > elf_bss) {
> -        target_mmap(elf_bss, last_bss - elf_bss,
> -                    PROT_READ | PROT_WRITE | PROT_EXEC,
> -                    MAP_FIXED | MAP_PRIVATE | MAP_ANON, -1, 0);
> -    }
>     free(elf_phdata);
>=20
> -    *interp_load_addr =3D load_addr;
> -    return ((abi_ulong) interp_elf_ex->e_entry) + load_addr;
> +    *interp_load_addr =3D baddr;
> +    return ((abi_ulong) interp_elf_ex->e_entry) + rbase;
> }
>=20
> static int symfind(const void *s0, const void *s1)
> @@ -521,6 +457,10 @@ found:
>             }
>             continue;
>         }
> +#if defined(TARGET_ARM) || defined(TARGET_MIPS)
> +        /* The bottom address bit marks a Thumb or MIPS16 symbol.  */
> +        syms[i].st_value &=3D ~(target_ulong)1;
> +#endif
>         i++;
>     }
>=20
> @@ -560,26 +500,119 @@ found:
>     syminfos =3D s;
> }
>=20
> +/* Check the elf header and see if this a target elf binary. */
> +int is_target_elf_binary(int fd)
> +{
> +    uint8_t buf[128];
> +    struct elfhdr elf_ex;
> +
> +    if (lseek(fd, 0L, SEEK_SET) < 0) {
> +        return 0;
> +    }
> +    if (read(fd, buf, sizeof(buf)) < 0) {
> +        return 0;
> +    }
> +
> +    elf_ex =3D *((struct elfhdr *)buf);
> +    bswap_ehdr(&elf_ex);
> +
> +    if ((elf_ex.e_type !=3D ET_EXEC && elf_ex.e_type !=3D ET_DYN) ||
> +        (!elf_check_arch(elf_ex.e_machine))) {
> +        return 0;
> +    } else {
> +        return 1;
> +    }
> +}
> +
> +static int
> +load_elf_sections(const struct elfhdr *hdr, struct elf_phdr *phdr, =
int fd,
> +    abi_ulong rbase, abi_ulong *baddrp)
> +{
> +    struct elf_phdr *elf_ppnt;
> +    abi_ulong baddr;
> +    int i;
> +    bool first;
> +
> +    /*
> +     * Now we do a little grungy work by mmaping the ELF image into
> +     * the correct location in memory.  At this point, we assume that
> +     * the image should be loaded at fixed address, not at a variable
> +     * address.
> +     */
> +    first =3D true;
> +    for (i =3D 0, elf_ppnt =3D phdr; i < hdr->e_phnum; i++, =
elf_ppnt++) {
> +        int elf_prot =3D 0;
> +        abi_ulong error;
> +
> +        /* XXX Skip memsz =3D=3D 0. */
> +        if (elf_ppnt->p_type !=3D PT_LOAD) {
> +            continue;
> +        }
> +
> +        if (elf_ppnt->p_flags & PF_R) {
> +            elf_prot |=3D PROT_READ;
> +        }
> +        if (elf_ppnt->p_flags & PF_W) {
> +            elf_prot |=3D PROT_WRITE;
> +        }
> +        if (elf_ppnt->p_flags & PF_X) {
> +            elf_prot |=3D PROT_EXEC;
> +        }
> +
> +        error =3D target_mmap(TARGET_ELF_PAGESTART(rbase + =
elf_ppnt->p_vaddr),
> +                            (elf_ppnt->p_filesz +
> +                             =
TARGET_ELF_PAGEOFFSET(elf_ppnt->p_vaddr)),
> +                            elf_prot,
> +                            (MAP_FIXED | MAP_PRIVATE | =
MAP_DENYWRITE),
> +                            fd,
> +                            (elf_ppnt->p_offset -
> +                             =
TARGET_ELF_PAGEOFFSET(elf_ppnt->p_vaddr)));
> +        if (error =3D=3D -1) {
> +            perror("mmap");
> +            exit(-1);
> +        } else if (elf_ppnt->p_memsz !=3D elf_ppnt->p_filesz) {
> +            abi_ulong start_bss, end_bss;
> +
> +            start_bss =3D rbase + elf_ppnt->p_vaddr + =
elf_ppnt->p_filesz;
> +            end_bss =3D rbase + elf_ppnt->p_vaddr + =
elf_ppnt->p_memsz;
> +
> +            /*
> +             * Calling set_brk effectively mmaps the pages that we =
need for the
> +             * bss and break sections.
> +             */
> +            set_brk(start_bss, end_bss);
> +            padzero(start_bss, end_bss);
> +        }
> +
> +        if (first) {
> +            baddr =3D TARGET_ELF_PAGESTART(rbase + =
elf_ppnt->p_vaddr);
> +            first =3D false;
> +        }
> +    }
> +
> +    if (baddrp !=3D NULL) {
> +        *baddrp =3D baddr;
> +    }
> +    return 0;
> +}
> +
> int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs =
*regs,
>                     struct image_info *info)
> {
>     struct elfhdr elf_ex;
>     struct elfhdr interp_elf_ex;
>     int interpreter_fd =3D -1; /* avoid warning */
> -    abi_ulong load_addr, load_bias;
> -    int load_addr_set =3D 0;
> +    abi_ulong load_addr;
>     int i;
> -    struct elf_phdr * elf_ppnt;
> +    struct elf_phdr *elf_ppnt;
>     struct elf_phdr *elf_phdata;
> -    abi_ulong elf_bss, k, elf_brk;
> -    int retval;
> -    char * elf_interpreter;
> -    abi_ulong elf_entry, interp_load_addr =3D 0;
> -    abi_ulong start_code, end_code, start_data, end_data;
> +    abi_ulong elf_brk;
> +    int error, retval;
> +    char *elf_interpreter;
> +    abi_ulong baddr, elf_entry, et_dyn_addr, interp_load_addr =3D 0;
>     abi_ulong reloc_func_desc =3D 0;
>=20
>     load_addr =3D 0;
> -    load_bias =3D 0;
>     elf_ex =3D *((struct elfhdr *) bprm->buf);          /* exec-header =
*/
>     bswap_ehdr(&elf_ex);
>=20
> @@ -618,16 +651,10 @@ int load_elf_binary(struct bsd_binprm *bprm, =
struct target_pt_regs *regs,
>     bswap_phdr(elf_phdata, elf_ex.e_phnum);
>     elf_ppnt =3D elf_phdata;
>=20
> -    elf_bss =3D 0;
>     elf_brk =3D 0;
>=20
>=20
>     elf_interpreter =3D NULL;
> -    start_code =3D ~((abi_ulong)0UL);
> -    end_code =3D 0;
> -    start_data =3D 0;
> -    end_data =3D 0;
> -
>     for (i =3D 0; i < elf_ex.e_phnum; i++) {
>         if (elf_ppnt->p_type =3D=3D PT_INTERP) {
>             if (elf_interpreter !=3D NULL) {
> @@ -714,94 +741,45 @@ int load_elf_binary(struct bsd_binprm *bprm, =
struct target_pt_regs *regs,
>     info->mmap =3D 0;
>     elf_entry =3D (abi_ulong) elf_ex.e_entry;
>=20
> -    /* Do this so that we can load the interpreter, if need be.  We =
will
> -       change some of these later */
> +    /* XXX Join this with PT_INTERP search? */
> +    baddr =3D 0;
> +    for (i =3D 0, elf_ppnt =3D elf_phdata; i < elf_ex.e_phnum; i++, =
elf_ppnt++) {
> +        if (elf_ppnt->p_type !=3D PT_LOAD) {
> +            continue;
> +        }
> +        baddr =3D elf_ppnt->p_vaddr;
> +        break;
> +    }
> +
> +    et_dyn_addr =3D 0;
> +    if (elf_ex.e_type =3D=3D ET_DYN && baddr =3D=3D 0) {
> +        et_dyn_addr =3D ELF_ET_DYN_LOAD_ADDR;
> +    }
> +
> +    /*
> +     * Do this so that we can load the interpreter, if need be.  We =
will
> +     * change some of these later
> +     */
>     info->rss =3D 0;
>     setup_arg_pages(bprm, info, &bprm->p, &bprm->stringp);
>     info->start_stack =3D bprm->p;
>=20
> -    /* Now we do a little grungy work by mmaping the ELF image into
> -     * the correct location in memory.  At this point, we assume that
> -     * the image should be loaded at fixed address, not at a variable
> -     * address.
> -     */
> +    info->elf_flags =3D elf_ex.e_flags;
>=20
> +    error =3D load_elf_sections(&elf_ex, elf_phdata, bprm->fd, =
et_dyn_addr,
> +        &load_addr);
>     for (i =3D 0, elf_ppnt =3D elf_phdata; i < elf_ex.e_phnum; i++, =
elf_ppnt++) {
> -        int elf_prot =3D 0;
> -        int elf_flags =3D 0;
> -        abi_ulong error;
> -
> -        if (elf_ppnt->p_type !=3D PT_LOAD)
> +        if (elf_ppnt->p_type !=3D PT_LOAD) {
>             continue;
> -
> -        if (elf_ppnt->p_flags & PF_R) elf_prot |=3D PROT_READ;
> -        if (elf_ppnt->p_flags & PF_W) elf_prot |=3D PROT_WRITE;
> -        if (elf_ppnt->p_flags & PF_X) elf_prot |=3D PROT_EXEC;
> -        elf_flags =3D MAP_PRIVATE | MAP_DENYWRITE;
> -        if (elf_ex.e_type =3D=3D ET_EXEC || load_addr_set) {
> -            elf_flags |=3D MAP_FIXED;
> -        } else if (elf_ex.e_type =3D=3D ET_DYN) {
> -            /* Try and get dynamic programs out of the way of the =
default mmap
> -               base, as well as whatever program they might try to =
exec.  This
> -               is because the brk will follow the loader, and is not =
movable.  */
> -            /* NOTE: for qemu, we do a big mmap to get enough space
> -               without hardcoding any address */
> -            error =3D target_mmap(0, ET_DYN_MAP_SIZE,
> -                                PROT_NONE, MAP_PRIVATE | MAP_ANON,
> -                                -1, 0);
> -            if (error =3D=3D -1) {
> -                perror("mmap");
> -                exit(-1);
> -            }
> -            load_bias =3D TARGET_ELF_PAGESTART(error - =
elf_ppnt->p_vaddr);
>         }
> -
> -        error =3D target_mmap(TARGET_ELF_PAGESTART(load_bias + =
elf_ppnt->p_vaddr),
> -                            (elf_ppnt->p_filesz +
> -                             =
TARGET_ELF_PAGEOFFSET(elf_ppnt->p_vaddr)),
> -                            elf_prot,
> -                            (MAP_FIXED | MAP_PRIVATE | =
MAP_DENYWRITE),
> -                            bprm->fd,
> -                            (elf_ppnt->p_offset -
> -                             =
TARGET_ELF_PAGEOFFSET(elf_ppnt->p_vaddr)));
> -        if (error =3D=3D -1) {
> -            perror("mmap");
> -            exit(-1);
> -        }
> -
> -        if (!load_addr_set) {
> -            load_addr_set =3D 1;
> -            load_addr =3D elf_ppnt->p_vaddr - elf_ppnt->p_offset;
> -            if (elf_ex.e_type =3D=3D ET_DYN) {
> -                load_bias +=3D error -
> -                    TARGET_ELF_PAGESTART(load_bias + =
elf_ppnt->p_vaddr);
> -                load_addr +=3D load_bias;
> -                reloc_func_desc =3D load_bias;
> -            }
> -        }
> -        k =3D elf_ppnt->p_vaddr;
> -        if (k < start_code)
> -            start_code =3D k;
> -        if (start_data < k)
> -            start_data =3D k;
> -        k =3D elf_ppnt->p_vaddr + elf_ppnt->p_filesz;
> -        if (k > elf_bss)
> -            elf_bss =3D k;
> -        if ((elf_ppnt->p_flags & PF_X) && end_code <  k)
> -            end_code =3D k;
> -        if (end_data < k)
> -            end_data =3D k;
> -        k =3D elf_ppnt->p_vaddr + elf_ppnt->p_memsz;
> -        if (k > elf_brk) elf_brk =3D k;
> -    }
> -
> -    elf_entry +=3D load_bias;
> -    elf_bss +=3D load_bias;
> -    elf_brk +=3D load_bias;
> -    start_code +=3D load_bias;
> -    end_code +=3D load_bias;
> -    start_data +=3D load_bias;
> -    end_data +=3D load_bias;
> +        if (elf_ppnt->p_memsz > elf_ppnt->p_filesz)
> +            elf_brk =3D MAX(elf_brk, et_dyn_addr + elf_ppnt->p_vaddr =
+
> +                elf_ppnt->p_memsz);
> +    }
> +    if (error !=3D 0) {
> +        perror("load_elf_sections");
> +        exit(-1);
> +    }
>=20
>     if (elf_interpreter) {
>         elf_entry =3D load_elf_interp(&interp_elf_ex, interpreter_fd,
> @@ -817,6 +795,9 @@ int load_elf_binary(struct bsd_binprm *bprm, =
struct target_pt_regs *regs,
>             exit(-1);
>             return 0;
>         }
> +    } else {
> +        interp_load_addr =3D et_dyn_addr;
> +        elf_entry +=3D interp_load_addr;
>     }
>=20
>     free(elf_phdata);
> @@ -827,21 +808,18 @@ int load_elf_binary(struct bsd_binprm *bprm, =
struct target_pt_regs *regs,
>=20
>     close(bprm->fd);
>=20
> -    bprm->p =3D target_create_elf_tables(bprm->p, bprm->argc, =
bprm->envc, bprm->stringp,
> -                                       &elf_ex, load_addr, load_bias, =
interp_load_addr, info);
> +    bprm->p =3D target_create_elf_tables(bprm->p,
> +                    bprm->argc,
> +                    bprm->envc,
> +                    bprm->stringp,
> +                    &elf_ex,
> +                    load_addr, et_dyn_addr,
> +                    interp_load_addr,
> +                    info);
>     info->load_addr =3D reloc_func_desc;
>     info->start_brk =3D info->brk =3D elf_brk;
> -    info->end_code =3D end_code;
> -    info->start_code =3D start_code;
> -    info->start_data =3D start_data;
> -    info->end_data =3D end_data;
>     info->start_stack =3D bprm->p;
> -
> -    /* Calling set_brk effectively mmaps the pages that we need for =
the bss and break
> -       sections */
> -    set_brk(elf_bss, elf_brk);
> -
> -    padzero(elf_bss, elf_brk);
> +    info->load_bias =3D 0;
>=20
>     info->entry =3D elf_entry;
>=20
> --
> 2.32.0
>=20


--Apple-Mail=_BB3B0887-F4CE-4BF7-8815-BFE3D2CA0D9A
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIzBAEBCgAdFiEEIDX4lLAKo898zeG3bBzRKH2wEQAFAmEpV98ACgkQbBzRKH2w
EQD6HhAAnHI0pudCV1FDlRkY0UWmp/Xs2HWMyEALqxHoYeRti0oZvQB3u2gVk7Tx
9xJgSN6DwDLcc+7dMFd6BtcD6Q8xnwbsGwfh2+o8yts8WnTwwh9VOVLUYGhnetHj
7jmx+WRu2pKfTlx+QJvjTzENPMOpgjqaKKN4Zo1NjS1Te+Al9W6wIkwGbBKc9Nw6
xunNZP3AAXqzm25i7rluSSnPp52gFMjqvhdaUhvQJSxLVvFd3lStlBBZk8aIyApg
eD5KjIId2dQS2+VLraZI9HefeyNlwHT4cFZeXh+YZnzO4Ukp8XDYrR2AGZkUZB07
gyyQkEUDFiXoiSd4SZRZXA5Ju01oAE/gVcEkzpNO0vgZnEaR8Lv7ZI0PoqiPsWfq
xuxTUvrLrec3quE+XH27pRa3p3+4NC0YnHD4bLBIaSvBcPsx2Jy4ao5E0Ayniwl0
D60UHBwovuFlLD3Ba8t1RB81m6WfRYl5fRXnfw8GHf9bO2ewpUh4JTrE7fUabXAs
dvfsFvfNv53Z0cm4YMcckqtTAY9TgUH3fAwJVEr84Zv75jrGMtoU8HETm7QSLpff
hPw/ySPSBYgMu0S0qgX8vMB/DXreklqJedyA8KrDipR6PRqm+e8YMWarHJZ+9683
y3e+toMwHr6gxpWUo6b1VBY+ozCIXE8JTRhJ7RNJBa+UgrCR9l8=
=Hxhl
-----END PGP SIGNATURE-----

--Apple-Mail=_BB3B0887-F4CE-4BF7-8815-BFE3D2CA0D9A--

