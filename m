Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C056468DCBD
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 16:19:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPPjq-0001ZE-MX; Tue, 07 Feb 2023 10:18:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pPPjb-0001RV-9U; Tue, 07 Feb 2023 10:18:20 -0500
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pPPjY-0001D2-R8; Tue, 07 Feb 2023 10:18:14 -0500
Received: by mail-vs1-xe2d.google.com with SMTP id a24so16620551vsl.2;
 Tue, 07 Feb 2023 07:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qCIrFd39avKPlw2r7zce1/kGjlqMZFpM3Z8F2/TZNQY=;
 b=O3BmJAjEdHJhOmthIESdyVA91Me6EL5MobwLjydUPQY+cH30T6U8RYsJTL8lSlzkIK
 9FkZIVjOLgeGxpi0yrBDvnYNZXSBgkbKdrrXZZ8TtEbe7oP2H6I5ROjT7lHa9juwWHdv
 EmDrtC0oEQ+Y7VKT7gtKNAVh9CgqGy6MeF/aHFDecKXyMPuqQMrGLvf/UUmkKo7WvI28
 BTSSNw2uCKBaL4iVxJqzAeG2hHMTwHxeFKyy+p3FvAtyzbL4Yu7BEMbMs2xxIQTHU64B
 iJk6Wh51tnVLEgGa3icEzBrEqq6a2PqyRhh267nsA87B5Vn5btz3FCzanbnR6BsNRTtL
 HfcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qCIrFd39avKPlw2r7zce1/kGjlqMZFpM3Z8F2/TZNQY=;
 b=dGRi2f7McG35Dc/cn1hEfF2HM5RftnnkWbSwUidrektXEM5MAVFcL9mK1MIPYxee8h
 U1XZNaQQIOGGLwty5A+Mg/3gqfOV3pwiE6xRxZhOGeRfn7aUHUN9e6Y6aYj4Ys3yhj4f
 zmHW1bzvoOTVh6bvzzsDeZtKO6p83yC3kryAjh2TYXvovxcw8DniaevglrcU5TRjtC3O
 B2+l5WkemjUa/7LRbdkBvpjYYI461SeYZA0LCTS5zatm8IeMkO9v8RTp0KkCA2uHJN0+
 ck8maK18Dan+lPhH0mTrIeS3V8Elu/2yasZ7T1MblaZDTShJ289a8bDnZEup/ujr1EYU
 SyDw==
X-Gm-Message-State: AO0yUKUCl9j2zQCCBj1JpPl2KE4LUe4Hp9IKheSKrOYHPlHCz5NOMJi9
 tQu32/+tL/Zi6fBuQALjRGLuxVQGA3GVATrOzTU=
X-Google-Smtp-Source: AK7set8BBRXpFmebvZDVXzPezqhM5NvmV9x+unxeM04qdHVtEglrpmEPsgEUhr2jNTJzA32CtBJGNE6SS9kB5riHLtw=
X-Received: by 2002:a05:6102:837:b0:411:ac71:dde0 with SMTP id
 k23-20020a056102083700b00411ac71dde0mr55064vsb.38.1675783090046; Tue, 07 Feb
 2023 07:18:10 -0800 (PST)
MIME-Version: 1.0
References: <20230204151027.39007-1-shentey@gmail.com>
 <20230204151027.39007-9-shentey@gmail.com>
 <10bf125e-85a4-72cc-07de-0d6206941f62@linaro.org>
 <87h6vzcdlb.fsf@secure.mitica>
In-Reply-To: <87h6vzcdlb.fsf@secure.mitica>
From: Bernhard Beschow <shentey@gmail.com>
Date: Tue, 7 Feb 2023 16:17:56 +0100
Message-ID: <CAG4p6K4woqhr2ZxyV6MbehASDXVB9=ssTzHrPMEB=0N+c3P3Yw@mail.gmail.com>
Subject: Re: [PATCH v3 8/9] hw/i386/x86: Make TYPE_X86_MACHINE the owner of
 smram
To: quintela@redhat.com
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, 
 qemu-trivial@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>, 
 Laurent Vivier <lvivier@redhat.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, 
 "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000cd8bd605f41da7a5"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=shentey@gmail.com; helo=mail-vs1-xe2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--000000000000cd8bd605f41da7a5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 6, 2023 at 11:06 AM Juan Quintela <quintela@redhat.com> wrote:

> Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:
> > On 4/2/23 16:10, Bernhard Beschow wrote:
> >> Treat the smram MemoryRegion analoguous to other memory regions such a=
s
> >> ram, pci, io, ... , making the used memory regions more explicit when
> >> instantiating q35 or i440fx.
> >> Note that the q35 device uses these memory regions only during the
> >> realize phase which suggests that it shouldn't be the owner of smram.
> >
> > Few years ago I tried something similar and it wasn't accepted because
> > the MR owner name is used in the migration stream, so this was breaking
> > migrating from older machines.
>
> I don't remember the details O:-)
>
> Migration code, really depends on RAMBlocks names, not memory region
> names.  But as far as I remember, that don't matter too much because the
> memory region names ends tangled quite a bit with the RAMBlock name, righ=
t?
>
> > Adding David/Juan for double-checking that.
>
>     trace_vmstate_save(se->idstr, se->vmsd ? se->vmsd->name : "(old)");
>
> You can try to enable this trace and see that every section has the same
> name with and without your change (i.e. that memory region name is not
> seen by the migration stream).
>
> But that is the only help that I can came with.
>
> The code that you are changing (smram) is something that I don't know
> about to give you more help.
>
> Looking at the patch, it looks that the name was before and now the
> "sram", so perhaps it could help.  But I don't know.
>
> In the i440fx you say that you only use it until realize, so you should
> be safe.
>
> For q35, it is not clear to me.
>
> If the trace don't show new names, I will just try:
> - migrate a i440fx machine from binary without your patch to one with
>   your patch
> - the same for q35.
>
> And depending on the result, we can go from there.
>

Thanks for the pointers, Juan!

I took some inspiration and created four migration files,
{pc,q35}-{before,after}.mig by running `qemu-system-x86_64 -M {pc,q35} -S`
with qemu built from master and from my branch. Then I basically ran
 `./scripts/analyze-migration.py -d desc -f *.mig > *.json` on the four
files and compared the diffs. Both diffs were empty. AFAIU this proves that
there is no binary change, right?

Best regards,
Bernhard
>
>
> Later, Juan.
>
>

--000000000000cd8bd605f41da7a5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 6, 2023 at 11:06 AM Juan =
Quintela &lt;<a href=3D"mailto:quintela@redhat.com">quintela@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Phil=
ippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org" target=3D"=
_blank">philmd@linaro.org</a>&gt; wrote:<br>
&gt; On 4/2/23 16:10, Bernhard Beschow wrote:<br>
&gt;&gt; Treat the smram MemoryRegion analoguous to other memory regions su=
ch as<br>
&gt;&gt; ram, pci, io, ... , making the used memory regions more explicit w=
hen<br>
&gt;&gt; instantiating q35 or i440fx.<br>
&gt;&gt; Note that the q35 device uses these memory regions only during the=
<br>
&gt;&gt; realize phase which suggests that it shouldn&#39;t be the owner of=
 smram.<br>
&gt;<br>
&gt; Few years ago I tried something similar and it wasn&#39;t accepted bec=
ause<br>
&gt; the MR owner name is used in the migration stream, so this was breakin=
g<br>
&gt; migrating from older machines.<br>
<br>
I don&#39;t remember the details O:-)<br>
<br>
Migration code, really depends on RAMBlocks names, not memory region<br>
names.=C2=A0 But as far as I remember, that don&#39;t matter too much becau=
se the<br>
memory region names ends tangled quite a bit with the RAMBlock name, right?=
<br>
<br>
&gt; Adding David/Juan for double-checking that.<br>
<br>
=C2=A0 =C2=A0 trace_vmstate_save(se-&gt;idstr, se-&gt;vmsd ? se-&gt;vmsd-&g=
t;name : &quot;(old)&quot;);<br>
<br>
You can try to enable this trace and see that every section has the same<br=
>
name with and without your change (i.e. that memory region name is not<br>
seen by the migration stream).<br>
<br>
But that is the only help that I can came with.<br>
<br>
The code that you are changing (smram) is something that I don&#39;t know<b=
r>
about to give you more help.<br>
<br>
Looking at the patch, it looks that the name was before and now the<br>
&quot;sram&quot;, so perhaps it could help.=C2=A0 But I don&#39;t know.<br>
<br>
In the i440fx you say that you only use it until realize, so you should<br>
be safe.<br>
<br>
For q35, it is not clear to me.<br>
<br>
If the trace don&#39;t show new names, I will just try:<br>
- migrate a i440fx machine from binary without your patch to one with<br>
=C2=A0 your patch<br>
- the same for q35.<br>
<br>
And depending on the result, we can go from there.<br></blockquote><div><br=
></div><div>Thanks for the pointers, Juan!</div><div><br></div>I took some =
inspiration and created four migration files, {pc,q35}-{before,after}.mig b=
y running `qemu-system-x86_64 -M {pc,q35} -S` with qemu built from master a=
nd from my branch. Then I basically ran =C2=A0`./scripts/analyze-migration.=
py -d desc -f *.mig &gt; *.json` on the four files and compared the diffs. =
Both diffs were empty. AFAIU this proves that there is no binary change, ri=
ght?<br><br>Best regards,<br>Bernhard<blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
<br>
Later, Juan.<br>
<br>
</blockquote></div></div>

--000000000000cd8bd605f41da7a5--

