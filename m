Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D27492B6A
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 17:38:51 +0100 (CET)
Received: from localhost ([::1]:57026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9rVS-0004uJ-Cv
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 11:38:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n9r9q-000411-18
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 11:16:30 -0500
Received: from [2607:f8b0:4864:20::530] (port=38674
 helo=mail-pg1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n9r9n-0001yg-IZ
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 11:16:29 -0500
Received: by mail-pg1-x530.google.com with SMTP id q75so6790862pgq.5
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 08:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W4Ji5eoz8iVyOyB2L7PJLr3zkgP+PmIfkoK/Mm5vV+M=;
 b=m5hmGBOeka83wBEr4cGG73iAavGbQRHLn9hAofZhP2hP3oVAurFc3l3ElXXzM6RzqG
 l3WWqTL2iPO264qGUvcyiEmPYbbWyHZ32eM4wO8hIk1AwlJlLjIvhOzcK4ll6y2a1GuS
 y15OfOCNKr1rBrmfq7BGkftOSY8ejJu/EF6xgQgLBBp7iAdxKvKnjIrRp7Y416jFlon5
 h45VDgAuqQ7h42W7NtLpGh70eNNhsWWYzDS4sPBGbnNC+qJSo9SMip69Yz02A/YqJF2A
 dYy0ZZXQmoxhTL8lEreuTzpHpDJ4P7MeRLn6dGZDQBugQ5phRBcxzF/TaLblOjwkEOJ5
 gAtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W4Ji5eoz8iVyOyB2L7PJLr3zkgP+PmIfkoK/Mm5vV+M=;
 b=t+pN5uUhX8Ilbrl9WZqwByjqtuwoJcXDNW7PhD3Ri8HEkHqtP4hbbFs45ULo6E9LLJ
 LE3Qij0G3Cy1XGObRaJwTvGO4Mkep/5t92JOj4Yc/bkBSU6BRF2jNwQocyVe+TjTJ5or
 WfZKjh2YX5WBezMpNu9X8YwJC8fWvDVjO22aPV+jwJb11OArgqJHDq+VNJ46n18MxaGx
 Ll92INszec1d8AXt5Qt1LTt5tWc+i7uU+FrJsm20V5ii/D9FBGZQXD7jDedaZsiSzHIZ
 3aqTP0b6HsE2T6OKe5DxYkvt5Fwssd/9Wx5hjZu6wd8lG1yiHg/IHQHvYL5K4iPbvkmG
 6AYQ==
X-Gm-Message-State: AOAM530Wg3TB/EqSNGRtXtIA35UOE/Qmrfl37rRFxP8MeMkp0CvqWh5M
 L/aEQPuNJsReFRkdThICuRHO9N+6SmpRZwK4ptw=
X-Google-Smtp-Source: ABdhPJxVRUJwidjdEp2ad85MjTKmrlae7ZEDRvLZNYGxb7nQ2ovQCN7wuR7bJem0wgssKxHmd/CpgjJtEQhpjcrUYhU=
X-Received: by 2002:a63:8c49:: with SMTP id q9mr23734144pgn.425.1642522582163; 
 Tue, 18 Jan 2022 08:16:22 -0800 (PST)
MIME-Version: 1.0
References: <20220113172219.66372-1-yaroshchuk2000@gmail.com>
 <20220113172219.66372-3-yaroshchuk2000@gmail.com>
 <87r19584xc.fsf@dusky.pond.sub.org>
In-Reply-To: <87r19584xc.fsf@dusky.pond.sub.org>
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Date: Tue, 18 Jan 2022 19:16:09 +0300
Message-ID: <CADO9X9TWscKRoJMTNQt+v84xCyc5SX8H71XcGchZ1dNF_WLQtw@mail.gmail.com>
Subject: Re: [PATCH v13 2/7] net/vmnet: add vmnet backends to qapi/net
To: Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000000ba56205d5dd9773"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::530
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>, phillip.ennen@gmail.com,
 qemu-devel <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Roman Bolshakov <roman@roolebo.dev>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Phillip Tennen <phillip@axleos.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Howard Spoelstra <hsp.cat7@gmail.com>,
 Alessio Dionisi <hello@adns.io>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Eric Blake <eblake@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000ba56205d5dd9773
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 18 =D1=8F=D0=BD=D0=B2. 2022 =D0=B3. =D0=B2 18:01, Markus Armb=
ruster <armbru@redhat.com>:

> Vladislav Yaroshchuk <yaroshchuk2000@gmail.com> writes:
>
> > Create separate netdevs for each vmnet operating mode:
> > - vmnet-host
> > - vmnet-shared
> > - vmnet-bridged
> >
> > Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
>
> I acked v8 of the QAPI schema part.  You should add Acked-by and
> Reviewed-by you receive in later revisions, unless you make changes that
> invalidate them.  When in doubt, drop them.
>
>
Oh ok, I'll do that next time.


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
> > +#                 subsequent address up to and including end-address a=
re
> > +#                 placed in the DHCP pool.
> > +#
> > +# @end-address: The DHCP IPv4 range end address to use for the
> > +#               interface. Must be in the private IP range (RFC 1918).
> > +#               Must be specified along with @start-address and
> > +#               @subnet-mask.
> > +#
> > +# @subnet-mask: The IPv4 subnet mask to use on the interface. Must
> > +#               be specified along with @start-address and @subnet-mas=
k.
> > +#
> > +# @isolated: Enable isolation for this interface. Interface isolation
> > +#            ensures that vmnet interface is not able to communicate
> > +#            with any other vmnet interfaces. Only communication with
> > +#            host is allowed. Available since macOS Big Sur 11.0.
>
> What happens when the host is too old?
>
>
In this case netdev creation will fail with
corresponding message (error_setg() used).

> +#
> > +# @net-uuid: The identifier (UUID) to uniquely identify the isolated
> > +#            network vmnet interface should be added to. If
> > +#            set, no DHCP service is provided for this interface and
> > +#            network communication is allowed only with other interfac=
es
> > +#            added to this network identified by the UUID. Available
> > +#            since macOS Big Sur 11.0.
>
> Same question.
>
>
The same behavior here.


> > +#
> > +# Since: 7.0
> > +##
> > +{ 'struct': 'NetdevVmnetHostOptions',
> > +  'data': {
> > +    '*start-address': 'str',
> > +    '*end-address':   'str',
> > +    '*subnet-mask':   'str',
> > +    '*isolated':      'bool',
> > +    '*net-uuid':      'str' },
> > +  'if': 'CONFIG_VMNET' }
> > +
> > +##
> > +# @NetdevVmnetSharedOptions:
> > +#
> > +# vmnet (shared mode) network backend.
> > +#
> > +# Allows traffic originating from the vmnet interface to reach the
> > +# Internet through a network address translator (NAT).
> > +# The vmnet interface can communicate with the host and with
> > +# other shared mode interfaces on the same subnet. If no DHCP
> > +# settings, subnet mask and IPv6 prefix specified, the interface can
> > +# communicate with any of other interfaces in shared mode.
> > +#
> > +# @start-address: The starting IPv4 address to use for the interface.
> > +#                 Must be in the private IP range (RFC 1918). Must be
> > +#                 specified along with @end-address and @subnet-mask.
> > +#                 This address is used as the gateway address. The
> > +#                 subsequent address up to and including end-address a=
re
> > +#                 placed in the DHCP pool.
> > +#
> > +# @end-address: The DHCP IPv4 range end address to use for the
> > +#               interface. Must be in the private IP range (RFC 1918).
> > +#               Must be specified along with @start-address and
> @subnet-mask.
> > +#
> > +# @subnet-mask: The IPv4 subnet mask to use on the interface. Must
> > +#                be specified along with @start-address and
> @subnet-mask.
> > +#
> > +# @isolated: Enable isolation for this interface. Interface isolation
> > +#            ensures that vmnet interface is not able to communicate
> > +#            with any other vmnet interfaces. Only communication with
> > +#            host is allowed. Available since macOS Big Sur 11.0.
>
> Same question.
>
>
The same behavior here.



> > +#
> > +# @nat66-prefix: The IPv6 prefix to use into guest network. Must be a
> > +#                unique local address i.e. start with fd00::/8 and hav=
e
> > +#                length of 64.
> > +#
> > +# Since: 7.0
> > +##
> > +{ 'struct': 'NetdevVmnetSharedOptions',
> > +  'data': {
> > +    '*start-address': 'str',
> > +    '*end-address':   'str',
> > +    '*subnet-mask':   'str',
> > +    '*isolated':      'bool',
> > +    '*nat66-prefix':  'str' },
> > +  'if': 'CONFIG_VMNET' }
> > +
> > +##
> > +# @NetdevVmnetBridgedOptions:
> > +#
> > +# vmnet (bridged mode) network backend.
> > +#
> > +# Bridges the vmnet interface with a physical network interface.
> > +#
> > +# @ifname: The name of the physical interface to be bridged.
> > +#
> > +# @isolated: Enable isolation for this interface. Interface isolation
> > +#            ensures that vmnet interface is not able to communicate
> > +#            with any other vmnet interfaces. Only communication with
> > +#            host is allowed. Available since macOS Big Sur 11.0.
>
> Same question.
>
>
The same behavior here.


> > +#
> > +# Since: 7.0
> > +##
> > +{ 'struct': 'NetdevVmnetBridgedOptions',
> > +  'data': {
> > +    'ifname':     'str',
> > +    '*isolated':  'bool' },
> > +  'if': 'CONFIG_VMNET' }
> > +
> >  ##
> >  # @NetClientDriver:
> >  #
> > @@ -460,10 +574,16 @@
> >  # Since: 2.7
> >  #
> >  #        @vhost-vdpa since 5.1
> > +#        @vmnet-host since 7.0
> > +#        @vmnet-shared since 7.0
> > +#        @vmnet-bridged since 7.0
> >  ##
> >  { 'enum': 'NetClientDriver',
> >    'data': [ 'none', 'nic', 'user', 'tap', 'l2tpv3', 'socket', 'vde',
> > -            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa' =
]
> }
> > +            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa',
> > +            { 'name': 'vmnet-host', 'if': 'CONFIG_VMNET' },
> > +            { 'name': 'vmnet-shared', 'if': 'CONFIG_VMNET' },
> > +            { 'name': 'vmnet-bridged', 'if': 'CONFIG_VMNET' }] }
> >
> >  ##
> >  # @Netdev:
> > @@ -477,6 +597,9 @@
> >  # Since: 1.2
> >  #
> >  #        'l2tpv3' - since 2.1
> > +#        'vmnet-host' - since 7.0
> > +#        'vmnet-shared' - since 7.0
> > +#        'vmnet-bridged' - since 7.0
> >  ##
> >  { 'union': 'Netdev',
> >    'base': { 'id': 'str', 'type': 'NetClientDriver' },
> > @@ -492,7 +615,13 @@
> >      'hubport':  'NetdevHubPortOptions',
> >      'netmap':   'NetdevNetmapOptions',
> >      'vhost-user': 'NetdevVhostUserOptions',
> > -    'vhost-vdpa': 'NetdevVhostVDPAOptions' } }
> > +    'vhost-vdpa': 'NetdevVhostVDPAOptions',
> > +    'vmnet-host': { 'type': 'NetdevVmnetHostOptions',
> > +                    'if': 'CONFIG_VMNET' },
> > +    'vmnet-shared': { 'type': 'NetdevVmnetSharedOptions',
> > +                      'if': 'CONFIG_VMNET' },
> > +    'vmnet-bridged': { 'type': 'NetdevVmnetBridgedOptions',
> > +                       'if': 'CONFIG_VMNET' } } }
> >
> >  ##
> >  # @RxState:
>
>

--=20
Best Regards,

Vladislav Yaroshchuk

--0000000000000ba56205d5dd9773
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">=D0=B2=D1=82, 18 =D1=8F=D0=BD=D0=B2. =
2022 =D0=B3. =D0=B2 18:01, Markus Armbruster &lt;<a href=3D"mailto:armbru@r=
edhat.com">armbru@redhat.com</a>&gt;:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Vladislav Yaroshchuk &lt;<a href=3D"mailto:yaroshchuk=
2000@gmail.com" target=3D"_blank">yaroshchuk2000@gmail.com</a>&gt; writes:<=
br>
<br>
&gt; Create separate netdevs for each vmnet operating mode:<br>
&gt; - vmnet-host<br>
&gt; - vmnet-shared<br>
&gt; - vmnet-bridged<br>
&gt;<br>
&gt; Signed-off-by: Vladislav Yaroshchuk &lt;<a href=3D"mailto:yaroshchuk20=
00@gmail.com" target=3D"_blank">yaroshchuk2000@gmail.com</a>&gt;<br>
<br>
I acked v8 of the QAPI schema part.=C2=A0 You should add Acked-by and<br>
Reviewed-by you receive in later revisions, unless you make changes that<br=
>
invalidate them.=C2=A0 When in doubt, drop them.<br>
<br></blockquote><div><br></div><div>Oh ok, I&#39;ll do that next time.<br>=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
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
What happens when the host is too old?<br>
<br></blockquote><div><br></div>In this case netdev creation will fail with=
</div><div class=3D"gmail_quote">corresponding message (error_setg() used).=
</div><div class=3D"gmail_quote"><div><br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
&gt; +#<br>
&gt; +# @net-uuid: The identifier (UUID) to uniquely identify the isolated<=
br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 network vmnet interface sh=
ould be added to. If<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set, no DHCP service is pr=
ovided for this interface and<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 network communication is a=
llowed only with other interfaces<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 added to this network iden=
tified by the UUID. Available<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 since macOS Big Sur 11.0.<=
br>
<br>
Same question.<br>
<br></blockquote><div><br></div><div><div>The same behavior here.</div></di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +#<br>
&gt; +# Since: 7.0<br>
&gt; +##<br>
&gt; +{ &#39;struct&#39;: &#39;NetdevVmnetHostOptions&#39;,<br>
&gt; +=C2=A0 &#39;data&#39;: {<br>
&gt; +=C2=A0 =C2=A0 &#39;*start-address&#39;: &#39;str&#39;,<br>
&gt; +=C2=A0 =C2=A0 &#39;*end-address&#39;:=C2=A0 =C2=A0&#39;str&#39;,<br>
&gt; +=C2=A0 =C2=A0 &#39;*subnet-mask&#39;:=C2=A0 =C2=A0&#39;str&#39;,<br>
&gt; +=C2=A0 =C2=A0 &#39;*isolated&#39;:=C2=A0 =C2=A0 =C2=A0 &#39;bool&#39;=
,<br>
&gt; +=C2=A0 =C2=A0 &#39;*net-uuid&#39;:=C2=A0 =C2=A0 =C2=A0 &#39;str&#39; =
},<br>
&gt; +=C2=A0 &#39;if&#39;: &#39;CONFIG_VMNET&#39; }<br>
&gt; +<br>
&gt; +##<br>
&gt; +# @NetdevVmnetSharedOptions:<br>
&gt; +#<br>
&gt; +# vmnet (shared mode) network backend.<br>
&gt; +#<br>
&gt; +# Allows traffic originating from the vmnet interface to reach the<br=
>
&gt; +# Internet through a network address translator (NAT).<br>
&gt; +# The vmnet interface can communicate with the host and with<br>
&gt; +# other shared mode interfaces on the same subnet. If no DHCP<br>
&gt; +# settings, subnet mask and IPv6 prefix specified, the interface can<=
br>
&gt; +# communicate with any of other interfaces in shared mode.<br>
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
fied along with @start-address and @subnet-mask.<br>
&gt; +#<br>
&gt; +# @subnet-mask: The IPv4 subnet mask to use on the interface. Must<br=
>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 be specified=
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
Same question.<br>
<br></blockquote><div><br></div><div>The same behavior here.</div><br class=
=3D"gmail-Apple-interchange-newline"><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
&gt; +#<br>
&gt; +# @nat66-prefix: The IPv6 prefix to use into guest network. Must be a=
<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unique local=
 address i.e. start with fd00::/8 and have<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 length of 64=
.<br>
&gt; +#<br>
&gt; +# Since: 7.0<br>
&gt; +##<br>
&gt; +{ &#39;struct&#39;: &#39;NetdevVmnetSharedOptions&#39;,<br>
&gt; +=C2=A0 &#39;data&#39;: {<br>
&gt; +=C2=A0 =C2=A0 &#39;*start-address&#39;: &#39;str&#39;,<br>
&gt; +=C2=A0 =C2=A0 &#39;*end-address&#39;:=C2=A0 =C2=A0&#39;str&#39;,<br>
&gt; +=C2=A0 =C2=A0 &#39;*subnet-mask&#39;:=C2=A0 =C2=A0&#39;str&#39;,<br>
&gt; +=C2=A0 =C2=A0 &#39;*isolated&#39;:=C2=A0 =C2=A0 =C2=A0 &#39;bool&#39;=
,<br>
&gt; +=C2=A0 =C2=A0 &#39;*nat66-prefix&#39;:=C2=A0 &#39;str&#39; },<br>
&gt; +=C2=A0 &#39;if&#39;: &#39;CONFIG_VMNET&#39; }<br>
&gt; +<br>
&gt; +##<br>
&gt; +# @NetdevVmnetBridgedOptions:<br>
&gt; +#<br>
&gt; +# vmnet (bridged mode) network backend.<br>
&gt; +#<br>
&gt; +# Bridges the vmnet interface with a physical network interface.<br>
&gt; +#<br>
&gt; +# @ifname: The name of the physical interface to be bridged.<br>
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
Same question.<br>
<br></blockquote><div><br></div><div>The same behavior here.</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +#<br>
&gt; +# Since: 7.0<br>
&gt; +##<br>
&gt; +{ &#39;struct&#39;: &#39;NetdevVmnetBridgedOptions&#39;,<br>
&gt; +=C2=A0 &#39;data&#39;: {<br>
&gt; +=C2=A0 =C2=A0 &#39;ifname&#39;:=C2=A0 =C2=A0 =C2=A0&#39;str&#39;,<br>
&gt; +=C2=A0 =C2=A0 &#39;*isolated&#39;:=C2=A0 &#39;bool&#39; },<br>
&gt; +=C2=A0 &#39;if&#39;: &#39;CONFIG_VMNET&#39; }<br>
&gt; +<br>
&gt;=C2=A0 ##<br>
&gt;=C2=A0 # @NetClientDriver:<br>
&gt;=C2=A0 #<br>
&gt; @@ -460,10 +574,16 @@<br>
&gt;=C2=A0 # Since: 2.7<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 @vhost-vdpa since 5.1<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 @vmnet-host since 7.0<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 @vmnet-shared since 7.0<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 @vmnet-bridged since 7.0<br>
&gt;=C2=A0 ##<br>
&gt;=C2=A0 { &#39;enum&#39;: &#39;NetClientDriver&#39;,<br>
&gt;=C2=A0 =C2=A0 &#39;data&#39;: [ &#39;none&#39;, &#39;nic&#39;, &#39;use=
r&#39;, &#39;tap&#39;, &#39;l2tpv3&#39;, &#39;socket&#39;, &#39;vde&#39;,<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;bridge&#39;, &#39;hubp=
ort&#39;, &#39;netmap&#39;, &#39;vhost-user&#39;, &#39;vhost-vdpa&#39; ] }<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;bridge&#39;, &#39;hubp=
ort&#39;, &#39;netmap&#39;, &#39;vhost-user&#39;, &#39;vhost-vdpa&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &#39;name&#39;: &#39;vmne=
t-host&#39;, &#39;if&#39;: &#39;CONFIG_VMNET&#39; },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &#39;name&#39;: &#39;vmne=
t-shared&#39;, &#39;if&#39;: &#39;CONFIG_VMNET&#39; },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &#39;name&#39;: &#39;vmne=
t-bridged&#39;, &#39;if&#39;: &#39;CONFIG_VMNET&#39; }] }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 ##<br>
&gt;=C2=A0 # @Netdev:<br>
&gt; @@ -477,6 +597,9 @@<br>
&gt;=C2=A0 # Since: 1.2<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;l2tpv3&#39; - since 2.1<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;vmnet-host&#39; - since 7.0<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;vmnet-shared&#39; - since 7.0<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;vmnet-bridged&#39; - since 7.0<br>
&gt;=C2=A0 ##<br>
&gt;=C2=A0 { &#39;union&#39;: &#39;Netdev&#39;,<br>
&gt;=C2=A0 =C2=A0 &#39;base&#39;: { &#39;id&#39;: &#39;str&#39;, &#39;type&=
#39;: &#39;NetClientDriver&#39; },<br>
&gt; @@ -492,7 +615,13 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &#39;hubport&#39;:=C2=A0 &#39;NetdevHubPortOptions=
&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &#39;netmap&#39;:=C2=A0 =C2=A0&#39;NetdevNetmapOpt=
ions&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &#39;vhost-user&#39;: &#39;NetdevVhostUserOptions&=
#39;,<br>
&gt; -=C2=A0 =C2=A0 &#39;vhost-vdpa&#39;: &#39;NetdevVhostVDPAOptions&#39; =
} }<br>
&gt; +=C2=A0 =C2=A0 &#39;vhost-vdpa&#39;: &#39;NetdevVhostVDPAOptions&#39;,=
<br>
&gt; +=C2=A0 =C2=A0 &#39;vmnet-host&#39;: { &#39;type&#39;: &#39;NetdevVmne=
tHostOptions&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &#39;if&#39;: &#39;CONFIG_VMNET&#39; },<br>
&gt; +=C2=A0 =C2=A0 &#39;vmnet-shared&#39;: { &#39;type&#39;: &#39;NetdevVm=
netSharedOptions&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 &#39;if&#39;: &#39;CONFIG_VMNET&#39; },<br>
&gt; +=C2=A0 =C2=A0 &#39;vmnet-bridged&#39;: { &#39;type&#39;: &#39;NetdevV=
mnetBridgedOptions&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&#39;if&#39;: &#39;CONFIG_VMNET&#39; } } }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 ##<br>
&gt;=C2=A0 # @RxState:<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"l=
tr">Best Regards,<div><br><div>Vladislav Yaroshchuk</div></div></div></div>=
</div>

--0000000000000ba56205d5dd9773--

