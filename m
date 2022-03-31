Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A92D24ED673
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 11:04:39 +0200 (CEST)
Received: from localhost ([::1]:38824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZqjO-0000xs-5l
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 05:04:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nZqef-0006C0-Pp
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 04:59:45 -0400
Received: from [2a00:1450:4864:20::333] (port=52146
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nZqec-0003gh-8a
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 04:59:44 -0400
Received: by mail-wm1-x333.google.com with SMTP id q20so13826832wmq.1
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 01:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7MvFpa8dckJgfgspy+BEzCD/OLaNJRpROQxMUbfmm50=;
 b=SoGsQzD30nrg66Noksz1x3FJZwG9Hvqq4GKW/MRlBMye4GE8+xqXiHoddUL6RG+195
 JTfOCZdl6D5eGPKiOgyJg/K43PLUAap1UOj+2cEBl6Bb0sDqa9UEQaG5ZnaAj4aS7WA/
 Nb0LS6eBrc6JlxqjPLjIOOCenIvhzz+8bRzPiHngXu8Xc6i2qTCAb03KppGzHjiNlhUa
 fRtGoISgXyvQoM1uUTL3+YSo74yovCRqmYiCDym8fIoKHQzzopscGfnpfgU1nWTq70Zm
 DwGz2LlE4fOImzXk9k0tT3AxU6OBg+yWwbUulvaxMqm4S9QkOZOKbZhTNfAx7wcKrdOw
 YSrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7MvFpa8dckJgfgspy+BEzCD/OLaNJRpROQxMUbfmm50=;
 b=CPYm7ZPGcRk98LVbG89ym9AVsYmSfn0KjtD7XjB6cYvq9esaCKXPpmy9dj9bTiD0BV
 lme7dSuFMqAyJqe9SaKISHkFIzVwXhbbKwA0g11z0iqIh5jpXA74tWXQPuEIgC22uMf+
 4bFxO+gwpF3tYnbvGztIJJCxl+A1gbdMdg8l7oT3VsrCLw1+AcXKG+PymYAUpVrQDvJ+
 eLGi9Y9N9bHctoiyYge/8UaBE8PHo3pFpnSa5cJWYUsIjYU2t3hT0B/L9J8JJZQgPVcJ
 78jJHKvv/w/BLDuwq2Aot0UCANYNv8c/LoBuAQ03gScxpPz+S5R1yyMBRoSwrUqxq04h
 o/Kw==
X-Gm-Message-State: AOAM530Um7WIIlMbdTJOL9YrQDkN3iw9757na728FEX2ADEsQjh4jg+1
 SxCfszmov362WXdOF2ieufrlsX0wZSI818Ryt4s=
X-Google-Smtp-Source: ABdhPJxRhHX5RL7EXh7rQ26jhWImGJ7eHQ1nZPl7Cf35A+mkFMsgTyAl0eV7oUclLVlSSJtclKPdV1nYe0MJJKoX/tA=
X-Received: by 2002:a7b:c7c3:0:b0:389:cbf1:fadf with SMTP id
 z3-20020a7bc7c3000000b00389cbf1fadfmr3982777wmk.147.1648717180872; Thu, 31
 Mar 2022 01:59:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220330123603.107120-1-frankja@linux.ibm.com>
 <20220330123603.107120-2-frankja@linux.ibm.com>
In-Reply-To: <20220330123603.107120-2-frankja@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 31 Mar 2022 12:59:29 +0400
Message-ID: <CAJ+F1CJaGg47PsiHJ2nuvZRTVqXaPeQXdFWbG4iFBeSpnV6i=A@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] dump: Use ERRP_GUARD()
To: Janosch Frank <frankja@linux.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000e6ae3c05db7fe1d4"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e6ae3c05db7fe1d4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Mar 30, 2022 at 4:42 PM Janosch Frank <frankja@linux.ibm.com> wrote=
:

> Let's move to the new way of handling errors before changing the dump
> code. This patch has mostly been generated by the coccinelle script
> scripts/coccinelle/errp-guard.cocci.
>
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>

nice
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

While you are at it, would you add a patch (at the end of this series, to
avoid the churn) to return a bool for success/failure (as recommended in
qapi/error.h)?

thanks


> ---
>  dump/dump.c | 144 ++++++++++++++++++++++------------------------------
>  1 file changed, 61 insertions(+), 83 deletions(-)
>
> diff --git a/dump/dump.c b/dump/dump.c
> index f57ed76fa7..58c4923fce 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -390,23 +390,21 @@ static void write_data(DumpState *s, void *buf, int
> length, Error **errp)
>  static void write_memory(DumpState *s, GuestPhysBlock *block, ram_addr_t
> start,
>                           int64_t size, Error **errp)
>  {
> +    ERRP_GUARD();
>      int64_t i;
> -    Error *local_err =3D NULL;
>
>      for (i =3D 0; i < size / s->dump_info.page_size; i++) {
>          write_data(s, block->host_addr + start + i *
> s->dump_info.page_size,
> -                   s->dump_info.page_size, &local_err);
> -        if (local_err) {
> -            error_propagate(errp, local_err);
> +                   s->dump_info.page_size, errp);
> +        if (*errp) {
>              return;
>          }
>      }
>
>      if ((size % s->dump_info.page_size) !=3D 0) {
>          write_data(s, block->host_addr + start + i *
> s->dump_info.page_size,
> -                   size % s->dump_info.page_size, &local_err);
> -        if (local_err) {
> -            error_propagate(errp, local_err);
> +                   size % s->dump_info.page_size, errp);
> +        if (*errp) {
>              return;
>          }
>      }
> @@ -476,11 +474,11 @@ static void get_offset_range(hwaddr phys_addr,
>
>  static void write_elf_loads(DumpState *s, Error **errp)
>  {
> +    ERRP_GUARD();
>      hwaddr offset, filesz;
>      MemoryMapping *memory_mapping;
>      uint32_t phdr_index =3D 1;
>      uint32_t max_index;
> -    Error *local_err =3D NULL;
>
>      if (s->have_section) {
>          max_index =3D s->sh_info;
> @@ -494,14 +492,13 @@ static void write_elf_loads(DumpState *s, Error
> **errp)
>                           s, &offset, &filesz);
>          if (s->dump_info.d_class =3D=3D ELFCLASS64) {
>              write_elf64_load(s, memory_mapping, phdr_index++, offset,
> -                             filesz, &local_err);
> +                             filesz, errp);
>          } else {
>              write_elf32_load(s, memory_mapping, phdr_index++, offset,
> -                             filesz, &local_err);
> +                             filesz, errp);
>          }
>
> -        if (local_err) {
> -            error_propagate(errp, local_err);
> +        if (*errp) {
>              return;
>          }
>
> @@ -514,7 +511,7 @@ static void write_elf_loads(DumpState *s, Error **err=
p)
>  /* write elf header, PT_NOTE and elf note to vmcore. */
>  static void dump_begin(DumpState *s, Error **errp)
>  {
> -    Error *local_err =3D NULL;
> +    ERRP_GUARD();
>
>      /*
>       * the vmcore's format is:
> @@ -542,73 +539,64 @@ static void dump_begin(DumpState *s, Error **errp)
>
>      /* write elf header to vmcore */
>      if (s->dump_info.d_class =3D=3D ELFCLASS64) {
> -        write_elf64_header(s, &local_err);
> +        write_elf64_header(s, errp);
>      } else {
> -        write_elf32_header(s, &local_err);
> +        write_elf32_header(s, errp);
>      }
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> +    if (*errp) {
>          return;
>      }
>
>      if (s->dump_info.d_class =3D=3D ELFCLASS64) {
>          /* write PT_NOTE to vmcore */
> -        write_elf64_note(s, &local_err);
> -        if (local_err) {
> -            error_propagate(errp, local_err);
> +        write_elf64_note(s, errp);
> +        if (*errp) {
>              return;
>          }
>
>          /* write all PT_LOAD to vmcore */
> -        write_elf_loads(s, &local_err);
> -        if (local_err) {
> -            error_propagate(errp, local_err);
> +        write_elf_loads(s, errp);
> +        if (*errp) {
>              return;
>          }
>
>          /* write section to vmcore */
>          if (s->have_section) {
> -            write_elf_section(s, 1, &local_err);
> -            if (local_err) {
> -                error_propagate(errp, local_err);
> +            write_elf_section(s, 1, errp);
> +            if (*errp) {
>                  return;
>              }
>          }
>
>          /* write notes to vmcore */
> -        write_elf64_notes(fd_write_vmcore, s, &local_err);
> -        if (local_err) {
> -            error_propagate(errp, local_err);
> +        write_elf64_notes(fd_write_vmcore, s, errp);
> +        if (*errp) {
>              return;
>          }
>      } else {
>          /* write PT_NOTE to vmcore */
> -        write_elf32_note(s, &local_err);
> -        if (local_err) {
> -            error_propagate(errp, local_err);
> +        write_elf32_note(s, errp);
> +        if (*errp) {
>              return;
>          }
>
>          /* write all PT_LOAD to vmcore */
> -        write_elf_loads(s, &local_err);
> -        if (local_err) {
> -            error_propagate(errp, local_err);
> +        write_elf_loads(s, errp);
> +        if (*errp) {
>              return;
>          }
>
>          /* write section to vmcore */
>          if (s->have_section) {
> -            write_elf_section(s, 0, &local_err);
> -            if (local_err) {
> -                error_propagate(errp, local_err);
> +            write_elf_section(s, 0, errp);
> +            if (*errp) {
>                  return;
>              }
>          }
>
>          /* write notes to vmcore */
> -        write_elf32_notes(fd_write_vmcore, s, &local_err);
> -        if (local_err) {
> -            error_propagate(errp, local_err);
> +        write_elf32_notes(fd_write_vmcore, s, errp);
> +        if (*errp) {
>              return;
>          }
>      }
> @@ -644,9 +632,9 @@ static int get_next_block(DumpState *s, GuestPhysBloc=
k
> *block)
>  /* write all memory to vmcore */
>  static void dump_iterate(DumpState *s, Error **errp)
>  {
> +    ERRP_GUARD();
>      GuestPhysBlock *block;
>      int64_t size;
> -    Error *local_err =3D NULL;
>
>      do {
>          block =3D s->next_block;
> @@ -658,9 +646,8 @@ static void dump_iterate(DumpState *s, Error **errp)
>                  size -=3D block->target_end - (s->begin + s->length);
>              }
>          }
> -        write_memory(s, block, s->start, size, &local_err);
> -        if (local_err) {
> -            error_propagate(errp, local_err);
> +        write_memory(s, block, s->start, size, errp);
> +        if (*errp) {
>              return;
>          }
>
> @@ -669,11 +656,10 @@ static void dump_iterate(DumpState *s, Error **errp=
)
>
>  static void create_vmcore(DumpState *s, Error **errp)
>  {
> -    Error *local_err =3D NULL;
> +    ERRP_GUARD();
>
> -    dump_begin(s, &local_err);
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> +    dump_begin(s, errp);
> +    if (*errp) {
>          return;
>      }
>
> @@ -810,6 +796,7 @@ static bool note_name_equal(DumpState *s,
>  /* write common header, sub header and elf note to vmcore */
>  static void create_header32(DumpState *s, Error **errp)
>  {
> +    ERRP_GUARD();
>      DiskDumpHeader32 *dh =3D NULL;
>      KdumpSubHeader32 *kh =3D NULL;
>      size_t size;
> @@ -818,7 +805,6 @@ static void create_header32(DumpState *s, Error **err=
p)
>      uint32_t bitmap_blocks;
>      uint32_t status =3D 0;
>      uint64_t offset_note;
> -    Error *local_err =3D NULL;
>
>      /* write common header, the version of kdump-compressed format is 6t=
h
> */
>      size =3D sizeof(DiskDumpHeader32);
> @@ -894,9 +880,8 @@ static void create_header32(DumpState *s, Error **err=
p)
>      s->note_buf_offset =3D 0;
>
>      /* use s->note_buf to store notes temporarily */
> -    write_elf32_notes(buf_write_note, s, &local_err);
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> +    write_elf32_notes(buf_write_note, s, errp);
> +    if (*errp) {
>          goto out;
>      }
>      if (write_buffer(s->fd, offset_note, s->note_buf,
> @@ -922,6 +907,7 @@ out:
>  /* write common header, sub header and elf note to vmcore */
>  static void create_header64(DumpState *s, Error **errp)
>  {
> +    ERRP_GUARD();
>      DiskDumpHeader64 *dh =3D NULL;
>      KdumpSubHeader64 *kh =3D NULL;
>      size_t size;
> @@ -930,7 +916,6 @@ static void create_header64(DumpState *s, Error **err=
p)
>      uint32_t bitmap_blocks;
>      uint32_t status =3D 0;
>      uint64_t offset_note;
> -    Error *local_err =3D NULL;
>
>      /* write common header, the version of kdump-compressed format is 6t=
h
> */
>      size =3D sizeof(DiskDumpHeader64);
> @@ -1006,9 +991,8 @@ static void create_header64(DumpState *s, Error
> **errp)
>      s->note_buf_offset =3D 0;
>
>      /* use s->note_buf to store notes temporarily */
> -    write_elf64_notes(buf_write_note, s, &local_err);
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> +    write_elf64_notes(buf_write_note, s, errp);
> +    if (*errp) {
>          goto out;
>      }
>
> @@ -1464,8 +1448,8 @@ out:
>
>  static void create_kdump_vmcore(DumpState *s, Error **errp)
>  {
> +    ERRP_GUARD();
>      int ret;
> -    Error *local_err =3D NULL;
>
>      /*
>       * the kdump-compressed format is:
> @@ -1495,21 +1479,18 @@ static void create_kdump_vmcore(DumpState *s,
> Error **errp)
>          return;
>      }
>
> -    write_dump_header(s, &local_err);
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> +    write_dump_header(s, errp);
> +    if (*errp) {
>          return;
>      }
>
> -    write_dump_bitmap(s, &local_err);
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> +    write_dump_bitmap(s, errp);
> +    if (*errp) {
>          return;
>      }
>
> -    write_dump_pages(s, &local_err);
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> +    write_dump_pages(s, errp);
> +    if (*errp) {
>          return;
>      }
>
> @@ -1639,10 +1620,10 @@ static void dump_init(DumpState *s, int fd, bool
> has_format,
>                        DumpGuestMemoryFormat format, bool paging, bool
> has_filter,
>                        int64_t begin, int64_t length, Error **errp)
>  {
> +    ERRP_GUARD();
>      VMCoreInfoState *vmci =3D vmcoreinfo_find();
>      CPUState *cpu;
>      int nr_cpus;
> -    Error *err =3D NULL;
>      int ret;
>
>      s->has_format =3D has_format;
> @@ -1761,9 +1742,8 @@ static void dump_init(DumpState *s, int fd, bool
> has_format,
>
>      /* get memory mapping */
>      if (paging) {
> -        qemu_get_guest_memory_mapping(&s->list, &s->guest_phys_blocks,
> &err);
> -        if (err !=3D NULL) {
> -            error_propagate(errp, err);
> +        qemu_get_guest_memory_mapping(&s->list, &s->guest_phys_blocks,
> errp);
> +        if (*errp) {
>              goto cleanup;
>          }
>      } else {
> @@ -1862,33 +1842,32 @@ cleanup:
>  /* this operation might be time consuming. */
>  static void dump_process(DumpState *s, Error **errp)
>  {
> -    Error *local_err =3D NULL;
> +    ERRP_GUARD();
>      DumpQueryResult *result =3D NULL;
>
>      if (s->has_format && s->format =3D=3D DUMP_GUEST_MEMORY_FORMAT_WIN_D=
MP) {
>  #ifdef TARGET_X86_64
> -        create_win_dump(s, &local_err);
> +        create_win_dump(s, errp);
>  #endif
>      } else if (s->has_format && s->format !=3D
> DUMP_GUEST_MEMORY_FORMAT_ELF) {
> -        create_kdump_vmcore(s, &local_err);
> +        create_kdump_vmcore(s, errp);
>      } else {
> -        create_vmcore(s, &local_err);
> +        create_vmcore(s, errp);
>      }
>
>      /* make sure status is written after written_size updates */
>      smp_wmb();
>      qatomic_set(&s->status,
> -               (local_err ? DUMP_STATUS_FAILED : DUMP_STATUS_COMPLETED))=
;
> +               (*errp ? DUMP_STATUS_FAILED : DUMP_STATUS_COMPLETED));
>
>      /* send DUMP_COMPLETED message (unconditionally) */
>      result =3D qmp_query_dump(NULL);
>      /* should never fail */
>      assert(result);
> -    qapi_event_send_dump_completed(result, !!local_err, (local_err ?
> -                                   error_get_pretty(local_err) : NULL));
> +    qapi_event_send_dump_completed(result, !!*errp, (*errp ?
> +
>  error_get_pretty(*errp) : NULL));
>      qapi_free_DumpQueryResult(result);
>
> -    error_propagate(errp, local_err);
>      dump_cleanup(s);
>  }
>
> @@ -1917,10 +1896,10 @@ void qmp_dump_guest_memory(bool paging, const cha=
r
> *file,
>                             int64_t length, bool has_format,
>                             DumpGuestMemoryFormat format, Error **errp)
>  {
> +    ERRP_GUARD();
>      const char *p;
>      int fd =3D -1;
>      DumpState *s;
> -    Error *local_err =3D NULL;
>      bool detach_p =3D false;
>
>      if (runstate_check(RUN_STATE_INMIGRATE)) {
> @@ -2020,9 +1999,8 @@ void qmp_dump_guest_memory(bool paging, const char
> *file,
>      dump_state_prepare(s);
>
>      dump_init(s, fd, has_format, format, paging, has_begin,
> -              begin, length, &local_err);
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> +              begin, length, errp);
> +    if (*errp) {
>          qatomic_set(&s->status, DUMP_STATUS_FAILED);
>          return;
>      }
> --
> 2.32.0
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000e6ae3c05db7fe1d4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Mar 30, 2022 at 4:42 PM Janosch Frank=
 &lt;<a href=3D"mailto:frankja@linux.ibm.com" target=3D"_blank">frankja@lin=
ux.ibm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Let&#39;s move to the new way of handling errors before changing=
 the dump<br>
code. This patch has mostly been generated by the coccinelle script<br>
scripts/coccinelle/errp-guard.cocci.<br>
<br>
Signed-off-by: Janosch Frank &lt;<a href=3D"mailto:frankja@linux.ibm.com" t=
arget=3D"_blank">frankja@linux.ibm.com</a>&gt;<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br></blockqu=
ote><div><br></div><div>nice</div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau =
&lt;<a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcan=
dre.lureau@redhat.com</a>&gt;</div><div><br></div><div>While you are at it,=
 would you add a patch (at the end of this series, to avoid the churn) to r=
eturn a bool for success/failure (as recommended in qapi/error.h)?</div><di=
v><br></div><div>thanks<br></div><div>=C2=A0<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
---<br>
=C2=A0dump/dump.c | 144 ++++++++++++++++++++++-----------------------------=
-<br>
=C2=A01 file changed, 61 insertions(+), 83 deletions(-)<br>
<br>
diff --git a/dump/dump.c b/dump/dump.c<br>
index f57ed76fa7..58c4923fce 100644<br>
--- a/dump/dump.c<br>
+++ b/dump/dump.c<br>
@@ -390,23 +390,21 @@ static void write_data(DumpState *s, void *buf, int l=
ength, Error **errp)<br>
=C2=A0static void write_memory(DumpState *s, GuestPhysBlock *block, ram_add=
r_t start,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 int64_t size, Error **errp)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 ERRP_GUARD();<br>
=C2=A0 =C2=A0 =C2=A0int64_t i;<br>
-=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
<br>
=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; size / s-&gt;dump_info.page_size; =
i++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_data(s, block-&gt;host_addr + start=
 + i * s-&gt;dump_info.page_size,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt=
;dump_info.page_size, &amp;local_err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt=
;dump_info.page_size, errp);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*errp) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if ((size % s-&gt;dump_info.page_size) !=3D 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_data(s, block-&gt;host_addr + start=
 + i * s-&gt;dump_info.page_size,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size =
% s-&gt;dump_info.page_size, &amp;local_err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size =
% s-&gt;dump_info.page_size, errp);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*errp) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -476,11 +474,11 @@ static void get_offset_range(hwaddr phys_addr,<br>
<br>
=C2=A0static void write_elf_loads(DumpState *s, Error **errp)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 ERRP_GUARD();<br>
=C2=A0 =C2=A0 =C2=A0hwaddr offset, filesz;<br>
=C2=A0 =C2=A0 =C2=A0MemoryMapping *memory_mapping;<br>
=C2=A0 =C2=A0 =C2=A0uint32_t phdr_index =3D 1;<br>
=C2=A0 =C2=A0 =C2=A0uint32_t max_index;<br>
-=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (s-&gt;have_section) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0max_index =3D s-&gt;sh_info;<br>
@@ -494,14 +492,13 @@ static void write_elf_loads(DumpState *s, Error **err=
p)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 s, &amp;offset, &amp;filesz);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;dump_info.d_class =3D=3D ELFCLA=
SS64) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_elf64_load(s, memory_=
mapping, phdr_index++, offset,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0filesz, &amp;local_err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0filesz, errp);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_elf32_load(s, memory_=
mapping, phdr_index++, offset,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0filesz, &amp;local_err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0filesz, errp);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*errp) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -514,7 +511,7 @@ static void write_elf_loads(DumpState *s, Error **errp)=
<br>
=C2=A0/* write elf header, PT_NOTE and elf note to vmcore. */<br>
=C2=A0static void dump_begin(DumpState *s, Error **errp)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
+=C2=A0 =C2=A0 ERRP_GUARD();<br>
<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
=C2=A0 =C2=A0 =C2=A0 * the vmcore&#39;s format is:<br>
@@ -542,73 +539,64 @@ static void dump_begin(DumpState *s, Error **errp)<br=
>
<br>
=C2=A0 =C2=A0 =C2=A0/* write elf header to vmcore */<br>
=C2=A0 =C2=A0 =C2=A0if (s-&gt;dump_info.d_class =3D=3D ELFCLASS64) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf64_header(s, &amp;local_err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf64_header(s, errp);<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf32_header(s, &amp;local_err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf32_header(s, errp);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 if (local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
+=C2=A0 =C2=A0 if (*errp) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (s-&gt;dump_info.d_class =3D=3D ELFCLASS64) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* write PT_NOTE to vmcore */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf64_note(s, &amp;local_err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf64_note(s, errp);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*errp) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* write all PT_LOAD to vmcore */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf_loads(s, &amp;local_err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf_loads(s, errp);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*errp) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* write section to vmcore */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;have_section) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf_section(s, 1, &amp;loc=
al_err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(er=
rp, local_err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf_section(s, 1, errp);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*errp) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* write notes to vmcore */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf64_notes(fd_write_vmcore, s, &amp;loc=
al_err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf64_notes(fd_write_vmcore, s, errp);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*errp) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* write PT_NOTE to vmcore */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf32_note(s, &amp;local_err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf32_note(s, errp);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*errp) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* write all PT_LOAD to vmcore */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf_loads(s, &amp;local_err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf_loads(s, errp);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*errp) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* write section to vmcore */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;have_section) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf_section(s, 0, &amp;loc=
al_err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(er=
rp, local_err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf_section(s, 0, errp);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*errp) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* write notes to vmcore */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf32_notes(fd_write_vmcore, s, &amp;loc=
al_err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf32_notes(fd_write_vmcore, s, errp);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*errp) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -644,9 +632,9 @@ static int get_next_block(DumpState *s, GuestPhysBlock =
*block)<br>
=C2=A0/* write all memory to vmcore */<br>
=C2=A0static void dump_iterate(DumpState *s, Error **errp)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 ERRP_GUARD();<br>
=C2=A0 =C2=A0 =C2=A0GuestPhysBlock *block;<br>
=C2=A0 =C2=A0 =C2=A0int64_t size;<br>
-=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
<br>
=C2=A0 =C2=A0 =C2=A0do {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0block =3D s-&gt;next_block;<br>
@@ -658,9 +646,8 @@ static void dump_iterate(DumpState *s, Error **errp)<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size -=3D blo=
ck-&gt;target_end - (s-&gt;begin + s-&gt;length);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_memory(s, block, s-&gt;start, size, &amp=
;local_err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_memory(s, block, s-&gt;start, size, errp=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*errp) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -669,11 +656,10 @@ static void dump_iterate(DumpState *s, Error **errp)<=
br>
<br>
=C2=A0static void create_vmcore(DumpState *s, Error **errp)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
+=C2=A0 =C2=A0 ERRP_GUARD();<br>
<br>
-=C2=A0 =C2=A0 dump_begin(s, &amp;local_err);<br>
-=C2=A0 =C2=A0 if (local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
+=C2=A0 =C2=A0 dump_begin(s, errp);<br>
+=C2=A0 =C2=A0 if (*errp) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -810,6 +796,7 @@ static bool note_name_equal(DumpState *s,<br>
=C2=A0/* write common header, sub header and elf note to vmcore */<br>
=C2=A0static void create_header32(DumpState *s, Error **errp)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 ERRP_GUARD();<br>
=C2=A0 =C2=A0 =C2=A0DiskDumpHeader32 *dh =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0KdumpSubHeader32 *kh =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0size_t size;<br>
@@ -818,7 +805,6 @@ static void create_header32(DumpState *s, Error **errp)=
<br>
=C2=A0 =C2=A0 =C2=A0uint32_t bitmap_blocks;<br>
=C2=A0 =C2=A0 =C2=A0uint32_t status =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0uint64_t offset_note;<br>
-=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* write common header, the version of kdump-compressed=
 format is 6th */<br>
=C2=A0 =C2=A0 =C2=A0size =3D sizeof(DiskDumpHeader32);<br>
@@ -894,9 +880,8 @@ static void create_header32(DumpState *s, Error **errp)=
<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;note_buf_offset =3D 0;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* use s-&gt;note_buf to store notes temporarily */<br>
-=C2=A0 =C2=A0 write_elf32_notes(buf_write_note, s, &amp;local_err);<br>
-=C2=A0 =C2=A0 if (local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
+=C2=A0 =C2=A0 write_elf32_notes(buf_write_note, s, errp);<br>
+=C2=A0 =C2=A0 if (*errp) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0if (write_buffer(s-&gt;fd, offset_note, s-&gt;note_buf,=
<br>
@@ -922,6 +907,7 @@ out:<br>
=C2=A0/* write common header, sub header and elf note to vmcore */<br>
=C2=A0static void create_header64(DumpState *s, Error **errp)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 ERRP_GUARD();<br>
=C2=A0 =C2=A0 =C2=A0DiskDumpHeader64 *dh =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0KdumpSubHeader64 *kh =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0size_t size;<br>
@@ -930,7 +916,6 @@ static void create_header64(DumpState *s, Error **errp)=
<br>
=C2=A0 =C2=A0 =C2=A0uint32_t bitmap_blocks;<br>
=C2=A0 =C2=A0 =C2=A0uint32_t status =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0uint64_t offset_note;<br>
-=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* write common header, the version of kdump-compressed=
 format is 6th */<br>
=C2=A0 =C2=A0 =C2=A0size =3D sizeof(DiskDumpHeader64);<br>
@@ -1006,9 +991,8 @@ static void create_header64(DumpState *s, Error **errp=
)<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;note_buf_offset =3D 0;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* use s-&gt;note_buf to store notes temporarily */<br>
-=C2=A0 =C2=A0 write_elf64_notes(buf_write_note, s, &amp;local_err);<br>
-=C2=A0 =C2=A0 if (local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
+=C2=A0 =C2=A0 write_elf64_notes(buf_write_note, s, errp);<br>
+=C2=A0 =C2=A0 if (*errp) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -1464,8 +1448,8 @@ out:<br>
<br>
=C2=A0static void create_kdump_vmcore(DumpState *s, Error **errp)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 ERRP_GUARD();<br>
=C2=A0 =C2=A0 =C2=A0int ret;<br>
-=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
=C2=A0 =C2=A0 =C2=A0 * the kdump-compressed format is:<br>
@@ -1495,21 +1479,18 @@ static void create_kdump_vmcore(DumpState *s, Error=
 **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 write_dump_header(s, &amp;local_err);<br>
-=C2=A0 =C2=A0 if (local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
+=C2=A0 =C2=A0 write_dump_header(s, errp);<br>
+=C2=A0 =C2=A0 if (*errp) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 write_dump_bitmap(s, &amp;local_err);<br>
-=C2=A0 =C2=A0 if (local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
+=C2=A0 =C2=A0 write_dump_bitmap(s, errp);<br>
+=C2=A0 =C2=A0 if (*errp) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 write_dump_pages(s, &amp;local_err);<br>
-=C2=A0 =C2=A0 if (local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
+=C2=A0 =C2=A0 write_dump_pages(s, errp);<br>
+=C2=A0 =C2=A0 if (*errp) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -1639,10 +1620,10 @@ static void dump_init(DumpState *s, int fd, bool ha=
s_format,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0DumpGuestMemoryFormat format, bool paging, bool has_filter,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0int64_t begin, int64_t length, Error **errp)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 ERRP_GUARD();<br>
=C2=A0 =C2=A0 =C2=A0VMCoreInfoState *vmci =3D vmcoreinfo_find();<br>
=C2=A0 =C2=A0 =C2=A0CPUState *cpu;<br>
=C2=A0 =C2=A0 =C2=A0int nr_cpus;<br>
-=C2=A0 =C2=A0 Error *err =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0int ret;<br>
<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;has_format =3D has_format;<br>
@@ -1761,9 +1742,8 @@ static void dump_init(DumpState *s, int fd, bool has_=
format,<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* get memory mapping */<br>
=C2=A0 =C2=A0 =C2=A0if (paging) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_get_guest_memory_mapping(&amp;s-&gt;list,=
 &amp;s-&gt;guest_phys_blocks, &amp;err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err !=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_get_guest_memory_mapping(&amp;s-&gt;list,=
 &amp;s-&gt;guest_phys_blocks, errp);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*errp) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
@@ -1862,33 +1842,32 @@ cleanup:<br>
=C2=A0/* this operation might be time consuming. */<br>
=C2=A0static void dump_process(DumpState *s, Error **errp)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
+=C2=A0 =C2=A0 ERRP_GUARD();<br>
=C2=A0 =C2=A0 =C2=A0DumpQueryResult *result =3D NULL;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (s-&gt;has_format &amp;&amp; s-&gt;format =3D=3D DUM=
P_GUEST_MEMORY_FORMAT_WIN_DMP) {<br>
=C2=A0#ifdef TARGET_X86_64<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 create_win_dump(s, &amp;local_err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 create_win_dump(s, errp);<br>
=C2=A0#endif<br>
=C2=A0 =C2=A0 =C2=A0} else if (s-&gt;has_format &amp;&amp; s-&gt;format !=
=3D DUMP_GUEST_MEMORY_FORMAT_ELF) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 create_kdump_vmcore(s, &amp;local_err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 create_kdump_vmcore(s, errp);<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 create_vmcore(s, &amp;local_err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 create_vmcore(s, errp);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* make sure status is written after written_size updat=
es */<br>
=C2=A0 =C2=A0 =C2=A0smp_wmb();<br>
=C2=A0 =C2=A0 =C2=A0qatomic_set(&amp;s-&gt;status,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(local_err ? DUMP_S=
TATUS_FAILED : DUMP_STATUS_COMPLETED));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(*errp ? DUMP_STATU=
S_FAILED : DUMP_STATUS_COMPLETED));<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* send DUMP_COMPLETED message (unconditionally) */<br>
=C2=A0 =C2=A0 =C2=A0result =3D qmp_query_dump(NULL);<br>
=C2=A0 =C2=A0 =C2=A0/* should never fail */<br>
=C2=A0 =C2=A0 =C2=A0assert(result);<br>
-=C2=A0 =C2=A0 qapi_event_send_dump_completed(result, !!local_err, (local_e=
rr ?<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_get_pretty(local_=
err) : NULL));<br>
+=C2=A0 =C2=A0 qapi_event_send_dump_completed(result, !!*errp, (*errp ?<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_get_pretty(*errp) : NULL));<=
br>
=C2=A0 =C2=A0 =C2=A0qapi_free_DumpQueryResult(result);<br>
<br>
-=C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
=C2=A0 =C2=A0 =C2=A0dump_cleanup(s);<br>
=C2=A0}<br>
<br>
@@ -1917,10 +1896,10 @@ void qmp_dump_guest_memory(bool paging, const char =
*file,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 int64_t length, bool has_format,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 DumpGuestMemoryFormat format, Error **errp)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 ERRP_GUARD();<br>
=C2=A0 =C2=A0 =C2=A0const char *p;<br>
=C2=A0 =C2=A0 =C2=A0int fd =3D -1;<br>
=C2=A0 =C2=A0 =C2=A0DumpState *s;<br>
-=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0bool detach_p =3D false;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (runstate_check(RUN_STATE_INMIGRATE)) {<br>
@@ -2020,9 +1999,8 @@ void qmp_dump_guest_memory(bool paging, const char *f=
ile,<br>
=C2=A0 =C2=A0 =C2=A0dump_state_prepare(s);<br>
<br>
=C2=A0 =C2=A0 =C2=A0dump_init(s, fd, has_format, format, paging, has_begin,=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 begin, length, &amp;local=
_err);<br>
-=C2=A0 =C2=A0 if (local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 begin, length, errp);<br>
+=C2=A0 =C2=A0 if (*errp) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qatomic_set(&amp;s-&gt;status, DUMP_STATU=
S_FAILED);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-- <br>
2.32.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--000000000000e6ae3c05db7fe1d4--

