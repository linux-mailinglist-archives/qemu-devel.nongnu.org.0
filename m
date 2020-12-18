Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4322DDD8E
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 05:01:55 +0100 (CET)
Received: from localhost ([::1]:51134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq6xm-00067C-8c
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 23:01:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scw@google.com>) id 1kq6v3-0004zx-Mn
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 22:59:05 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:35483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <scw@google.com>) id 1kq6uz-0003Ey-Hp
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 22:59:05 -0500
Received: by mail-ed1-x52a.google.com with SMTP id u19so950241edx.2
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 19:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ur6iPAND6wvhkDhzNfIC++uyuSmQ3hVm7t8Ol4FHN1I=;
 b=JJEHxQkjxbq/7AMXGwFNF2dig8+fmO08KoW/I6jfA04RTGFVB8zlxAIrdC8pCYRgrF
 k19vOmKxKwpEJCvhoRm8AYp3NJ4daPv2SeXKPjJd1g5H7zvaogNhIvqsBj8NMYiNSTQg
 x342wk/Nx73HSpKMP/EugccUxM+MPlhnl/8smWVBv9Y5/+7aPzoXIL/6/g3LJu+1zx2O
 kqS34tLWeSn2Mm51NFZQ/Xss6pasXlg/yiOFb1T0WdzgDJm8PIKay/xvp/VJr/MtZz3v
 SbgOeX+Yjrn9bSqGiw07mtGIFsY2Zva2GWdnwZOS1upcin5CFRRSYZj3SMmHOVJYFAwk
 1cgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ur6iPAND6wvhkDhzNfIC++uyuSmQ3hVm7t8Ol4FHN1I=;
 b=Xr7E9rHkGXQpdyUABFpal5tNdFWFOZJR4fdTtHXaT1Opi+iO09jNfh6f3c426QfSf6
 7vZyj0EEDdIzO17XFT8LGzOsrssj7rhsQ8az0Fv36jPpm3JilN63gswrh3sXAmL8tzLF
 CZlS6mHd9EAzSGaE6TipSr059pi9VvSXn9ElBiQ7JoXh5xHUqNC6uz+B6+GPb8Rw8ZhT
 a22+x5tHeaoJ8ktApDQqg2gwdK5iJL+0Bg8a/ekSmCHIkDghqdhlP4A/lVJKQudpoGQJ
 VR4DbGOQFuoB7wBLEDWqXOhDHhMnWybPtfQC+Prf8NASFnCignqDdCqdB30Rr53T8Geh
 AZqg==
X-Gm-Message-State: AOAM531OA5PmYrGtY2nGayu1yW7B7EopzIn5VW+CBQexZFyjJ6Jx933l
 oqwGI+L2/qQCwPxdQ0Pk5zxRczhhiwbzzEJsvMNSAg==
X-Google-Smtp-Source: ABdhPJwcUfItdoCisXQHkY2UtqdpBRTlhsCKlz5E2bShcXmPAuAmUm+1MlYIKImqP3Ysl1SXAV+3OavuWSn/Q5Q272U=
X-Received: by 2002:a50:d4d9:: with SMTP id e25mr2488113edj.243.1608263937652; 
 Thu, 17 Dec 2020 19:58:57 -0800 (PST)
MIME-Version: 1.0
References: <cover.1597129029.git.scw@google.com>
 <7d61f792c22de8df3c6a9438eacc3906620e7c54.1597129029.git.scw@google.com>
 <88f3d62a-af87-c0b8-a665-67441aad5a0b@vivier.eu>
In-Reply-To: <88f3d62a-af87-c0b8-a665-67441aad5a0b@vivier.eu>
From: Shu-Chun Weng <scw@google.com>
Date: Thu, 17 Dec 2020 19:58:46 -0800
Message-ID: <CAF3nBxi7sCUuXfPVd41cekZNxgOCL24DYG5Yx8x2ETGA0B8yxA@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] linux-user: Add IPv6 options to do_print_sockopt()
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="000000000000bbfc2b05b6b5202d"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=scw@google.com; helo=mail-ed1-x52a.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000bbfc2b05b6b5202d
Content-Type: multipart/alternative; boundary="000000000000b5fa5505b6b52011"

--000000000000b5fa5505b6b52011
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

The first 4 patches in the set (up to this) are self-contained. Is it
possible to include them in your dev branch while the others are still
waiting for review? (I'll ping the other threads separately).

The first three patches are:
  https://lists.nongnu.org/archive/html/qemu-devel/2020-08/msg02044.html
  https://lists.nongnu.org/archive/html/qemu-devel/2020-08/msg02051.html
  https://lists.nongnu.org/archive/html/qemu-devel/2020-08/msg01946.html

Shu-Chun

On Tue, Sep 29, 2020 at 4:29 PM Laurent Vivier <laurent@vivier.eu> wrote:

> Le 11/08/2020 =C3=A0 09:09, Shu-Chun Weng a =C3=A9crit :
> > Signed-off-by: Shu-Chun Weng <scw@google.com>
> > ---
> > v1 -> v2:
> >   New: Add all IPV6 options to do_print_sockopt(), including the newly
> supported
> >   IPV6_ADDR_PREFERENCES.
> >
> >  linux-user/strace.c | 108 ++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 108 insertions(+)
> >
> > diff --git a/linux-user/strace.c b/linux-user/strace.c
> > index 854b54a2ad..089fb3968e 100644
> > --- a/linux-user/strace.c
> > +++ b/linux-user/strace.c
> > @@ -6,6 +6,7 @@
> >  #include <sys/select.h>
> >  #include <sys/mount.h>
> >  #include <arpa/inet.h>
> > +#include <netinet/in.h>
> >  #include <netinet/tcp.h>
> >  #include <netinet/udp.h>
> >  #include <linux/if_packet.h>
> > @@ -2307,6 +2308,113 @@ print_optint:
> >              break;
> >          }
> >          break;
> > +    case SOL_IPV6:
> > +        qemu_log("SOL_IPV6,");
> > +        switch (optname) {
> > +        case IPV6_MTU_DISCOVER:
> > +            qemu_log("IPV6_MTU_DISCOVER,");
> > +            goto print_optint;
> > +        case IPV6_MTU:
> > +            qemu_log("IPV6_MTU,");
> > +            goto print_optint;
> > +        case IPV6_V6ONLY:
> > +            qemu_log("IPV6_V6ONLY,");
> > +            goto print_optint;
> > +        case IPV6_RECVPKTINFO:
> > +            qemu_log("IPV6_RECVPKTINFO,");
> > +            goto print_optint;
> > +        case IPV6_UNICAST_HOPS:
> > +            qemu_log("IPV6_UNICAST_HOPS,");
> > +            goto print_optint;
> > +        case IPV6_MULTICAST_HOPS:
> > +            qemu_log("IPV6_MULTICAST_HOPS,");
> > +            goto print_optint;
> > +        case IPV6_MULTICAST_LOOP:
> > +            qemu_log("IPV6_MULTICAST_LOOP,");
> > +            goto print_optint;
> > +        case IPV6_RECVERR:
> > +            qemu_log("IPV6_RECVERR,");
> > +            goto print_optint;
> > +        case IPV6_RECVHOPLIMIT:
> > +            qemu_log("IPV6_RECVHOPLIMIT,");
> > +            goto print_optint;
> > +        case IPV6_2292HOPLIMIT:
> > +            qemu_log("IPV6_2292HOPLIMIT,");
> > +            goto print_optint;
> > +        case IPV6_CHECKSUM:
> > +            qemu_log("IPV6_CHECKSUM,");
> > +            goto print_optint;
> > +        case IPV6_ADDRFORM:
> > +            qemu_log("IPV6_ADDRFORM,");
> > +            goto print_optint;
> > +        case IPV6_2292PKTINFO:
> > +            qemu_log("IPV6_2292PKTINFO,");
> > +            goto print_optint;
> > +        case IPV6_RECVTCLASS:
> > +            qemu_log("IPV6_RECVTCLASS,");
> > +            goto print_optint;
> > +        case IPV6_RECVRTHDR:
> > +            qemu_log("IPV6_RECVRTHDR,");
> > +            goto print_optint;
> > +        case IPV6_2292RTHDR:
> > +            qemu_log("IPV6_2292RTHDR,");
> > +            goto print_optint;
> > +        case IPV6_RECVHOPOPTS:
> > +            qemu_log("IPV6_RECVHOPOPTS,");
> > +            goto print_optint;
> > +        case IPV6_2292HOPOPTS:
> > +            qemu_log("IPV6_2292HOPOPTS,");
> > +            goto print_optint;
> > +        case IPV6_RECVDSTOPTS:
> > +            qemu_log("IPV6_RECVDSTOPTS,");
> > +            goto print_optint;
> > +        case IPV6_2292DSTOPTS:
> > +            qemu_log("IPV6_2292DSTOPTS,");
> > +            goto print_optint;
> > +        case IPV6_TCLASS:
> > +            qemu_log("IPV6_TCLASS,");
> > +            goto print_optint;
> > +        case IPV6_ADDR_PREFERENCES:
> > +            qemu_log("IPV6_ADDR_PREFERENCES,");
> > +            goto print_optint;
> > +#ifdef IPV6_RECVPATHMTU
> > +        case IPV6_RECVPATHMTU:
> > +            qemu_log("IPV6_RECVPATHMTU,");
> > +            goto print_optint;
> > +#endif
> > +#ifdef IPV6_TRANSPARENT
> > +        case IPV6_TRANSPARENT:
> > +            qemu_log("IPV6_TRANSPARENT,");
> > +            goto print_optint;
> > +#endif
> > +#ifdef IPV6_FREEBIND
> > +        case IPV6_FREEBIND:
> > +            qemu_log("IPV6_FREEBIND,");
> > +            goto print_optint;
> > +#endif
> > +#ifdef IPV6_RECVORIGDSTADDR
> > +        case IPV6_RECVORIGDSTADDR:
> > +            qemu_log("IPV6_RECVORIGDSTADDR,");
> > +            goto print_optint;
> > +#endif
> > +        case IPV6_PKTINFO:
> > +            qemu_log("IPV6_PKTINFO,");
> > +            print_pointer(optval, 0);
> > +            break;
> > +        case IPV6_ADD_MEMBERSHIP:
> > +            qemu_log("IPV6_ADD_MEMBERSHIP,");
> > +            print_pointer(optval, 0);
> > +            break;
> > +        case IPV6_DROP_MEMBERSHIP:
> > +            qemu_log("IPV6_DROP_MEMBERSHIP,");
> > +            print_pointer(optval, 0);
> > +            break;
> > +        default:
> > +            print_raw_param(TARGET_ABI_FMT_ld, optname, 0);
> > +            print_pointer(optval, 0);
> > +            break;
> > +        }
> > +        break;
> >      default:
> >          print_raw_param(TARGET_ABI_FMT_ld, level, 0);
> >          print_raw_param(TARGET_ABI_FMT_ld, optname, 0);
> >
>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
>

--000000000000b5fa5505b6b52011
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Laurent,</div><div><br></div><div>The first 4 patc=
hes in the set (up to this) are self-contained. Is it possible to include t=
hem in your dev branch while the others are still waiting for review? (I&#3=
9;ll ping the other threads separately).</div><div><br></div><div>The first=
 three patches are:</div><div>=C2=A0 <a href=3D"https://lists.nongnu.org/ar=
chive/html/qemu-devel/2020-08/msg02044.html">https://lists.nongnu.org/archi=
ve/html/qemu-devel/2020-08/msg02044.html</a></div><div>=C2=A0 <a href=3D"ht=
tps://lists.nongnu.org/archive/html/qemu-devel/2020-08/msg02051.html">https=
://lists.nongnu.org/archive/html/qemu-devel/2020-08/msg02051.html</a></div>=
<div>=C2=A0 <a href=3D"https://lists.nongnu.org/archive/html/qemu-devel/202=
0-08/msg01946.html">https://lists.nongnu.org/archive/html/qemu-devel/2020-0=
8/msg01946.html</a></div><div><br></div><div>Shu-Chun<br></div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep =
29, 2020 at 4:29 PM Laurent Vivier &lt;<a href=3D"mailto:laurent@vivier.eu"=
>laurent@vivier.eu</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Le 11/08/2020 =C3=A0 09:09, Shu-Chun Weng a =C3=A9crit=C2=
=A0:<br>
&gt; Signed-off-by: Shu-Chun Weng &lt;<a href=3D"mailto:scw@google.com" tar=
get=3D"_blank">scw@google.com</a>&gt;<br>
&gt; ---<br>
&gt; v1 -&gt; v2:<br>
&gt;=C2=A0 =C2=A0New: Add all IPV6 options to do_print_sockopt(), including=
 the newly supported<br>
&gt;=C2=A0 =C2=A0IPV6_ADDR_PREFERENCES.<br>
&gt; <br>
&gt;=C2=A0 linux-user/strace.c | 108 ++++++++++++++++++++++++++++++++++++++=
++++++<br>
&gt;=C2=A0 1 file changed, 108 insertions(+)<br>
&gt; <br>
&gt; diff --git a/linux-user/strace.c b/linux-user/strace.c<br>
&gt; index 854b54a2ad..089fb3968e 100644<br>
&gt; --- a/linux-user/strace.c<br>
&gt; +++ b/linux-user/strace.c<br>
&gt; @@ -6,6 +6,7 @@<br>
&gt;=C2=A0 #include &lt;sys/select.h&gt;<br>
&gt;=C2=A0 #include &lt;sys/mount.h&gt;<br>
&gt;=C2=A0 #include &lt;arpa/inet.h&gt;<br>
&gt; +#include &lt;netinet/in.h&gt;<br>
&gt;=C2=A0 #include &lt;netinet/tcp.h&gt;<br>
&gt;=C2=A0 #include &lt;netinet/udp.h&gt;<br>
&gt;=C2=A0 #include &lt;linux/if_packet.h&gt;<br>
&gt; @@ -2307,6 +2308,113 @@ print_optint:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case SOL_IPV6:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;SOL_IPV6,&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (optname) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case IPV6_MTU_DISCOVER:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;IPV6_MTU_DIS=
COVER,&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto print_optint;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case IPV6_MTU:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;IPV6_MTU,&qu=
ot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto print_optint;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case IPV6_V6ONLY:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;IPV6_V6ONLY,=
&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto print_optint;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case IPV6_RECVPKTINFO:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;IPV6_RECVPKT=
INFO,&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto print_optint;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case IPV6_UNICAST_HOPS:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;IPV6_UNICAST=
_HOPS,&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto print_optint;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case IPV6_MULTICAST_HOPS:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;IPV6_MULTICA=
ST_HOPS,&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto print_optint;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case IPV6_MULTICAST_LOOP:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;IPV6_MULTICA=
ST_LOOP,&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto print_optint;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case IPV6_RECVERR:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;IPV6_RECVERR=
,&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto print_optint;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case IPV6_RECVHOPLIMIT:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;IPV6_RECVHOP=
LIMIT,&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto print_optint;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case IPV6_2292HOPLIMIT:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;IPV6_2292HOP=
LIMIT,&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto print_optint;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case IPV6_CHECKSUM:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;IPV6_CHECKSU=
M,&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto print_optint;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case IPV6_ADDRFORM:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;IPV6_ADDRFOR=
M,&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto print_optint;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case IPV6_2292PKTINFO:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;IPV6_2292PKT=
INFO,&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto print_optint;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case IPV6_RECVTCLASS:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;IPV6_RECVTCL=
ASS,&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto print_optint;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case IPV6_RECVRTHDR:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;IPV6_RECVRTH=
DR,&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto print_optint;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case IPV6_2292RTHDR:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;IPV6_2292RTH=
DR,&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto print_optint;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case IPV6_RECVHOPOPTS:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;IPV6_RECVHOP=
OPTS,&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto print_optint;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case IPV6_2292HOPOPTS:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;IPV6_2292HOP=
OPTS,&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto print_optint;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case IPV6_RECVDSTOPTS:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;IPV6_RECVDST=
OPTS,&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto print_optint;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case IPV6_2292DSTOPTS:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;IPV6_2292DST=
OPTS,&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto print_optint;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case IPV6_TCLASS:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;IPV6_TCLASS,=
&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto print_optint;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case IPV6_ADDR_PREFERENCES:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;IPV6_ADDR_PR=
EFERENCES,&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto print_optint;<br>
&gt; +#ifdef IPV6_RECVPATHMTU<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case IPV6_RECVPATHMTU:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;IPV6_RECVPAT=
HMTU,&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto print_optint;<br>
&gt; +#endif<br>
&gt; +#ifdef IPV6_TRANSPARENT<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case IPV6_TRANSPARENT:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;IPV6_TRANSPA=
RENT,&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto print_optint;<br>
&gt; +#endif<br>
&gt; +#ifdef IPV6_FREEBIND<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case IPV6_FREEBIND:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;IPV6_FREEBIN=
D,&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto print_optint;<br>
&gt; +#endif<br>
&gt; +#ifdef IPV6_RECVORIGDSTADDR<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case IPV6_RECVORIGDSTADDR:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;IPV6_RECVORI=
GDSTADDR,&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto print_optint;<br>
&gt; +#endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case IPV6_PKTINFO:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;IPV6_PKTINFO=
,&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print_pointer(optval, 0);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case IPV6_ADD_MEMBERSHIP:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;IPV6_ADD_MEM=
BERSHIP,&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print_pointer(optval, 0);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 case IPV6_DROP_MEMBERSHIP:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;IPV6_DROP_ME=
MBERSHIP,&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print_pointer(optval, 0);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print_raw_param(TARGET_ABI_=
FMT_ld, optname, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print_pointer(optval, 0);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 default:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print_raw_param(TARGET_ABI_FMT_ld, l=
evel, 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print_raw_param(TARGET_ABI_FMT_ld, o=
ptname, 0);<br>
&gt; <br>
<br>
Reviewed-by: Laurent Vivier &lt;<a href=3D"mailto:laurent@vivier.eu" target=
=3D"_blank">laurent@vivier.eu</a>&gt;<br>
</blockquote></div>

--000000000000b5fa5505b6b52011--

--000000000000bbfc2b05b6b5202d
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIPkgYJKoZIhvcNAQcCoIIPgzCCD38CAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ggzsMIIEtjCCA56gAwIBAgIQeAMYYHb81ngUVR0WyMTzqzANBgkqhkiG9w0BAQsFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMDA3MjgwMDAwMDBaFw0yOTAzMTgwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFIzIFNNSU1FIENBIDIwMjAwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCvLe9xPU9W
dpiHLAvX7kFnaFZPuJLey7LYaMO8P/xSngB9IN73mVc7YiLov12Fekdtn5kL8PjmDBEvTYmWsuQS
6VBo3vdlqqXZ0M9eMkjcKqijrmDRleudEoPDzTumwQ18VB/3I+vbN039HIaRQ5x+NHGiPHVfk6Rx
c6KAbYceyeqqfuJEcq23vhTdium/Bf5hHqYUhuJwnBQ+dAUcFndUKMJrth6lHeoifkbw2bv81zxJ
I9cvIy516+oUekqiSFGfzAqByv41OrgLV4fLGCDH3yRh1tj7EtV3l2TngqtrDLUs5R+sWIItPa/4
AJXB1Q3nGNl2tNjVpcSn0uJ7aFPbAgMBAAGjggGKMIIBhjAOBgNVHQ8BAf8EBAMCAYYwHQYDVR0l
BBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMBIGA1UdEwEB/wQIMAYBAf8CAQAwHQYDVR0OBBYEFHzM
CmjXouseLHIb0c1dlW+N+/JjMB8GA1UdIwQYMBaAFI/wS3+oLkUkrk1Q+mOai97i3Ru8MHsGCCsG
AQUFBwEBBG8wbTAuBggrBgEFBQcwAYYiaHR0cDovL29jc3AyLmdsb2JhbHNpZ24uY29tL3Jvb3Ry
MzA7BggrBgEFBQcwAoYvaHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvcm9vdC1y
My5jcnQwNgYDVR0fBC8wLTAroCmgJ4YlaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9yb290LXIz
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
--000000000000bbfc2b05b6b5202d--

