Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1F469354E
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 00:41:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQzTp-0002bg-MJ; Sat, 11 Feb 2023 18:40:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pQzTm-0002aY-UO
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 18:40:26 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pQzTj-0005gM-Ex
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 18:40:26 -0500
Received: by mail-ej1-x633.google.com with SMTP id rp23so23996421ejb.7
 for <qemu-devel@nongnu.org>; Sat, 11 Feb 2023 15:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YIy/xQV5rHbgNqRytwIJtxdGi3UTk83pxOAn06pRMRs=;
 b=bfwDIObvg9O2HKQsIrJjOsCpVysmGBHb5FzrRbvTD/72riJvUMSUvupJgjFADq15Sm
 WDpuz4v4V7F8mPKljHclfUxxcCzdxX45H1l5g61jY+sk+5RdwcVDFhh0CPDkGRbkwWl+
 BHZ/52QcvIbR3T4sW4XxDsOo+Cz+Nu4Pjb1D0ml+mU/Yfu8dxCEUHfkwZHNn3Ig4IMNP
 yqbj4OcED2NZYr6Uzv4xqRzkHtte433rrijq585iw49vOeQtphgm3QEiB33QqTWwnoKL
 MpsLgd9K2JaO47EATojWQu7sGg7dK3TrOVFj79inOeDSdn1IW3CAJOVjDlLg7X9DLoSr
 8mog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YIy/xQV5rHbgNqRytwIJtxdGi3UTk83pxOAn06pRMRs=;
 b=mLT3JvKXy/81ZewsI0OwL8d99mjxh2Ti6VvcoavrCN8IHVeUJHZgimfNygE/pEukqt
 fwCkXAE6Et9s/w4Wda7XFYza9HBaXt2tt7tiFgl6lbDssKwDYqjGvcfneFXtZCY01rcj
 G+2hsqElUm2ZMPPs5toTrm+oGM9uVp1gTLSBEbdU8e5Q4OxP1D6kQ52xNWrq0BELomEV
 nX144mbG0xMwE/wjJp8K8qQYxdkm8uF/I3ZghytzTKERDI2VeqzV33/zOauWKzDzZa02
 OMXG+R8CncY0Mtys3/Et0Us2U23XgqpeWpC+xOqmKIzQ7LZRyrIvLDFQ2g8/cfQSAvtN
 hJvA==
X-Gm-Message-State: AO0yUKUH4EFFkkhHVKUW3PYvj5NFo5UjK9eA5fwCHuG/k3Jr1Dq6R88s
 ssIF67tZVKpp96Gj4vo+oTgD0uge2qeIWfhu3Pju8A==
X-Google-Smtp-Source: AK7set8l4Q15Zscx8weEig3HebVSi3jOvSj6L8hOt7aM86TiRjLSMsUG+HoFRCoBfij1PXjmymkKDDU23G4rIyD/Heg=
X-Received: by 2002:a17:906:3d69:b0:877:e539:810b with SMTP id
 r9-20020a1709063d6900b00877e539810bmr2730712ejf.2.1676158821175; Sat, 11 Feb
 2023 15:40:21 -0800 (PST)
MIME-Version: 1.0
References: <20230210231829.39476-1-imp@bsdimp.com>
 <20230210231829.39476-7-imp@bsdimp.com>
 <b56a7205-0c22-16aa-f73b-267576b9950e@linaro.org>
In-Reply-To: <b56a7205-0c22-16aa-f73b-267576b9950e@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Sat, 11 Feb 2023 16:40:13 -0700
Message-ID: <CANCZdfp394rACvjVDdEao626pSdin1yPvYHW9sf0mNbVwoyeVg@mail.gmail.com>
Subject: Re: [PATCH 6/9] bsd-user: common routine do_freebsd_sysctl_oid for
 all sysctl variants
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Kyle Evans <kevans@freebsd.org>, f4bug@amsat.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Juergen Lock <nox@jelal.kn-bremen.de>, 
 Stacey Son <sson@freebsd.org>
Content-Type: multipart/alternative; boundary="0000000000001fa6d005f4752316"
Received-SPF: none client-ip=2a00:1450:4864:20::633;
 envelope-from=wlosh@bsdimp.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

--0000000000001fa6d005f4752316
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 11, 2023 at 3:56 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 2/10/23 13:18, Warner Losh wrote:
> > +    /* Handle some arch/emulator dependent sysctl()'s here. */
> > +    switch (snamep[0]) {
> > +#if defined(TARGET_PPC) || defined(TARGET_PPC64)
> > +    case CTL_MACHDEP:
> > +        switch (snamep[1]) {
> > +        case 1:    /* CPU_CACHELINE */
> > +            holdlen = sizeof(uint32_t);
> > +            (*(uint32_t *)holdp) = tswap32(env->dcache_line_size);
> > +            ret = 0;
> > +            goto out;
> > +        }
> > +        break;
> > +#endif
>
> abi_int instead of uint32_t.
>

Indeed. Thanks! Turns out, though, there's no upstream support for PPC for
bsd-user, so I'll drop this hunk of the patch... I thought I'd done it
already when
preparing things...


> > +    case CTL_HW:
> > +        switch (snamep[1]) {
> > +        case HW_MACHINE:
> > +            holdlen = sizeof(TARGET_HW_MACHINE);
> > +            if (holdp) {
> > +                strlcpy(holdp, TARGET_HW_MACHINE, oldlen);
> > +            }
>
> What's the semantics here when oldlen < sizeof(literal)?
> I was expecting something like sysctl_old_kernel.
> It would probably be good to create a number of small helper functions per
> type.
>
> > +#ifdef ARM_FEATURE_VFP /* XXX FIXME XXX */
>
> This define has been removed, so this part is dead,
>

Yup. I added it as a hack... I kept this in because I knew I'd find the
right way to
do this :)


> > +                if (env->features & ((1ULL << ARM_FEATURE_VFP)|
> > +                                     (1ULL << ARM_FEATURE_VFP3)|
> > +                                     (1ULL << ARM_FEATURE_VFP4)))
> > +                    *(int32_t *)holdp = 1;
> > +                else
> > +                    *(int32_t *)holdp = 0;
> > +#else
> > +                *(int32_t *)holdp = 1;
>
> and this is not right.
>
> You're looking for
>
>      ARMCPU *cpu = env_archcpu(env);
>      *(abi_int *)holdp = cpu_isar_feature(aa32_vfp, cpu);
>

Yes. That looks right to me... I was having trouble finding it and the
merge it came
in on was bigger than normal, and I put the above kludge in to get through
it and
then never followed up...


> > +#if TARGET_ABI_BITS != HOST_LONG_BITS
> > +        case HW_PHYSMEM:
> > +        case HW_USERMEM:
> > +        case HW_REALMEM:
> > +            holdlen = sizeof(abi_ulong);
> > +            ret = 0;
> > +
> > +            if (oldlen) {
> > +                int mib[2] = {snamep[0], snamep[1]};
> > +                unsigned long lvalue;
> > +                size_t len = sizeof(lvalue);
> > +
> > +                if (sysctl(mib, 2, &lvalue, &len, NULL, 0) == -1) {
> > +                    ret = -1;
> > +                } else {
> > +                    if (((unsigned long)maxmem) < lvalue) {
>
>
> Where is maxmem defined?
> Why are these numbers only special-cased for TARGET_ABI_BITS !=
> HOST_LONG_BITS?
>

maxmem is defined earlier in this patch:

+#if TARGET_ABI_BITS != HOST_LONG_BITS
+    const abi_ulong maxmem = -0x100c000;

but I'm not at all sure how that number was arrived at...
It's a little less than ULONG_MAX is all I can say for
sure.

As to why it's a special case only sometimes, I believe that it's there for
32-bit
targets running on 64-bit hosts so that we return a sane amount of memory
because
64-bit hosts can have > 4GB of ram... I'm not 100% sure of this, and it
would
likely be wrong for 32-bit host and 64-bit target, but that case isn't
supported at
all by the bsd-user project (though in the past it may have been, we no
longer
built even 32 on 32 target/host emulation).


> > +            static int oid_hw_pagesizes;
> > +
> > +            if (!oid_hw_availpages) {
> > +                int real_oid[CTL_MAXNAME + 2];
> > +                size_t len = sizeof(real_oid) / sizeof(int);
> > +
> > +                if (sysctlnametomib("hw.availpages", real_oid, &len) >=
> 0) {
> > +                    oid_hw_availpages = real_oid[1];
> > +                }
> > +            }
> > +            if (!oid_hw_pagesizes) {
> > +                int real_oid[CTL_MAXNAME + 2];
> > +                size_t len = sizeof(real_oid) / sizeof(int);
> > +
> > +                if (sysctlnametomib("hw.pagesizes", real_oid, &len) >=
> 0) {
> > +                    oid_hw_pagesizes = real_oid[1];
> > +                }
> > +            }
>
> Host pagesizes are not relevant to the guest.
>

Yes. I noticed after I submitted this that I wondered if I should be using
the
host's notion, or the softmmu's notion of page size... But it's clear from
the
other comments below, that it should be TARGET_PAGE_SIZE for all of
these.

> +
> > +            if (oid_hw_availpages && snamep[1] == oid_hw_availpages) {
> > +                long lvalue;
> > +                size_t len = sizeof(lvalue);
> > +
> > +                if (sysctlbyname("hw.availpages", &lvalue, &len, NULL,
> 0) == -1) {
> > +                    ret = -1;
> > +                } else {
> > +                    if (oldlen) {
> > +#if TARGET_ABI_BITS != HOST_LONG_BITS
> > +                        abi_ulong maxpages = maxmem /
> (abi_ulong)getpagesize();
>
> Again with maxmem...
>
> > +                        if (((unsigned long)maxpages) < lvalue) {
> > +                            lvalue = maxpages;
> > +                        }
> > +#endif
> > +                        (*(abi_ulong *)holdp) =
> tswapal((abi_ulong)lvalue);
>
> I would expect a 64-bit guest to rescale the result for TARGET_PAGE_SIZE
> != getpagesize().
>

I would too. I suspect that the reason this is here like this is that an
attempt
was being made to handle it, but since TARGET_PAGE_SIZE == getpagesize() on
all hosts / target pairs until very recently (with the 16k arm64 kernels),
this was
a latent bug in the code and I should fix it before my next submission. And
aarch64
hosts for this are quite rare (most people use bsd-user on amd64 hosts to
build for
all the other architectures).


> > +                    }
> > +                    holdlen = sizeof(abi_ulong);
> > +                    ret = 0;
> > +                }
> > +                goto out;
> > +            }
> > +
> > +            if (oid_hw_pagesizes && snamep[1] == oid_hw_pagesizes) {
> > +                if (oldlen) {
> > +                    (*(abi_ulong *)holdp) =
> tswapal((abi_ulong)getpagesize());
>
> Indeed, this needs TARGET_PAGE_SIZE.
>

That makes things somewhat simpler for rearranging here...


> > diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
> > index 0ceecfb6dfa..e24a8cfcfb1 100644
> > --- a/bsd-user/qemu.h
> > +++ b/bsd-user/qemu.h
> > @@ -252,6 +252,11 @@ bool is_error(abi_long ret);
> >   int host_to_target_errno(int err);
> >
> >   /* os-sys.c */
> > +abi_long do_freebsd_sysctl(CPUArchState *env, abi_ulong namep, int32_t
> namelen,
> > +        abi_ulong oldp, abi_ulong oldlenp, abi_ulong newp, abi_ulong
> newlen);
> > +abi_long do_freebsd_sysctlbyname(CPUArchState *env, abi_ulong namep,
> > +        int32_t namelen, abi_ulong oldp, abi_ulong oldlenp, abi_ulong
> newp,
> > +        abi_ulong newlen);
>
> These belong to different patches.
>

Oh yes. I'll take care of that... They were, but then they weren't and then
i thought I'd
fixed that (a bit of a rebase misadventure when re-ordering patches
occurred and
I thought I'd fixed it entirely...)

Thanks for helping me clear a few things up in the code that my
understanding was
hazy, but I wasn't sure where it was hazy and it turns out these comments
clear the haze
for me.

Warner


> r~
>
>

--0000000000001fa6d005f4752316
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Feb 11, 2023 at 3:56 PM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 2/10/23 13:18, Warner Losh wrote:<br>
&gt; +=C2=A0 =C2=A0 /* Handle some arch/emulator dependent sysctl()&#39;s h=
ere. */<br>
&gt; +=C2=A0 =C2=A0 switch (snamep[0]) {<br>
&gt; +#if defined(TARGET_PPC) || defined(TARGET_PPC64)<br>
&gt; +=C2=A0 =C2=A0 case CTL_MACHDEP:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (snamep[1]) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 1:=C2=A0 =C2=A0 /* CPU_CACHELINE */<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 holdlen =3D sizeof(uint32_t=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (*(uint32_t *)holdp) =3D ts=
wap32(env-&gt;dcache_line_size);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +#endif<br>
<br>
abi_int instead of uint32_t.<br></blockquote><div><br></div><div>Indeed. Th=
anks! Turns out, though, there&#39;s no upstream support for PPC for</div><=
div>bsd-user, so I&#39;ll drop this hunk of the patch... I thought I&#39;d =
done it already when</div><div>preparing things...<br></div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 case CTL_HW:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (snamep[1]) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case HW_MACHINE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 holdlen =3D sizeof(TARGET_H=
W_MACHINE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (holdp) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strlcpy(holdp=
, TARGET_HW_MACHINE, oldlen);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
What&#39;s the semantics here when oldlen &lt; sizeof(literal)?<br>
I was expecting something like sysctl_old_kernel.<br>
It would probably be good to create a number of small helper functions per =
type.<br>
<br>
&gt; +#ifdef ARM_FEATURE_VFP /* XXX FIXME XXX */<br>
<br>
This define has been removed, so this part is dead,<br></blockquote><div><b=
r></div><div>Yup. I added it as a hack... I kept this in because I knew I&#=
39;d find the right way to</div><div>do this :)<br></div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (env-&gt;f=
eatures &amp; ((1ULL &lt;&lt; ARM_FEATURE_VFP)|<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1ULL &lt;&l=
t; ARM_FEATURE_VFP3)|<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1ULL &lt;&l=
t; ARM_FEATURE_VFP4)))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 *(int32_t *)holdp =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 *(int32_t *)holdp =3D 0;<br>
&gt; +#else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *(int32_t *)h=
oldp =3D 1;<br>
<br>
and this is not right.<br>
<br>
You&#39;re looking for<br>
<br>
=C2=A0 =C2=A0 =C2=A0ARMCPU *cpu =3D env_archcpu(env);<br>
=C2=A0 =C2=A0 =C2=A0*(abi_int *)holdp =3D cpu_isar_feature(aa32_vfp, cpu);<=
br></blockquote><div><br></div><div>Yes. That looks right to me... I was ha=
ving trouble finding it and the merge it came</div><div>in on was bigger th=
an normal, and I put the above kludge in to get through it and</div><div>th=
en never followed up...<br></div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
&gt; +#if TARGET_ABI_BITS !=3D HOST_LONG_BITS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case HW_PHYSMEM:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case HW_USERMEM:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case HW_REALMEM:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 holdlen =3D sizeof(abi_ulon=
g);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (oldlen) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int mib[2] =
=3D {snamep[0], snamep[1]};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long=
 lvalue;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t len =
=3D sizeof(lvalue);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sysctl(mi=
b, 2, &amp;lvalue, &amp;len, NULL, 0) =3D=3D -1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ret =3D -1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 if (((unsigned long)maxmem) &lt; lvalue) {<br>
<br>
<br>
Where is maxmem defined?<br>
Why are these numbers only special-cased for TARGET_ABI_BITS !=3D HOST_LONG=
_BITS?<br></blockquote><div><br></div><div>maxmem is defined earlier in thi=
s patch:</div><div><br></div><div>+#if TARGET_ABI_BITS !=3D HOST_LONG_BITS<=
br>
+=C2=A0 =C2=A0 const abi_ulong maxmem =3D -0x100c000;<br>
</div><div><br></div><div>but I&#39;m not at all sure how that number was a=
rrived at...</div><div>It&#39;s a little less than ULONG_MAX is all I can s=
ay for</div><div>sure.</div><div><br></div><div>As to why it&#39;s a specia=
l case only sometimes, I believe that it&#39;s there for 32-bit</div><div>t=
argets running on 64-bit hosts so that we return a sane amount of memory be=
cause</div><div>64-bit hosts can have &gt; 4GB of ram... I&#39;m not 100% s=
ure of this, and it would</div><div>likely be wrong for 32-bit host and 64-=
bit target, but that case isn&#39;t supported at</div><div>all by the bsd-u=
ser project (though in the past it may have been, we no longer</div><div>bu=
ilt even 32 on 32 target/host emulation).<br></div><div>=C2=A0<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 static int oid_hw_pagesizes=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!oid_hw_availpages) {<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int real_oid[=
CTL_MAXNAME + 2];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t len =
=3D sizeof(real_oid) / sizeof(int);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sysctlnam=
etomib(&quot;hw.availpages&quot;, real_oid, &amp;len) &gt;=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 oid_hw_availpages =3D real_oid[1];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!oid_hw_pagesizes) {<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int real_oid[=
CTL_MAXNAME + 2];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t len =
=3D sizeof(real_oid) / sizeof(int);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sysctlnam=
etomib(&quot;hw.pagesizes&quot;, real_oid, &amp;len) &gt;=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 oid_hw_pagesizes =3D real_oid[1];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
Host pagesizes are not relevant to the guest.<br></blockquote><div><br></di=
v><div>Yes. I noticed after I submitted this that I wondered if I should be=
 using the</div><div>host&#39;s notion, or the softmmu&#39;s notion of page=
 size... But it&#39;s clear from the</div><div>other comments below, that i=
t should be TARGET_PAGE_SIZE for all of</div><div>these.<br></div><div><br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (oid_hw_availpages &amp;=
&amp; snamep[1] =3D=3D oid_hw_availpages) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 long lvalue;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t len =
=3D sizeof(lvalue);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sysctlbyn=
ame(&quot;hw.availpages&quot;, &amp;lvalue, &amp;len, NULL, 0) =3D=3D -1) {=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ret =3D -1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 if (oldlen) {<br>
&gt; +#if TARGET_ABI_BITS !=3D HOST_LONG_BITS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 abi_ulong maxpages =3D maxmem / (abi_ulong)getpagesize();<br=
>
<br>
Again with maxmem...<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 if (((unsigned long)maxpages) &lt; lvalue) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lvalue =3D maxpages;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 }<br>
&gt; +#endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 (*(abi_ulong *)holdp) =3D tswapal((abi_ulong)lvalue);<br>
<br>
I would expect a 64-bit guest to rescale the result for TARGET_PAGE_SIZE !=
=3D getpagesize().<br></blockquote><div><br></div><div>I would too. I suspe=
ct that the reason this is here like this is that an attempt</div><div>was =
being made to handle it, but since TARGET_PAGE_SIZE =3D=3D getpagesize() on=
</div><div>all hosts / target pairs until very recently (with the 16k arm64=
 kernels), this was</div><div>a latent bug in the code and I should fix it =
before my next submission. And aarch64</div><div>hosts for this are quite r=
are (most people use bsd-user on amd64 hosts to build for</div><div>all the=
 other architectures).<br></div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 holdlen =3D sizeof(abi_ulong);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ret =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (oid_hw_pagesizes &amp;&=
amp; snamep[1] =3D=3D oid_hw_pagesizes) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (oldlen) {=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 (*(abi_ulong *)holdp) =3D tswapal((abi_ulong)getpagesize());<br>
<br>
Indeed, this needs TARGET_PAGE_SIZE.<br></blockquote><div><br></div><div>Th=
at makes things somewhat simpler for rearranging here...<br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h<br>
&gt; index 0ceecfb6dfa..e24a8cfcfb1 100644<br>
&gt; --- a/bsd-user/qemu.h<br>
&gt; +++ b/bsd-user/qemu.h<br>
&gt; @@ -252,6 +252,11 @@ bool is_error(abi_long ret);<br>
&gt;=C2=A0 =C2=A0int host_to_target_errno(int err);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0/* os-sys.c */<br>
&gt; +abi_long do_freebsd_sysctl(CPUArchState *env, abi_ulong namep, int32_=
t namelen,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 abi_ulong oldp, abi_ulong oldlenp, abi_ul=
ong newp, abi_ulong newlen);<br>
&gt; +abi_long do_freebsd_sysctlbyname(CPUArchState *env, abi_ulong namep,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 int32_t namelen, abi_ulong oldp, abi_ulon=
g oldlenp, abi_ulong newp,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 abi_ulong newlen);<br>
<br>
These belong to different patches.<br></blockquote><div><br></div><div>Oh y=
es. I&#39;ll take care of that... They were, but then they weren&#39;t and =
then i thought I&#39;d</div><div>fixed that (a bit of a rebase misadventure=
 when re-ordering patches occurred and <br></div><div>I thought I&#39;d fix=
ed it entirely...)</div><div><br></div><div>Thanks for helping me clear a f=
ew things up in the code that my understanding was</div><div>hazy, but I wa=
sn&#39;t sure where it was hazy and it turns out these comments clear the h=
aze</div><div>for me.<br></div><div><br></div><div>Warner<br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
r~<br>
<br>
</blockquote></div></div>

--0000000000001fa6d005f4752316--

