Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAFC583B92
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 11:56:28 +0200 (CEST)
Received: from localhost ([::1]:40782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH0Fm-0000wK-JB
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 05:56:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oH09W-0002uk-Dt; Thu, 28 Jul 2022 05:49:58 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230]:44008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oH09T-000379-Ml; Thu, 28 Jul 2022 05:49:58 -0400
Received: by mail-lj1-x230.google.com with SMTP id p22so1372376lji.10;
 Thu, 28 Jul 2022 02:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=quY1pQCayZhVi5dvjgl+8Y1y+W7+FBRDN81DtlfbDhs=;
 b=bIguN+gxm1suoEt9bVWvCMr8VRFfatl7dm/PfapFk/vtqEKLKLyNpdyenBSLdMDdTn
 cDABPqGcvjp0OqVd2DBVCbXwjfZ7LY7e71XotWr3Go88MRmA8glgtCpURGKCBOyNlt4W
 VrW/c7iubj6ywQY/zuh9b/98abQrUJkyxYF0MEtau5kpIRNFsGOzkD1THMIEUw+4Gegb
 6gCcxpwwlSetKFd5IuK3kECMCL1SRBzIs21KcLE8p/TUJ7AtggGEQesT0ofuS/BQ8kVH
 7ApNAm827WnvPyf4D0joL+IDyO9ewIThHGPGx/xLQxBIMLNVwAVxCvCxtO/Y2+nlS1lo
 8B+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=quY1pQCayZhVi5dvjgl+8Y1y+W7+FBRDN81DtlfbDhs=;
 b=7ogPgn/iKyPqWcD5+sQqfTwBlwg1BW8jeFiVhudLHgSbjxToggkv/FKMRZP9384AeT
 UkbKKkrK2se2QpzxaMg6nYQ7Rf2cO/G1JITdB9BTshtYyFVX54TKecRzP2csTOHbXBsR
 eZsdehEOy0R+WuQ6hnICPB5oRZZOeLUgK7qelzC+gRaJMHx0LTdYEvg04W37W+L+ArkG
 lzdv1PHjKHpH/6MvTy+CJP4XSEbDgb6D82X96QZP98jWZYTD92BYFxNsVqlpLgAWZhAx
 zm2BOEKqZs6nOMJTIfKXeQeVHKbA409QNA/yLOZ9MNkR8ySIrT5VVFeZcrJycxdI9WiF
 M/Rw==
X-Gm-Message-State: AJIora8pvKytQuitpNzMshf/4PBYnRH0y4+kpRJrObTFcUb5G8pk62T0
 JCU2nJFD0H+pv9udNml8/kW7K0lomp9QrMqkfzI=
X-Google-Smtp-Source: AGRyM1thTVhjFQbMtYaPqTzYcAWJb45uryoXFJ2ZmiuaDoX2Ud+YlvNrcJvg4berbZdec1VUY6wY213y6yt14rze8Ys=
X-Received: by 2002:a2e:8881:0:b0:255:7790:25e6 with SMTP id
 k1-20020a2e8881000000b00255779025e6mr9027069lji.525.1659001792989; Thu, 28
 Jul 2022 02:49:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220726092248.128336-1-frankja@linux.ibm.com>
 <20220726092248.128336-13-frankja@linux.ibm.com>
 <CAMxuvazpXtOjWH_OoBDAj0VB4gjGAcy4ozv_oouRYtcZ_+MZvQ@mail.gmail.com>
 <67258c43-3321-515f-671c-fe34cb23a232@linux.ibm.com>
In-Reply-To: <67258c43-3321-515f-671c-fe34cb23a232@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 28 Jul 2022 13:49:41 +0400
Message-ID: <CAJ+F1CKU6rEaRbNvz4aSjH4rG1NGK=pBp+ejgHFhcczcYmaRsw@mail.gmail.com>
Subject: Re: [PATCH v4 12/17] dump/dump: Add arch section support
To: Janosch Frank <frankja@linux.ibm.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Bonzini, Paolo" <pbonzini@redhat.com>,
 mhartmay@linux.ibm.com, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, imbrenda@linux.ibm.com, 
 Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>, seiden@linux.ibm.com,
 scgl@linux.ibm.com
Content-Type: multipart/alternative; boundary="0000000000008d8d0f05e4da74c4"
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x230.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--0000000000008d8d0f05e4da74c4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Jul 28, 2022 at 11:42 AM Janosch Frank <frankja@linux.ibm.com>
wrote:

> On 7/26/22 13:30, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Tue, Jul 26, 2022 at 1:23 PM Janosch Frank <frankja@linux.ibm.com>
> wrote:
> >>
> >> Add hooks which architectures can use to add arbitrary data to custom
> >> sections.
> >>
> >> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> >> ---
> >>   dump/dump.c                |  5 +++++
> >>   include/sysemu/dump-arch.h | 27 +++++++++++++++++++++++++++
> >>   2 files changed, 32 insertions(+)
> >>
> >> diff --git a/dump/dump.c b/dump/dump.c
> >> index 298a1e923f..1ec4c3b6c3 100644
> >> --- a/dump/dump.c
> >> +++ b/dump/dump.c
> >> @@ -398,6 +398,7 @@ static void prepare_elf_section_hdrs(DumpState *s)
> >>       /*
> >>        * Section ordering:
> >>        * - HDR zero (if needed)
> >> +     * - Arch section hdrs
> >>        * - String table hdr
> >>        */
> >>       sizeof_shdr =3D dump_is_64bit(s) ? sizeof(Elf64_Shdr) :
> sizeof(Elf32_Shdr);
> >> @@ -415,6 +416,8 @@ static void prepare_elf_section_hdrs(DumpState *s)
> >>           return;
> >>       }
> >>
> >> +    buff_hdr +=3D dump_arch_sections_write_hdr(&s->dump_info, s,
> buff_hdr);
> >> +
> >>       /*
> >>        * String table needs to be last section since strings are added
> >>        * via arch_sections_write_hdr().
> >> @@ -758,6 +761,7 @@ static void dump_end(DumpState *s, Error **errp)
> >>           return;
> >>       }
> >>       s->elf_section_data =3D g_malloc0(s->elf_section_data_size);
> >> +    dump_arch_sections_write(&s->dump_info, s, s->elf_section_data);
> >>
> >>       /* write sections to vmcore */
> >>       write_elf_sections(s, errp);
> >> @@ -1929,6 +1933,7 @@ static void dump_init(DumpState *s, int fd, bool
> has_format,
> >>        * If phdr_num overflowed we have at least one section header
> >>        * More sections/hdrs can be added by the architectures
> >>        */
> >> +    dump_arch_sections_add(&s->dump_info, (void *)s);
> >>       if (s->shdr_num > 1) {
> >>           /* Reserve the string table */
> >>           s->shdr_num +=3D 1;
> >> diff --git a/include/sysemu/dump-arch.h b/include/sysemu/dump-arch.h
> >> index e25b02e990..de77908424 100644
> >> --- a/include/sysemu/dump-arch.h
> >> +++ b/include/sysemu/dump-arch.h
> >> @@ -21,6 +21,9 @@ typedef struct ArchDumpInfo {
> >>       uint32_t page_size;      /* The target's page size. If it's
> variable and
> >>                                 * unknown, then this should be the
> maximum. */
> >>       uint64_t phys_base;      /* The target's physmem base. */
> >> +    void (*arch_sections_add_fn)(void *opaque);
> >> +    uint64_t (*arch_sections_write_hdr_fn)(void *opaque, uint8_t
> *buff);
> >> +    void (*arch_sections_write_fn)(void *opaque, uint8_t *buff);
> >
> > Why not pass DumpState? If there is an issue with header declaration
> > order, you can always move the declaration in include/qemu/typedefs.h,
> > I guess.
>
> The CPU note function passes the opaque pointer so I did as the same.
> If you want I can have a look if it makes sense to move over to DumpState=
.
>
>
Yes, please, give it a try


> >
> >>   } ArchDumpInfo;
> >>
> >>   struct GuestPhysBlockList; /* memory_mapping.h */
> >> @@ -28,4 +31,28 @@ int cpu_get_dump_info(ArchDumpInfo *info,
> >>                         const struct GuestPhysBlockList
> *guest_phys_blocks);
> >>   ssize_t cpu_get_note_size(int class, int machine, int nr_cpus);
> >>
> >> +static inline void dump_arch_sections_add(ArchDumpInfo *info, void
> *opaque)
> >> +{
> >> +    if (info->arch_sections_add_fn) {
> >> +        info->arch_sections_add_fn(opaque);
> >> +    }
> >> +}
> >> +
> >> +static inline uint64_t dump_arch_sections_write_hdr(ArchDumpInfo *inf=
o,
> >> +                                                void *opaque, uint8_t
> *buff)
> >> +{
> >> +    if (info->arch_sections_write_hdr_fn) {
> >> +        return info->arch_sections_write_hdr_fn(opaque, buff);
> >> +    }
> >> +    return 0;
> >> +}
> >> +
> >> +static inline void dump_arch_sections_write(ArchDumpInfo *info, void
> *opaque,
> >> +                                            uint8_t *buff)
> >> +{
> >> +    if (info->arch_sections_write_fn) {
> >> +        info->arch_sections_write_fn(opaque, buff);
> >> +    }
> >> +}
> >
> > We probably don't need those static inline helpers in the header.
> >
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000008d8d0f05e4da74c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 28, 2022 at 11:42 AM Ja=
nosch Frank &lt;<a href=3D"mailto:frankja@linux.ibm.com">frankja@linux.ibm.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On 7/26/22 13:30, Marc-Andr=C3=A9 Lureau wrote:<br>
&gt; Hi<br>
&gt; <br>
&gt; On Tue, Jul 26, 2022 at 1:23 PM Janosch Frank &lt;<a href=3D"mailto:fr=
ankja@linux.ibm.com" target=3D"_blank">frankja@linux.ibm.com</a>&gt; wrote:=
<br>
&gt;&gt;<br>
&gt;&gt; Add hooks which architectures can use to add arbitrary data to cus=
tom<br>
&gt;&gt; sections.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Janosch Frank &lt;<a href=3D"mailto:frankja@linux.i=
bm.com" target=3D"_blank">frankja@linux.ibm.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0dump/dump.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 5 +++++<br>
&gt;&gt;=C2=A0 =C2=A0include/sysemu/dump-arch.h | 27 ++++++++++++++++++++++=
+++++<br>
&gt;&gt;=C2=A0 =C2=A02 files changed, 32 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/dump/dump.c b/dump/dump.c<br>
&gt;&gt; index 298a1e923f..1ec4c3b6c3 100644<br>
&gt;&gt; --- a/dump/dump.c<br>
&gt;&gt; +++ b/dump/dump.c<br>
&gt;&gt; @@ -398,6 +398,7 @@ static void prepare_elf_section_hdrs(DumpState=
 *s)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Section ordering:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * - HDR zero (if needed)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0* - Arch section hdrs<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * - String table hdr<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof_shdr =3D dump_is_64bit(s) ? sizeo=
f(Elf64_Shdr) : sizeof(Elf32_Shdr);<br>
&gt;&gt; @@ -415,6 +416,8 @@ static void prepare_elf_section_hdrs(DumpState=
 *s)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt; +=C2=A0 =C2=A0 buff_hdr +=3D dump_arch_sections_write_hdr(&amp;s-&=
gt;dump_info, s, buff_hdr);<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * String table needs to be last section=
 since strings are added<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * via arch_sections_write_hdr().<br>
&gt;&gt; @@ -758,6 +761,7 @@ static void dump_end(DumpState *s, Error **err=
p)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;elf_section_data =3D g_malloc0(s-&=
gt;elf_section_data_size);<br>
&gt;&gt; +=C2=A0 =C2=A0 dump_arch_sections_write(&amp;s-&gt;dump_info, s, s=
-&gt;elf_section_data);<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* write sections to vmcore */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0write_elf_sections(s, errp);<br>
&gt;&gt; @@ -1929,6 +1933,7 @@ static void dump_init(DumpState *s, int fd, =
bool has_format,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * If phdr_num overflowed we have at lea=
st one section header<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * More sections/hdrs can be added by th=
e architectures<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;&gt; +=C2=A0 =C2=A0 dump_arch_sections_add(&amp;s-&gt;dump_info, (void =
*)s);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;shdr_num &gt; 1) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Reserve the string tabl=
e */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;shdr_num +=3D 1;<br>
&gt;&gt; diff --git a/include/sysemu/dump-arch.h b/include/sysemu/dump-arch=
.h<br>
&gt;&gt; index e25b02e990..de77908424 100644<br>
&gt;&gt; --- a/include/sysemu/dump-arch.h<br>
&gt;&gt; +++ b/include/sysemu/dump-arch.h<br>
&gt;&gt; @@ -21,6 +21,9 @@ typedef struct ArchDumpInfo {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t page_size;=C2=A0 =C2=A0 =C2=A0 =
/* The target&#39;s page size. If it&#39;s variable and<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* unknown, then this sh=
ould be the maximum. */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t phys_base;=C2=A0 =C2=A0 =C2=A0 =
/* The target&#39;s physmem base. */<br>
&gt;&gt; +=C2=A0 =C2=A0 void (*arch_sections_add_fn)(void *opaque);<br>
&gt;&gt; +=C2=A0 =C2=A0 uint64_t (*arch_sections_write_hdr_fn)(void *opaque=
, uint8_t *buff);<br>
&gt;&gt; +=C2=A0 =C2=A0 void (*arch_sections_write_fn)(void *opaque, uint8_=
t *buff);<br>
&gt; <br>
&gt; Why not pass DumpState? If there is an issue with header declaration<b=
r>
&gt; order, you can always move the declaration in include/qemu/typedefs.h,=
<br>
&gt; I guess.<br>
<br>
The CPU note function passes the opaque pointer so I did as the same.<br>
If you want I can have a look if it makes sense to move over to DumpState.<=
br>
<br></blockquote><div><br></div><div>Yes, please, give it a try</div><div>=
=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; <br>
&gt;&gt;=C2=A0 =C2=A0} ArchDumpInfo;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0struct GuestPhysBlockList; /* memory_mapping.h */<br>
&gt;&gt; @@ -28,4 +31,28 @@ int cpu_get_dump_info(ArchDumpInfo *info,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0const struct GuestPhysBlockList *guest_phys_blocks)=
;<br>
&gt;&gt;=C2=A0 =C2=A0ssize_t cpu_get_note_size(int class, int machine, int =
nr_cpus);<br>
&gt;&gt;<br>
&gt;&gt; +static inline void dump_arch_sections_add(ArchDumpInfo *info, voi=
d *opaque)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 if (info-&gt;arch_sections_add_fn) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 info-&gt;arch_sections_add_fn(opaque)=
;<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static inline uint64_t dump_arch_sections_write_hdr(ArchDumpInfo =
*info,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *opaque, uint8_t *buff)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 if (info-&gt;arch_sections_write_hdr_fn) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return info-&gt;arch_sections_write_h=
dr_fn(opaque, buff);<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static inline void dump_arch_sections_write(ArchDumpInfo *info, v=
oid *opaque,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 uint8_t *buff)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 if (info-&gt;arch_sections_write_fn) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 info-&gt;arch_sections_write_fn(opaqu=
e, buff);<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; +}<br>
&gt; <br>
&gt; We probably don&#39;t need those static inline helpers in the header.<=
br>
&gt; <br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000008d8d0f05e4da74c4--

