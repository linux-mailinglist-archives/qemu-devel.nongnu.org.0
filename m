Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D5A3767E2
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 17:26:11 +0200 (CEST)
Received: from localhost ([::1]:55252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf2Mk-0007dX-Ic
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 11:26:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lf2KO-0006LA-8H
 for qemu-devel@nongnu.org; Fri, 07 May 2021 11:23:44 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:37640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lf2KM-00007i-7a
 for qemu-devel@nongnu.org; Fri, 07 May 2021 11:23:43 -0400
Received: by mail-ed1-x529.google.com with SMTP id y26so10690551eds.4
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 08:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EyPCLD+wdfWldIXMisna6COEYCMmWb7r6varf5LT1uw=;
 b=D0fI6DNPR9TGa569AoNoBl6aexcPxFVTiOYSQiXp2LLTOVWILrSvc1YlVc/rMXyZyz
 7Nnxm88/ONi3qQOfSOw6/EtAw3m5Tw1zfxd7v+sfiTvEXPg34HVZ0rwfNa/h144/VNYM
 oYKDu5M0rkWCBw1grtcyqNvPZWkwE31x9RRudE+ft+hrRwORoIS5gnP9J+NAA1ZsEfWC
 dSrjPKdlY3H+YsfuOMum0pMb8DpMyhmC0UFwprLEBQjyZhzQ+eNvnzKdlFGywmub92SF
 8calgp+61Udom0FmuZ8H8mdn3+Qhynvl+CcdKrx/z92dMFzfGcBbbNLKzC6mGkBWPtIX
 V9Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EyPCLD+wdfWldIXMisna6COEYCMmWb7r6varf5LT1uw=;
 b=HPXyC+9bDf8n74lXMw0rFH5Xo6B1IBi0KvDqC3PYtvNDformW0yR6q6Xh3lVELMaWc
 SWqBOevMMdJp3M5WFvmPTMlc9Us2YAuuse6xwl60IT55QzPYUALTT8XTNSc0pRV/uIm4
 1j4z4JuNCzHYsqSG63w+Ii5Ir0iFmrcstGggxD2EJFwBRzvjyC67lmBDvO7NYHe74LA4
 8s6MN5HDV3pJaQNxZuZ3Xpod/VXPvKkx7zCJMDh/NDUb5BOi9SMBSOSL0mwUihmQPwq+
 e27x1szBziOlx8P7S3N+g37bcVpJyMjHU1iOTrLOkTaJmokl8lInU1MI3MtL7SnKktmF
 eAZw==
X-Gm-Message-State: AOAM533tTI2d1WgJwF2SRKBmPQwBwZdApr0/OLrgkUQSTPXGncLaG5wo
 Ayh9Qsf0Mn1e5VpNV34I+zHzn9aEdEQ0LeSrvHc=
X-Google-Smtp-Source: ABdhPJzeiugH9MnOqkmM+oWdJYYnxqEx+9QP5Z//wKRETd+6BkbiZ1ivsn21qmjGVWVHcjP8YJcLHbMxD5UwGcgJOxI=
X-Received: by 2002:aa7:d1d9:: with SMTP id g25mr12455705edp.30.1620401020270; 
 Fri, 07 May 2021 08:23:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210415033925.1290401-1-dje@google.com>
 <20210415033925.1290401-3-dje@google.com>
In-Reply-To: <20210415033925.1290401-3-dje@google.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 7 May 2021 19:23:28 +0400
Message-ID: <CAJ+F1CJUzAbZmfY59x6YYLWba-TMyZYwW7Pqu75zs93qbscr3Q@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] util/qemu-sockets.c: Split host:port parsing out
 of inet_parse
To: Doug Evans <dje@google.com>
Content-Type: multipart/alternative; boundary="00000000000035055205c1bf03d3"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x529.google.com
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000035055205c1bf03d3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 15, 2021 at 7:40 AM Doug Evans <dje@google.com> wrote:

> The parsing is moved into new function inet_parse_host_port.
> Also split out is ipv4=3Dflag, ipv6=3Dflag processing into inet_parse_ipv=
46.
> This is done in preparation for using these functions in net/slirp.c.
>
> Signed-off-by: Doug Evans <dje@google.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>
> Changes from v5:
>
> Also split out parsing of ipv4=3Don|off, ipv6=3Don|off
>
>  include/qemu/sockets.h |  3 ++
>  util/qemu-sockets.c    | 65 +++++++++++++++++++++++++++++-------------
>  2 files changed, 48 insertions(+), 20 deletions(-)
>
> diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
> index 7d1f813576..94f4e8de83 100644
> --- a/include/qemu/sockets.h
> +++ b/include/qemu/sockets.h
> @@ -31,6 +31,9 @@ int socket_set_fast_reuse(int fd);
>
>  int inet_ai_family_from_address(InetSocketAddress *addr,
>                                  Error **errp);
> +const char *inet_parse_host_port(InetSocketAddress *addr,
> +                                 const char *str, Error **errp);
> +int inet_parse_ipv46(InetSocketAddress *addr, const char *optstr, Error
> **errp);
>  int inet_parse(InetSocketAddress *addr, const char *str, Error **errp);
>  int inet_connect(const char *str, Error **errp);
>  int inet_connect_saddr(InetSocketAddress *saddr, Error **errp);
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index 8af0278f15..c0069f2565 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -615,14 +615,12 @@ static int inet_parse_flag(const char *flagname,
> const char *optstr, bool *val,
>      return 0;
>  }
>
> -int inet_parse(InetSocketAddress *addr, const char *str, Error **errp)
> +const char *inet_parse_host_port(InetSocketAddress *addr, const char *st=
r,
> +                                 Error **errp)
>  {
> -    const char *optstr, *h;
>      char host[65];
>      char port[33];
> -    int to;
>      int pos;
> -    char *begin;
>
>      memset(addr, 0, sizeof(*addr));
>
> @@ -632,38 +630,32 @@ int inet_parse(InetSocketAddress *addr, const char
> *str, Error **errp)
>          host[0] =3D '\0';
>          if (sscanf(str, ":%32[^,]%n", port, &pos) !=3D 1) {
>              error_setg(errp, "error parsing port in address '%s'", str);
> -            return -1;
> +            return NULL;
>          }
>      } else if (str[0] =3D=3D '[') {
>          /* IPv6 addr */
>          if (sscanf(str, "[%64[^]]]:%32[^,]%n", host, port, &pos) !=3D 2)=
 {
>              error_setg(errp, "error parsing IPv6 address '%s'", str);
> -            return -1;
> +            return NULL;
>          }
>      } else {
>          /* hostname or IPv4 addr */
>          if (sscanf(str, "%64[^:]:%32[^,]%n", host, port, &pos) !=3D 2) {
>              error_setg(errp, "error parsing address '%s'", str);
> -            return -1;
> +            return NULL;
>          }
>      }
>
>      addr->host =3D g_strdup(host);
>      addr->port =3D g_strdup(port);
>
> -    /* parse options */
> -    optstr =3D str + pos;
> -    h =3D strstr(optstr, ",to=3D");
> -    if (h) {
> -        h +=3D 4;
> -        if (sscanf(h, "%d%n", &to, &pos) !=3D 1 ||
> -            (h[pos] !=3D '\0' && h[pos] !=3D ',')) {
> -            error_setg(errp, "error parsing to=3D argument");
> -            return -1;
> -        }
> -        addr->has_to =3D true;
> -        addr->to =3D to;
> -    }
> +    return str + pos;
> +}
> +
> +int inet_parse_ipv46(InetSocketAddress *addr, const char *optstr, Error
> **errp)
> +{
> +    char *begin;
> +
>      begin =3D strstr(optstr, ",ipv4");
>      if (begin) {
>          if (inet_parse_flag("ipv4", begin + 5, &addr->ipv4, errp) < 0) {
> @@ -678,6 +670,39 @@ int inet_parse(InetSocketAddress *addr, const char
> *str, Error **errp)
>          }
>          addr->has_ipv6 =3D true;
>      }
> +
> +    return 0;
> +}
> +
> +int inet_parse(InetSocketAddress *addr, const char *str, Error **errp)
> +{
> +    const char *optstr, *h;
> +    int to;
> +    int pos;
> +    char *begin;
> +
> +    optstr =3D inet_parse_host_port(addr, str, errp);
> +    if (optstr =3D=3D NULL) {
> +        return -1;
> +    }
> +
> +    /* parse options */
> +
> +    if (inet_parse_ipv46(addr, optstr, errp) < 0) {
> +        return -1;
> +    }
> +
> +    h =3D strstr(optstr, ",to=3D");
> +    if (h) {
> +        h +=3D 4;
> +        if (sscanf(h, "%d%n", &to, &pos) !=3D 1 ||
> +            (h[pos] !=3D '\0' && h[pos] !=3D ',')) {
> +            error_setg(errp, "error parsing to=3D argument");
> +            return -1;
> +        }
> +        addr->has_to =3D true;
> +        addr->to =3D to;
> +    }
>      begin =3D strstr(optstr, ",keep-alive");
>      if (begin) {
>          if (inet_parse_flag("keep-alive", begin + strlen(",keep-alive"),
> --
> 2.31.1.295.g9ea45b61b8-goog
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000035055205c1bf03d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 15, 2021 at 7:40 AM Doug =
Evans &lt;<a href=3D"mailto:dje@google.com">dje@google.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">The parsing is mo=
ved into new function inet_parse_host_port.<br>
Also split out is ipv4=3Dflag, ipv6=3Dflag processing into inet_parse_ipv46=
.<br>
This is done in preparation for using these functions in net/slirp.c.<br>
<br>
Signed-off-by: Doug Evans &lt;<a href=3D"mailto:dje@google.com" target=3D"_=
blank">dje@google.com</a>&gt;<br></blockquote><div><br></div><div>Reviewed-=
by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.co=
m">marcandre.lureau@redhat.com</a>&gt;</div><div> <br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
---<br>
<br>
Changes from v5:<br>
<br>
Also split out parsing of ipv4=3Don|off, ipv6=3Don|off<br>
<br>
=C2=A0include/qemu/sockets.h |=C2=A0 3 ++<br>
=C2=A0util/qemu-sockets.c=C2=A0 =C2=A0 | 65 +++++++++++++++++++++++++++++--=
-----------<br>
=C2=A02 files changed, 48 insertions(+), 20 deletions(-)<br>
<br>
diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h<br>
index 7d1f813576..94f4e8de83 100644<br>
--- a/include/qemu/sockets.h<br>
+++ b/include/qemu/sockets.h<br>
@@ -31,6 +31,9 @@ int socket_set_fast_reuse(int fd);<br>
<br>
=C2=A0int inet_ai_family_from_address(InetSocketAddress *addr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Error **errp);<br>
+const char *inet_parse_host_port(InetSocketAddress *addr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *str, Error **errp)=
;<br>
+int inet_parse_ipv46(InetSocketAddress *addr, const char *optstr, Error **=
errp);<br>
=C2=A0int inet_parse(InetSocketAddress *addr, const char *str, Error **errp=
);<br>
=C2=A0int inet_connect(const char *str, Error **errp);<br>
=C2=A0int inet_connect_saddr(InetSocketAddress *saddr, Error **errp);<br>
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c<br>
index 8af0278f15..c0069f2565 100644<br>
--- a/util/qemu-sockets.c<br>
+++ b/util/qemu-sockets.c<br>
@@ -615,14 +615,12 @@ static int inet_parse_flag(const char *flagname, cons=
t char *optstr, bool *val,<br>
=C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
<br>
-int inet_parse(InetSocketAddress *addr, const char *str, Error **errp)<br>
+const char *inet_parse_host_port(InetSocketAddress *addr, const char *str,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Error **errp)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 const char *optstr, *h;<br>
=C2=A0 =C2=A0 =C2=A0char host[65];<br>
=C2=A0 =C2=A0 =C2=A0char port[33];<br>
-=C2=A0 =C2=A0 int to;<br>
=C2=A0 =C2=A0 =C2=A0int pos;<br>
-=C2=A0 =C2=A0 char *begin;<br>
<br>
=C2=A0 =C2=A0 =C2=A0memset(addr, 0, sizeof(*addr));<br>
<br>
@@ -632,38 +630,32 @@ int inet_parse(InetSocketAddress *addr, const char *s=
tr, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0host[0] =3D &#39;\0&#39;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (sscanf(str, &quot;:%32[^,]%n&quot;, p=
ort, &amp;pos) !=3D 1) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;erro=
r parsing port in address &#39;%s&#39;&quot;, str);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0} else if (str[0] =3D=3D &#39;[&#39;) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* IPv6 addr */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (sscanf(str, &quot;[%64[^]]]:%32[^,]%n=
&quot;, host, port, &amp;pos) !=3D 2) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;erro=
r parsing IPv6 address &#39;%s&#39;&quot;, str);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* hostname or IPv4 addr */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (sscanf(str, &quot;%64[^:]:%32[^,]%n&q=
uot;, host, port, &amp;pos) !=3D 2) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;erro=
r parsing address &#39;%s&#39;&quot;, str);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0addr-&gt;host =3D g_strdup(host);<br>
=C2=A0 =C2=A0 =C2=A0addr-&gt;port =3D g_strdup(port);<br>
<br>
-=C2=A0 =C2=A0 /* parse options */<br>
-=C2=A0 =C2=A0 optstr =3D str + pos;<br>
-=C2=A0 =C2=A0 h =3D strstr(optstr, &quot;,to=3D&quot;);<br>
-=C2=A0 =C2=A0 if (h) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 h +=3D 4;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sscanf(h, &quot;%d%n&quot;, &amp;to, &amp;=
pos) !=3D 1 ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (h[pos] !=3D &#39;\0&#39; &amp;&=
amp; h[pos] !=3D &#39;,&#39;)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;error par=
sing to=3D argument&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 addr-&gt;has_to =3D true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 addr-&gt;to =3D to;<br>
-=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return str + pos;<br>
+}<br>
+<br>
+int inet_parse_ipv46(InetSocketAddress *addr, const char *optstr, Error **=
errp)<br>
+{<br>
+=C2=A0 =C2=A0 char *begin;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0begin =3D strstr(optstr, &quot;,ipv4&quot;);<br>
=C2=A0 =C2=A0 =C2=A0if (begin) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (inet_parse_flag(&quot;ipv4&quot;, beg=
in + 5, &amp;addr-&gt;ipv4, errp) &lt; 0) {<br>
@@ -678,6 +670,39 @@ int inet_parse(InetSocketAddress *addr, const char *st=
r, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0addr-&gt;has_ipv6 =3D true;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+int inet_parse(InetSocketAddress *addr, const char *str, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 const char *optstr, *h;<br>
+=C2=A0 =C2=A0 int to;<br>
+=C2=A0 =C2=A0 int pos;<br>
+=C2=A0 =C2=A0 char *begin;<br>
+<br>
+=C2=A0 =C2=A0 optstr =3D inet_parse_host_port(addr, str, errp);<br>
+=C2=A0 =C2=A0 if (optstr =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* parse options */<br>
+<br>
+=C2=A0 =C2=A0 if (inet_parse_ipv46(addr, optstr, errp) &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 h =3D strstr(optstr, &quot;,to=3D&quot;);<br>
+=C2=A0 =C2=A0 if (h) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 h +=3D 4;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sscanf(h, &quot;%d%n&quot;, &amp;to, &amp;=
pos) !=3D 1 ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (h[pos] !=3D &#39;\0&#39; &amp;&=
amp; h[pos] !=3D &#39;,&#39;)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;error par=
sing to=3D argument&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 addr-&gt;has_to =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 addr-&gt;to =3D to;<br>
+=C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0begin =3D strstr(optstr, &quot;,keep-alive&quot;);<br>
=C2=A0 =C2=A0 =C2=A0if (begin) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (inet_parse_flag(&quot;keep-alive&quot=
;, begin + strlen(&quot;,keep-alive&quot;),<br>
-- <br>
2.31.1.295.g9ea45b61b8-goog<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000035055205c1bf03d3--

