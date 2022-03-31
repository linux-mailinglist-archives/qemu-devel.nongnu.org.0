Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9AA4ED7AE
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 12:15:15 +0200 (CEST)
Received: from localhost ([::1]:51504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZrpi-0001AH-OB
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 06:15:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nZrmZ-0007Hs-Ns
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 06:12:02 -0400
Received: from [2a00:1450:4864:20::12b] (port=45798
 helo=mail-lf1-x12b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nZrmW-0004ae-E5
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 06:11:59 -0400
Received: by mail-lf1-x12b.google.com with SMTP id p10so34708313lfa.12
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 03:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5KrsepdNRL0N/7hAIuoIAYr9kvWIVxgVvrUKsDaaUNI=;
 b=fL8rW3/YXcF4DkbTRpJ0wursmewpTWU448SCmjWmwlj19n/BQpZn5QFt1gmotIfs8y
 ycGkcJk2w6EE9dxFxvjOykBNxjeztZbU7PDvlKqAYblXs08au+93k9yuqUzmXrJulO+R
 xxd0okVAasL69TS/b8W9FhM++DuyjnxNehr0lOuiS9HouRidj/bYYVk6xEHfl7mq90ZV
 /8GBx/nnDeboDMzUWLPHgF8cSZDAlzGZhQ+oOsTAMo/F1pN4pcP52/MTO1CDzACLz+S/
 C/fIAPmt0lczejjYATInBrgpHgpzGPpvJJci8bfWwdnp3Q8igDIz42tycvCS46tNK9IZ
 0pDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5KrsepdNRL0N/7hAIuoIAYr9kvWIVxgVvrUKsDaaUNI=;
 b=4dP8LAnqi24Tkee73c0sResZ+3lU2jsIgb79iirrgiRGdx4BD4BRB1L3JVDhdOZJiH
 m7zxnF+X0FEYJnhBq+MqpUWLUqsedLHyk57574XKnh+st2eIfaJgHoLJUeqjZGorzix9
 0z2/Be3y5X6tCM7lvvSSq8knu1vNoSf+TxLFgUlyqclHL8nmLeo/qXEbmZNRhrrR7bW2
 2F4y3F9YWmL7AzcOXBE4FfX+2XkGWjNvlHhCmjuJWEuojqrnrGSQkrkPtutu/phja3Rl
 dkLAwwAZfB7he6En2bnTDcMvgzqYc4a55OZ8uKiCVYP0Nrli+CZnwzNdgmXIhWPHEUcS
 GV9w==
X-Gm-Message-State: AOAM532oZGUDHqQbb6sB7zE6eMS3zYfZOmhvyEQszVkJxgJ8TxNf7BAl
 vJU0U7UZmyq9bLo3+NO53bP0eYbivPM40p6PBkA=
X-Google-Smtp-Source: ABdhPJzge/MEsDuwqpHiKwJmtA9gjYA+rP0O0mr9zFwlegThCWLPJXYC6px5LCdYIZVmTz3IWs2eSzN54EaW+n9Rbyk=
X-Received: by 2002:a05:6512:128f:b0:44a:2b70:91e3 with SMTP id
 u15-20020a056512128f00b0044a2b7091e3mr10354624lfs.160.1648721511772; Thu, 31
 Mar 2022 03:11:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220330123603.107120-1-frankja@linux.ibm.com>
 <20220330123603.107120-2-frankja@linux.ibm.com>
 <CAJ+F1CJaGg47PsiHJ2nuvZRTVqXaPeQXdFWbG4iFBeSpnV6i=A@mail.gmail.com>
 <750dd013-d925-fb07-e908-00ad4d7feb8a@linux.ibm.com>
In-Reply-To: <750dd013-d925-fb07-e908-00ad4d7feb8a@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 31 Mar 2022 14:11:39 +0400
Message-ID: <CAJ+F1C+rJBSu5=de-jt74jJyTUr-00TQJU_DuJtCmJ9+-KqP2w@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] dump: Use ERRP_GUARD()
To: Janosch Frank <frankja@linux.ibm.com>
Content-Type: multipart/alternative; boundary="0000000000000af7cc05db80e438"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12b.google.com
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

--0000000000000af7cc05db80e438
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 31, 2022 at 1:48 PM Janosch Frank <frankja@linux.ibm.com> wrote=
:

> On 3/31/22 10:59, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Wed, Mar 30, 2022 at 4:42 PM Janosch Frank <frankja@linux.ibm.com>
> wrote:
> >
> >> Let's move to the new way of handling errors before changing the dump
> >> code. This patch has mostly been generated by the coccinelle script
> >> scripts/coccinelle/errp-guard.cocci.
> >>
> >> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> >> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> >>
> >
> > nice
> > Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Thanks!
>
> >
> > While you are at it, would you add a patch (at the end of this series, =
to
> > avoid the churn) to return a bool for success/failure (as recommended i=
n
> > qapi/error.h)?
>
> I knew it was a mistake to touch this file :)
>
> Sure, it will be churn anyway since I have two more patch sets that
> follow on this one.
>
>
Feel free to leave that cleanup for now

thanks


> >
> > thanks
> >
> >
> >> ---
> >>   dump/dump.c | 144 ++++++++++++++++++++++----------------------------=
--
> >>   1 file changed, 61 insertions(+), 83 deletions(-)
> >>
> >> diff --git a/dump/dump.c b/dump/dump.c
> >> index f57ed76fa7..58c4923fce 100644
> >> --- a/dump/dump.c
> >> +++ b/dump/dump.c
> >> @@ -390,23 +390,21 @@ static void write_data(DumpState *s, void *buf,
> int
> >> length, Error **errp)
> >>   static void write_memory(DumpState *s, GuestPhysBlock *block,
> ram_addr_t
> >> start,
> >>                            int64_t size, Error **errp)
> >>   {
> >> +    ERRP_GUARD();
> >>       int64_t i;
> >> -    Error *local_err =3D NULL;
> >>
> >>       for (i =3D 0; i < size / s->dump_info.page_size; i++) {
> >>           write_data(s, block->host_addr + start + i *
> >> s->dump_info.page_size,
> >> -                   s->dump_info.page_size, &local_err);
> >> -        if (local_err) {
> >> -            error_propagate(errp, local_err);
> >> +                   s->dump_info.page_size, errp);
> >> +        if (*errp) {
> >>               return;
> >>           }
> >>       }
> >>
> >>       if ((size % s->dump_info.page_size) !=3D 0) {
> >>           write_data(s, block->host_addr + start + i *
> >> s->dump_info.page_size,
> >> -                   size % s->dump_info.page_size, &local_err);
> >> -        if (local_err) {
> >> -            error_propagate(errp, local_err);
> >> +                   size % s->dump_info.page_size, errp);
> >> +        if (*errp) {
> >>               return;
> >>           }
> >>       }
> >> @@ -476,11 +474,11 @@ static void get_offset_range(hwaddr phys_addr,
> >>
> >>   static void write_elf_loads(DumpState *s, Error **errp)
> >>   {
> >> +    ERRP_GUARD();
> >>       hwaddr offset, filesz;
> >>       MemoryMapping *memory_mapping;
> >>       uint32_t phdr_index =3D 1;
> >>       uint32_t max_index;
> >> -    Error *local_err =3D NULL;
> >>
> >>       if (s->have_section) {
> >>           max_index =3D s->sh_info;
> >> @@ -494,14 +492,13 @@ static void write_elf_loads(DumpState *s, Error
> >> **errp)
> >>                            s, &offset, &filesz);
> >>           if (s->dump_info.d_class =3D=3D ELFCLASS64) {
> >>               write_elf64_load(s, memory_mapping, phdr_index++, offset=
,
> >> -                             filesz, &local_err);
> >> +                             filesz, errp);
> >>           } else {
> >>               write_elf32_load(s, memory_mapping, phdr_index++, offset=
,
> >> -                             filesz, &local_err);
> >> +                             filesz, errp);
> >>           }
> >>
> >> -        if (local_err) {
> >> -            error_propagate(errp, local_err);
> >> +        if (*errp) {
> >>               return;
> >>           }
> >>
> >> @@ -514,7 +511,7 @@ static void write_elf_loads(DumpState *s, Error
> **errp)
> >>   /* write elf header, PT_NOTE and elf note to vmcore. */
> >>   static void dump_begin(DumpState *s, Error **errp)
> >>   {
> >> -    Error *local_err =3D NULL;
> >> +    ERRP_GUARD();
> >>
> >>       /*
> >>        * the vmcore's format is:
> >> @@ -542,73 +539,64 @@ static void dump_begin(DumpState *s, Error **err=
p)
> >>
> >>       /* write elf header to vmcore */
> >>       if (s->dump_info.d_class =3D=3D ELFCLASS64) {
> >> -        write_elf64_header(s, &local_err);
> >> +        write_elf64_header(s, errp);
> >>       } else {
> >> -        write_elf32_header(s, &local_err);
> >> +        write_elf32_header(s, errp);
> >>       }
> >> -    if (local_err) {
> >> -        error_propagate(errp, local_err);
> >> +    if (*errp) {
> >>           return;
> >>       }
> >>
> >>       if (s->dump_info.d_class =3D=3D ELFCLASS64) {
> >>           /* write PT_NOTE to vmcore */
> >> -        write_elf64_note(s, &local_err);
> >> -        if (local_err) {
> >> -            error_propagate(errp, local_err);
> >> +        write_elf64_note(s, errp);
> >> +        if (*errp) {
> >>               return;
> >>           }
> >>
> >>           /* write all PT_LOAD to vmcore */
> >> -        write_elf_loads(s, &local_err);
> >> -        if (local_err) {
> >> -            error_propagate(errp, local_err);
> >> +        write_elf_loads(s, errp);
> >> +        if (*errp) {
> >>               return;
> >>           }
> >>
> >>           /* write section to vmcore */
> >>           if (s->have_section) {
> >> -            write_elf_section(s, 1, &local_err);
> >> -            if (local_err) {
> >> -                error_propagate(errp, local_err);
> >> +            write_elf_section(s, 1, errp);
> >> +            if (*errp) {
> >>                   return;
> >>               }
> >>           }
> >>
> >>           /* write notes to vmcore */
> >> -        write_elf64_notes(fd_write_vmcore, s, &local_err);
> >> -        if (local_err) {
> >> -            error_propagate(errp, local_err);
> >> +        write_elf64_notes(fd_write_vmcore, s, errp);
> >> +        if (*errp) {
> >>               return;
> >>           }
> >>       } else {
> >>           /* write PT_NOTE to vmcore */
> >> -        write_elf32_note(s, &local_err);
> >> -        if (local_err) {
> >> -            error_propagate(errp, local_err);
> >> +        write_elf32_note(s, errp);
> >> +        if (*errp) {
> >>               return;
> >>           }
> >>
> >>           /* write all PT_LOAD to vmcore */
> >> -        write_elf_loads(s, &local_err);
> >> -        if (local_err) {
> >> -            error_propagate(errp, local_err);
> >> +        write_elf_loads(s, errp);
> >> +        if (*errp) {
> >>               return;
> >>           }
> >>
> >>           /* write section to vmcore */
> >>           if (s->have_section) {
> >> -            write_elf_section(s, 0, &local_err);
> >> -            if (local_err) {
> >> -                error_propagate(errp, local_err);
> >> +            write_elf_section(s, 0, errp);
> >> +            if (*errp) {
> >>                   return;
> >>               }
> >>           }
> >>
> >>           /* write notes to vmcore */
> >> -        write_elf32_notes(fd_write_vmcore, s, &local_err);
> >> -        if (local_err) {
> >> -            error_propagate(errp, local_err);
> >> +        write_elf32_notes(fd_write_vmcore, s, errp);
> >> +        if (*errp) {
> >>               return;
> >>           }
> >>       }
> >> @@ -644,9 +632,9 @@ static int get_next_block(DumpState *s,
> GuestPhysBlock
> >> *block)
> >>   /* write all memory to vmcore */
> >>   static void dump_iterate(DumpState *s, Error **errp)
> >>   {
> >> +    ERRP_GUARD();
> >>       GuestPhysBlock *block;
> >>       int64_t size;
> >> -    Error *local_err =3D NULL;
> >>
> >>       do {
> >>           block =3D s->next_block;
> >> @@ -658,9 +646,8 @@ static void dump_iterate(DumpState *s, Error **err=
p)
> >>                   size -=3D block->target_end - (s->begin + s->length)=
;
> >>               }
> >>           }
> >> -        write_memory(s, block, s->start, size, &local_err);
> >> -        if (local_err) {
> >> -            error_propagate(errp, local_err);
> >> +        write_memory(s, block, s->start, size, errp);
> >> +        if (*errp) {
> >>               return;
> >>           }
> >>
> >> @@ -669,11 +656,10 @@ static void dump_iterate(DumpState *s, Error
> **errp)
> >>
> >>   static void create_vmcore(DumpState *s, Error **errp)
> >>   {
> >> -    Error *local_err =3D NULL;
> >> +    ERRP_GUARD();
> >>
> >> -    dump_begin(s, &local_err);
> >> -    if (local_err) {
> >> -        error_propagate(errp, local_err);
> >> +    dump_begin(s, errp);
> >> +    if (*errp) {
> >>           return;
> >>       }
> >>
> >> @@ -810,6 +796,7 @@ static bool note_name_equal(DumpState *s,
> >>   /* write common header, sub header and elf note to vmcore */
> >>   static void create_header32(DumpState *s, Error **errp)
> >>   {
> >> +    ERRP_GUARD();
> >>       DiskDumpHeader32 *dh =3D NULL;
> >>       KdumpSubHeader32 *kh =3D NULL;
> >>       size_t size;
> >> @@ -818,7 +805,6 @@ static void create_header32(DumpState *s, Error
> **errp)
> >>       uint32_t bitmap_blocks;
> >>       uint32_t status =3D 0;
> >>       uint64_t offset_note;
> >> -    Error *local_err =3D NULL;
> >>
> >>       /* write common header, the version of kdump-compressed format i=
s
> 6th
> >> */
> >>       size =3D sizeof(DiskDumpHeader32);
> >> @@ -894,9 +880,8 @@ static void create_header32(DumpState *s, Error
> **errp)
> >>       s->note_buf_offset =3D 0;
> >>
> >>       /* use s->note_buf to store notes temporarily */
> >> -    write_elf32_notes(buf_write_note, s, &local_err);
> >> -    if (local_err) {
> >> -        error_propagate(errp, local_err);
> >> +    write_elf32_notes(buf_write_note, s, errp);
> >> +    if (*errp) {
> >>           goto out;
> >>       }
> >>       if (write_buffer(s->fd, offset_note, s->note_buf,
> >> @@ -922,6 +907,7 @@ out:
> >>   /* write common header, sub header and elf note to vmcore */
> >>   static void create_header64(DumpState *s, Error **errp)
> >>   {
> >> +    ERRP_GUARD();
> >>       DiskDumpHeader64 *dh =3D NULL;
> >>       KdumpSubHeader64 *kh =3D NULL;
> >>       size_t size;
> >> @@ -930,7 +916,6 @@ static void create_header64(DumpState *s, Error
> **errp)
> >>       uint32_t bitmap_blocks;
> >>       uint32_t status =3D 0;
> >>       uint64_t offset_note;
> >> -    Error *local_err =3D NULL;
> >>
> >>       /* write common header, the version of kdump-compressed format i=
s
> 6th
> >> */
> >>       size =3D sizeof(DiskDumpHeader64);
> >> @@ -1006,9 +991,8 @@ static void create_header64(DumpState *s, Error
> >> **errp)
> >>       s->note_buf_offset =3D 0;
> >>
> >>       /* use s->note_buf to store notes temporarily */
> >> -    write_elf64_notes(buf_write_note, s, &local_err);
> >> -    if (local_err) {
> >> -        error_propagate(errp, local_err);
> >> +    write_elf64_notes(buf_write_note, s, errp);
> >> +    if (*errp) {
> >>           goto out;
> >>       }
> >>
> >> @@ -1464,8 +1448,8 @@ out:
> >>
> >>   static void create_kdump_vmcore(DumpState *s, Error **errp)
> >>   {
> >> +    ERRP_GUARD();
> >>       int ret;
> >> -    Error *local_err =3D NULL;
> >>
> >>       /*
> >>        * the kdump-compressed format is:
> >> @@ -1495,21 +1479,18 @@ static void create_kdump_vmcore(DumpState *s,
> >> Error **errp)
> >>           return;
> >>       }
> >>
> >> -    write_dump_header(s, &local_err);
> >> -    if (local_err) {
> >> -        error_propagate(errp, local_err);
> >> +    write_dump_header(s, errp);
> >> +    if (*errp) {
> >>           return;
> >>       }
> >>
> >> -    write_dump_bitmap(s, &local_err);
> >> -    if (local_err) {
> >> -        error_propagate(errp, local_err);
> >> +    write_dump_bitmap(s, errp);
> >> +    if (*errp) {
> >>           return;
> >>       }
> >>
> >> -    write_dump_pages(s, &local_err);
> >> -    if (local_err) {
> >> -        error_propagate(errp, local_err);
> >> +    write_dump_pages(s, errp);
> >> +    if (*errp) {
> >>           return;
> >>       }
> >>
> >> @@ -1639,10 +1620,10 @@ static void dump_init(DumpState *s, int fd, bo=
ol
> >> has_format,
> >>                         DumpGuestMemoryFormat format, bool paging, boo=
l
> >> has_filter,
> >>                         int64_t begin, int64_t length, Error **errp)
> >>   {
> >> +    ERRP_GUARD();
> >>       VMCoreInfoState *vmci =3D vmcoreinfo_find();
> >>       CPUState *cpu;
> >>       int nr_cpus;
> >> -    Error *err =3D NULL;
> >>       int ret;
> >>
> >>       s->has_format =3D has_format;
> >> @@ -1761,9 +1742,8 @@ static void dump_init(DumpState *s, int fd, bool
> >> has_format,
> >>
> >>       /* get memory mapping */
> >>       if (paging) {
> >> -        qemu_get_guest_memory_mapping(&s->list, &s->guest_phys_blocks=
,
> >> &err);
> >> -        if (err !=3D NULL) {
> >> -            error_propagate(errp, err);
> >> +        qemu_get_guest_memory_mapping(&s->list, &s->guest_phys_blocks=
,
> >> errp);
> >> +        if (*errp) {
> >>               goto cleanup;
> >>           }
> >>       } else {
> >> @@ -1862,33 +1842,32 @@ cleanup:
> >>   /* this operation might be time consuming. */
> >>   static void dump_process(DumpState *s, Error **errp)
> >>   {
> >> -    Error *local_err =3D NULL;
> >> +    ERRP_GUARD();
> >>       DumpQueryResult *result =3D NULL;
> >>
> >>       if (s->has_format && s->format =3D=3D
> DUMP_GUEST_MEMORY_FORMAT_WIN_DMP) {
> >>   #ifdef TARGET_X86_64
> >> -        create_win_dump(s, &local_err);
> >> +        create_win_dump(s, errp);
> >>   #endif
> >>       } else if (s->has_format && s->format !=3D
> >> DUMP_GUEST_MEMORY_FORMAT_ELF) {
> >> -        create_kdump_vmcore(s, &local_err);
> >> +        create_kdump_vmcore(s, errp);
> >>       } else {
> >> -        create_vmcore(s, &local_err);
> >> +        create_vmcore(s, errp);
> >>       }
> >>
> >>       /* make sure status is written after written_size updates */
> >>       smp_wmb();
> >>       qatomic_set(&s->status,
> >> -               (local_err ? DUMP_STATUS_FAILED :
> DUMP_STATUS_COMPLETED));
> >> +               (*errp ? DUMP_STATUS_FAILED : DUMP_STATUS_COMPLETED));
> >>
> >>       /* send DUMP_COMPLETED message (unconditionally) */
> >>       result =3D qmp_query_dump(NULL);
> >>       /* should never fail */
> >>       assert(result);
> >> -    qapi_event_send_dump_completed(result, !!local_err, (local_err ?
> >> -                                   error_get_pretty(local_err) :
> NULL));
> >> +    qapi_event_send_dump_completed(result, !!*errp, (*errp ?
> >> +
> >>   error_get_pretty(*errp) : NULL));
> >>       qapi_free_DumpQueryResult(result);
> >>
> >> -    error_propagate(errp, local_err);
> >>       dump_cleanup(s);
> >>   }
> >>
> >> @@ -1917,10 +1896,10 @@ void qmp_dump_guest_memory(bool paging, const
> char
> >> *file,
> >>                              int64_t length, bool has_format,
> >>                              DumpGuestMemoryFormat format, Error **err=
p)
> >>   {
> >> +    ERRP_GUARD();
> >>       const char *p;
> >>       int fd =3D -1;
> >>       DumpState *s;
> >> -    Error *local_err =3D NULL;
> >>       bool detach_p =3D false;
> >>
> >>       if (runstate_check(RUN_STATE_INMIGRATE)) {
> >> @@ -2020,9 +1999,8 @@ void qmp_dump_guest_memory(bool paging, const ch=
ar
> >> *file,
> >>       dump_state_prepare(s);
> >>
> >>       dump_init(s, fd, has_format, format, paging, has_begin,
> >> -              begin, length, &local_err);
> >> -    if (local_err) {
> >> -        error_propagate(errp, local_err);
> >> +              begin, length, errp);
> >> +    if (*errp) {
> >>           qatomic_set(&s->status, DUMP_STATUS_FAILED);
> >>           return;
> >>       }
> >> --
> >> 2.32.0
> >>
> >>
> >>
> >
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000000af7cc05db80e438
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 31, 2022 at 1:48 PM Janos=
ch Frank &lt;<a href=3D"mailto:frankja@linux.ibm.com">frankja@linux.ibm.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
On 3/31/22 10:59, Marc-Andr=C3=A9 Lureau wrote:<br>
&gt; Hi<br>
&gt; <br>
&gt; On Wed, Mar 30, 2022 at 4:42 PM Janosch Frank &lt;<a href=3D"mailto:fr=
ankja@linux.ibm.com" target=3D"_blank">frankja@linux.ibm.com</a>&gt; wrote:=
<br>
&gt; <br>
&gt;&gt; Let&#39;s move to the new way of handling errors before changing t=
he dump<br>
&gt;&gt; code. This patch has mostly been generated by the coccinelle scrip=
t<br>
&gt;&gt; scripts/coccinelle/errp-guard.cocci.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Janosch Frank &lt;<a href=3D"mailto:frankja@linux.i=
bm.com" target=3D"_blank">frankja@linux.ibm.com</a>&gt;<br>
&gt;&gt; Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.hende=
rson@linaro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
&gt;&gt;<br>
&gt; <br>
&gt; nice<br>
&gt; Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lu=
reau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
<br>
Thanks!<br>
<br>
&gt; <br>
&gt; While you are at it, would you add a patch (at the end of this series,=
 to<br>
&gt; avoid the churn) to return a bool for success/failure (as recommended =
in<br>
&gt; qapi/error.h)?<br>
<br>
I knew it was a mistake to touch this file :)<br>
<br>
Sure, it will be churn anyway since I have two more patch sets that <br>
follow on this one.<br>
<br></blockquote><div><br></div><div>Feel free to leave that cleanup for no=
w</div><div><br></div><div>thanks<br></div><div>=C2=A0<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
&gt; <br>
&gt; thanks<br>
&gt; <br>
&gt; <br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0dump/dump.c | 144 ++++++++++++++++++++++--------------=
----------------<br>
&gt;&gt;=C2=A0 =C2=A01 file changed, 61 insertions(+), 83 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/dump/dump.c b/dump/dump.c<br>
&gt;&gt; index f57ed76fa7..58c4923fce 100644<br>
&gt;&gt; --- a/dump/dump.c<br>
&gt;&gt; +++ b/dump/dump.c<br>
&gt;&gt; @@ -390,23 +390,21 @@ static void write_data(DumpState *s, void *b=
uf, int<br>
&gt;&gt; length, Error **errp)<br>
&gt;&gt;=C2=A0 =C2=A0static void write_memory(DumpState *s, GuestPhysBlock =
*block, ram_addr_t<br>
&gt;&gt; start,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int64_t size, Error **errp)<br>
&gt;&gt;=C2=A0 =C2=A0{<br>
&gt;&gt; +=C2=A0 =C2=A0 ERRP_GUARD();<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int64_t i;<br>
&gt;&gt; -=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; size / s-&gt;dump_i=
nfo.page_size; i++) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_data(s, block-&gt;ho=
st_addr + start + i *<br>
&gt;&gt; s-&gt;dump_info.page_size,<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0s-&gt;dump_info.page_size, &amp;local_err);<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (local_err) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, l=
ocal_err);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0s-&gt;dump_info.page_size, errp);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*errp) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((size % s-&gt;dump_info.page_size) !=
=3D 0) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_data(s, block-&gt;ho=
st_addr + start + i *<br>
&gt;&gt; s-&gt;dump_info.page_size,<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0size % s-&gt;dump_info.page_size, &amp;local_err);<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (local_err) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, l=
ocal_err);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0size % s-&gt;dump_info.page_size, errp);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*errp) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; @@ -476,11 +474,11 @@ static void get_offset_range(hwaddr phys_add=
r,<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0static void write_elf_loads(DumpState *s, Error **errp=
)<br>
&gt;&gt;=C2=A0 =C2=A0{<br>
&gt;&gt; +=C2=A0 =C2=A0 ERRP_GUARD();<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0hwaddr offset, filesz;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0MemoryMapping *memory_mapping;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t phdr_index =3D 1;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t max_index;<br>
&gt;&gt; -=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;have_section) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0max_index =3D s-&gt;sh_inf=
o;<br>
&gt;&gt; @@ -494,14 +492,13 @@ static void write_elf_loads(DumpState *s, Er=
ror<br>
&gt;&gt; **errp)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s, &amp;offset, &amp;filesz);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;dump_info.d_clas=
s =3D=3D ELFCLASS64) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_elf64_=
load(s, memory_mapping, phdr_index++, offset,<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0filesz, &amp;local_err);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0filesz, errp);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_elf32_=
load(s, memory_mapping, phdr_index++, offset,<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0filesz, &amp;local_err);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0filesz, errp);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (local_err) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, l=
ocal_err);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*errp) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt; @@ -514,7 +511,7 @@ static void write_elf_loads(DumpState *s, Erro=
r **errp)<br>
&gt;&gt;=C2=A0 =C2=A0/* write elf header, PT_NOTE and elf note to vmcore. *=
/<br>
&gt;&gt;=C2=A0 =C2=A0static void dump_begin(DumpState *s, Error **errp)<br>
&gt;&gt;=C2=A0 =C2=A0{<br>
&gt;&gt; -=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
&gt;&gt; +=C2=A0 =C2=A0 ERRP_GUARD();<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * the vmcore&#39;s format is:<br>
&gt;&gt; @@ -542,73 +539,64 @@ static void dump_begin(DumpState *s, Error *=
*errp)<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* write elf header to vmcore */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;dump_info.d_class =3D=3D ELFCL=
ASS64) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf64_header(s, &amp;local_err)=
;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf64_header(s, errp);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf32_header(s, &amp;local_err)=
;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf32_header(s, errp);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; -=C2=A0 =C2=A0 if (local_err) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
&gt;&gt; +=C2=A0 =C2=A0 if (*errp) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;dump_info.d_class =3D=3D ELFCL=
ASS64) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* write PT_NOTE to vmcore=
 */<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf64_note(s, &amp;local_err);<=
br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (local_err) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, l=
ocal_err);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf64_note(s, errp);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*errp) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* write all PT_LOAD to vm=
core */<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf_loads(s, &amp;local_err);<b=
r>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (local_err) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, l=
ocal_err);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf_loads(s, errp);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*errp) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* write section to vmcore=
 */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;have_section) {<=
br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf_section(s, 1,=
 &amp;local_err);<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (local_err) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_pro=
pagate(errp, local_err);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf_section(s, 1,=
 errp);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*errp) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0return;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* write notes to vmcore *=
/<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf64_notes(fd_write_vmcore, s,=
 &amp;local_err);<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (local_err) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, l=
ocal_err);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf64_notes(fd_write_vmcore, s,=
 errp);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*errp) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* write PT_NOTE to vmcore=
 */<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf32_note(s, &amp;local_err);<=
br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (local_err) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, l=
ocal_err);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf32_note(s, errp);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*errp) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* write all PT_LOAD to vm=
core */<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf_loads(s, &amp;local_err);<b=
r>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (local_err) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, l=
ocal_err);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf_loads(s, errp);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*errp) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* write section to vmcore=
 */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;have_section) {<=
br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf_section(s, 0,=
 &amp;local_err);<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (local_err) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_pro=
pagate(errp, local_err);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf_section(s, 0,=
 errp);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*errp) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0return;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* write notes to vmcore *=
/<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf32_notes(fd_write_vmcore, s,=
 &amp;local_err);<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (local_err) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, l=
ocal_err);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_elf32_notes(fd_write_vmcore, s,=
 errp);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*errp) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; @@ -644,9 +632,9 @@ static int get_next_block(DumpState *s, GuestP=
hysBlock<br>
&gt;&gt; *block)<br>
&gt;&gt;=C2=A0 =C2=A0/* write all memory to vmcore */<br>
&gt;&gt;=C2=A0 =C2=A0static void dump_iterate(DumpState *s, Error **errp)<b=
r>
&gt;&gt;=C2=A0 =C2=A0{<br>
&gt;&gt; +=C2=A0 =C2=A0 ERRP_GUARD();<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0GuestPhysBlock *block;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int64_t size;<br>
&gt;&gt; -=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0do {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0block =3D s-&gt;next_block=
;<br>
&gt;&gt; @@ -658,9 +646,8 @@ static void dump_iterate(DumpState *s, Error *=
*errp)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0size -=3D block-&gt;target_end - (s-&gt;begin + s-&gt;length);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_memory(s, block, s-&gt;start, s=
ize, &amp;local_err);<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (local_err) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, l=
ocal_err);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_memory(s, block, s-&gt;start, s=
ize, errp);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*errp) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt; @@ -669,11 +656,10 @@ static void dump_iterate(DumpState *s, Error=
 **errp)<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0static void create_vmcore(DumpState *s, Error **errp)<=
br>
&gt;&gt;=C2=A0 =C2=A0{<br>
&gt;&gt; -=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
&gt;&gt; +=C2=A0 =C2=A0 ERRP_GUARD();<br>
&gt;&gt;<br>
&gt;&gt; -=C2=A0 =C2=A0 dump_begin(s, &amp;local_err);<br>
&gt;&gt; -=C2=A0 =C2=A0 if (local_err) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
&gt;&gt; +=C2=A0 =C2=A0 dump_begin(s, errp);<br>
&gt;&gt; +=C2=A0 =C2=A0 if (*errp) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt; @@ -810,6 +796,7 @@ static bool note_name_equal(DumpState *s,<br>
&gt;&gt;=C2=A0 =C2=A0/* write common header, sub header and elf note to vmc=
ore */<br>
&gt;&gt;=C2=A0 =C2=A0static void create_header32(DumpState *s, Error **errp=
)<br>
&gt;&gt;=C2=A0 =C2=A0{<br>
&gt;&gt; +=C2=A0 =C2=A0 ERRP_GUARD();<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DiskDumpHeader32 *dh =3D NULL;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0KdumpSubHeader32 *kh =3D NULL;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t size;<br>
&gt;&gt; @@ -818,7 +805,6 @@ static void create_header32(DumpState *s, Erro=
r **errp)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t bitmap_blocks;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t status =3D 0;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t offset_note;<br>
&gt;&gt; -=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* write common header, the version of k=
dump-compressed format is 6th<br>
&gt;&gt; */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D sizeof(DiskDumpHeader32);<br>
&gt;&gt; @@ -894,9 +880,8 @@ static void create_header32(DumpState *s, Erro=
r **errp)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;note_buf_offset =3D 0;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* use s-&gt;note_buf to store notes tem=
porarily */<br>
&gt;&gt; -=C2=A0 =C2=A0 write_elf32_notes(buf_write_note, s, &amp;local_err=
);<br>
&gt;&gt; -=C2=A0 =C2=A0 if (local_err) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
&gt;&gt; +=C2=A0 =C2=A0 write_elf32_notes(buf_write_note, s, errp);<br>
&gt;&gt; +=C2=A0 =C2=A0 if (*errp) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (write_buffer(s-&gt;fd, offset_note, =
s-&gt;note_buf,<br>
&gt;&gt; @@ -922,6 +907,7 @@ out:<br>
&gt;&gt;=C2=A0 =C2=A0/* write common header, sub header and elf note to vmc=
ore */<br>
&gt;&gt;=C2=A0 =C2=A0static void create_header64(DumpState *s, Error **errp=
)<br>
&gt;&gt;=C2=A0 =C2=A0{<br>
&gt;&gt; +=C2=A0 =C2=A0 ERRP_GUARD();<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DiskDumpHeader64 *dh =3D NULL;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0KdumpSubHeader64 *kh =3D NULL;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t size;<br>
&gt;&gt; @@ -930,7 +916,6 @@ static void create_header64(DumpState *s, Erro=
r **errp)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t bitmap_blocks;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t status =3D 0;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t offset_note;<br>
&gt;&gt; -=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* write common header, the version of k=
dump-compressed format is 6th<br>
&gt;&gt; */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D sizeof(DiskDumpHeader64);<br>
&gt;&gt; @@ -1006,9 +991,8 @@ static void create_header64(DumpState *s, Err=
or<br>
&gt;&gt; **errp)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;note_buf_offset =3D 0;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* use s-&gt;note_buf to store notes tem=
porarily */<br>
&gt;&gt; -=C2=A0 =C2=A0 write_elf64_notes(buf_write_note, s, &amp;local_err=
);<br>
&gt;&gt; -=C2=A0 =C2=A0 if (local_err) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
&gt;&gt; +=C2=A0 =C2=A0 write_elf64_notes(buf_write_note, s, errp);<br>
&gt;&gt; +=C2=A0 =C2=A0 if (*errp) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt; @@ -1464,8 +1448,8 @@ out:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0static void create_kdump_vmcore(DumpState *s, Error **=
errp)<br>
&gt;&gt;=C2=A0 =C2=A0{<br>
&gt;&gt; +=C2=A0 =C2=A0 ERRP_GUARD();<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt;&gt; -=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * the kdump-compressed format is:<br>
&gt;&gt; @@ -1495,21 +1479,18 @@ static void create_kdump_vmcore(DumpState =
*s,<br>
&gt;&gt; Error **errp)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt; -=C2=A0 =C2=A0 write_dump_header(s, &amp;local_err);<br>
&gt;&gt; -=C2=A0 =C2=A0 if (local_err) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
&gt;&gt; +=C2=A0 =C2=A0 write_dump_header(s, errp);<br>
&gt;&gt; +=C2=A0 =C2=A0 if (*errp) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt; -=C2=A0 =C2=A0 write_dump_bitmap(s, &amp;local_err);<br>
&gt;&gt; -=C2=A0 =C2=A0 if (local_err) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
&gt;&gt; +=C2=A0 =C2=A0 write_dump_bitmap(s, errp);<br>
&gt;&gt; +=C2=A0 =C2=A0 if (*errp) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt; -=C2=A0 =C2=A0 write_dump_pages(s, &amp;local_err);<br>
&gt;&gt; -=C2=A0 =C2=A0 if (local_err) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
&gt;&gt; +=C2=A0 =C2=A0 write_dump_pages(s, errp);<br>
&gt;&gt; +=C2=A0 =C2=A0 if (*errp) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt; @@ -1639,10 +1620,10 @@ static void dump_init(DumpState *s, int fd=
, bool<br>
&gt;&gt; has_format,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0DumpGuestMemoryFormat format, bool paging, bool<br>
&gt;&gt; has_filter,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0int64_t begin, int64_t length, Error **errp)<br>
&gt;&gt;=C2=A0 =C2=A0{<br>
&gt;&gt; +=C2=A0 =C2=A0 ERRP_GUARD();<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0VMCoreInfoState *vmci =3D vmcoreinfo_fin=
d();<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0CPUState *cpu;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int nr_cpus;<br>
&gt;&gt; -=C2=A0 =C2=A0 Error *err =3D NULL;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;has_format =3D has_format;<br>
&gt;&gt; @@ -1761,9 +1742,8 @@ static void dump_init(DumpState *s, int fd, =
bool<br>
&gt;&gt; has_format,<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* get memory mapping */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (paging) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_get_guest_memory_mapping(&amp;s-=
&gt;list, &amp;s-&gt;guest_phys_blocks,<br>
&gt;&gt; &amp;err);<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err !=3D NULL) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, e=
rr);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_get_guest_memory_mapping(&amp;s-=
&gt;list, &amp;s-&gt;guest_phys_blocks,<br>
&gt;&gt; errp);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*errp) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup=
;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;&gt; @@ -1862,33 +1842,32 @@ cleanup:<br>
&gt;&gt;=C2=A0 =C2=A0/* this operation might be time consuming. */<br>
&gt;&gt;=C2=A0 =C2=A0static void dump_process(DumpState *s, Error **errp)<b=
r>
&gt;&gt;=C2=A0 =C2=A0{<br>
&gt;&gt; -=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
&gt;&gt; +=C2=A0 =C2=A0 ERRP_GUARD();<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DumpQueryResult *result =3D NULL;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;has_format &amp;&amp; s-&gt;fo=
rmat =3D=3D DUMP_GUEST_MEMORY_FORMAT_WIN_DMP) {<br>
&gt;&gt;=C2=A0 =C2=A0#ifdef TARGET_X86_64<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 create_win_dump(s, &amp;local_err);<b=
r>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 create_win_dump(s, errp);<br>
&gt;&gt;=C2=A0 =C2=A0#endif<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (s-&gt;has_format &amp;&amp; s=
-&gt;format !=3D<br>
&gt;&gt; DUMP_GUEST_MEMORY_FORMAT_ELF) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 create_kdump_vmcore(s, &amp;local_err=
);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 create_kdump_vmcore(s, errp);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 create_vmcore(s, &amp;local_err);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 create_vmcore(s, errp);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* make sure status is written after wri=
tten_size updates */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0smp_wmb();<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0qatomic_set(&amp;s-&gt;status,<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(local_err=
 ? DUMP_STATUS_FAILED : DUMP_STATUS_COMPLETED));<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(*errp ? D=
UMP_STATUS_FAILED : DUMP_STATUS_COMPLETED));<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* send DUMP_COMPLETED message (uncondit=
ionally) */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D qmp_query_dump(NULL);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* should never fail */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0assert(result);<br>
&gt;&gt; -=C2=A0 =C2=A0 qapi_event_send_dump_completed(result, !!local_err,=
 (local_err ?<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_get_pre=
tty(local_err) : NULL));<br>
&gt;&gt; +=C2=A0 =C2=A0 qapi_event_send_dump_completed(result, !!*errp, (*e=
rrp ?<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0error_get_pretty(*errp) : NULL));<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0qapi_free_DumpQueryResult(result);<br>
&gt;&gt;<br>
&gt;&gt; -=C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dump_cleanup(s);<br>
&gt;&gt;=C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt; @@ -1917,10 +1896,10 @@ void qmp_dump_guest_memory(bool paging, co=
nst char<br>
&gt;&gt; *file,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int64_t length, bool has_format,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DumpGuestMemoryFormat format, Error =
**errp)<br>
&gt;&gt;=C2=A0 =C2=A0{<br>
&gt;&gt; +=C2=A0 =C2=A0 ERRP_GUARD();<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *p;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int fd =3D -1;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DumpState *s;<br>
&gt;&gt; -=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool detach_p =3D false;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (runstate_check(RUN_STATE_INMIGRATE))=
 {<br>
&gt;&gt; @@ -2020,9 +1999,8 @@ void qmp_dump_guest_memory(bool paging, cons=
t char<br>
&gt;&gt; *file,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dump_state_prepare(s);<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dump_init(s, fd, has_format, format, pag=
ing, has_begin,<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 begin, length, &=
amp;local_err);<br>
&gt;&gt; -=C2=A0 =C2=A0 if (local_err) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 begin, length, e=
rrp);<br>
&gt;&gt; +=C2=A0 =C2=A0 if (*errp) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qatomic_set(&amp;s-&gt;sta=
tus, DUMP_STATUS_FAILED);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; --<br>
&gt;&gt; 2.32.0<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; <br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000000af7cc05db80e438--

