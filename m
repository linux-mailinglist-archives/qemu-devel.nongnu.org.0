Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C91A573A01
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 17:23:09 +0200 (CEST)
Received: from localhost ([::1]:39776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBeCh-0007le-OZ
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 11:23:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oBeAb-0005gh-Rl
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 11:20:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oBeAX-0003tH-I5
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 11:20:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657725652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rl4cFWOxh+K5NMS9nkBH5pKk6Hj3126l5v5agZZA9s4=;
 b=Ro6u5hhptY9XwO2+Z6Z4vK7BfT6w1Ju8aXDMfwtw6oFa5h3kcwtzDDvcHyEwvdnmyPT5bU
 PSzNt0gerOFluesSKhV/A7EYo6CSyb0XGsZtetQ25ItXHngYM2QWcCLsGryg5Dn4K+uuy6
 Ry/Xx+NbzgnaFYr4/mkK2X9GWZJDJi0=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-294-lSYEwrL3Njmrc9kdyD6Qkg-1; Wed, 13 Jul 2022 11:20:51 -0400
X-MC-Unique: lSYEwrL3Njmrc9kdyD6Qkg-1
Received: by mail-oi1-f200.google.com with SMTP id
 ay32-20020a056808302000b002f96abff093so7148079oib.23
 for <qemu-devel@nongnu.org>; Wed, 13 Jul 2022 08:20:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rl4cFWOxh+K5NMS9nkBH5pKk6Hj3126l5v5agZZA9s4=;
 b=vWk3jnCUAqviM0eMs06RBTrPKx7KcesGOSz6Za0+3BttfNKLzaeArIPCY5xN5mgqS5
 CCvdtqwHSOHu+UxGbiFsoKpZjeusrGxxHQsB0DbdemL/E3p9uer32E0HF3iIPMSAh/jM
 Dctk8S7tI+A2jUR7WC/fvaceyDF4SRVMawZMhTW8Ij1E8bxw2uxPuoghjq2f7tBOr3ES
 2JcIty4l3pQT1gL349nvRwTLgXsgoocW7R/v/xkzBsutXTMbRRn2mdNTku9TG5HQyYBx
 tcZ+eQOpzBk3fkqX/obl7cz8AmoOicsqwoeJM8qZzlv2zLVoRx9SQkrSFpFy31tNXcJv
 uWog==
X-Gm-Message-State: AJIora+vOcszLJTuSka1FZaFthjNoES/CAu36kOJ3D3UfD15AGJjL7Ur
 wkb0QS+74djFG9w7EB4oG5PvR/UxsK6/g1fjQ1zaTFXF0f+HJH/yX3vrhQhaDdMqj7xYn+lYp3s
 LidcqVxQY9V2oyQ05jJvPuOQlK3pveXU=
X-Received: by 2002:a05:6870:f627:b0:10c:9be9:5306 with SMTP id
 ek39-20020a056870f62700b0010c9be95306mr4928883oab.205.1657725650612; 
 Wed, 13 Jul 2022 08:20:50 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uIV4mFinRF+T/WM8k5FsE+SPvM8o/q0/S1NGybimF00UPuCV3p7yha9NiKflouj5LOAZxlmEhMQwEtLNq3u+Q=
X-Received: by 2002:a05:6870:f627:b0:10c:9be9:5306 with SMTP id
 ek39-20020a056870f62700b0010c9be95306mr4928866oab.205.1657725650378; Wed, 13
 Jul 2022 08:20:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220713130322.25517-1-frankja@linux.ibm.com>
 <20220713130322.25517-3-frankja@linux.ibm.com>
In-Reply-To: <20220713130322.25517-3-frankja@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 13 Jul 2022 19:20:39 +0400
Message-ID: <CAMxuvayqmUsPc5yn3tbB2ParJSJGyP1s-jCFy41jA=EZqwYwwg@mail.gmail.com>
Subject: Re: [PATCH v2 02/11] dump: Allocate header
To: Janosch Frank <frankja@linux.ibm.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Bonzini, Paolo" <pbonzini@redhat.com>,
 mhartmay@linux.ibm.com, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, imbrenda@linux.ibm.com, 
 Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>, "Henderson,
 Richard" <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 13, 2022 at 5:07 PM Janosch Frank <frankja@linux.ibm.com> wrote=
:
>
> Allocating the header lets us write it at a later time and hence also
> allows us to change section and segment table offsets until we
> finally write it.
>
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  dump/dump.c           | 127 +++++++++++++++++++++---------------------
>  include/sysemu/dump.h |   1 +
>  2 files changed, 64 insertions(+), 64 deletions(-)
>
> diff --git a/dump/dump.c b/dump/dump.c
> index 6feba3cbfa..16d7474258 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -98,6 +98,7 @@ static int dump_cleanup(DumpState *s)
>      memory_mapping_list_free(&s->list);
>      close(s->fd);
>      g_free(s->guest_note);
> +    g_free(s->elf_header);
>      s->guest_note =3D NULL;
>      if (s->resume) {
>          if (s->detached) {
> @@ -126,73 +127,49 @@ static int fd_write_vmcore(const void *buf, size_t =
size, void *opaque)
>      return 0;
>  }
>
> -static void write_elf64_header(DumpState *s, Error **errp)
> +static void prepare_elf64_header(DumpState *s)
>  {
> -    /*
> -     * phnum in the elf header is 16 bit, if we have more segments we
> -     * set phnum to PN_XNUM and write the real number of segments to a
> -     * special section.
> -     */
> -    uint16_t phnum =3D MIN(s->phdr_num, PN_XNUM);
> -    Elf64_Ehdr elf_header;
> -    int ret;
> +    uint16_t phnum =3D s->phdr_num >=3D PN_XNUM ? PN_XNUM : s->phdr_num;
> +    Elf64_Ehdr *elf_header =3D s->elf_header;
>
> -    memset(&elf_header, 0, sizeof(Elf64_Ehdr));
> -    memcpy(&elf_header, ELFMAG, SELFMAG);
> -    elf_header.e_ident[EI_CLASS] =3D ELFCLASS64;
> -    elf_header.e_ident[EI_DATA] =3D s->dump_info.d_endian;
> -    elf_header.e_ident[EI_VERSION] =3D EV_CURRENT;
> -    elf_header.e_type =3D cpu_to_dump16(s, ET_CORE);
> -    elf_header.e_machine =3D cpu_to_dump16(s, s->dump_info.d_machine);
> -    elf_header.e_version =3D cpu_to_dump32(s, EV_CURRENT);
> -    elf_header.e_ehsize =3D cpu_to_dump16(s, sizeof(elf_header));
> -    elf_header.e_phoff =3D cpu_to_dump64(s, s->phdr_offset);
> -    elf_header.e_phentsize =3D cpu_to_dump16(s, sizeof(Elf64_Phdr));
> -    elf_header.e_phnum =3D cpu_to_dump16(s, phnum);
> +    memcpy(elf_header, ELFMAG, SELFMAG);
> +    elf_header->e_ident[EI_CLASS] =3D ELFCLASS64;
> +    elf_header->e_ident[EI_DATA] =3D s->dump_info.d_endian;
> +    elf_header->e_ident[EI_VERSION] =3D EV_CURRENT;
> +    elf_header->e_type =3D cpu_to_dump16(s, ET_CORE);
> +    elf_header->e_machine =3D cpu_to_dump16(s, s->dump_info.d_machine);
> +    elf_header->e_version =3D cpu_to_dump32(s, EV_CURRENT);
> +    elf_header->e_ehsize =3D cpu_to_dump16(s, sizeof(*elf_header));
> +    elf_header->e_phoff =3D cpu_to_dump64(s, s->phdr_offset);
> +    elf_header->e_phentsize =3D cpu_to_dump16(s, sizeof(Elf64_Phdr));
> +    elf_header->e_phnum =3D cpu_to_dump16(s, phnum);
>      if (s->shdr_num) {
> -        elf_header.e_shoff =3D cpu_to_dump64(s, s->shdr_offset);
> -        elf_header.e_shentsize =3D cpu_to_dump16(s, sizeof(Elf64_Shdr));
> -        elf_header.e_shnum =3D cpu_to_dump16(s, s->shdr_num);
> -    }
> -
> -    ret =3D fd_write_vmcore(&elf_header, sizeof(elf_header), s);
> -    if (ret < 0) {
> -        error_setg_errno(errp, -ret, "dump: failed to write elf header")=
;
> +        elf_header->e_shoff =3D cpu_to_dump64(s, s->shdr_offset);
> +        elf_header->e_shentsize =3D cpu_to_dump16(s, sizeof(Elf64_Shdr))=
;
> +        elf_header->e_shnum =3D cpu_to_dump16(s, s->shdr_num);
>      }
>  }
>
> -static void write_elf32_header(DumpState *s, Error **errp)
> +static void prepare_elf32_header(DumpState *s)
>  {
> -    /*
> -     * phnum in the elf header is 16 bit, if we have more segments we
> -     * set phnum to PN_XNUM and write the real number of segments to a
> -     * special section.
> -     */
> -    uint16_t phnum =3D MIN(s->phdr_num, PN_XNUM);
> -    Elf32_Ehdr elf_header;
> -    int ret;
> +    uint16_t phnum =3D s->phdr_num >=3D PN_XNUM ? PN_XNUM : s->phdr_num;
> +    Elf32_Ehdr *elf_header =3D s->elf_header;
>
> -    memset(&elf_header, 0, sizeof(Elf32_Ehdr));
> -    memcpy(&elf_header, ELFMAG, SELFMAG);
> -    elf_header.e_ident[EI_CLASS] =3D ELFCLASS32;
> -    elf_header.e_ident[EI_DATA] =3D s->dump_info.d_endian;
> -    elf_header.e_ident[EI_VERSION] =3D EV_CURRENT;
> -    elf_header.e_type =3D cpu_to_dump16(s, ET_CORE);
> -    elf_header.e_machine =3D cpu_to_dump16(s, s->dump_info.d_machine);
> -    elf_header.e_version =3D cpu_to_dump32(s, EV_CURRENT);
> -    elf_header.e_ehsize =3D cpu_to_dump16(s, sizeof(elf_header));
> -    elf_header.e_phoff =3D cpu_to_dump32(s, s->phdr_offset);
> -    elf_header.e_phentsize =3D cpu_to_dump16(s, sizeof(Elf32_Phdr));
> -    elf_header.e_phnum =3D cpu_to_dump16(s, phnum);
> +    memcpy(elf_header, ELFMAG, SELFMAG);
> +    elf_header->e_ident[EI_CLASS] =3D ELFCLASS32;
> +    elf_header->e_ident[EI_DATA] =3D s->dump_info.d_endian;
> +    elf_header->e_ident[EI_VERSION] =3D EV_CURRENT;
> +    elf_header->e_type =3D cpu_to_dump16(s, ET_CORE);
> +    elf_header->e_machine =3D cpu_to_dump16(s, s->dump_info.d_machine);
> +    elf_header->e_version =3D cpu_to_dump32(s, EV_CURRENT);
> +    elf_header->e_ehsize =3D cpu_to_dump16(s, sizeof(*elf_header));
> +    elf_header->e_phoff =3D cpu_to_dump32(s, s->phdr_offset);
> +    elf_header->e_phentsize =3D cpu_to_dump16(s, sizeof(Elf32_Phdr));
> +    elf_header->e_phnum =3D cpu_to_dump16(s, phnum);
>      if (s->shdr_num) {
> -        elf_header.e_shoff =3D cpu_to_dump32(s, s->shdr_offset);
> -        elf_header.e_shentsize =3D cpu_to_dump16(s, sizeof(Elf32_Shdr));
> -        elf_header.e_shnum =3D cpu_to_dump16(s, s->shdr_num);
> -    }
> -
> -    ret =3D fd_write_vmcore(&elf_header, sizeof(elf_header), s);
> -    if (ret < 0) {
> -        error_setg_errno(errp, -ret, "dump: failed to write elf header")=
;
> +        elf_header->e_shoff =3D cpu_to_dump32(s, s->shdr_offset);
> +        elf_header->e_shentsize =3D cpu_to_dump16(s, sizeof(Elf32_Shdr))=
;
> +        elf_header->e_shnum =3D cpu_to_dump16(s, s->shdr_num);
>      }
>  }
>
> @@ -528,6 +505,26 @@ static void write_elf_notes(DumpState *s, Error **er=
rp)
>      }
>  }
>
> +static void prepare_elf_header(DumpState *s)
> +{
> +    if (dump_is_64bit(s)) {
> +        prepare_elf64_header(s);
> +    } else {
> +        prepare_elf32_header(s);
> +    }
> +}
> +
> +static void write_elf_header(DumpState *s, Error **errp)
> +{
> +    size_t size =3D dump_is_64bit(s) ? sizeof(Elf64_Ehdr) : sizeof(Elf32=
_Ehdr);
> +    int ret;
> +
> +    ret =3D fd_write_vmcore(s->elf_header, size, s);
> +    if (ret < 0) {
> +        error_setg_errno(errp, -ret, "dump: failed to write elf header")=
;
> +    }
> +}
> +
>  /* write elf header, PT_NOTE and elf note to vmcore. */
>  static void dump_begin(DumpState *s, Error **errp)
>  {
> @@ -557,12 +554,11 @@ static void dump_begin(DumpState *s, Error **errp)
>       * vmcore.
>       */
>
> -    /* write elf header to vmcore */
> -    if (dump_is_64bit(s)) {
> -        write_elf64_header(s, errp);
> -    } else {
> -        write_elf32_header(s, errp);
> -    }
> +    /* Write elf header to buffer */
> +    prepare_elf_header(s);
> +
> +    /* Start to write stuff into files*/

nits: missing space, files->file descriptor/stream ?


> +    write_elf_header(s, errp);
>      if (*errp) {
>          return;
>      }
> @@ -1642,6 +1638,9 @@ static void dump_init(DumpState *s, int fd, bool ha=
s_format,
>          goto cleanup;
>      }
>
> +    s->elf_header =3D g_malloc0(dump_is_64bit(s) ?
> +                              sizeof(Elf64_Ehdr) : sizeof(Elf32_Ehdr));
> +
>      /*
>       * The goal of this block is to (a) update the previously guessed
>       * phys_base, (b) copy the guest note out of the guest.
> diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
> index f3bf98c220..736f681d01 100644
> --- a/include/sysemu/dump.h
> +++ b/include/sysemu/dump.h
> @@ -171,6 +171,7 @@ typedef struct DumpState {
>      int64_t begin;             /* Start address of the chunk we want to =
dump */
>      int64_t length;            /* Length of the dump we want to dump */
>
> +    void *elf_header;
>      uint8_t *note_buf;          /* buffer for notes */
>      size_t note_buf_offset;     /* the writing place in note_buf */
>      uint32_t nr_cpus;           /* number of guest's cpu */
> --
> 2.34.1
>


