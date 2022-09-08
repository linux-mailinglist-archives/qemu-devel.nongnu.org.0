Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEC55B2020
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 16:07:37 +0200 (CEST)
Received: from localhost ([::1]:58704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWIBr-0005ja-VG
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 10:07:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oWI1f-0001sp-9a
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 09:57:03 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:34319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oWI1b-0007th-11
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 09:57:01 -0400
Received: by mail-lf1-x135.google.com with SMTP id bt10so27874786lfb.1
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 06:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=VMM/v13Lc+Wv3WMTG40+JqGN/B+8NUobxinSI1YPH3M=;
 b=WczHXqMJg3GGBHbQ2q7wlWwq6+fZinShxJ6CUl6K1iBZL1ZuLEiWbiJjhjmhDDZQI1
 NZLqtTCEqBrtgzAt/kVJE+eFVWtfTx2AjPUZ3BAZ7GwJhbnqlxTCNnPlMO/eB2vHuROD
 oIaZMY+mHOxKMEl5P7AsXnnueGa8wWYy2OcBS8upjIPGZIp1N5RKU37++c/8oC1+qOW2
 rhGcyR8dK5ggs878XI/e9VhIPMrvUwIn3dAW6kY7xNjUlcO+JFw3oTLaoVaZjrleIBoo
 lRQHoY7DDGUQxn15R1tuS4LNhomiTGdN42E/cyI+1MDssrh9b69xmKkp4YZs3bzUBGcU
 cDFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=VMM/v13Lc+Wv3WMTG40+JqGN/B+8NUobxinSI1YPH3M=;
 b=s35xE+FqVoL3wfCQtQ+eSR62F+DMsw12X3XzQ4dZUVjf60/JR3jOkG+qaIV6mfwIsj
 9CkG43EgRGItBPQ8RtppSZva9Lmu6EeydmwrPHZgUE3RJeDTOBWMRi4vBEtg4YyVpahV
 k0HFU5fq3CcygcYWq3+UrSiGB+oJZ48Q9Rdlrtm5qp7bz9TxA9mBEjdlANXsrX8Se7Gv
 +Ka6QCatLiOhCP57Z2ar3JZJC87Fp+8mja8M7xHG51yDCIYqmze79guwbng/qjlC7bgo
 Ppp16lnyx3nBT4lHng2NxdD2CkCccex97gLTLOvaraTkBYLGbSBBloG/Ly/5PaK0kI9S
 7c2w==
X-Gm-Message-State: ACgBeo0XjnDVh6Qb54TmqBySK8LymEw9mWLTc1YX/1PzF0x1JRdukemL
 awTFo9gRemXyjFnwb5iaulWDVqXe3Gy30+bsdTo=
X-Google-Smtp-Source: AA6agR6vIregV+tdG4g5v2Wjqc/JfhpoKRYGKCmmmJ/NFpWA0aJDUogeUrbg8tGy/sdnXA1hSjzG/D0ZaDILbrDK5kY=
X-Received: by 2002:a05:6512:2306:b0:48b:2905:21a8 with SMTP id
 o6-20020a056512230600b0048b290521a8mr3064016lfu.167.1662645417191; Thu, 08
 Sep 2022 06:56:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220908132817.1831008-1-bmeng.cn@gmail.com>
 <20220908132817.1831008-4-bmeng.cn@gmail.com>
In-Reply-To: <20220908132817.1831008-4-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 8 Sep 2022 17:56:45 +0400
Message-ID: <CAJ+F1C+A6rHJ90Vpoetn_VB3S5wRq993xJQPtyzW6FAxQcGkMQ@mail.gmail.com>
Subject: Re: [PATCH 3/7] scripts/nsis.py: Automatically package required DLLs
 of QEMU executables
To: Bin Meng <bmeng.cn@gmail.com>, Stefan Weil <sw@weilnetz.de>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000007ab09805e82acdb3"
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x135.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000007ab09805e82acdb3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

(adding Stefan Weil in CC, who currently provides Windows installer)

On Thu, Sep 8, 2022 at 5:34 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> At present packaging the required DLLs of QEMU executables is a
> manual process, and error prone.
>
> Actually build/config-host.mak contains a GLIB_BINDIR variable
> which is the directory where glib and other DLLs reside. This
> works for both Windows native build and cross-build on Linux.
> We can use it as the search directory for DLLs and automate
> the whole DLL packaging process.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>

That seems reasonable to me, although packaging dependencies is not just
about linked DLLs.. There are dynamic stuff, executables, data, legal docs
etc etc. I have no clear picture how is everything really packaged in the
installer tbh (I would recommend msys2 qemu installation at this point)

anyhow, for the patch, as far as I am concerned:
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


---
>
>  meson.build     |  1 +
>  scripts/nsis.py | 46 ++++++++++++++++++++++++++++++++++++++++++----
>  2 files changed, 43 insertions(+), 4 deletions(-)
>
> diff --git a/meson.build b/meson.build
> index c2adb7caf4..4c03850f9f 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -3657,6 +3657,7 @@ if host_machine.system() =3D=3D 'windows'
>      '@OUTPUT@',
>      get_option('prefix'),
>      meson.current_source_dir(),
> +    config_host['GLIB_BINDIR'],
>      host_machine.cpu(),
>      '--',
>      '-DDISPLAYVERSION=3D' + meson.project_version(),
> diff --git a/scripts/nsis.py b/scripts/nsis.py
> index baa6ef9594..03ed7608a2 100644
> --- a/scripts/nsis.py
> +++ b/scripts/nsis.py
> @@ -18,12 +18,36 @@ def signcode(path):
>          return
>      subprocess.run([cmd, path])
>
> +def find_deps(exe_or_dll, search_path, analyzed_deps):
> +    deps =3D [exe_or_dll]
> +    output =3D subprocess.check_output(["objdump", "-p", exe_or_dll],
> text=3DTrue)
> +    output =3D output.split("\n")
> +    for line in output:
> +        if not line.startswith("\tDLL Name: "):
> +            continue
> +
> +        dep =3D line.split("DLL Name: ")[1].strip()
> +        if dep in analyzed_deps:
> +            continue
> +
> +        dll =3D os.path.join(search_path, dep)
> +        if not os.path.exists(dll):
> +            # assume it's a Windows provided dll, skip it
> +            continue
> +
> +        analyzed_deps.add(dep)
> +        # locate the dll dependencies recursively
> +        rdeps =3D find_deps(dll, search_path, analyzed_deps)
> +        deps.extend(rdeps)
> +
> +    return deps
>
>  def main():
>      parser =3D argparse.ArgumentParser(description=3D"QEMU NSIS build
> helper.")
>      parser.add_argument("outfile")
>      parser.add_argument("prefix")
>      parser.add_argument("srcdir")
> +    parser.add_argument("dlldir")
>      parser.add_argument("cpu")
>      parser.add_argument("nsisargs", nargs=3D"*")
>      args =3D parser.parse_args()
> @@ -63,9 +87,26 @@ def main():
>                  !insertmacro MUI_DESCRIPTION_TEXT ${{Section_{0}}} "{1}"
>                  """.format(arch, desc))
>
> +        search_path =3D args.dlldir
> +        print("Searching '%s' for the dependent dlls ..." % search_path)
> +        dlldir =3D os.path.join(destdir + prefix, "dll")
> +        os.mkdir(dlldir)
> +
>          for exe in glob.glob(os.path.join(destdir + prefix, "*.exe")):
>              signcode(exe)
>
> +            # find all dll dependencies
> +            deps =3D set(find_deps(exe, search_path, set()))
> +            deps.remove(exe)
> +
> +            # copy all dlls to the DLLDIR
> +            for dep in deps:
> +                dllfile =3D os.path.join(dlldir, os.path.basename(dep))
> +                if (os.path.exists(dllfile)):
> +                    continue
> +                print("Copying '%s' to '%s'" % (dep, dllfile))
> +                shutil.copy(dep, dllfile)
> +
>          makensis =3D [
>              "makensis",
>              "-V2",
> @@ -73,12 +114,9 @@ def main():
>              "-DSRCDIR=3D" + args.srcdir,
>              "-DBINDIR=3D" + destdir + prefix,
>          ]
> -        dlldir =3D "w32"
>          if args.cpu =3D=3D "x86_64":
> -            dlldir =3D "w64"
>              makensis +=3D ["-DW64"]
> -        if os.path.exists(os.path.join(args.srcdir, "dll")):
> -            makensis +=3D ["-DDLLDIR=3D{0}/dll/{1}".format(args.srcdir,
> dlldir)]
> +        makensis +=3D ["-DDLLDIR=3D" + dlldir]
>
>          makensis +=3D ["-DOUTFILE=3D" + args.outfile] + args.nsisargs
>          subprocess.run(makensis)
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000007ab09805e82acdb3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><div><br></div><div>(adding S=
tefan Weil in CC, who currently provides Windows installer)</div><div><br><=
/div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Th=
u, Sep 8, 2022 at 5:34 PM Bin Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com=
">bmeng.cn@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">From: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver=
.com" target=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
<br>
At present packaging the required DLLs of QEMU executables is a<br>
manual process, and error prone.<br>
<br>
Actually build/config-host.mak contains a GLIB_BINDIR variable<br>
which is the directory where glib and other DLLs reside. This<br>
works for both Windows native build and cross-build on Linux.<br>
We can use it as the search directory for DLLs and automate<br>
the whole DLL packaging process.<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br></blockquote><div><br></div>=
<div>That seems reasonable to me, although packaging dependencies is not ju=
st about linked DLLs.. There are dynamic stuff, executables, data, legal do=
cs etc etc. I have no clear picture how is everything really packaged in th=
e installer tbh (I would recommend msys2 qemu installation at this point)<b=
r></div><div><br></div><div>anyhow, for the patch, as far as I am concerned=
:<br></div><div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mai=
lto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><=
div><br></div></div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
---<br>
<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0scripts/nsis.py | 46 ++++++++++++++++++++++++++++++++++++++++++----<b=
r>
=C2=A02 files changed, 43 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meson.build b/meson.build<br>
index c2adb7caf4..4c03850f9f 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -3657,6 +3657,7 @@ if host_machine.system() =3D=3D &#39;windows&#39;<br>
=C2=A0 =C2=A0 =C2=A0&#39;@OUTPUT@&#39;,<br>
=C2=A0 =C2=A0 =C2=A0get_option(&#39;prefix&#39;),<br>
=C2=A0 =C2=A0 =C2=A0meson.current_source_dir(),<br>
+=C2=A0 =C2=A0 config_host[&#39;GLIB_BINDIR&#39;],<br>
=C2=A0 =C2=A0 =C2=A0host_machine.cpu(),<br>
=C2=A0 =C2=A0 =C2=A0&#39;--&#39;,<br>
=C2=A0 =C2=A0 =C2=A0&#39;-DDISPLAYVERSION=3D&#39; + meson.project_version()=
,<br>
diff --git a/scripts/nsis.py b/scripts/nsis.py<br>
index baa6ef9594..03ed7608a2 100644<br>
--- a/scripts/nsis.py<br>
+++ b/scripts/nsis.py<br>
@@ -18,12 +18,36 @@ def signcode(path):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
=C2=A0 =C2=A0 =C2=A0subprocess.run([cmd, path])<br>
<br>
+def find_deps(exe_or_dll, search_path, analyzed_deps):<br>
+=C2=A0 =C2=A0 deps =3D [exe_or_dll]<br>
+=C2=A0 =C2=A0 output =3D subprocess.check_output([&quot;objdump&quot;, &qu=
ot;-p&quot;, exe_or_dll], text=3DTrue)<br>
+=C2=A0 =C2=A0 output =3D output.split(&quot;\n&quot;)<br>
+=C2=A0 =C2=A0 for line in output:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not line.startswith(&quot;\tDLL Name: &quot=
;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dep =3D line.split(&quot;DLL Name: &quot;)[1].=
strip()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if dep in analyzed_deps:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dll =3D os.path.join(search_path, dep)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.path.exists(dll):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # assume it&#39;s a Windows prov=
ided dll, skip it<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 analyzed_deps.add(dep)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # locate the dll dependencies recursively<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rdeps =3D find_deps(dll, search_path, analyzed=
_deps)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 deps.extend(rdeps)<br>
+<br>
+=C2=A0 =C2=A0 return deps<br>
<br>
=C2=A0def main():<br>
=C2=A0 =C2=A0 =C2=A0parser =3D argparse.ArgumentParser(description=3D&quot;=
QEMU NSIS build helper.&quot;)<br>
=C2=A0 =C2=A0 =C2=A0parser.add_argument(&quot;outfile&quot;)<br>
=C2=A0 =C2=A0 =C2=A0parser.add_argument(&quot;prefix&quot;)<br>
=C2=A0 =C2=A0 =C2=A0parser.add_argument(&quot;srcdir&quot;)<br>
+=C2=A0 =C2=A0 parser.add_argument(&quot;dlldir&quot;)<br>
=C2=A0 =C2=A0 =C2=A0parser.add_argument(&quot;cpu&quot;)<br>
=C2=A0 =C2=A0 =C2=A0parser.add_argument(&quot;nsisargs&quot;, nargs=3D&quot=
;*&quot;)<br>
=C2=A0 =C2=A0 =C2=A0args =3D parser.parse_args()<br>
@@ -63,9 +87,26 @@ def main():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!insertmacro =
MUI_DESCRIPTION_TEXT ${{Section_{0}}} &quot;{1}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&=
quot;.format(arch, desc))<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 search_path =3D args.dlldir<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&quot;Searching &#39;%s&#39; for the dep=
endent dlls ...&quot; % search_path)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dlldir =3D os.path.join(destdir + prefix, &quo=
t;dll&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.mkdir(dlldir)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for exe in glob.glob(os.path.join(destdir=
 + prefix, &quot;*.exe&quot;)):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0signcode(exe)<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # find all dll dependencies<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 deps =3D set(find_deps(exe, sear=
ch_path, set()))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 deps.remove(exe)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # copy all dlls to the DLLDIR<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for dep in deps:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dllfile =3D os.pat=
h.join(dlldir, os.path.basename(dep))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (os.path.exists=
(dllfile)):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cont=
inue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&quot;Copyin=
g &#39;%s&#39; to &#39;%s&#39;&quot; % (dep, dllfile))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.copy(dep, d=
llfile)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0makensis =3D [<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;makensis&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;-V2&quot;,<br>
@@ -73,12 +114,9 @@ def main():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;-DSRCDIR=3D&quot; + a=
rgs.srcdir,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;-DBINDIR=3D&quot; + d=
estdir + prefix,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dlldir =3D &quot;w32&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if args.cpu =3D=3D &quot;x86_64&quot;:<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dlldir =3D &quot;w64&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0makensis +=3D [&quot;-DW64&=
quot;]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(os.path.join(args.srcdir, &q=
uot;dll&quot;)):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 makensis +=3D [&quot;-DDLLDIR=3D=
{0}/dll/{1}&quot;.format(args.srcdir, dlldir)]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 makensis +=3D [&quot;-DDLLDIR=3D&quot; + dlldi=
r]<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0makensis +=3D [&quot;-DOUTFILE=3D&quot; +=
 args.outfile] + args.nsisargs<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subprocess.run(makensis)<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000007ab09805e82acdb3--

