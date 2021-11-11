Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F11344D91F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 16:23:08 +0100 (CET)
Received: from localhost ([::1]:49844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlBut-00087f-4r
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 10:23:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mlBtY-0007No-V7
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 10:21:44 -0500
Received: from [2607:f8b0:4864:20::929] (port=40750
 helo=mail-ua1-x929.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mlBtV-0002YF-Kq
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 10:21:44 -0500
Received: by mail-ua1-x929.google.com with SMTP id e2so12567635uax.7
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 07:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GlzO9xbokbyK1syAbFDuAwyGmogiC4+xYVYOkP5x/+s=;
 b=lZQSDyFZ7JK3gpxyPqd7OTaRDN3Xev1h1DU/5FVweAf6pdLYapiM0p26OkOxQgDnAr
 YMkoMLM4/f8eLjSsreINZozx/inwjIwHUvDtsYx9D49nJL1zjZShtl3m+2spGI/7vsU/
 t2DaS1zgPisa+MGazTfQ0L/c+4nmB+GHmksFJE2/4ZPVEwn9VX/IW6bLDzbuIs/YMlvk
 aLGIqBWx+ctkMtr/s6HyM6U2QurecQ8H58K7Wz2JhcsT0XZYF9/ikpLGHWIyUIoy52ci
 PTCPPZUeGuX3gSC8EX4Cb3ModbVU9DrI3YAaW18sDBVcW+2lnMALcPvIrP5BQV2Fbz/M
 c2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GlzO9xbokbyK1syAbFDuAwyGmogiC4+xYVYOkP5x/+s=;
 b=vodCTQC5J0eiJ2nyzF8Fy8eHSKuJMkLFU2U0Br5AOiIkg04SkcHLvetmwLusaqjJWV
 jZdDoMgxMs3Er0JpszSTxkDK++RxfPZFBhQqlRKThMmyRPdPy/MI4UTBf+z51AF9oLmg
 iUKHPRX1sAnrm0OiLRbDb84WfE80dUujzoZoR87kagPHQxTwmdRVWYKlAWn/V9XDPiWK
 NsFdWmVkSGu5o/n1vJcnvPvPlAX2nzGDJj6T4kfcbkD2usTx+TYwNlAEfCx8IDJJd3s6
 +HA2krll9L0k6lbd989XoC02stywzDea+UQzGAtjI3IwJLhusUcRdzYuCahMka3Mxi2k
 sxRA==
X-Gm-Message-State: AOAM530907TlpK83POSqFYO64JiTroNWZ1QVqDnjeT3Ei6iQiJQBizVi
 3t+diLogPszqgyVufED2sJfHLWeIlubN6x024hQ=
X-Google-Smtp-Source: ABdhPJwtzi9rXg5TYM5tq5mdRDXbZD0x3H1+By5ONllIV0df+YQIkJExlFCgSfikUkSNJjKE//Y4lOHFJBwMjAz7BT4=
X-Received: by 2002:a67:db0b:: with SMTP id z11mr11522932vsj.59.1636644099872; 
 Thu, 11 Nov 2021 07:21:39 -0800 (PST)
MIME-Version: 1.0
References: <20211108151704.65611-1-yaroshchuk2000@gmail.com>
 <20211108151704.65611-3-yaroshchuk2000@gmail.com>
 <87czn9honw.fsf@dusky.pond.sub.org>
In-Reply-To: <87czn9honw.fsf@dusky.pond.sub.org>
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Date: Thu, 11 Nov 2021 18:21:28 +0300
Message-ID: <CADO9X9QJRxNL_Mc4rfvL5T7Bhfxekp8amN0Y56iLO4JyDsow6g@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] net/vmnet: add vmnet backends to qapi/net
To: Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000325dde05d084e6e4"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::929
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-ua1-x929.google.com
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
Cc: jasowang@redhat.com, phillip.ennen@gmail.com, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Phillip Tennen <phillip@axleos.com>,
 akihiko.odaki@gmail.com, Howard Spoelstra <hsp.cat7@gmail.com>,
 Alessio Dionisi <hello@adns.io>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000325dde05d084e6e4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 9 =D0=BD=D0=BE=D1=8F=D0=B1. 2021 =D0=B3. =D0=B2 08:41, Markus=
 Armbruster <armbru@redhat.com>:

> Vladislav Yaroshchuk <yaroshchuk2000@gmail.com> writes:
>
> > Create separate netdevs for each vmnet operating mode:
> > - vmnet-host
> > - vmnet-shared
> > - vmnet-bridged
> >
> > Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
>
> [...]
>
> > diff --git a/qapi/net.json b/qapi/net.json
> > index 7fab2e7cd8..087cdf0546 100644
> > --- a/qapi/net.json
> > +++ b/qapi/net.json
> > @@ -452,6 +452,112 @@
> >      '*vhostdev':     'str',
> >      '*queues':       'int' } }
> >
> > +##
> > +# @NetdevVmnetHostOptions:
> > +#
> > +# vmnet (host mode) network backend.
> > +#
> > +# Allows the vmnet interface to communicate with other vmnet
> > +# interfaces that are in host mode and also with the native host.
> > +#
> > +# @dhcpstart: The starting IPv4 address to use for the interface.
> > +#             Must be in the private IP range (RFC 1918). Must be
> > +#             specified along with @dhcpend and @subnetmask.
> > +#             This address is used as the gateway address. The
> > +#             subsequent address up to and including dhcpend are
> > +#             placed in the DHCP pool.
>
> In QMP, we separate words by dashes, like @dhcp-start.  We may prefer
> not to here, for consistency with NetdevUserOptions, ...
>
> +#
> > +# @dhcpend: The DHCP IPv4 range end address to use for the
> > +#           interface. Must be in the private IP range (RFC 1918).
> > +#           Must be specified along with @dhcpstart and @subnetmask.
>
> ... and here, to match @dhcpstart.
>
> Yes, I did not use dashed exactly because of this: to be consistent with
NetdevUserOptions.

> +#
> > +# @subnetmask: The IPv4 subnet mask to use on the interface. Must
> > +#              be specified along with @dhcpstart and @subnetmask.
>
> @subnet-mask, please.
>

So I think we can leave `dhcpstart`, `dhcpend`, but add a dash to
`subnet-mask`.


> No support for IPv6?
>
>
It's supported. vmnet-shared tested with link-local addresses.
Also some configurable options exist, but only for 'shared' mode.
I can try to add them in the next patch series version.

> +#
> > +# @isolated: Enable isolation for this interface. Interface isolation
> > +#            ensures that network communication between multiple
> > +#            vmnet interfaces instances is not possible.
> > +#
> > +# @net-uuid: The identifier (UUID) to uniquely identify the network.
> > +#            If provided, no DHCP service is provided on this network
> > +#            and the interface is added to an isolated network with
> > +#            the specified identifier.
>
> Out of curiosity: identify to whom?
>
> If I set @net-uuid, I get an isolated network with a UUID, and if I set
> "isolated": true, I get one without a UUID.  When would I want the
> former, and when the latter?
>
>
`if I set "isolated": true, I get one without a UUID.` is an
incorrect statement.

vmnet.framework isolation features are designed a bit weirdly (just my
opinion).
Most things happen on the macOS side, and we just can provide some
configuration
options to vmnet.framework as the user provides options to QEMU.

Firstly, if you set @net-uuid, you're putting the interface into an
isolated network.
You can set the same @net-uuid on multiple vmnet-host interfaces, also
outside
QEMU, it can be any vmnet interface started in 'host' mode, ex. xhyve's
netdev
if they support this. All of them can communicate with each other, but only
inside
this net identified by the @net-uuid. They can't communicate with
interfaces from
network with id !=3D ${our set @net-uuid}.

"@isolated" is a more prohibitive mode. "Isolated" interface is not able to
communicate
with anyone except the host.

What happens when I set "isolated": false together with @net-uuid?


Let's compare (vmnet-host mode):

0. When nothing is provided, DHCP is enabled and uses default
(macOS-configured) settings.
    Your interface can communicate with any other vmnet-host interface.

1. When provided `@isolated=3Don` only,  DHCP is still enabled, but the
interface can
   communicate only with the host. All the attempts to create another
interface with
   the same subnet will fail with `VMNET_SHARING_SERVICE_BUSY`. If we don't
   specify DHCP settings (start, end, mask), macOS adjusts them
automatically to
   prevent collisions and the `VMNET_SHARING_SERVICE_BUSY` error.

2. When provided @net-uuid=3Duuid[,@isolated=3Doff], the interface can
communicate to any
     other interface inside the 'uuid' network. Also with other VMs under
other hypervisors.
     DHCP is disabled.

3. When provided @net-uuid=3Duuid,@isolated=3Don, the interface can communi=
cate
only with
    the host.  DHCP is disabled. All the attempts to create another
interface with
    the @net-uuid will fail with `VMNET_SHARING_SERVICE_BUSY`.

When "no DCHCP service is provided", then @dhcpstart and @dhcpend become
> misnomers.  Compare NetdevUserOptions: it uses @net to specify the
> address range, and dhcpstart to specify the DHCP range (@dhcpend is
> implied).  Should we aim for consistency between the two?
>

I think it is not our choice. All of these options are just mappings to
vmnet interface
params:
https://developer.apple.com/documentation/vmnet/vmnet_constants
@subnet-mask -> vmnet_subnet_mask_key
@dhcpstart -> vmnet_start_address_key
@dhcpend ->  vmnet_end_address_key
More detailed description is provided in the `vmnet.h` header of macOS SDK.
There is a restriction that says: when the `vmnet_subnet_mask_key`
(@subnet-mask)
is set you "must also specify vmnet_start_address_key and
vmnet_end_address_key".
So, when "no DHCP service is provided" the`@subnet-mask` property also
becomes
a misnomer.

I added a corresponding restriction: you cannot provide @net-uuid within
any of DHCP
options, this causes hard failure with `error_setg()` (see vmnet-host.c).


> +#
> > +# Since: 6.2
>
> Missed 6.2, please adjust.  More of the same below.
>
>
The next one is 6.3, isn't it?

> +##
> > +{ 'struct': 'NetdevVmnetHostOptions',
> > +  'data': {
> > +    '*dhcpstart':   'str',
> > +    '*dhcpend':     'str',
> > +    '*subnetmask':  'str',
> > +    '*isolated':    'bool',
> > +    '*net-uuid':    'str'
> > +  },
> > +  'if': 'CONFIG_VMNET' }
> > +
> > +##
> > +# @NetdevVmnetSharedOptions:
> > +#
> > +# vmnet (shared mode) network backend.
> > +#
> > +# Allows traffic originating from the vmnet interface to reach the
> > +# Internet through a network address translator (NAT). The vmnet
> > +# interface can also communicate with the native host. By default,
> > +# the vmnet interface is able to communicate with other shared mode
> > +# interfaces. If a subnet range is specified, the vmnet interface can
>
> Do you mean "subnet mask"?
>
>
This phrase was just copied from Apple's `vmnet.h` from SDK:
```
 * [...] VMNET_SHARED_MODE
 * Allows traffic originating from the vmnet interface to reach the
 * Internet through a network address translator (NAT). The vmnet interface
 * can also communicate with the native host. By default, the vmnet
interface
 * is able to communicate with other shared mode interfaces. If a subnet
range
 * is specified, the vmnet interface can communicate with other shared mode
 * interfaces on the same subnet.
```
But `subnet mask` sounds more suitable, so it's better to say:
"... If a subnet mask and DHCP range is specified, the vmnet interface can
..."

> +# communicate with other shared mode interfaces on the same subnet.
> > +#
> > +# @dhcpstart: The starting IPv4 address to use for the interface.
> > +#             Must be in the private IP range (RFC 1918). Must be
> > +#             specified along with @dhcpend and @subnetmask.
> > +#             This address is used as the gateway address. The
> > +#             subsequent address up to and including dhcpend are
> > +#             placed in the DHCP pool.
> > +#
> > +# @dhcpend: The DHCP IPv4 range end address to use for the
> > +#           interface. Must be in the private IP range (RFC 1918).
> > +#           Must be specified along with @dhcpstart and @subnetmask.
> > +#
> > +# @subnetmask: The IPv4 subnet mask to use on the interface. Must
> > +#              be specified along with @dhcpstart and @subnetmask.
> > +#
> > +# @isolated: Enable isolation for this interface. Interface isolation
> > +#            ensures that network communication between multiple
> > +#            vmnet interfaces instances is not possible.
> > +#
> > +# Since: 6.2
> > +##
> > +{ 'struct': 'NetdevVmnetSharedOptions',
> > +  'data': {
> > +    '*dhcpstart':    'str',
> > +    '*dhcpend':      'str',
> > +    '*subnetmask':   'str',
> > +    '*isolated':     'bool'
> > +  },
> > +  'if': 'CONFIG_VMNET' }
>
> [...]

As a conclusion, my TODOs for now:
  * fix `subnet range` in documentation
  * add dash to @subnet-mask
  * change version: 6.2 -> 6.3
  * provide IPv6 configuration properties for vmnet-shared (optional).

Best regards,
Vladislav Yaroshchuk

--000000000000325dde05d084e6e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">=D0=B2=D1=82, 9 =D0=BD=D0=BE=D1=8F=D0=
=B1. 2021 =D0=B3. =D0=B2 08:41, Markus Armbruster &lt;<a href=3D"mailto:arm=
bru@redhat.com" target=3D"_blank">armbru@redhat.com</a>&gt;:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">Vladislav Yaroshchuk &lt;<a hr=
ef=3D"mailto:yaroshchuk2000@gmail.com" target=3D"_blank">yaroshchuk2000@gma=
il.com</a>&gt; writes:<br>
<br>
&gt; Create separate netdevs for each vmnet operating mode:<br>
&gt; - vmnet-host<br>
&gt; - vmnet-shared<br>
&gt; - vmnet-bridged<br>
&gt;<br>
&gt; Signed-off-by: Vladislav Yaroshchuk &lt;<a href=3D"mailto:yaroshchuk20=
00@gmail.com" target=3D"_blank">yaroshchuk2000@gmail.com</a>&gt;<br>
<br>
[...]<br>
<br>
&gt; diff --git a/qapi/net.json b/qapi/net.json<br>
&gt; index 7fab2e7cd8..087cdf0546 100644<br>
&gt; --- a/qapi/net.json<br>
&gt; +++ b/qapi/net.json<br>
&gt; @@ -452,6 +452,112 @@<br>
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
&gt; +# interfaces that are in host mode and also with the native host.<br>
&gt; +#<br>
&gt; +# @dhcpstart: The starting IPv4 address to use for the interface.<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Must be in the priva=
te IP range (RFC 1918). Must be<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0specified along with=
 @dhcpend and @subnetmask.<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This address is used=
 as the gateway address. The<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subsequent address u=
p to and including dhcpend are<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0placed in the DHCP p=
ool.<br>
<br>
In QMP, we separate words by dashes, like @dhcp-start.=C2=A0 We may prefer<=
br>
not to here, for consistency with NetdevUserOptions, ...=C2=A0<br></blockqu=
ote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +#<br>
&gt; +# @dhcpend: The DHCP IPv4 range end address to use for the<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interface. Must be in the p=
rivate IP range (RFC 1918).<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Must be specified along wit=
h @dhcpstart and @subnetmask.<br>
<br>
... and here, to match @dhcpstart.<br>
<br></blockquote><div>Yes, I did not use dashed exactly because of this: to=
 be consistent with NetdevUserOptions.=C2=A0</div><div><br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
&gt; +#<br>
&gt; +# @subnetmask: The IPv4 subnet mask to use on the interface. Must<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 be specified along =
with @dhcpstart and @subnetmask.<br>
<br>
@subnet-mask, please.<br></blockquote><div><br></div><div>So I think we can=
 leave `dhcpstart`, `dhcpend`, but add a dash to `subnet-mask`.</div><div><=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
No support for IPv6?<br>
<br></blockquote><div><br></div><div>It&#39;s supported. vmnet-shared teste=
d with link-local addresses.</div><div>Also some configurable options exist=
, but only for &#39;shared&#39; mode.</div><div>I can try to add=C2=A0them =
in the next patch series version.=C2=A0</div><div><br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
&gt; +#<br>
&gt; +# @isolated: Enable isolation for this interface. Interface isolation=
<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ensures that network commu=
nication between multiple<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet interfaces instances=
 is not possible.<br>
&gt; +#<br>
&gt; +# @net-uuid: The identifier (UUID) to uniquely identify the network.<=
br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 If provided, no DHCP servi=
ce is provided on this network<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 and the interface is added=
 to an isolated network with<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 the specified identifier.<=
br>
<br>
Out of curiosity: identify to whom?<br>
<br>
If I set @net-uuid, I get an isolated network with a UUID, and if I set<br>
&quot;isolated&quot;: true, I get one without a UUID.=C2=A0 When would I wa=
nt the<br>
former, and when the latter?<br>
<br></blockquote><div>=C2=A0</div><div>`if I set &quot;isolated&quot;: true=
, I get one without a UUID.` is an incorrect=C2=A0statement.</div><div><br>=
</div><div>vmnet.framework isolation features are=C2=A0designed a bit weird=
ly (just my opinion).=C2=A0</div><div>Most things happen on the macOS side,=
=C2=A0and we just can provide some configuration</div><div>options to=C2=A0=
vmnet.framework as the user=C2=A0provides options to QEMU.</div><div><br></=
div><div>Firstly, if you set @net-uuid, you&#39;re putting the interface in=
to an isolated network.</div><div>You can set the same @net-uuid on multipl=
e vmnet-host interfaces, also outside=C2=A0</div><div>QEMU, it can be any v=
mnet interface started in &#39;host&#39; mode, ex. xhyve&#39;s netdev=C2=A0=
</div><div>if they support this. All of them can communicate with each othe=
r, but only inside=C2=A0</div><div>this net identified=C2=A0by the @net-uui=
d. They can&#39;t communicate with interfaces from</div><div>network with i=
d !=3D ${our set @net-uuid}.=C2=A0</div><div>=C2=A0</div><div>&quot;@isolat=
ed&quot; is a more prohibitive mode. &quot;Isolated&quot; interface is not =
able to communicate=C2=A0</div><div>with anyone except the host.</div><div>=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
What happens when I set &quot;isolated&quot;: false together with @net-uuid=
?</blockquote><div><br></div><div>Let&#39;s compare (vmnet-host mode):=C2=
=A0</div><div><br></div><div>0. When nothing is provided, DHCP is enabled a=
nd uses default (macOS-configured) settings.=C2=A0</div><div>=C2=A0 =C2=A0 =
Your interface can communicate with any other vmnet-host interface.=C2=A0</=
div><div>=C2=A0=C2=A0</div><div>1. When provided=C2=A0`@isolated=3Don` only=
,=C2=A0=C2=A0DHCP is still=C2=A0enabled, but the interface can</div><div>=
=C2=A0 =C2=A0communicate only with the host. All the attempts to create ano=
ther interface with</div><div>=C2=A0 =C2=A0the same subnet will fail with `=
VMNET_SHARING_SERVICE_BUSY`. If we don&#39;t=C2=A0</div><div>=C2=A0 =C2=A0s=
pecify DHCP settings (start, end, mask), macOS adjusts them automatically t=
o</div><div>=C2=A0 =C2=A0prevent=C2=A0collisions and the `VMNET_SHARING_SER=
VICE_BUSY` error.=C2=A0</div><div><br></div><div>2. When provided @net-uuid=
=3Duuid[,@isolated=3Doff], the interface can communicate to any=C2=A0</div>=
<div>=C2=A0 =C2=A0 =C2=A0other interface inside the &#39;uuid&#39; network.=
 Also with other VMs under other hypervisors.</div><div>=C2=A0 =C2=A0 =C2=
=A0DHCP is disabled.=C2=A0</div><div><br></div><div>3. When provided @net-u=
uid=3Duuid,@isolated=3Don, the interface can communicate only with=C2=A0</d=
iv><div>=C2=A0 =C2=A0 the host.=C2=A0 DHCP is disabled. All the attempts to=
 create another interface with</div><div>=C2=A0 =C2=A0 the @net-uuid will f=
ail with `VMNET_SHARING_SERVICE_BUSY`.</div><div><br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
When &quot;no DCHCP service is provided&quot;, then @dhcpstart and @dhcpend=
 become<br>
misnomers.=C2=A0 Compare NetdevUserOptions: it uses @net to specify the<br>
address range, and dhcpstart to specify the DHCP range (@dhcpend is<br>
implied).=C2=A0 Should we aim for consistency between the two?<br></blockqu=
ote><div><br></div><div>I think it is not our choice. All of these options =
are just mappings to vmnet interface=C2=A0</div><div>params:</div><div><a h=
ref=3D"https://developer.apple.com/documentation/vmnet/vmnet_constants" tar=
get=3D"_blank">https://developer.apple.com/documentation/vmnet/vmnet_consta=
nts</a><br></div><div>@subnet-mask -&gt; vmnet_subnet_mask_key<br></div><di=
v>@dhcpstart -&gt; vmnet_start_address_key<br></div><div>@dhcpend -&gt;=C2=
=A0 vmnet_end_address_key</div><div>More detailed description is provided i=
n the `vmnet.h` header of macOS SDK.</div><div>There is a restriction that =
says: when the `vmnet_subnet_mask_key` (@subnet-mask)=C2=A0</div><div>is se=
t you &quot;must also specify vmnet_start_address_key and=C2=A0 vmnet_end_a=
ddress_key&quot;.=C2=A0</div><div>So, when &quot;no DHCP service is provide=
d&quot; the`@subnet-mask` property also becomes=C2=A0</div><div>a misnomer.=
</div><div><br></div><div>I added a corresponding restriction: you cannot p=
rovide=C2=A0@net-uuid within any of DHCP</div><div>options, this causes har=
d failure with `error_setg()` (see vmnet-host.c).</div><div><br></div><div>=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +#<br>
&gt; +# Since: 6.2<br>
<br>
Missed 6.2, please adjust.=C2=A0 More of the same below.<br>
<br></blockquote><div>=C2=A0</div><div>The next one is 6.3, isn&#39;t it?</=
div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +##<br>
&gt; +{ &#39;struct&#39;: &#39;NetdevVmnetHostOptions&#39;,<br>
&gt; +=C2=A0 &#39;data&#39;: {<br>
&gt; +=C2=A0 =C2=A0 &#39;*dhcpstart&#39;:=C2=A0 =C2=A0&#39;str&#39;,<br>
&gt; +=C2=A0 =C2=A0 &#39;*dhcpend&#39;:=C2=A0 =C2=A0 =C2=A0&#39;str&#39;,<b=
r>
&gt; +=C2=A0 =C2=A0 &#39;*subnetmask&#39;:=C2=A0 &#39;str&#39;,<br>
&gt; +=C2=A0 =C2=A0 &#39;*isolated&#39;:=C2=A0 =C2=A0 &#39;bool&#39;,<br>
&gt; +=C2=A0 =C2=A0 &#39;*net-uuid&#39;:=C2=A0 =C2=A0 &#39;str&#39;<br>
&gt; +=C2=A0 },<br>
&gt; +=C2=A0 &#39;if&#39;: &#39;CONFIG_VMNET&#39; }<br>
&gt; +<br>
&gt; +##<br>
&gt; +# @NetdevVmnetSharedOptions:<br>
&gt; +#<br>
&gt; +# vmnet (shared mode) network backend.<br>
&gt; +#<br>
&gt; +# Allows traffic originating from the vmnet interface to reach the<br=
>
&gt; +# Internet through a network address translator (NAT). The vmnet<br>
&gt; +# interface can also communicate with the native host. By default,<br=
>
&gt; +# the vmnet interface is able to communicate with other shared mode<b=
r>
&gt; +# interfaces. If a subnet range is specified, the vmnet interface can=
<br>
<br>
Do you mean &quot;subnet mask&quot;?<br>
<br></blockquote><div><br></div><div>This phrase was just copied from Apple=
&#39;s `vmnet.h` from SDK:</div><div>```</div>=C2=A0* [...] VMNET_SHARED_MO=
DE<br>=C2=A0* Allows traffic originating from the vmnet interface to reach =
the<br>=C2=A0* Internet through a network address translator (NAT). The vmn=
et interface<br>=C2=A0* can also communicate with the native host. By defau=
lt, the vmnet interface<br>=C2=A0* is able to communicate with other shared=
 mode interfaces. If a subnet range<br>=C2=A0* is specified, the vmnet inte=
rface can communicate with other shared mode<br>=C2=A0* interfaces on the s=
ame subnet.<br><div>```</div><div>But `subnet mask` sounds more suitable, s=
o it&#39;s better to say:</div><div>&quot;... If a subnet mask and DHCP ran=
ge is specified, the vmnet interface can ...&quot;</div><div><br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +# communicate with other shared mode interfaces on the same subnet.<b=
r>
&gt; +#<br>
&gt; +# @dhcpstart: The starting IPv4 address to use for the interface.<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Must be in the priva=
te IP range (RFC 1918). Must be<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0specified along with=
 @dhcpend and @subnetmask.<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This address is used=
 as the gateway address. The<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subsequent address u=
p to and including dhcpend are<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0placed in the DHCP p=
ool.<br>
&gt; +#<br>
&gt; +# @dhcpend: The DHCP IPv4 range end address to use for the<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interface. Must be in the p=
rivate IP range (RFC 1918).<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Must be specified along wit=
h @dhcpstart and @subnetmask.<br>
&gt; +#<br>
&gt; +# @subnetmask: The IPv4 subnet mask to use on the interface. Must<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 be specified along =
with @dhcpstart and @subnetmask.<br>
&gt; +#<br>
&gt; +# @isolated: Enable isolation for this interface. Interface isolation=
<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ensures that network commu=
nication between multiple<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmnet interfaces instances=
 is not possible.<br>
&gt; +#<br>
&gt; +# Since: 6.2<br>
&gt; +##<br>
&gt; +{ &#39;struct&#39;: &#39;NetdevVmnetSharedOptions&#39;,<br>
&gt; +=C2=A0 &#39;data&#39;: {<br>
&gt; +=C2=A0 =C2=A0 &#39;*dhcpstart&#39;:=C2=A0 =C2=A0 &#39;str&#39;,<br>
&gt; +=C2=A0 =C2=A0 &#39;*dhcpend&#39;:=C2=A0 =C2=A0 =C2=A0 &#39;str&#39;,<=
br>
&gt; +=C2=A0 =C2=A0 &#39;*subnetmask&#39;:=C2=A0 =C2=A0&#39;str&#39;,<br>
&gt; +=C2=A0 =C2=A0 &#39;*isolated&#39;:=C2=A0 =C2=A0 =C2=A0&#39;bool&#39;<=
br>
&gt; +=C2=A0 },<br>
&gt; +=C2=A0 &#39;if&#39;: &#39;CONFIG_VMNET&#39; }<br><br></blockquote><di=
v>[...]=C2=A0</div><div><br></div><div>As a conclusion, my TODOs for now:</=
div><div>=C2=A0 * fix `subnet range` in documentation</div><div>=C2=A0 * ad=
d dash to=C2=A0@subnet-mask</div><div>=C2=A0 * change version: 6.2 -&gt; 6.=
3</div><div>=C2=A0 * provide IPv6 configuration properties for vmnet-shared=
 (optional).=C2=A0<br></div><div><br></div><div>Best regards,</div><div>Vla=
dislav Yaroshchuk</div></div></div>

--000000000000325dde05d084e6e4--

