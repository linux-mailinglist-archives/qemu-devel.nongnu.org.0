Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C852C28F7
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 15:05:40 +0100 (CET)
Received: from localhost ([::1]:48190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khYwt-0006dG-36
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 09:05:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1khYvE-0006B6-UL
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 09:03:56 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:40983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1khYvC-00057D-Lu
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 09:03:56 -0500
Received: by mail-ot1-x343.google.com with SMTP id o3so19408624ota.8
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 06:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aJ4lfhx8djW0Z0WvrYqOJN5dSR/azb3OIQKXQjFH3lY=;
 b=vkTfaIRHjjtkHbW7IC6DPoCNW0Rcxstzi7gz57BYs9p6L0YhTKBdQO/H67csIpn0Sp
 MHMACTTW4MygJTRP4weAXPZtofwt7oztGH8myiHb+AKewdN44MbEniN0vtrRcb6gz0gl
 RQt2dX0+bmlA8polnKJ+A1THucXgLiXznkJChN13wqMIfm+fR2gqA/VkKa2T4LiER381
 57RH6XBJqHPhwX1GjYJx41MTGxTohIelHj0iwW+2vU5wuJoG8FTYwgBflLm3hxTZKly6
 VP4mTkCsYbmgBoQeBtaz8ZCjOCmZ0hXJoqv3E19UPxZGj7p0MvK8kfzx3u2E8PkSkRLc
 jHow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aJ4lfhx8djW0Z0WvrYqOJN5dSR/azb3OIQKXQjFH3lY=;
 b=I5IIagk0g8MSJde5FSU3yYZAb5eQfU64ZPhQA9CHpozDSU74Kvr8VUN0O1YnXbTgjA
 AxH9ZDmNTiH8EOWwDbwDwTj8jQ1QUUPohw432NjcSmLh4aIC19Uvm2t5QslsAp2Nm+Xx
 4thjR1G58iVSBiX2zz7DuXmQxN+roFgtn+C3a1vG5CXdjd55+MJqzs1Ig8qD3vwF+7Rx
 6BOlI+PqwSFU7elbUBJqv8S/zlLvcDmP93ot3Hc7tBJY1Fx6lImbwy/x/HiOCqeEIAWO
 1uujD8rRntUKJJ32giv393aHUhhgmCtUg+y+Css2pH4ixUlEw7AzdjZWs8P0eV6Dv+pV
 RXzg==
X-Gm-Message-State: AOAM5334VLNEKl14WxNttlOsaOvDvujOrXuT83GvOYjk1chWXP9e3yB1
 LatyGE5Se8FT9JrMrtzc82HBrKrQ7DzdT3OCnGSIdQ==
X-Google-Smtp-Source: ABdhPJxMOGxuPU6sXrRDVKGB4W9qzD30hKNb6cMrTZMhGrCoEgWLMwdQ6Z/pOipiS+CVzTYTBmjyaaS7YGsMj+gIezI=
X-Received: by 2002:a9d:4715:: with SMTP id a21mr3429552otf.220.1606226633408; 
 Tue, 24 Nov 2020 06:03:53 -0800 (PST)
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
In-Reply-To: <87blfmj2qx.fsf@dusky.pond.sub.org>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Tue, 24 Nov 2020 16:03:42 +0200
Message-ID: <CAOEp5Ofozi59Ns3F72p-5VGgPBMdrym3dS8GCEiNg9Ovh0jK3A@mail.gmail.com>
Subject: Re: [PATCH] hmp: Changed hmp_netdev_add() using
 qmp_marshal_netdev_add()
To: Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000e9dd6d05b4dac783"
Received-SPF: none client-ip=2607:f8b0:4864:20::343;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-ot1-x343.google.com
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

--000000000000e9dd6d05b4dac783
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 24, 2020 at 3:36 PM Markus Armbruster <armbru@redhat.com> wrote:

> Markus Armbruster <armbru@redhat.com> writes:
>
> > Yuri Benditovich <yuri.benditovich@daynix.com> writes:
> >
> >> Please confirm that this patch is intended to solve only the problem
> with
> >> hmp (and disallow duplicated ids)
> >
> > The intent is to reject duplicate ID and to accept non-duplicate ID, no
> > matter how the device is created (CLI, HMP, QMP) or a prior instance was
> > deleted (HMP, QMP).
> >
> >> With it the netdev that was added from qemu's command line and was
> deleted
> >> (for example by hmp) still can't be created, correct?
> >
> > Yet another case; back to the drawing board...
>
> Next try.  Hope this is one holds water :)
>
>
> diff --git a/net/net.c b/net/net.c
> index 794c652282..c1dc75fc37 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -978,6 +978,7 @@ static int (* const
> net_client_init_fun[NET_CLIENT_DRIVER__MAX])(
>  static int net_client_init1(const Netdev *netdev, bool is_netdev, Error
> **errp)
>  {
>      NetClientState *peer = NULL;
> +    NetClientState *nc;
>
>      if (is_netdev) {
>          if (netdev->type == NET_CLIENT_DRIVER_NIC ||
> @@ -1005,6 +1006,12 @@ static int net_client_init1(const Netdev *netdev,
> bool is_netdev, Error **errp)
>          }
>      }
>
> +    nc = qemu_find_netdev(netdev->id);
> +    if (nc) {
> +        error_setg(errp, "Duplicate ID '%s'", netdev->id);
> +        return -1;
> +    }
> +
>      if (net_client_init_fun[netdev->type](netdev, netdev->id, peer, errp)
> < 0) {
>          /* FIXME drop when all init functions store an Error */
>          if (errp && !*errp) {
> @@ -1015,8 +1022,6 @@ static int net_client_init1(const Netdev *netdev,
> bool is_netdev, Error **errp)
>      }
>
>      if (is_netdev) {
> -        NetClientState *nc;
> -
>          nc = qemu_find_netdev(netdev->id);
>          assert(nc);
>          nc->is_netdev = true;
> @@ -1137,6 +1142,7 @@ void qmp_netdev_add(Netdev *netdev, Error **errp)
>  void qmp_netdev_del(const char *id, Error **errp)
>  {
>      NetClientState *nc;
> +    QemuOpts *opts;
>
>      nc = qemu_find_netdev(id);
>      if (!nc) {
> @@ -1151,6 +1157,16 @@ void qmp_netdev_del(const char *id, Error **errp)
>      }
>
>      qemu_del_net_client(nc);
> +
> +    /*
> +     * Wart: we need to delete the QemuOpts associated with netdevs
> +     * created via CLI or HMP, to avoid bogus "Duplicate ID" errors in
> +     * HMP netdev_add.
> +     */
> +    opts = qemu_opts_find(qemu_find_opts("netdev"), id);
> +    if (opts) {
> +        qemu_opts_del(opts);
> +    }
>  }
>
>
With this part there is no need to unconditionally delete the options
in hmp_netdev_add,
correct?


>  static void netfilter_print_info(Monitor *mon, NetFilterState *nf)
> --
> 2.26.2
>
>

--000000000000e9dd6d05b4dac783
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 24, 2020=
 at 3:36 PM Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armb=
ru@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" tar=
get=3D"_blank">armbru@redhat.com</a>&gt; writes:<br>
<br>
&gt; Yuri Benditovich &lt;<a href=3D"mailto:yuri.benditovich@daynix.com" ta=
rget=3D"_blank">yuri.benditovich@daynix.com</a>&gt; writes:<br>
&gt;<br>
&gt;&gt; Please confirm that this patch is intended to solve only the probl=
em with<br>
&gt;&gt; hmp (and disallow duplicated ids)<br>
&gt;<br>
&gt; The intent is to reject duplicate ID and to accept non-duplicate ID, n=
o<br>
&gt; matter how the device is created (CLI, HMP, QMP) or a prior instance w=
as<br>
&gt; deleted (HMP, QMP).<br>
&gt;<br>
&gt;&gt; With it the netdev that was added from qemu&#39;s command line and=
 was deleted<br>
&gt;&gt; (for example by hmp) still can&#39;t be created, correct?<br>
&gt;<br>
&gt; Yet another case; back to the drawing board...<br>
<br>
Next try.=C2=A0 Hope this is one holds water :)<br>
<br>
<br>
diff --git a/net/net.c b/net/net.c<br>
index 794c652282..c1dc75fc37 100644<br>
--- a/net/net.c<br>
+++ b/net/net.c<br>
@@ -978,6 +978,7 @@ static int (* const net_client_init_fun[NET_CLIENT_DRIV=
ER__MAX])(<br>
=C2=A0static int net_client_init1(const Netdev *netdev, bool is_netdev, Err=
or **errp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0NetClientState *peer =3D NULL;<br>
+=C2=A0 =C2=A0 NetClientState *nc;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (is_netdev) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (netdev-&gt;type =3D=3D NET_CLIENT_DRI=
VER_NIC ||<br>
@@ -1005,6 +1006,12 @@ static int net_client_init1(const Netdev *netdev, bo=
ol is_netdev, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 nc =3D qemu_find_netdev(netdev-&gt;id);<br>
+=C2=A0 =C2=A0 if (nc) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Duplicate ID &#39;%s&#3=
9;&quot;, netdev-&gt;id);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0if (net_client_init_fun[netdev-&gt;type](netdev, netdev=
-&gt;id, peer, errp) &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* FIXME drop when all init functions sto=
re an Error */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (errp &amp;&amp; !*errp) {<br>
@@ -1015,8 +1022,6 @@ static int net_client_init1(const Netdev *netdev, boo=
l is_netdev, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (is_netdev) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 NetClientState *nc;<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nc =3D qemu_find_netdev(netdev-&gt;id);<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(nc);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nc-&gt;is_netdev =3D true;<br>
@@ -1137,6 +1142,7 @@ void qmp_netdev_add(Netdev *netdev, Error **errp)<br>
=C2=A0void qmp_netdev_del(const char *id, Error **errp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0NetClientState *nc;<br>
+=C2=A0 =C2=A0 QemuOpts *opts;<br>
<br>
=C2=A0 =C2=A0 =C2=A0nc =3D qemu_find_netdev(id);<br>
=C2=A0 =C2=A0 =C2=A0if (!nc) {<br>
@@ -1151,6 +1157,16 @@ void qmp_netdev_del(const char *id, Error **errp)<br=
>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0qemu_del_net_client(nc);<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Wart: we need to delete the QemuOpts associated with=
 netdevs<br>
+=C2=A0 =C2=A0 =C2=A0* created via CLI or HMP, to avoid bogus &quot;Duplica=
te ID&quot; errors in<br>
+=C2=A0 =C2=A0 =C2=A0* HMP netdev_add.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 opts =3D qemu_opts_find(qemu_find_opts(&quot;netdev&quot;), =
id);<br>
+=C2=A0 =C2=A0 if (opts) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_opts_del(opts);<br>
+=C2=A0 =C2=A0 }<br>
=C2=A0}<br>
<br></blockquote><div><br></div><div>With this part there is no need to unc=
onditionally delete the options in=C2=A0<span style=3D"color:rgb(80,0,80)">=
hmp_netdev_add, correct?</span></div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
=C2=A0static void netfilter_print_info(Monitor *mon, NetFilterState *nf)<br=
>
-- <br>
2.26.2<br>
<br>
</blockquote></div></div></div>

--000000000000e9dd6d05b4dac783--

