Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F1B42A2C5
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 13:03:04 +0200 (CEST)
Received: from localhost ([::1]:55286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maFYl-0007x1-FF
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 07:03:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1maEo7-0004pD-HF
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 06:14:51 -0400
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929]:39656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1maEo3-0001uI-A3
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 06:14:51 -0400
Received: by mail-ua1-x929.google.com with SMTP id f3so14029840uap.6
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 03:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vcne/y83/FOkWLQT1x5WJa5eZXKKiQ4PcqTFpz0EsRw=;
 b=Pr2O6bJtUnhdkYGweQnEkpk7eCtpJzFGNmb9JTyUgzl/n21QroBPDLw8ZNBCvSlKKu
 atMgkZfHbPm6GzS39IFoGrXaiGp7yjlr8qQYkOB/l7S/S+t/PK0MgkybcvXBd+EWj2yI
 4b1DchEYmMORihYRy75Dp1nqlzGQ7iiRLlwHcpI/PKrcGAb5aZrBnjI9d5DPLnHdkPqr
 JzJU33+R1g0u67M00oQzo5IdgW+gTH8JwKmf3BRi5P4mktEaVf7u8pL7Y03wnHw0dS5z
 yU3kM4v4n547GriEketx7RBk8jm873X08L16eEQwbyXoK5G6NPBu5nKdu323oyin0SQy
 s3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vcne/y83/FOkWLQT1x5WJa5eZXKKiQ4PcqTFpz0EsRw=;
 b=Sz4HZ5FjevoTdWkn6wZuBlwyJpyUqdNSXsc0tz01c3Mx+NBmMdvUNG4adrSklMkk+H
 W3bFLROMk++UlQ0AgFhsnwMxDLrDcC7fgJYlwhCDD1GYyBhLFfOYpBe+xmVXXy5cbqfk
 UlY3mdWWEENqZjoh04zQQKgrx6BH3CU8LR1Ve7U+aguRV4xc+hCZM8MwUAFD8JlHiFEa
 8vtHcWv0t7Sw8h6EdNXM80H1+8vdEktCiFR5SemlYtS4nF8xyYChKNavf7OuW7ewh9lc
 UK1LlayZp5IwYoh74v3idKg9ShMRfgCBaCoaH1JZH1UV/B+BJEcqXKE3lydoWSuf92ov
 YmTw==
X-Gm-Message-State: AOAM532VCn7wRy/GnFRVUuuWEyuq1+4iNPb+tVidOBHofrtfNiAnD4pd
 gdpeO6Wzn0hz6WekigqmYpJsAeHsOPdY9O/vGDecuFsML/6tzw==
X-Google-Smtp-Source: ABdhPJwDGuo5IBlN9DxLWrMx/olazFnK4YL+QM7klmgutEK2zmbfUk1UIvFfC/mV0E8qjpdUxEVAD2zGZrtQ43pcLro=
X-Received: by 2002:ab0:1447:: with SMTP id c7mr5421318uae.2.1634033685617;
 Tue, 12 Oct 2021 03:14:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210831192720.33406-1-yaroshchuk2000@gmail.com>
 <20210831192720.33406-2-yaroshchuk2000@gmail.com>
 <20211011184456.rohhk5b3umslmmdz@redhat.com>
In-Reply-To: <20211011184456.rohhk5b3umslmmdz@redhat.com>
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Date: Tue, 12 Oct 2021 13:14:34 +0300
Message-ID: <CADO9X9QeCOcEO9+XFV-xY-uxf9AZpVr72pEbPUqey=jS9J9znA@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] net/vmnet: dependencies setup, initial preparations
To: Eric Blake <eblake@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000061de2705ce251d31"
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-ua1-x929.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: jasowang@redhat.com, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000061de2705ce251d31
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you, Eric!

Now fixing all the QAPI issues.


=D0=BF=D0=BD, 11 =D0=BE=D0=BA=D1=82. 2021 =D0=B3. =D0=B2 21:45, Eric Blake =
<eblake@redhat.com>:

> On Tue, Aug 31, 2021 at 10:27:15PM +0300, Vladislav Yaroshchuk wrote:
> > Add 'vmnet' customizable option and 'vmnet.framework' probe into
> > configure;
> >
> > Create separate netdev per each vmnet operating mode
> > because they use quite different settings. Especially since
> > macOS 11.0 (vmnet.framework API gets lots of updates)
> > Create source files for network client driver, update meson.build;
> >
> > Three new netdevs are added:
> > - vmnet-host
> > - vmnet-shared
> > - vmnet-bridged
> >
> > Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> > ---
>
> While I'm not the best for reviewing the overall series, I can at
> least comment on the proposed QAPI changes:
>
> > +++ b/qapi/net.json
> > @@ -452,6 +452,89 @@
> >      '*vhostdev':     'str',
> >      '*queues':       'int' } }
> >
> > +##
> > +# @NetdevVmnetHostOptions:
> > +#
> > +# vmnet (host mode) network backend.
> > +#
> > +# Allows the vmnet interface to communicate with
> > +# other vmnet interfaces that are in host mode and also with the nativ=
e
> host.
> > +#
> > +# @dhcpstart: The starting IPv4 address to use for the interface. Must
> be in the
> > +#             private IP range (RFC 1918). Must be specified along
> > +#             with @dhcpend and @subnetmask.
> > +#             This address is used as the gateway address. The
> subsequent address
> > +#             up to and including dhcpend are placed in the DHCP pool.
>
> Long lines.  Most of the qapi docs wrap around 70 or so columns rather
> than pushing right up to the 80 column limit.
>
> > +#
> > +# @dhcpend: The DHCP IPv4 range end address to use for the interface.
> Must be in
> > +#           the private IP range (RFC 1918). Must be specified along
> > +#           with @dhcpstart and @subnetmask.
> > +#
> > +# @subnetmask: The IPv4 subnet mask to use on the interface. Must be
> specified
> > +#              along with @dhcpstart and @subnetmask.
> > +#
> > +#
> > +# Since: 6.2,
>
> Drop the trailing comma
>
> > +##
> > +{ 'struct': 'NetdevVmnetHostOptions',
> > +  'data': {
> > +    '*dhcpstart':   'str',
> > +    '*dhcpend':     'str',
> > +    '*subnetmask':  'str'
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
> interface
> > +# can also communicate with the native host. By default, the vmnet
> interface
> > +# is able to communicate with other shared mode interfaces. If a subne=
t
> range
> > +# is specified, the vmnet interface can communicate with other shared
> mode
> > +# interfaces on the same subnet.
> > +#
> > +# @dhcpstart: The starting IPv4 address to use for the interface. Must
> be in the
> > +#             private IP range (RFC 1918). Must be specified along
> > +#             with @dhcpend and @subnetmask.
> > +#             This address is used as the gateway address. The
> subsequent address
> > +#             up to and including dhcpend are  placed in the DHCP pool=
.
>
> extra space
>
> > +#
> > +# @dhcpend: The DHCP IPv4 range end address to use for the interface.
> Must be in
> > +#           the private IP range (RFC 1918). Must be specified along
> > +#           with @dhcpstart and @subnetmask.
> > +#
> > +# @subnetmask: The IPv4 subnet mask to use on the interface. Must be
> specified
> > +#              along with @dhcpstart and @subnetmask.
> > +#
> > +#
> > +# Since: 6.2,
>
> Another odd comma
>
> > +##
> > +{ 'struct': 'NetdevVmnetSharedOptions',
> > +  'data': {
> > +    '*dhcpstart':    'str',
> > +    '*dhcpend':      'str',
> > +    '*subnetmask':   'str'
> > +  },
> > +  'if': 'CONFIG_VMNET' }
>
> The NetdevVmnetHostOptions and NetdevVmnetSharedOptions types are
> identical; why do you need two types?
>
> The NetdevVmnetHostOptions and NetdevVmnetSharedOptions have differences
in other non-implemented options, such as IPv6 prefix configuring only for
`vmnet-shared`, and  subnets isolation by assigning them UUIDs for
`vmnet-host`. I have plans about implementing these features in the near
future. Separated options objects were created because of this.

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
> > +# Since: 6.2
> > +##
> > +{ 'struct': 'NetdevVmnetBridgedOptions',
> > +  'data': { 'ifname': 'str' },
> > +  'if': 'CONFIG_VMNET' }
> > +
> >  ##
> >  # @NetClientDriver:
> >  #
> > @@ -460,10 +543,16 @@
> >  # Since: 2.7
> >  #
> >  #        @vhost-vdpa since 5.1
> > +#        @vmnet-host since 6.2
> > +#        @vmnet-shared since 6.2
> > +#        @vmnet-bridged since 6.2
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
> > @@ -477,6 +566,9 @@
> >  # Since: 1.2
> >  #
> >  #        'l2tpv3' - since 2.1
> > +#        'vmnet-host' - since 6.2
> > +#        'vmnet-shared' - since 6.2
> > +#        'vmnet-bridged' - since 6.2
> >  ##
> >  { 'union': 'Netdev',
> >    'base': { 'id': 'str', 'type': 'NetClientDriver' },
> > @@ -492,7 +584,10 @@
> >      'hubport':  'NetdevHubPortOptions',
> >      'netmap':   'NetdevNetmapOptions',
> >      'vhost-user': 'NetdevVhostUserOptions',
> > -    'vhost-vdpa': 'NetdevVhostVDPAOptions' } }
> > +    'vhost-vdpa': 'NetdevVhostVDPAOptions',
> > +    'vmnet-host': 'NetdevVmnetHostOptions',
> > +    'vmnet-shared': 'NetdevVmnetSharedOptions',
>
> If you only declare one type instead of two above, then both these
> branches can use that same type.
>
> > +    'vmnet-bridged': 'NetdevVmnetBridgedOptions' } }
> >
> >  ##
> >  # @RxState:
> > --
> > 2.23.0
> >
> >
>
> --
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3266
> Virtualization:  qemu.org | libvirt.org
>
>
Best Regards,
Vladislav Yaroshchuk

--00000000000061de2705ce251d31
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Thank you, Eric!<div><br></div><div>Now f=
ixing all the QAPI issues.</div><div><br></div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">=D0=BF=D0=BD, 11 =D0=BE=D0=
=BA=D1=82. 2021 =D0=B3. =D0=B2 21:45, Eric Blake &lt;<a href=3D"mailto:ebla=
ke@redhat.com">eblake@redhat.com</a>&gt;:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">On Tue, Aug 31, 2021 at 10:27:15PM +0300, Vladisl=
av Yaroshchuk wrote:<br>
&gt; Add &#39;vmnet&#39; customizable option and &#39;vmnet.framework&#39; =
probe into<br>
&gt; configure;<br>
&gt; <br>
&gt; Create separate netdev per each vmnet operating mode<br>
&gt; because they use quite different settings. Especially since<br>
&gt; macOS 11.0 (vmnet.framework API gets lots of updates)<br>
&gt; Create source files for network client driver, update meson.build;<br>
&gt; <br>
&gt; Three new netdevs are added:<br>
&gt; - vmnet-host<br>
&gt; - vmnet-shared<br>
&gt; - vmnet-bridged<br>
&gt; <br>
&gt; Signed-off-by: Vladislav Yaroshchuk &lt;<a href=3D"mailto:yaroshchuk20=
00@gmail.com" target=3D"_blank">yaroshchuk2000@gmail.com</a>&gt;<br>
&gt; ---<br>
<br>
While I&#39;m not the best for reviewing the overall series, I can at<br>
least comment on the proposed QAPI changes:<br>
<br>
&gt; +++ b/qapi/net.json<br>
&gt; @@ -452,6 +452,89 @@<br>
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
&gt; +# Allows the vmnet interface to communicate with<br>
&gt; +# other vmnet interfaces that are in host mode and also with the nati=
ve host.<br>
&gt; +#<br>
&gt; +# @dhcpstart: The starting IPv4 address to use for the interface. Mus=
t be in the<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0private IP range (RF=
C 1918). Must be specified along<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with @dhcpend and @s=
ubnetmask.<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This address is used=
 as the gateway address. The subsequent address<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0up to and including =
dhcpend are placed in the DHCP pool.<br>
<br>
Long lines.=C2=A0 Most of the qapi docs wrap around 70 or so columns rather=
<br>
than pushing right up to the 80 column limit.<br>
<br>
&gt; +#<br>
&gt; +# @dhcpend: The DHCP IPv4 range end address to use for the interface.=
 Must be in<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the private IP range (RFC 1=
918). Must be specified along<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with @dhcpstart and @subnet=
mask.<br>
&gt; +#<br>
&gt; +# @subnetmask: The IPv4 subnet mask to use on the interface. Must be =
specified<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 along with @dhcpsta=
rt and @subnetmask.<br>
&gt; +#<br>
&gt; +#<br>
&gt; +# Since: 6.2,<br>
<br>
Drop the trailing comma<br>
<br>
&gt; +##<br>
&gt; +{ &#39;struct&#39;: &#39;NetdevVmnetHostOptions&#39;,<br>
&gt; +=C2=A0 &#39;data&#39;: {<br>
&gt; +=C2=A0 =C2=A0 &#39;*dhcpstart&#39;:=C2=A0 =C2=A0&#39;str&#39;,<br>
&gt; +=C2=A0 =C2=A0 &#39;*dhcpend&#39;:=C2=A0 =C2=A0 =C2=A0&#39;str&#39;,<b=
r>
&gt; +=C2=A0 =C2=A0 &#39;*subnetmask&#39;:=C2=A0 &#39;str&#39;<br>
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
&gt; +# Internet through a network address translator (NAT). The vmnet inte=
rface<br>
&gt; +# can also communicate with the native host. By default, the vmnet in=
terface<br>
&gt; +# is able to communicate with other shared mode interfaces. If a subn=
et range<br>
&gt; +# is specified, the vmnet interface can communicate with other shared=
 mode<br>
&gt; +# interfaces on the same subnet.<br>
&gt; +#<br>
&gt; +# @dhcpstart: The starting IPv4 address to use for the interface. Mus=
t be in the<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0private IP range (RF=
C 1918). Must be specified along<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with @dhcpend and @s=
ubnetmask.<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This address is used=
 as the gateway address. The subsequent address<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0up to and including =
dhcpend are=C2=A0 placed in the DHCP pool.<br>
<br>
extra space<br>
<br>
&gt; +#<br>
&gt; +# @dhcpend: The DHCP IPv4 range end address to use for the interface.=
 Must be in<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the private IP range (RFC 1=
918). Must be specified along<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with @dhcpstart and @subnet=
mask.<br>
&gt; +#<br>
&gt; +# @subnetmask: The IPv4 subnet mask to use on the interface. Must be =
specified<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 along with @dhcpsta=
rt and @subnetmask.<br>
&gt; +#<br>
&gt; +#<br>
&gt; +# Since: 6.2,<br>
<br>
Another odd comma<br>
<br>
&gt; +##<br>
&gt; +{ &#39;struct&#39;: &#39;NetdevVmnetSharedOptions&#39;,<br>
&gt; +=C2=A0 &#39;data&#39;: {<br>
&gt; +=C2=A0 =C2=A0 &#39;*dhcpstart&#39;:=C2=A0 =C2=A0 &#39;str&#39;,<br>
&gt; +=C2=A0 =C2=A0 &#39;*dhcpend&#39;:=C2=A0 =C2=A0 =C2=A0 &#39;str&#39;,<=
br>
&gt; +=C2=A0 =C2=A0 &#39;*subnetmask&#39;:=C2=A0 =C2=A0&#39;str&#39;<br>
&gt; +=C2=A0 },<br>
&gt; +=C2=A0 &#39;if&#39;: &#39;CONFIG_VMNET&#39; }<br>
<br>
The NetdevVmnetHostOptions and NetdevVmnetSharedOptions types are<br>
identical; why do you need two types?<br>
<br></blockquote><div>The NetdevVmnetHostOptions and NetdevVmnetSharedOptio=
ns=C2=A0have differences in other non-implemented options, such as IPv6 pre=
fix configuring only for `vmnet-shared`, and=C2=A0=C2=A0subnets isolation b=
y assigning them UUIDs for `vmnet-host`. I have plans about implementing th=
ese features in the near future. Separated options objects were=C2=A0create=
d because of this.</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
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
&gt; +# Since: 6.2<br>
&gt; +##<br>
&gt; +{ &#39;struct&#39;: &#39;NetdevVmnetBridgedOptions&#39;,<br>
&gt; +=C2=A0 &#39;data&#39;: { &#39;ifname&#39;: &#39;str&#39; },<br>
&gt; +=C2=A0 &#39;if&#39;: &#39;CONFIG_VMNET&#39; }<br>
&gt; +<br>
&gt;=C2=A0 ##<br>
&gt;=C2=A0 # @NetClientDriver:<br>
&gt;=C2=A0 #<br>
&gt; @@ -460,10 +543,16 @@<br>
&gt;=C2=A0 # Since: 2.7<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 @vhost-vdpa since 5.1<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 @vmnet-host since 6.2<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 @vmnet-shared since 6.2<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 @vmnet-bridged since 6.2<br>
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
&gt; @@ -477,6 +566,9 @@<br>
&gt;=C2=A0 # Since: 1.2<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;l2tpv3&#39; - since 2.1<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;vmnet-host&#39; - since 6.2<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;vmnet-shared&#39; - since 6.2<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;vmnet-bridged&#39; - since 6.2<br>
&gt;=C2=A0 ##<br>
&gt;=C2=A0 { &#39;union&#39;: &#39;Netdev&#39;,<br>
&gt;=C2=A0 =C2=A0 &#39;base&#39;: { &#39;id&#39;: &#39;str&#39;, &#39;type&=
#39;: &#39;NetClientDriver&#39; },<br>
&gt; @@ -492,7 +584,10 @@<br>
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
&gt; +=C2=A0 =C2=A0 &#39;vmnet-host&#39;: &#39;NetdevVmnetHostOptions&#39;,=
<br>
&gt; +=C2=A0 =C2=A0 &#39;vmnet-shared&#39;: &#39;NetdevVmnetSharedOptions&#=
39;,<br>
<br>
If you only declare one type instead of two above, then both these<br>
branches can use that same type.<br>
<br>
&gt; +=C2=A0 =C2=A0 &#39;vmnet-bridged&#39;: &#39;NetdevVmnetBridgedOptions=
&#39; } }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 ##<br>
&gt;=C2=A0 # @RxState:<br>
&gt; -- <br>
&gt; 2.23.0<br>
&gt; <br>
&gt; <br>
<br>
-- <br>
Eric Blake, Principal Software Engineer<br>
Red Hat, Inc.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+1-919-301-3266<br>
Virtualization:=C2=A0 <a href=3D"http://qemu.org" rel=3D"noreferrer" target=
=3D"_blank">qemu.org</a> | <a href=3D"http://libvirt.org" rel=3D"noreferrer=
" target=3D"_blank">libvirt.org</a><br>
<br></blockquote><div>=C2=A0</div><div>Best Regards,</div><div>Vladislav Ya=
roshchuk</div><div><br></div></div></div>

--00000000000061de2705ce251d31--

