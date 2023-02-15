Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED632697615
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 06:58:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSAoB-0005Mu-7x; Wed, 15 Feb 2023 00:58:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pSAnz-0005Me-DH
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 00:58:12 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pSAnw-0002UB-PV
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 00:58:10 -0500
Received: by mail-ej1-x634.google.com with SMTP id sa10so45473363ejc.9
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 21:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=m/MaMOeiwXtECOJ0C1IM2UXIJum+2jNaZ508Kj4J7Z0=;
 b=AWKQkLjUeLDwDNb/RIyKKy8YnrC7GaWdRKnQY+HO0/9ZsGSGhPtmEsC5UkoA2azz0z
 HUYXMlO5EIJVCcXYo8xgEXIXHzFuGpBWp7//3CRJjLNQwfu2KOQpl1ziWstxwzS3fUaK
 /D5p6Cog1s4wYDfX4hiQBSORApUYWsAa7YDig8qHe8gOjdON/9t68v1wFjieLndyhfgH
 ZP1umm8GRHLvhVRTtQ16kx9zy5H4xZXJsz0ygi1MQUjhgLGP7AjmClGcQhcSG7a7uYBE
 09mfT5Gnl0DnsZDEhzVokoZF6GvZb1iPlh0XqtKrCMKuMaAlH/90f4boHNOTL4cVk808
 HkAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m/MaMOeiwXtECOJ0C1IM2UXIJum+2jNaZ508Kj4J7Z0=;
 b=LZa708KWkZxhRXkDPihyfE08f/oK5Wdh/rMClMwz9KOQoAywAKO7/69jz2JNSeYDkB
 r6szbX1OHWw3xw4bxPZs86ST65qmOZ71EYmnxZCMp9LKIC/MtPLLiGspfr0eiEAXrerO
 6wobDeOkg/wErb4SdfAI6w4BW7vY8mgedCZ0djD1M2yFiuxWMmgFfUURDinmkwDpHllE
 AaKUCTPIkdgOnNnrl++rXmg87QXrbA1OxKN6/bc4aO4iorX88pyC/gPSG+1PMIMYbk5b
 6WDjZElol++/athUEqkBN2UvEJ2bXLIYGuwtej8s7oQUWwVEshZmv5wgeTNC07157/Qr
 cSTg==
X-Gm-Message-State: AO0yUKVgUABN733FTSObkmv8ojyjC4a6SFQJYEl2oNBeCZDAPx1gLN0Y
 AXWdx3vzQKw5GTqf+eqbbnUrTKaPPfLkDp1L62Ouug==
X-Google-Smtp-Source: AK7set8W7ih41rSGGKrWM5Ws5CwuNufo+HRWv7ZFCrEeawzhG6zsjinpWR06R4J6h+Q+GH9RmLNVkEt+TPu2LXemyMk=
X-Received: by 2002:a17:907:9949:b0:88d:ba79:4310 with SMTP id
 kl9-20020a170907994900b0088dba794310mr1298335ejc.0.1676440686205; Tue, 14 Feb
 2023 21:58:06 -0800 (PST)
MIME-Version: 1.0
References: <20230214002757.99240-1-imp@bsdimp.com>
 <20230214002757.99240-7-imp@bsdimp.com>
 <58c12d92-a371-deca-d320-285871ed6c03@linaro.org>
In-Reply-To: <58c12d92-a371-deca-d320-285871ed6c03@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 14 Feb 2023 22:58:07 -0700
Message-ID: <CANCZdfoxFN46R4hmh3ZadVtiyhrk5vQsOc4LaktQAG-bYRLYgA@mail.gmail.com>
Subject: Re: [PATCH v2 06/12] bsd-user: Helper routines h2t_old_sysctl
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, kevans@freebsd.org, f4bug@amsat.org, 
 Thomas Huth <thuth@redhat.com>, Sean Bruno <sbruno@freebsd.org>, 
 Juergen Lock <nox@jelal.kn-bremen.de>,
 Raphael Kubo da Costa <rakuco@freebsd.org>, Stacey Son <sson@freebsd.org>
Content-Type: multipart/alternative; boundary="00000000000096affc05f4b6c3ce"
Received-SPF: none client-ip=2a00:1450:4864:20::634;
 envelope-from=wlosh@bsdimp.com; helo=mail-ej1-x634.google.com
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

--00000000000096affc05f4b6c3ce
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 14, 2023 at 2:16 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 2/13/23 14:27, Warner Losh wrote:
> > +/*
> > + * Convert the old value from host to target.
>
> host vs guest is clearer language; "target" gets overloaded, even though
> still present in
> the code base.
>

OK. Will do. We have that all over the place upstream... I'll start there
too...


>
> > + *
> > + * For LONG and ULONG on ABI32, we need to 'down convert' the 8 byte
> quantities
> > + * to 4 bytes. The caller setup a buffer in host memory to get this
> data from
> > + * the kernel and pass it to us. We do the down conversion and adjust
> the length
> > + * so the caller knows what to write as the returned length into the
> target when
> > + * it copies the down converted values into the target.
> > + *
> > + * For normal integral types, we just need to byte swap. No size
> changes.
> > + *
> > + * For strings and node data, there's no conversion needed.
> > + *
> > + * For opaque data, per sysctl OID converts take care of it.
> > + */
> > +static void G_GNUC_UNUSED h2t_old_sysctl(void *holdp, size_t *holdlen,
> uint32_t kind)
>
> h2g.
>

OK.


> > +    /*
> > +     * hlen == 0 for CTLTYPE_STRING and CTLTYPE_NODE, which need no
> conversion
> > +     * as well as CTLTYPE_OPAQUE, which needs special converters.
> > +     */
> > +    if (hlen == 0) {
> > +        return;
> > +    }
> > +
> > +    while (len < *holdlen) {
> > +        if (hlen == tlen) {
> > +            switch (hlen) {
> > +            case 1:
> > +                /* Nothing needed: no byteswapping and assigning in
> place */
> > +                break;
> > +            case 2:
> > +                *(uint16_t *)tp = tswap16(*(uint16_t *)hp);
> > +                break;
> > +            case 4:
> > +                *(uint32_t *)tp = tswap32(*(uint32_t *)hp);
> > +                break;
> > +            case 8:
> > +                *(uint64_t *)tp = tswap64(*(uint64_t *)hp);
> > +                break;
> > +            }
>
> default: g_assert_not_reached().
>

Ah!  I need that in several places... Thanks.


> > +        }
> > +#ifdef TARGET_ABI32
> > +        else {
> > +            /*
> > +             * Saturating assignment for the only two types that differ
> between
> > +             * 32-bit and 64-bit machines. All other integral types
> have the
> > +             * same, fixed size and will be converted w/o loss of
> precision
> > +             * in the above switch.
> > +             */
> > +            switch (kind & CTLTYPE) {
> > +            case CTLTYPE_LONG:
> > +                *(abi_long *)tp = tswap32(h2t_long_sat(*(long *)hp));
> > +                break;
> > +            case CTLTYPE_ULONG:
> > +                *(abi_ulong *)tp = tswap32(h2t_ulong_sat(*(u_long
> *)hp));
> > +                break;
> > +            }
>
> default: g_assert_not_reached().
>
> > +        }
> > +#endif
>
> #else
>      g_assert_not_reached();
>

Gotcha... Thanks!

Warner


>
> r~
>

--00000000000096affc05f4b6c3ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 14, 2023 at 2:16 PM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 2/13/23 14:27, Warner Losh wrote:<br>
&gt; +/*<br>
&gt; + * Convert the old value from host to target.<br>
<br>
host vs guest is clearer language; &quot;target&quot; gets overloaded, even=
 though still present in <br>
the code base.<br></blockquote><div><br></div><div>OK. Will do. We have tha=
t all over the place upstream... I&#39;ll start there too...<br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; + *<br>
&gt; + * For LONG and ULONG on ABI32, we need to &#39;down convert&#39; the=
 8 byte quantities<br>
&gt; + * to 4 bytes. The caller setup a buffer in host memory to get this d=
ata from<br>
&gt; + * the kernel and pass it to us. We do the down conversion and adjust=
 the length<br>
&gt; + * so the caller knows what to write as the returned length into the =
target when<br>
&gt; + * it copies the down converted values into the target.<br>
&gt; + *<br>
&gt; + * For normal integral types, we just need to byte swap. No size chan=
ges.<br>
&gt; + *<br>
&gt; + * For strings and node data, there&#39;s no conversion needed.<br>
&gt; + *<br>
&gt; + * For opaque data, per sysctl OID converts take care of it.<br>
&gt; + */<br>
&gt; +static void G_GNUC_UNUSED h2t_old_sysctl(void *holdp, size_t *holdlen=
, uint32_t kind)<br>
<br>
h2g.<br></blockquote><div><br></div><div>OK.<br></div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* hlen =3D=3D 0 for CTLTYPE_STRING and CTLTYPE_NO=
DE, which need no conversion<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* as well as CTLTYPE_OPAQUE, which needs special =
converters.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 if (hlen =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 while (len &lt; *holdlen) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (hlen =3D=3D tlen) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (hlen) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 1:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Nothing ne=
eded: no byteswapping and assigning in place */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 2:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *(uint16_t *)=
tp =3D tswap16(*(uint16_t *)hp);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 4:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *(uint32_t *)=
tp =3D tswap32(*(uint32_t *)hp);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 8:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *(uint64_t *)=
tp =3D tswap64(*(uint64_t *)hp);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
default: g_assert_not_reached().<br></blockquote><div><br></div><div>Ah!=C2=
=A0 I need that in several places... Thanks.<br></div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +#ifdef TARGET_ABI32<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Saturating assignme=
nt for the only two types that differ between<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* 32-bit and 64-bit m=
achines. All other integral types have the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* same, fixed size an=
d will be converted w/o loss of precision<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* in the above switch=
.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (kind &amp; CTLTYPE)=
 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case CTLTYPE_LONG:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *(abi_long *)=
tp =3D tswap32(h2t_long_sat(*(long *)hp));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case CTLTYPE_ULONG:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *(abi_ulong *=
)tp =3D tswap32(h2t_ulong_sat(*(u_long *)hp));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
default: g_assert_not_reached().<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +#endif<br>
<br>
#else<br>
=C2=A0 =C2=A0 =C2=A0g_assert_not_reached();<br></blockquote><div><br></div>=
<div>Gotcha... Thanks!</div><div><br></div><div>Warner<br></div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
r~<br>
</blockquote></div></div>

--00000000000096affc05f4b6c3ce--

