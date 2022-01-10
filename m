Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFAF489588
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 10:46:28 +0100 (CET)
Received: from localhost ([::1]:49064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6rFz-0004Go-Qn
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 04:46:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6rDS-0003Wz-FM
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 04:43:50 -0500
Received: from [2a00:1450:4864:20::435] (port=35791
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6rDM-0006vd-2s
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 04:43:50 -0500
Received: by mail-wr1-x435.google.com with SMTP id e9so24070293wra.2
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 01:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gO+0gNgeAn6r73Gcv7V/BeZs69g/MfaOduXu5mmNCYc=;
 b=FKY1kyowQ+Ins+LMD1ln5hvuFTOGIQo01QiACE6NEacoTvOGduamrB+UYbE1xVEVDd
 hkDVw5BFRJaT6YicHBXInr4rP9wdEZKOcG5E8wdPm+e8yxB3BqWpQ7wKzEZecvYPHi5j
 g95QbqbPHlVlQGzJgVZiqZ5qfdszZnEkujPRezFM6avt3RVg60Ct732JIRUL5wV7+RKt
 FdkuyIDxJOA4kz2xvvTJsRHDRX2DEhTQjskyRgKb23iwpSLmPyPKXjg12IVMib5PgILv
 dgBRzB3V/Ud33fcYspPeVgn6+TxGy+5tH7IxXJIBBbCps5IagekTUmqSbdr1rdUfX3Tb
 BV+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gO+0gNgeAn6r73Gcv7V/BeZs69g/MfaOduXu5mmNCYc=;
 b=dWCiJkM0V8K0HvAHM3yWGpT46S9zGAlYLQFa1i6oMgyxEKuHVN74uV2Y3DJVqWmbHL
 ItwFOuaenic3qgGLNXXwYi1oZKiOOQ35ZkYtQM0LfqaqX/xvIu/w72ScJf+DoHqIXJVO
 BskRum75jcdc8ZIlmBvz4h2utn60h8FLR9bUfAyit3d2FWTVt9vDpxfHseq8CtjhkbJT
 +vOUDxPi60Yju7gve504jGMY+tN/b3NiyXK08l5Zy/MajeDIGQbBxhg2xsN1NCRGfyb/
 B6s09lqHbTLcOXxw+NgQuJ8bj1NzcNutUymia6SNdZo7B93XPvtyqxobahIf2A3ealiV
 GAgw==
X-Gm-Message-State: AOAM532T4SzxrFSZF8iKQNnaiSJtuGYKy4TFKaecn3r2cbui6FxaXF50
 AaRAGbQik3va2/YwEJy7h5I=
X-Google-Smtp-Source: ABdhPJw2o9KxbuyMl79KqJd1Xj/fvcr+qJs/8Uc5aeFEvuxmmnqrKb5ojt70kRnbQaGfMgCHUz6kjg==
X-Received: by 2002:adf:f811:: with SMTP id s17mr11973725wrp.91.1641807817039; 
 Mon, 10 Jan 2022 01:43:37 -0800 (PST)
Received: from [192.168.1.40] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id u14sm6073676wrf.39.2022.01.10.01.43.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 01:43:36 -0800 (PST)
Message-ID: <05100e8f-ce11-9da1-8afe-6010d9bbebb5@amsat.org>
Date: Mon, 10 Jan 2022 10:43:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v1 1/2] decodetree: Add an optional predicate-function for
 decoding
Content-Language: en-US
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
References: <20220109205640.4126817-1-philipp.tomsich@vrull.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220109205640.4126817-1-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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
 Richard Henderson <richard.henderson@linaro.org>,
 Greg Favor <gfavor@ventanamicro.com>, Luis Pires <luis.pires@eldorado.org.br>,
 Alistair Francis <alistair.francis@wdc.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Kito Cheng <kito.cheng@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philipp,

On 1/9/22 21:56, Philipp Tomsich wrote:
> This adds the possibility to specify a predicate-function that is
> called as part of decoding in multi-patterns; it is intended for
> use-cases (such as vendor-defined instructions in RISC-V) where the
> same bitpattern may decode into different functions depending on the
> overall configuration of the emulation target.

But for a particular CPU, its "vendor ISAs" won't change at runtime.

Since we know this at build time, I don't understand why you need
predicate support at all.

> 
> At this time, we only support predicates for multi-patterns.
> 
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> 
> ---
> 
>  docs/devel/decodetree.rst |  7 ++++++-
>  scripts/decodetree.py     | 24 +++++++++++++++++++++---
>  2 files changed, 27 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/devel/decodetree.rst b/docs/devel/decodetree.rst
> index 49ea50c2a7..241aaec8bb 100644
> --- a/docs/devel/decodetree.rst
> +++ b/docs/devel/decodetree.rst
> @@ -144,9 +144,10 @@ Patterns
>  Syntax::
>  
>    pat_def      := identifier ( pat_elt )+
> -  pat_elt      := fixedbit_elt | field_elt | field_ref | args_ref | fmt_ref | const_elt
> +  pat_elt      := fixedbit_elt | field_elt | field_ref | args_ref | fmt_ref | const_elt | predicate
>    fmt_ref      := '@' identifier
>    const_elt    := identifier '=' number
> +  predicate    := '|' identifier
>  
>  The *fixedbit_elt* and *field_elt* specifiers are unchanged from formats.
>  A pattern that does not specify a named format will have one inferred
> @@ -156,6 +157,10 @@ A *const_elt* allows a argument to be set to a constant value.  This may
>  come in handy when fields overlap between patterns and one has to
>  include the values in the *fixedbit_elt* instead.
>  
> +A *predicate* allows to specify a predicate function (returing true or
> +false) to determine the applicability of the pattern.  Currently, this
> +will change the decode-behaviour  for overlapping multi-patterns only.
> +
>  The decoder will call a translator function for each pattern matched.
>  
>  Pattern examples::
> diff --git a/scripts/decodetree.py b/scripts/decodetree.py
> index a03dc6b5e3..7da2282411 100644
> --- a/scripts/decodetree.py
> +++ b/scripts/decodetree.py
> @@ -52,6 +52,7 @@
>  re_fld_ident = '%[a-zA-Z0-9_]*'
>  re_fmt_ident = '@[a-zA-Z0-9_]*'
>  re_pat_ident = '[a-zA-Z0-9_]*'
> +re_predicate_ident = '\|[a-zA-Z_][a-zA-Z0-9_]*'
>  
>  def error_with_file(file, lineno, *args):
>      """Print an error message from file:line and args and exit."""
> @@ -119,6 +120,14 @@ def whexC(val):
>          suffix = 'u'
>      return whex(val) + suffix
>  
> +def predicate(val):
> +    """Return a string for calling a predicate function
> +       (if specified, accepting 'None' as an indication
> +       that no predicate is to be emitted) with the ctx
> +       as a parameter."""
> +    if (val == None):
> +        return ''
> +    return ' && ' + val + '(ctx)'
>  
>  def str_match_bits(bits, mask):
>      """Return a string pretty-printing BITS/MASK"""
> @@ -340,7 +349,7 @@ def output_def(self):
>  
>  class General:
>      """Common code between instruction formats and instruction patterns"""
> -    def __init__(self, name, lineno, base, fixb, fixm, udfm, fldm, flds, w):
> +    def __init__(self, name, lineno, base, fixb, fixm, udfm, fldm, flds, w, p = None):
>          self.name = name
>          self.file = input_file
>          self.lineno = lineno
> @@ -351,6 +360,7 @@ def __init__(self, name, lineno, base, fixb, fixm, udfm, fldm, flds, w):
>          self.fieldmask = fldm
>          self.fields = flds
>          self.width = w
> +        self.predicate = p
>  
>      def __str__(self):
>          return self.name + ' ' + str_match_bits(self.fixedbits, self.fixedmask)
> @@ -499,7 +509,7 @@ def output_code(self, i, extracted, outerbits, outermask):
>              if outermask != p.fixedmask:
>                  innermask = p.fixedmask & ~outermask
>                  innerbits = p.fixedbits & ~outermask
> -                output(ind, f'if ((insn & {whexC(innermask)}) == {whexC(innerbits)}) {{\n')
> +                output(ind, f'if ((insn & {whexC(innermask)}) == {whexC(innerbits)}{predicate(p.predicate)}) {{\n')
>                  output(ind, f'    /* {str_match_bits(p.fixedbits, p.fixedmask)} */\n')
>                  p.output_code(i + 4, extracted, p.fixedbits, p.fixedmask)
>                  output(ind, '}\n')
> @@ -826,6 +836,7 @@ def parse_generic(lineno, parent_pat, name, toks):
>      global re_fld_ident
>      global re_fmt_ident
>      global re_C_ident
> +    global re_predicate_ident
>      global insnwidth
>      global insnmask
>      global variablewidth
> @@ -839,6 +850,7 @@ def parse_generic(lineno, parent_pat, name, toks):
>      flds = {}
>      arg = None
>      fmt = None
> +    predicate = None
>      for t in toks:
>          # '&Foo' gives a format an explicit argument set.
>          if re.fullmatch(re_arg_ident, t):
> @@ -881,6 +893,12 @@ def parse_generic(lineno, parent_pat, name, toks):
>              flds = add_field(lineno, flds, fname, ConstField(value))
>              continue
>  
> +        # '|predicate' sets a predicate function to be called.
> +        if re.fullmatch(re_predicate_ident, t):
> +            tt = t[1:]
> +            predicate = tt;
> +            continue
> +
>          # Pattern of 0s, 1s, dots and dashes indicate required zeros,
>          # required ones, or dont-cares.
>          if re.fullmatch('[01.-]+', t):
> @@ -979,7 +997,7 @@ def parse_generic(lineno, parent_pat, name, toks):
>              if f not in flds.keys() and f not in fmt.fields.keys():
>                  error(lineno, f'field {f} not initialized')
>          pat = Pattern(name, lineno, fmt, fixedbits, fixedmask,
> -                      undefmask, fieldmask, flds, width)
> +                      undefmask, fieldmask, flds, width, predicate)
>          parent_pat.pats.append(pat)
>          allpatterns.append(pat)
>  

