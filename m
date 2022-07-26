Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D4F5813FF
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 15:16:28 +0200 (CEST)
Received: from localhost ([::1]:55858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGKQE-0002vg-NN
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 09:16:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oGKLX-0007OC-BE; Tue, 26 Jul 2022 09:11:38 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:37576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oGKLV-0000dp-AA; Tue, 26 Jul 2022 09:11:35 -0400
Received: by mail-lf1-x136.google.com with SMTP id m12so21488174lfj.4;
 Tue, 26 Jul 2022 06:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=631klKqBI4Geg/unAvGhfw1OjCPW+yD2yTxenE1oyf0=;
 b=N2I688/1JGvJZdOdxZs12Um2jafAtOTlH0oYPw4kJ5fLgdLRfuwBzFsu3cLoKbEkv0
 /1fttTcTBKhNNSb+L5Sna0VuXvafWZ3z74Du3NmCZYIR+IgwFHtS2qv5TDMEgk9Uq2Pu
 laEXmC8pUQ7gOXeznUVWSAMvHgu9h0ByRIA3WOC57dfqco/4qHA+tQ1/WDm/CSfigoc0
 4hlDFobQIJdx17xrWwk4bvkTHO/j39T/RZsG5LM59kcz+1WhvTA3I0ruC0G2ZLwbnRln
 1ME1mPCQ5ZY76phal1bbfjw7ji1XgTyloxKsAOMdWQFBmUV6D1txx4cE0nPxRGc4rWP8
 6eNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=631klKqBI4Geg/unAvGhfw1OjCPW+yD2yTxenE1oyf0=;
 b=cDnLdof9WtDlEQBoI0ABb+207IOgYJ8RWF+Fs2UmicbzgS2sDIg4k41yny8mhOb4VR
 oV9tI7u3XH4+SKzQsdVfKVDpfscvcvKPfyFpkODLugz57fyOMP+a0hrMbgHKc4DxrnXx
 O0s2KYYV/8FICUqb4fJR3HYlXS0ri944Gd5frN/BYRhzCS3qPI1uB0f2Bk+SvIzeXBwD
 kiOYkRdbH6WNrvxLKgUj3+QwPrlj8KYbj/VwX6VI02pxo4NaPoIPDCjabtA0ElaGBUkO
 2RCi4nZ77UZNsXBFDdo6FDVRsEBrGeINa76jg2JsBa5aZ3eBrpyoC/9HjoJz7gVGxLsk
 I9rg==
X-Gm-Message-State: AJIora825ciXeXwQrn2YTy4dptgVApWNEJETrYpANGWAUh0tJnwoiryI
 zN8eFzftqlUcBZFkYeK6fSTtYXqJrxHmMGCxEMY=
X-Google-Smtp-Source: AGRyM1u0BedN8Tv1qp/Ee34diprP8PKOvzlXsKlaGk9tq6UopOSpugwUw4QiXEIyhqo+OPdpoJeXHaVbSUB8kxE5/fs=
X-Received: by 2002:a05:6512:2621:b0:47f:d228:bdeb with SMTP id
 bt33-20020a056512262100b0047fd228bdebmr5961621lfb.121.1658841088407; Tue, 26
 Jul 2022 06:11:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220726092248.128336-1-frankja@linux.ibm.com>
 <20220726092248.128336-3-frankja@linux.ibm.com>
 <CAMxuvazFw2eD1dTQJOQniQCc4faJd3zQw0jtfKdKygWEEtPe5A@mail.gmail.com>
 <8a8afcc3-a3cd-23f3-e7d3-f9a7a951da85@linux.ibm.com>
In-Reply-To: <8a8afcc3-a3cd-23f3-e7d3-f9a7a951da85@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 26 Jul 2022 17:11:16 +0400
Message-ID: <CAJ+F1C+7SkR4P0Qm9CPdEVYVUU-3Bso9GoL=yq_XWHu7c2wnkg@mail.gmail.com>
Subject: Re: [PATCH v4 02/17] dump: Introduce GuestPhysBlock offset and length
 filter functions
To: Janosch Frank <frankja@linux.ibm.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Bonzini, Paolo" <pbonzini@redhat.com>,
 mhartmay@linux.ibm.com, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, imbrenda@linux.ibm.com, 
 Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>, seiden@linux.ibm.com,
 scgl@linux.ibm.com
Content-Type: multipart/alternative; boundary="000000000000d03e7c05e4b50949"
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x136.google.com
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

--000000000000d03e7c05e4b50949
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 26, 2022 at 5:05 PM Janosch Frank <frankja@linux.ibm.com> wrote=
:

> On 7/26/22 13:35, Marc-Andr=C3=A9 Lureau wrote:
> > On Tue, Jul 26, 2022 at 1:23 PM Janosch Frank <frankja@linux.ibm.com>
> wrote:
> >>
> >> The iteration over the memblocks is hard to understand so it's about
> >> time to clean it up. Instead of manually grabbing the next memblock we
> >> can use QTAILQ_FOREACH to iterate over all memblocks.
> >>
> >> Additionally we move the calculation of the offset and length out by
> >> using the dump_get_memblock_*() functions.
> >>
> >> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> >> ---
> >>   dump/dump.c           | 37 +++++++++++++++++++++++++++++++++++++
> >>   include/sysemu/dump.h |  5 +++++
> >>   2 files changed, 42 insertions(+)
> >>
> >> diff --git a/dump/dump.c b/dump/dump.c
> >> index 0ed7cf9c7b..0fd7c76c1e 100644
> >> --- a/dump/dump.c
> >> +++ b/dump/dump.c
> >> @@ -591,6 +591,43 @@ static void dump_begin(DumpState *s, Error **errp=
)
> >>       write_elf_notes(s, errp);
> >>   }
> >>
> >> +int64_t dump_get_memblock_size(GuestPhysBlock *block, int64_t
> filter_area_start,
> >> +                               int64_t filter_area_length)
> >> +{
> >> +    int64_t size, left, right;
> >> +
> >> +    /* No filter, return full size */
> >> +    if (!filter_area_length) {
> >> +        return block->target_end - block->target_start;
> >> +    }
> >> +
> >> +    /* calculate the overlapped region. */
> >> +    left =3D MAX(filter_area_start, block->target_start);
> >> +    right =3D MIN(filter_area_start + filter_area_length,
> block->target_end);
> >> +    size =3D right - left;
> >> +    size =3D size > 0 ? size : 0;
> >> +
> >> +    return size;
> >> +}
> >> +
> >> +int64_t dump_get_memblock_start(GuestPhysBlock *block, int64_t
> filter_area_start,
> >> +                                int64_t filter_area_length)
> >> +{
> >> +    if (filter_area_length) {
> >> +        /* return -1 if the block is not within filter area */
> >> +        if (block->target_start >=3D filter_area_start +
> filter_area_length ||
> >> +            block->target_end <=3D filter_area_start) {
> >> +            return -1;
> >> +        }
> >> +
> >> +        if (filter_area_start > block->target_start) {
> >> +            return filter_area_start - block->target_start;
> >> +        }
> >> +    }
> >> +
> >> +    return 0;
> >> +}
> >> +
> >>   static int get_next_block(DumpState *s, GuestPhysBlock *block)
> >>   {
> >>       while (1) {
> >> diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
> >> index ffc2ea1072..6ce3c24197 100644
> >> --- a/include/sysemu/dump.h
> >> +++ b/include/sysemu/dump.h
> >> @@ -203,4 +203,9 @@ typedef struct DumpState {
> >>   uint16_t cpu_to_dump16(DumpState *s, uint16_t val);
> >>   uint32_t cpu_to_dump32(DumpState *s, uint32_t val);
> >>   uint64_t cpu_to_dump64(DumpState *s, uint64_t val);
> >> +
> >> +int64_t dump_get_memblock_size(GuestPhysBlock *block, int64_t
> filter_area_start,
> >> +                               int64_t filter_area_length);
> >> +int64_t dump_get_memblock_start(GuestPhysBlock *block, int64_t
> filter_area_start,
> >> +                                int64_t filter_area_length);
> >
> > The functions don't need to be exported. You probably need to
> > introduce them back with their usage, to avoid some compiler warning.
>
> Right, I'll add them in the last s390 dump patch and make them static
>
> > If you can't split the introduction and related refactoring, then
> > let's have a single patch.
>
> So squashing this with the next one but leave the other refactoring
> patches (dump_calculate_size() and get_start_block()) as they are?
>
>
Right, if you can't split it further.


--=20
Marc-Andr=C3=A9 Lureau

--000000000000d03e7c05e4b50949
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 26, 2022 at 5:05 PM Janos=
ch Frank &lt;<a href=3D"mailto:frankja@linux.ibm.com">frankja@linux.ibm.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
On 7/26/22 13:35, Marc-Andr=C3=A9 Lureau wrote:<br>
&gt; On Tue, Jul 26, 2022 at 1:23 PM Janosch Frank &lt;<a href=3D"mailto:fr=
ankja@linux.ibm.com" target=3D"_blank">frankja@linux.ibm.com</a>&gt; wrote:=
<br>
&gt;&gt;<br>
&gt;&gt; The iteration over the memblocks is hard to understand so it&#39;s=
 about<br>
&gt;&gt; time to clean it up. Instead of manually grabbing the next membloc=
k we<br>
&gt;&gt; can use QTAILQ_FOREACH to iterate over all memblocks.<br>
&gt;&gt;<br>
&gt;&gt; Additionally we move the calculation of the offset and length out =
by<br>
&gt;&gt; using the dump_get_memblock_*() functions.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Janosch Frank &lt;<a href=3D"mailto:frankja@linux.i=
bm.com" target=3D"_blank">frankja@linux.ibm.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0dump/dump.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
37 +++++++++++++++++++++++++++++++++++++<br>
&gt;&gt;=C2=A0 =C2=A0include/sysemu/dump.h |=C2=A0 5 +++++<br>
&gt;&gt;=C2=A0 =C2=A02 files changed, 42 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/dump/dump.c b/dump/dump.c<br>
&gt;&gt; index 0ed7cf9c7b..0fd7c76c1e 100644<br>
&gt;&gt; --- a/dump/dump.c<br>
&gt;&gt; +++ b/dump/dump.c<br>
&gt;&gt; @@ -591,6 +591,43 @@ static void dump_begin(DumpState *s, Error **=
errp)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0write_elf_notes(s, errp);<br>
&gt;&gt;=C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt; +int64_t dump_get_memblock_size(GuestPhysBlock *block, int64_t fil=
ter_area_start,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int64_t filter_area_length)=
<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 int64_t size, left, right;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 /* No filter, return full size */<br>
&gt;&gt; +=C2=A0 =C2=A0 if (!filter_area_length) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return block-&gt;target_end - block-&=
gt;target_start;<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 /* calculate the overlapped region. */<br>
&gt;&gt; +=C2=A0 =C2=A0 left =3D MAX(filter_area_start, block-&gt;target_st=
art);<br>
&gt;&gt; +=C2=A0 =C2=A0 right =3D MIN(filter_area_start + filter_area_lengt=
h, block-&gt;target_end);<br>
&gt;&gt; +=C2=A0 =C2=A0 size =3D right - left;<br>
&gt;&gt; +=C2=A0 =C2=A0 size =3D size &gt; 0 ? size : 0;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 return size;<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +int64_t dump_get_memblock_start(GuestPhysBlock *block, int64_t fi=
lter_area_start,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int64_t filter_area_length=
)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 if (filter_area_length) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* return -1 if the block is not with=
in filter area */<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (block-&gt;target_start &gt;=3D fi=
lter_area_start + filter_area_length ||<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 block-&gt;target_end &l=
t;=3D filter_area_start) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (filter_area_start &gt; block-&gt;=
target_start) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return filter_area_star=
t - block-&gt;target_start;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0static int get_next_block(DumpState *s, GuestPhysBlock=
 *block)<br>
&gt;&gt;=C2=A0 =C2=A0{<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0while (1) {<br>
&gt;&gt; diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h<br>
&gt;&gt; index ffc2ea1072..6ce3c24197 100644<br>
&gt;&gt; --- a/include/sysemu/dump.h<br>
&gt;&gt; +++ b/include/sysemu/dump.h<br>
&gt;&gt; @@ -203,4 +203,9 @@ typedef struct DumpState {<br>
&gt;&gt;=C2=A0 =C2=A0uint16_t cpu_to_dump16(DumpState *s, uint16_t val);<br=
>
&gt;&gt;=C2=A0 =C2=A0uint32_t cpu_to_dump32(DumpState *s, uint32_t val);<br=
>
&gt;&gt;=C2=A0 =C2=A0uint64_t cpu_to_dump64(DumpState *s, uint64_t val);<br=
>
&gt;&gt; +<br>
&gt;&gt; +int64_t dump_get_memblock_size(GuestPhysBlock *block, int64_t fil=
ter_area_start,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int64_t filter_area_length)=
;<br>
&gt;&gt; +int64_t dump_get_memblock_start(GuestPhysBlock *block, int64_t fi=
lter_area_start,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int64_t filter_area_length=
);<br>
&gt; <br>
&gt; The functions don&#39;t need to be exported. You probably need to<br>
&gt; introduce them back with their usage, to avoid some compiler warning.<=
br>
<br>
Right, I&#39;ll add them in the last s390 dump patch and make them static<b=
r>
<br>
&gt; If you can&#39;t split the introduction and related refactoring, then<=
br>
&gt; let&#39;s have a single patch.<br>
<br>
So squashing this with the next one but leave the other refactoring <br>
patches (dump_calculate_size() and get_start_block()) as they are?<br>
<br></blockquote><div><br></div><div>Right, if you can&#39;t split it furth=
er.</div></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"gmail=
_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000d03e7c05e4b50949--

