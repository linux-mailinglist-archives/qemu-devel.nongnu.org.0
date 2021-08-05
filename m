Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C01883E1720
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 16:42:27 +0200 (CEST)
Received: from localhost ([::1]:33320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBeZm-0000hJ-RG
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 10:42:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mBeYm-0007lo-Ut
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 10:41:24 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:45731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mBeYh-000623-Fk
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 10:41:24 -0400
Received: by mail-ej1-x636.google.com with SMTP id qk33so9952399ejc.12
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 07:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/sFGa8EcWidiSrSCFm1qgK3qP6rB/iHtns3grliPn9A=;
 b=W9OqkeHdAtZPoW00LJ0BuhFcLVypBSQzYaOg1FfYWaxyohQGfe0XhKj9cU+0874NCG
 k9+ooneVK2+ugMlAsNH2DlcQzF5YBXOnqVTDibHweQbWj/QVMfZ79CTG7pIsA88ReFfj
 J76ARf2xZs+tByrH4rjTTeSoI2evuQckrMf/FL11rS9gMlVBjq/FQyFAUKiBk/XHyHPe
 yC7aUppQ9Psk/96+bDeOxV0gQrDEgnSJrRzFBVJOusUEQ52zoJtaqkxEIvXJ997B6SUl
 m+X7gHqwfQ+tQzo9udkDBBavEU1Yd7dZrMXXsmgGQlCo6g04kBkPoaBsd2m2X2G90Ajg
 pcNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/sFGa8EcWidiSrSCFm1qgK3qP6rB/iHtns3grliPn9A=;
 b=qqF/kaRqONW1gExMHHWfaNVe0q4VJbzSCd+Jox5fJqfy+GxR0YonyIADPz4ye/th4a
 4V570Lenx0fTrfz/qCQ8kld4PjJHbcpXQUz/xAgu5nyQJU27VuYw0Vy2PCW1avMSeU/o
 9Hz+l3GooXgzLjF+Gu3K3Ki29490sBIR9wu68kRCNvSUJbVjGhyA5XWNuzApjhQYU72d
 6LU+5WTtVsfN4nfdLQV7SJMsWVX6l5Y2jFH14mVCNcoahi2N3ScdPls2sl4Zvs4yk3cX
 16Au36QRWIIHziSnwcBBrnEVHjaQPjNnVa2nzBZLeFP+0g/ydASS8E+86rzjC7CSJrv4
 1zEg==
X-Gm-Message-State: AOAM533o2AsV0+YSuug3CYrf5Mmn4npkzg2NUknQJCfiK/SQu/VsqwVF
 k+PHWDZR6eWzX+mePhnPF8t3mAz7m6cfVABc0wQ=
X-Google-Smtp-Source: ABdhPJw0tPdYdAXRuc4kGK6qXU1mW+e1w5aE5XpdPfQoPZn+PAaxAns3wmljjdVqqP+x0ZYW0lmQvZgfMOQKgyNDCtg=
X-Received: by 2002:a17:906:3a58:: with SMTP id
 a24mr5196662ejf.109.1628174477750; 
 Thu, 05 Aug 2021 07:41:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210804083105.97531-1-marcandre.lureau@redhat.com>
 <20210804083105.97531-9-marcandre.lureau@redhat.com>
 <87lf5g6lly.fsf@dusky.pond.sub.org>
In-Reply-To: <87lf5g6lly.fsf@dusky.pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 5 Aug 2021 18:41:06 +0400
Message-ID: <CAJ+F1CL_a8nH-sNBxEY2zVUd1rG7QnevwQPraG69KWjFGUb5CQ@mail.gmail.com>
Subject: Re: [PATCH v7 08/10] qapi: Use 'if': { 'any': ... } where appropriate
To: Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000060f54c05c8d0e95b"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: John Snow <jsnow@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000060f54c05c8d0e95b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Aug 5, 2021 at 5:57 PM Markus Armbruster <armbru@redhat.com> wrote:

> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > Tested-by: John Snow <jsnow@redhat.com>
> > Reviewed-by: Markus Armbruster <armbru@redhat.com>
> > ---
> >  qapi/machine-target.json | 20 ++++++++++++++++----
> >  qapi/misc-target.json    | 12 +++++++++++-
> >  2 files changed, 27 insertions(+), 5 deletions(-)
> >
> > diff --git a/qapi/machine-target.json b/qapi/machine-target.json
> > index e7811654b7..9b56b81bea 100644
> > --- a/qapi/machine-target.json
> > +++ b/qapi/machine-target.json
> > @@ -213,7 +213,9 @@
> >  ##
> >  { 'struct': 'CpuModelExpansionInfo',
> >    'data': { 'model': 'CpuModelInfo' },
> > -  'if': 'defined(TARGET_S390X) || defined(TARGET_I386) ||
> defined(TARGET_ARM)' }
> > +  'if': { 'any': [ 'defined(TARGET_S390X)',
> > +                   'defined(TARGET_I386)',
> > +                   'defined(TARGET_ARM)'] } }
> >
> >  ##
> >  # @query-cpu-model-expansion:
> > @@ -252,7 +254,9 @@
> >    'data': { 'type': 'CpuModelExpansionType',
> >              'model': 'CpuModelInfo' },
> >    'returns': 'CpuModelExpansionInfo',
> > -  'if': 'defined(TARGET_S390X) || defined(TARGET_I386) ||
> defined(TARGET_ARM)' }
> > +  'if': { 'any': [ 'defined(TARGET_S390X)',
> > +                   'defined(TARGET_I386)',
> > +                   'defined(TARGET_ARM)' ] } }
> >
> >  ##
> >  # @CpuDefinitionInfo:
> > @@ -316,7 +320,11 @@
> >              'typename': 'str',
> >              '*alias-of' : 'str',
> >              'deprecated' : 'bool' },
> > -  'if': 'defined(TARGET_PPC) || defined(TARGET_ARM) ||
> defined(TARGET_I386) || defined(TARGET_S390X) || defined(TARGET_MIPS)' }
> > +  'if': { 'any': [ 'defined(TARGET_PPC)',
> > +                   'defined(TARGET_ARM)',
> > +                   'defined(TARGET_I386)',
> > +                   'defined(TARGET_S390X)',
> > +                   'defined(TARGET_MIPS)' ] } }
> >
> >  ##
> >  # @query-cpu-definitions:
> > @@ -328,4 +336,8 @@
> >  # Since: 1.2
> >  ##
> >  { 'command': 'query-cpu-definitions', 'returns': ['CpuDefinitionInfo']=
,
> > -  'if': 'defined(TARGET_PPC) || defined(TARGET_ARM) ||
> defined(TARGET_I386) || defined(TARGET_S390X) || defined(TARGET_MIPS)' }
> > +  'if': { 'any': [ 'defined(TARGET_PPC)',
> > +                   'defined(TARGET_ARM)',
> > +                   'defined(TARGET_I386)',
> > +                   'defined(TARGET_S390X)',
> > +                   'defined(TARGET_MIPS)' ] } }
> > diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> > index 5573dcf8f0..9e2ea4a04a 100644
> > --- a/qapi/misc-target.json
> > +++ b/qapi/misc-target.json
> > @@ -23,7 +23,17 @@
> >  ##
> >  { 'event': 'RTC_CHANGE',
> >    'data': { 'offset': 'int' },
> > -  'if': 'defined(TARGET_ALPHA) || defined(TARGET_ARM) ||
> defined(TARGET_HPPA) || defined(TARGET_I386) || defined(TARGET_MIPS) ||
> defined(TARGET_MIPS64) || defined(TARGET_PPC) || defined(TARGET_PPC64) ||
> defined(TARGET_S390X) || defined(TARGET_SH4) || defined(TARGET_SPARC)' }
> > +  'if': { 'any': [ 'defined(TARGET_ALPHA)',
> > +                   'defined(TARGET_ARM)',
> > +                   'defined(TARGET_HPPA)',
> > +                   'defined(TARGET_I386)',
> > +                   'defined(TARGET_MIPS)',
> > +                   'defined(TARGET_MIPS64)',
> > +                   'defined(TARGET_PPC)',
> > +                   'defined(TARGET_PPC64)',
> > +                   'defined(TARGET_S390X)',
> > +                   'defined(TARGET_SH4)',
> > +                   'defined(TARGET_SPARC)' ] } }
> >
> >  ##
> >  # @rtc-reset-reinjection:
>
> Missing:
>
>   diff --git a/qapi/ui.json b/qapi/ui.json
>   index fd9677d48e..aed2bec4ab 100644
>   --- a/qapi/ui.json
>   +++ b/qapi/ui.json
>   @@ -1136,7 +1136,8 @@
>        { 'name': 'gtk', 'if': 'defined(CONFIG_GTK)' },
>        { 'name': 'sdl', 'if': 'defined(CONFIG_SDL)' },
>        { 'name': 'egl-headless',
>   -              'if': 'defined(CONFIG_OPENGL) && defined(CONFIG_GBM)' },
>   +              'if': { 'all': [ 'defined(CONFIG_OPENGL)',
>   +                               'defined(CONFIG_GBM)' ] } },
>        { 'name': 'curses', 'if': 'defined(CONFIG_CURSES)' },
>        { 'name': 'cocoa', 'if': 'defined(CONFIG_COCOA)' },
>        { 'name': 'spice-app', 'if': 'defined(CONFIG_SPICE)'} ] }
>   @@ -1167,7 +1168,8 @@
>          'gtk': { 'type': 'DisplayGTK', 'if': 'defined(CONFIG_GTK)' },
>          'curses': { 'type': 'DisplayCurses', 'if':
> 'defined(CONFIG_CURSES)' },
>          'egl-headless': { 'type': 'DisplayEGLHeadless',
>   -                        'if': 'defined(CONFIG_OPENGL) &&
> defined(CONFIG_GBM)' }
>   +                        'if': { 'all': [ 'defined(CONFIG_OPENGL)',
>   +                                         'defined(CONFIG_GBM)' ] } }
>      }
>    }
>
>
> You make up for it in PATCH 10.  Can tidy up in my tree.
>
>
Ah yes, those are new in the rebase. I think they could either be squashed
in this patch (with update title), or a new patch. Leaving to the last
patch isn't really a big issue either I suppose.

Thanks in advance for cleaning it up if you take it :)


--=20
Marc-Andr=C3=A9 Lureau

--00000000000060f54c05c8d0e95b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 5, 2021 at 5:57 PM Mark=
us Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><a =
href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lur=
eau@redhat.com</a> writes:<br>
<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; Reviewed-by: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com=
" target=3D"_blank">stefanha@redhat.com</a>&gt;<br>
&gt; Tested-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D=
"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; Reviewed-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com=
" target=3D"_blank">armbru@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 qapi/machine-target.json | 20 ++++++++++++++++----<br>
&gt;=C2=A0 qapi/misc-target.json=C2=A0 =C2=A0 | 12 +++++++++++-<br>
&gt;=C2=A0 2 files changed, 27 insertions(+), 5 deletions(-)<br>
&gt;<br>
&gt; diff --git a/qapi/machine-target.json b/qapi/machine-target.json<br>
&gt; index e7811654b7..9b56b81bea 100644<br>
&gt; --- a/qapi/machine-target.json<br>
&gt; +++ b/qapi/machine-target.json<br>
&gt; @@ -213,7 +213,9 @@<br>
&gt;=C2=A0 ##<br>
&gt;=C2=A0 { &#39;struct&#39;: &#39;CpuModelExpansionInfo&#39;,<br>
&gt;=C2=A0 =C2=A0 &#39;data&#39;: { &#39;model&#39;: &#39;CpuModelInfo&#39;=
 },<br>
&gt; -=C2=A0 &#39;if&#39;: &#39;defined(TARGET_S390X) || defined(TARGET_I38=
6) || defined(TARGET_ARM)&#39; }<br>
&gt; +=C2=A0 &#39;if&#39;: { &#39;any&#39;: [ &#39;defined(TARGET_S390X)&#3=
9;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;defined(TARGET_I386)&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;defined(TARGET_ARM)&#39;] } }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 ##<br>
&gt;=C2=A0 # @query-cpu-model-expansion:<br>
&gt; @@ -252,7 +254,9 @@<br>
&gt;=C2=A0 =C2=A0 &#39;data&#39;: { &#39;type&#39;: &#39;CpuModelExpansionT=
ype&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;model&#39;: &#39;=
CpuModelInfo&#39; },<br>
&gt;=C2=A0 =C2=A0 &#39;returns&#39;: &#39;CpuModelExpansionInfo&#39;,<br>
&gt; -=C2=A0 &#39;if&#39;: &#39;defined(TARGET_S390X) || defined(TARGET_I38=
6) || defined(TARGET_ARM)&#39; }<br>
&gt; +=C2=A0 &#39;if&#39;: { &#39;any&#39;: [ &#39;defined(TARGET_S390X)&#3=
9;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;defined(TARGET_I386)&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;defined(TARGET_ARM)&#39; ] } }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 ##<br>
&gt;=C2=A0 # @CpuDefinitionInfo:<br>
&gt; @@ -316,7 +320,11 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;typename&#39;: &#=
39;str&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*alias-of&#39; : =
&#39;str&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;deprecated&#39; :=
 &#39;bool&#39; },<br>
&gt; -=C2=A0 &#39;if&#39;: &#39;defined(TARGET_PPC) || defined(TARGET_ARM) =
|| defined(TARGET_I386) || defined(TARGET_S390X) || defined(TARGET_MIPS)&#3=
9; }<br>
&gt; +=C2=A0 &#39;if&#39;: { &#39;any&#39;: [ &#39;defined(TARGET_PPC)&#39;=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;defined(TARGET_ARM)&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;defined(TARGET_I386)&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;defined(TARGET_S390X)&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;defined(TARGET_MIPS)&#39; ] } }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 ##<br>
&gt;=C2=A0 # @query-cpu-definitions:<br>
&gt; @@ -328,4 +336,8 @@<br>
&gt;=C2=A0 # Since: 1.2<br>
&gt;=C2=A0 ##<br>
&gt;=C2=A0 { &#39;command&#39;: &#39;query-cpu-definitions&#39;, &#39;retur=
ns&#39;: [&#39;CpuDefinitionInfo&#39;],<br>
&gt; -=C2=A0 &#39;if&#39;: &#39;defined(TARGET_PPC) || defined(TARGET_ARM) =
|| defined(TARGET_I386) || defined(TARGET_S390X) || defined(TARGET_MIPS)&#3=
9; }<br>
&gt; +=C2=A0 &#39;if&#39;: { &#39;any&#39;: [ &#39;defined(TARGET_PPC)&#39;=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;defined(TARGET_ARM)&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;defined(TARGET_I386)&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;defined(TARGET_S390X)&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;defined(TARGET_MIPS)&#39; ] } }<br>
&gt; diff --git a/qapi/misc-target.json b/qapi/misc-target.json<br>
&gt; index 5573dcf8f0..9e2ea4a04a 100644<br>
&gt; --- a/qapi/misc-target.json<br>
&gt; +++ b/qapi/misc-target.json<br>
&gt; @@ -23,7 +23,17 @@<br>
&gt;=C2=A0 ##<br>
&gt;=C2=A0 { &#39;event&#39;: &#39;RTC_CHANGE&#39;,<br>
&gt;=C2=A0 =C2=A0 &#39;data&#39;: { &#39;offset&#39;: &#39;int&#39; },<br>
&gt; -=C2=A0 &#39;if&#39;: &#39;defined(TARGET_ALPHA) || defined(TARGET_ARM=
) || defined(TARGET_HPPA) || defined(TARGET_I386) || defined(TARGET_MIPS) |=
| defined(TARGET_MIPS64) || defined(TARGET_PPC) || defined(TARGET_PPC64) ||=
 defined(TARGET_S390X) || defined(TARGET_SH4) || defined(TARGET_SPARC)&#39;=
 }<br>
&gt; +=C2=A0 &#39;if&#39;: { &#39;any&#39;: [ &#39;defined(TARGET_ALPHA)&#3=
9;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;defined(TARGET_ARM)&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;defined(TARGET_HPPA)&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;defined(TARGET_I386)&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;defined(TARGET_MIPS)&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;defined(TARGET_MIPS64)&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;defined(TARGET_PPC)&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;defined(TARGET_PPC64)&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;defined(TARGET_S390X)&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;defined(TARGET_SH4)&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;defined(TARGET_SPARC)&#39; ] } }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 ##<br>
&gt;=C2=A0 # @rtc-reset-reinjection:<br>
<br>
Missing:<br>
<br>
=C2=A0 diff --git a/qapi/ui.json b/qapi/ui.json<br>
=C2=A0 index fd9677d48e..aed2bec4ab 100644<br>
=C2=A0 --- a/qapi/ui.json<br>
=C2=A0 +++ b/qapi/ui.json<br>
=C2=A0 @@ -1136,7 +1136,8 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &#39;name&#39;: &#39;gtk&#39;, &#39;if&#39;: &=
#39;defined(CONFIG_GTK)&#39; },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &#39;name&#39;: &#39;sdl&#39;, &#39;if&#39;: &=
#39;defined(CONFIG_SDL)&#39; },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &#39;name&#39;: &#39;egl-headless&#39;,<br>
=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;if&#39;: &#39=
;defined(CONFIG_OPENGL) &amp;&amp; defined(CONFIG_GBM)&#39; },<br>
=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;if&#39;: { &#=
39;all&#39;: [ &#39;defined(CONFIG_OPENGL)&#39;,<br>
=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;defined(CONFIG_GBM)&#39; =
] } },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &#39;name&#39;: &#39;curses&#39;, &#39;if&#39;=
: &#39;defined(CONFIG_CURSES)&#39; },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &#39;name&#39;: &#39;cocoa&#39;, &#39;if&#39;:=
 &#39;defined(CONFIG_COCOA)&#39; },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &#39;name&#39;: &#39;spice-app&#39;, &#39;if&#=
39;: &#39;defined(CONFIG_SPICE)&#39;} ] }<br>
=C2=A0 @@ -1167,7 +1168,8 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;gtk&#39;: { &#39;type&#39;: &#39;Dis=
playGTK&#39;, &#39;if&#39;: &#39;defined(CONFIG_GTK)&#39; },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;curses&#39;: { &#39;type&#39;: &#39;=
DisplayCurses&#39;, &#39;if&#39;: &#39;defined(CONFIG_CURSES)&#39; },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;egl-headless&#39;: { &#39;type&#39;:=
 &#39;DisplayEGLHeadless&#39;,<br>
=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &#39;if&#39;: &#39;defined(CONFIG_OPENGL) &amp;&amp; defi=
ned(CONFIG_GBM)&#39; }<br>
=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &#39;if&#39;: { &#39;all&#39;: [ &#39;defined(CONFIG_OPEN=
GL)&#39;,<br>
=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&#39;defined(CONFIG_GBM)&#39; ] } }<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0}<br>
<br>
<br>
You make up for it in PATCH 10.=C2=A0 Can tidy up in my tree.<br>
<br></blockquote><div><br></div><div>Ah yes, those are new in the rebase. I=
 think they could either be squashed in this patch (with update title), or =
a new patch. Leaving to the last patch isn&#39;t really a big issue either =
I suppose.</div><div><br></div><div>Thanks in advance for cleaning it up if=
 you take it :)<br></div></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000060f54c05c8d0e95b--

