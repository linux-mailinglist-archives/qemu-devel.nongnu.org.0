Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E4D4895F2
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 11:06:09 +0100 (CET)
Received: from localhost ([::1]:39936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6rZ2-0001so-Se
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 05:06:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1n6rWB-00006r-GX
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 05:03:11 -0500
Received: from [2a00:1450:4864:20::42f] (port=34774
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1n6rW8-0001Rl-II
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 05:03:11 -0500
Received: by mail-wr1-x42f.google.com with SMTP id h10so15521104wrb.1
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 02:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xVeav3YU8JQCuZPevqw4GucDOQDuW0HVQ8YrmOuij4M=;
 b=iJYkGp1vMnJ4kspFbnEh9AM8C440ch6E6i9eaCU+Z9GGfRkJzz8b1TEquiYyuwcbc+
 7K2pLB4WW4sh2pZMg74Z6h8qxdPMxPyeASEH+2ndCG0F3ZTM6um+v7EWCeU6jXEg6jcr
 v01f2YI3Tzc8K0oYFnnqWyjgu3oWJlIR0mdt7l3U58/SDCAnRiXBAZB0ZUchHb/DGVZP
 oy4zYBZUvyyNH1PQt4oFNrIm9pd8bCm4zuQozJ2zLC+egwixHil2PopQkBRZskX+svz1
 AiGLILKFYDmsyByTkgtnj8LGSZwVv82q8ICaoUGj2xEA2ebZn06/VfZC3K4f+enWM+VL
 DCLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xVeav3YU8JQCuZPevqw4GucDOQDuW0HVQ8YrmOuij4M=;
 b=oPHeX8ujwnku8alQKxSQcgdF9vOuK71e3hNEOm515ZMBWVt7MxCtc2sJbWyPYfq3WM
 AH1HhXzc0oTDs0+MJve9pOV3VSGO72/11e8NRZi/FVNgkcZ8RkyLaYrNKbCMJ44JWiGO
 41nEoHv30E1LIy9M5hnjMv3cyy79uq4clw/SLjBY266gLPbcY4qnUs4caGiRKVeZQd1R
 UearCeGNLqMduw/xVsJox/oaf3eMrwU5i6wtrag/wZjsUlH8UBxQ0SSIVF8w7z41Q9ZH
 CVod9f1N/0PS64dLfFt82iNonWVhYhPPrTwoGwj1nsAt5+qB+lr1qW3j3ffYdz6e6dnN
 YKfw==
X-Gm-Message-State: AOAM5323Eb3trLAVAlIXWEuEpeM/lEP7RoYYS3MEsheEHGlfNPLzlHt6
 jRmHSsFLG1umM8wGp3fOfB/2J/f9sEDIWZW+pe9pJQ==
X-Google-Smtp-Source: ABdhPJyNyCgXbOmqeZUUAC3+Oge7z1/Qh9f63l10w+G9ky73rcwrOVipEP3Q0rcCKBF2PAB5WKP+1ds5CsY4TJObEa0=
X-Received: by 2002:adf:eed1:: with SMTP id a17mr5685319wrp.306.1641808986616; 
 Mon, 10 Jan 2022 02:03:06 -0800 (PST)
MIME-Version: 1.0
References: <20220109205640.4126817-1-philipp.tomsich@vrull.eu>
 <05100e8f-ce11-9da1-8afe-6010d9bbebb5@amsat.org>
 <CAAeLtUAZ41bkq_UEKd8=-kO52wtTxv3rxYrzSHfp_sTd3K4+aw@mail.gmail.com>
In-Reply-To: <CAAeLtUAZ41bkq_UEKd8=-kO52wtTxv3rxYrzSHfp_sTd3K4+aw@mail.gmail.com>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Mon, 10 Jan 2022 11:02:55 +0100
Message-ID: <CAAeLtUCCeK4rV7qKw9fkjrY3RAcJWC1o-fxQUEotHcG7-1SnHg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] decodetree: Add an optional predicate-function for
 decoding
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="0000000000006fd0a805d53771e2"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Luis Pires <luis.pires@eldorado.org.br>,
 Alistair Francis <Alistair.Francis@wdc.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Kito Cheng <kito.cheng@sifive.com>,
 Greg Favor <gfavor@ventanamicro.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006fd0a805d53771e2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Philippe,

Assuming that we move into this direction for the vendor-extensions, I
would like to also see some of the other conditionally available extensions
in RISC-V to move to predicated decode (which would move this mechanism
past overlapping multi-patterns).

E.g., we have the following clumsiness for the Zb[abcs] extensions:

#define REQUIRE_ZBB(ctx) do {                    \
>     if (!RISCV_CPU(ctx->cs)->cfg.ext_zbb) {      \
>         return false;                            \
>     }                                            \
> } while (0)


> static bool trans_clz(DisasContext *ctx, arg_clz *a)
> {
>     REQUIRE_ZBB(ctx);
>     return gen_unary_per_ol(ctx, a, EXT_NONE, gen_clz, gen_clzw);
> }


Besides being easier to express in the table (as "|has_zbb_p"), this will
have no performance impact (as the predicate is otherwise evaluated every
time the trans_* function is invoked).

I intentionally did not include this at this stage, as the relative benefit
here is small, and changing decodetree.py for it is unjustified.
If (however) we have the mechanism in decodetree.py to support the
custom/vendor-defined extensions, this is a natural and obvious next step,
though.

Philipp.


On Mon, 10 Jan 2022 at 10:52, Philipp Tomsich <philipp.tomsich@vrull.eu>
wrote:

> For RISC-V the opcode decode will change between different vendor
> implementations of RISC-V (emulated by the same qemu binary).
> Any two vendors may reuse the same opcode space, e.g., we may end up with=
:
>
> # *** RV64 Custom-3 Extension ***
> {
>   vt_maskc   0000000  ..... ..... 110 ..... 1111011 @r
> |has_xventanacondops_p
>   vt_maskcn  0000000  ..... ..... 111 ..... 1111011 @r
> |has_xventanacondops_p
>   someone_something  ............ ..... 000 ..... 1100111 @i
> |has_xsomeonesomething_p
> }
>
> With extensions being enabled either from the commandline
>     -cpu any,xventanacondops=3Dtrue
> or possibly even having a AMP in one emulation setup (e.g. application
> cores having one extension and power-mangement cores having a
> different one =E2=80=94 or even a conflicting one).
>
> Cheers,
> Philipp.
>
>
> On Mon, 10 Jan 2022 at 10:43, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
> wrote:
> >
> > Hi Philipp,
> >
> > On 1/9/22 21:56, Philipp Tomsich wrote:
> > > This adds the possibility to specify a predicate-function that is
> > > called as part of decoding in multi-patterns; it is intended for
> > > use-cases (such as vendor-defined instructions in RISC-V) where the
> > > same bitpattern may decode into different functions depending on the
> > > overall configuration of the emulation target.
> >
> > But for a particular CPU, its "vendor ISAs" won't change at runtime.
> >
> > Since we know this at build time, I don't understand why you need
> > predicate support at all.
> >
> > >
> > > At this time, we only support predicates for multi-patterns.
> > >
> > > Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> > >
> > > ---
> > >
> > >  docs/devel/decodetree.rst |  7 ++++++-
> > >  scripts/decodetree.py     | 24 +++++++++++++++++++++---
> > >  2 files changed, 27 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/docs/devel/decodetree.rst b/docs/devel/decodetree.rst
> > > index 49ea50c2a7..241aaec8bb 100644
> > > --- a/docs/devel/decodetree.rst
> > > +++ b/docs/devel/decodetree.rst
> > > @@ -144,9 +144,10 @@ Patterns
> > >  Syntax::
> > >
> > >    pat_def      :=3D identifier ( pat_elt )+
> > > -  pat_elt      :=3D fixedbit_elt | field_elt | field_ref | args_ref =
|
> fmt_ref | const_elt
> > > +  pat_elt      :=3D fixedbit_elt | field_elt | field_ref | args_ref =
|
> fmt_ref | const_elt | predicate
> > >    fmt_ref      :=3D '@' identifier
> > >    const_elt    :=3D identifier '=3D' number
> > > +  predicate    :=3D '|' identifier
> > >
> > >  The *fixedbit_elt* and *field_elt* specifiers are unchanged from
> formats.
> > >  A pattern that does not specify a named format will have one inferre=
d
> > > @@ -156,6 +157,10 @@ A *const_elt* allows a argument to be set to a
> constant value.  This may
> > >  come in handy when fields overlap between patterns and one has to
> > >  include the values in the *fixedbit_elt* instead.
> > >
> > > +A *predicate* allows to specify a predicate function (returing true =
or
> > > +false) to determine the applicability of the pattern.  Currently, th=
is
> > > +will change the decode-behaviour  for overlapping multi-patterns onl=
y.
> > > +
> > >  The decoder will call a translator function for each pattern matched=
.
> > >
> > >  Pattern examples::
> > > diff --git a/scripts/decodetree.py b/scripts/decodetree.py
> > > index a03dc6b5e3..7da2282411 100644
> > > --- a/scripts/decodetree.py
> > > +++ b/scripts/decodetree.py
> > > @@ -52,6 +52,7 @@
> > >  re_fld_ident =3D '%[a-zA-Z0-9_]*'
> > >  re_fmt_ident =3D '@[a-zA-Z0-9_]*'
> > >  re_pat_ident =3D '[a-zA-Z0-9_]*'
> > > +re_predicate_ident =3D '\|[a-zA-Z_][a-zA-Z0-9_]*'
> > >
> > >  def error_with_file(file, lineno, *args):
> > >      """Print an error message from file:line and args and exit."""
> > > @@ -119,6 +120,14 @@ def whexC(val):
> > >          suffix =3D 'u'
> > >      return whex(val) + suffix
> > >
> > > +def predicate(val):
> > > +    """Return a string for calling a predicate function
> > > +       (if specified, accepting 'None' as an indication
> > > +       that no predicate is to be emitted) with the ctx
> > > +       as a parameter."""
> > > +    if (val =3D=3D None):
> > > +        return ''
> > > +    return ' && ' + val + '(ctx)'
> > >
> > >  def str_match_bits(bits, mask):
> > >      """Return a string pretty-printing BITS/MASK"""
> > > @@ -340,7 +349,7 @@ def output_def(self):
> > >
> > >  class General:
> > >      """Common code between instruction formats and instruction
> patterns"""
> > > -    def __init__(self, name, lineno, base, fixb, fixm, udfm, fldm,
> flds, w):
> > > +    def __init__(self, name, lineno, base, fixb, fixm, udfm, fldm,
> flds, w, p =3D None):
> > >          self.name =3D name
> > >          self.file =3D input_file
> > >          self.lineno =3D lineno
> > > @@ -351,6 +360,7 @@ def __init__(self, name, lineno, base, fixb, fixm=
,
> udfm, fldm, flds, w):
> > >          self.fieldmask =3D fldm
> > >          self.fields =3D flds
> > >          self.width =3D w
> > > +        self.predicate =3D p
> > >
> > >      def __str__(self):
> > >          return self.name + ' ' + str_match_bits(self.fixedbits,
> self.fixedmask)
> > > @@ -499,7 +509,7 @@ def output_code(self, i, extracted, outerbits,
> outermask):
> > >              if outermask !=3D p.fixedmask:
> > >                  innermask =3D p.fixedmask & ~outermask
> > >                  innerbits =3D p.fixedbits & ~outermask
> > > -                output(ind, f'if ((insn & {whexC(innermask)}) =3D=3D
> {whexC(innerbits)}) {{\n')
> > > +                output(ind, f'if ((insn & {whexC(innermask)}) =3D=3D
> {whexC(innerbits)}{predicate(p.predicate)}) {{\n')
> > >                  output(ind, f'    /* {str_match_bits(p.fixedbits,
> p.fixedmask)} */\n')
> > >                  p.output_code(i + 4, extracted, p.fixedbits,
> p.fixedmask)
> > >                  output(ind, '}\n')
> > > @@ -826,6 +836,7 @@ def parse_generic(lineno, parent_pat, name, toks)=
:
> > >      global re_fld_ident
> > >      global re_fmt_ident
> > >      global re_C_ident
> > > +    global re_predicate_ident
> > >      global insnwidth
> > >      global insnmask
> > >      global variablewidth
> > > @@ -839,6 +850,7 @@ def parse_generic(lineno, parent_pat, name, toks)=
:
> > >      flds =3D {}
> > >      arg =3D None
> > >      fmt =3D None
> > > +    predicate =3D None
> > >      for t in toks:
> > >          # '&Foo' gives a format an explicit argument set.
> > >          if re.fullmatch(re_arg_ident, t):
> > > @@ -881,6 +893,12 @@ def parse_generic(lineno, parent_pat, name, toks=
):
> > >              flds =3D add_field(lineno, flds, fname, ConstField(value=
))
> > >              continue
> > >
> > > +        # '|predicate' sets a predicate function to be called.
> > > +        if re.fullmatch(re_predicate_ident, t):
> > > +            tt =3D t[1:]
> > > +            predicate =3D tt;
> > > +            continue
> > > +
> > >          # Pattern of 0s, 1s, dots and dashes indicate required zeros=
,
> > >          # required ones, or dont-cares.
> > >          if re.fullmatch('[01.-]+', t):
> > > @@ -979,7 +997,7 @@ def parse_generic(lineno, parent_pat, name, toks)=
:
> > >              if f not in flds.keys() and f not in fmt.fields.keys():
> > >                  error(lineno, f'field {f} not initialized')
> > >          pat =3D Pattern(name, lineno, fmt, fixedbits, fixedmask,
> > > -                      undefmask, fieldmask, flds, width)
> > > +                      undefmask, fieldmask, flds, width, predicate)
> > >          parent_pat.pats.append(pat)
> > >          allpatterns.append(pat)
> > >
>

--0000000000006fd0a805d53771e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Philippe,<br><br>Assuming that we move into this direction=
 for the vendor-extensions, I would like to also see some of the other cond=
itionally available extensions in RISC-V to move to predicated decode (whic=
h would move this mechanism past overlapping multi-patterns).<br><br><div>E=
.g., we have the following clumsiness for the Zb[abcs] extensions:<br><br><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">#define REQUIRE_ZBB(ctx) d=
o { =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<=
br>=C2=A0 =C2=A0 if (!RISCV_CPU(ctx-&gt;cs)-&gt;cfg.ext_zbb) { =C2=A0 =C2=
=A0 =C2=A0\<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false; =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0\<br>=C2=A0 =C2=A0 } =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>} while (0)</blockquote><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><br>static bool trans_clz(DisasContext *=
ctx, arg_clz *a)<br>{<br>=C2=A0 =C2=A0 REQUIRE_ZBB(ctx);<br>=C2=A0 =C2=A0 r=
eturn gen_unary_per_ol(ctx, a, EXT_NONE, gen_clz, gen_clzw);<br>}</blockquo=
te><div><br></div><div>Besides being easier to express in the table (as &qu=
ot;|has_zbb_p&quot;), this will have no performance impact (as the predicat=
e is otherwise evaluated every time the trans_* function is invoked).</div>=
</div><div><br></div><div>I intentionally did not include this at this stag=
e, as the relative benefit here is small, and changing decodetree.py for it=
 is unjustified.</div><div>If (however) we have the mechanism in decodetree=
.py to support the custom/vendor-defined extensions, this is a natural and =
obvious next step, though.</div><div><br></div><div>Philipp.</div></div><br=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mo=
n, 10 Jan 2022 at 10:52, Philipp Tomsich &lt;<a href=3D"mailto:philipp.toms=
ich@vrull.eu">philipp.tomsich@vrull.eu</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">For RISC-V the opcode decode will cha=
nge between different vendor<br>
implementations of RISC-V (emulated by the same qemu binary).<br>
Any two vendors may reuse the same opcode space, e.g., we may end up with:<=
br>
<br>
# *** RV64 Custom-3 Extension ***<br>
{<br>
=C2=A0 vt_maskc=C2=A0 =C2=A00000000=C2=A0 ..... ..... 110 ..... 1111011 @r =
|has_xventanacondops_p<br>
=C2=A0 vt_maskcn=C2=A0 0000000=C2=A0 ..... ..... 111 ..... 1111011 @r |has_=
xventanacondops_p<br>
=C2=A0 someone_something=C2=A0 ............ ..... 000 ..... 1100111 @i<br>
|has_xsomeonesomething_p<br>
}<br>
<br>
With extensions being enabled either from the commandline<br>
=C2=A0 =C2=A0 -cpu any,xventanacondops=3Dtrue<br>
or possibly even having a AMP in one emulation setup (e.g. application<br>
cores having one extension and power-mangement cores having a<br>
different one =E2=80=94 or even a conflicting one).<br>
<br>
Cheers,<br>
Philipp.<br>
<br>
<br>
On Mon, 10 Jan 2022 at 10:43, Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"ma=
ilto:f4bug@amsat.org" target=3D"_blank">f4bug@amsat.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Philipp,<br>
&gt;<br>
&gt; On 1/9/22 21:56, Philipp Tomsich wrote:<br>
&gt; &gt; This adds the possibility to specify a predicate-function that is=
<br>
&gt; &gt; called as part of decoding in multi-patterns; it is intended for<=
br>
&gt; &gt; use-cases (such as vendor-defined instructions in RISC-V) where t=
he<br>
&gt; &gt; same bitpattern may decode into different functions depending on =
the<br>
&gt; &gt; overall configuration of the emulation target.<br>
&gt;<br>
&gt; But for a particular CPU, its &quot;vendor ISAs&quot; won&#39;t change=
 at runtime.<br>
&gt;<br>
&gt; Since we know this at build time, I don&#39;t understand why you need<=
br>
&gt; predicate support at all.<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; At this time, we only support predicates for multi-patterns.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Philipp Tomsich &lt;<a href=3D"mailto:philipp.toms=
ich@vrull.eu" target=3D"_blank">philipp.tomsich@vrull.eu</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; ---<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 docs/devel/decodetree.rst |=C2=A0 7 ++++++-<br>
&gt; &gt;=C2=A0 scripts/decodetree.py=C2=A0 =C2=A0 =C2=A0| 24 +++++++++++++=
++++++++---<br>
&gt; &gt;=C2=A0 2 files changed, 27 insertions(+), 4 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/docs/devel/decodetree.rst b/docs/devel/decodetree.rs=
t<br>
&gt; &gt; index 49ea50c2a7..241aaec8bb 100644<br>
&gt; &gt; --- a/docs/devel/decodetree.rst<br>
&gt; &gt; +++ b/docs/devel/decodetree.rst<br>
&gt; &gt; @@ -144,9 +144,10 @@ Patterns<br>
&gt; &gt;=C2=A0 Syntax::<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 pat_def=C2=A0 =C2=A0 =C2=A0 :=3D identifier ( pat_el=
t )+<br>
&gt; &gt; -=C2=A0 pat_elt=C2=A0 =C2=A0 =C2=A0 :=3D fixedbit_elt | field_elt=
 | field_ref | args_ref | fmt_ref | const_elt<br>
&gt; &gt; +=C2=A0 pat_elt=C2=A0 =C2=A0 =C2=A0 :=3D fixedbit_elt | field_elt=
 | field_ref | args_ref | fmt_ref | const_elt | predicate<br>
&gt; &gt;=C2=A0 =C2=A0 fmt_ref=C2=A0 =C2=A0 =C2=A0 :=3D &#39;@&#39; identif=
ier<br>
&gt; &gt;=C2=A0 =C2=A0 const_elt=C2=A0 =C2=A0 :=3D identifier &#39;=3D&#39;=
 number<br>
&gt; &gt; +=C2=A0 predicate=C2=A0 =C2=A0 :=3D &#39;|&#39; identifier<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 The *fixedbit_elt* and *field_elt* specifiers are unchanged=
 from formats.<br>
&gt; &gt;=C2=A0 A pattern that does not specify a named format will have on=
e inferred<br>
&gt; &gt; @@ -156,6 +157,10 @@ A *const_elt* allows a argument to be set to=
 a constant value.=C2=A0 This may<br>
&gt; &gt;=C2=A0 come in handy when fields overlap between patterns and one =
has to<br>
&gt; &gt;=C2=A0 include the values in the *fixedbit_elt* instead.<br>
&gt; &gt;<br>
&gt; &gt; +A *predicate* allows to specify a predicate function (returing t=
rue or<br>
&gt; &gt; +false) to determine the applicability of the pattern.=C2=A0 Curr=
ently, this<br>
&gt; &gt; +will change the decode-behaviour=C2=A0 for overlapping multi-pat=
terns only.<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 The decoder will call a translator function for each patter=
n matched.<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 Pattern examples::<br>
&gt; &gt; diff --git a/scripts/decodetree.py b/scripts/decodetree.py<br>
&gt; &gt; index a03dc6b5e3..7da2282411 100644<br>
&gt; &gt; --- a/scripts/decodetree.py<br>
&gt; &gt; +++ b/scripts/decodetree.py<br>
&gt; &gt; @@ -52,6 +52,7 @@<br>
&gt; &gt;=C2=A0 re_fld_ident =3D &#39;%[a-zA-Z0-9_]*&#39;<br>
&gt; &gt;=C2=A0 re_fmt_ident =3D &#39;@[a-zA-Z0-9_]*&#39;<br>
&gt; &gt;=C2=A0 re_pat_ident =3D &#39;[a-zA-Z0-9_]*&#39;<br>
&gt; &gt; +re_predicate_ident =3D &#39;\|[a-zA-Z_][a-zA-Z0-9_]*&#39;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 def error_with_file(file, lineno, *args):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Print an error message from=
 file:line and args and exit.&quot;&quot;&quot;<br>
&gt; &gt; @@ -119,6 +120,14 @@ def whexC(val):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 suffix =3D &#39;u&#39;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 return whex(val) + suffix<br>
&gt; &gt;<br>
&gt; &gt; +def predicate(val):<br>
&gt; &gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;Return a string for calling a pr=
edicate function<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0(if specified, accepting &#39;None&#3=
9; as an indication<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0that no predicate is to be emitted) w=
ith the ctx<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0as a parameter.&quot;&quot;&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 if (val =3D=3D None):<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;&#39;<br>
&gt; &gt; +=C2=A0 =C2=A0 return &#39; &amp;&amp; &#39; + val + &#39;(ctx)&#=
39;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 def str_match_bits(bits, mask):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Return a string pretty-prin=
ting BITS/MASK&quot;&quot;&quot;<br>
&gt; &gt; @@ -340,7 +349,7 @@ def output_def(self):<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 class General:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Common code between instruc=
tion formats and instruction patterns&quot;&quot;&quot;<br>
&gt; &gt; -=C2=A0 =C2=A0 def __init__(self, name, lineno, base, fixb, fixm,=
 udfm, fldm, flds, w):<br>
&gt; &gt; +=C2=A0 =C2=A0 def __init__(self, name, lineno, base, fixb, fixm,=
 udfm, fldm, flds, w, p =3D None):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://self.name" re=
l=3D"noreferrer" target=3D"_blank">self.name</a> =3D name<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.file =3D input_file<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.lineno =3D lineno<br>
&gt; &gt; @@ -351,6 +360,7 @@ def __init__(self, name, lineno, base, fixb, =
fixm, udfm, fldm, flds, w):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.fieldmask =3D fldm<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.fields =3D flds<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.width =3D w<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.predicate =3D p<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 def __str__(self):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return <a href=3D"http://self.n=
ame" rel=3D"noreferrer" target=3D"_blank">self.name</a> + &#39; &#39; + str=
_match_bits(self.fixedbits, self.fixedmask)<br>
&gt; &gt; @@ -499,7 +509,7 @@ def output_code(self, i, extracted, outerbits=
, outermask):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if outermask !=3D=
 p.fixedmask:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inn=
ermask =3D p.fixedmask &amp; ~outermask<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inn=
erbits =3D p.fixedbits &amp; ~outermask<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output(i=
nd, f&#39;if ((insn &amp; {whexC(innermask)}) =3D=3D {whexC(innerbits)}) {{=
\n&#39;)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output(i=
nd, f&#39;if ((insn &amp; {whexC(innermask)}) =3D=3D {whexC(innerbits)}{pre=
dicate(p.predicate)}) {{\n&#39;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out=
put(ind, f&#39;=C2=A0 =C2=A0 /* {str_match_bits(p.fixedbits, p.fixedmask)} =
*/\n&#39;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p.o=
utput_code(i + 4, extracted, p.fixedbits, p.fixedmask)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out=
put(ind, &#39;}\n&#39;)<br>
&gt; &gt; @@ -826,6 +836,7 @@ def parse_generic(lineno, parent_pat, name, t=
oks):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 global re_fld_ident<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 global re_fmt_ident<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 global re_C_ident<br>
&gt; &gt; +=C2=A0 =C2=A0 global re_predicate_ident<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 global insnwidth<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 global insnmask<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 global variablewidth<br>
&gt; &gt; @@ -839,6 +850,7 @@ def parse_generic(lineno, parent_pat, name, t=
oks):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 flds =3D {}<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 arg =3D None<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 fmt =3D None<br>
&gt; &gt; +=C2=A0 =C2=A0 predicate =3D None<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 for t in toks:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # &#39;&amp;Foo&#39; gives a fo=
rmat an explicit argument set.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if re.fullmatch(re_arg_ident, t=
):<br>
&gt; &gt; @@ -881,6 +893,12 @@ def parse_generic(lineno, parent_pat, name, =
toks):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 flds =3D add_fiel=
d(lineno, flds, fname, ConstField(value))<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
&gt; &gt;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # &#39;|predicate&#39; sets a predic=
ate function to be called.<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if re.fullmatch(re_predicate_ident, =
t):<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tt =3D t[1:]<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 predicate =3D tt;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Pattern of 0s, 1s, dots and d=
ashes indicate required zeros,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # required ones, or dont-cares.=
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if re.fullmatch(&#39;[01.-]+&#3=
9;, t):<br>
&gt; &gt; @@ -979,7 +997,7 @@ def parse_generic(lineno, parent_pat, name, t=
oks):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if f not in flds.=
keys() and f not in fmt.fields.keys():<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err=
or(lineno, f&#39;field {f} not initialized&#39;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pat =3D Pattern(name, lineno, f=
mt, fixedbits, fixedmask,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 undefmask, fieldmask, flds, width)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 undefmask, fieldmask, flds, width, predicate)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parent_pat.pats.append(pat)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 allpatterns.append(pat)<br>
&gt; &gt;<br>
</blockquote></div>

--0000000000006fd0a805d53771e2--

