Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD15833C15A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 17:13:53 +0100 (CET)
Received: from localhost ([::1]:34416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLpqq-0001u2-O4
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 12:13:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lLpoa-00085S-Eo
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:11:32 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:41880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lLpoY-0008U6-08
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:11:32 -0400
Received: by mail-ej1-x62b.google.com with SMTP id lr13so67246465ejb.8
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 09:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=vlofuOh7jpiwyLJv3nYAR6vQG2co4odVYLZgEEQwbtA=;
 b=G/j0xhYC7qnOjgPE+XTNfvOstYpkUh1ju2Luff4FRMwKhutTdOwx4C1wwQo8IvOHQT
 WAxdxVmqiXAMtIcfSldugTaPOG2QSn+gtN28160YmIKMHJWuXWTE3sMcdMwKinyTM8Az
 13dWWMt2NzbWtwAv+4aDbgDlCFcui6O1S5UB1n36LP/EH5GA/u09Yz91MH+5Ib1yJMpP
 H3RnhDrLj03wQYi+rI7UnzUrlEWzU6KIDRiIeQeMdxBkHdQf1NNQ9OMArw8iPnshfwsU
 y2y8D5vbdckYmbXnTcZtsQ/gtDtgpdGyzSSHZa9wRi/yhay+uABdJMVLle3HBvTptuVS
 c/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=vlofuOh7jpiwyLJv3nYAR6vQG2co4odVYLZgEEQwbtA=;
 b=d2JvRI/QQY/F1NFjs5FRTAl8ZdteKEDYpTSfzs3Hz2/ck+iC+BohIe0mQmqgkHUNnC
 dhB4mOr7nChvdAHPSIZw5wkwY+JMX5Zx1ekdBh0C623BYund2li/YGFHuKrB/fu0nKYU
 i0yFFnM/zjn8k0NV0luP86NTqM3z4QWnAkFQBiJL7hm+0OqAUp0lb/GIcSPoWqpHSPWg
 b+Ww2m2uzjYDVuqsb08vI093YLofZS0ybU54dVvifEyZUzE84D0fBc47YRmQtAAFmBFt
 7bGSjUNzVzVDWaxC72BYsBJMePQlvFcyPGu0e7CnOfqBVKj6r9kvFvaBo0mdhLpmB8y9
 9WyA==
X-Gm-Message-State: AOAM532J3mvcrPdXy104nZq07A6bM0VUWGYoy++jmg3vaXOvzyLUmi0V
 a3xoapbuAjip6kSboYkoEmqCQA==
X-Google-Smtp-Source: ABdhPJwny6u8RTcb+u5mesoFvNQ1msijLc/Qbca96nAi0c3Ftw8evTHZBUmaLYhoXJIYqdzmn8aXmQ==
X-Received: by 2002:a17:906:12db:: with SMTP id
 l27mr24156866ejb.500.1615824687216; 
 Mon, 15 Mar 2021 09:11:27 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p19sm8555240edr.57.2021.03.15.09.11.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 09:11:26 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A19C11FF7E;
 Mon, 15 Mar 2021 16:11:25 +0000 (GMT)
References: <20210314032324.45142-1-ma.mandourr@gmail.com>
 <20210314032324.45142-2-ma.mandourr@gmail.com>
User-agent: mu4e 1.5.10; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 1/8] bsd-user/elfload.c: Replaced calls to malloc/free
 with GLib variants
Date: Mon, 15 Mar 2021 16:07:37 +0000
In-reply-to: <20210314032324.45142-2-ma.mandourr@gmail.com>
Message-ID: <871rcg9z2q.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Mahmoud Mandour <ma.mandourr@gmail.com> writes:

> Replaced the calls to malloc(), realloc(), and free() to their
> equivalents in GLib's allocation functions in various places.
>
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> ---
>  bsd-user/elfload.c | 74 +++++++++++++++++++++++-----------------------
>  1 file changed, 37 insertions(+), 37 deletions(-)
>
> diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
> index 5f4d824d78..7b0793693b 100644
> --- a/bsd-user/elfload.c
> +++ b/bsd-user/elfload.c
> @@ -867,8 +867,7 @@ static abi_ulong load_elf_interp(struct elfhdr * inte=
rp_elf_ex,
>          if (sizeof(struct elf_phdr) * interp_elf_ex->e_phnum > TARGET_PA=
GE_SIZE)
>              return ~(abi_ulong)0UL;
>=20=20
> -        elf_phdata =3D  (struct elf_phdr *)
> -                malloc(sizeof(struct elf_phdr) * interp_elf_ex->e_phnum);
> +        elf_phdata =3D g_try_new(struct elf_phdr,
> interp_elf_ex->ephnum)

Given this is start-up code I think you could use g_new instead of
g_try_new. As it will abort on no memory you can avoid the early return
check bellow. Also is elf_phdata never persists beyond this function you
could use g_autofree (and use g_steal_pointer on the one case when it is
returned if you need it)

>=20=20
>          if (!elf_phdata)
>            return ~((abi_ulong)0UL);
> @@ -878,7 +877,7 @@ static abi_ulong load_elf_interp(struct elfhdr * inte=
rp_elf_ex,
>           * we will be doing the wrong thing.
>           */
>          if (interp_elf_ex->e_phentsize !=3D sizeof(struct elf_phdr)) {
> -            free(elf_phdata);
> +            g_free(elf_phdata);
>              return ~((abi_ulong)0UL);
>          }
>=20=20
> @@ -891,7 +890,7 @@ static abi_ulong load_elf_interp(struct elfhdr * inte=
rp_elf_ex,
>          if (retval < 0) {
>                  perror("load_elf_interp");
>                  exit(-1);
> -                free (elf_phdata);
> +                g_free(elf_phdata);
>                  return retval;
>          }
>  #ifdef BSWAP_NEEDED
> @@ -940,7 +939,7 @@ static abi_ulong load_elf_interp(struct elfhdr * inte=
rp_elf_ex,
>              if (error =3D=3D -1) {
>                /* Real error */
>                close(interpreter_fd);
> -              free(elf_phdata);
> +              g_free(elf_phdata);
>                return ~((abi_ulong)0UL);
>              }
>=20=20
> @@ -983,7 +982,7 @@ static abi_ulong load_elf_interp(struct elfhdr * inte=
rp_elf_ex,
>                          PROT_READ|PROT_WRITE|PROT_EXEC,
>                          MAP_FIXED|MAP_PRIVATE|MAP_ANON, -1, 0);
>          }
> -        free(elf_phdata);
> +        g_free(elf_phdata);
>

That would allow you to get rid of a lot of free/g_frees

I would also split this patch, one for each function you convert.

>          *interp_load_addr =3D load_addr;
>          return ((abi_ulong) interp_elf_ex->e_entry) + load_addr;
> @@ -1064,24 +1063,24 @@ static void load_symbols(struct elfhdr *hdr, int =
fd)
>=20=20
>   found:
>      /* Now know where the strtab and symtab are.  Snarf them. */
> -    s =3D malloc(sizeof(*s));
> -    syms =3D malloc(symtab.sh_size);
> +    s =3D g_try_malloc(sizeof(*s));
> +    syms =3D g_try_malloc(symtab.sh_size);
>      if (!syms) {
> -        free(s);
> +        g_free(s);
>          return;
>      }
> -    s->disas_strtab =3D strings =3D malloc(strtab.sh_size);
> +    s->disas_strtab =3D strings =3D g_malloc(strtab.sh_size);
>      if (!s->disas_strtab) {
> -        free(s);
> -        free(syms);
> +        g_free(s);
> +        g_free(syms);
>          return;
>      }
>=20=20
>      lseek(fd, symtab.sh_offset, SEEK_SET);
>      if (read(fd, syms, symtab.sh_size) !=3D symtab.sh_size) {
> -        free(s);
> -        free(syms);
> -        free(strings);
> +        g_free(s);
> +        g_free(syms);
> +        g_free(strings);
>          return;
>      }
>=20=20
> @@ -1113,11 +1112,11 @@ static void load_symbols(struct elfhdr *hdr, int =
fd)
>          that we threw away.  Whether or not this has any effect on the
>          memory allocation depends on the malloc implementation and how
>          many symbols we managed to discard. */
> -    new_syms =3D realloc(syms, nsyms * sizeof(*syms));
> +    new_syms =3D g_try_realloc(syms, nsyms * sizeof(*syms));
>      if (new_syms =3D=3D NULL) {
> -        free(s);
> -        free(syms);
> -        free(strings);
> +        g_free(s);
> +        g_free(syms);
> +        g_free(strings);
>          return;
>      }
>      syms =3D new_syms;
> @@ -1126,9 +1125,9 @@ static void load_symbols(struct elfhdr *hdr, int fd)
>=20=20
>      lseek(fd, strtab.sh_offset, SEEK_SET);
>      if (read(fd, strings, strtab.sh_size) !=3D strtab.sh_size) {
> -        free(s);
> -        free(syms);
> -        free(strings);
> +        g_free(s);
> +        g_free(syms);
> +        g_free(strings);
>          return;
>      }
>      s->disas_num_syms =3D nsyms;
> @@ -1190,7 +1189,8 @@ int load_elf_binary(struct linux_binprm * bprm, str=
uct target_pt_regs * regs,
>      }
>=20=20
>      /* Now read in all of the header information */
> -    elf_phdata =3D (struct elf_phdr *)malloc(elf_ex.e_phentsize*elf_ex.e=
_phnum);
> +    elf_phdata =3D
> +        (struct elf_phdr *)g_try_malloc(elf_ex.e_phentsizei * elf_ex.e_p=
hnum);
>      if (elf_phdata =3D=3D NULL) {
>          return -ENOMEM;
>      }
> @@ -1204,7 +1204,7 @@ int load_elf_binary(struct linux_binprm * bprm, str=
uct target_pt_regs * regs,
>      if (retval < 0) {
>          perror("load_elf_binary");
>          exit(-1);
> -        free (elf_phdata);
> +        g_free(elf_phdata);
>          return -errno;
>      }
>=20=20
> @@ -1231,8 +1231,8 @@ int load_elf_binary(struct linux_binprm * bprm, str=
uct target_pt_regs * regs,
>          if (elf_ppnt->p_type =3D=3D PT_INTERP) {
>              if ( elf_interpreter !=3D NULL )
>              {
> -                free (elf_phdata);
> -                free(elf_interpreter);
> +                g_free(elf_phdata);
> +                g_free(elf_interpreter);
>                  close(bprm->fd);
>                  return -EINVAL;
>              }
> @@ -1242,10 +1242,10 @@ int load_elf_binary(struct linux_binprm * bprm, s=
truct target_pt_regs * regs,
>               * is an a.out format binary
>               */
>=20=20
> -            elf_interpreter =3D (char *)malloc(elf_ppnt->p_filesz);
> +            elf_interpreter =3D (char *)g_try_malloc(elf_ppnt->p_filesz);
>=20=20
>              if (elf_interpreter =3D=3D NULL) {
> -                free (elf_phdata);
> +                g_free(elf_phdata);
>                  close(bprm->fd);
>                  return -ENOMEM;
>              }
> @@ -1298,8 +1298,8 @@ int load_elf_binary(struct linux_binprm * bprm, str=
uct target_pt_regs * regs,
>              if (retval < 0) {
>                  perror("load_elf_binary3");
>                  exit(-1);
> -                free (elf_phdata);
> -                free(elf_interpreter);
> +                g_free(elf_phdata);
> +                g_free(elf_interpreter);
>                  close(bprm->fd);
>                  return retval;
>              }
> @@ -1323,8 +1323,8 @@ int load_elf_binary(struct linux_binprm * bprm, str=
uct target_pt_regs * regs,
>          }
>=20=20
>          if (!interpreter_type) {
> -            free(elf_interpreter);
> -            free(elf_phdata);
> +            g_free(elf_interpreter);
> +            g_free(elf_phdata);
>              close(bprm->fd);
>              return -ELIBBAD;
>          }
> @@ -1346,8 +1346,8 @@ int load_elf_binary(struct linux_binprm * bprm, str=
uct target_pt_regs * regs,
>              }
>          }
>          if (!bprm->p) {
> -            free(elf_interpreter);
> -            free (elf_phdata);
> +            g_free(elf_interpreter);
> +            g_free(elf_phdata);
>              close(bprm->fd);
>              return -E2BIG;
>          }
> @@ -1486,17 +1486,17 @@ int load_elf_binary(struct linux_binprm * bprm, s=
truct target_pt_regs * regs,
>          reloc_func_desc =3D interp_load_addr;
>=20=20
>          close(interpreter_fd);
> -        free(elf_interpreter);
> +        g_free(elf_interpreter);
>=20=20
>          if (elf_entry =3D=3D ~((abi_ulong)0UL)) {
>              printf("Unable to load interpreter\n");
> -            free(elf_phdata);
> +            g_free(elf_phdata);
>              exit(-1);
>              return 0;
>          }
>      }
>=20=20
> -    free(elf_phdata);
> +    g_free(elf_phdata);
>=20=20
>      if (qemu_log_enabled())
>          load_symbols(&elf_ex, bprm->fd);


--=20
Alex Benn=C3=A9e

