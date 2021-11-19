Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BAB45788C
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 23:16:05 +0100 (CET)
Received: from localhost ([::1]:49648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moCAu-0007hQ-L8
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 17:16:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1moC9O-00068Z-K5
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 17:14:30 -0500
Received: from [2607:f8b0:4864:20::a29] (port=45592
 helo=mail-vk1-xa29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1moC9K-0003W2-VN
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 17:14:30 -0500
Received: by mail-vk1-xa29.google.com with SMTP id m19so6716203vko.12
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 14:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N5JVpXMSmTEL4MtmallCvsL6w8yfNn37TTa7NovWUOQ=;
 b=Gl41155P+CGh11HG24qfola0PVHkL9A5TloGSrHXg2D8Oho/8Sj41Ihts0xfMdYrj0
 fW1keQh0+66ghUXAAZKo7dGqWS8lucD4/6qIGLxW/LkQ0XE7y9pbRIMGAWH5LKNJDCtf
 VVhnX4yWNjBPEFVpf7MYppz+Qm5V06R3D2weskJmSIlnSAMSsknZ3Xy+UhSaN6IFWPqJ
 GEBl6JAr72kW8I63XGzsCqX0b85eSMVcfob9B6xSyXVG5NWIyBXslprtJM3/ByhE2NLv
 FbZt9R5suKqsszypHi5QkE6KyhV0PXguVFs4DlmbNhEwLsFBbhPsdRBFb5+frbYadvfe
 daNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N5JVpXMSmTEL4MtmallCvsL6w8yfNn37TTa7NovWUOQ=;
 b=gaGWg0+mxfCdH8FlTSwQP/EkYfnqtavLvZ/olcsm+alf43HFLcgzfciQJgpasU4egc
 vJHNDdZ4Yc8FjSqs7Hcqk8Pw0AzmB8qd9eDHOd4ozM1u3wrn+M+Z4qhXnhoCyRMNyR7v
 RwjaD9l7GXefI7qBGsHMNi6RLFe+oXyQw/a5HwkTw+ylAtDXBY2aDw5Tr3vU0vxBIcqC
 gGmLnHBHSDvFOmtdXlmxzJlzuevUyLq+MxN7K3cWmMfZDuHcCyz6dw86TIyyU0cl1KQO
 IaJZlvzEXKvJ9Hh/UY/Tt05Y0wvz3MPnLXn4eVYID32ZjM8utxW+eJQ6tHFI0y6nhAgr
 pWVQ==
X-Gm-Message-State: AOAM5310nA0B85rwpSc5Euw/3XvgEqGY5jFeJWy87+GyNXiYYs0K8ToE
 qq2DqavukbXNNS3jhuxq1mcFnq5Hk7QoSzeSrTw=
X-Google-Smtp-Source: ABdhPJzN9N2gSK8rr40b9fU9MTYl/ERKxFN+I57+21EVqWl+K/Mo57F5IkOx58A+lRiU8Gl7bFkkMWpsnxAExIQ3N4k=
X-Received: by 2002:a05:6122:da1:: with SMTP id
 bc33mr93825279vkb.19.1637360065397; 
 Fri, 19 Nov 2021 14:14:25 -0800 (PST)
MIME-Version: 1.0
References: <20211108151704.65611-1-yaroshchuk2000@gmail.com>
 <20211108151704.65611-3-yaroshchuk2000@gmail.com>
 <87czn9honw.fsf@dusky.pond.sub.org>
 <CADO9X9QJRxNL_Mc4rfvL5T7Bhfxekp8amN0Y56iLO4JyDsow6g@mail.gmail.com>
 <87bl2g6x9r.fsf@dusky.pond.sub.org>
In-Reply-To: <87bl2g6x9r.fsf@dusky.pond.sub.org>
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Date: Sat, 20 Nov 2021 01:14:14 +0300
Message-ID: <CADO9X9TkNbNgkd3t_0b4zy6+4dLjKzEPoZb-GVmc68YPNBibNw@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] net/vmnet: add vmnet backends to qapi/net
To: Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000011451805d12b993e"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a29;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-vk1-xa29.google.com
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
Cc: Jason Wang <jasowang@redhat.com>, phillip.ennen@gmail.com,
 qemu-devel <qemu-devel@nongnu.org>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Phillip Tennen <phillip@axleos.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Howard Spoelstra <hsp.cat7@gmail.com>, Alessio Dionisi <hello@adns.io>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000011451805d12b993e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 19 =D0=BD=D0=BE=D1=8F=D0=B1. 2021 =D0=B3. =D0=B2 17:22, Marku=
s Armbruster <armbru@redhat.com>:

> I apologize for taking so long to respond.  I spotted v5, but haven't
> reviewed it.  Please read my response, then assess whether you need v6.
> If not, let me know, so I can have a look at v5.
>
>
Not a problem, v5 has not so much difference to v4.
I think we can discuss qapi here, after I'll submit v6
and then you can review it skipping v5.


> Vladislav Yaroshchuk <yaroshchuk2000@gmail.com> writes:
>
> > --000000000000325dde05d084e6e4
> > Content-Type: text/plain; charset=3D"UTF-8"
> > Content-Transfer-Encoding: quoted-printable
> >
> > =3DD0=3DB2=3DD1=3D82, 9 =3DD0=3DBD=3DD0=3DBE=3DD1=3D8F=3DD0=3DB1. 2021 =
=3DD0=3DB3. =3DD0=3DB2 08:41,
> Markus=3D
> >  Armbruster <armbru@redhat.com>:
> >
> >> Vladislav Yaroshchuk <yaroshchuk2000@gmail.com> writes:
> >>
> >> > Create separate netdevs for each vmnet operating mode:
> >> > - vmnet-host
> >> > - vmnet-shared
> >> > - vmnet-bridged
> >> >
> >> > Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> >>
> >> [...]
> >>
> >> > diff --git a/qapi/net.json b/qapi/net.json
> >> > index 7fab2e7cd8..087cdf0546 100644
> >> > --- a/qapi/net.json
> >> > +++ b/qapi/net.json
> >> > @@ -452,6 +452,112 @@
> >> >      '*vhostdev':     'str',
> >> >      '*queues':       'int' } }
> >> >
> >> > +##
> >> > +# @NetdevVmnetHostOptions:
> >> > +#
> >> > +# vmnet (host mode) network backend.
> >> > +#
> >> > +# Allows the vmnet interface to communicate with other vmnet
> >> > +# interfaces that are in host mode and also with the native host.
> >> > +#
> >> > +# @dhcpstart: The starting IPv4 address to use for the interface.
> >> > +#             Must be in the private IP range (RFC 1918). Must be
> >> > +#             specified along with @dhcpend and @subnetmask.
> >> > +#             This address is used as the gateway address. The
> >> > +#             subsequent address up to and including dhcpend are
> >> > +#             placed in the DHCP pool.
> >>
> >> In QMP, we separate words by dashes, like @dhcp-start.  We may prefer
> >> not to here, for consistency with NetdevUserOptions, ...
> >>
> >> +#
> >> > +# @dhcpend: The DHCP IPv4 range end address to use for the
> >> > +#           interface. Must be in the private IP range (RFC 1918).
> >> > +#           Must be specified along with @dhcpstart and @subnetmask=
.
> >>
> >> ... and here, to match @dhcpstart.
> >>
> >> Yes, I did not use dashed exactly because of this: to be consistent
> with NetdevUserOptions.
> >
> >> +#
> >> > +# @subnetmask: The IPv4 subnet mask to use on the interface. Must
> >> > +#              be specified along with @dhcpstart and @subnetmask.
> >>
> >> @subnet-mask, please.
> >>
> >
> > So I think we can leave `dhcpstart`, `dhcpend`, but add a dash to
> > `subnet-mask`.
>
> Yes, please.
>
>> No support for IPv6?
> >>
> >>
> > It's supported. vmnet-shared tested with link-local addresses.
> > Also some configurable options exist, but only for 'shared' mode.
> > I can try to add them in the next patch series version.
>
> Or a later patch.
>
>
'vmnet-shared' has NAT66 in addition to NAT44.
It has configurable prefix for internal network,
so I've added a new corresponding property in v5.

>> +#
> >> > +# @isolated: Enable isolation for this interface. Interface isolati=
on
> >> > +#            ensures that network communication between multiple
> >> > +#            vmnet interfaces instances is not possible.
> >> > +#
> >> > +# @net-uuid: The identifier (UUID) to uniquely identify the network=
.
> >> > +#            If provided, no DHCP service is provided on this netwo=
rk
> >> > +#            and the interface is added to an isolated network with
> >> > +#            the specified identifier.
> >>
> >> Out of curiosity: identify to whom?
> >>
> >> If I set @net-uuid, I get an isolated network with a UUID, and if I se=
t
> >> "isolated": true, I get one without a UUID.  When would I want the
> >> former, and when the latter?
> >>
> >>
> > `if I set "isolated": true, I get one without a UUID.` is an
> > incorrect statement.
> >
> > vmnet.framework isolation features are designed a bit weirdly (just my
> > opinion).
> > Most things happen on the macOS side, and we just can provide some
> > configuration
> > options to vmnet.framework as the user provides options to QEMU.
> >
> > Firstly, if you set @net-uuid, you're putting the interface into an
> > isolated network.
> > You can set the same @net-uuid on multiple vmnet-host interfaces, also
> > outside
> > QEMU, it can be any vmnet interface started in 'host' mode, ex. xhyve's
> > netdev
> > if they support this. All of them can communicate with each other, but
> only
> > inside
> > this net identified by the @net-uuid. They can't communicate with
> > interfaces from
> > network with id !=3D3D ${our set @net-uuid}.
> >
> > "@isolated" is a more prohibitive mode. "Isolated" interface is not abl=
e
> to
> > communicate
> > with anyone except the host.
> >
> > What happens when I set "isolated": false together with @net-uuid?
> >
> >
> > Let's compare (vmnet-host mode):
> >
> > 0. When nothing is provided, DHCP is enabled and uses default
> > (macOS-configured) settings.
> >     Your interface can communicate with any other vmnet-host interface.
> >
> > 1. When provided `@isolated=3D3Don` only,  DHCP is still enabled, but t=
he
> > interface can
> >    communicate only with the host. All the attempts to create another
> > interface with
> >    the same subnet will fail with `VMNET_SHARING_SERVICE_BUSY`. If we
> don't
> >    specify DHCP settings (start, end, mask), macOS adjusts them
> > automatically to
> >    prevent collisions and the `VMNET_SHARING_SERVICE_BUSY` error.
> >
> > 2. When provided @net-uuid=3D3Duuid[,@isolated=3D3Doff], the interface =
can
> > communicate to any
> >      other interface inside the 'uuid' network. Also with other VMs und=
er
> > other hypervisors.
> >      DHCP is disabled.
> >
> > 3. When provided @net-uuid=3D3Duuid,@isolated=3D3Don, the interface can
> communi=3D
> > cate
> > only with
> >     the host.  DHCP is disabled. All the attempts to create another
> > interface with
> >     the @net-uuid will fail with `VMNET_SHARING_SERVICE_BUSY`.
>
> The doc comments don't make this clear, I'm afraid.  Care to improve
> them some?
>
>
Ok, I'll add all that stuff to documentation.


> >> When "no DCHCP service is provided", then @dhcpstart and @dhcpend beco=
me
> >> misnomers.  Compare NetdevUserOptions: it uses @net to specify the
> >> address range, and dhcpstart to specify the DHCP range (@dhcpend is
> >> implied).  Should we aim for consistency between the two?
> >>
> >
> > I think it is not our choice. All of these options are just mappings to
> > vmnet interface
> > params:
> > https://developer.apple.com/documentation/vmnet/vmnet_constants
>
> I think it *is* our choice.  We can choose to be internally consistent,
> i.e. with NetdevUserOptions, or consistent with the external interface
> we expose internally, i.e. with the vmnet interface.  Tradeoff.
>
>
I think the second one is better, let's stay consistent with vmnet.

> @subnet-mask -> vmnet_subnet_mask_key
> > @dhcpstart -> vmnet_start_address_key
> > @dhcpend ->  vmnet_end_address_key
>
> Note that the right hand side does not say "DHCP".  I think the left
> hand side should not, either.  Why not @start-address and @end-address?
>
>
I agree, these names sound much more suitable.


> > More detailed description is provided in the `vmnet.h` header of macOS
> SDK.
> > There is a restriction that says: when the `vmnet_subnet_mask_key`
> > (@subnet-mask)
> > is set you "must also specify vmnet_start_address_key and
> > vmnet_end_address_key".
> > So, when "no DHCP service is provided" the`@subnet-mask` property also
> > becomes
> > a misnomer.
>
> I don't think so.  vmnet_end_address_key, vmnet_end_address_key,
> vmnet_subnet_mask_key all make sense regardless of DHCP service.
>
> The gateway address is hardwired to the first address in the range.  If
> DHCP is provided, it hands out addresses from the remainder of the
> range.
>
>
For some reason I thought that these params are
DHCP-specific, while they are not. My fault, sorry.
Will fix this too.


> > I added a corresponding restriction: you cannot provide @net-uuid withi=
n
> > any of DHCP
> > options, this causes hard failure with `error_setg()` (see vmnet-host.c=
).
> >
> >
> >> +#
> >> > +# Since: 6.2
> >>
> >> Missed 6.2, please adjust.  More of the same below.
> >>
> >>
> > The next one is 6.3, isn't it?
>
> 7.0
>
>> +##
> >> > +{ 'struct': 'NetdevVmnetHostOptions',
> >> > +  'data': {
> >> > +    '*dhcpstart':   'str',
> >> > +    '*dhcpend':     'str',
> >> > +    '*subnetmask':  'str',
> >> > +    '*isolated':    'bool',
> >> > +    '*net-uuid':    'str'
> >> > +  },
> >> > +  'if': 'CONFIG_VMNET' }
> >> > +
> >> > +##
> >> > +# @NetdevVmnetSharedOptions:
> >> > +#
> >> > +# vmnet (shared mode) network backend.
> >> > +#
> >> > +# Allows traffic originating from the vmnet interface to reach the
> >> > +# Internet through a network address translator (NAT). The vmnet
> >> > +# interface can also communicate with the native host. By default,
> >> > +# the vmnet interface is able to communicate with other shared mode
> >> > +# interfaces. If a subnet range is specified, the vmnet interface c=
an
> >>
> >> Do you mean "subnet mask"?
> >>
> >>
> > This phrase was just copied from Apple's `vmnet.h` from SDK:
> > ```
> >  * [...] VMNET_SHARED_MODE
> >  * Allows traffic originating from the vmnet interface to reach the
> >  * Internet through a network address translator (NAT). The vmnet
> interface
> >  * can also communicate with the native host. By default, the vmnet
> > interface
> >  * is able to communicate with other shared mode interfaces. If a subne=
t
> > range
> >  * is specified, the vmnet interface can communicate with other shared
> mode
> >  * interfaces on the same subnet.
> > ```
> > But `subnet mask` sounds more suitable, so it's better to say:
> > "... If a subnet mask and DHCP range is specified, the vmnet interface
> can
> > ..."
> >
> >> +# communicate with other shared mode interfaces on the same subnet.
> >> > +#
> >> > +# @dhcpstart: The starting IPv4 address to use for the interface.
> >> > +#             Must be in the private IP range (RFC 1918). Must be
> >> > +#             specified along with @dhcpend and @subnetmask.
> >> > +#             This address is used as the gateway address. The
> >> > +#             subsequent address up to and including dhcpend are
> >> > +#             placed in the DHCP pool.
> >> > +#
> >> > +# @dhcpend: The DHCP IPv4 range end address to use for the
> >> > +#           interface. Must be in the private IP range (RFC 1918).
> >> > +#           Must be specified along with @dhcpstart and @subnetmask=
.
> >> > +#
> >> > +# @subnetmask: The IPv4 subnet mask to use on the interface. Must
> >> > +#              be specified along with @dhcpstart and @subnetmask.
> >> > +#
> >> > +# @isolated: Enable isolation for this interface. Interface isolati=
on
> >> > +#            ensures that network communication between multiple
> >> > +#            vmnet interfaces instances is not possible.
> >> > +#
> >> > +# Since: 6.2
> >> > +##
> >> > +{ 'struct': 'NetdevVmnetSharedOptions',
> >> > +  'data': {
> >> > +    '*dhcpstart':    'str',
> >> > +    '*dhcpend':      'str',
> >> > +    '*subnetmask':   'str',
> >> > +    '*isolated':     'bool'
> >> > +  },
> >> > +  'if': 'CONFIG_VMNET' }
> >>
> >> [...]
> >
> > As a conclusion, my TODOs for now:
> >   * fix `subnet range` in documentation
> >   * add dash to @subnet-mask
> >   * change version: 6.2 -> 6.3
> >   * provide IPv6 configuration properties for vmnet-shared (optional).
>
>

Already done in v5:
* @subnetmask -> @subnet-mask
* nat66 prefix property added
* updated version 6.2 -> 7.0

Now in my TODO:
 * improve documentation, especially for
    isolation properties.
* change @dhcpstart, @dhcpend to
   @start-address, @end-address.

Please confirm, and I'll submit v6 with all these
fixes.

Thank you for the review!

--=20
Best Regards,

Vladislav Yaroshchuk

--00000000000011451805d12b993e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">=D0=BF=D1=82, 19 =D0=BD=D0=BE=D1=8F=D0=B1. 2021 =
=D0=B3. =D0=B2 17:22, Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat=
.com">armbru@redhat.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">I apologize for taking so long to respond.=C2=A0 I spotted=
 v5, but haven&#39;t<br>
reviewed it.=C2=A0 Please read my response, then assess whether you need v6=
.<br>
If not, let me know, so I can have a look at v5.<br>
<br></blockquote><div><br></div><div>Not a problem, v5 has not so much diff=
erence to v4.<br>I think we can discuss qapi here, after I&#39;ll submit v6=
=C2=A0</div><div>and then you can review it skipping v5.<br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Vladislav Yaroshchuk &lt;<a href=3D"mailto:yaroshchuk2000@gmail.com" target=
=3D"_blank">yaroshchuk2000@gmail.com</a>&gt; writes:<br>
<br>
&gt; --000000000000325dde05d084e6e4<br>
&gt; Content-Type: text/plain; charset=3D&quot;UTF-8&quot;<br>
&gt; Content-Transfer-Encoding: quoted-printable<br>
&gt;<br>
&gt; =3DD0=3DB2=3DD1=3D82, 9 =3DD0=3DBD=3DD0=3DBE=3DD1=3D8F=3DD0=3DB1. 2021=
 =3DD0=3DB3. =3DD0=3DB2 08:41, Markus=3D<br>
&gt;=C2=A0 Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" target=3D"_b=
lank">armbru@redhat.com</a>&gt;:<br>
&gt;<br>
&gt;&gt; Vladislav Yaroshchuk &lt;<a href=3D"mailto:yaroshchuk2000@gmail.co=
m" target=3D"_blank">yaroshchuk2000@gmail.com</a>&gt; writes:<br>
&gt;&gt;<br>
&gt;&gt; &gt; Create separate netdevs for each vmnet operating mode:<br>
&gt;&gt; &gt; - vmnet-host<br>
&gt;&gt; &gt; - vmnet-shared<br>
&gt;&gt; &gt; - vmnet-bridged<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Vladislav Yaroshchuk &lt;<a href=3D"mailto:yar=
oshchuk2000@gmail.com" target=3D"_blank">yaroshchuk2000@gmail.com</a>&gt;<b=
r>
&gt;&gt;<br>
&gt;&gt; [...]<br>
&gt;&gt;<br>
&gt;&gt; &gt; diff --git a/qapi/net.json b/qapi/net.json<br>
&gt;&gt; &gt; index 7fab2e7cd8..087cdf0546 100644<br>
&gt;&gt; &gt; --- a/qapi/net.json<br>
&gt;&gt; &gt; +++ b/qapi/net.json<br>
&gt;&gt; &gt; @@ -452,6 +452,112 @@<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &#39;*vhostdev&#39;:=C2=A0 =C2=A0 =C2=A0&=
#39;str&#39;,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &#39;*queues&#39;:=C2=A0 =C2=A0 =C2=A0 =
=C2=A0&#39;int&#39; } }<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; +##<br>
&gt;&gt; &gt; +# @NetdevVmnetHostOptions:<br>
&gt;&gt; &gt; +#<br>
&gt;&gt; &gt; +# vmnet (host mode) network backend.<br>
&gt;&gt; &gt; +#<br>
&gt;&gt; &gt; +# Allows the vmnet interface to communicate with other vmnet=
<br>
&gt;&gt; &gt; +# interfaces that are in host mode and also with the native =
host.<br>
&gt;&gt; &gt; +#<br>
&gt;&gt; &gt; +# @dhcpstart: The starting IPv4 address to use for the inter=
face.<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Must be in =
the private IP range (RFC 1918). Must be<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0specified a=
long with @dhcpend and @subnetmask.<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This addres=
s is used as the gateway address. The<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subsequent =
address up to and including dhcpend are<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0placed in t=
he DHCP pool.<br>
&gt;&gt;<br>
&gt;&gt; In QMP, we separate words by dashes, like @dhcp-start.=C2=A0 We ma=
y prefer<br>
&gt;&gt; not to here, for consistency with NetdevUserOptions, ...<br>
&gt;&gt;<br>
&gt;&gt; +#<br>
&gt;&gt; &gt; +# @dhcpend: The DHCP IPv4 range end address to use for the<b=
r>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interface. Must be=
 in the private IP range (RFC 1918).<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Must be specified =
along with @dhcpstart and @subnetmask.<br>
&gt;&gt;<br>
&gt;&gt; ... and here, to match @dhcpstart.<br>
&gt;&gt;<br>
&gt;&gt; Yes, I did not use dashed exactly because of this: to be consisten=
t with NetdevUserOptions.<br>
&gt;<br>
&gt;&gt; +#<br>
&gt;&gt; &gt; +# @subnetmask: The IPv4 subnet mask to use on the interface.=
 Must<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 be specifi=
ed along with @dhcpstart and @subnetmask.<br>
&gt;&gt;<br>
&gt;&gt; @subnet-mask, please.<br>
&gt;&gt;<br>
&gt;<br>
&gt; So I think we can leave `dhcpstart`, `dhcpend`, but add a dash to<br>
&gt; `subnet-mask`.<br>
<br>
Yes, please.<br></blockquote><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
&gt;&gt; No support for IPv6?<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; It&#39;s supported. vmnet-shared tested with link-local addresses.<br>
&gt; Also some configurable options exist, but only for &#39;shared&#39; mo=
de.<br>
&gt; I can try to add them in the next patch series version.<br>
<br>
Or a later patch.<br>
<br></blockquote><div><br></div><div>&#39;vmnet-shared&#39; has NAT66 in ad=
dition to NAT44.</div><div>It has configurable prefix for internal network,=
=C2=A0</div><div>so I&#39;ve added a new corresponding property in v5.</div=
><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;&gt; +#<br>
&gt;&gt; &gt; +# @isolated: Enable isolation for this interface. Interface =
isolation<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ensures that netw=
ork communication between multiple<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet interfaces =
instances is not possible.<br>
&gt;&gt; &gt; +#<br>
&gt;&gt; &gt; +# @net-uuid: The identifier (UUID) to uniquely identify the =
network.<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 If provided, no D=
HCP service is provided on this network<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 and the interface=
 is added to an isolated network with<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 the specified ide=
ntifier.<br>
&gt;&gt;<br>
&gt;&gt; Out of curiosity: identify to whom?<br>
&gt;&gt;<br>
&gt;&gt; If I set @net-uuid, I get an isolated network with a UUID, and if =
I set<br>
&gt;&gt; &quot;isolated&quot;: true, I get one without a UUID.=C2=A0 When w=
ould I want the<br>
&gt;&gt; former, and when the latter?<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; `if I set &quot;isolated&quot;: true, I get one without a UUID.` is an=
<br>
&gt; incorrect statement.<br>
&gt;<br>
&gt; vmnet.framework isolation features are designed a bit weirdly (just my=
<br>
&gt; opinion).<br>
&gt; Most things happen on the macOS side, and we just can provide some<br>
&gt; configuration<br>
&gt; options to vmnet.framework as the user provides options to QEMU.<br>
&gt;<br>
&gt; Firstly, if you set @net-uuid, you&#39;re putting the interface into a=
n<br>
&gt; isolated network.<br>
&gt; You can set the same @net-uuid on multiple vmnet-host interfaces, also=
<br>
&gt; outside<br>
&gt; QEMU, it can be any vmnet interface started in &#39;host&#39; mode, ex=
. xhyve&#39;s<br>
&gt; netdev<br>
&gt; if they support this. All of them can communicate with each other, but=
 only<br>
&gt; inside<br>
&gt; this net identified by the @net-uuid. They can&#39;t communicate with<=
br>
&gt; interfaces from<br>
&gt; network with id !=3D3D ${our set @net-uuid}.<br>
&gt;<br>
&gt; &quot;@isolated&quot; is a more prohibitive mode. &quot;Isolated&quot;=
 interface is not able to<br>
&gt; communicate<br>
&gt; with anyone except the host.<br>
&gt;<br>
&gt; What happens when I set &quot;isolated&quot;: false together with @net=
-uuid?<br>
&gt;<br>
&gt;<br>
&gt; Let&#39;s compare (vmnet-host mode):<br>
&gt;<br>
&gt; 0. When nothing is provided, DHCP is enabled and uses default<br>
&gt; (macOS-configured) settings.<br>
&gt;=C2=A0 =C2=A0 =C2=A0Your interface can communicate with any other vmnet=
-host interface.<br>
&gt;<br>
&gt; 1. When provided `@isolated=3D3Don` only,=C2=A0 DHCP is still enabled,=
 but the<br>
&gt; interface can<br>
&gt;=C2=A0 =C2=A0 communicate only with the host. All the attempts to creat=
e another<br>
&gt; interface with<br>
&gt;=C2=A0 =C2=A0 the same subnet will fail with `VMNET_SHARING_SERVICE_BUS=
Y`. If we don&#39;t<br>
&gt;=C2=A0 =C2=A0 specify DHCP settings (start, end, mask), macOS adjusts t=
hem<br>
&gt; automatically to<br>
&gt;=C2=A0 =C2=A0 prevent collisions and the `VMNET_SHARING_SERVICE_BUSY` e=
rror.<br>
&gt;<br>
&gt; 2. When provided @net-uuid=3D3Duuid[,@isolated=3D3Doff], the interface=
 can<br>
&gt; communicate to any<br>
&gt;=C2=A0 =C2=A0 =C2=A0 other interface inside the &#39;uuid&#39; network.=
 Also with other VMs under<br>
&gt; other hypervisors.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DHCP is disabled.<br>
&gt;<br>
&gt; 3. When provided @net-uuid=3D3Duuid,@isolated=3D3Don, the interface ca=
n communi=3D<br>
&gt; cate<br>
&gt; only with<br>
&gt;=C2=A0 =C2=A0 =C2=A0the host.=C2=A0 DHCP is disabled. All the attempts =
to create another<br>
&gt; interface with<br>
&gt;=C2=A0 =C2=A0 =C2=A0the @net-uuid will fail with `VMNET_SHARING_SERVICE=
_BUSY`.<br>
<br>
The doc comments don&#39;t make this clear, I&#39;m afraid.=C2=A0 Care to i=
mprove<br>
them some?<br>
<br></blockquote><div><br></div><div>Ok, I&#39;ll add all that stuff to doc=
umentation.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt;&gt; When &quot;no DCHCP service is provided&quot;, then @dhcpstart and=
 @dhcpend become<br>
&gt;&gt; misnomers.=C2=A0 Compare NetdevUserOptions: it uses @net to specif=
y the<br>
&gt;&gt; address range, and dhcpstart to specify the DHCP range (@dhcpend i=
s<br>
&gt;&gt; implied).=C2=A0 Should we aim for consistency between the two?<br>
&gt;&gt;<br>
&gt;<br>
&gt; I think it is not our choice. All of these options are just mappings t=
o<br>
&gt; vmnet interface<br>
&gt; params:<br>
&gt; <a href=3D"https://developer.apple.com/documentation/vmnet/vmnet_const=
ants" rel=3D"noreferrer" target=3D"_blank">https://developer.apple.com/docu=
mentation/vmnet/vmnet_constants</a><br>
<br>
I think it *is* our choice.=C2=A0 We can choose to be internally consistent=
,<br>
i.e. with NetdevUserOptions, or consistent with the external interface<br>
we expose internally, i.e. with the vmnet interface.=C2=A0 Tradeoff.<br>
<br></blockquote><div><br></div><div>I think the second one is better, let&=
#39;s stay consistent with vmnet.</div><div><br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
&gt; @subnet-mask -&gt; vmnet_subnet_mask_key<br>
&gt; @dhcpstart -&gt; vmnet_start_address_key<br>
&gt; @dhcpend -&gt;=C2=A0 vmnet_end_address_key<br>
<br>
Note that the right hand side does not say &quot;DHCP&quot;.=C2=A0 I think =
the left<br>
hand side should not, either.=C2=A0 Why not @start-address and @end-address=
?<br>
<br></blockquote><div><br></div><div>I agree, these names sound much more s=
uitable.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
&gt; More detailed description is provided in the `vmnet.h` header of macOS=
 SDK.<br>
&gt; There is a restriction that says: when the `vmnet_subnet_mask_key`<br>
&gt; (@subnet-mask)<br>
&gt; is set you &quot;must also specify vmnet_start_address_key and<br>
&gt; vmnet_end_address_key&quot;.<br>
&gt; So, when &quot;no DHCP service is provided&quot; the`@subnet-mask` pro=
perty also<br>
&gt; becomes<br>
&gt; a misnomer.<br>
<br>
I don&#39;t think so.=C2=A0 vmnet_end_address_key, vmnet_end_address_key,<b=
r>
vmnet_subnet_mask_key all make sense regardless of DHCP service.<br>
<br>
The gateway address is hardwired to the first address in the range.=C2=A0 I=
f<br>
DHCP is provided, it hands out addresses from the remainder of the<br>
range.<br>
<br></blockquote><div><br></div><div>For some reason I thought that these p=
arams are</div><div>DHCP-specific, while they are not. My fault, sorry.</di=
v><div>Will fix this too.</div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">&gt; I added a corresponding restriction: you cannot=
 provide @net-uuid within<br>
&gt; any of DHCP<br>
&gt; options, this causes hard failure with `error_setg()` (see vmnet-host.=
c).<br>
&gt;<br>
&gt;<br>
&gt;&gt; +#<br>
&gt;&gt; &gt; +# Since: 6.2<br>
&gt;&gt;<br>
&gt;&gt; Missed 6.2, please adjust.=C2=A0 More of the same below.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; The next one is 6.3, isn&#39;t it?<br>
<br>
7.0=C2=A0<br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
&gt;&gt; +##<br>
&gt;&gt; &gt; +{ &#39;struct&#39;: &#39;NetdevVmnetHostOptions&#39;,<br>
&gt;&gt; &gt; +=C2=A0 &#39;data&#39;: {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 &#39;*dhcpstart&#39;:=C2=A0 =C2=A0&#39;str&#39=
;,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 &#39;*dhcpend&#39;:=C2=A0 =C2=A0 =C2=A0&#39;st=
r&#39;,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 &#39;*subnetmask&#39;:=C2=A0 &#39;str&#39;,<br=
>
&gt;&gt; &gt; +=C2=A0 =C2=A0 &#39;*isolated&#39;:=C2=A0 =C2=A0 &#39;bool&#3=
9;,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 &#39;*net-uuid&#39;:=C2=A0 =C2=A0 &#39;str&#39=
;<br>
&gt;&gt; &gt; +=C2=A0 },<br>
&gt;&gt; &gt; +=C2=A0 &#39;if&#39;: &#39;CONFIG_VMNET&#39; }<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +##<br>
&gt;&gt; &gt; +# @NetdevVmnetSharedOptions:<br>
&gt;&gt; &gt; +#<br>
&gt;&gt; &gt; +# vmnet (shared mode) network backend.<br>
&gt;&gt; &gt; +#<br>
&gt;&gt; &gt; +# Allows traffic originating from the vmnet interface to rea=
ch the<br>
&gt;&gt; &gt; +# Internet through a network address translator (NAT). The v=
mnet<br>
&gt;&gt; &gt; +# interface can also communicate with the native host. By de=
fault,<br>
&gt;&gt; &gt; +# the vmnet interface is able to communicate with other shar=
ed mode<br>
&gt;&gt; &gt; +# interfaces. If a subnet range is specified, the vmnet inte=
rface can<br>
&gt;&gt;<br>
&gt;&gt; Do you mean &quot;subnet mask&quot;?<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; This phrase was just copied from Apple&#39;s `vmnet.h` from SDK:<br>
&gt; ```<br>
&gt;=C2=A0 * [...] VMNET_SHARED_MODE<br>
&gt;=C2=A0 * Allows traffic originating from the vmnet interface to reach t=
he<br>
&gt;=C2=A0 * Internet through a network address translator (NAT). The vmnet=
 interface<br>
&gt;=C2=A0 * can also communicate with the native host. By default, the vmn=
et<br>
&gt; interface<br>
&gt;=C2=A0 * is able to communicate with other shared mode interfaces. If a=
 subnet<br>
&gt; range<br>
&gt;=C2=A0 * is specified, the vmnet interface can communicate with other s=
hared mode<br>
&gt;=C2=A0 * interfaces on the same subnet.<br>
&gt; ```<br>
&gt; But `subnet mask` sounds more suitable, so it&#39;s better to say:<br>
&gt; &quot;... If a subnet mask and DHCP range is specified, the vmnet inte=
rface can<br>
&gt; ...&quot;<br>
&gt;<br>
&gt;&gt; +# communicate with other shared mode interfaces on the same subne=
t.<br>
&gt;&gt; &gt; +#<br>
&gt;&gt; &gt; +# @dhcpstart: The starting IPv4 address to use for the inter=
face.<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Must be in =
the private IP range (RFC 1918). Must be<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0specified a=
long with @dhcpend and @subnetmask.<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This addres=
s is used as the gateway address. The<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subsequent =
address up to and including dhcpend are<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0placed in t=
he DHCP pool.<br>
&gt;&gt; &gt; +#<br>
&gt;&gt; &gt; +# @dhcpend: The DHCP IPv4 range end address to use for the<b=
r>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interface. Must be=
 in the private IP range (RFC 1918).<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Must be specified =
along with @dhcpstart and @subnetmask.<br>
&gt;&gt; &gt; +#<br>
&gt;&gt; &gt; +# @subnetmask: The IPv4 subnet mask to use on the interface.=
 Must<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 be specifi=
ed along with @dhcpstart and @subnetmask.<br>
&gt;&gt; &gt; +#<br>
&gt;&gt; &gt; +# @isolated: Enable isolation for this interface. Interface =
isolation<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ensures that netw=
ork communication between multiple<br>
&gt;&gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet interfaces =
instances is not possible.<br>
&gt;&gt; &gt; +#<br>
&gt;&gt; &gt; +# Since: 6.2<br>
&gt;&gt; &gt; +##<br>
&gt;&gt; &gt; +{ &#39;struct&#39;: &#39;NetdevVmnetSharedOptions&#39;,<br>
&gt;&gt; &gt; +=C2=A0 &#39;data&#39;: {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 &#39;*dhcpstart&#39;:=C2=A0 =C2=A0 &#39;str&#3=
9;,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 &#39;*dhcpend&#39;:=C2=A0 =C2=A0 =C2=A0 &#39;s=
tr&#39;,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 &#39;*subnetmask&#39;:=C2=A0 =C2=A0&#39;str&#3=
9;,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 &#39;*isolated&#39;:=C2=A0 =C2=A0 =C2=A0&#39;b=
ool&#39;<br>
&gt;&gt; &gt; +=C2=A0 },<br>
&gt;&gt; &gt; +=C2=A0 &#39;if&#39;: &#39;CONFIG_VMNET&#39; }<br>
&gt;&gt;<br>
&gt;&gt; [...]<br>
&gt;<br>
&gt; As a conclusion, my TODOs for now:<br>
&gt;=C2=A0 =C2=A0* fix `subnet range` in documentation<br>
&gt;=C2=A0 =C2=A0* add dash to @subnet-mask<br>
&gt;=C2=A0 =C2=A0* change version: 6.2 -&gt; 6.3<br>
&gt;=C2=A0 =C2=A0* provide IPv6 configuration properties for vmnet-shared (=
optional).<br>
<br></blockquote><div><br></div><div><div><br class=3D"gmail-Apple-intercha=
nge-newline">Already done in v5:</div><div>* @subnetmask -&gt;=C2=A0@subnet=
-mask</div><div>* nat66 prefix property added</div><div>* updated version 6=
.2 -&gt; 7.0</div></div><div><br></div><div>Now in my TODO:</div><div>=C2=
=A0* improve documentation, especially for</div><div>=C2=A0 =C2=A0 isolatio=
n properties.</div><div>* change @dhcpstart, @dhcpend to=C2=A0</div><div>=
=C2=A0 =C2=A0@start-address, @end-address.</div><div><br></div><div>Please =
confirm, and I&#39;ll submit v6 with all these</div><div>fixes.</div><div><=
br></div></div>Thank you for the review!<div><br>-- <br><div dir=3D"ltr" cl=
ass=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"=
>Best Regards,<div><br><div>Vladislav Yaroshchuk</div></div></div></div></d=
iv></div>

--00000000000011451805d12b993e--

