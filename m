Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C27C868CD80
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 04:36:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPElS-0003IA-LA; Mon, 06 Feb 2023 22:35:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinahbaum123@gmail.com>)
 id 1pPEl9-0003GF-Ot; Mon, 06 Feb 2023 22:35:16 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dinahbaum123@gmail.com>)
 id 1pPEl5-0005U5-Oy; Mon, 06 Feb 2023 22:35:06 -0500
Received: by mail-ed1-x531.google.com with SMTP id a10so6692827edu.9;
 Mon, 06 Feb 2023 19:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gRFUdP51GTFaYZ8nZWZkSAP/oT3KomCIgYO43qNr7Yg=;
 b=UaAPjxNS4NBsLvS/GA2xgfERW8zvKOM+0WAmH1TqKCn8qSyITup9HutiWgYCKPJJeb
 jHVhKp9wJdAU8YKya7VhoEmvNMwDGSI+HMfYBJ/elHPyEOb36RUurWWH+EY3f0msMr/U
 SW+plzGm4qBs5Mr4ZeghSdncp3ZIU3epTEuq/3fUgI8EDtc9U21zSvJ3gqfBVDRPKbbr
 V85z08MAtu8pFi2VBZDU+xgVTDOeJ7kxLGV9ApFX2XZFAezXmepRuK4/A8Z6G6Zk9pl1
 SBe0teQbjJ8URuXdEvKi7jfMe5tBGV3AJ962LocSQe/hnuPbMgvKYCgFFMdHOrlK4Kcw
 4qwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gRFUdP51GTFaYZ8nZWZkSAP/oT3KomCIgYO43qNr7Yg=;
 b=scsVbaf6xw76qBTBbt0a4IqRIAvB0+UmM7t7VAjNRu0nLA/E5w2BNzQ8I1ROy2a9G2
 nKPJu6C7wvHH2yluphax0sdF0yA5QUcN5i7XAVFLLaL4FW3xOQief0iuC2K/wGRQ++Sa
 HwSc6sfey/BaV1pa5RiqEw2GpLQ7nqnqOpin26WdACtStC067ZmvSAXlo6amtCyItURO
 xkHWWfSMLidhdnbp6Pw8cOiUpE1+ctzhyL2DQjWqBnS6kWap8NVfSpAGzq/jmdqLdV1F
 6CutYrQam6c55eEyWu/tVs+FaGvTT9f6goMg0F9aFRSVmAKCLPsUtSxY3o+A5iF4gmEn
 kuXw==
X-Gm-Message-State: AO0yUKUiCBR+w8sHP3MlPro/cgUpS4O1tgy5ID1tuANKIawD7GQMKu9E
 lr3Ixdvbv4bw48ttEjRmGtPdx6CKo3q5I0Moh98=
X-Google-Smtp-Source: AK7set9ZJ2CEEB1Qh6AZx57TsN/Zn27Ob7c8V5d29VvMdSBuu4D7CGBGLHQSPeqGT7A4SaYMHe8AuSdYjnYUiMyVVpE=
X-Received: by 2002:a50:d693:0:b0:4aa:a561:eea6 with SMTP id
 r19-20020a50d693000000b004aaa561eea6mr538259edi.24.1675740900689; Mon, 06 Feb
 2023 19:35:00 -0800 (PST)
MIME-Version: 1.0
References: <20230205052636.11822-1-dinahbaum123@gmail.com>
 <CAFEAcA_HJZwfZBQT_dQ0Fv+q63yQ3cwK1nShwHAKuR5m4y91jw@mail.gmail.com>
In-Reply-To: <CAFEAcA_HJZwfZBQT_dQ0Fv+q63yQ3cwK1nShwHAKuR5m4y91jw@mail.gmail.com>
From: Dinah B <dinahbaum123@gmail.com>
Date: Mon, 6 Feb 2023 22:34:49 -0500
Message-ID: <CAH50XRekY1xm7g0uB=3hfyyh3zABSxdzZ5SBs4Pi=KBrMGv9iQ@mail.gmail.com>
Subject: Re: [PATCH] configure: Add 'mkdir build' check
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000001f0c0a05f413d5a0"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=dinahbaum123@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--0000000000001f0c0a05f413d5a0
Content-Type: text/plain; charset="UTF-8"

Hi, thanks for the feedback - I'll revise it. Small question - Paolo
Bonzini specified that 'configure --help' should work even if the build
doesn't.
Currently the script functions that handle argument reading aren't
initialized or run until after the build is done, so if the build fails, so
do they.
I see 2 paths forward:
1. Code motion them to be initialized and run before we check for the build
directory
2. Break them into a helper script and load them in the main configure
script before we check for the build directory
Is one of these options preferable to the other?

On Mon, Feb 6, 2023 at 9:42 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Sun, 5 Feb 2023 at 07:44, Dinah Baum <dinahbaum123@gmail.com> wrote:
> >
> > QEMU configure script goes into an infinite error printing loop
> > when in read only directory due to 'build' dir never being created.
> >
> > Checking if 'mkdir dir' succeeds and if the directory is
> > writeable prevents this error.
> >
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/321
> >
> > Signed-off-by: Dinah Baum <dinahbaum123@gmail.com>
>
> Hi; thanks for sending this patch.
>
> > ---
> >  configure | 37 ++++++++++++++++++++++++++++++-------
> >  1 file changed, 30 insertions(+), 7 deletions(-)
> >
> > diff --git a/configure b/configure
> > index 64960c6000..fe9028991f 100755
> > --- a/configure
> > +++ b/configure
> > @@ -32,9 +32,11 @@ then
> >      fi
> >
> >      mkdir build
> > -    touch $MARKER
> > +    if [ -d build ] && [ -w build ]
> > +    then
> > +        touch $MARKER
>
> It would be more straightforward to check whether
> the 'mkdir' and 'touch' commands succeed, I think.
>
> >
> > -    cat > GNUmakefile <<'EOF'
> > +        cat > GNUmakefile <<'EOF'
> >  # This file is auto-generated by configure to support in-source tree
> >  # 'make' command invocation
> >
> > @@ -56,8 +58,15 @@ force: ;
> >  GNUmakefile: ;
> >
> >  EOF
> > -    cd build
> > -    exec "$source_path/configure" "$@"
> > +        cd build
> > +        exec "$source_path/configure" "$@"
> > +    elif ! [ -d build ]
> > +    then
> > +        echo "ERROR: Unable to create ./build dir, try using a
> ../qemu/configure build"
> > +    elif ! [ -w build ]
> > +    then
> > +        echo "ERROR: ./build dir not writeable, try using a
> ../qemu/configure build"
> > +    fi
>
> If these are errors, we should exit immediately, not
> continue further trying to run code.
>
> >  fi
> >
> >  # Temporary directory used for files created while
> > @@ -181,9 +190,12 @@ compile_prog() {
> >
> >  # symbolically link $1 to $2.  Portable version of "ln -sf".
> >  symlink() {
> > -  rm -rf "$2"
> > -  mkdir -p "$(dirname "$2")"
> > -  ln -s "$1" "$2"
> > +  if [ -d $source_path/build ] && [ -w $source_path/build ]
> > +  then
> > +      rm -rf "$2"
> > +      mkdir -p "$(dirname "$2")"
> > +      ln -s "$1" "$2"
> > +  fi
>
> The symlink function is a utility one used in various
> places in the code. It may be used for other directories
> than $source_path/build. If we need to better handle
> errors here then we should do that by checking the
> exit status of the commands (and probably passing the
> return status back up for the caller to look at).
>
> But there's a lot of code in configure that assumes it
> can write to the destination directory elsewhere too,
> so why change this function specifically ?
>
> >  }
> >
> >  # check whether a command is available to this shell (may be either an
> > @@ -2287,7 +2299,18 @@ fi
> >  #######################################
> >  # generate config-host.mak
> >
> > +if ! [ -d $source_path/build ] || ! [ -w $source_path/build ]
>
> You can't assume that the build dir is always $source_path/build
> -- that's just the default if the user ran configure from
> the source directory.
>
> > +then
> > +    echo "ERROR: ./build dir unusable, exiting"
> > +    # cleanup
> > +    rm -f config.log
> > +    rm -f Makefile.prereqs
> > +    rm -r "$TMPDIR1"
> > +    exit 1
>
> Most of these haven't been created at this point, so don't
> need to be deleted. (If you do the error-exit earlier,
> as I suggest, then this is clearer.)
>
> > +fi
> > +
> >  if ! (GIT="$git" "$source_path/scripts/git-submodule.sh"
> "$git_submodules_action" "$git_submodules"); then
> > +    echo "BAD"
> >      exit 1
> >  fi
>
> thanks
> -- PMM
>

--0000000000001f0c0a05f413d5a0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi, thanks for the feedback - I&#39;ll revise it. Sma=
ll question - Paolo Bonzini specified that &#39;configure --help&#39; shoul=
d work even if the build doesn&#39;t.<br></div><div>Currently the script fu=
nctions that handle argument reading aren&#39;t initialized or run until af=
ter the build is done, so if the build fails, so do they.</div><div>I see 2=
 paths forward:</div><div>1. Code motion them to be initialized and run bef=
ore we check for the build directory<br></div><div>2. Break them into a hel=
per script and load them in the main configure script before we check for t=
he build directory</div><div>Is one of these options preferable to the othe=
r?<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Mon, Feb 6, 2023 at 9:42 AM Peter Maydell &lt;<a href=3D"mai=
lto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">On Sun, 5 Feb 2023 at=
 07:44, Dinah Baum &lt;<a href=3D"mailto:dinahbaum123@gmail.com" target=3D"=
_blank">dinahbaum123@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; QEMU configure script goes into an infinite error printing loop<br>
&gt; when in read only directory due to &#39;build&#39; dir never being cre=
ated.<br>
&gt;<br>
&gt; Checking if &#39;mkdir dir&#39; succeeds and if the directory is<br>
&gt; writeable prevents this error.<br>
&gt;<br>
&gt; Resolves: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/321=
" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu=
/-/issues/321</a><br>
&gt;<br>
&gt; Signed-off-by: Dinah Baum &lt;<a href=3D"mailto:dinahbaum123@gmail.com=
" target=3D"_blank">dinahbaum123@gmail.com</a>&gt;<br>
<br>
Hi; thanks for sending this patch.<br>
<br>
&gt; ---<br>
&gt;=C2=A0 configure | 37 ++++++++++++++++++++++++++++++-------<br>
&gt;=C2=A0 1 file changed, 30 insertions(+), 7 deletions(-)<br>
&gt;<br>
&gt; diff --git a/configure b/configure<br>
&gt; index 64960c6000..fe9028991f 100755<br>
&gt; --- a/configure<br>
&gt; +++ b/configure<br>
&gt; @@ -32,9 +32,11 @@ then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mkdir build<br>
&gt; -=C2=A0 =C2=A0 touch $MARKER<br>
&gt; +=C2=A0 =C2=A0 if [ -d build ] &amp;&amp; [ -w build ]<br>
&gt; +=C2=A0 =C2=A0 then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 touch $MARKER<br>
<br>
It would be more straightforward to check whether<br>
the &#39;mkdir&#39; and &#39;touch&#39; commands succeed, I think.<br>
<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 cat &gt; GNUmakefile &lt;&lt;&#39;EOF&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cat &gt; GNUmakefile &lt;&lt;&#39;EOF&#39=
;<br>
&gt;=C2=A0 # This file is auto-generated by configure to support in-source =
tree<br>
&gt;=C2=A0 # &#39;make&#39; command invocation<br>
&gt;<br>
&gt; @@ -56,8 +58,15 @@ force: ;<br>
&gt;=C2=A0 GNUmakefile: ;<br>
&gt;<br>
&gt;=C2=A0 EOF<br>
&gt; -=C2=A0 =C2=A0 cd build<br>
&gt; -=C2=A0 =C2=A0 exec &quot;$source_path/configure&quot; &quot;$@&quot;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd build<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 exec &quot;$source_path/configure&quot; &=
quot;$@&quot;<br>
&gt; +=C2=A0 =C2=A0 elif ! [ -d build ]<br>
&gt; +=C2=A0 =C2=A0 then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;ERROR: Unable to create ./buil=
d dir, try using a ../qemu/configure build&quot;<br>
&gt; +=C2=A0 =C2=A0 elif ! [ -w build ]<br>
&gt; +=C2=A0 =C2=A0 then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;ERROR: ./build dir not writeab=
le, try using a ../qemu/configure build&quot;<br>
&gt; +=C2=A0 =C2=A0 fi<br>
<br>
If these are errors, we should exit immediately, not<br>
continue further trying to run code.<br>
<br>
&gt;=C2=A0 fi<br>
&gt;<br>
&gt;=C2=A0 # Temporary directory used for files created while<br>
&gt; @@ -181,9 +190,12 @@ compile_prog() {<br>
&gt;<br>
&gt;=C2=A0 # symbolically link $1 to $2.=C2=A0 Portable version of &quot;ln=
 -sf&quot;.<br>
&gt;=C2=A0 symlink() {<br>
&gt; -=C2=A0 rm -rf &quot;$2&quot;<br>
&gt; -=C2=A0 mkdir -p &quot;$(dirname &quot;$2&quot;)&quot;<br>
&gt; -=C2=A0 ln -s &quot;$1&quot; &quot;$2&quot;<br>
&gt; +=C2=A0 if [ -d $source_path/build ] &amp;&amp; [ -w $source_path/buil=
d ]<br>
&gt; +=C2=A0 then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 rm -rf &quot;$2&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 mkdir -p &quot;$(dirname &quot;$2&quot;)&quot;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 ln -s &quot;$1&quot; &quot;$2&quot;<br>
&gt; +=C2=A0 fi<br>
<br>
The symlink function is a utility one used in various<br>
places in the code. It may be used for other directories<br>
than $source_path/build. If we need to better handle<br>
errors here then we should do that by checking the<br>
exit status of the commands (and probably passing the<br>
return status back up for the caller to look at).<br>
<br>
But there&#39;s a lot of code in configure that assumes it<br>
can write to the destination directory elsewhere too,<br>
so why change this function specifically ?<br>
<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 # check whether a command is available to this shell (may be eit=
her an<br>
&gt; @@ -2287,7 +2299,18 @@ fi<br>
&gt;=C2=A0 #######################################<br>
&gt;=C2=A0 # generate config-host.mak<br>
&gt;<br>
&gt; +if ! [ -d $source_path/build ] || ! [ -w $source_path/build ]<br>
<br>
You can&#39;t assume that the build dir is always $source_path/build<br>
-- that&#39;s just the default if the user ran configure from<br>
the source directory.<br>
<br>
&gt; +then<br>
&gt; +=C2=A0 =C2=A0 echo &quot;ERROR: ./build dir unusable, exiting&quot;<b=
r>
&gt; +=C2=A0 =C2=A0 # cleanup<br>
&gt; +=C2=A0 =C2=A0 rm -f config.log<br>
&gt; +=C2=A0 =C2=A0 rm -f Makefile.prereqs<br>
&gt; +=C2=A0 =C2=A0 rm -r &quot;$TMPDIR1&quot;<br>
&gt; +=C2=A0 =C2=A0 exit 1<br>
<br>
Most of these haven&#39;t been created at this point, so don&#39;t<br>
need to be deleted. (If you do the error-exit earlier,<br>
as I suggest, then this is clearer.)<br>
<br>
&gt; +fi<br>
&gt; +<br>
&gt;=C2=A0 if ! (GIT=3D&quot;$git&quot; &quot;$source_path/scripts/git-subm=
odule.sh&quot; &quot;$git_submodules_action&quot; &quot;$git_submodules&quo=
t;); then<br>
&gt; +=C2=A0 =C2=A0 echo &quot;BAD&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 exit 1<br>
&gt;=C2=A0 fi<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--0000000000001f0c0a05f413d5a0--

