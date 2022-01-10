Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E29F4895F5
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 11:06:58 +0100 (CET)
Received: from localhost ([::1]:41258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6rZp-0002sI-7c
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 05:06:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6rWg-0000jg-GB
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 05:03:43 -0500
Received: from [2a00:1450:4864:20::430] (port=36451
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6rWe-0001Xt-G0
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 05:03:42 -0500
Received: by mail-wr1-x430.google.com with SMTP id r10so18012898wrc.3
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 02:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=onb7GZJMIQKODOJ1kfUM6AQqX6BbX7dCgE6xG6b4SXQ=;
 b=Co3BW/UTr2asXYPCsX9qQhh3TeajVf6Nl2LQoFWmrptWF6mWq7m/Dzq5Uqjw4GwD/X
 8ERSePoHyXxklPbn2aLujaxGoN5TbGMhsZg7V7YB7J+HfnJURcAGllMxKAJRaJ1+b2w6
 I5i0twXh+lA9q/mkceduC6rpXWx6Pu2Q6Cx91jsFbmZEdvYr761bVqlmT3mbzymw4Qkk
 y8NfVAFaue0ll4SHFYY96BHy1aXsuZWV7CkkvTlpdwsFalNdKolpdI2I3nYAHrR7JKbd
 u0pM7ga+N1K39J9ZCs3W6055bdc3WMHgmnaFUpMeiQiQfbqjGFuZi+rYH/W9hBNzOfhy
 jVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=onb7GZJMIQKODOJ1kfUM6AQqX6BbX7dCgE6xG6b4SXQ=;
 b=QAYGsAjsHhkuV2k0ifZycovwAsSNIe9SyjBRhc67d8SwPeAsbIoTduzy7TWt8NAaHn
 qFw1gp5VuduI9Skd1AUFh2BFsHFVD/ueCicGguCW/G54fc4gh8qiXIXvr1B/4QeUelpr
 Xd4YXxwkKjigHaww3IaKse1HlseWq/lHaszBvY27+0IcTPGA4NDFjwlqDDEDTV7I1seF
 Uv5jxrSVHmqHnmk2BkRy3V3lYB92zH6Ny0oMYhV6XPRogxoad4H0UcwNbmNJPxVvoaIO
 M7/0daFwfsQJuFx/rtIK5dxTr0IlcWRMys3VvR3qVg7Jn3N65VhUaZVP1KeSNOblfX6y
 Ee+w==
X-Gm-Message-State: AOAM530OvwtIiUyFe2cizS4fAm5wKl4DRI1yHQHV+Jl7hAZ0MH+I3DjI
 hAsgrQvX8tCSHQnvFumuAV0=
X-Google-Smtp-Source: ABdhPJw3vNWqdt7X3oS1dGtFkGmQgg9AH4mv9rIN7q1LLRrC3AisyndRbzgLIrNGGhuyBnu615L1Qw==
X-Received: by 2002:a05:6000:10c1:: with SMTP id
 b1mr1268722wrx.226.1641809016004; 
 Mon, 10 Jan 2022 02:03:36 -0800 (PST)
Received: from [192.168.1.40] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id z6sm7007594wmp.9.2022.01.10.02.03.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 02:03:35 -0800 (PST)
Message-ID: <91394f9d-aa65-a4f9-f54f-3ecc5aac9e70@amsat.org>
Date: Mon, 10 Jan 2022 11:03:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v1 1/2] decodetree: Add an optional predicate-function for
 decoding
Content-Language: en-US
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
References: <20220109205640.4126817-1-philipp.tomsich@vrull.eu>
 <05100e8f-ce11-9da1-8afe-6010d9bbebb5@amsat.org>
 <CAAeLtUAZ41bkq_UEKd8=-kO52wtTxv3rxYrzSHfp_sTd3K4+aw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <CAAeLtUAZ41bkq_UEKd8=-kO52wtTxv3rxYrzSHfp_sTd3K4+aw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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

On 1/10/22 10:52, Philipp Tomsich wrote:
> For RISC-V the opcode decode will change between different vendor
> implementations of RISC-V (emulated by the same qemu binary).
> Any two vendors may reuse the same opcode space, e.g., we may end up with:
> 
> # *** RV64 Custom-3 Extension ***
> {
>   vt_maskc   0000000  ..... ..... 110 ..... 1111011 @r |has_xventanacondops_p
>   vt_maskcn  0000000  ..... ..... 111 ..... 1111011 @r |has_xventanacondops_p
>   someone_something  ............ ..... 000 ..... 1100111 @i
> |has_xsomeonesomething_p
> }
> 
> With extensions being enabled either from the commandline
>     -cpu any,xventanacondops=true
> or possibly even having a AMP in one emulation setup (e.g. application
> cores having one extension and power-mangement cores having a
> different one — or even a conflicting one).

I understand, I think this is what MIPS does, see commit 9d005392390:
("target/mips: Introduce decodetree structure for NEC Vr54xx extension")

> 
> Cheers,
> Philipp.
> 
> 
> On Mon, 10 Jan 2022 at 10:43, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Hi Philipp,
>>
>> On 1/9/22 21:56, Philipp Tomsich wrote:
>>> This adds the possibility to specify a predicate-function that is
>>> called as part of decoding in multi-patterns; it is intended for
>>> use-cases (such as vendor-defined instructions in RISC-V) where the
>>> same bitpattern may decode into different functions depending on the
>>> overall configuration of the emulation target.
>>
>> But for a particular CPU, its "vendor ISAs" won't change at runtime.
>>
>> Since we know this at build time, I don't understand why you need
>> predicate support at all.
>>
>>>
>>> At this time, we only support predicates for multi-patterns.
>>>
>>> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
>>>
>>> ---
>>>
>>>  docs/devel/decodetree.rst |  7 ++++++-
>>>  scripts/decodetree.py     | 24 +++++++++++++++++++++---
>>>  2 files changed, 27 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/docs/devel/decodetree.rst b/docs/devel/decodetree.rst
>>> index 49ea50c2a7..241aaec8bb 100644
>>> --- a/docs/devel/decodetree.rst
>>> +++ b/docs/devel/decodetree.rst
>>> @@ -144,9 +144,10 @@ Patterns
>>>  Syntax::
>>>
>>>    pat_def      := identifier ( pat_elt )+
>>> -  pat_elt      := fixedbit_elt | field_elt | field_ref | args_ref | fmt_ref | const_elt
>>> +  pat_elt      := fixedbit_elt | field_elt | field_ref | args_ref | fmt_ref | const_elt | predicate
>>>    fmt_ref      := '@' identifier
>>>    const_elt    := identifier '=' number
>>> +  predicate    := '|' identifier
>>>
>>>  The *fixedbit_elt* and *field_elt* specifiers are unchanged from formats.
>>>  A pattern that does not specify a named format will have one inferred
>>> @@ -156,6 +157,10 @@ A *const_elt* allows a argument to be set to a constant value.  This may
>>>  come in handy when fields overlap between patterns and one has to
>>>  include the values in the *fixedbit_elt* instead.
>>>
>>> +A *predicate* allows to specify a predicate function (returing true or
>>> +false) to determine the applicability of the pattern.  Currently, this
>>> +will change the decode-behaviour  for overlapping multi-patterns only.
>>> +
>>>  The decoder will call a translator function for each pattern matched.
>>>
>>>  Pattern examples::
>>> diff --git a/scripts/decodetree.py b/scripts/decodetree.py
>>> index a03dc6b5e3..7da2282411 100644
>>> --- a/scripts/decodetree.py
>>> +++ b/scripts/decodetree.py
>>> @@ -52,6 +52,7 @@
>>>  re_fld_ident = '%[a-zA-Z0-9_]*'
>>>  re_fmt_ident = '@[a-zA-Z0-9_]*'
>>>  re_pat_ident = '[a-zA-Z0-9_]*'
>>> +re_predicate_ident = '\|[a-zA-Z_][a-zA-Z0-9_]*'
>>>
>>>  def error_with_file(file, lineno, *args):
>>>      """Print an error message from file:line and args and exit."""
>>> @@ -119,6 +120,14 @@ def whexC(val):
>>>          suffix = 'u'
>>>      return whex(val) + suffix
>>>
>>> +def predicate(val):
>>> +    """Return a string for calling a predicate function
>>> +       (if specified, accepting 'None' as an indication
>>> +       that no predicate is to be emitted) with the ctx
>>> +       as a parameter."""
>>> +    if (val == None):
>>> +        return ''
>>> +    return ' && ' + val + '(ctx)'
>>>
>>>  def str_match_bits(bits, mask):
>>>      """Return a string pretty-printing BITS/MASK"""
>>> @@ -340,7 +349,7 @@ def output_def(self):
>>>
>>>  class General:
>>>      """Common code between instruction formats and instruction patterns"""
>>> -    def __init__(self, name, lineno, base, fixb, fixm, udfm, fldm, flds, w):
>>> +    def __init__(self, name, lineno, base, fixb, fixm, udfm, fldm, flds, w, p = None):
>>>          self.name = name
>>>          self.file = input_file
>>>          self.lineno = lineno
>>> @@ -351,6 +360,7 @@ def __init__(self, name, lineno, base, fixb, fixm, udfm, fldm, flds, w):
>>>          self.fieldmask = fldm
>>>          self.fields = flds
>>>          self.width = w
>>> +        self.predicate = p
>>>
>>>      def __str__(self):
>>>          return self.name + ' ' + str_match_bits(self.fixedbits, self.fixedmask)
>>> @@ -499,7 +509,7 @@ def output_code(self, i, extracted, outerbits, outermask):
>>>              if outermask != p.fixedmask:
>>>                  innermask = p.fixedmask & ~outermask
>>>                  innerbits = p.fixedbits & ~outermask
>>> -                output(ind, f'if ((insn & {whexC(innermask)}) == {whexC(innerbits)}) {{\n')
>>> +                output(ind, f'if ((insn & {whexC(innermask)}) == {whexC(innerbits)}{predicate(p.predicate)}) {{\n')
>>>                  output(ind, f'    /* {str_match_bits(p.fixedbits, p.fixedmask)} */\n')
>>>                  p.output_code(i + 4, extracted, p.fixedbits, p.fixedmask)
>>>                  output(ind, '}\n')
>>> @@ -826,6 +836,7 @@ def parse_generic(lineno, parent_pat, name, toks):
>>>      global re_fld_ident
>>>      global re_fmt_ident
>>>      global re_C_ident
>>> +    global re_predicate_ident
>>>      global insnwidth
>>>      global insnmask
>>>      global variablewidth
>>> @@ -839,6 +850,7 @@ def parse_generic(lineno, parent_pat, name, toks):
>>>      flds = {}
>>>      arg = None
>>>      fmt = None
>>> +    predicate = None
>>>      for t in toks:
>>>          # '&Foo' gives a format an explicit argument set.
>>>          if re.fullmatch(re_arg_ident, t):
>>> @@ -881,6 +893,12 @@ def parse_generic(lineno, parent_pat, name, toks):
>>>              flds = add_field(lineno, flds, fname, ConstField(value))
>>>              continue
>>>
>>> +        # '|predicate' sets a predicate function to be called.
>>> +        if re.fullmatch(re_predicate_ident, t):
>>> +            tt = t[1:]
>>> +            predicate = tt;
>>> +            continue
>>> +
>>>          # Pattern of 0s, 1s, dots and dashes indicate required zeros,
>>>          # required ones, or dont-cares.
>>>          if re.fullmatch('[01.-]+', t):
>>> @@ -979,7 +997,7 @@ def parse_generic(lineno, parent_pat, name, toks):
>>>              if f not in flds.keys() and f not in fmt.fields.keys():
>>>                  error(lineno, f'field {f} not initialized')
>>>          pat = Pattern(name, lineno, fmt, fixedbits, fixedmask,
>>> -                      undefmask, fieldmask, flds, width)
>>> +                      undefmask, fieldmask, flds, width, predicate)
>>>          parent_pat.pats.append(pat)
>>>          allpatterns.append(pat)
>>>

