Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDCF51BB30
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 10:56:47 +0200 (CEST)
Received: from localhost ([::1]:54712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmXHy-0003tJ-Gk
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 04:56:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nmWj9-0005Mk-1q
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:20:47 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:38576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nmWj7-0000UB-7m
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:20:46 -0400
Received: by mail-lf1-x129.google.com with SMTP id p12so6246363lfs.5
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 01:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2yRpnXMoQu2cIFYwPSRBn6p9fRT9C5DO0R/eqKUI760=;
 b=Hs10575Cf4/s2nTtV2xU+XtLNVBlcj8PGrkOCZmcQL2vBKn1ISkt2+uCPkt398Mird
 scacC758nbOTZvQWwJLMuuV/ZJnQHQPPfQA8GBfRmm2pnPEdKUdnC1z29XWScRrKSDiZ
 CpDx6WxDVFYkZAk9kyI1B3qmmGQQ5AxsVG6EAlmLCRL3LRzFVo+xY52Wn8zOqHJF04+E
 5c+vFiRKRHLVkY199YTVXZ6OKC6YTl2SvdHmA/Yfw7+ySkE6/fOZwMslXbfp/1sMVakk
 k3CFrfIMCaq22/Of1V6ukfHMJ1EnrpNfXmWAoCMN+9HQ19ckijqnsLYxjwN8ctLEWT0k
 80Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2yRpnXMoQu2cIFYwPSRBn6p9fRT9C5DO0R/eqKUI760=;
 b=ZYIXaJtYgjr7FNZuMBZT4kLard2uU1JZusUMkHP+USqv2YGcpQCwUb/mw0guCaxfMN
 470CKePHkgNDU+jyRvSRGI/Q4Ken20AS5Jp++AGnwxXsBwWatspxP1hL6OF6DCZiDS5x
 n3Zg86PBhpBFdE8Tb2jYjAhhAUoO7i5LldOoLZ2Uq1qXfXq1Vgx9Yzbq2dcPbauK4wQ7
 SnFAYOFJTSH5rH1KgaKoF3Y64kCgDHZ0+zbLWxBq06qIUIEYAcOWH5QfG5N+oA0nFt0S
 k+IIacW8IPW3z3ZmTrvQ2IQs3w/NVW1czLYCR88tYznqHBSBwG2bTlGwvWCmLFfSCJgP
 A3Fg==
X-Gm-Message-State: AOAM533aPEEt01LCa/4CXvziiejtdjLbNlTVAxRige0y286Fm/ebYuHT
 /jG5TuYcmAbWkhzwz11Ne5kI3vVz9NKqrd1nG4Q=
X-Google-Smtp-Source: ABdhPJz0K07t5KmC807i4xz/0DGY8ZXHuG4t6eUe6GR3xp2za6qREq7rQi9BX9F1SwEbmslYpleR251z8e+kz51KBL8=
X-Received: by 2002:ac2:518b:0:b0:471:f81b:bb9f with SMTP id
 u11-20020ac2518b000000b00471f81bbb9fmr16630996lfi.638.1651738842942; Thu, 05
 May 2022 01:20:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220504210001.678419-1-pbonzini@redhat.com>
 <20220504210001.678419-4-pbonzini@redhat.com>
In-Reply-To: <20220504210001.678419-4-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 5 May 2022 12:20:31 +0400
Message-ID: <CAJ+F1CLyTN90uBhc5W8i8i_Vre+FsMU3O-OXUy53kf-4EWxRiQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] net: slirp: switch to slirp_new
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: QEMU <qemu-devel@nongnu.org>, Daniele Buono <dbuono@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000fed27505de3f6a73"
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x129.google.com
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

--000000000000fed27505de3f6a73
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, May 5, 2022 at 1:07 AM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Replace slirp_init with slirp_new, so that a more recent cfg.version
> can be specified.
>

It was introduced in v4.1.0, but I don't see a minimum libslirp version
check.


>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  net/slirp.c | 27 +++++++++++++++++++++------
>  1 file changed, 21 insertions(+), 6 deletions(-)
>
> diff --git a/net/slirp.c b/net/slirp.c
> index f1e25d741f..b3a92d6e38 100644
> --- a/net/slirp.c
> +++ b/net/slirp.c
> @@ -389,6 +389,7 @@ static int net_slirp_init(NetClientState *peer, const
> char *model,
>  #if defined(CONFIG_SMBD_COMMAND)
>      struct in_addr smbsrv =3D { .s_addr =3D 0 };
>  #endif
> +    SlirpConfig cfg =3D { 0 };
>      NetClientState *nc;
>      SlirpState *s;
>      char buf[20];
> @@ -577,12 +578,26 @@ static int net_slirp_init(NetClientState *peer,
> const char *model,
>
>      s =3D DO_UPCAST(SlirpState, nc, nc);
>
> -    s->slirp =3D slirp_init(restricted, ipv4, net, mask, host,
> -                          ipv6, ip6_prefix, vprefix6_len, ip6_host,
> -                          vhostname, tftp_server_name,
> -                          tftp_export, bootfile, dhcp,
> -                          dns, ip6_dns, dnssearch, vdomainname,
> -                          &slirp_cb, s);
> +    cfg.version =3D 3;
> +    cfg.restricted =3D restricted;
> +    cfg.in_enabled =3D ipv4;
> +    cfg.vnetwork =3D net;
> +    cfg.vnetmask =3D mask;
> +    cfg.vhost =3D host;
> +    cfg.in6_enabled =3D ipv6;
> +    cfg.vprefix_addr6 =3D ip6_prefix;
> +    cfg.vprefix_len =3D vprefix6_len;
> +    cfg.vhost6 =3D ip6_host;
> +    cfg.vhostname =3D vhostname;
> +    cfg.tftp_server_name =3D tftp_server_name;
> +    cfg.tftp_path =3D tftp_export;
> +    cfg.bootfile =3D bootfile;
> +    cfg.vdhcp_start =3D dhcp;
> +    cfg.vnameserver =3D dns;
> +    cfg.vnameserver6 =3D ip6_dns;
> +    cfg.vdnssearch =3D dnssearch;
> +    cfg.vdomainname =3D vdomainname;
> +    s->slirp =3D slirp_new(&cfg, &slirp_cb, s);
>      QTAILQ_INSERT_TAIL(&slirp_stacks, s, entry);
>
>      /*
> --
> 2.35.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000fed27505de3f6a73
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 5, 2022 at 1:07 AM Paol=
o Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Rep=
lace slirp_init with slirp_new, so that a more recent cfg.version<br>
can be specified.<br></blockquote><div><br></div><div>It was introduced in =
v4.1.0, but I don&#39;t see a minimum libslirp version check.<br></div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br>
---<br>
=C2=A0net/slirp.c | 27 +++++++++++++++++++++------<br>
=C2=A01 file changed, 21 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/net/slirp.c b/net/slirp.c<br>
index f1e25d741f..b3a92d6e38 100644<br>
--- a/net/slirp.c<br>
+++ b/net/slirp.c<br>
@@ -389,6 +389,7 @@ static int net_slirp_init(NetClientState *peer, const c=
har *model,<br>
=C2=A0#if defined(CONFIG_SMBD_COMMAND)<br>
=C2=A0 =C2=A0 =C2=A0struct in_addr smbsrv =3D { .s_addr =3D 0 };<br>
=C2=A0#endif<br>
+=C2=A0 =C2=A0 SlirpConfig cfg =3D { 0 };<br>
=C2=A0 =C2=A0 =C2=A0NetClientState *nc;<br>
=C2=A0 =C2=A0 =C2=A0SlirpState *s;<br>
=C2=A0 =C2=A0 =C2=A0char buf[20];<br>
@@ -577,12 +578,26 @@ static int net_slirp_init(NetClientState *peer, const=
 char *model,<br>
<br>
=C2=A0 =C2=A0 =C2=A0s =3D DO_UPCAST(SlirpState, nc, nc);<br>
<br>
-=C2=A0 =C2=A0 s-&gt;slirp =3D slirp_init(restricted, ipv4, net, mask, host=
,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ipv6, ip6_prefix, vprefix6_len, ip6_host,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 vhostname, tftp_server_name,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 tftp_export, bootfile, dhcp,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 dns, ip6_dns, dnssearch, vdomainname,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &amp;slirp_cb, s);<br>
+=C2=A0 =C2=A0 cfg.version =3D 3;<br>
+=C2=A0 =C2=A0 cfg.restricted =3D restricted;<br>
+=C2=A0 =C2=A0 cfg.in_enabled =3D ipv4;<br>
+=C2=A0 =C2=A0 cfg.vnetwork =3D net;<br>
+=C2=A0 =C2=A0 cfg.vnetmask =3D mask;<br>
+=C2=A0 =C2=A0 cfg.vhost =3D host;<br>
+=C2=A0 =C2=A0 cfg.in6_enabled =3D ipv6;<br>
+=C2=A0 =C2=A0 cfg.vprefix_addr6 =3D ip6_prefix;<br>
+=C2=A0 =C2=A0 cfg.vprefix_len =3D vprefix6_len;<br>
+=C2=A0 =C2=A0 cfg.vhost6 =3D ip6_host;<br>
+=C2=A0 =C2=A0 cfg.vhostname =3D vhostname;<br>
+=C2=A0 =C2=A0 cfg.tftp_server_name =3D tftp_server_name;<br>
+=C2=A0 =C2=A0 cfg.tftp_path =3D tftp_export;<br>
+=C2=A0 =C2=A0 cfg.bootfile =3D bootfile;<br>
+=C2=A0 =C2=A0 cfg.vdhcp_start =3D dhcp;<br>
+=C2=A0 =C2=A0 cfg.vnameserver =3D dns;<br>
+=C2=A0 =C2=A0 cfg.vnameserver6 =3D ip6_dns;<br>
+=C2=A0 =C2=A0 cfg.vdnssearch =3D dnssearch;<br>
+=C2=A0 =C2=A0 cfg.vdomainname =3D vdomainname;<br>
+=C2=A0 =C2=A0 s-&gt;slirp =3D slirp_new(&amp;cfg, &amp;slirp_cb, s);<br>
=C2=A0 =C2=A0 =C2=A0QTAILQ_INSERT_TAIL(&amp;slirp_stacks, s, entry);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
-- <br>
2.35.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000fed27505de3f6a73--

