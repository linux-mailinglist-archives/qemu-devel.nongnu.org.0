Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 924533C173B
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 18:43:53 +0200 (CEST)
Received: from localhost ([::1]:37250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1X7w-0006L1-KB
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 12:43:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m1WHk-0007aL-K6
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:49:56 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:35726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m1WHa-0001KK-B4
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:49:54 -0400
Received: by mail-ej1-x62c.google.com with SMTP id gn32so10478337ejc.2
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KQhDXSoXg95Ck6DKPT/p5oJ1B+Lm3fTBahOCwTlj1Gc=;
 b=s5KBGxZjZz4seTHHqCkI5yX9iT61akkYWl75SNCfYzoSX5iG8AOMja8KyMlV+ZfH81
 li4/Wsqr2Bg4i81391saKs0rkKblC6JbjJPe8Xb3A5BW753Ogiu1f5w720VjD4q/Bt8n
 clHhdQfxonVn2baRyQgoF+5ft2rSSXfsmSmeoLcTa3lK9SNJJpffoQXm+Kl+vdMxJ16P
 PkCXdTaMlbVbMqOEzql6UL9vs7Z4JcMShUrCtWsiA7IHlLZUUhOta0S40NekjYnEnjYa
 HOt+QT8pJKQ8LapZmVosPJ6NHGoz9a2Aw3ZnZF8Ve2cWU0/BzbxtlJTF7TwUrUnQkwjI
 r1xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KQhDXSoXg95Ck6DKPT/p5oJ1B+Lm3fTBahOCwTlj1Gc=;
 b=rHHantp1Vd4eGj5Lzt6oZNG++Rcw9Bep79h0zLjOkRaHAYbLfftmXEJlM9ONEajZXW
 APGfBzR7Dybus+cfpJiGX+wsmTfP6TlfGQfgSocVvn/oscHKtJz9rD/zMPrAKOJLpHkf
 aL+IBc9Klgn+Qq0xRDLl5STQcpk84bnTtAdySdPzDJUk+LbXqvh/6MRIgAAEUfE3uDhH
 FMjQ2y8/EChjMV2U4NwEMD3yGRLMBrlIFWipxInDE2f+MRHha1pSIW4twcF/gMNIvnwp
 th22+Dz8Z2q+jtbuD4tzTTXw12J46HslajPPS3Vpxuy4xmpv98ABvdqMF4QenmiZhfu9
 cf7Q==
X-Gm-Message-State: AOAM5316TFxInui91fsMEtBnFc3s77bUPRjhRwp2P4QW5z/7kULF7mln
 C5DtjhLfDK85W3doYI8ZirbMRTXDK+MIDxJKwwA=
X-Google-Smtp-Source: ABdhPJxFlcvYPrlap0yLhkOjhBUoH1O4k2x9jyz7QsyhhrNwco/1ZBFNlToFcl4QPsPh3aaiCnBts3Eqk5MTC5Bh8t0=
X-Received: by 2002:a17:907:ea5:: with SMTP id
 ho37mr31654222ejc.109.1625759383184; 
 Thu, 08 Jul 2021 08:49:43 -0700 (PDT)
MIME-Version: 1.0
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
 <1625678434-240960-13-git-send-email-steven.sistare@oracle.com>
In-Reply-To: <1625678434-240960-13-git-send-email-steven.sistare@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 8 Jul 2021 19:49:30 +0400
Message-ID: <CAJ+F1CJCPKL9uKSMTsa5eZrvgBCgo2cHQQ=OUNLGRP+dMXCoqA@mail.gmail.com>
Subject: Re: [PATCH V5 12/25] cpr: QMP interfaces for restart
To: Steve Sistare <steven.sistare@oracle.com>
Content-Type: multipart/alternative; boundary="000000000000866a2d05c69e9ae7"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62c.google.com
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000866a2d05c69e9ae7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Jul 7, 2021 at 9:33 PM Steve Sistare <steven.sistare@oracle.com>
wrote:

> cprexec calls cprexec().  Syntax:
>   { 'command': 'cprexec', 'data': { 'argv': [ 'str' ] } }
>
> Add the restart mode:
>   { 'enum': 'CprMode', 'data': [ 'reboot', 'restart' ] }
>
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  monitor/qmp-cmds.c |  5 +++++
>  qapi/cpr.json      | 16 +++++++++++++++-
>  2 files changed, 20 insertions(+), 1 deletion(-)
>
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index 1128604..7326f7d 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
> @@ -179,6 +179,11 @@ void qmp_cprsave(const char *file, CprMode mode,
> Error **errp)
>      cprsave(file, mode, errp);
>  }
>
> +void qmp_cprexec(strList *args, Error **errp)
> +{
> +    cprexec(args, errp);
> +}
> +
>  void qmp_cprload(const char *file, Error **errp)
>  {
>      cprload(file, errp);
> diff --git a/qapi/cpr.json b/qapi/cpr.json
> index b6fdc89..2467e48 100644
> --- a/qapi/cpr.json
> +++ b/qapi/cpr.json
> @@ -16,10 +16,12 @@
>  #
>  # @reboot: checkpoint can be cprload'ed after a host kexec reboot.
>  #
> +# @restart: checkpoint can be cprload'ed after restarting qemu.
> +#
>  # Since: 6.1
>  ##
>  { 'enum': 'CprMode',
> -  'data': [ 'reboot' ] }
> +  'data': [ 'reboot', 'restart' ] }
>
>
>  ##
> @@ -61,6 +63,18 @@
>              'mode': 'CprMode' } }
>
>  ##
> +# @cprexec:
> +#
> +# Restart qemu.
> +#
> +# @argv: arguments to exec
>

Why is it not then called cpr-restart ? Why does it take the whole argv?
Could argv be made optional?

+#
> +# Since: 6.1
> +##
> +{ 'command': 'cprexec',
> +  'data': { 'argv': [ 'str' ] } }
> +
> +##
>  # @cprload:
>  #
>  # Start virtual machine from checkpoint file that was created earlier
> using
> --
> 1.8.3.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000866a2d05c69e9ae7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 7, 2021 at 9:33 PM Stev=
e Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.com">steven.sistare@o=
racle.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">cprexec calls cprexec().=C2=A0 Syntax:<br>
=C2=A0 { &#39;command&#39;: &#39;cprexec&#39;, &#39;data&#39;: { &#39;argv&=
#39;: [ &#39;str&#39; ] } }<br>
<br>
Add the restart mode:<br>
=C2=A0 { &#39;enum&#39;: &#39;CprMode&#39;, &#39;data&#39;: [ &#39;reboot&#=
39;, &#39;restart&#39; ] }<br>
<br>
Signed-off-by: Steve Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.co=
m" target=3D"_blank">steven.sistare@oracle.com</a>&gt;<br>
---<br>
=C2=A0monitor/qmp-cmds.c |=C2=A0 5 +++++<br>
=C2=A0qapi/cpr.json=C2=A0 =C2=A0 =C2=A0 | 16 +++++++++++++++-<br>
=C2=A02 files changed, 20 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c<br>
index 1128604..7326f7d 100644<br>
--- a/monitor/qmp-cmds.c<br>
+++ b/monitor/qmp-cmds.c<br>
@@ -179,6 +179,11 @@ void qmp_cprsave(const char *file, CprMode mode, Error=
 **errp)<br>
=C2=A0 =C2=A0 =C2=A0cprsave(file, mode, errp);<br>
=C2=A0}<br>
<br>
+void qmp_cprexec(strList *args, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 cprexec(args, errp);<br>
+}<br>
+<br>
=C2=A0void qmp_cprload(const char *file, Error **errp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0cprload(file, errp);<br>
diff --git a/qapi/cpr.json b/qapi/cpr.json<br>
index b6fdc89..2467e48 100644<br>
--- a/qapi/cpr.json<br>
+++ b/qapi/cpr.json<br>
@@ -16,10 +16,12 @@<br>
=C2=A0#<br>
=C2=A0# @reboot: checkpoint can be cprload&#39;ed after a host kexec reboot=
.<br>
=C2=A0#<br>
+# @restart: checkpoint can be cprload&#39;ed after restarting qemu.<br>
+#<br>
=C2=A0# Since: 6.1<br>
=C2=A0##<br>
=C2=A0{ &#39;enum&#39;: &#39;CprMode&#39;,<br>
-=C2=A0 &#39;data&#39;: [ &#39;reboot&#39; ] }<br>
+=C2=A0 &#39;data&#39;: [ &#39;reboot&#39;, &#39;restart&#39; ] }<br>
<br>
<br>
=C2=A0##<br>
@@ -61,6 +63,18 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;mode&#39;: &#39;CprMod=
e&#39; } }<br>
<br>
=C2=A0##<br>
+# @cprexec:<br>
+#<br>
+# Restart qemu.<br>
+#<br>
+# @argv: arguments to exec<br></blockquote><div><br></div><div>Why is it n=
ot then called cpr-restart ? Why does it take the whole argv? Could argv be=
 made optional?<br></div><div> <br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
+#<br>
+# Since: 6.1<br>
+##<br>
+{ &#39;command&#39;: &#39;cprexec&#39;,<br>
+=C2=A0 &#39;data&#39;: { &#39;argv&#39;: [ &#39;str&#39; ] } }<br>
+<br>
+##<br>
=C2=A0# @cprload:<br>
=C2=A0#<br>
=C2=A0# Start virtual machine from checkpoint file that was created earlier=
 using<br>
-- <br>
1.8.3.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000866a2d05c69e9ae7--

