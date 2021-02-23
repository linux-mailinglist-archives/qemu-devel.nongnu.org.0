Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0393230A4
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 19:25:01 +0100 (CET)
Received: from localhost ([::1]:46340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEcMm-0007DI-TF
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 13:25:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1lEcLm-0006JM-2Y
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:23:58 -0500
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931]:41460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1lEcLj-0006Sb-6R
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:23:57 -0500
Received: by mail-ua1-x931.google.com with SMTP id w24so657383uau.8
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 10:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8anQUnArPnJOBP7ZRuQhg0gs53K7bKbtdnDs1LSBhOY=;
 b=tu0So1Uknmcse1wr3QXResS2rq0/2XgVd20UiwRATTcNvvzhIjc7DQcGm+8Fuyvgqt
 puCs6Ixy4B+1ntyD9mkz2OgkVMRNhb7ys0NVNWdUQHEXHEmdlE5tyVg3yU44fqv7sYNz
 clzVSl7DONzcK04QDaLPAdEHfk4kdIkuOpfgjR6bU3784CGtjmA6Oy93eF35FuqM5Txa
 NzfiBwwCW++s+ZH1v0WCwel/aG/UEh/XnkxoHbCHnuCNB46scmQblOHcunGej8Kvg3SB
 1f6YizWfXKNyBBuYpTvHnRY9BpYjxKgMr7X6J5nYb2mC1NbciSEDnqXozPCvgH0sZ1iA
 cyvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8anQUnArPnJOBP7ZRuQhg0gs53K7bKbtdnDs1LSBhOY=;
 b=Q8ROOwGYLtnfYCDlw0ulQvlnpztDnWdGNt0mom09ryezP6wKtNyfGcQoI00na2Popp
 IlSxYKSj6DE1Qwj6vWllTiZxyLIYjnc1fq6lZjjG7RlS/HV07j32h+aOsZB0B9uaTehL
 fjapIVdou1Zc1qb9BP4+VHYSsTAodFaryXxbmv36Qnb4m1Hj9DX8TJYwrVMxNps2T5Ed
 3c0o+AsAvmzUA4hjU1MvyOVT6DVToc29gFIWGQZBi/KgZ4XttT0fUVL5ZMCCPGVcXNTE
 60DZjl/DAH1pJEtXyyMdEihaKgyu1xUFTk95frfewIhOLz01Tsx9Io0cFdayZAbwII6W
 TQ+g==
X-Gm-Message-State: AOAM533RYfDsGnbE5Bg1JLXge6B66E3K1Olfor9FqXLOr1baw3S7qizV
 w8C97bVR942hAUQq3lWmdom0IIk/T4H6v6HUjl5Arg==
X-Google-Smtp-Source: ABdhPJyJUAC1VS3RD0ecmw55viKOgNM/jamiPuGjXZrbfo0X0xDlYgXF9VyXlUA4oU1aIaRJA2ZCMdq0QzoRcmRTozQ=
X-Received: by 2002:a9f:2701:: with SMTP id a1mr12424015uaa.120.1614104632957; 
 Tue, 23 Feb 2021 10:23:52 -0800 (PST)
MIME-Version: 1.0
References: <20210218201538.701509-1-dje@google.com>
 <20210218201538.701509-3-dje@google.com>
 <YC+MTYWe4HYpcAIk@redhat.com>
 <CADPb22ROPdpaQGobxP_vhcW=KBJVV4FwrmGb3+Z6nZecymT4BA@mail.gmail.com>
 <YDN73SqaDQDtwlgZ@redhat.com>
In-Reply-To: <YDN73SqaDQDtwlgZ@redhat.com>
From: Doug Evans <dje@google.com>
Date: Tue, 23 Feb 2021 10:23:15 -0800
Message-ID: <CADPb22S5OOo94qvk9+B-D26f-r2ZzKzN59=dhVAFwcvP_Pws5w@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] util/qemu-sockets.c: Split host:port parsing out
 of inet_parse
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Content-Type: multipart/alternative; boundary="00000000000047a67b05bc050580"
Received-SPF: pass client-ip=2607:f8b0:4864:20::931;
 envelope-from=dje@google.com; helo=mail-ua1-x931.google.com
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

--00000000000047a67b05bc050580
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 22, 2021 at 1:39 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> On Fri, Feb 19, 2021 at 02:17:42PM -0800, Doug Evans wrote:
> > On Fri, Feb 19, 2021 at 2:00 AM Daniel P. Berrang=C3=A9 <berrange@redha=
t.com>
> > wrote:
> >
> > > On Thu, Feb 18, 2021 at 12:15:36PM -0800, Doug Evans wrote:
> > > > The parsing is moved into new function inet_parse_host_and_port.
> > > > This is done in preparation for using the function in net/slirp.c.
> > > >
> > > > Signed-off-by: Doug Evans <dje@google.com>
> > > > ---
> > > >
> > > > Changes from v3:
> > > > - this patch is new in v4
> > > >   - provides new utility: inet_parse_host_and_port, updates
> inet_parse
> > > >     to use it
> > > >
> > > >  include/qemu/sockets.h |  3 ++
> > > >  util/qemu-sockets.c    | 94
> +++++++++++++++++++++++++++++++-----------
> > > >  2 files changed, 72 insertions(+), 25 deletions(-)
> > > >
> > > > diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
> > > > index 7d1f813576..f720378a6b 100644
> > > > --- a/include/qemu/sockets.h
> > > > +++ b/include/qemu/sockets.h
> > > > @@ -31,6 +31,9 @@ int socket_set_fast_reuse(int fd);
> > > >
> > > >  int inet_ai_family_from_address(InetSocketAddress *addr,
> > > >                                  Error **errp);
> > > > +const char* inet_parse_host_and_port(const char* str, int
> terminator,
> > > > +                                     char **addr, char **port, boo=
l
> > > *is_v6,
> > > > +                                     Error **errp);
> > > >  int inet_parse(InetSocketAddress *addr, const char *str, Error
> **errp);
> > > >  int inet_connect(const char *str, Error **errp);
> > > >  int inet_connect_saddr(InetSocketAddress *saddr, Error **errp);
> > > > diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> > > > index 8af0278f15..9fca7d9212 100644
> > > > --- a/util/qemu-sockets.c
> > > > +++ b/util/qemu-sockets.c
> > > > @@ -615,44 +615,88 @@ static int inet_parse_flag(const char
> *flagname,
> > > const char *optstr, bool *val,
> > > >      return 0;
> > > >  }
> > > >
> > > > -int inet_parse(InetSocketAddress *addr, const char *str, Error
> **errp)
> > > > +/*
> > > > + * Parse an inet host and port as "host:port<terminator>".
> > > > + * Terminator may be '\0'.
> > > > + * The syntax for ipv4 addresses is: address:port.
> > > > + * The syntax for ipv6 addresses is: [address]:port.
> > >
> > > It also supports
> > >
> > >    "The syntax for hostnames is hostname:port
> > >
> > > > + * On success, returns a pointer to the terminator. Space for the
> > > address and
> > > > + * port is malloced and stored in *host, *port, the caller must
> free.
> > > > + * *is_v6 indicates whether the address is ipv4 or ipv6. If ipv6
> then
> > > the
> > > > + * surrounding [] brackets are removed.
> > >
> > > When is_v6 is true, it indicates that a numeric ipv6 address was give=
n.
> > > When false either a numberic ipv4 address or hostname was given.
> > >
> > > > + * On failure NULL is returned with the error stored in *errp.
> > > > + */
> > > > +const char* inet_parse_host_and_port(const char* str, int
> terminator,
> > > > +                                     char **hostp, char **portp,
> bool
> > > *is_v6,
> > > > +                                     Error **errp)
> > > >  {
> > > > -    const char *optstr, *h;
> > > > +    const char *terminator_ptr =3D strchr(str, terminator);
> > > > +    g_autofree char *buf =3D NULL;
> > > >      char host[65];
> > > >      char port[33];
> > > > -    int to;
> > > > -    int pos;
> > > > -    char *begin;
> > > >
> > > > -    memset(addr, 0, sizeof(*addr));
> > > > +    if (terminator_ptr =3D=3D NULL) {
> > > > +        /* If the terminator isn't found then use the entire
> string. */
> > > > +        terminator_ptr =3D str + strlen(str);
> > > > +    }
> > > > +    buf =3D g_strndup(str, terminator_ptr - str);
> > > >
> > > > -    /* parse address */
> > > > -    if (str[0] =3D=3D ':') {
> > > > -        /* no host given */
> > > > -        host[0] =3D '\0';
> > > > -        if (sscanf(str, ":%32[^,]%n", port, &pos) !=3D 1) {
> > > > -            error_setg(errp, "error parsing port in address '%s'",
> str);
> > > > -            return -1;
> > > > -        }
> > >
> > >
> > > > -    } else if (str[0] =3D=3D '[') {
> > > > +    if (buf[0] =3D=3D '[') {
> > > >          /* IPv6 addr */
> > > > -        if (sscanf(str, "[%64[^]]]:%32[^,]%n", host, port, &pos) !=
=3D
> 2) {
> > > > -            error_setg(errp, "error parsing IPv6 address '%s'",
> str);
> > > > -            return -1;
> > > > +        if (buf[1] =3D=3D ']') {
> > > > +            /* sscanf %[ doesn't recognize empty contents. */
> > > > +            host[0] =3D '\0';
> > > > +            if (sscanf(buf, "[]:%32s", port) !=3D 1) {
> > > > +                error_setg(errp, "error parsing IPv6 host:port
> '%s'",
> > > buf);
> > > > +                return NULL;
> > > > +            }
> > >
> > > This is introducing new functionality to the parser. Current callers
> > > let empty string ":port" be used for both ipv4 and ipv6, based
> > > on whether the flags ",ipv4[=3Don|off],ipv6[=3Don|off]" later follow.
> > >
> >
> >
> > We're creating a new utility subroutine: Let's decide what the API is f=
or
> > it.
> > The fact that inet_parse is passed additional parameters to specify ipv=
4
> vs
> > ipv6 is not something this new subroutine should care about.
> >
> > I presume you want an explicit way to represent an empty ipv6 hostname
> > > to avoid changing semantics for existing slirp CLI args, where the
> > > existing ":port" exclusively means ipv4. IIC, this is also why you
> > > needed to introduce the "is_v6" flag, because any non-empty address
> > > can be reliably parsed without needing this flag.
> > >
> >
> >
> > Actually, no. The "is_v6" flag is needed because otherwise the caller h=
as
> > no means (other than maybe subsequent grepping for "." vs ":") for
> knowing
> > whether str contained "address" or "[address]".
> >
> > Plus, for my needs I don't need to support "[hostname]". If someone lat=
er
> > wants that supported that can be designed then.
> > Thus supporting "[hostname]" is not something I'm considering in this
> > patchset.
> >
> >
> >
> > >
> > > This is reasonable, but any such functional change should be in a
> > > separate commit from refactoring.
> > >
> > > IOW, remove this and the is_v6 flag, and add them in a separate
> > > patch to explain to the need for new functionality in the parsing.
> > >
> > > Given that existing callers don't need to support "[]", we should
> > > not let that be parsed, unless the caller passing a "is_v6" pointer
> > > which is not NULL.
> > >
> > > > +        } else {
> > > > +            if (sscanf(buf, "[%64[^]]]:%32s", host, port) !=3D 2) =
{
> > > > +                error_setg(errp, "error parsing IPv6 host:port
> '%s'",
> > > buf);
> > > > +                return NULL;
> > > > +            }
> > > >          }
> > > >      } else {
> > > > -        /* hostname or IPv4 addr */
> > > > -        if (sscanf(str, "%64[^:]:%32[^,]%n", host, port, &pos) !=
=3D
> 2) {
> > > > -            error_setg(errp, "error parsing address '%s'", str);
> > > > -            return -1;
> > > > +        if (buf[0] =3D=3D ':') {
> > > > +            /* no host given */
> > > > +            host[0] =3D '\0';
> > > > +            if (sscanf(buf, ":%32s", port) !=3D 1) {
> > > > +                error_setg(errp, "error parsing host:port '%s'",
> buf);
> > > > +                return NULL;
> > > > +            }
> > >
> > > It would be preferreable if the parsing code was not re-ordered when
> > > extracting it. It doesn't look like a functional change, but I'm unsu=
re
> > > why you moved it ?
> > >
> > > > +        } else {
> > > > +            /* hostname or IPv4 addr */
> > > > +            if (sscanf(buf, "%64[^:]:%32s", host, port) !=3D 2) {
> > > > +                error_setg(errp, "error parsing host:port '%s'",
> buf);
> > > > +                return NULL;
> > > > +            }
> > > >          }
> > > >      }
> > > >
> > > > -    addr->host =3D g_strdup(host);
> > > > -    addr->port =3D g_strdup(port);
> > > > +    *hostp =3D g_strdup(host);
> > > > +    *portp =3D g_strdup(port);
> > > > +    *is_v6 =3D buf[0] =3D=3D '[';
> > > > +
> > > > +    return terminator_ptr;
> > > > +}
> > > > +
> > > > +int inet_parse(InetSocketAddress *addr, const char *str, Error
> **errp)
> > > > +{
> > > > +    const char *optstr, *h;
> > > > +    bool is_v6;
> > > > +    int to;
> > > > +    int pos;
> > > > +    char *begin;
> > > > +
> > > > +    memset(addr, 0, sizeof(*addr));
> > > > +
> > > > +    optstr =3D inet_parse_host_and_port(str, ',', &addr->host,
> > > &addr->port,
> > > > +                                      &is_v6, errp);
> > >
> > > Just pass NULL since we don't need is_v6
> > >
> > > > +    if (optstr =3D=3D NULL) {
> > > > +        return -1;
> > > > +    }
> > > >
> > > >      /* parse options */
> > > > -    optstr =3D str + pos;
> > > >      h =3D strstr(optstr, ",to=3D");
> > > >      if (h) {
> > > >          h +=3D 4;
> > > > --
> > > > 2.30.0.617.g56c4b15f3c-goog
> > > >
> >
> >
> >
> > I can certainly defer [] handling to a later patch series.
> > Splitting the patch into one with the is_v6 flag and one without is a l=
ot
> > of work for little gain (zero IMO): When looking at
> > inet_parse_host_and_port() as its own utility subroutine, not providing
> the
> > caller with the means to distinguish whether str was "address:port" or
> > "[address]:port" is a poor API.
>
> In general callers shouldn't care about which format was parsed. The use
> of [] is just a mechanism to reliably separate the port from the address.
> Once you have the address part getaddrinfo() will reliably parse the
> address into a sockaddr struct on its own. The is_v6 flag is only needed
> for the legacy compat needs in slirp, even that is only if we want to
> have strict equivalence with historical behaviour, as opposed to changing
> empty string to mean to listen on both IPv4+6 concurrently..
>


I guess I'll wait for Samuel to review the net/slirp changes. No point in
continually sending revisions until then.

--00000000000047a67b05bc050580
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">On Mon, Feb 22, 2021 at 1:39 AM Daniel P. Berrang=C3=A9 &lt;<=
a href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt; wrote:<br=
></div></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">On Fri, Feb 19, 2021 at 02:17:42PM -0800, Doug Evans wrote:<=
br>
&gt; On Fri, Feb 19, 2021 at 2:00 AM Daniel P. Berrang=C3=A9 &lt;<a href=3D=
"mailto:berrange@redhat.com" target=3D"_blank">berrange@redhat.com</a>&gt;<=
br>
&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Thu, Feb 18, 2021 at 12:15:36PM -0800, Doug Evans wrote:<br>
&gt; &gt; &gt; The parsing is moved into new function inet_parse_host_and_p=
ort.<br>
&gt; &gt; &gt; This is done in preparation for using the function in net/sl=
irp.c.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Doug Evans &lt;<a href=3D"mailto:dje@google.c=
om" target=3D"_blank">dje@google.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Changes from v3:<br>
&gt; &gt; &gt; - this patch is new in v4<br>
&gt; &gt; &gt;=C2=A0 =C2=A0- provides new utility: inet_parse_host_and_port=
, updates inet_parse<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0to use it<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 include/qemu/sockets.h |=C2=A0 3 ++<br>
&gt; &gt; &gt;=C2=A0 util/qemu-sockets.c=C2=A0 =C2=A0 | 94 ++++++++++++++++=
+++++++++++++++-----------<br>
&gt; &gt; &gt;=C2=A0 2 files changed, 72 insertions(+), 25 deletions(-)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h=
<br>
&gt; &gt; &gt; index 7d1f813576..f720378a6b 100644<br>
&gt; &gt; &gt; --- a/include/qemu/sockets.h<br>
&gt; &gt; &gt; +++ b/include/qemu/sockets.h<br>
&gt; &gt; &gt; @@ -31,6 +31,9 @@ int socket_set_fast_reuse(int fd);<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 int inet_ai_family_from_address(InetSocketAddress *add=
r,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Error **errp);<=
br>
&gt; &gt; &gt; +const char* inet_parse_host_and_port(const char* str, int t=
erminator,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ch=
ar **addr, char **port, bool<br>
&gt; &gt; *is_v6,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Er=
ror **errp);<br>
&gt; &gt; &gt;=C2=A0 int inet_parse(InetSocketAddress *addr, const char *st=
r, Error **errp);<br>
&gt; &gt; &gt;=C2=A0 int inet_connect(const char *str, Error **errp);<br>
&gt; &gt; &gt;=C2=A0 int inet_connect_saddr(InetSocketAddress *saddr, Error=
 **errp);<br>
&gt; &gt; &gt; diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c<br>
&gt; &gt; &gt; index 8af0278f15..9fca7d9212 100644<br>
&gt; &gt; &gt; --- a/util/qemu-sockets.c<br>
&gt; &gt; &gt; +++ b/util/qemu-sockets.c<br>
&gt; &gt; &gt; @@ -615,44 +615,88 @@ static int inet_parse_flag(const char =
*flagname,<br>
&gt; &gt; const char *optstr, bool *val,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; &gt; &gt;=C2=A0 }<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -int inet_parse(InetSocketAddress *addr, const char *str, Er=
ror **errp)<br>
&gt; &gt; &gt; +/*<br>
&gt; &gt; &gt; + * Parse an inet host and port as &quot;host:port&lt;termin=
ator&gt;&quot;.<br>
&gt; &gt; &gt; + * Terminator may be &#39;\0&#39;.<br>
&gt; &gt; &gt; + * The syntax for ipv4 addresses is: address:port.<br>
&gt; &gt; &gt; + * The syntax for ipv6 addresses is: [address]:port.<br>
&gt; &gt;<br>
&gt; &gt; It also supports<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 &quot;The syntax for hostnames is hostname:port<br>
&gt; &gt;<br>
&gt; &gt; &gt; + * On success, returns a pointer to the terminator. Space f=
or the<br>
&gt; &gt; address and<br>
&gt; &gt; &gt; + * port is malloced and stored in *host, *port, the caller =
must free.<br>
&gt; &gt; &gt; + * *is_v6 indicates whether the address is ipv4 or ipv6. If=
 ipv6 then<br>
&gt; &gt; the<br>
&gt; &gt; &gt; + * surrounding [] brackets are removed.<br>
&gt; &gt;<br>
&gt; &gt; When is_v6 is true, it indicates that a numeric ipv6 address was =
given.<br>
&gt; &gt; When false either a numberic ipv4 address or hostname was given.<=
br>
&gt; &gt;<br>
&gt; &gt; &gt; + * On failure NULL is returned with the error stored in *er=
rp.<br>
&gt; &gt; &gt; + */<br>
&gt; &gt; &gt; +const char* inet_parse_host_and_port(const char* str, int t=
erminator,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ch=
ar **hostp, char **portp, bool<br>
&gt; &gt; *is_v6,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Er=
ror **errp)<br>
&gt; &gt; &gt;=C2=A0 {<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 const char *optstr, *h;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 const char *terminator_ptr =3D strchr(str, te=
rminator);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 g_autofree char *buf =3D NULL;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 char host[65];<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 char port[33];<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 int to;<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 int pos;<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 char *begin;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 memset(addr, 0, sizeof(*addr));<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 if (terminator_ptr =3D=3D NULL) {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If the terminator isn&#39;t =
found then use the entire string. */<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 terminator_ptr =3D str + strlen=
(str);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 buf =3D g_strndup(str, terminator_ptr - str);=
<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 /* parse address */<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 if (str[0] =3D=3D &#39;:&#39;) {<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* no host given */<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 host[0] =3D &#39;\0&#39;;<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sscanf(str, &quot;:%32[^,]%=
n&quot;, port, &amp;pos) !=3D 1) {<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, =
&quot;error parsing port in address &#39;%s&#39;&quot;, str);<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 } else if (str[0] =3D=3D &#39;[&#39;) {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 if (buf[0] =3D=3D &#39;[&#39;) {<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* IPv6 addr */<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sscanf(str, &quot;[%64[^]]]=
:%32[^,]%n&quot;, host, port, &amp;pos) !=3D 2) {<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, =
&quot;error parsing IPv6 address &#39;%s&#39;&quot;, str);<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (buf[1] =3D=3D &#39;]&#39;) =
{<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* sscanf %[ does=
n&#39;t recognize empty contents. */<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host[0] =3D &#39;=
\0&#39;;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sscanf(buf, &=
quot;[]:%32s&quot;, port) !=3D 1) {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err=
or_setg(errp, &quot;error parsing IPv6 host:port &#39;%s&#39;&quot;,<br>
&gt; &gt; buf);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret=
urn NULL;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt; This is introducing new functionality to the parser. Current call=
ers<br>
&gt; &gt; let empty string &quot;:port&quot; be used for both ipv4 and ipv6=
, based<br>
&gt; &gt; on whether the flags &quot;,ipv4[=3Don|off],ipv6[=3Don|off]&quot;=
 later follow.<br>
&gt; &gt;<br>
&gt; <br>
&gt; <br>
&gt; We&#39;re creating a new utility subroutine: Let&#39;s decide what the=
 API is for<br>
&gt; it.<br>
&gt; The fact that inet_parse is passed additional parameters to specify ip=
v4 vs<br>
&gt; ipv6 is not something this new subroutine should care about.<br>
&gt; <br>
&gt; I presume you want an explicit way to represent an empty ipv6 hostname=
<br>
&gt; &gt; to avoid changing semantics for existing slirp CLI args, where th=
e<br>
&gt; &gt; existing &quot;:port&quot; exclusively means ipv4. IIC, this is a=
lso why you<br>
&gt; &gt; needed to introduce the &quot;is_v6&quot; flag, because any non-e=
mpty address<br>
&gt; &gt; can be reliably parsed without needing this flag.<br>
&gt; &gt;<br>
&gt; <br>
&gt; <br>
&gt; Actually, no. The &quot;is_v6&quot; flag is needed because otherwise t=
he caller has<br>
&gt; no means (other than maybe subsequent grepping for &quot;.&quot; vs &q=
uot;:&quot;) for knowing<br>
&gt; whether str contained &quot;address&quot; or &quot;[address]&quot;.<br=
>
&gt; <br>
&gt; Plus, for my needs I don&#39;t need to support &quot;[hostname]&quot;.=
 If someone later<br>
&gt; wants that supported that can be designed then.<br>
&gt; Thus supporting &quot;[hostname]&quot; is not something I&#39;m consid=
ering in this<br>
&gt; patchset.<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt; This is reasonable, but any such functional change should be in a=
<br>
&gt; &gt; separate commit from refactoring.<br>
&gt; &gt;<br>
&gt; &gt; IOW, remove this and the is_v6 flag, and add them in a separate<b=
r>
&gt; &gt; patch to explain to the need for new functionality in the parsing=
.<br>
&gt; &gt;<br>
&gt; &gt; Given that existing callers don&#39;t need to support &quot;[]&qu=
ot;, we should<br>
&gt; &gt; not let that be parsed, unless the caller passing a &quot;is_v6&q=
uot; pointer<br>
&gt; &gt; which is not NULL.<br>
&gt; &gt;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sscanf(buf, &=
quot;[%64[^]]]:%32s&quot;, host, port) !=3D 2) {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err=
or_setg(errp, &quot;error parsing IPv6 host:port &#39;%s&#39;&quot;,<br>
&gt; &gt; buf);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret=
urn NULL;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* hostname or IPv4 addr */<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sscanf(str, &quot;%64[^:]:%=
32[^,]%n&quot;, host, port, &amp;pos) !=3D 2) {<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, =
&quot;error parsing address &#39;%s&#39;&quot;, str);<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (buf[0] =3D=3D &#39;:&#39;) =
{<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* no host given =
*/<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host[0] =3D &#39;=
\0&#39;;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sscanf(buf, &=
quot;:%32s&quot;, port) !=3D 1) {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err=
or_setg(errp, &quot;error parsing host:port &#39;%s&#39;&quot;, buf);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret=
urn NULL;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt; It would be preferreable if the parsing code was not re-ordered w=
hen<br>
&gt; &gt; extracting it. It doesn&#39;t look like a functional change, but =
I&#39;m unsure<br>
&gt; &gt; why you moved it ?<br>
&gt; &gt;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* hostname or IP=
v4 addr */<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sscanf(buf, &=
quot;%64[^:]:%32s&quot;, host, port) !=3D 2) {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err=
or_setg(errp, &quot;error parsing host:port &#39;%s&#39;&quot;, buf);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret=
urn NULL;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 addr-&gt;host =3D g_strdup(host);<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 addr-&gt;port =3D g_strdup(port);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 *hostp =3D g_strdup(host);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 *portp =3D g_strdup(port);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 *is_v6 =3D buf[0] =3D=3D &#39;[&#39;;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 return terminator_ptr;<br>
&gt; &gt; &gt; +}<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +int inet_parse(InetSocketAddress *addr, const char *str, Er=
ror **errp)<br>
&gt; &gt; &gt; +{<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 const char *optstr, *h;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 bool is_v6;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 int to;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 int pos;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 char *begin;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 memset(addr, 0, sizeof(*addr));<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 optstr =3D inet_parse_host_and_port(str, &#39=
;,&#39;, &amp;addr-&gt;host,<br>
&gt; &gt; &amp;addr-&gt;port,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
amp;is_v6, errp);<br>
&gt; &gt;<br>
&gt; &gt; Just pass NULL since we don&#39;t need is_v6<br>
&gt; &gt;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 if (optstr =3D=3D NULL) {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 /* parse options */<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 optstr =3D str + pos;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 h =3D strstr(optstr, &quot;,to=3D&quot;)=
;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 if (h) {<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 h +=3D 4;<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; 2.30.0.617.g56c4b15f3c-goog<br>
&gt; &gt; &gt;<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; I can certainly defer [] handling to a later patch series.<br>
&gt; Splitting the patch into one with the is_v6 flag and one without is a =
lot<br>
&gt; of work for little gain (zero IMO): When looking at<br>
&gt; inet_parse_host_and_port() as its own utility subroutine, not providin=
g the<br>
&gt; caller with the means to distinguish whether str was &quot;address:por=
t&quot; or<br>
&gt; &quot;[address]:port&quot; is a poor API.<br>
<br>
In general callers shouldn&#39;t care about which format was parsed. The us=
e<br>
of [] is just a mechanism to reliably separate the port from the address.<b=
r>
Once you have the address part getaddrinfo() will reliably parse the<br>
address into a sockaddr struct on its own. The is_v6 flag is only needed<br=
>
for the legacy compat needs in slirp, even that is only if we want to <br>
have strict equivalence with historical behaviour, as opposed to changing<b=
r>
empty string to mean to listen on both IPv4+6 concurrently..<br></blockquot=
e><div><br></div><div><br></div><div class=3D"gmail_default" style=3D"font-=
size:small">I guess I&#39;ll wait for Samuel to review the net/slirp change=
s. No point in continually sending revisions until then.</div></div></div>

--00000000000047a67b05bc050580--

