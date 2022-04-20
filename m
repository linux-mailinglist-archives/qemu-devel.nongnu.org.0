Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF17508FB7
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:47:40 +0200 (CEST)
Received: from localhost ([::1]:46610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhFMZ-0006hL-Jq
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:47:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhEr8-0008Ox-4Y
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:15:10 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:39539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhEr4-0002Le-1b
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:15:09 -0400
Received: by mail-qk1-x731.google.com with SMTP id q75so1841452qke.6
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ie5yetHGzVp1MFaWAA/yDGARjaYrxAP+CJ7ZL+v0VA0=;
 b=NMjsy4q3eWLb2znnNVE8V2nlEM0u7dq6TanAlAtc3qJ10Z4wRBKLGunX1WWoBa3MYa
 nwPEkhsSjUYHpznDHOxeuaH8dDJXTVY/X6xNR4i8DVbssf2L2Wybab0iesjGxw9gwjYX
 uDOqxMsvcffpqma3/PhKVcdqnbAG1B0Y9BoPiICNYEkzV/kECbGu7/tpHR3mFJnZvT2s
 ZngyVJBFG8OM4UoCX/XWS6Ekk8mno16Xb24i/dI0+sarZvFyReJS6CKET3TTd2kAKgjd
 FYgUOyeNyxEO/Nu6mUrluDi9ewPbwSOshEBXX0e6Y6lJ6S2Jebp5v6Kw8J4jnM3UyTg3
 zorA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ie5yetHGzVp1MFaWAA/yDGARjaYrxAP+CJ7ZL+v0VA0=;
 b=A7rfzdUWrp/UIHyUP+5Wuebyzk0kv+DYTtqUgGZl1csPGfpaTsuPSfgjL2DP7lOnvL
 vAxWJpq1xtdyAWcqww8O45YipphSkt3665qpD7U563V+OMxWtaKBg+g/KqlRGlbtKujd
 eUb6bDw7MnIOMitrMbexELLnfzqzSWVM5i5UWbgUEuTvzX27WKIV9h5F4+Ti85plyyO6
 eFX3hXeh2SbfEKRRsUJ0NEBREVWGA+C13luAGDH30yh80z6p0J3/SSdJXPjwnuE5Rkve
 gGa+DD+WGjK3CoyQepNfQ8CFWfbmOnm3oC5IlGxET+uMB95/OE+hj451IiLtKy7K9hex
 gFwg==
X-Gm-Message-State: AOAM532cHT2P7iiCf1+AY4PFy7v4EGZRAPh9sbsfl/HEzgV5MeNSCja1
 vjTMimTzbwjNR5vYf6DEalByQJAMDFmzeo1JqwFjzASxZMyWBQ==
X-Google-Smtp-Source: ABdhPJyMEAo5yAgkOF6yKLzBaPmtobgVah7FMwQYAlIHp1FpcN8/gHdbDzehPgfcPODpelvnDR97BWBBXTE65ESFYAg=
X-Received: by 2002:ae9:ef4e:0:b0:69e:2403:eae8 with SMTP id
 d75-20020ae9ef4e000000b0069e2403eae8mr13028161qkg.397.1650478492170; Wed, 20
 Apr 2022 11:14:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220420153407.73926-1-pbonzini@redhat.com>
 <20220420153407.73926-16-pbonzini@redhat.com>
In-Reply-To: <20220420153407.73926-16-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 20 Apr 2022 22:14:40 +0400
Message-ID: <CAJ+F1CK9gmd+kZgCmZnJekA9U2F-PKqzNtQwmudCu0C2oLk1rg@mail.gmail.com>
Subject: Re: [PATCH 15/34] meson-buildoptions: add support for string options
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000003c3cd905dd19f83f"
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qk1-x731.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003c3cd905dd19f83f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2022 at 7:57 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Allow using the buildoptions.json file for more options, namely anything
> that is not a boolean or multiple-choice.
>
> The mapping between configure and meson is messy for string options,
> so allow configure to use to something other than the name in
> meson_options.txt.  This will come in handy anyway for builtin
> Meson options such as b_lto or b_coverage.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

lgtm
Tested-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  meson_options.txt             |  2 +-
>  scripts/meson-buildoptions.py | 65 ++++++++++++++++++++++++++++++-----
>  scripts/meson-buildoptions.sh |  6 ++--
>  3 files changed, 60 insertions(+), 13 deletions(-)
>
> diff --git a/meson_options.txt b/meson_options.txt
> index cf18663833..415fcc448e 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -11,7 +11,7 @@ option('qemu_firmwarepath', type : 'string', value : ''=
,
>  option('smbd', type : 'string', value : '',
>         description: 'Path to smbd for slirp networking')
>  option('sphinx_build', type : 'string', value : '',
> -       description: 'Use specified sphinx-build [$sphinx_build] for
> building document (default to be empty)')
> +       description: 'Use specified sphinx-build for building document')
>  option('iasl', type : 'string', value : '',
>         description: 'Path to ACPI disassembler')
>  option('default_devices', type : 'boolean', value : true,
> diff --git a/scripts/meson-buildoptions.py b/scripts/meson-buildoptions.p=
y
> index 693be7b966..4af8d6e732 100755
> --- a/scripts/meson-buildoptions.py
> +++ b/scripts/meson-buildoptions.py
> @@ -38,6 +38,11 @@
>      "trace_file",
>  }
>
> +OPTION_NAMES =3D {
> +    "malloc": "enable-malloc",
> +    "trace_backends": "enable-trace-backends",
> +}
> +
>  BUILTIN_OPTIONS =3D {
>      "strip",
>  }
> @@ -75,7 +80,7 @@ def help_line(left, opt, indent, long):
>      right =3D f'{opt["description"]}'
>      if long:
>          value =3D value_to_help(opt["value"])
> -        if value !=3D "auto":
> +        if value !=3D "auto" and value !=3D "":
>              right +=3D f" [{value}]"
>      if "choices" in opt and long:
>          choices =3D "/".join(sorted(opt["choices"]))
> @@ -96,6 +101,18 @@ def allow_arg(opt):
>      return not (set(opt["choices"]) <=3D {"auto", "disabled", "enabled"}=
)
>
>
> +# Return whether the option (a dictionary) can be used without
> +# arguments.  Booleans can only be used without arguments;
> +# combos require an argument if they accept neither "enabled"
> +# nor "disabled"
> +def require_arg(opt):
> +    if opt["type"] =3D=3D "boolean":
> +        return False
> +    if opt["type"] !=3D "combo":
> +        return True
> +    return not ({"enabled", "disabled"}.intersection(opt["choices"]))
> +
> +
>  def filter_options(json):
>      if ":" in json["name"]:
>          return False
> @@ -110,20 +127,48 @@ def load_options(json):
>      return sorted(json, key=3Dlambda x: x["name"])
>
>
> +def cli_option(opt):
> +    name =3D opt["name"]
> +    if name in OPTION_NAMES:
> +        return OPTION_NAMES[name]
> +    return name.replace("_", "-")
> +
> +
> +def cli_help_key(opt):
> +    key =3D cli_option(opt)
> +    if require_arg(opt):
> +        return key
> +    if opt["type"] =3D=3D "boolean" and opt["value"]:
> +        return f"disable-{key}"
> +    return f"enable-{key}"
> +
> +
> +def cli_metavar(opt):
> +    if opt["type"] =3D=3D "string":
> +        return "VALUE"
> +    if opt["type"] =3D=3D "array":
> +        return "CHOICES"
> +    return "CHOICE"
> +
> +
>  def print_help(options):
>      print("meson_options_help() {")
> -    for opt in options:
> -        key =3D opt["name"].replace("_", "-")
> +    for opt in sorted(options, key=3Dcli_help_key):
> +        key =3D cli_help_key(opt)
>          # The first section includes options that have an arguments,
>          # and booleans (i.e., only one of enable/disable makes sense)
> -        if opt["type"] =3D=3D "boolean":
> -            left =3D f"--disable-{key}" if opt["value"] else
> f"--enable-{key}"
> +        if require_arg(opt):
> +            metavar =3D cli_metavar(opt)
> +            left =3D f"--{key}=3D{metavar}"
> +            help_line(left, opt, 27, True)
> +        elif opt["type"] =3D=3D "boolean":
> +            left =3D f"--{key}"
>              help_line(left, opt, 27, False)
>          elif allow_arg(opt):
>              if opt["type"] =3D=3D "combo" and "enabled" in opt["choices"=
]:
> -                left =3D f"--enable-{key}[=3DCHOICE]"
> +                left =3D f"--{key}[=3DCHOICE]"
>              else:
> -                left =3D f"--enable-{key}=3DCHOICE"
> +                left =3D f"--{key}=3DCHOICE"
>              help_line(left, opt, 27, True)
>
>      sh_print()
> @@ -142,9 +187,11 @@ def print_parse(options):
>      print("_meson_option_parse() {")
>      print("  case $1 in")
>      for opt in options:
> -        key =3D opt["name"].replace("_", "-")
> +        key =3D cli_option(opt)
>          name =3D opt["name"]
> -        if opt["type"] =3D=3D "boolean":
> +        if require_arg(opt):
> +            print(f'    --{key}=3D*) quote_sh "-D{name}=3D$2" ;;')
> +        elif opt["type"] =3D=3D "boolean":
>              print(f'    --enable-{key}) printf "%s" -D{name}=3Dtrue ;;')
>              print(f'    --disable-{key}) printf "%s" -D{name}=3Dfalse ;;=
')
>          else:
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.s=
h
> index a269534394..5a06b7915c 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -1,5 +1,7 @@
>  # This file is generated by meson-buildoptions.py, do not edit!
>  meson_options_help() {
> +  printf "%s\n" '  --disable-coroutine-pool coroutine freelist (better
> performance)'
> +  printf "%s\n" '  --disable-install-blobs  install provided firmware
> blobs'
>    printf "%s\n" '  --enable-block-drv-whitelist-in-tools'
>    printf "%s\n" '                           use block whitelist also in
> tools instead of only'
>    printf "%s\n" '                           QEMU'
> @@ -8,7 +10,6 @@ meson_options_help() {
>    printf "%s\n" '                           (choices:
> auto/disabled/enabled/internal/system)'
>    printf "%s\n" '  --enable-cfi             Control-Flow Integrity (CFI)=
'
>    printf "%s\n" '  --enable-cfi-debug       Verbose errors in case of CF=
I
> violation'
> -  printf "%s\n" '  --disable-coroutine-pool coroutine freelist (better
> performance)'
>    printf "%s\n" '  --enable-debug-mutex     mutex debugging support'
>    printf "%s\n" '  --enable-debug-stack-usage'
>    printf "%s\n" '                           measure coroutine stack usag=
e'
> @@ -16,7 +17,6 @@ meson_options_help() {
>    printf "%s\n" '                           (choices:
> auto/disabled/enabled/internal/system)'
>    printf "%s\n" '  --enable-fuzzing         build fuzzing targets'
>    printf "%s\n" '  --enable-gprof           QEMU profiling with gprof'
> -  printf "%s\n" '  --disable-install-blobs  install provided firmware
> blobs'
>    printf "%s\n" '  --enable-malloc=3DCHOICE   choose memory allocator to
> use [system] (choices:'
>    printf "%s\n" '                           jemalloc/system/tcmalloc)'
>    printf "%s\n" '  --enable-module-upgrades try to load modules from
> alternate paths for'
> @@ -29,7 +29,7 @@ meson_options_help() {
>    printf "%s\n" '                           (choices:
> auto/disabled/enabled/internal/system)'
>    printf "%s\n" '  --enable-strip           Strip targets on install'
>    printf "%s\n" '  --enable-tcg-interpreter TCG with bytecode interprete=
r
> (slow)'
> -  printf "%s\n" '  --enable-trace-backends=3DCHOICE'
> +  printf "%s\n" '  --enable-trace-backends=3DCHOICES'
>    printf "%s\n" '                           Set available tracing
> backends [log] (choices:'
>    printf "%s\n" '
>  dtrace/ftrace/log/nop/simple/syslog/ust)'
>    printf "%s\n" ''
> --
> 2.35.1
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000003c3cd905dd19f83f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 20, 2022 at 7:57 PM Paolo=
 Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Allo=
w using the buildoptions.json file for more options, namely anything<br>
that is not a boolean or multiple-choice.<br>
<br>
The mapping between configure and meson is messy for string options,<br>
so allow configure to use to something other than the name in<br>
meson_options.txt.=C2=A0 This will come in handy anyway for builtin<br>
Meson options such as b_lto or b_coverage.<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div>lgtm<br></div><div><div>Tested-by: Marc-Andr=C3=A9 Lureau &lt;<a href=
=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;=
</div><div><br></div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
---<br>
=C2=A0meson_options.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 2 +-<br>
=C2=A0scripts/meson-buildoptions.py | 65 ++++++++++++++++++++++++++++++----=
-<br>
=C2=A0scripts/meson-buildoptions.sh |=C2=A0 6 ++--<br>
=C2=A03 files changed, 60 insertions(+), 13 deletions(-)<br>
<br>
diff --git a/meson_options.txt b/meson_options.txt<br>
index cf18663833..415fcc448e 100644<br>
--- a/meson_options.txt<br>
+++ b/meson_options.txt<br>
@@ -11,7 +11,7 @@ option(&#39;qemu_firmwarepath&#39;, type : &#39;string&#3=
9;, value : &#39;&#39;,<br>
=C2=A0option(&#39;smbd&#39;, type : &#39;string&#39;, value : &#39;&#39;,<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Path to smbd for slirp networ=
king&#39;)<br>
=C2=A0option(&#39;sphinx_build&#39;, type : &#39;string&#39;, value : &#39;=
&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;Use specified sphinx-build [$=
sphinx_build] for building document (default to be empty)&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;Use specified sphinx-build fo=
r building document&#39;)<br>
=C2=A0option(&#39;iasl&#39;, type : &#39;string&#39;, value : &#39;&#39;,<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Path to ACPI disassembler&#39=
;)<br>
=C2=A0option(&#39;default_devices&#39;, type : &#39;boolean&#39;, value : t=
rue,<br>
diff --git a/scripts/meson-buildoptions.py b/scripts/meson-buildoptions.py<=
br>
index 693be7b966..4af8d6e732 100755<br>
--- a/scripts/meson-buildoptions.py<br>
+++ b/scripts/meson-buildoptions.py<br>
@@ -38,6 +38,11 @@<br>
=C2=A0 =C2=A0 =C2=A0&quot;trace_file&quot;,<br>
=C2=A0}<br>
<br>
+OPTION_NAMES =3D {<br>
+=C2=A0 =C2=A0 &quot;malloc&quot;: &quot;enable-malloc&quot;,<br>
+=C2=A0 =C2=A0 &quot;trace_backends&quot;: &quot;enable-trace-backends&quot=
;,<br>
+}<br>
+<br>
=C2=A0BUILTIN_OPTIONS =3D {<br>
=C2=A0 =C2=A0 =C2=A0&quot;strip&quot;,<br>
=C2=A0}<br>
@@ -75,7 +80,7 @@ def help_line(left, opt, indent, long):<br>
=C2=A0 =C2=A0 =C2=A0right =3D f&#39;{opt[&quot;description&quot;]}&#39;<br>
=C2=A0 =C2=A0 =C2=A0if long:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0value =3D value_to_help(opt[&quot;value&q=
uot;])<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if value !=3D &quot;auto&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if value !=3D &quot;auto&quot; and value !=3D =
&quot;&quot;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0right +=3D f&quot; [{value}=
]&quot;<br>
=C2=A0 =C2=A0 =C2=A0if &quot;choices&quot; in opt and long:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0choices =3D &quot;/&quot;.join(sorted(opt=
[&quot;choices&quot;]))<br>
@@ -96,6 +101,18 @@ def allow_arg(opt):<br>
=C2=A0 =C2=A0 =C2=A0return not (set(opt[&quot;choices&quot;]) &lt;=3D {&quo=
t;auto&quot;, &quot;disabled&quot;, &quot;enabled&quot;})<br>
<br>
<br>
+# Return whether the option (a dictionary) can be used without<br>
+# arguments.=C2=A0 Booleans can only be used without arguments;<br>
+# combos require an argument if they accept neither &quot;enabled&quot;<br=
>
+# nor &quot;disabled&quot;<br>
+def require_arg(opt):<br>
+=C2=A0 =C2=A0 if opt[&quot;type&quot;] =3D=3D &quot;boolean&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return False<br>
+=C2=A0 =C2=A0 if opt[&quot;type&quot;] !=3D &quot;combo&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return True<br>
+=C2=A0 =C2=A0 return not ({&quot;enabled&quot;, &quot;disabled&quot;}.inte=
rsection(opt[&quot;choices&quot;]))<br>
+<br>
+<br>
=C2=A0def filter_options(json):<br>
=C2=A0 =C2=A0 =C2=A0if &quot;:&quot; in json[&quot;name&quot;]:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return False<br>
@@ -110,20 +127,48 @@ def load_options(json):<br>
=C2=A0 =C2=A0 =C2=A0return sorted(json, key=3Dlambda x: x[&quot;name&quot;]=
)<br>
<br>
<br>
+def cli_option(opt):<br>
+=C2=A0 =C2=A0 name =3D opt[&quot;name&quot;]<br>
+=C2=A0 =C2=A0 if name in OPTION_NAMES:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return OPTION_NAMES[name]<br>
+=C2=A0 =C2=A0 return name.replace(&quot;_&quot;, &quot;-&quot;)<br>
+<br>
+<br>
+def cli_help_key(opt):<br>
+=C2=A0 =C2=A0 key =3D cli_option(opt)<br>
+=C2=A0 =C2=A0 if require_arg(opt):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return key<br>
+=C2=A0 =C2=A0 if opt[&quot;type&quot;] =3D=3D &quot;boolean&quot; and opt[=
&quot;value&quot;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return f&quot;disable-{key}&quot;<br>
+=C2=A0 =C2=A0 return f&quot;enable-{key}&quot;<br>
+<br>
+<br>
+def cli_metavar(opt):<br>
+=C2=A0 =C2=A0 if opt[&quot;type&quot;] =3D=3D &quot;string&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;VALUE&quot;<br>
+=C2=A0 =C2=A0 if opt[&quot;type&quot;] =3D=3D &quot;array&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;CHOICES&quot;<br>
+=C2=A0 =C2=A0 return &quot;CHOICE&quot;<br>
+<br>
+<br>
=C2=A0def print_help(options):<br>
=C2=A0 =C2=A0 =C2=A0print(&quot;meson_options_help() {&quot;)<br>
-=C2=A0 =C2=A0 for opt in options:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 key =3D opt[&quot;name&quot;].replace(&quot;_&=
quot;, &quot;-&quot;)<br>
+=C2=A0 =C2=A0 for opt in sorted(options, key=3Dcli_help_key):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 key =3D cli_help_key(opt)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# The first section includes options that=
 have an arguments,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# and booleans (i.e., only one of enable/=
disable makes sense)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if opt[&quot;type&quot;] =3D=3D &quot;boolean&=
quot;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 left =3D f&quot;--disable-{key}&=
quot; if opt[&quot;value&quot;] else f&quot;--enable-{key}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if require_arg(opt):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 metavar =3D cli_metavar(opt)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 left =3D f&quot;--{key}=3D{metav=
ar}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 help_line(left, opt, 27, True)<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif opt[&quot;type&quot;] =3D=3D &quot;boolea=
n&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 left =3D f&quot;--{key}&quot;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0help_line(left, opt, 27, Fa=
lse)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif allow_arg(opt):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if opt[&quot;type&quot;] =
=3D=3D &quot;combo&quot; and &quot;enabled&quot; in opt[&quot;choices&quot;=
]:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 left =3D f&quot;--=
enable-{key}[=3DCHOICE]&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 left =3D f&quot;--=
{key}[=3DCHOICE]&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 left =3D f&quot;--=
enable-{key}=3DCHOICE&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 left =3D f&quot;--=
{key}=3DCHOICE&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0help_line(left, opt, 27, Tr=
ue)<br>
<br>
=C2=A0 =C2=A0 =C2=A0sh_print()<br>
@@ -142,9 +187,11 @@ def print_parse(options):<br>
=C2=A0 =C2=A0 =C2=A0print(&quot;_meson_option_parse() {&quot;)<br>
=C2=A0 =C2=A0 =C2=A0print(&quot;=C2=A0 case $1 in&quot;)<br>
=C2=A0 =C2=A0 =C2=A0for opt in options:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 key =3D opt[&quot;name&quot;].replace(&quot;_&=
quot;, &quot;-&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 key =3D cli_option(opt)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name =3D opt[&quot;name&quot;]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if opt[&quot;type&quot;] =3D=3D &quot;boolean&=
quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if require_arg(opt):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(f&#39;=C2=A0 =C2=A0 --{key=
}=3D*) quote_sh &quot;-D{name}=3D$2&quot; ;;&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif opt[&quot;type&quot;] =3D=3D &quot;boolea=
n&quot;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print(f&#39;=C2=A0 =C2=A0 -=
-enable-{key}) printf &quot;%s&quot; -D{name}=3Dtrue ;;&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print(f&#39;=C2=A0 =C2=A0 -=
-disable-{key}) printf &quot;%s&quot; -D{name}=3Dfalse ;;&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh<=
br>
index a269534394..5a06b7915c 100644<br>
--- a/scripts/meson-buildoptions.sh<br>
+++ b/scripts/meson-buildoptions.sh<br>
@@ -1,5 +1,7 @@<br>
=C2=A0# This file is generated by meson-buildoptions.py, do not edit!<br>
=C2=A0meson_options_help() {<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 --disable-coroutine-pool corout=
ine freelist (better performance)&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 --disable-install-blobs=C2=A0 i=
nstall provided firmware blobs&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --enable-block-drv-whiteli=
st-in-tools&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0use block=
 whitelist also in tools instead of only&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QEMU&#39;=
<br>
@@ -8,7 +10,6 @@ meson_options_help() {<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(choices:=
 auto/disabled/enabled/internal/system)&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --enable-cfi=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Control-Flow Integrity (CFI)&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --enable-cfi-debug=C2=A0 =
=C2=A0 =C2=A0 =C2=A0Verbose errors in case of CFI violation&#39;<br>
-=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 --disable-coroutine-pool corout=
ine freelist (better performance)&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --enable-debug-mutex=C2=A0=
 =C2=A0 =C2=A0mutex debugging support&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --enable-debug-stack-usage=
&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0measure c=
oroutine stack usage&#39;<br>
@@ -16,7 +17,6 @@ meson_options_help() {<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(choices:=
 auto/disabled/enabled/internal/system)&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --enable-fuzzing=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0build fuzzing targets&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --enable-gprof=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QEMU profiling with gprof&#39;<br>
-=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 --disable-install-blobs=C2=A0 i=
nstall provided firmware blobs&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --enable-malloc=3DCHOICE=
=C2=A0 =C2=A0choose memory allocator to use [system] (choices:&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0jemalloc/=
system/tcmalloc)&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --enable-module-upgrades t=
ry to load modules from alternate paths for&#39;<br>
@@ -29,7 +29,7 @@ meson_options_help() {<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(choices:=
 auto/disabled/enabled/internal/system)&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --enable-strip=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Strip targets on install&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --enable-tcg-interpreter T=
CG with bytecode interpreter (slow)&#39;<br>
-=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 --enable-trace-backends=3DCHOIC=
E&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 --enable-trace-backends=3DCHOIC=
ES&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Set avail=
able tracing backends [log] (choices:&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dtrace/ft=
race/log/nop/simple/syslog/ust)&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;&#39;<br>
-- <br>
2.35.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000003c3cd905dd19f83f--

