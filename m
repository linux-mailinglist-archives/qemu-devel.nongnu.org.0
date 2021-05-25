Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D84D3909C8
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 21:40:06 +0200 (CEST)
Received: from localhost ([::1]:45308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llcuL-0008DR-3R
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 15:40:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1llcsN-0006C4-RX
 for qemu-devel@nongnu.org; Tue, 25 May 2021 15:38:03 -0400
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a]:46969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1llcsK-0002Uo-Vq
 for qemu-devel@nongnu.org; Tue, 25 May 2021 15:38:03 -0400
Received: by mail-ua1-x92a.google.com with SMTP id h26so4036277uab.13
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 12:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/nJv8TJAWGzZnzrHOk+s+xIQfq1jhFrLMwjmKGUG6Ng=;
 b=vOAr6IpfYBU7uO3RKGsVOjuPgYycvGzEhuzUH1qLMkFW3C4+dQVq6180eYdSIgGL8e
 6EpRCgf5Tt3XAKUE73MP1glOzmuJ2E3JnYy6Moz+3qJI9HuT4IuLCYATFZFCwZHfriXd
 uz4imtj4+vnfpywj8GhXQXroqs1bVvzuj/XOBUtSnY5fBu75+oMU7gpJvHhEblIEtyMr
 PsF8bZU9SmRt07lgi9uAqWdXQgiVqlZ6lxyAo+m0I8iHaKXjsu24NXGP38N7dM3eLQFk
 rj2mG/VFOiwJywfJE4+vRjQg07/zuqF/2QcNxMZYkX3QPlPosn2hXYMZDeMPaCiugU6Q
 w0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/nJv8TJAWGzZnzrHOk+s+xIQfq1jhFrLMwjmKGUG6Ng=;
 b=e42LwCenMBITq77K3IrErGXuBEsMCFcJX3yhs2uCoTTDJUIKhy5j8afzPOiX9Ik/Tv
 PeLx8TGaVgnNgc105W2xhKOFEfzYT5X805TAXjgHXhfDb7Gs++LY+lwuEU7QMBgTkKCF
 OprNQKPi1ZSgd87gLAvvQm3f2QYVxrhNdICpLqpSc8B4PQu6O759QmJ8RsTHyKm1Nwqp
 gbR3SWmTfHPNFfB4/tawYU+yX4tJ5zcdNtCvE5qy1OJiafbzbIEEYspKJg2KV823Lb/9
 U9FVCSBNI0omv6tdlG0Xn4cbzfFLmJPwuciABz6O4D0z4srcNpsdCAwf7HJdNUgVZBAl
 /YBQ==
X-Gm-Message-State: AOAM5315BNbxgnPZRWKHO7uUratI9DPJgsxDU+/Girfn/u92t4ieqHcr
 SlfycGqDgzbkIhjQ4BQI1pffzEwKjqEKuVu7nKtPYQ==
X-Google-Smtp-Source: ABdhPJxaPWsDSxdWbInffxPc+9ALHusKRtXd46uZAZidgoWBikptheDw449TXGf3zT4CMcQgsgQtiyJN4aQFI6KtpE0=
X-Received: by 2002:ab0:232:: with SMTP id 47mr28580758uas.91.1621971478838;
 Tue, 25 May 2021 12:37:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210415033925.1290401-1-dje@google.com>
 <20210415033925.1290401-3-dje@google.com>
 <CAJ+F1CJUzAbZmfY59x6YYLWba-TMyZYwW7Pqu75zs93qbscr3Q@mail.gmail.com>
In-Reply-To: <CAJ+F1CJUzAbZmfY59x6YYLWba-TMyZYwW7Pqu75zs93qbscr3Q@mail.gmail.com>
From: Doug Evans <dje@google.com>
Date: Tue, 25 May 2021 12:37:21 -0700
Message-ID: <CADPb22TW5GkwcF_08R1KBr+NKBGLOHBwFqHPOJKVgiDa6w2VKA@mail.gmail.com>
Subject: RFC: IPv6 hostfwd command line syntax [was Re: [PATCH v6 2/4]
 util/qemu-sockets.c: Split host:port parsing out of inet_parse]
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>, 
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: QEMU <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000d58a7205c32ca93e"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92a;
 envelope-from=dje@google.com; helo=mail-ua1-x92a.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d58a7205c32ca93e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi.

I want to confirm the command line syntax y'all want for ipv6 host
forwarding.

IIUC, the command line syntax is required to be consistent with the use of
"ipv6=3Don|off" elsewhere.
Can you confirm that's correct?

If so, how does one apply "ipv6=3Don" to the "::60022-:22" hostfwd spec in
the following example:

$ qemu-system-x86_64 [...] --nic user,id=3Dn1,model=3De1000,hostfwd=3D::600=
22-:22

?

Square brackets are for parsing purposes only and are not allowed to be the
deciding factor in determining whether an address is ipv4 or ipv6. Thus
while one might think to write that as ":[]:60022-[]:22" to mean "this is
for ipv6" one cannot do so.


On Fri, May 7, 2021 at 8:23 AM Marc-Andr=C3=A9 Lureau <marcandre.lureau@gma=
il.com>
wrote:

>
>
> On Thu, Apr 15, 2021 at 7:40 AM Doug Evans <dje@google.com> wrote:
>
>> The parsing is moved into new function inet_parse_host_port.
>> Also split out is ipv4=3Dflag, ipv6=3Dflag processing into inet_parse_ip=
v46.
>> This is done in preparation for using these functions in net/slirp.c.
>>
>> Signed-off-by: Doug Evans <dje@google.com>
>>
>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> ---
>>
>> Changes from v5:
>>
>> Also split out parsing of ipv4=3Don|off, ipv6=3Don|off
>>
>>  include/qemu/sockets.h |  3 ++
>>  util/qemu-sockets.c    | 65 +++++++++++++++++++++++++++++-------------
>>  2 files changed, 48 insertions(+), 20 deletions(-)
>>
>> diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
>> index 7d1f813576..94f4e8de83 100644
>> --- a/include/qemu/sockets.h
>> +++ b/include/qemu/sockets.h
>> @@ -31,6 +31,9 @@ int socket_set_fast_reuse(int fd);
>>
>>  int inet_ai_family_from_address(InetSocketAddress *addr,
>>                                  Error **errp);
>> +const char *inet_parse_host_port(InetSocketAddress *addr,
>> +                                 const char *str, Error **errp);
>> +int inet_parse_ipv46(InetSocketAddress *addr, const char *optstr, Error
>> **errp);
>>  int inet_parse(InetSocketAddress *addr, const char *str, Error **errp);
>>  int inet_connect(const char *str, Error **errp);
>>  int inet_connect_saddr(InetSocketAddress *saddr, Error **errp);
>> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
>> index 8af0278f15..c0069f2565 100644
>> --- a/util/qemu-sockets.c
>> +++ b/util/qemu-sockets.c
>> @@ -615,14 +615,12 @@ static int inet_parse_flag(const char *flagname,
>> const char *optstr, bool *val,
>>      return 0;
>>  }
>>
>> -int inet_parse(InetSocketAddress *addr, const char *str, Error **errp)
>> +const char *inet_parse_host_port(InetSocketAddress *addr, const char
>> *str,
>> +                                 Error **errp)
>>  {
>> -    const char *optstr, *h;
>>      char host[65];
>>      char port[33];
>> -    int to;
>>      int pos;
>> -    char *begin;
>>
>>      memset(addr, 0, sizeof(*addr));
>>
>> @@ -632,38 +630,32 @@ int inet_parse(InetSocketAddress *addr, const char
>> *str, Error **errp)
>>          host[0] =3D '\0';
>>          if (sscanf(str, ":%32[^,]%n", port, &pos) !=3D 1) {
>>              error_setg(errp, "error parsing port in address '%s'", str)=
;
>> -            return -1;
>> +            return NULL;
>>          }
>>      } else if (str[0] =3D=3D '[') {
>>          /* IPv6 addr */
>>          if (sscanf(str, "[%64[^]]]:%32[^,]%n", host, port, &pos) !=3D 2=
) {
>>              error_setg(errp, "error parsing IPv6 address '%s'", str);
>> -            return -1;
>> +            return NULL;
>>          }
>>      } else {
>>          /* hostname or IPv4 addr */
>>          if (sscanf(str, "%64[^:]:%32[^,]%n", host, port, &pos) !=3D 2) =
{
>>              error_setg(errp, "error parsing address '%s'", str);
>> -            return -1;
>> +            return NULL;
>>          }
>>      }
>>
>>      addr->host =3D g_strdup(host);
>>      addr->port =3D g_strdup(port);
>>
>> -    /* parse options */
>> -    optstr =3D str + pos;
>> -    h =3D strstr(optstr, ",to=3D");
>> -    if (h) {
>> -        h +=3D 4;
>> -        if (sscanf(h, "%d%n", &to, &pos) !=3D 1 ||
>> -            (h[pos] !=3D '\0' && h[pos] !=3D ',')) {
>> -            error_setg(errp, "error parsing to=3D argument");
>> -            return -1;
>> -        }
>> -        addr->has_to =3D true;
>> -        addr->to =3D to;
>> -    }
>> +    return str + pos;
>> +}
>> +
>> +int inet_parse_ipv46(InetSocketAddress *addr, const char *optstr, Error
>> **errp)
>> +{
>> +    char *begin;
>> +
>>      begin =3D strstr(optstr, ",ipv4");
>>      if (begin) {
>>          if (inet_parse_flag("ipv4", begin + 5, &addr->ipv4, errp) < 0) =
{
>> @@ -678,6 +670,39 @@ int inet_parse(InetSocketAddress *addr, const char
>> *str, Error **errp)
>>          }
>>          addr->has_ipv6 =3D true;
>>      }
>> +
>> +    return 0;
>> +}
>> +
>> +int inet_parse(InetSocketAddress *addr, const char *str, Error **errp)
>> +{
>> +    const char *optstr, *h;
>> +    int to;
>> +    int pos;
>> +    char *begin;
>> +
>> +    optstr =3D inet_parse_host_port(addr, str, errp);
>> +    if (optstr =3D=3D NULL) {
>> +        return -1;
>> +    }
>> +
>> +    /* parse options */
>> +
>> +    if (inet_parse_ipv46(addr, optstr, errp) < 0) {
>> +        return -1;
>> +    }
>> +
>> +    h =3D strstr(optstr, ",to=3D");
>> +    if (h) {
>> +        h +=3D 4;
>> +        if (sscanf(h, "%d%n", &to, &pos) !=3D 1 ||
>> +            (h[pos] !=3D '\0' && h[pos] !=3D ',')) {
>> +            error_setg(errp, "error parsing to=3D argument");
>> +            return -1;
>> +        }
>> +        addr->has_to =3D true;
>> +        addr->to =3D to;
>> +    }
>>      begin =3D strstr(optstr, ",keep-alive");
>>      if (begin) {
>>          if (inet_parse_flag("keep-alive", begin + strlen(",keep-alive")=
,
>> --
>> 2.31.1.295.g9ea45b61b8-goog
>>
>>
>>
>
> --
> Marc-Andr=C3=A9 Lureau
>

--000000000000d58a7205c32ca93e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi.</div><div class=3D"gmail_default" style=3D"font-size:smal=
l"><br></div><div class=3D"gmail_default" style=3D"font-size:small">I want =
to confirm the command line syntax y&#39;all want for ipv6 host forwarding.=
</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div=
 class=3D"gmail_default" style=3D"font-size:small">IIUC, the command line s=
yntax is required to be consistent with the use of &quot;ipv6=3Don|off&quot=
; elsewhere.</div><div class=3D"gmail_default" style=3D"font-size:small">Ca=
n you confirm that&#39;s correct?</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">If so, how does one apply &quot;ipv6=3Don&quot; to the &quot;::6=
0022-:22&quot; hostfwd spec in the following example:<br></div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">$ qemu-system-x86_64 [...] --nic user,id=
=3Dn1,model=3De1000,hostfwd=3D::60022-:22</div><div class=3D"gmail_default"=
 style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"=
font-size:small">?</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Square=
 brackets are for parsing purposes only and are not allowed to be the decid=
ing factor in determining whether an address is ipv4 or ipv6. Thus while on=
e might think to write that as &quot;:[]:60022-[]:22&quot; to mean &quot;th=
is is for ipv6&quot; one cannot do so.</div><div class=3D"gmail_default" st=
yle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Fri, May 7, 2021 at 8:23 AM Marc-Andr=C3=A9 Lureau &=
lt;<a href=3D"mailto:marcandre.lureau@gmail.com">marcandre.lureau@gmail.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 15, 2021 at 7:40 AM Doug =
Evans &lt;<a href=3D"mailto:dje@google.com" target=3D"_blank">dje@google.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>The parsing is moved into new function inet_parse_host_port.<br>
Also split out is ipv4=3Dflag, ipv6=3Dflag processing into inet_parse_ipv46=
.<br>
This is done in preparation for using these functions in net/slirp.c.<br>
<br>
Signed-off-by: Doug Evans &lt;<a href=3D"mailto:dje@google.com" target=3D"_=
blank">dje@google.com</a>&gt;<br></blockquote><div><br></div><div>Reviewed-=
by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.co=
m" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;</div><div> <br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
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
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>
</blockquote></div></div>

--000000000000d58a7205c32ca93e--

