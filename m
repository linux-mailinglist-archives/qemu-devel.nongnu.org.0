Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACDC2A7ED7
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Nov 2020 13:43:42 +0100 (CET)
Received: from localhost ([::1]:60864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaec9-0001mA-EI
	for lists+qemu-devel@lfdr.de; Thu, 05 Nov 2020 07:43:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kaeRJ-0005xD-SD; Thu, 05 Nov 2020 07:32:29 -0500
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:38690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kaeRH-0005hD-J7; Thu, 05 Nov 2020 07:32:29 -0500
Received: by mail-lf1-x144.google.com with SMTP id 74so2032660lfo.5;
 Thu, 05 Nov 2020 04:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=OuaZqXvoiuSD8H+L2psMT354MiiewCCwEhWx+mq7j3M=;
 b=jA9G98i2LmNQst2Dfp5/xhgZLnlf4DaBAXHEc2XBfxOUNqGlDUuDgxbu4sYBl2eDsU
 ytTwufpq6rFfaeSAe2xmDxd/KsjTah5Y6NIajqLJlHJyTYY8GvRw+hmS16VXxLkeQBxI
 GHIGxlx7GsiO32yTuSpH/GcSvwvHIOLNR2Sv76C5Z8ERMolbAVA80AwjEeHbd2wWIj/+
 Q5JC//iZqk4vgCEPpcC3L3ycjrvhz7DVhgT7t7TXm3ogg6atMthAFY4T3v+O791VlKmT
 unX5o7mPNRty3HgmGWBriMvDFz8x51/w6B/3cOmnMuwOefVOAyWaPNy/8Wcjqj6eF0qS
 J93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=OuaZqXvoiuSD8H+L2psMT354MiiewCCwEhWx+mq7j3M=;
 b=qciJnXtvrkwv3yhqOrsbnCEMG+qgv7LaXmIEFuODdaUZId0ZfzXbEHCgYXZBLaxF4f
 8TBnFSA/AfecO8TnQw8+k56CUizlx1jBj7QBej0e968SsvIW2Oxno+MbKmh3bsTNcPn8
 2PEANlfWW+V5qO2Ej+i/Y7s3NRrDkIapbBAygI2pQwnitN3Giyot4fn1+C77l8o+c+Nz
 Mhjz25v6U3Mrv4PvvNXP0UaEzgP1Y9WS3gYVEBw7NoQNa3iJGHgWZbBxw3GFvcv0C4F2
 3fUZdkjTu+dv7/kvIq+JsegIYrZN4alZgeYGinhYCYKBfWuz7RR9sTjHfjKrnvtncjzM
 ATHg==
X-Gm-Message-State: AOAM530jOkaA0dLZQNKVyNkFT1Kx/vogPlsKIO1NOLBZCrXFQbmgOvZC
 ckZ5cnxuMEzcyUHsEVvwLcYRhgOJt4FM+vms6bg=
X-Google-Smtp-Source: ABdhPJxNceSf3BnMwPjCICpWJ2NCKi2pEC4h5cEZswAX/skab3+wv8erjEv7YPGprTVfTrdpkDXFyUO6tWVN+ktsS+Y=
X-Received: by 2002:a19:8a84:: with SMTP id m126mr848348lfd.377.1604579542210; 
 Thu, 05 Nov 2020 04:32:22 -0800 (PST)
MIME-Version: 1.0
References: <20201013001545.1958-1-luoyonggang@gmail.com>
 <20201013001545.1958-2-luoyonggang@gmail.com>
 <9582005a-1248-6a6b-060f-b0da597bc9c9@redhat.com>
 <CAE2XoE_Mvtgnva3r6nMDq1P9D6iA9uUPP7sh20RLaC8zdYrTow@mail.gmail.com>
 <d74223f4-fb3f-c83c-99e9-6d525501dee8@redhat.com>
 <CAE2XoE8sJgjGEDygHO9EjYpUEH_YjiOgUhpD2==hJZrie4quLA@mail.gmail.com>
 <17916ea3-c1a2-0446-eb9b-337bb8e5a8d0@redhat.com>
In-Reply-To: <17916ea3-c1a2-0446-eb9b-337bb8e5a8d0@redhat.com>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Thu, 5 Nov 2020 20:32:11 +0800
Message-ID: <CAE2XoE_Rt9JgBOB=yWNdBWvJkBB4X6CVQLqGFFghjR1VZmHBug@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] block: Fixes nfs compiling error on msys2/mingw
To: Max Reitz <mreitz@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000a09f5e05b35b49f7"
Received-SPF: pass client-ip=2a00:1450:4864:20::144;
 envelope-from=luoyonggang@gmail.com; helo=mail-lf1-x144.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Reply-To: luoyonggang@gmail.com
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
 Peter Lieven <pl@kamp.de>, qemu-level <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a09f5e05b35b49f7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Updated with fixes.

On Thu, Nov 5, 2020 at 8:11 PM Max Reitz <mreitz@redhat.com> wrote:
>
> On 05.11.20 12:46, =E7=BD=97=E5=8B=87=E5=88=9A(Yonggang Luo) wrote:
> >
> >
> > On Thu, Nov 5, 2020 at 7:44 PM Max Reitz <mreitz@redhat.com
> > <mailto:mreitz@redhat.com>> wrote:
> >  >
> >  > On 05.11.20 12:32, =E7=BD=97=E5=8B=87=E5=88=9A(Yonggang Luo) wrote:
> >  > >
> >  > >
> >  > > On Thu, Nov 5, 2020 at 7:29 PM Max Reitz <mreitz@redhat.com
> > <mailto:mreitz@redhat.com>
> >  > > <mailto:mreitz@redhat.com <mailto:mreitz@redhat.com>>> wrote:
> >  > >  >
> >  > >  > On 13.10.20 02:15, Yonggang Luo wrote:
> >  > >  > > These compiling errors are fixed:
> >  > >  > > ../block/nfs.c:27:10: fatal error: poll.h: No such file or
> > directory
> >  > >  > >     27 | #include <poll.h>
> >  > >  > >        |          ^~~~~~~~
> >  > >  > > compilation terminated.
> >  > >  > >
> >  > >  > > ../block/nfs.c:63:5: error: unknown type name 'blkcnt_t'
> >  > >  > >     63 |     blkcnt_t st_blocks;
> >  > >  > >        |     ^~~~~~~~
> >  > >  > > ../block/nfs.c: In function 'nfs_client_open':
> >  > >  > > ../block/nfs.c:550:27: error: 'struct _stat64' has no member
named
> >  > > 'st_blocks'
> >  > >  > >    550 |     client->st_blocks =3D st.st_blocks;
> >  > >  > >        |                           ^
> >  > >  > > ../block/nfs.c: In function 'nfs_get_allocated_file_size':
> >  > >  > > ../block/nfs.c:751:41: error: 'struct _stat64' has no member
named
> >  > > 'st_blocks'
> >  > >  > >    751 |     return (task.ret < 0 ? task.ret : st.st_blocks *
> > 512);
> >  > >  > >        |                                         ^
> >  > >  > > ../block/nfs.c: In function 'nfs_reopen_prepare':
> >  > >  > > ../block/nfs.c:805:31: error: 'struct _stat64' has no member
named
> >  > > 'st_blocks'
> >  > >  > >    805 |         client->st_blocks =3D st.st_blocks;
> >  > >  > >        |                               ^
> >  > >  > > ../block/nfs.c: In function 'nfs_get_allocated_file_size':
> >  > >  > > ../block/nfs.c:752:1: error: control reaches end of non-void
> >  > > function [-Werror=3Dreturn-type]
> >  > >  > >    752 | }
> >  > >  > >        | ^
> >  > >  > >
> >  > >  > > On msys2/mingw, there is no st_blocks in struct _stat64 yet,
we
> >  > > disable the usage of it
> >  > >  > > on msys2/mingw, and create a typedef long long blkcnt_t; for
> >  > > further implementation
> >  > >  > >
> >  > >  > > Signed-off-by: Yonggang Luo <luoyonggang@gmail.com
> > <mailto:luoyonggang@gmail.com>
> >  > > <mailto:luoyonggang@gmail.com <mailto:luoyonggang@gmail.com>>>
> >  > >  > > ---
> >  > >  > >   block/nfs.c | 15 +++++++++++++++
> >  > >  > >   1 file changed, 15 insertions(+)
> >  > >  > >
> >  > >  > > diff --git a/block/nfs.c b/block/nfs.c
> >  > >  > > index f86e660374..cf8795fb49 100644
> >  > >  > > --- a/block/nfs.c
> >  > >  > > +++ b/block/nfs.c
> >  > >  >
> >  > >  > [...]
> >  > >  >
> >  > >  > > @@ -51,6 +53,10 @@
> >  > >  > >   #define QEMU_NFS_MAX_PAGECACHE_SIZE (8388608 / NFS_BLKSIZE)
> >  > >  > >   #define QEMU_NFS_MAX_DEBUG_LEVEL 2
> >  > >  > >
> >  > >  > > +#if defined(_WIN32)
> >  > >  > > +typedef long long blkcnt_t;
> >  > >  >
> >  > >  > This makes me uneasy.  Is there a guarantee that this type will
> > never be
> >  > >  > defined in a mingw environment (which would then result in a ne=
w
> > compile
> >  > >  > error)?
> >  > > That's be sure, mingw is compat with msvcrt.dll, so blkcnt_t  are
> > always
> >  > > not defined.
> >  >
> >  > And there is no possibility of that being added in the future?
> > If that's the case, what's the better option.
>
> As I said, just making NFSClient.st_blocks a uint64_t.
>
> Max
>


--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--000000000000a09f5e05b35b49f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Updated with fixes.<br><br>On Thu, Nov 5, 2020 at 8:11 PM =
Max Reitz &lt;<a href=3D"mailto:mreitz@redhat.com">mreitz@redhat.com</a>&gt=
; wrote:<br>&gt;<br>&gt; On 05.11.20 12:46, =E7=BD=97=E5=8B=87=E5=88=9A(Yon=
ggang Luo) wrote:<br>&gt; &gt;<br>&gt; &gt;<br>&gt; &gt; On Thu, Nov 5, 202=
0 at 7:44 PM Max Reitz &lt;<a href=3D"mailto:mreitz@redhat.com">mreitz@redh=
at.com</a><br>&gt; &gt; &lt;mailto:<a href=3D"mailto:mreitz@redhat.com">mre=
itz@redhat.com</a>&gt;&gt; wrote:<br>&gt; &gt; =C2=A0&gt;<br>&gt; &gt; =C2=
=A0&gt; On 05.11.20 12:32, =E7=BD=97=E5=8B=87=E5=88=9A(Yonggang Luo) wrote:=
<br>&gt; &gt; =C2=A0&gt; &gt;<br>&gt; &gt; =C2=A0&gt; &gt;<br>&gt; &gt; =C2=
=A0&gt; &gt; On Thu, Nov 5, 2020 at 7:29 PM Max Reitz &lt;<a href=3D"mailto=
:mreitz@redhat.com">mreitz@redhat.com</a><br>&gt; &gt; &lt;mailto:<a href=
=3D"mailto:mreitz@redhat.com">mreitz@redhat.com</a>&gt;<br>&gt; &gt; =C2=A0=
&gt; &gt; &lt;mailto:<a href=3D"mailto:mreitz@redhat.com">mreitz@redhat.com=
</a> &lt;mailto:<a href=3D"mailto:mreitz@redhat.com">mreitz@redhat.com</a>&=
gt;&gt;&gt; wrote:<br>&gt; &gt; =C2=A0&gt; &gt; =C2=A0&gt;<br>&gt; &gt; =C2=
=A0&gt; &gt; =C2=A0&gt; On 13.10.20 02:15, Yonggang Luo wrote:<br>&gt; &gt;=
 =C2=A0&gt; &gt; =C2=A0&gt; &gt; These compiling errors are fixed:<br>&gt; =
&gt; =C2=A0&gt; &gt; =C2=A0&gt; &gt; ../block/nfs.c:27:10: fatal error: pol=
l.h: No such file or<br>&gt; &gt; directory<br>&gt; &gt; =C2=A0&gt; &gt; =
=C2=A0&gt; &gt; =C2=A0 =C2=A0 27 | #include &lt;poll.h&gt;<br>&gt; &gt; =C2=
=A0&gt; &gt; =C2=A0&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0^~~~~~~~<br>&gt; &gt; =C2=A0&gt; &gt; =C2=A0&gt; &gt; comp=
ilation terminated.<br>&gt; &gt; =C2=A0&gt; &gt; =C2=A0&gt; &gt;<br>&gt; &g=
t; =C2=A0&gt; &gt; =C2=A0&gt; &gt; ../block/nfs.c:63:5: error: unknown type=
 name &#39;blkcnt_t&#39;<br>&gt; &gt; =C2=A0&gt; &gt; =C2=A0&gt; &gt; =C2=
=A0 =C2=A0 63 | =C2=A0 =C2=A0 blkcnt_t st_blocks;<br>&gt; &gt; =C2=A0&gt; &=
gt; =C2=A0&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A0 ^~~~~~~~<br>=
&gt; &gt; =C2=A0&gt; &gt; =C2=A0&gt; &gt; ../block/nfs.c: In function &#39;=
nfs_client_open&#39;:<br>&gt; &gt; =C2=A0&gt; &gt; =C2=A0&gt; &gt; ../block=
/nfs.c:550:27: error: &#39;struct _stat64&#39; has no member named<br>&gt; =
&gt; =C2=A0&gt; &gt; &#39;st_blocks&#39;<br>&gt; &gt; =C2=A0&gt; &gt; =C2=
=A0&gt; &gt; =C2=A0 =C2=A0550 | =C2=A0 =C2=A0 client-&gt;st_blocks =3D st.s=
t_blocks;<br>&gt; &gt; =C2=A0&gt; &gt; =C2=A0&gt; &gt; =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>&gt; &gt; =C2=A0&gt; &gt; =C2=A0&gt; &gt; ../=
block/nfs.c: In function &#39;nfs_get_allocated_file_size&#39;:<br>&gt; &gt=
; =C2=A0&gt; &gt; =C2=A0&gt; &gt; ../block/nfs.c:751:41: error: &#39;struct=
 _stat64&#39; has no member named<br>&gt; &gt; =C2=A0&gt; &gt; &#39;st_bloc=
ks&#39;<br>&gt; &gt; =C2=A0&gt; &gt; =C2=A0&gt; &gt; =C2=A0 =C2=A0751 | =C2=
=A0 =C2=A0 return (task.ret &lt; 0 ? task.ret : st.st_blocks *<br>&gt; &gt;=
 512);<br>&gt; &gt; =C2=A0&gt; &gt; =C2=A0&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^=
<br>&gt; &gt; =C2=A0&gt; &gt; =C2=A0&gt; &gt; ../block/nfs.c: In function &=
#39;nfs_reopen_prepare&#39;:<br>&gt; &gt; =C2=A0&gt; &gt; =C2=A0&gt; &gt; .=
./block/nfs.c:805:31: error: &#39;struct _stat64&#39; has no member named<b=
r>&gt; &gt; =C2=A0&gt; &gt; &#39;st_blocks&#39;<br>&gt; &gt; =C2=A0&gt; &gt=
; =C2=A0&gt; &gt; =C2=A0 =C2=A0805 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 client-&gt=
;st_blocks =3D st.st_blocks;<br>&gt; &gt; =C2=A0&gt; &gt; =C2=A0&gt; &gt; =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>&gt; &gt; =
=C2=A0&gt; &gt; =C2=A0&gt; &gt; ../block/nfs.c: In function &#39;nfs_get_al=
located_file_size&#39;:<br>&gt; &gt; =C2=A0&gt; &gt; =C2=A0&gt; &gt; ../blo=
ck/nfs.c:752:1: error: control reaches end of non-void<br>&gt; &gt; =C2=A0&=
gt; &gt; function [-Werror=3Dreturn-type]<br>&gt; &gt; =C2=A0&gt; &gt; =C2=
=A0&gt; &gt; =C2=A0 =C2=A0752 | }<br>&gt; &gt; =C2=A0&gt; &gt; =C2=A0&gt; &=
gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0| ^<br>&gt; &gt; =C2=A0&gt; &gt; =C2=A0&gt; =
&gt;<br>&gt; &gt; =C2=A0&gt; &gt; =C2=A0&gt; &gt; On msys2/mingw, there is =
no st_blocks in struct _stat64 yet, we<br>&gt; &gt; =C2=A0&gt; &gt; disable=
 the usage of it<br>&gt; &gt; =C2=A0&gt; &gt; =C2=A0&gt; &gt; on msys2/ming=
w, and create a typedef long long blkcnt_t; for<br>&gt; &gt; =C2=A0&gt; &gt=
; further implementation<br>&gt; &gt; =C2=A0&gt; &gt; =C2=A0&gt; &gt;<br>&g=
t; &gt; =C2=A0&gt; &gt; =C2=A0&gt; &gt; Signed-off-by: Yonggang Luo &lt;<a =
href=3D"mailto:luoyonggang@gmail.com">luoyonggang@gmail.com</a><br>&gt; &gt=
; &lt;mailto:<a href=3D"mailto:luoyonggang@gmail.com">luoyonggang@gmail.com=
</a>&gt;<br>&gt; &gt; =C2=A0&gt; &gt; &lt;mailto:<a href=3D"mailto:luoyongg=
ang@gmail.com">luoyonggang@gmail.com</a> &lt;mailto:<a href=3D"mailto:luoyo=
nggang@gmail.com">luoyonggang@gmail.com</a>&gt;&gt;&gt;<br>&gt; &gt; =C2=A0=
&gt; &gt; =C2=A0&gt; &gt; ---<br>&gt; &gt; =C2=A0&gt; &gt; =C2=A0&gt; &gt; =
=C2=A0 block/nfs.c | 15 +++++++++++++++<br>&gt; &gt; =C2=A0&gt; &gt; =C2=A0=
&gt; &gt; =C2=A0 1 file changed, 15 insertions(+)<br>&gt; &gt; =C2=A0&gt; &=
gt; =C2=A0&gt; &gt;<br>&gt; &gt; =C2=A0&gt; &gt; =C2=A0&gt; &gt; diff --git=
 a/block/nfs.c b/block/nfs.c<br>&gt; &gt; =C2=A0&gt; &gt; =C2=A0&gt; &gt; i=
ndex f86e660374..cf8795fb49 100644<br>&gt; &gt; =C2=A0&gt; &gt; =C2=A0&gt; =
&gt; --- a/block/nfs.c<br>&gt; &gt; =C2=A0&gt; &gt; =C2=A0&gt; &gt; +++ b/b=
lock/nfs.c<br>&gt; &gt; =C2=A0&gt; &gt; =C2=A0&gt;<br>&gt; &gt; =C2=A0&gt; =
&gt; =C2=A0&gt; [...]<br>&gt; &gt; =C2=A0&gt; &gt; =C2=A0&gt;<br>&gt; &gt; =
=C2=A0&gt; &gt; =C2=A0&gt; &gt; @@ -51,6 +53,10 @@<br>&gt; &gt; =C2=A0&gt; =
&gt; =C2=A0&gt; &gt; =C2=A0 #define QEMU_NFS_MAX_PAGECACHE_SIZE (8388608 / =
NFS_BLKSIZE)<br>&gt; &gt; =C2=A0&gt; &gt; =C2=A0&gt; &gt; =C2=A0 #define QE=
MU_NFS_MAX_DEBUG_LEVEL 2<br>&gt; &gt; =C2=A0&gt; &gt; =C2=A0&gt; &gt;<br>&g=
t; &gt; =C2=A0&gt; &gt; =C2=A0&gt; &gt; +#if defined(_WIN32)<br>&gt; &gt; =
=C2=A0&gt; &gt; =C2=A0&gt; &gt; +typedef long long blkcnt_t;<br>&gt; &gt; =
=C2=A0&gt; &gt; =C2=A0&gt;<br>&gt; &gt; =C2=A0&gt; &gt; =C2=A0&gt; This mak=
es me uneasy.=C2=A0 Is there a guarantee that this type will<br>&gt; &gt; n=
ever be<br>&gt; &gt; =C2=A0&gt; &gt; =C2=A0&gt; defined in a mingw environm=
ent (which would then result in a new<br>&gt; &gt; compile<br>&gt; &gt; =C2=
=A0&gt; &gt; =C2=A0&gt; error)?<br>&gt; &gt; =C2=A0&gt; &gt; That&#39;s be =
sure, mingw is compat with msvcrt.dll, so blkcnt_t =C2=A0are<br>&gt; &gt; a=
lways<br>&gt; &gt; =C2=A0&gt; &gt; not defined.<br>&gt; &gt; =C2=A0&gt;<br>=
&gt; &gt; =C2=A0&gt; And there is no possibility of that being added in the=
 future?<br>&gt; &gt; If that&#39;s the case, what&#39;s the better option.=
<br>&gt;<br>&gt; As I said, just making NFSClient.st_blocks a uint64_t.<br>=
&gt;<br>&gt; Max<br>&gt;<br><br><br>--<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=E6=AD=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=E5=88=9A<br>Yours<=
br>=C2=A0 =C2=A0 sincerely,<br>Yonggang Luo</div>

--000000000000a09f5e05b35b49f7--

