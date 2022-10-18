Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0BC602F03
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 16:58:26 +0200 (CEST)
Received: from localhost ([::1]:36878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oko2y-00077w-8c
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 10:58:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1oknrL-0003JJ-1m
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 10:46:23 -0400
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843]:45577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1oknr6-00018q-Sr
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 10:46:20 -0400
Received: by mail-qt1-x843.google.com with SMTP id s3so9747295qtn.12
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 07:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xJZt6QH/NR4nor4tDKLT5fqpMPn4CG8dK1458w5ChKI=;
 b=kaic+9uLbjwweaTz/fa+JvFLFAm9yIORxSHtWGGfouCY1uBub1OKPzrOhXaPj9iqx8
 2z1kBXyhJsA001p9R8F5ik5LM5Z332NoxFopgd1YnmsBZeDYUi3eHeLjlFWoOn8hwzER
 w2j33YJuUk+whZDT+fJcAWw0C6+cCWWU1vzRqxKGQrMG7ALnDswrJXRi7ptiL+x71/cj
 hxAEmEt5nD9TDjR0TRPn92cN+Yh2v0otVOXyrNjg8/wHVzr8dNu3EmyZlWfP6O3EnscH
 xWak9m8lCbAhmILUhvRlr3QgotD6IUlqyDKdVuzCN0gwFmT3H/dj04XUd4v6OaF7WdEA
 inLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xJZt6QH/NR4nor4tDKLT5fqpMPn4CG8dK1458w5ChKI=;
 b=yZ22qywUwIqzAkoQunD6qQfTpfRyyFKMUzJm6LztZ20MB224ZMfOcya54BTvz9M4e6
 tF7zNyhicFY4ev7WdjDtfwD2GsYin0a0pkmtT+u68jFzHco/i3e7JcA8Ff60OKYdYj9L
 3hbiGo468+bcSYXQmWxcQrGX/Oj6aptBdainNHVtQ8bmgK8Q7VrMVuyr5xbUamYfgrTT
 87SITok/kJnVyYcWsJMAVkmT+0LhjhwOqha5gTWupdByPK0GzosNp6O7FXtac8smn7LV
 FUNczB35FZydJmtaDk7jpOyYKQ9EyhjBYUiiMoBq5zIPoDsS7+0G2k1J4jBZW4wKtK+8
 VOVA==
X-Gm-Message-State: ACrzQf30dcejQoZ29reZQ6PU+rWv7Q3UIoozG7CXPGAqI+z1CRMU3uH6
 Xm5V86h/c4gJpklyx0JTyhUi5WIiecoDCxT3LQ==
X-Google-Smtp-Source: AMsMyM7bgbmNoGtZ9ZmlEt9bnbOnKI0DjldFdeU5jsjYHTedYDJhUKgslyzU9oK0CmpZ2FChWVK69N/qcl5wu2Qmt54=
X-Received: by 2002:ac8:5f83:0:b0:39c:e5a2:6dfe with SMTP id
 j3-20020ac85f83000000b0039ce5a26dfemr2323498qta.428.1666104366616; Tue, 18
 Oct 2022 07:46:06 -0700 (PDT)
MIME-Version: 1.0
References: <20221017234001.53297-1-gregory.price@memverge.com>
 <CAARzgwxEO5rr=b_QjiG7RoEdV=9yOgj9gxUxNvuaUnNtUEnhtw@mail.gmail.com>
In-Reply-To: <CAARzgwxEO5rr=b_QjiG7RoEdV=9yOgj9gxUxNvuaUnNtUEnhtw@mail.gmail.com>
From: Gregory Price <gourry.memverge@gmail.com>
Date: Tue, 18 Oct 2022 10:45:49 -0400
Message-ID: <CAD3UvdTWLXf_OecWbtP9wfAvO2+xdWiAUjQHONrgB4AAAjwdHQ@mail.gmail.com>
Subject: Re: [BUG] hw/i386/pc.c: CXL Fixed Memory Window should not reserve
 e820 in bios
To: Ani Sinha <ani@anisinha.ca>
Cc: qemu-devel@nongnu.org, mst@redhat.com, marcel.apfelbaum@gmail.com, 
 imammedo@redhat.com, jonathan.cameron@huawei.com, linux-cxl@vger.kernel.org, 
 alison.schofield@intel.com, dave@stgolabs.net, a.manzanares@samsung.com, 
 bwidawsk@kernel.org, gregory.price@memverge.com, hchkuo@avery-design.com.tw, 
 cbrowy@avery-design.com, ira.weiny@intel.com
Content-Type: multipart/alternative; boundary="000000000000ee543705eb502642"
Received-SPF: pass client-ip=2607:f8b0:4864:20::843;
 envelope-from=gourry.memverge@gmail.com; helo=mail-qt1-x843.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ee543705eb502642
Content-Type: text/plain; charset="UTF-8"

This patch does not resolve the issue, reserved entries are still created.

[    0.000000] BIOS-e820: [mem 0x0000000280000000-0x00000002800fffff]
reserved
[    0.000000] BIOS-e820: [mem 0x0000000290000000-0x000000029fffffff]
reserved

# cat /proc/iomem
290000000-29fffffff : CXL Window 0
  290000000-29fffffff : Reserved

# cxl create-region -m -d decoder0.0 -w 1 -g 256 mem0
cxl region: create_region: region0: set_size failed: Numerical result out
of range
cxl region: cmd_create_region: created 0 regions

On Tue, Oct 18, 2022 at 2:05 AM Ani Sinha <ani@anisinha.ca> wrote:

> On Tue, Oct 18, 2022 at 5:14 AM Gregory Price <gourry.memverge@gmail.com>
> wrote:
> >
> > Early-boot e820 records will be inserted by the bios/efi/early boot
> > software and be reported to the kernel via insert_resource.  Later, when
> > CXL drivers iterate through the regions again, they will insert another
> > resource and make the RESERVED memory area a child.
>
> I have already sent a patch
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg882012.html .
> When the patch is applied, there would not be any reserved entries
> even with passing E820_RESERVED .
> So this patch needs to be evaluated in the light of the above patch I
> sent. Once you apply my patch, does the issue still exist?
>
> >
> > This RESERVED memory area causes the memory region to become unusable,
> > and as a result attempting to create memory regions with
> >
> >     `cxl create-region ...`
> >
> > Will fail due to the RESERVED area intersecting with the CXL window.
> >
> >
> > During boot the following traceback is observed:
> >
> > 0xffffffff81101650 in insert_resource_expand_to_fit ()
> > 0xffffffff83d964c5 in e820__reserve_resources_late ()
> > 0xffffffff83e03210 in pcibios_resource_survey ()
> > 0xffffffff83e04f4a in pcibios_init ()
> >
> > Which produces a call to reserve the CFMWS area:
> >
> > (gdb) p *new
> > $54 = {start = 0x290000000, end = 0x2cfffffff, name = "Reserved",
> >        flags = 0x200, desc = 0x7, parent = 0x0, sibling = 0x0,
> >        child = 0x0}
> >
> > Later the Kernel parses ACPI tables and reserves the exact same area as
> > the CXL Fixed Memory Window.  The use of `insert_resource_conflict`
> > retains the RESERVED region and makes it a child of the new region.
> >
> > 0xffffffff811016a4 in insert_resource_conflict ()
> >                       insert_resource ()
> > 0xffffffff81a81389 in cxl_parse_cfmws ()
> > 0xffffffff818c4a81 in call_handler ()
> >                       acpi_parse_entries_array ()
> >
> > (gdb) p/x *new
> > $59 = {start = 0x290000000, end = 0x2cfffffff, name = "CXL Window 0",
> >        flags = 0x200, desc = 0x0, parent = 0x0, sibling = 0x0,
> >        child = 0x0}
> >
> > This produces the following output in /proc/iomem:
> >
> > 590000000-68fffffff : CXL Window 0
> >   590000000-68fffffff : Reserved
> >
> > This reserved area causes `get_free_mem_region()` to fail due to a check
> > against `__region_intersects()`.  Due to this reserved area, the
> > intersect check will only ever return REGION_INTERSECTS, which causes
> > `cxl create-region` to always fail.
> >
> > Signed-off-by: Gregory Price <gregory.price@memverge.com>
> > ---
> >  hw/i386/pc.c | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> > index 566accf7e6..5bf5465a21 100644
> > --- a/hw/i386/pc.c
> > +++ b/hw/i386/pc.c
> > @@ -1061,7 +1061,6 @@ void pc_memory_init(PCMachineState *pcms,
> >          hwaddr cxl_size = MiB;
> >
> >          cxl_base = pc_get_cxl_range_start(pcms);
> > -        e820_add_entry(cxl_base, cxl_size, E820_RESERVED);
> >          memory_region_init(mr, OBJECT(machine), "cxl_host_reg",
> cxl_size);
> >          memory_region_add_subregion(system_memory, cxl_base, mr);
> >          cxl_resv_end = cxl_base + cxl_size;
> > @@ -1077,7 +1076,6 @@ void pc_memory_init(PCMachineState *pcms,
> >                  memory_region_init_io(&fw->mr, OBJECT(machine),
> &cfmws_ops, fw,
> >                                        "cxl-fixed-memory-region",
> fw->size);
> >                  memory_region_add_subregion(system_memory, fw->base,
> &fw->mr);
> > -                e820_add_entry(fw->base, fw->size, E820_RESERVED);
> >                  cxl_fmw_base += fw->size;
> >                  cxl_resv_end = cxl_fmw_base;
> >              }
> > --
> > 2.37.3
> >
>

--000000000000ee543705eb502642
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr">This patch does not resolve the issue, reserved entries are still=
 created.<div><br></div><div><div>[=C2=A0 =C2=A0 0.000000] BIOS-e820: [mem =
0x0000000280000000-0x00000002800fffff] reserved</div><div>[=C2=A0 =C2=A0 0.=
000000] BIOS-e820: [mem 0x0000000290000000-0x000000029fffffff] reserved<br>=
<br></div></div><div># cat /proc/iomem<br></div><div><div>290000000-29fffff=
ff : CXL Window 0</div><div>=C2=A0 290000000-29fffffff : Reserved<br><br><d=
iv># cxl create-region -m -d decoder0.0 -w 1 -g 256 mem0</div><div>cxl regi=
on: create_region: region0: set_size failed: Numerical result out of range<=
/div><div>cxl region: cmd_create_region: created 0 regions</div></div></div=
></div></div></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Tue, Oct 18, 2022 at 2:05 AM Ani Sinha &lt;<a h=
ref=3D"mailto:ani@anisinha.ca">ani@anisinha.ca</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">On Tue, Oct 18, 2022 at 5:14 =
AM Gregory Price &lt;<a href=3D"mailto:gourry.memverge@gmail.com" target=3D=
"_blank">gourry.memverge@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Early-boot e820 records will be inserted by the bios/efi/early boot<br=
>
&gt; software and be reported to the kernel via insert_resource.=C2=A0 Late=
r, when<br>
&gt; CXL drivers iterate through the regions again, they will insert anothe=
r<br>
&gt; resource and make the RESERVED memory area a child.<br>
<br>
I have already sent a patch<br>
<a href=3D"https://www.mail-archive.com/qemu-devel@nongnu.org/msg882012.htm=
l" rel=3D"noreferrer" target=3D"_blank">https://www.mail-archive.com/qemu-d=
evel@nongnu.org/msg882012.html</a> .<br>
When the patch is applied, there would not be any reserved entries<br>
even with passing E820_RESERVED .<br>
So this patch needs to be evaluated in the light of the above patch I<br>
sent. Once you apply my patch, does the issue still exist?<br>
<br>
&gt;<br>
&gt; This RESERVED memory area causes the memory region to become unusable,=
<br>
&gt; and as a result attempting to create memory regions with<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0`cxl create-region ...`<br>
&gt;<br>
&gt; Will fail due to the RESERVED area intersecting with the CXL window.<b=
r>
&gt;<br>
&gt;<br>
&gt; During boot the following traceback is observed:<br>
&gt;<br>
&gt; 0xffffffff81101650 in insert_resource_expand_to_fit ()<br>
&gt; 0xffffffff83d964c5 in e820__reserve_resources_late ()<br>
&gt; 0xffffffff83e03210 in pcibios_resource_survey ()<br>
&gt; 0xffffffff83e04f4a in pcibios_init ()<br>
&gt;<br>
&gt; Which produces a call to reserve the CFMWS area:<br>
&gt;<br>
&gt; (gdb) p *new<br>
&gt; $54 =3D {start =3D 0x290000000, end =3D 0x2cfffffff, name =3D &quot;Re=
served&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 flags =3D 0x200, desc =3D 0x7, parent =3D 0=
x0, sibling =3D 0x0,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 child =3D 0x0}<br>
&gt;<br>
&gt; Later the Kernel parses ACPI tables and reserves the exact same area a=
s<br>
&gt; the CXL Fixed Memory Window.=C2=A0 The use of `insert_resource_conflic=
t`<br>
&gt; retains the RESERVED region and makes it a child of the new region.<br=
>
&gt;<br>
&gt; 0xffffffff811016a4 in insert_resource_conflict ()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0insert_resource ()<br>
&gt; 0xffffffff81a81389 in cxl_parse_cfmws ()<br>
&gt; 0xffffffff818c4a81 in call_handler ()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0acpi_parse_entries_array ()<br>
&gt;<br>
&gt; (gdb) p/x *new<br>
&gt; $59 =3D {start =3D 0x290000000, end =3D 0x2cfffffff, name =3D &quot;CX=
L Window 0&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 flags =3D 0x200, desc =3D 0x0, parent =3D 0=
x0, sibling =3D 0x0,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 child =3D 0x0}<br>
&gt;<br>
&gt; This produces the following output in /proc/iomem:<br>
&gt;<br>
&gt; 590000000-68fffffff : CXL Window 0<br>
&gt;=C2=A0 =C2=A0590000000-68fffffff : Reserved<br>
&gt;<br>
&gt; This reserved area causes `get_free_mem_region()` to fail due to a che=
ck<br>
&gt; against `__region_intersects()`.=C2=A0 Due to this reserved area, the<=
br>
&gt; intersect check will only ever return REGION_INTERSECTS, which causes<=
br>
&gt; `cxl create-region` to always fail.<br>
&gt;<br>
&gt; Signed-off-by: Gregory Price &lt;<a href=3D"mailto:gregory.price@memve=
rge.com" target=3D"_blank">gregory.price@memverge.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/i386/pc.c | 2 --<br>
&gt;=C2=A0 1 file changed, 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/hw/i386/pc.c b/hw/i386/pc.c<br>
&gt; index 566accf7e6..5bf5465a21 100644<br>
&gt; --- a/hw/i386/pc.c<br>
&gt; +++ b/hw/i386/pc.c<br>
&gt; @@ -1061,7 +1061,6 @@ void pc_memory_init(PCMachineState *pcms,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hwaddr cxl_size =3D MiB;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cxl_base =3D pc_get_cxl_range_start(=
pcms);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 e820_add_entry(cxl_base, cxl_size, E820_R=
ESERVED);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memory_region_init(mr, OBJECT(machin=
e), &quot;cxl_host_reg&quot;, cxl_size);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memory_region_add_subregion(system_m=
emory, cxl_base, mr);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cxl_resv_end =3D cxl_base + cxl_size=
;<br>
&gt; @@ -1077,7 +1076,6 @@ void pc_memory_init(PCMachineState *pcms,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memory_r=
egion_init_io(&amp;fw-&gt;mr, OBJECT(machine), &amp;cfmws_ops, fw,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot=
;cxl-fixed-memory-region&quot;, fw-&gt;size);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memory_r=
egion_add_subregion(system_memory, fw-&gt;base, &amp;fw-&gt;mr);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e820_add_entr=
y(fw-&gt;base, fw-&gt;size, E820_RESERVED);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cxl_fmw_=
base +=3D fw-&gt;size;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cxl_resv=
_end =3D cxl_fmw_base;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; --<br>
&gt; 2.37.3<br>
&gt;<br>
</blockquote></div>

--000000000000ee543705eb502642--

