Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F971481B5F
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Dec 2021 11:30:23 +0100 (CET)
Received: from localhost ([::1]:38216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2shQ-0003RC-Gs
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 05:30:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1n2sfp-00023U-Fz
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 05:28:44 -0500
Received: from [2607:f8b0:4864:20::b2c] (port=47028
 helo=mail-yb1-xb2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1n2sfn-0000qQ-EL
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 05:28:41 -0500
Received: by mail-yb1-xb2c.google.com with SMTP id w13so37132879ybs.13
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 02:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Yy6E4BAEEC89EIrG5fe1RbBfyCUZv5vbXL5BP/bTMvc=;
 b=hKY/eV7WNXP+wlN1EkiEGp/QYHPq6lLQQSTTogkD2lyJEetK0+WDR+C02lr/Sl/B6h
 F9lqcp8cB7B9FynogEoqCJ/sTNhQdqIW375gUJ6yoffIxrluYWrEnjt2D6L4i68GalUV
 48UiHuBukU4iPn2/6G1dxx7ZlA5LypvY9ef0Ux+RxwgvPi1t+AS4pyklS/UCbYGNWwst
 vfBy8V80NexPQXXdQFatIrT9c32KzBIqAW6ipXyZXd9TZ6pWiC7GvSOOjSJ+in3e89Sf
 7NvIDiVZOeCUDjw0z8ysQ0ekq07L/j3FvvlF8eaLHh5/+PZgaebwBnBD1Xnr/afLMOix
 Niyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yy6E4BAEEC89EIrG5fe1RbBfyCUZv5vbXL5BP/bTMvc=;
 b=OREH3LzOjIHGLQ+17f172svdXk7Kymv/fGvAaPvjPCQg+jld4xAGkOZJkXmlGAdS/y
 gLSkAabeu90siNc01oFM4Tpsdv1N35buL9r0DtxnqRGg50owaXDp1XHQGMVXtweh+Xqz
 rMiXpSwnkdd4FU57ixdG8aOGTnDy0xh7OaqrVtB5U7gXVzXOMJpr6P+sOI6t8HqBNAKH
 7Yrnn8kQVgmyg/iM+1JGcqdP4C7CxR6HI24kIk2rkiN18F/cp9/WEpE+6pwIFURnsiia
 6P4uRhDtrfkhQbXOSeAHxdcouUlht/knK0j47ahCwSJpzt9w9d2Jdee3rSogb/skwXO+
 CnJw==
X-Gm-Message-State: AOAM532KZcQ6F8/N38kru0ht7LLlr59j1o09wJN8c1/RjoUYrsZNVUEj
 03PFue1BlYQSaQzs9IzphDCTHZzxUh9stCzeOLVXyg==
X-Google-Smtp-Source: ABdhPJxVFDm4ibr0sD34SVWtOhjz6r+Eim/srJDZP1AZtjXbXVqz3V4N0x2mYWN2b0i9hD6kuGKIUgMSRPeLxhn7JuI=
X-Received: by 2002:a25:ba51:: with SMTP id z17mr2014191ybj.499.1640860117111; 
 Thu, 30 Dec 2021 02:28:37 -0800 (PST)
MIME-Version: 1.0
References: <20211115022122.2303184-1-yshxxsjt715@gmail.com>
In-Reply-To: <20211115022122.2303184-1-yshxxsjt715@gmail.com>
From: Konstantin Kostiuk <konstantin@daynix.com>
Date: Thu, 30 Dec 2021 12:28:26 +0200
Message-ID: <CAJ28CFSy5spNVus9S3aOMgLqxTJGcXygoqFgrk87EOxd5bnJJg@mail.gmail.com>
Subject: Re: [PATCH] Add service recovery options for QGA on windows
To: yshxxsjt715@gmail.com
Content-Type: multipart/alternative; boundary="000000000000682a2105d45a8415"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2c
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=konstantin@daynix.com; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Michael Roth <michael.roth@amd.com>, Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000682a2105d45a8415
Content-Type: text/plain; charset="UTF-8"

Hi,

On Mon, Nov 15, 2021 at 4:30 AM <yshxxsjt715@gmail.com> wrote:

> From: shenjiatong <yshxxsjt715@gmail.com>
>
> Add default recovery options for QGA on windows. Previously, QGA
> on windows will not try to restart service if it is down. This PS
> add some default options for the first, second and other failures,
> with an interval of 1min. Failure counter will reset after 1 day.
>
> Signed-off-by: shenjiatong <yshxxsjt715@gmail.com>
> ---
>  qga/service-win32.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/qga/service-win32.c b/qga/service-win32.c
> index fd434e3f49..0fc93d38c3 100644
> --- a/qga/service-win32.c
> +++ b/qga/service-win32.c
> @@ -105,6 +105,18 @@ int ga_install_service(const char *path, const char
> *logfile,
>      GString *esc;
>      GString *cmdline;
>      SERVICE_DESCRIPTION desc = { (char *)QGA_SERVICE_DESCRIPTION };
> +    SC_ACTION sa[] = {
> +        { SC_ACTION_RESTART, 60000},
> +        { SC_ACTION_RESTART, 60000},
> +        { SC_ACTION_RESTART, 60000}
> +    };
> +    SERVICE_FAILURE_ACTIONS sfa = {
> +        864000, // in seconds,
>

864000 seconds is 10 days, not 1 day.



> +        NULL,
> +        NULL,
> +        sizeof(sa) / sizeof(*sa),
> +        sa
> +    };
>
>      if (GetModuleFileName(NULL, module_fname, MAX_PATH) == 0) {
>          printf_win_error("No full path to service's executable");
> @@ -146,6 +158,7 @@ int ga_install_service(const char *path, const char
> *logfile,
>      }
>
>      ChangeServiceConfig2(service, SERVICE_CONFIG_DESCRIPTION, &desc);
> +    ChangeServiceConfig2(service, SERVICE_CONFIG_FAILURE_ACTIONS, &sfa);
>      fprintf(stderr, "Service was installed successfully.\n");
>      ret = EXIT_SUCCESS;
>      CloseServiceHandle(service);
> --
> 2.25.1
>
>

--000000000000682a2105d45a8415
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,<br></div><div><br></div><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 15, 2021 at 4:30 AM &lt=
;<a href=3D"mailto:yshxxsjt715@gmail.com">yshxxsjt715@gmail.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: shenji=
atong &lt;<a href=3D"mailto:yshxxsjt715@gmail.com" target=3D"_blank">yshxxs=
jt715@gmail.com</a>&gt;<br>
<br>
Add default recovery options for QGA on windows. Previously, QGA<br>
on windows will not try to restart service if it is down. This PS<br>
add some default options for the first, second and other failures,<br>
with an interval of 1min. Failure counter will reset after 1 day.<br>
<br>
Signed-off-by: shenjiatong &lt;<a href=3D"mailto:yshxxsjt715@gmail.com" tar=
get=3D"_blank">yshxxsjt715@gmail.com</a>&gt;<br>
---<br>
=C2=A0qga/service-win32.c | 13 +++++++++++++<br>
=C2=A01 file changed, 13 insertions(+)<br>
<br>
diff --git a/qga/service-win32.c b/qga/service-win32.c<br>
index fd434e3f49..0fc93d38c3 100644<br>
--- a/qga/service-win32.c<br>
+++ b/qga/service-win32.c<br>
@@ -105,6 +105,18 @@ int ga_install_service(const char *path, const char *l=
ogfile,<br>
=C2=A0 =C2=A0 =C2=A0GString *esc;<br>
=C2=A0 =C2=A0 =C2=A0GString *cmdline;<br>
=C2=A0 =C2=A0 =C2=A0SERVICE_DESCRIPTION desc =3D { (char *)QGA_SERVICE_DESC=
RIPTION };<br>
+=C2=A0 =C2=A0 SC_ACTION sa[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 { SC_ACTION_RESTART, 60000},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 { SC_ACTION_RESTART, 60000},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 { SC_ACTION_RESTART, 60000}<br>
+=C2=A0 =C2=A0 };<br>
+=C2=A0 =C2=A0 SERVICE_FAILURE_ACTIONS sfa =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 864000, // in seconds,<br></blockquote><div>=
=C2=A0</div><div>864000 seconds is 10 days, not 1 day.</div><div></div><div=
><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(sa) / sizeof(*sa),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sa<br>
+=C2=A0 =C2=A0 };<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (GetModuleFileName(NULL, module_fname, MAX_PATH) =3D=
=3D 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf_win_error(&quot;No full path to se=
rvice&#39;s executable&quot;);<br>
@@ -146,6 +158,7 @@ int ga_install_service(const char *path, const char *lo=
gfile,<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0ChangeServiceConfig2(service, SERVICE_CONFIG_DESCRIPTIO=
N, &amp;desc);<br>
+=C2=A0 =C2=A0 ChangeServiceConfig2(service, SERVICE_CONFIG_FAILURE_ACTIONS=
, &amp;sfa);<br>
=C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;Service was installed successfull=
y.\n&quot;);<br>
=C2=A0 =C2=A0 =C2=A0ret =3D EXIT_SUCCESS;<br>
=C2=A0 =C2=A0 =C2=A0CloseServiceHandle(service);<br>
-- <br>
2.25.1<br>
<br></blockquote><div><br></div><div>=C2=A0</div></div></div>

--000000000000682a2105d45a8415--

