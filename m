Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED02632657E
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 17:24:53 +0100 (CET)
Received: from localhost ([::1]:56550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFfvA-0007gQ-WE
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 11:24:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1lFfsY-00061C-8K
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 11:22:12 -0500
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35]:46368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1lFfsP-0004F8-I5
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 11:22:08 -0500
Received: by mail-vk1-xa35.google.com with SMTP id j188so2043934vke.13
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 08:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aAy1GNCv3Zuuaueorh0TEO0DhMmEhORf18/5PPbD3ic=;
 b=Ur7RFVy0jkAtWYApvSJ0z/VoQp7CAWrX77/tWvYx/RGW7Vmq69Grw7/9dWRfLUq93w
 RWuiKoLVRB+WBxQfwGOVf91fpsFlvL4A3seoNaoPd1asmLMM0MegtniaHBuGiWqIpxyK
 Y4PxvCXk9jc3g6n2/xbL9nKcs6xR3zQ3BMM1lUhYCgWYFGrblF7uEsmJMWr2NQmq4sUa
 uOxqaKf0Vqn9/EsNko18tC0hSvLQ+OegmAPOQDguy0c2oOFkkcv7N3u4xg4gReezmzuZ
 PqP4OCWXqxcr5bPrRkej69ZVJPaTdc0l3ZvD/Xl+z3xZmdaED+eAqU0WXonPzPT5vTtq
 IKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aAy1GNCv3Zuuaueorh0TEO0DhMmEhORf18/5PPbD3ic=;
 b=KxNLCFHOvTM+eIz9MLW3gikOjYFQ8KfGVrqY265cSw5acxcV/Zvw9m8i7ocBsfbnSo
 CgU26DiX+UErYJL1gLCqDtP0OlPbF5CNjS+TZKofEShkPfE/S9zXckTQTMxwHCS2L0hK
 E3cA6VswEyK2Pt9LYv5EEiWsEqK2aC9XUESVO4kYf4DuPISgm7c0hqfPaDr3NjCZ417y
 85VFeF94OPyd4dZD+s2BMks8IehmYvpLttoPXgTi2TFA43is9+iHFH2VmdyxopRxCZ8m
 6oYia+/Bj27TkIcXpLc0EKwc0OrjZnzZpFIzutiWm7C9WchTmhv7bWdPjjiNugvFa9Y0
 Cd1w==
X-Gm-Message-State: AOAM532zXZHjXlkxBudArmDhmqQzAZbO/aIFwCHQ6HL9oE1VOWZJmXSD
 vLT9ON8kynS0bEtCxei78eex33mUUqaMjQ4UFolDHQ==
X-Google-Smtp-Source: ABdhPJzmrAi1ndgKM19LR9KGsCEvXehYMIQdeCu1Qc35pR5IrMzoMwdjspuJq/ebMsJDEAMaNqdP4rnKH0rOn6NJ0wo=
X-Received: by 2002:a1f:7281:: with SMTP id n123mr2098268vkc.8.1614356519080; 
 Fri, 26 Feb 2021 08:21:59 -0800 (PST)
MIME-Version: 1.0
References: <20210226120607.675753-1-marcandre.lureau@redhat.com>
In-Reply-To: <20210226120607.675753-1-marcandre.lureau@redhat.com>
From: Doug Evans <dje@google.com>
Date: Fri, 26 Feb 2021 08:21:21 -0800
Message-ID: <CADPb22TSqOq7dxdnu=eMmeW-nPcPWn2T2RgyztyDA=jWE84HsQ@mail.gmail.com>
Subject: Re: [PATCH] net: remove qemu_ether_ntoa()
To: marcandre.lureau@redhat.com
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-trivial@nongnu.org, 
 Jason Wang <jasowang@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000dceaf705bc3faa0a"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a35;
 envelope-from=dje@google.com; helo=mail-vk1-xa35.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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

--000000000000dceaf705bc3faa0a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 26, 2021 at 4:06 AM <marcandre.lureau@redhat.com> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> The function is not thread-safe and sets a bad example. It's used in a
> single place for tracing, so open-code the format string like other
> trace events with MAC addresses.
>
> Cc: qemu-trivial@nongnu.org
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/qemu-common.h |  1 -
>  net/announce.c        |  8 +++++++-
>  util/cutils.c         | 13 -------------
>  net/trace-events      |  2 +-
>  4 files changed, 8 insertions(+), 16 deletions(-)
>
> diff --git a/include/qemu-common.h b/include/qemu-common.h
> index 654621444e..209133bfca 100644
> --- a/include/qemu-common.h
> +++ b/include/qemu-common.h
> @@ -132,7 +132,6 @@ void qemu_hexdump(FILE *fp, const char *prefix,
>   */
>  int parse_debug_env(const char *name, int max, int initial);
>
> -const char *qemu_ether_ntoa(const MACAddr *mac);
>  void page_size_init(void);
>
>  /* returns non-zero if dump is in progress, otherwise zero is
> diff --git a/net/announce.c b/net/announce.c
> index 26f057f5ee..fc0c6baace 100644
> --- a/net/announce.c
> +++ b/net/announce.c
> @@ -146,7 +146,13 @@ static void qemu_announce_self_iter(NICState *nic,
> void *opaque)
>
>      trace_qemu_announce_self_iter(timer->params.has_id ? timer->params.i=
d
> : "_",
>                                    nic->ncs->name,
> -                                  qemu_ether_ntoa(&nic->conf->macaddr),
> skip);
> +                                  nic->conf->macaddr.a[0],
> +                                  nic->conf->macaddr.a[1],
> +                                  nic->conf->macaddr.a[2],
> +                                  nic->conf->macaddr.a[3],
> +                                  nic->conf->macaddr.a[4],
> +                                  nic->conf->macaddr.a[5],
> +                                  skip);
>
>      if (!skip) {
>          len =3D announce_self_create(buf, nic->conf->macaddr.a);
> diff --git a/util/cutils.c b/util/cutils.c
> index 70c7d6efbd..b5460a72b4 100644
> --- a/util/cutils.c
> +++ b/util/cutils.c
> @@ -847,19 +847,6 @@ int parse_debug_env(const char *name, int max, int
> initial)
>      return debug;
>  }
>
> -/*
> - * Helper to print ethernet mac address
> - */
> -const char *qemu_ether_ntoa(const MACAddr *mac)
> -{
> -    static char ret[18];
> -
> -    snprintf(ret, sizeof(ret), "%02x:%02x:%02x:%02x:%02x:%02x",
> -             mac->a[0], mac->a[1], mac->a[2], mac->a[3], mac->a[4],
> mac->a[5]);
> -
> -    return ret;
> -}
> -
>  /*
>   * Return human readable string for size @val.
>   * @val can be anything that uint64_t allows (no more than "16 EiB").
> diff --git a/net/trace-events b/net/trace-events
> index bfaff7891d..07d6203602 100644
> --- a/net/trace-events
> +++ b/net/trace-events
> @@ -1,7 +1,7 @@
>  # See docs/devel/tracing.txt for syntax documentation.
>
>  # announce.c
> -qemu_announce_self_iter(const char *id, const char *name, const char
> *mac, int skip) "%s:%s:%s skip: %d"
> +qemu_announce_self_iter(const char *id, const char *name, char mac0, cha=
r
> mac1, char mac2, char mac3, char mac4, char mac5, int skip)
> "%s:%s:%02x:%02x:%02x:%02x:%02x:%02x skip: %d"
>  qemu_announce_timer_del(bool free_named, bool free_timer, char *id) "fre=
e
> named: %d free timer: %d id: %s"
>
>  # vhost-user.c
> --
> 2.29.0
>


It's pretty tedious to open code that.
How about instead change qemu_ether_ntoa to being thread-safe?

And, separately, add a bit of type safety and put eth addrs in a struct?

--000000000000dceaf705bc3faa0a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">On Fri, Feb 26, 2021 at 4:06 AM &lt;<a href=3D"mailto:marcand=
re.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt; wrote:<br></div><=
/div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@=
redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
<br>
The function is not thread-safe and sets a bad example. It&#39;s used in a<=
br>
single place for tracing, so open-code the format string like other<br>
trace events with MAC addresses.<br>
<br>
Cc: <a href=3D"mailto:qemu-trivial@nongnu.org" target=3D"_blank">qemu-trivi=
al@nongnu.org</a><br>
Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
---<br>
=C2=A0include/qemu-common.h |=C2=A0 1 -<br>
=C2=A0net/announce.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 +++++++-<br>
=C2=A0util/cutils.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 13 -------------<br>
=C2=A0net/trace-events=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A04 files changed, 8 insertions(+), 16 deletions(-)<br>
<br>
diff --git a/include/qemu-common.h b/include/qemu-common.h<br>
index 654621444e..209133bfca 100644<br>
--- a/include/qemu-common.h<br>
+++ b/include/qemu-common.h<br>
@@ -132,7 +132,6 @@ void qemu_hexdump(FILE *fp, const char *prefix,<br>
=C2=A0 */<br>
=C2=A0int parse_debug_env(const char *name, int max, int initial);<br>
<br>
-const char *qemu_ether_ntoa(const MACAddr *mac);<br>
=C2=A0void page_size_init(void);<br>
<br>
=C2=A0/* returns non-zero if dump is in progress, otherwise zero is<br>
diff --git a/net/announce.c b/net/announce.c<br>
index 26f057f5ee..fc0c6baace 100644<br>
--- a/net/announce.c<br>
+++ b/net/announce.c<br>
@@ -146,7 +146,13 @@ static void qemu_announce_self_iter(NICState *nic, voi=
d *opaque)<br>
<br>
=C2=A0 =C2=A0 =C2=A0trace_qemu_announce_self_iter(timer-&gt;params.has_id ?=
 timer-&gt;<a href=3D"http://params.id" rel=3D"noreferrer" target=3D"_blank=
">params.id</a> : &quot;_&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nic-&gt;ncs-&gt;name,<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_ether_ntoa(&amp;nic-&gt;=
conf-&gt;macaddr), skip);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nic-&gt;conf-&gt;macaddr.a[0]=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nic-&gt;conf-&gt;macaddr.a[1]=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nic-&gt;conf-&gt;macaddr.a[2]=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nic-&gt;conf-&gt;macaddr.a[3]=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nic-&gt;conf-&gt;macaddr.a[4]=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nic-&gt;conf-&gt;macaddr.a[5]=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 skip);<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (!skip) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D announce_self_create(buf, nic-&gt=
;conf-&gt;macaddr.a);<br>
diff --git a/util/cutils.c b/util/cutils.c<br>
index 70c7d6efbd..b5460a72b4 100644<br>
--- a/util/cutils.c<br>
+++ b/util/cutils.c<br>
@@ -847,19 +847,6 @@ int parse_debug_env(const char *name, int max, int ini=
tial)<br>
=C2=A0 =C2=A0 =C2=A0return debug;<br>
=C2=A0}<br>
<br>
-/*<br>
- * Helper to print ethernet mac address<br>
- */<br>
-const char *qemu_ether_ntoa(const MACAddr *mac)<br>
-{<br>
-=C2=A0 =C2=A0 static char ret[18];<br>
-<br>
-=C2=A0 =C2=A0 snprintf(ret, sizeof(ret), &quot;%02x:%02x:%02x:%02x:%02x:%0=
2x&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mac-&gt;a[0], mac-&gt;a[1]=
, mac-&gt;a[2], mac-&gt;a[3], mac-&gt;a[4], mac-&gt;a[5]);<br>
-<br>
-=C2=A0 =C2=A0 return ret;<br>
-}<br>
-<br>
=C2=A0/*<br>
=C2=A0 * Return human readable string for size @val.<br>
=C2=A0 * @val can be anything that uint64_t allows (no more than &quot;16 E=
iB&quot;).<br>
diff --git a/net/trace-events b/net/trace-events<br>
index bfaff7891d..07d6203602 100644<br>
--- a/net/trace-events<br>
+++ b/net/trace-events<br>
@@ -1,7 +1,7 @@<br>
=C2=A0# See docs/devel/tracing.txt for syntax documentation.<br>
<br>
=C2=A0# announce.c<br>
-qemu_announce_self_iter(const char *id, const char *name, const char *mac,=
 int skip) &quot;%s:%s:%s skip: %d&quot;<br>
+qemu_announce_self_iter(const char *id, const char *name, char mac0, char =
mac1, char mac2, char mac3, char mac4, char mac5, int skip) &quot;%s:%s:%02=
x:%02x:%02x:%02x:%02x:%02x skip: %d&quot;<br>
=C2=A0qemu_announce_timer_del(bool free_named, bool free_timer, char *id) &=
quot;free named: %d free timer: %d id: %s&quot;<br>
<br>
=C2=A0# vhost-user.c<br>
-- <br>
2.29.0<br></blockquote><div><br></div><div><br></div><div><div class=3D"gma=
il_default" style=3D"font-size:small">It&#39;s pretty tedious to open code =
that.</div><div class=3D"gmail_default" style=3D"font-size:small">How about=
 instead change qemu_ether_ntoa to being thread-safe?</div></div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">And, separately, add a bit of type safet=
y and put eth addrs in a struct?</div></div></div>

--000000000000dceaf705bc3faa0a--

