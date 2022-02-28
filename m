Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A80894C6909
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 11:57:15 +0100 (CET)
Received: from localhost ([::1]:48744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOdiM-0005pl-IS
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 05:57:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nOdgb-0004W9-7O
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 05:55:25 -0500
Received: from [2607:f8b0:4864:20::b32] (port=47047
 helo=mail-yb1-xb32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nOdgY-0005OR-KH
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 05:55:24 -0500
Received: by mail-yb1-xb32.google.com with SMTP id b35so19590443ybi.13
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 02:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jetbrains.com; s=googleapps;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tF6bCde4edV3AbGTX2xJONwm56s7Jy0XjpgDcykkOAE=;
 b=LRaidBBA376aCMR8Vt10Nakw8bhanygkpxQX6bcDEeaxzJYZtc4E4Z9Gsi2HGf60Ui
 px5p7tT+70cEzDyxGqNlvPOfL2rpu/D2lacNJiDbnOUMIBtTBqp/3hbkh4rXYXXj018X
 FkqlbUTAMPZDtmEM/LuCfN/xxwZnB0pwYsTmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tF6bCde4edV3AbGTX2xJONwm56s7Jy0XjpgDcykkOAE=;
 b=RwqocHCsC4w1hcsgxsWkhkIjf3j/O98kgugU2eKd7nll/S5xhn91IA8xgayWwU4dZz
 o5zHIqGYFG/2AfwgXoTav094oAL+tHdWt6AV07mrZ4GzUmzv8huLJZVj+uV9yJM6SVPB
 TyVfIUMRNhTv5su1qoDWsLQvR/89sKk2HxWb4LktqZZ22adpYcXW18EQr2K87YrNuh5o
 o2unld83hPN1PynPLWmPGi7f+DxApFOjxmj7yOlh2YCK4GKHqt67/r3tuKX2Nx8s2lUa
 kr4ahRpoxgx/npUjXNbFRrKV0U06KDrrUlWE9mEJwLfmzTYyLf5/XIyzCFBg6dWEwHQ5
 SsoA==
X-Gm-Message-State: AOAM5319LZ5dSdextgut8s0q/n0WqmdfG+0vAtW1mU1zewZfhfBUTWnp
 Rsyy/mLEiIYh9/cxOcRqko2mEAQ6hywbI9a15TNTeU6+tcOoGdCO1UXcsw==
X-Google-Smtp-Source: ABdhPJxvP8Q8aJ66cmXbDClzWaZaSZ8sqtlS0jVNNh4wWeSTMXlluYGBYBReU8aTFjmAufekO8xAVTOxtaQxkrGSbM8=
X-Received: by 2002:a81:1e57:0:b0:2d0:e613:a2fc with SMTP id
 e84-20020a811e57000000b002d0e613a2fcmr19245432ywe.151.1646045272349; Mon, 28
 Feb 2022 02:47:52 -0800 (PST)
MIME-Version: 1.0
References: <20220225171402.64861-1-Vladislav.Yaroshchuk@jetbrains.com>
 <20220225171402.64861-3-Vladislav.Yaroshchuk@jetbrains.com>
 <87zgmbuwx8.fsf@pond.sub.org>
In-Reply-To: <87zgmbuwx8.fsf@pond.sub.org>
From: Vladislav Yaroshchuk <vladislav.yaroshchuk@jetbrains.com>
Date: Mon, 28 Feb 2022 13:47:41 +0300
Message-ID: <CAGmdLqQeEPj3E0o7ie+z2AOtXgAKxttwEBMOuEE__Ak8SNjE=w@mail.gmail.com>
Subject: Re: [PATCH v15 2/8] net/vmnet: add vmnet backends to qapi/net
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, jasowang@redhat.com, r.bolshakov@yadro.com, 
 eblake@redhat.com, phillip.ennen@gmail.com, phillip@axleos.com, 
 Akihiko Odaki <akihiko.odaki@gmail.com>, hsp.cat7@gmail.com, hello@adns.io, 
 roman@roolebo.dev, Peter Maydell <peter.maydell@linaro.org>, dirty@apple.com, 
 f4bug@amsat.org, agraf@csgraf.de, kraxel@redhat.com, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu_oss@crudebyte.com
Content-Type: multipart/alternative; boundary="000000000000be43c505d911c7dd"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=vladislav.yaroshchuk@jetbrains.com;
 helo=mail-yb1-xb32.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

--000000000000be43c505d911c7dd
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 28, 2022 at 1:07 PM Markus Armbruster <armbru@redhat.com> wrote:

> Vladislav Yaroshchuk <vladislav.yaroshchuk@jetbrains.com> writes:
>
> > Create separate netdevs for each vmnet operating mode:
> > - vmnet-host
> > - vmnet-shared
> > - vmnet-bridged
> >
> > Signed-off-by: Vladislav Yaroshchuk <Vladislav.Yaroshchuk@jetbrains.com>
>
> I acked v8 and v13 of the QAPI schema part.  You should add Acked-by and
> Reviewed-by you receive in later revisions, unless you make changes that
> invalidate them.  When in doubt, drop them.  However, this patch is
> identical to v13.  You dropping my Acked-by made me look at it again,
> wasting my time.  Please don't.
>
>
I missed the qapi discussion thread while working on other parts,
sincerely apologize. Don't want to waste your time, sorry.


> > diff --git a/qapi/net.json b/qapi/net.json
> > index 7fab2e7cd8..b922e2e34f 100644
> > --- a/qapi/net.json
> > +++ b/qapi/net.json
> > @@ -452,6 +452,120 @@
> >      '*vhostdev':     'str',
> >      '*queues':       'int' } }
> >
> > +##
> > +# @NetdevVmnetHostOptions:
> > +#
> > +# vmnet (host mode) network backend.
> > +#
> > +# Allows the vmnet interface to communicate with other vmnet
> > +# interfaces that are in host mode and also with the host.
> > +#
> > +# @start-address: The starting IPv4 address to use for the interface.
> > +#                 Must be in the private IP range (RFC 1918). Must be
> > +#                 specified along with @end-address and @subnet-mask.
> > +#                 This address is used as the gateway address. The
> > +#                 subsequent address up to and including end-address are
> > +#                 placed in the DHCP pool.
> > +#
> > +# @end-address: The DHCP IPv4 range end address to use for the
> > +#               interface. Must be in the private IP range (RFC 1918).
> > +#               Must be specified along with @start-address and
> > +#               @subnet-mask.
> > +#
> > +# @subnet-mask: The IPv4 subnet mask to use on the interface. Must
> > +#               be specified along with @start-address and @subnet-mask.
> > +#
> > +# @isolated: Enable isolation for this interface. Interface isolation
> > +#            ensures that vmnet interface is not able to communicate
> > +#            with any other vmnet interfaces. Only communication with
> > +#            host is allowed. Available since macOS Big Sur 11.0.
>
> In review of v13, I suggested to replace "Available since macOS Big Sur
> 11.0" by "Requires at least macOS Big Sur 11.0" here and below, and you
> agreed.  Looks like you forgot to actually change them.
>
> With these changes, QAPI schema
> Acked-by: Markus Armbruster <armbru@redhat.com>
>
>
Fixed locally, will submit within the next version. Thank you!

[...]
>
>
Best Regards,

Vladislav Yaroshchuk

--000000000000be43c505d911c7dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 28, 2022 at 1:07 PM Marku=
s Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Vlad=
islav Yaroshchuk &lt;<a href=3D"mailto:vladislav.yaroshchuk@jetbrains.com" =
target=3D"_blank">vladislav.yaroshchuk@jetbrains.com</a>&gt; writes:<br>
<br>
&gt; Create separate netdevs for each vmnet operating mode:<br>
&gt; - vmnet-host<br>
&gt; - vmnet-shared<br>
&gt; - vmnet-bridged<br>
&gt;<br>
&gt; Signed-off-by: Vladislav Yaroshchuk &lt;<a href=3D"mailto:Vladislav.Ya=
roshchuk@jetbrains.com" target=3D"_blank">Vladislav.Yaroshchuk@jetbrains.co=
m</a>&gt;<br>
<br>
I acked v8 and v13 of the QAPI schema part.=C2=A0 You should add Acked-by a=
nd<br>
Reviewed-by you receive in later revisions, unless you make changes that<br=
>
invalidate them.=C2=A0 When in doubt, drop them.=C2=A0 However, this patch =
is<br>
identical to v13.=C2=A0 You dropping my Acked-by made me look at it again,<=
br>
wasting my time.=C2=A0 Please don&#39;t.<br>
<br></blockquote><div><br>I missed the qapi discussion thread while working=
 on other=C2=A0parts,</div><div>sincerely apologize. Don&#39;t want to wast=
e your time,=C2=A0sorry.=C2=A0<br>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
&gt; diff --git a/qapi/net.json b/qapi/net.json<br>
&gt; index 7fab2e7cd8..b922e2e34f 100644<br>
&gt; --- a/qapi/net.json<br>
&gt; +++ b/qapi/net.json<br>
&gt; @@ -452,6 +452,120 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &#39;*vhostdev&#39;:=C2=A0 =C2=A0 =C2=A0&#39;str&#=
39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &#39;*queues&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;=
int&#39; } }<br>
&gt;=C2=A0 <br>
&gt; +##<br>
&gt; +# @NetdevVmnetHostOptions:<br>
&gt; +#<br>
&gt; +# vmnet (host mode) network backend.<br>
&gt; +#<br>
&gt; +# Allows the vmnet interface to communicate with other vmnet<br>
&gt; +# interfaces that are in host mode and also with the host.<br>
&gt; +#<br>
&gt; +# @start-address: The starting IPv4 address to use for the interface.=
<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Must b=
e in the private IP range (RFC 1918). Must be<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0specif=
ied along with @end-address and @subnet-mask.<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This a=
ddress is used as the gateway address. The<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subseq=
uent address up to and including end-address are<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0placed=
 in the DHCP pool.<br>
&gt; +#<br>
&gt; +# @end-address: The DHCP IPv4 range end address to use for the<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interface. Mu=
st be in the private IP range (RFC 1918).<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Must be speci=
fied along with @start-address and<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@subnet-mask.=
<br>
&gt; +#<br>
&gt; +# @subnet-mask: The IPv4 subnet mask to use on the interface. Must<br=
>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0be specified =
along with @start-address and @subnet-mask.<br>
&gt; +#<br>
&gt; +# @isolated: Enable isolation for this interface. Interface isolation=
<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ensures that vmnet interfa=
ce is not able to communicate<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with any other vmnet inter=
faces. Only communication with<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host is allowed. Available=
 since macOS Big Sur 11.0.<br>
<br>
In review of v13, I suggested to replace &quot;Available since macOS Big Su=
r<br>
11.0&quot; by &quot;Requires at least macOS Big Sur 11.0&quot; here and bel=
ow, and you<br>
agreed.=C2=A0 Looks like you forgot to actually change them.<br>
<br>
With these changes, QAPI schema<br>
Acked-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" target=
=3D"_blank">armbru@redhat.com</a>&gt;<br>
<br></blockquote><div><br>Fixed locally, will submit within the next versio=
n. Thank you!</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
[...]<br>
<br></blockquote><div><br></div><div>Best Regards,<br><br>Vladislav Yaroshc=
huk=C2=A0</div></div></div>

--000000000000be43c505d911c7dd--

