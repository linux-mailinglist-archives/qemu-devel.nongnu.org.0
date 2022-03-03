Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FEB4CC348
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 17:53:29 +0100 (CET)
Received: from localhost ([::1]:45284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPohk-0001Jp-Qj
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 11:53:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nPofQ-0006N2-6D; Thu, 03 Mar 2022 11:51:06 -0500
Received: from [2607:f8b0:4864:20::c36] (port=39459
 helo=mail-oo1-xc36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nPofN-0006fv-T4; Thu, 03 Mar 2022 11:51:03 -0500
Received: by mail-oo1-xc36.google.com with SMTP id
 i6-20020a4ac506000000b0031c5ac6c078so6407028ooq.6; 
 Thu, 03 Mar 2022 08:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HA6gH7q6R2yeqTu5pgscY7HSJWwrH+XC9Fm/Y06E864=;
 b=JNwK7JBv3on64H9Yfa4MVBZWLbWL5kzZFklOjV78cfFqbqfMFBpLjPAKFlwSk6tcc2
 P8HVtysTmC/Iw256zg0aaof2UvNnVDIfw7iSzwUG7Q0Nhb/f805q7WBBfZxdrusaMUPQ
 xrCZEOzDdqeejRf9jaP23YZKNhINZT+HnNKtIjf8GqMX4HLX1dzdcYEIzFHbVAQe6+yH
 sp3EiSYKUVLEC00fLJLlU8MfRG4sL3B+CJ2k21lFqRSHXlUFpuW3FxbzpQM9ScauHJWc
 DWcQVce8+OWxcxp7pqeLvSV4OkVSvdJcjlPRqrFpbxQNYS1WkdmR+t8wMOhLb418Ghso
 9lfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HA6gH7q6R2yeqTu5pgscY7HSJWwrH+XC9Fm/Y06E864=;
 b=og71AHJbRmI04COeQawvNZhi69S2G4OjxMcTcgvsnVJWJfOBVN/IWH2JCTyBFOzvkl
 iyspyjiHm7AWzmBa6s6ZNQ/iFHZbWst3WBvOB0yoPzb/5vFPTmT61aqNL3OPz7/ZT6bg
 e/3JpXA2V3sqfxAYERnxCz19DLEgd+o/o1vafwI6493lVrVHEw8R0JuT7R4/C/KuBYgV
 gv+DE8iyX1cFw9ZDdhccw68UEy0gGubh2HCNJSFLXKXtJWSc6mMRD4enVbywdPWPAxzm
 /+EnsT9Ak+wVKvUnnVr+X+BNG1mH6moelXDe2ODsW7LVyN7Cw9EAT2qKf43iGAptg9LR
 ggDg==
X-Gm-Message-State: AOAM532mNBK8ISCn5dnnNnL2qRRsd7zDXePYPBnWiuCNoNgWWLWdPeWn
 7txsFjLBX7P0snelMj3iC36jMjrTm/c3Sb8mYsI=
X-Google-Smtp-Source: ABdhPJzjNVbGzTFC0KEKawDwUhjNxtU6KwsOaKxgklf5qawv1fptXrl0y1c6zdCEC5yTeK3iwSMco8tSMf4rC1+ltD8=
X-Received: by 2002:a05:6871:5c3:b0:d7:1322:9d48 with SMTP id
 v3-20020a05687105c300b000d713229d48mr4660203oan.153.1646326260395; Thu, 03
 Mar 2022 08:51:00 -0800 (PST)
MIME-Version: 1.0
References: <20220303032219.17631-1-dmiller423@gmail.com>
 <20220303032219.17631-2-dmiller423@gmail.com>
 <9ad00abf-4380-4efc-4012-aee5a36ff6e6@linaro.org>
In-Reply-To: <9ad00abf-4380-4efc-4012-aee5a36ff6e6@linaro.org>
From: David Miller <dmiller423@gmail.com>
Date: Thu, 3 Mar 2022 11:50:48 -0500
Message-ID: <CAEgyohXjXw-aZJX0qm3dReAUkMax-SmS9oAfR90XFX_q2i1msQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] s390x/tcg: Implement Vector-Enhancements Facility
 2 for s390x
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000ef72e305d9533399"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c36;
 envelope-from=dmiller423@gmail.com; helo=mail-oo1-xc36.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 farman@linux.ibm.com, cohuck@redhat.com, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ef72e305d9533399
Content-Type: text/plain; charset="UTF-8"

> Too many changes in one patch.
> You need to split these into smaller, logical units.

Can you give some guideline on that?
IE: change to two,  the shifts and reversed loads into two patches or more
on line count of each patch?
.
> Tabs, and more later.

The tabs should not happen at all,  I disabled them in editor will figure
out how they've reappeared.

> This seems likely to go wrong for vdst == vsrc.
> In addition, swapping the order of elements is something that can be done
in parallel.

There is always an even number of elements.
Will make the change there however, that code is more concise.

> Just use a little-endian load: MO_LE | es.
> While we use MO_TE all over, it's no secret that it's always big-endian.

> And everywhere else you do load then swap, or swap then store.

I wasn't sure if there was a reason MO_TE was used so just kept with the
existing code flow.

Thanks
- David Miller




On Thu, Mar 3, 2022 at 3:58 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 3/2/22 17:22, David Miller wrote:
> > resolves: https://gitlab.com/qemu-project/qemu/-/issues/738
> >
> > implements:
> > VECTOR LOAD ELEMENTS REVERSED               (VLER)
> > VECTOR LOAD BYTE REVERSED ELEMENTS          (VLBR)
> > VECTOR LOAD BYTE REVERSED ELEMENT           (VLEBRH, VLEBRF, VLEBRG)
> > VECTOR LOAD BYTE REVERSED ELEMENT AND ZERO  (VLLEBRZ)
> > VECTOR LOAD BYTE REVERSED ELEMENT AND REPLOCATE (VLBRREP)
> > VECTOR STORE ELEMENTS REVERSED              (VSTER)
> > VECTOR STORE BYTE REVERSED ELEMENTS         (VSTBR)
> > VECTOR STORE BYTE REVERSED ELEMENTS         (VSTEBRH, VSTEBRF, VSTEBRG)
> > VECTOR SHIFT LEFT DOUBLE BY BIT             (VSLD)
> > VECTOR SHIFT RIGHT DOUBLE BY BIT            (VSRD)
> > VECTOR STRING SEARCH                        (VSTRS)
> >
> > modifies:
> > VECTOR FP CONVERT FROM FIXED                (VCFPS)
> > VECTOR FP CONVERT FROM LOGICAL              (VCFPL)
> > VECTOR FP CONVERT TO FIXED                  (VCSFP)
> > VECTOR FP CONVERT TO LOGICAL                (VCLFP)
> > VECTOR SHIFT LEFT                           (VSL)
> > VECTOR SHIFT RIGHT ARITHMETIC               (VSRA)
> > VECTOR SHIFT RIGHT LOGICAL                  (VSRL)
> >
> > Signed-off-by: David Miller <dmiller423@gmail.com>
>
> Too many changes in one patch.
> You need to split these into smaller, logical units.
>
> > +/* VECTOR LOAD BYTE REVERSED ELEMENT AND ZERO */
> > +    F(0xe604, VLLEBRZ, VRX,   VE2, la2, 0, 0, 0, vllebrz, 0, IF_VEC)
> > +/* VECTOR LOAD BYTE REVERSED ELEMENTS */
> > +     F(0xe606, VLBR,    VRX,   VE2, la2, 0, 0, 0, vlbr, 0, IF_VEC)
> > +/* VECTOR LOAD ELEMENTS REVERSED */
> > +     F(0xe607, VLER,    VRX,   VE2, la2, 0, 0, 0, vler, 0, IF_VEC)
>
> Tabs, and more later.
>
> > @@ -457,6 +457,9 @@ static DisasJumpType op_vlrep(DisasContext *s,
> DisasOps *o)
> >       return DISAS_NEXT;
> >   }
> >
> > +
> > +
> > +
> >   static DisasJumpType op_vle(DisasContext *s, DisasOps *o)
>
> Do not add pointless whitespace.
>
> > +static DisasJumpType op_vlebr(DisasContext *s, DisasOps *o)
> > +{
> > +    const uint8_t es = (1 == s->fields.op2) ? 1 : (1 ^ s->fields.op2);
> > +    const uint8_t enr = get_field(s, m3);
> > +    TCGv_i64 tmp;
> > +
> > +    if (es < ES_16 || es > ES_64 || !valid_vec_element(enr, es)) {
> > +        gen_program_exception(s, PGM_SPECIFICATION);
> > +        return DISAS_NORETURN;
> > +    }
> > +
> > +    tmp = tcg_temp_new_i64();
> > +    tcg_gen_qemu_ld_i64(tmp, o->addr1, get_mem_index(s), MO_TE | es);
>
> Just use a little-endian load: MO_LE | es.
> While we use MO_TE all over, it's no secret that it's always big-endian.
>
> And everywhere else you do load then swap, or swap then store.
>
> > +}
> > +
> > +
> > +
> > +static DisasJumpType op_vsteb(DisasContext *s, DisasOps *o)
>
> More care with spacing.
>
> > +static inline void s390_vec_reverse(S390Vector *vdst,
> > +                                    S390Vector *vsrc, uint8_t es)
> > +{
> > +    const uint8_t elems = 1 << (4 - es);
> > +    uint32_t enr;
> > +
> > +    for (enr = 0; enr < elems; enr++) {
> > +        switch (es) {
> > +        case MO_8:
> > +            s390_vec_write_element8(vdst, enr,
> > +                           s390_vec_read_element8(vsrc, 15 ^ enr));
> > +            break;
> > +        case MO_16:
> > +            s390_vec_write_element16(vdst, enr,
> > +                           s390_vec_read_element16(vsrc, 7 ^ enr));
> > +            break;
> > +        case MO_32:
> > +            s390_vec_write_element32(vdst, enr,
> > +                           s390_vec_read_element32(vsrc, 3 ^ enr));
> > +            break;
> > +        case MO_64:
> > +            s390_vec_write_element64(vdst, enr,
> > +                           s390_vec_read_element64(vsrc, 1 ^ enr));
> > +            break;
> > +        default:
> > +            g_assert_not_reached();
> > +        }
> > +    }
> > +}
>
> This seems likely to go wrong for vdst == vsrc.
> In addition, swapping the order of elements is something that can be done
> in parallel.
>
>      l = src[lo], h = src[hi];
>      switch (es) {
>      case MO_64:
>          dst[hi] = l, dst[lo] = h;
>          break;
>      case MO_8:
>          dst[hi] = bswap64(l);
>          dst[lo] = bswap64(h);
>          break;
>      case MO_16:
>          dst[hi] = hswap64(l);
>          dst[lo] = hswap64(h);
>          break;
>      case MO_32:
>          dst[hi] = wswap64(l);
>          dst[hi] = wswap64(h);
>          break;
>      }
>
> which, really, can all be generated inline.
>
>
> r~
>

--000000000000ef72e305d9533399
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>&gt; Too many changes in one patch.<br>&gt; You need t=
o split these into smaller, logical units.<br><br>Can you give some guideli=
ne on that?<br>IE: change to two, =C2=A0the shifts and reversed loads into =
two patches or more on line count of each patch?<br>.<br>&gt; Tabs, and mor=
e later.<br><br><div><div class=3D"gmail_default" style=3D"">The tabs shoul=
d not happen at all, =C2=A0I disabled them in editor will figure out how th=
ey&#39;ve reappeared.<font color=3D"#073763" face=3D"georgia, serif"></font=
></div></div><div><div class=3D"gmail_default" style=3D"font-family:georgia=
,serif;font-size:small;color:rgb(7,55,99)"><span style=3D"font-family:Arial=
,Helvetica,sans-serif;color:rgb(34,34,34)"><br></span></div><div class=3D"g=
mail_default" style=3D"font-family:georgia,serif;font-size:small;color:rgb(=
7,55,99)"><span style=3D"font-family:Arial,Helvetica,sans-serif;color:rgb(3=
4,34,34)">&gt; This seems likely to go wrong for vdst =3D=3D vsrc.</span></=
div><div><span style=3D"color:rgb(7,55,99);font-family:georgia,serif">&gt;=
=C2=A0</span>In addition, swapping the order of elements is something that =
can be done in parallel.<br></div><div class=3D"gmail_default" style=3D"fon=
t-family:georgia,serif;font-size:small;color:rgb(7,55,99)"><br></div>There =
is always an even number of elements.<br></div>Will make the change there h=
owever, that code is more concise.<div><div class=3D"gmail_default" style=
=3D"font-family:georgia,serif;font-size:small;color:rgb(7,55,99)"><br></div=
><div class=3D"gmail_default" style=3D"font-family:georgia,serif;font-size:=
small;color:rgb(7,55,99)">&gt; <span style=3D"font-family:Arial,Helvetica,s=
ans-serif;color:rgb(34,34,34)">Just use a little-endian load: MO_LE | es.</=
span><br></div><span class=3D"gmail_default" style=3D"font-family:georgia,s=
erif;font-size:small;color:rgb(7,55,99)">&gt; </span>While we use MO_TE all=
 over, it&#39;s no secret that it&#39;s always big-endian.<br><br><div clas=
s=3D"gmail_default" style=3D"font-family:georgia,serif;font-size:small;colo=
r:rgb(7,55,99)"><span style=3D"font-family:Arial,Helvetica,sans-serif;color=
:rgb(34,34,34)">&gt; And everywhere else you do load then swap, or swap the=
n store.</span></div><div class=3D"gmail_default" style=3D"font-family:geor=
gia,serif;font-size:small;color:rgb(7,55,99)"><br></div>I wasn&#39;t sure i=
f there was a reason MO_TE was used so just kept with the existing code flo=
w.<br></div><div><br></div><div><div class=3D"gmail_default" style=3D"font-=
family:georgia,serif;font-size:small;color:rgb(7,55,99)">Thanks</div></div>=
<div class=3D"gmail_default" style=3D"font-family:georgia,serif;font-size:s=
mall;color:rgb(7,55,99)">- David Miller</div><div><br></div><div><br></div>=
<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Mar 3, 2022 at 3:58 AM Richard Henderson &lt;<a hre=
f=3D"mailto:richard.henderson@linaro.org">richard.henderson@linaro.org</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 3/=
2/22 17:22, David Miller wrote:<br>
&gt; resolves: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/738=
" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu=
/-/issues/738</a><br>
&gt; <br>
&gt; implements:<br>
&gt; VECTOR LOAD ELEMENTS REVERSED=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0(VLER)<br>
&gt; VECTOR LOAD BYTE REVERSED ELEMENTS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (=
VLBR)<br>
&gt; VECTOR LOAD BYTE REVERSED ELEMENT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(VLEBRH, VLEBRF, VLEBRG)<br>
&gt; VECTOR LOAD BYTE REVERSED ELEMENT AND ZERO=C2=A0 (VLLEBRZ)<br>
&gt; VECTOR LOAD BYTE REVERSED ELEMENT AND REPLOCATE (VLBRREP)<br>
&gt; VECTOR STORE ELEMENTS REVERSED=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (VSTER)<br>
&gt; VECTOR STORE BYTE REVERSED ELEMENTS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(=
VSTBR)<br>
&gt; VECTOR STORE BYTE REVERSED ELEMENTS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(=
VSTEBRH, VSTEBRF, VSTEBRG)<br>
&gt; VECTOR SHIFT LEFT DOUBLE BY BIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(VSLD)<br>
&gt; VECTOR SHIFT RIGHT DOUBLE BY BIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (VSRD)<br>
&gt; VECTOR STRING SEARCH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (VSTRS)<br>
&gt; <br>
&gt; modifies:<br>
&gt; VECTOR FP CONVERT FROM FIXED=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 (VCFPS)<br>
&gt; VECTOR FP CONVERT FROM LOGICAL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (VCFPL)<br>
&gt; VECTOR FP CONVERT TO FIXED=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 (VCSFP)<br>
&gt; VECTOR FP CONVERT TO LOGICAL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 (VCLFP)<br>
&gt; VECTOR SHIFT LEFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(VSL)<br>
&gt; VECTOR SHIFT RIGHT ARITHMETIC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0(VSRA)<br>
&gt; VECTOR SHIFT RIGHT LOGICAL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 (VSRL)<br>
&gt; <br>
&gt; Signed-off-by: David Miller &lt;<a href=3D"mailto:dmiller423@gmail.com=
" target=3D"_blank">dmiller423@gmail.com</a>&gt;<br>
<br>
Too many changes in one patch.<br>
You need to split these into smaller, logical units.<br>
<br>
&gt; +/* VECTOR LOAD BYTE REVERSED ELEMENT AND ZERO */<br>
&gt; +=C2=A0 =C2=A0 F(0xe604, VLLEBRZ, VRX,=C2=A0 =C2=A0VE2, la2, 0, 0, 0, =
vllebrz, 0, IF_VEC)<br>
&gt; +/* VECTOR LOAD BYTE REVERSED ELEMENTS */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0F(0xe606, VLBR,=C2=A0 =C2=A0 VRX,=C2=A0 =C2=A0VE2=
, la2, 0, 0, 0, vlbr, 0, IF_VEC)<br>
&gt; +/* VECTOR LOAD ELEMENTS REVERSED */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0F(0xe607, VLER,=C2=A0 =C2=A0 VRX,=C2=A0 =C2=A0VE2=
, la2, 0, 0, 0, vler, 0, IF_VEC)<br>
<br>
Tabs, and more later.<br>
<br>
&gt; @@ -457,6 +457,9 @@ static DisasJumpType op_vlrep(DisasContext *s, Dis=
asOps *o)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return DISAS_NEXT;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +<br>
&gt; +<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0static DisasJumpType op_vle(DisasContext *s, DisasOps *o)<=
br>
<br>
Do not add pointless whitespace.<br>
<br>
&gt; +static DisasJumpType op_vlebr(DisasContext *s, DisasOps *o)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 const uint8_t es =3D (1 =3D=3D s-&gt;fields.op2) ? 1 : =
(1 ^ s-&gt;fields.op2);<br>
&gt; +=C2=A0 =C2=A0 const uint8_t enr =3D get_field(s, m3);<br>
&gt; +=C2=A0 =C2=A0 TCGv_i64 tmp;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (es &lt; ES_16 || es &gt; ES_64 || !valid_vec_elemen=
t(enr, es)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_program_exception(s, PGM_SPECIFICATIO=
N);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return DISAS_NORETURN;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 tmp =3D tcg_temp_new_i64();<br>
&gt; +=C2=A0 =C2=A0 tcg_gen_qemu_ld_i64(tmp, o-&gt;addr1, get_mem_index(s),=
 MO_TE | es);<br>
<br>
Just use a little-endian load: MO_LE | es.<br>
While we use MO_TE all over, it&#39;s no secret that it&#39;s always big-en=
dian.<br>
<br>
And everywhere else you do load then swap, or swap then store.<br>
<br>
&gt; +}<br>
&gt; +<br>
&gt; +<br>
&gt; +<br>
&gt; +static DisasJumpType op_vsteb(DisasContext *s, DisasOps *o)<br>
<br>
More care with spacing.<br>
<br>
&gt; +static inline void s390_vec_reverse(S390Vector *vdst,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 S390Vector *vsrc, =
uint8_t es)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 const uint8_t elems =3D 1 &lt;&lt; (4 - es);<br>
&gt; +=C2=A0 =C2=A0 uint32_t enr;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 for (enr =3D 0; enr &lt; elems; enr++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (es) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case MO_8:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s390_vec_write_element8(vds=
t, enr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0s390_vec_read_element8(vsrc, 15 ^ enr));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case MO_16:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s390_vec_write_element16(vd=
st, enr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0s390_vec_read_element16(vsrc, 7 ^ enr));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case MO_32:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s390_vec_write_element32(vd=
st, enr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0s390_vec_read_element32(vsrc, 3 ^ enr));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case MO_64:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s390_vec_write_element64(vd=
st, enr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0s390_vec_read_element64(vsrc, 1 ^ enr));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_not_reached();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
<br>
This seems likely to go wrong for vdst =3D=3D vsrc.<br>
In addition, swapping the order of elements is something that can be done i=
n parallel.<br>
<br>
=C2=A0 =C2=A0 =C2=A0l =3D src[lo], h =3D src[hi];<br>
=C2=A0 =C2=A0 =C2=A0switch (es) {<br>
=C2=A0 =C2=A0 =C2=A0case MO_64:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dst[hi] =3D l, dst[lo] =3D h;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0case MO_8:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dst[hi] =3D bswap64(l);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dst[lo] =3D bswap64(h);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0case MO_16:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dst[hi] =3D hswap64(l);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dst[lo] =3D hswap64(h);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0case MO_32:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dst[hi] =3D wswap64(l);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dst[hi] =3D wswap64(h);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
which, really, can all be generated inline.<br>
<br>
<br>
r~<br>
</blockquote></div></div></div>

--000000000000ef72e305d9533399--

