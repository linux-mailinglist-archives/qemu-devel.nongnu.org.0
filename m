Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFADE4071D9
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 21:26:45 +0200 (CEST)
Received: from localhost ([::1]:52428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOmAf-00039W-0t
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 15:26:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hinkocevar@gmail.com>)
 id 1mOm9H-0002TV-Ou
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 15:25:19 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:41854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hinkocevar@gmail.com>)
 id 1mOm9F-0004qb-Jx
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 15:25:19 -0400
Received: by mail-qk1-x736.google.com with SMTP id bk29so3193906qkb.8
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 12:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hVX+EWP0pYU70ldQO4QZpzaC+MDy2Y91ZSEOVUjh5ww=;
 b=ZQYIsXRabPvanjrGoglYgTThM7uo5oe9nkWU0W4I1iBMOFP93Y5KjWImiULgJvAo/G
 U73uqS8+qXx08vpBQcFV6XtoP/dPBoftplxnmEEverM9O34LFRs0t9IjtKX/OOb26gh6
 gnD8eT7lCUSO7lvABrKYV/vYCBo6lOE1w9mGpH8Gtkc0R4yk9iZHA1MdAltbqEYbPKrW
 rWJa67+B2XZLpX3X+5dmqhfjzi4tdFkYKMXS4LJE4m5ZL81riDacj4Gy2awj+N29A6d5
 /nQQruDJta+bkrnv2T3Om4uul7VUOl97MDEgK1YtL0PEQhNn1SFwEd18Ze22RznCgupa
 KSKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hVX+EWP0pYU70ldQO4QZpzaC+MDy2Y91ZSEOVUjh5ww=;
 b=bkGlJTbO3qch4YlHxA37PmquS4nBPTDT+mr5/Vm/r3YLmvQKtuKArp1KJgflP8isgr
 3hQaMwxdJoEBrBujQKjxHL+IwOG7rams2yek3ONyKxFx8yW/RZytOJZMgS+CG5wLVDFB
 j9tMJUM+9fN/oSZ8dtOsj1U4j8um3FzPMd9SwZKp0gY7icU9F24CxILQ1QoU8lmoy2Gb
 qS6G0KLZ4llPUxJC5qdJFi4GVsGt6Om4OibunJd3j82Ax0x8FeReMoXiyYMbQT6zUEKy
 J5eEUTYaj2H+Kkajmqd90eEFSvsvApz+YMb/+Ve9XJlKnjkN+pOOYWwHm5X53E3mnxJe
 YvmQ==
X-Gm-Message-State: AOAM5336nPv2csM2l7iGdbmW1wOHhamQOseNjJp5PHaSoKc6MqhmmL91
 NsGxGo+UgnnGGSW9YPilfd9mi5oo9ewUJx0VEXM=
X-Google-Smtp-Source: ABdhPJwtHCRwcJ/1nyA8nyOy+0SYaVieXYOpgwEehUUDD0z0O88DtAmDjN2PGOl8j7co7TB1tSMs8dKgNAOajWBqvRo=
X-Received: by 2002:a37:9e55:: with SMTP id h82mr9008756qke.42.1631301916570; 
 Fri, 10 Sep 2021 12:25:16 -0700 (PDT)
MIME-Version: 1.0
References: <CACOP0z-956f0eBdv5wdfqWKT140_mSTW3GwJ1fQ5WEDATB=2Aw@mail.gmail.com>
 <535a03c4-1350-ade3-4596-6ea5498504e0@amsat.org>
In-Reply-To: <535a03c4-1350-ade3-4596-6ea5498504e0@amsat.org>
From: Hinko Kocevar <hinkocevar@gmail.com>
Date: Fri, 10 Sep 2021 21:25:05 +0200
Message-ID: <CACOP0z-qVTH7zqZz3utSmaWYkNiQ5MoPjy2gOJbXw_6DzBdr-Q@mail.gmail.com>
Subject: Re: Adding IO memory region to mipssim
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="0000000000004238ee05cba913a2"
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=hinkocevar@gmail.com; helo=mail-qk1-x736.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--0000000000004238ee05cba913a2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Got it Phil, thank you very much! I need to educate myself on the subject
of TLB and MMU for mips.
//hinko

On Fri, Sep 10, 2021 at 5:30 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
wrote:

> On 9/10/21 3:21 PM, Hinko Kocevar wrote:
> > I'm trying to add an I/O memory region to mipssim machine to emulate a
> > MMIO region used by the u-boot loaded as BIOS image. I can confirm that
> > the machine starts and loads the BIOS, starts execution but hangs due t=
o
> > unhandled IO access as described below.
> >
> > The region should be at 0xB8810000, of size 0x10000.
> >
> > I've added these lines of code to mispsim.c mips_mipssim_init():
> >
> >     my_state *s =3D g_malloc0(sizeof(my_state));
> >     memory_region_init_io(&s->mmio, NULL, &my_ops, s,
> >                          "mips_mipssim.foo", 0x10000);
> >     memory_region_add_subregion(address_space_mem, 0xB8810000LL,
> &s->mmio);
>
> You need to map your device at its physical address, not the virtual
> one.
>
> > All goes well, the machine starts, and I can see the newly added region
> > in qemu monitor info mtree output like so:
> >
> >     00000000b8810000-00000000b881ffff (prio 0, i/o): mips_mipssim.foo
> >
> > With some tracing enabled I see this error:
> >
> >  Invalid access at addr 0x18810104, size 4, region '(null)', reason:
> > rejected
> >
> > I know the u-boot is making request to 0xB8810104 and not 0x18810104. I
>
> U-boot accessed the virtual address which is resolved into the physical
> one (where your device should be mapped).
>
> > also can see 0xB8810104 address being handed to io_writex(), but
> > mr_offset becomes 0x18810104 here:
> >
> >   mr_offset =3D (iotlbentry->addr & TARGET_PAGE_MASK) + addr;
> >
> > What is going on?
> >
> > FWIW, I can place my emulated memory region at 0x18810104, but would
> > like to understand the behavior above.
>
> Yes, this is the correct address to map it.
>
> Maybe this helps:
> https://training.mips.com/basic_mips/PDF/Memory_Map.pdf
>
> Regards,
>
> Phil.
>


--=20
.. the more I see the less I believe.., AE AoR

--0000000000004238ee05cba913a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Got it Phil, thank you very much! I need to educate myself=
 on the subject of TLB and MMU for mips.<div>//hinko</div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 10, 2=
021 at 5:30 PM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org">f4bug@amsat.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">On 9/10/21 3:21 PM, Hinko Kocevar wrote:<br>
&gt; I&#39;m trying to add an I/O memory region to mipssim machine to emula=
te a<br>
&gt; MMIO region used by the u-boot loaded as BIOS image. I can confirm tha=
t<br>
&gt; the machine starts and loads the BIOS, starts execution but hangs due =
to<br>
&gt; unhandled IO access as described below.<br>
&gt; <br>
&gt; The region should be at=C2=A00xB8810000, of size 0x10000.<br>
&gt; <br>
&gt; I&#39;ve added these lines of code to mispsim.c=C2=A0mips_mipssim_init=
():<br>
&gt; <br>
&gt; =C2=A0 =C2=A0 my_state *s =3D g_malloc0(sizeof(my_state));<br>
&gt; =C2=A0 =C2=A0 memory_region_init_io(&amp;s-&gt;mmio, NULL, &amp;my_ops=
, s,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;mips_mipssim.foo&quot;, 0x10000);<br>
&gt; =C2=A0 =C2=A0 memory_region_add_subregion(address_space_mem, 0xB881000=
0LL, &amp;s-&gt;mmio);<br>
<br>
You need to map your device at its physical address, not the virtual<br>
one.<br>
<br>
&gt; All goes well, the machine starts, and I can see the newly added regio=
n<br>
&gt; in qemu monitor info mtree output like so:<br>
&gt; <br>
&gt; =C2=A0 =C2=A0 00000000b8810000-00000000b881ffff (prio 0, i/o): mips_mi=
pssim.foo<br>
&gt; <br>
&gt; With some tracing enabled I see this error:<br>
&gt; <br>
&gt; =C2=A0Invalid access at addr 0x18810104, size 4, region &#39;(null)&#3=
9;, reason:<br>
&gt; rejected<br>
&gt; <br>
&gt; I know the u-boot is making request to 0xB8810104 and not 0x18810104. =
I<br>
<br>
U-boot accessed the virtual address which is resolved into the physical<br>
one (where your device should be mapped).<br>
<br>
&gt; also can see 0xB8810104 address being handed to=C2=A0io_writex(), but<=
br>
&gt; mr_offset becomes 0x18810104 here:<br>
&gt; <br>
&gt; =C2=A0=C2=A0mr_offset =3D (iotlbentry-&gt;addr &amp; TARGET_PAGE_MASK)=
 + addr;<br>
&gt; <br>
&gt; What is going on?<br>
&gt; <br>
&gt; FWIW, I can place my emulated memory region at 0x18810104, but would<b=
r>
&gt; like to understand the behavior above.<br>
<br>
Yes, this is the correct address to map it.<br>
<br>
Maybe this helps:<br>
<a href=3D"https://training.mips.com/basic_mips/PDF/Memory_Map.pdf" rel=3D"=
noreferrer" target=3D"_blank">https://training.mips.com/basic_mips/PDF/Memo=
ry_Map.pdf</a><br>
<br>
Regards,<br>
<br>
Phil.<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">.. the more I see the less I believe.., AE AoR</=
div>

--0000000000004238ee05cba913a2--

