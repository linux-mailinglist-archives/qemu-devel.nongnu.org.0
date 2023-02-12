Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 237B56935FA
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 05:13:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pR3iU-0001D1-4n; Sat, 11 Feb 2023 23:11:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pR3iR-0001CY-SP
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 23:11:51 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pR3iP-0003IU-LO
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 23:11:51 -0500
Received: by mail-ed1-x52c.google.com with SMTP id s11so1167750edd.10
 for <qemu-devel@nongnu.org>; Sat, 11 Feb 2023 20:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wlY6alUIjjWyAkD1Tp0mWEEH/vu2Uh5xd5p8vIAGr+8=;
 b=phAyZr/xKw/DzlYz3dF8ojGyymYv0cJHmij4l+EKgMEhZV9ghVJ/quxkz173dgf+K+
 /Yb3oOic2oFQa0wYgtbu/8H6piqhymkIqFOWj/bKAz3R2JsggMV2KkqffWBzPDFY4jTk
 0J0nNXcXcwec8SCUwvh/1R2eOt6CXGd0obE+a+MqnDuyjgH9df0i2WlsTs9Igfv2oNmr
 5wylhCVol0eBm9eRaTVXZuMjAbAVuUpSRacM5dEnc5E7mvRjIabE5/8KZty2ixcgZcJi
 uwuOGmZZu3nsJfgMtC00XKhvT8zbN2u2aFbkMIB+Xx6k9Goh4wPHa0XLTEKiHY/eQHMd
 DN1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wlY6alUIjjWyAkD1Tp0mWEEH/vu2Uh5xd5p8vIAGr+8=;
 b=5fZKYbNh6C2CsBTEJ8HbOAsZQ6RJ4RqY723pzZqLXRuEqDT9KTnbt7ew/EDh1MKCOR
 i4jV9wVioIGqkzuWplmk9yWZ/t3jY7KtoP/eEm3aiBTUx5l5xq7PHAdesOBngjuFBsS6
 o2dBPiKyhYP41dH/51J2QFMoIdYGEAjca9A+Sqfk+BgYKKLD9fkKosW7c2e3xL9yrxBn
 mJzOUgrxAPsmZQFdmPbK1ySQ2gHFPWY07JxWOET5eh9C/r1WC/V7tnkyx4/IQlaEEsxn
 Hjv/VrSM+10ZZ4zLTpldaPJK92zkipBWm+7c4EhbbSBIem8pzNY7rmWhAb/CDd2bSVUm
 W7nA==
X-Gm-Message-State: AO0yUKXV0G0S7YN9OBkSUbk3B/2hWBP1kQpM8YJaa7/L1O7cm0YrmMnH
 z4afSLAoAXujXDrPAC7W0/bQy5RWlAkh3Gx0U09SoA==
X-Google-Smtp-Source: AK7set8FtWSctk0qtkrE1tZsSx8UMdRmXuyacHiNF36zPks0on9zMBf2sx1M8DY1CKTZqlX0fcQSwFBsnnTdrcJVric=
X-Received: by 2002:a50:d51d:0:b0:4ac:b74b:a6a3 with SMTP id
 u29-20020a50d51d000000b004acb74ba6a3mr1273387edi.0.1676175107699; Sat, 11 Feb
 2023 20:11:47 -0800 (PST)
MIME-Version: 1.0
References: <20230210231829.39476-1-imp@bsdimp.com>
 <20230210231829.39476-5-imp@bsdimp.com>
 <f7a5c2d4-f8d2-9dc6-d34f-a12154dbc87e@linaro.org>
In-Reply-To: <f7a5c2d4-f8d2-9dc6-d34f-a12154dbc87e@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Sat, 11 Feb 2023 21:11:36 -0700
Message-ID: <CANCZdfpHM8YKUqhiVx5re1c8GU-hHbiEXREz9HrmWtvOAiUUOA@mail.gmail.com>
Subject: Re: [PATCH 4/9] bsd-user: Two helper routines oidfmt and sysctl_oldcvt
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Kyle Evans <kevans@freebsd.org>, f4bug@amsat.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Stacey Son <sson@freebsd.org>,
 Sean Bruno <sbruno@freebsd.org>, Juergen Lock <nox@jelal.kn-bremen.de>,
 Raphael Kubo da Costa <rakuco@freebsd.org>
Content-Type: multipart/alternative; boundary="000000000000e057d705f478ed89"
Received-SPF: none client-ip=2a00:1450:4864:20::52c;
 envelope-from=wlosh@bsdimp.com; helo=mail-ed1-x52c.google.com
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

--000000000000e057d705f478ed89
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 11, 2023 at 3:17 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 2/10/23 13:18, Warner Losh wrote:
> > +static int sysctl_oldcvt(void *holdp, size_t *holdlen, uint32_t kind)
> > +{
> > +    switch (kind & CTLTYPE) {
> > +    case CTLTYPE_INT:
> > +    case CTLTYPE_UINT:
> > +        *(uint32_t *)holdp = tswap32(*(uint32_t *)holdp);
> > +        break;
> > +
> > +#ifdef TARGET_ABI32
> > +    case CTLTYPE_LONG:
> > +    case CTLTYPE_ULONG:
> > +        /*
> > +         * If the sysctl has a type of long/ulong but seems to be
> bigger than
> > +         * these data types, its probably an array.  Double check that
> its
> > +         * evenly divisible by the size of long and convert holdp to a
> series of
> > +         * 32bit elements instead, adjusting holdlen to the new size.
> > +         */
> > +        if ((*holdlen > sizeof(abi_ulong)) &&
> > +            ((*holdlen % sizeof(abi_ulong)) == 0)) {
> > +            int array_size = *holdlen / sizeof(long);
> > +            int i;
> > +            if (holdp) {
> > +                for (i = 0; i < array_size; i++) {
> > +                    ((uint32_t *)holdp)[i] = tswap32(((long
> *)holdp)[i]);
> > +                }
> > +                *holdlen = array_size * sizeof(abi_ulong);
> > +            } else {
> > +                *holdlen = sizeof(abi_ulong);
> > +            }
> > +        } else {
> > +            *(uint32_t *)holdp = tswap32(*(long *)holdp);
> > +            *holdlen = sizeof(uint32_t);
>
> This is totally confusing.  Why would it ever be an array?
> Why is this section the only place we ever assign back into holdlen?
>
> Can you point to anything similar in the freebsd source?  The whole thing
> is pretty hard
> to track, starting from sys/kern/kern_sysctl.c.
>

I need to understand this... I've been looking for where we export an
array, and we just don't.

I've asked the original author who said it had something to do with
different size longs. I'll
look into that a bit and get back to this.

I think we assign back into holdlen in a weird attempt adjust for the
difference of LONG between
the two. But I'm not sure that that's where we should assign.

Warner

--000000000000e057d705f478ed89
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Feb 11, 2023 at 3:17 PM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 2/10/23 13:18, Warner Losh wrote:<br>
&gt; +static int sysctl_oldcvt(void *holdp, size_t *holdlen, uint32_t kind)=
<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 switch (kind &amp; CTLTYPE) {<br>
&gt; +=C2=A0 =C2=A0 case CTLTYPE_INT:<br>
&gt; +=C2=A0 =C2=A0 case CTLTYPE_UINT:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *(uint32_t *)holdp =3D tswap32(*(uint32_t=
 *)holdp);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +<br>
&gt; +#ifdef TARGET_ABI32<br>
&gt; +=C2=A0 =C2=A0 case CTLTYPE_LONG:<br>
&gt; +=C2=A0 =C2=A0 case CTLTYPE_ULONG:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* If the sysctl has a type of long/=
ulong but seems to be bigger than<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* these data types, its probably an=
 array.=C2=A0 Double check that its<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* evenly divisible by the size of l=
ong and convert holdp to a series of<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* 32bit elements instead, adjusting=
 holdlen to the new size.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((*holdlen &gt; sizeof(abi_ulong)) &am=
p;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((*holdlen % sizeof(abi_ulo=
ng)) =3D=3D 0)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int array_size =3D *holdlen=
 / sizeof(long);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int i;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (holdp) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0;=
 i &lt; array_size; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ((uint32_t *)holdp)[i] =3D tswap32(((long *)holdp)[i]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *holdlen =3D =
array_size * sizeof(abi_ulong);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *holdlen =3D =
sizeof(abi_ulong);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *(uint32_t *)holdp =3D tswa=
p32(*(long *)holdp);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *holdlen =3D sizeof(uint32_=
t);<br>
<br>
This is totally confusing.=C2=A0 Why would it ever be an array?<br>
Why is this section the only place we ever assign back into holdlen?<br>
<br>
Can you point to anything similar in the freebsd source?=C2=A0 The whole th=
ing is pretty hard <br>
to track, starting from sys/kern/kern_sysctl.c.<br></blockquote><div><br></=
div><div>I need to understand this... I&#39;ve been looking for where we ex=
port an array, and we just don&#39;t.</div><div><br></div><div>I&#39;ve ask=
ed the original author who said it had something to do with different size =
longs. I&#39;ll</div><div>look into that a bit and get back to this.</div><=
div><br></div><div>I think we assign back into holdlen=C2=A0in a weird atte=
mpt adjust for the difference of LONG between</div><div>the two. But I&#39;=
m not sure that that&#39;s where we should assign.</div><div><br></div><div=
>Warner=C2=A0</div></div></div>

--000000000000e057d705f478ed89--

