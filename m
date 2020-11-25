Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 631BB2C3B6C
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 09:56:48 +0100 (CET)
Received: from localhost ([::1]:57906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khqbW-0006bY-Uj
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 03:56:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1khqZr-0005hm-5v
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 03:55:03 -0500
Received: from mail-oo1-xc42.google.com ([2607:f8b0:4864:20::c42]:34254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1khqZo-0001OC-Dh
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 03:55:02 -0500
Received: by mail-oo1-xc42.google.com with SMTP id l10so317822ooh.1
 for <qemu-devel@nongnu.org>; Wed, 25 Nov 2020 00:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PAZEAGuMhmOcEV5WNzYxhTDbEV7LwlxWEtuY1MviPC4=;
 b=tUz4tk8BMY2QNeKxw1LfU1QSUzGrQXlZpXL0CR0ZixBBQpP2WXy8mw6mnBamuPe/uK
 zrNdcXok8mcLAiwJIX+NeuIqg19KZv6elPr43al9N9k8mjLHIt/+hXnbyr+CXFl3pHDz
 Eo8Lw1sGGY+T4zGowa86bIU5R38OcMyhnoTi+kAVWd3zB4E81aHc+Woshx9M3ibRs7tB
 CG1yRxmT8mXosPCh/L/wp2ykogsXu9L8rOznYifsSaXMbBda9e2hk0tJUsCBOiH0ETMM
 d+dW2R70b87HvXpPkKswTYd+OArD3ZDGLGH/XloNESegw7Ql/+xGQbv4PTnzFeDEWApC
 0LaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PAZEAGuMhmOcEV5WNzYxhTDbEV7LwlxWEtuY1MviPC4=;
 b=pBGJhytMRa0BGFnCR+fb+zmEcNOwAsv6P5j+L9MduYUp70nQxRBpkICuZYiTScfd2O
 XefFJniFUeR36ZOythTYAM8w2mycN5r5O6Cgd26nyNa+neRlonXkTaJfE/ouUJlkFCK/
 4hfh6qknz2w8Lko80ZTGwnUcRZLp/tIwcBA89MUiIeSmgseF5y2ImdDLHs4ueM8ke+Sy
 CiC3/9fpzg4+r9nbmMxREloXGCIY4NyGO7AxQ4ZwKWWDMDrRrmBlrRSdmuEPnuOU3qzU
 gaqYZB9Bz0rjS+Bd49RqHAswJLncKkWTX4ub3CkwgoAdPsiSxWUbd3teFdI5qszRbit9
 fmTg==
X-Gm-Message-State: AOAM530tYs7cLRstUHikFPEAgiHTaOFFVKvaUq4fZ4GoWyWflflL+IPY
 ENwmWG6gmBo36Tp+ZI/IvL98k8WS8jdTpMwsyoVyGQ==
X-Google-Smtp-Source: ABdhPJzyWG5l82d+1+OiUSIJsjdZiQMyUo63UTmrC5H+XYZxYHGnLI5sEQLjAD7jKqa9G604JOUpJXZmskFMotQDubg=
X-Received: by 2002:a4a:e882:: with SMTP id g2mr60578ooe.55.1606294495004;
 Wed, 25 Nov 2020 00:54:55 -0800 (PST)
MIME-Version: 1.0
References: <20200716035532.1407660-1-andrew@daynix.com>
 <CABcq3pGFPkDMmEegGaw6UjHBijPZiyFj-uR+6Phz+0K44VRNgw@mail.gmail.com>
 <874klk5gnc.fsf@dusky.pond.sub.org>
 <CAOEp5OfjuR97v0VyyHpXJiZVsU1jMphHh86XwAU4t3Uw1T8Ghg@mail.gmail.com>
 <CAOEp5OdiFaCK=Ag8f9oNixhrkW4xoEJ2bXKU7ThXeF9VJXPqTw@mail.gmail.com>
 <CABcq3pGDAO7sB6jobcsiE8_7md1yZ7wGkkyxZefjXGc7-d6obw@mail.gmail.com>
 <87lfesv2zu.fsf@dusky.pond.sub.org>
 <CAOEp5OcAXn0dvvpaZSu3C0rnGPA_NTFKUxqMMKMJx2xzBQ8YiA@mail.gmail.com>
 <87blfnp20k.fsf@dusky.pond.sub.org> <87lferm4x5.fsf@dusky.pond.sub.org>
 <CAOEp5Oe18jtsgHVqwtm+-sqspD6KoJTOO9nNPmcWS++AVGjXKQ@mail.gmail.com>
 <87tutej3dc.fsf@dusky.pond.sub.org> <87blfmj2qx.fsf@dusky.pond.sub.org>
 <CAOEp5Ofozi59Ns3F72p-5VGgPBMdrym3dS8GCEiNg9Ovh0jK3A@mail.gmail.com>
 <87y2iqg3m3.fsf@dusky.pond.sub.org>
In-Reply-To: <87y2iqg3m3.fsf@dusky.pond.sub.org>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Wed, 25 Nov 2020 10:54:44 +0200
Message-ID: <CAOEp5OdzKNOBkXQDePKLe90jpYqYyNyis1gqsJ0dCSB2YC29Dw@mail.gmail.com>
Subject: Re: [PATCH] hmp: Changed hmp_netdev_add() using
 qmp_marshal_netdev_add()
To: Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000c79aea05b4ea94e6"
Received-SPF: none client-ip=2607:f8b0:4864:20::c42;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-oo1-xc42.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Yan Vugenfirer <yan@daynix.com>, Andrew Melnichenko <andrew@daynix.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c79aea05b4ea94e6
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 24, 2020 at 5:46 PM Markus Armbruster <armbru@redhat.com> wrote:

> Yuri Benditovich <yuri.benditovich@daynix.com> writes:
>
> > On Tue, Nov 24, 2020 at 3:36 PM Markus Armbruster <armbru@redhat.com>
> wrote:
> >
> >> Markus Armbruster <armbru@redhat.com> writes:
> >>
> >> > Yuri Benditovich <yuri.benditovich@daynix.com> writes:
> >> >
> >> >> Please confirm that this patch is intended to solve only the problem
> >> with
> >> >> hmp (and disallow duplicated ids)
> >> >
> >> > The intent is to reject duplicate ID and to accept non-duplicate ID,
> no
> >> > matter how the device is created (CLI, HMP, QMP) or a prior instance
> was
> >> > deleted (HMP, QMP).
> >> >
> >> >> With it the netdev that was added from qemu's command line and was
> >> deleted
> >> >> (for example by hmp) still can't be created, correct?
> >> >
> >> > Yet another case; back to the drawing board...
> >>
> >> Next try.  Hope this is one holds water :)
> >>
> >>
> >> diff --git a/net/net.c b/net/net.c
> >> index 794c652282..c1dc75fc37 100644
> >> --- a/net/net.c
> >> +++ b/net/net.c
> >> @@ -978,6 +978,7 @@ static int (* const
> >> net_client_init_fun[NET_CLIENT_DRIVER__MAX])(
> >>  static int net_client_init1(const Netdev *netdev, bool is_netdev, Error
> >> **errp)
> >>  {
> >>      NetClientState *peer = NULL;
> >> +    NetClientState *nc;
> >>
> >>      if (is_netdev) {
> >>          if (netdev->type == NET_CLIENT_DRIVER_NIC ||
> >> @@ -1005,6 +1006,12 @@ static int net_client_init1(const Netdev *netdev,
> >> bool is_netdev, Error **errp)
> >>          }
> >>      }
> >>
> >> +    nc = qemu_find_netdev(netdev->id);
> >> +    if (nc) {
> >> +        error_setg(errp, "Duplicate ID '%s'", netdev->id);
> >> +        return -1;
> >> +    }
> >> +
> >>      if (net_client_init_fun[netdev->type](netdev, netdev->id, peer,
> errp)
> >> < 0) {
> >>          /* FIXME drop when all init functions store an Error */
> >>          if (errp && !*errp) {
> >> @@ -1015,8 +1022,6 @@ static int net_client_init1(const Netdev *netdev,
> >> bool is_netdev, Error **errp)
> >>      }
> >>
> >>      if (is_netdev) {
> >> -        NetClientState *nc;
> >> -
> >>          nc = qemu_find_netdev(netdev->id);
> >>          assert(nc);
> >>          nc->is_netdev = true;
> >> @@ -1137,6 +1142,7 @@ void qmp_netdev_add(Netdev *netdev, Error **errp)
> >>  void qmp_netdev_del(const char *id, Error **errp)
> >>  {
> >>      NetClientState *nc;
> >> +    QemuOpts *opts;
> >>
> >>      nc = qemu_find_netdev(id);
> >>      if (!nc) {
> >> @@ -1151,6 +1157,16 @@ void qmp_netdev_del(const char *id, Error **errp)
> >>      }
> >>
> >>      qemu_del_net_client(nc);
> >> +
> >> +    /*
> >> +     * Wart: we need to delete the QemuOpts associated with netdevs
> >> +     * created via CLI or HMP, to avoid bogus "Duplicate ID" errors in
> >> +     * HMP netdev_add.
> >> +     */
> >> +    opts = qemu_opts_find(qemu_find_opts("netdev"), id);
> >> +    if (opts) {
> >> +        qemu_opts_del(opts);
> >> +    }
> >>  }
> >>
> >>
> > With this part there is no need to unconditionally delete the options
> > in hmp_netdev_add,
> > correct?
>
> Yes.
>
> The CLI accumulates -netdev in option group "netdev".  It has to, or
> else -writeconfig doesn't work.
>
> Before commit 08712fcb85 "net: Track netdevs in NetClientState rather
> than QemuOpt", netdev_add added to the option group, and netdev_del
> removed from it, both for HMP and QMP.  Thus, every netdev had a
> corresponding QemuOpts in this option group.
>
> Commit 08712fcb85 dropped this for QMP netdev_add and both netdev_del.
> Now a netdev has a corresponding QemuOpts only when it was created with
> CLI or HMP.  Two issues:
>
> * QMP netdev_add loses its "no duplicate ID" check.
>
>   My change to net_init_client1() fixes this.
>
> * Both netdev_add can leave QemuOpts behind, breaking HMP netdev_add.
>
>   My change to qmp_netdev_del() fixes this.
>
> Questions?
>
> No questions, looking forward for the final patch
Thanks

--000000000000c79aea05b4ea94e6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 24, 2020 at 5:46 PM Marku=
s Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Yuri=
 Benditovich &lt;<a href=3D"mailto:yuri.benditovich@daynix.com" target=3D"_=
blank">yuri.benditovich@daynix.com</a>&gt; writes:<br>
<br>
&gt; On Tue, Nov 24, 2020 at 3:36 PM Markus Armbruster &lt;<a href=3D"mailt=
o:armbru@redhat.com" target=3D"_blank">armbru@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt;&gt; Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" target=
=3D"_blank">armbru@redhat.com</a>&gt; writes:<br>
&gt;&gt;<br>
&gt;&gt; &gt; Yuri Benditovich &lt;<a href=3D"mailto:yuri.benditovich@dayni=
x.com" target=3D"_blank">yuri.benditovich@daynix.com</a>&gt; writes:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; Please confirm that this patch is intended to solve only =
the problem<br>
&gt;&gt; with<br>
&gt;&gt; &gt;&gt; hmp (and disallow duplicated ids)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; The intent is to reject duplicate ID and to accept non-duplic=
ate ID, no<br>
&gt;&gt; &gt; matter how the device is created (CLI, HMP, QMP) or a prior i=
nstance was<br>
&gt;&gt; &gt; deleted (HMP, QMP).<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; With it the netdev that was added from qemu&#39;s command=
 line and was<br>
&gt;&gt; deleted<br>
&gt;&gt; &gt;&gt; (for example by hmp) still can&#39;t be created, correct?=
<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Yet another case; back to the drawing board...<br>
&gt;&gt;<br>
&gt;&gt; Next try.=C2=A0 Hope this is one holds water :)<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/net/net.c b/net/net.c<br>
&gt;&gt; index 794c652282..c1dc75fc37 100644<br>
&gt;&gt; --- a/net/net.c<br>
&gt;&gt; +++ b/net/net.c<br>
&gt;&gt; @@ -978,6 +978,7 @@ static int (* const<br>
&gt;&gt; net_client_init_fun[NET_CLIENT_DRIVER__MAX])(<br>
&gt;&gt;=C2=A0 static int net_client_init1(const Netdev *netdev, bool is_ne=
tdev, Error<br>
&gt;&gt; **errp)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 NetClientState *peer =3D NULL;<br>
&gt;&gt; +=C2=A0 =C2=A0 NetClientState *nc;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 if (is_netdev) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (netdev-&gt;type =3D=3D NET_C=
LIENT_DRIVER_NIC ||<br>
&gt;&gt; @@ -1005,6 +1006,12 @@ static int net_client_init1(const Netdev *n=
etdev,<br>
&gt;&gt; bool is_netdev, Error **errp)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt; +=C2=A0 =C2=A0 nc =3D qemu_find_netdev(netdev-&gt;id);<br>
&gt;&gt; +=C2=A0 =C2=A0 if (nc) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Duplicate ID &=
#39;%s&#39;&quot;, netdev-&gt;id);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 if (net_client_init_fun[netdev-&gt;type](netde=
v, netdev-&gt;id, peer, errp)<br>
&gt;&gt; &lt; 0) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* FIXME drop when all init func=
tions store an Error */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errp &amp;&amp; !*errp) {<br=
>
&gt;&gt; @@ -1015,8 +1022,6 @@ static int net_client_init1(const Netdev *ne=
tdev,<br>
&gt;&gt; bool is_netdev, Error **errp)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 if (is_netdev) {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 NetClientState *nc;<br>
&gt;&gt; -<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nc =3D qemu_find_netdev(netdev-&=
gt;id);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(nc);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nc-&gt;is_netdev =3D true;<br>
&gt;&gt; @@ -1137,6 +1142,7 @@ void qmp_netdev_add(Netdev *netdev, Error **=
errp)<br>
&gt;&gt;=C2=A0 void qmp_netdev_del(const char *id, Error **errp)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 NetClientState *nc;<br>
&gt;&gt; +=C2=A0 =C2=A0 QemuOpts *opts;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 nc =3D qemu_find_netdev(id);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 if (!nc) {<br>
&gt;&gt; @@ -1151,6 +1157,16 @@ void qmp_netdev_del(const char *id, Error *=
*errp)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 qemu_del_net_client(nc);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 /*<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0* Wart: we need to delete the QemuOpts associ=
ated with netdevs<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0* created via CLI or HMP, to avoid bogus &quo=
t;Duplicate ID&quot; errors in<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0* HMP netdev_add.<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt;&gt; +=C2=A0 =C2=A0 opts =3D qemu_opts_find(qemu_find_opts(&quot;netdev=
&quot;), id);<br>
&gt;&gt; +=C2=A0 =C2=A0 if (opts) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_opts_del(opts);<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; With this part there is no need to unconditionally delete the options<=
br>
&gt; in hmp_netdev_add,<br>
&gt; correct?<br>
<br>
Yes.<br>
<br>
The CLI accumulates -netdev in option group &quot;netdev&quot;.=C2=A0 It ha=
s to, or<br>
else -writeconfig doesn&#39;t work.<br>
<br>
Before commit 08712fcb85 &quot;net: Track netdevs in NetClientState rather<=
br>
than QemuOpt&quot;, netdev_add added to the option group, and netdev_del<br=
>
removed from it, both for HMP and QMP.=C2=A0 Thus, every netdev had a<br>
corresponding QemuOpts in this option group.<br>
<br>
Commit 08712fcb85 dropped this for QMP netdev_add and both netdev_del.<br>
Now a netdev has a corresponding QemuOpts only when it was created with<br>
CLI or HMP.=C2=A0 Two issues:<br>
<br>
* QMP netdev_add loses its &quot;no duplicate ID&quot; check.<br>
<br>
=C2=A0 My change to net_init_client1() fixes this.<br>
<br>
* Both netdev_add can leave QemuOpts behind, breaking HMP netdev_add.<br>
<br>
=C2=A0 My change to qmp_netdev_del() fixes this.<br>
<br>
Questions?<br>
<br></blockquote><div>No questions, looking forward for the final patch</di=
v><div>Thanks</div><div>=C2=A0</div></div></div>

--000000000000c79aea05b4ea94e6--

