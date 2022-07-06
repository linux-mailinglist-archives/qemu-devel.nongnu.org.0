Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5702567FC2
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 09:24:12 +0200 (CEST)
Received: from localhost ([::1]:35666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8zON-00071t-P8
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 03:24:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o8zL7-0005F2-Md
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 03:20:51 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:39603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o8zL5-0004La-N0
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 03:20:49 -0400
Received: by mail-lj1-x22f.google.com with SMTP id y18so6459058ljj.6
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 00:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mb5kXXMr6QTRbd+D/JNSeUEibgYn70o6dCbv7qM9ImI=;
 b=efxSHXcIBU1+ogE/QxWNK0lanDSHVqzGE7PvhaL1USLRYaeaExPfPo2kmbMKduavAi
 hlKoE4Q7hXbjjyD/SzJpqVc2i9kS3qpIQ/6i6GXPdXD1uktJst2olfLde5R6/cgBP2fd
 N857m579ZeQnMfz+AXlnp7jeix5vt6pDom1z9Fw36/x1Iqj4uvOaWBoijZy12reRUCeW
 zltpNRhhM1Ul4g+xILPgSzUT45UoecarIbIE4t7DF4cRn9uZA9JP1nOtUxkrWPPkHuC+
 gvF+NhBwL7Be607ETt7aGG4AJIN679kI2GM9oUd/GFrFVNDDACrvIydfNrUx2CgcwUeM
 ksKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mb5kXXMr6QTRbd+D/JNSeUEibgYn70o6dCbv7qM9ImI=;
 b=KnV0BRklUXa7CmVpIQvgbGuhLOhsdc0ls6G/IRA/b1bnh47mq4GsGK1MaO6X4aQzGS
 NjGY5cnvfra8onexRZ76/4DbVPm8704xHiykawFvSFZCmhvbUApQx0+c+yc+XUVlcm05
 s+DX2fKHKkAMnklpnKQzmJmqmkt4+aWnYP4bQsjO4kLY+PauRmX2DZ2zNexxdl8d9FOZ
 jb4J5abIVAQ7tMkgHMVcCCtAM/+lgfW6B7aamalr8uw+DRjgIrIx3z7KO5T5wyIA193/
 /J9X0SJptjqZfmMKz1zuKqIScJHXYggIX+CwT0iBIdNLNEcTQDwEz4VNtgwIQh1OWsl3
 lUIg==
X-Gm-Message-State: AJIora8lEs6nic00RqHsExQRL2IaGWlBBCelJU2/BlG1MPY4lENHryaZ
 +zaoUevTRifQVXQYsk8vGYBl3gCHyzN/27oDay8=
X-Google-Smtp-Source: AGRyM1vVAta6qC26WyRLZf37oE0JyNK3oEuA2q0RfPSnTmwEY1tACJDbXsohcpKRnDxmOG5GH6WZMQ4HrkT8dYG6ukA=
X-Received: by 2002:a05:651c:10aa:b0:25d:2556:e46 with SMTP id
 k10-20020a05651c10aa00b0025d25560e46mr7277710ljn.287.1657092044904; Wed, 06
 Jul 2022 00:20:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220704023618.626849-1-pizhenwei@bytedance.com>
 <20220704023618.626849-2-pizhenwei@bytedance.com>
 <CAJ+F1CKvsDdJsurivOToZue=HsyrXbuRK2hNxA0UjJsKwhCkZA@mail.gmail.com>
 <1b3f926b-9fe6-a3ec-b697-6fa8471510ad@bytedance.com>
 <d43a478f-e54b-e624-8c67-2392bf3d3dbb@bytedance.com>
In-Reply-To: <d43a478f-e54b-e624-8c67-2392bf3d3dbb@bytedance.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 6 Jul 2022 11:20:33 +0400
Message-ID: <CAJ+F1CKpTz4pNKX9XdZER70wrgYkNmHTzhhWB69O1SS1kS-zrg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] qga: add command 'guest-get-cpustats'
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, QEMU <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000b25b5605e31dce3d"
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22f.google.com
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

--000000000000b25b5605e31dce3d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Jul 6, 2022 at 7:09 AM zhenwei pi <pizhenwei@bytedance.com> wrote:

> On 7/4/22 16:00, zhenwei pi wrote:
> >
> >
> >>     +##
> >>     +# @GuestOsType:
> >>     +#
> >>     +# An enumeration of OS type
> >>     +#
> >>     +# Since: 7.1
> >>     +##
> >>     +{ 'enum': 'GuestOsType',
> >>     +  'data': [ 'linuxos', 'windowsos' ] }
> >>
> >>
> >> I would rather keep this enum specific to GuestCpuStats,
> >> "GuestLinuxCpuStatsType"?
> >>
> >
> > Hi,
> >
> > 'GuestOsType' may be re-used in the future, not only for the CPU
> > statistics case.
> >
> >> I would also drop the "os" suffix
> >>
> > I'm afraid we can not drop "os" suffix, build this without "os" suffix:
> > qga/qga-qapi-types.h:948:28: error: expected member name or ';' after
> > declaration specifiers
> >          GuestLinuxCpuStats linux;
> >          ~~~~~~~~~~~~~~~~~~ ^
> > <built-in>:336:15: note: expanded from here
> > #define linux 1
> >
>
> Hi, Marc
>
> Could you please give any hint about this issue?
>

Yes, it looks like we need to add "linux" to the "polluted_words":

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index 489273574aee..737b059e6291 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -114,7 +114,7 @@ def c_name(name: str, protect: bool =3D True) -> str:
                      'and', 'and_eq', 'bitand', 'bitor', 'compl', 'not',
                      'not_eq', 'or', 'or_eq', 'xor', 'xor_eq'])
     # namespace pollution:
-    polluted_words =3D set(['unix', 'errno', 'mips', 'sparc', 'i386'])
+    polluted_words =3D set(['unix', 'errno', 'mips', 'sparc', 'i386',
'linux'])


> >>     +
> >>     +
> >>
> >>
> >>
> >> Looks good to me otherwise.
> >> thanks
> >>
> >> --
> >> Marc-Andr=C3=A9 Lureau
> >
>
> --
> zhenwei pi
>


--=20
Marc-Andr=C3=A9 Lureau

--000000000000b25b5605e31dce3d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 6, 2022 at 7:09 AM zhen=
wei pi &lt;<a href=3D"mailto:pizhenwei@bytedance.com">pizhenwei@bytedance.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On 7/4/22 16:00, zhenwei pi wrote:<br>
&gt; <br>
&gt; <br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +##<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +# @GuestOsType:<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +#<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +# An enumeration of OS type<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +#<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +# Since: 7.1<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +##<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +{ &#39;enum&#39;: &#39;GuestOsType&#39;,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +=C2=A0 &#39;data&#39;: [ &#39;linuxos&#39;, &#=
39;windowsos&#39; ] }<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; I would rather keep this enum specific to GuestCpuStats, <br>
&gt;&gt; &quot;GuestLinuxCpuStatsType&quot;?<br>
&gt;&gt;<br>
&gt; <br>
&gt; Hi,<br>
&gt; <br>
&gt; &#39;GuestOsType&#39; may be re-used in the future, not only for the C=
PU <br>
&gt; statistics case.<br>
&gt; <br>
&gt;&gt; I would also drop the &quot;os&quot; suffix<br>
&gt;&gt;<br>
&gt; I&#39;m afraid we can not drop &quot;os&quot; suffix, build this witho=
ut &quot;os&quot; suffix:<br>
&gt; qga/qga-qapi-types.h:948:28: error: expected member name or &#39;;&#39=
; after <br>
&gt; declaration specifiers<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GuestLinuxCpuStats li=
nux;<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ~~~~~~~~~~~~~~~~~~ ^<=
br>
&gt; &lt;built-in&gt;:336:15: note: expanded from here<br>
&gt; #define linux 1<br>
&gt; <br>
<br>
Hi, Marc<br>
<br>
Could you please give any hint about this issue?<br></blockquote><div><br><=
/div><div>Yes, it looks like we need to add &quot;linux&quot; to the &quot;=
polluted_words&quot;:</div><div><br></div><div>diff --git a/scripts/qapi/co=
mmon.py b/scripts/qapi/common.py<br>index 489273574aee..737b059e6291 100644=
<br>--- a/scripts/qapi/common.py<br>+++ b/scripts/qapi/common.py<br>@@ -114=
,7 +114,7 @@ def c_name(name: str, protect: bool =3D True) -&gt; str:<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &#39;and&#39;, &#39;and_eq&#39;, &#39;bitand&#39;, &#39;bitor&#39;, &#3=
9;compl&#39;, &#39;not&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;not_eq&#39;, &#39;or&#39;, &#39;or_=
eq&#39;, &#39;xor&#39;, &#39;xor_eq&#39;])<br>=C2=A0 =C2=A0 =C2=A0# namespa=
ce pollution:<br>- =C2=A0 =C2=A0polluted_words =3D set([&#39;unix&#39;, &#3=
9;errno&#39;, &#39;mips&#39;, &#39;sparc&#39;, &#39;i386&#39;])<br>+ =C2=A0=
 =C2=A0polluted_words =3D set([&#39;unix&#39;, &#39;errno&#39;, &#39;mips&#=
39;, &#39;sparc&#39;, &#39;i386&#39;, &#39;linux&#39;])</div><div><br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 +<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Looks good to me otherwise.<br>
&gt;&gt; thanks<br>
&gt;&gt;<br>
&gt;&gt; -- <br>
&gt;&gt; Marc-Andr=C3=A9 Lureau<br>
&gt; <br>
<br>
-- <br>
zhenwei pi<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000b25b5605e31dce3d--

