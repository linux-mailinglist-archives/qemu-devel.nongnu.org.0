Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C7B4895B9
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 10:54:28 +0100 (CET)
Received: from localhost ([::1]:57160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6rNj-0002Ck-Mq
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 04:54:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1n6rLe-0001U5-GG
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 04:52:18 -0500
Received: from [2a00:1450:4864:20::334] (port=56199
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1n6rLb-0008Ot-Ni
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 04:52:17 -0500
Received: by mail-wm1-x334.google.com with SMTP id c66so8293858wma.5
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 01:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zlh2gSNIZwpRFFys7dBv9ANz5MB8OwX4QBNVnu8VjOw=;
 b=NLev3f9F0IBBeKW/kVheCd9CY41ZT6DmCldSNiGOnbg+aXPIEFOf9phZK+Tya1j4DD
 dwgFsZw/kU1lAk/wfI+a2ud49hJ8QFviD9pAkqh85LlXyf9pdjp1r8pU5qRO3ZPqQ3ux
 qOdrZl9zsBy7m8PZRL6gw2XA1Vb1fshX4yAV7hikt5PQAbulrKEe1BH4tssghKrJkyp9
 rmqIbsq5MezBhmHqeIzBhnHVOgiJU4vkRr6xHCWG08SHN2CdAmcWblKCNtkEXu6hE79R
 exkP9hPwxOr3FiDA1A21a8SLvaYzWcvZzTunYvrHWoPNiTVdIbvvFCxIrkqZXhkZ+v81
 osRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zlh2gSNIZwpRFFys7dBv9ANz5MB8OwX4QBNVnu8VjOw=;
 b=k9d7CUHRXPgUaGlXWpRcGm9zKoU7MP8Pj7TPNqUD6wwt//vRh+Cs+yhqOzLrHXv0r0
 KGxiiWPepwtwNngzEKAybYHzH5MTh8FmlQfBFLzoF586AH13wXQTNA9Z/q0Om+IlMwLE
 QcxseAWPSlsyrDqmzuFGpVX+04iVc7py/bAVf7NJ4ZBlB1rHgrnegS9XE0X00KWOGCUH
 1fBUlho7nrpZVNFw/HMEgguP9TO7E/zbREj3K4XTfklPJ/ZffI/QNRrHGsy6qcDc1rXX
 tcciQ76ofbLyUdnSddx8EyLVJymVNEmyt7LC/KGHtb24HzqllpRMu+9KY9ibIih4A7re
 jeHw==
X-Gm-Message-State: AOAM531CtrcKW5lrOptx6SBkLfvOI4SPbpw1JUBfk6NXKATxZ+tgaFPg
 xvQOE2sGGwRHkheC2hHyjnxotR3/8WqQf3eI38VyHA==
X-Google-Smtp-Source: ABdhPJwqx6uBJrEtLr9NKQpNWrsiK4qNdKnCUMAkdB8nVSuqjHGqUrLq1As+pXfPH7sTBWD/V46rR2Q/J2Wd4jyWVcQ=
X-Received: by 2002:a7b:c8d0:: with SMTP id f16mr1080881wml.142.1641808331801; 
 Mon, 10 Jan 2022 01:52:11 -0800 (PST)
MIME-Version: 1.0
References: <20220109205640.4126817-1-philipp.tomsich@vrull.eu>
 <05100e8f-ce11-9da1-8afe-6010d9bbebb5@amsat.org>
In-Reply-To: <05100e8f-ce11-9da1-8afe-6010d9bbebb5@amsat.org>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Mon, 10 Jan 2022 10:52:00 +0100
Message-ID: <CAAeLtUAZ41bkq_UEKd8=-kO52wtTxv3rxYrzSHfp_sTd3K4+aw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] decodetree: Add an optional predicate-function for
 decoding
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-wm1-x334.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

For RISC-V the opcode decode will change between different vendor
implementations of RISC-V (emulated by the same qemu binary).
Any two vendors may reuse the same opcode space, e.g., we may end up with:

# *** RV64 Custom-3 Extension ***
{
  vt_maskc   0000000  ..... ..... 110 ..... 1111011 @r |has_xventanacondops=
_p
  vt_maskcn  0000000  ..... ..... 111 ..... 1111011 @r |has_xventanacondops=
_p
  someone_something  ............ ..... 000 ..... 1100111 @i
|has_xsomeonesomething_p
}

With extensions being enabled either from the commandline
    -cpu any,xventanacondops=3Dtrue
or possibly even having a AMP in one emulation setup (e.g. application
cores having one extension and power-mangement cores having a
different one =E2=80=94 or even a conflicting one).

Cheers,
Philipp.


On Mon, 10 Jan 2022 at 10:43, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Hi Philipp,
>
> On 1/9/22 21:56, Philipp Tomsich wrote:
> > This adds the possibility to specify a predicate-function that is
> > called as part of decoding in multi-patterns; it is intended for
> > use-cases (such as vendor-defined instructions in RISC-V) where the
> > same bitpattern may decode into different functions depending on the
> > overall configuration of the emulation target.
>
> But for a particular CPU, its "vendor ISAs" won't change at runtime.
>
> Since we know this at build time, I don't understand why you need
> predicate support at all.
>
> >
> > At this time, we only support predicates for multi-patterns.
> >
> > Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> >
> > ---
> >
> >  docs/devel/decodetree.rst |  7 ++++++-
> >  scripts/decodetree.py     | 24 +++++++++++++++++++++---
> >  2 files changed, 27 insertions(+), 4 deletions(-)
> >
> > diff --git a/docs/devel/decodetree.rst b/docs/devel/decodetree.rst
> > index 49ea50c2a7..241aaec8bb 100644
> > --- a/docs/devel/decodetree.rst
> > +++ b/docs/devel/decodetree.rst
> > @@ -144,9 +144,10 @@ Patterns
> >  Syntax::
> >
> >    pat_def      :=3D identifier ( pat_elt )+
> > -  pat_elt      :=3D fixedbit_elt | field_elt | field_ref | args_ref | =
fmt_ref | const_elt
> > +  pat_elt      :=3D fixedbit_elt | field_elt | field_ref | args_ref | =
fmt_ref | const_elt | predicate
> >    fmt_ref      :=3D '@' identifier
> >    const_elt    :=3D identifier '=3D' number
> > +  predicate    :=3D '|' identifier
> >
> >  The *fixedbit_elt* and *field_elt* specifiers are unchanged from forma=
ts.
> >  A pattern that does not specify a named format will have one inferred
> > @@ -156,6 +157,10 @@ A *const_elt* allows a argument to be set to a con=
stant value.  This may
> >  come in handy when fields overlap between patterns and one has to
> >  include the values in the *fixedbit_elt* instead.
> >
> > +A *predicate* allows to specify a predicate function (returing true or
> > +false) to determine the applicability of the pattern.  Currently, this
> > +will change the decode-behaviour  for overlapping multi-patterns only.
> > +
> >  The decoder will call a translator function for each pattern matched.
> >
> >  Pattern examples::
> > diff --git a/scripts/decodetree.py b/scripts/decodetree.py
> > index a03dc6b5e3..7da2282411 100644
> > --- a/scripts/decodetree.py
> > +++ b/scripts/decodetree.py
> > @@ -52,6 +52,7 @@
> >  re_fld_ident =3D '%[a-zA-Z0-9_]*'
> >  re_fmt_ident =3D '@[a-zA-Z0-9_]*'
> >  re_pat_ident =3D '[a-zA-Z0-9_]*'
> > +re_predicate_ident =3D '\|[a-zA-Z_][a-zA-Z0-9_]*'
> >
> >  def error_with_file(file, lineno, *args):
> >      """Print an error message from file:line and args and exit."""
> > @@ -119,6 +120,14 @@ def whexC(val):
> >          suffix =3D 'u'
> >      return whex(val) + suffix
> >
> > +def predicate(val):
> > +    """Return a string for calling a predicate function
> > +       (if specified, accepting 'None' as an indication
> > +       that no predicate is to be emitted) with the ctx
> > +       as a parameter."""
> > +    if (val =3D=3D None):
> > +        return ''
> > +    return ' && ' + val + '(ctx)'
> >
> >  def str_match_bits(bits, mask):
> >      """Return a string pretty-printing BITS/MASK"""
> > @@ -340,7 +349,7 @@ def output_def(self):
> >
> >  class General:
> >      """Common code between instruction formats and instruction pattern=
s"""
> > -    def __init__(self, name, lineno, base, fixb, fixm, udfm, fldm, fld=
s, w):
> > +    def __init__(self, name, lineno, base, fixb, fixm, udfm, fldm, fld=
s, w, p =3D None):
> >          self.name =3D name
> >          self.file =3D input_file
> >          self.lineno =3D lineno
> > @@ -351,6 +360,7 @@ def __init__(self, name, lineno, base, fixb, fixm, =
udfm, fldm, flds, w):
> >          self.fieldmask =3D fldm
> >          self.fields =3D flds
> >          self.width =3D w
> > +        self.predicate =3D p
> >
> >      def __str__(self):
> >          return self.name + ' ' + str_match_bits(self.fixedbits, self.f=
ixedmask)
> > @@ -499,7 +509,7 @@ def output_code(self, i, extracted, outerbits, oute=
rmask):
> >              if outermask !=3D p.fixedmask:
> >                  innermask =3D p.fixedmask & ~outermask
> >                  innerbits =3D p.fixedbits & ~outermask
> > -                output(ind, f'if ((insn & {whexC(innermask)}) =3D=3D {=
whexC(innerbits)}) {{\n')
> > +                output(ind, f'if ((insn & {whexC(innermask)}) =3D=3D {=
whexC(innerbits)}{predicate(p.predicate)}) {{\n')
> >                  output(ind, f'    /* {str_match_bits(p.fixedbits, p.fi=
xedmask)} */\n')
> >                  p.output_code(i + 4, extracted, p.fixedbits, p.fixedma=
sk)
> >                  output(ind, '}\n')
> > @@ -826,6 +836,7 @@ def parse_generic(lineno, parent_pat, name, toks):
> >      global re_fld_ident
> >      global re_fmt_ident
> >      global re_C_ident
> > +    global re_predicate_ident
> >      global insnwidth
> >      global insnmask
> >      global variablewidth
> > @@ -839,6 +850,7 @@ def parse_generic(lineno, parent_pat, name, toks):
> >      flds =3D {}
> >      arg =3D None
> >      fmt =3D None
> > +    predicate =3D None
> >      for t in toks:
> >          # '&Foo' gives a format an explicit argument set.
> >          if re.fullmatch(re_arg_ident, t):
> > @@ -881,6 +893,12 @@ def parse_generic(lineno, parent_pat, name, toks):
> >              flds =3D add_field(lineno, flds, fname, ConstField(value))
> >              continue
> >
> > +        # '|predicate' sets a predicate function to be called.
> > +        if re.fullmatch(re_predicate_ident, t):
> > +            tt =3D t[1:]
> > +            predicate =3D tt;
> > +            continue
> > +
> >          # Pattern of 0s, 1s, dots and dashes indicate required zeros,
> >          # required ones, or dont-cares.
> >          if re.fullmatch('[01.-]+', t):
> > @@ -979,7 +997,7 @@ def parse_generic(lineno, parent_pat, name, toks):
> >              if f not in flds.keys() and f not in fmt.fields.keys():
> >                  error(lineno, f'field {f} not initialized')
> >          pat =3D Pattern(name, lineno, fmt, fixedbits, fixedmask,
> > -                      undefmask, fieldmask, flds, width)
> > +                      undefmask, fieldmask, flds, width, predicate)
> >          parent_pat.pats.append(pat)
> >          allpatterns.append(pat)
> >

