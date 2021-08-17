Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C7C3EE9D7
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 11:29:49 +0200 (CEST)
Received: from localhost ([::1]:60674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFvPo-0006V3-F0
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 05:29:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mFvOW-00053X-5I
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 05:28:28 -0400
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c]:39498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mFvOP-0006go-Fz
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 05:28:27 -0400
Received: by mail-ua1-x92c.google.com with SMTP id a4so8744031uae.6
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 02:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/YwzYHizyS2FJY/mjGMDdrJqf0+FZ5O5eMVi6gzpk9c=;
 b=t5L/Vc2VTE161UozCdl17ZwsA2Hp8S4Y9kaJMsSSpnNiNADbN9pZ34EHyz8poi4E/n
 vsAjLkSem8oFKkbYKys78qltVijXI9kEGdelpk4faVmnPv1mKDBTHPiESZrKwRwk29Kv
 HYTLUf4NyJUlzygAs9kRO5JxWTi3pANYIVT0T87rnEAmt0Vl7l04M7Ibt6bK8TUmnUgu
 D3UBrNXwgjAwZ6mKG+naZbx6ZeWMuBe88paPcN4I1c7JwzB8q5BgXBZZNIIR17UMkBM6
 I2DhcrEsohye2q3BC/55Ad4ccSd7LfARW+PXKdqdD8j3+/vdY/isAnGJ4stoxIeEMajH
 j0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/YwzYHizyS2FJY/mjGMDdrJqf0+FZ5O5eMVi6gzpk9c=;
 b=hU2e6E+061eFe6fu1W7j/D/zpu0h0EoC6w6gqrvR53dFMlY5a7XtafeRyEQMerQEsU
 HUNkEFdC0MqWNgpdtTxvWsi08lXeEfhU/bEZTLbvrQBtlE93joTJY6XSGy72YOAS4uCP
 tvR0dDzcYVJQlayu+3747DXxxiw62+DBaYmPvrX+9qEt6JpmcMQly97LKjbGFzc87rPx
 plz34BNHEE724cWyzo7S1e1BlL55reDzuha4hk1hW+//nap+6CGegOdmGGbzfzDhLdfF
 dcIZEpKU2xxVyXQAER9oOqmjPmbo9Vip8aVCA0dZZAYA7soiwzwdaLPJI2QNCW016ipk
 3uSA==
X-Gm-Message-State: AOAM531rVCCSAHE6pGenLrvaheh4dwEebbZKKpL7piLoqxQWclU45x87
 6blhbhGxt+wnQxiwBSqMGG63eZBAS1KBuK9QMkA=
X-Google-Smtp-Source: ABdhPJyqOcq8Udodj7PMK+OYBlu5T1jOwwfJc/DssbGwKmUPq6hDx8OQFaY7ockc9y/krC4FwInjt6RAyF62wNn7qFo=
X-Received: by 2002:ab0:1865:: with SMTP id j37mr1330280uag.6.1629192499849;
 Tue, 17 Aug 2021 02:28:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210617143246.55336-1-yaroshchuk2000@gmail.com>
 <20210617143246.55336-3-yaroshchuk2000@gmail.com>
 <20210806211927.dvsn7xvy2ghmonip@redhat.com>
In-Reply-To: <20210806211927.dvsn7xvy2ghmonip@redhat.com>
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Date: Tue, 17 Aug 2021 12:28:09 +0300
Message-ID: <CADO9X9T=BOUZf+8nz5khmNbggQXBLwR5WdVFsDmqxTXusYnC8g@mail.gmail.com>
Subject: Re: [PATCH 2/7] net/vmnet: add new netdevs to qapi/net
To: Eric Blake <eblake@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000039702105c9bdf0ed"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-ua1-x92c.google.com
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

--00000000000039702105c9bdf0ed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Eric,
Thank you for your review.

=D1=81=D0=B1, 7 =D0=B0=D0=B2=D0=B3. 2021 =D0=B3. =D0=B2 00:19, Eric Blake <=
eblake@redhat.com>:

> On Thu, Jun 17, 2021 at 05:32:41PM +0300, Vladislav Yaroshchuk wrote:
> > Created separate netdev per each vmnet operating mode
> > because they use quite different settings. Especially since
> > macOS 11.0 (vmnet.framework API gets lots of updates)
> >
> > Three new netdevs are added:
> > - vmnet-host
> > - vmnet-shared
> > - vmnet-bridged
> >
> > Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> > ---
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
> > +#             up to and including dhcpend are  placed in the DHCP pool=
.
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
> > +# Since: 6.1,
> > +##
>
> Same comments about 6.1 vs. 6.2 as before (I'll quit pointing it out).
> Spurious trailing comma.
>
> > +{ 'struct': 'NetdevVmnetHostOptions',
> > +  'data': {
> > +    '*dhcpstart':   'str',
> > +    '*dhcpend':     'str',
> > +    '*subnetmask':  'str'
>
> Hmm. You listed all three as optional, but document that they must all
> be specified together.  Why not just make them all required, and
> simplify the documentation?
>
> All three options can be not specified at all, or, if specified, must be
used all together. It's the user's choice to adjust DHCP settings or leave
it for vmnet.framework.
`-netdev vmnet-host` is correct and `-netdev
vmnet-host,dhcpstart=3D"..",dhcpend=3D"..",subnetmask=3D".."` is correct to=
o. So
we can't make all the options required

> > +  },
> > +  'if': 'defined(CONFIG_VMNET)' }
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
> Spurious double space.
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
> > +# Since: 6.1,
> > +##
> > +{ 'struct': 'NetdevVmnetSharedOptions',
> > +  'data': {
> > +    '*dhcpstart':    'str',
> > +    '*dhcpend':      'str',
> > +    '*subnetmask':   'str'
> > +  },
> > +  'if': 'defined(CONFIG_VMNET)' }
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
> > +# Since: 6.1
> > +##
> > +{ 'struct': 'NetdevVmnetBridgedOptions',
> > +  'data': { 'ifname': 'str' },
> > +  'if': 'defined(CONFIG_VMNET)' }
> > +
> >  ##
> >  # @NetClientDriver:
> >  #
> > @@ -460,11 +543,16 @@
> >  # Since: 2.7
> >  #
> >  #        @vhost-vdpa since 5.1
> > -#        @vmnet since 6.1
>
> Why are you dropping vmnet?  Especially since you just added it in the
> previous patch?  That feels like needless churn.
>
> Yep, that was my mistake, on that stage I decided to create separate
backends for each vmnet operational mode. Will remove redundant change the
next series.

> +#        @vmnet-host since 6.1
> > +#        @vmnet-shared since 6.1
> > +#        @vmnet-bridged since 6.1
> >  ##
> >  { 'enum': 'NetClientDriver',
> >    'data': [ 'none', 'nic', 'user', 'tap', 'l2tpv3', 'socket', 'vde',
> > -            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa',
> 'vmnet' ] }
> > +            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa',
> > +            { 'name': 'vmnet-host', 'if': 'defined(CONFIG_VMNET)' },
> > +            { 'name': 'vmnet-shared', 'if': 'defined(CONFIG_VMNET)' },
> > +            { 'name': 'vmnet-bridged', 'if': 'defined(CONFIG_VMNET)' }=
]
> }
>
> --
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3266
> Virtualization:  qemu.org | libvirt.org
>
>
Will fix all other issues asap, thank you!

Regards,
Vladislav

--00000000000039702105c9bdf0ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Eric,</div><div>Thank you for your review.</div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=D1=81=
=D0=B1, 7 =D0=B0=D0=B2=D0=B3. 2021 =D0=B3. =D0=B2 00:19, Eric Blake &lt;<a =
href=3D"mailto:eblake@redhat.com">eblake@redhat.com</a>&gt;:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">On Thu, Jun 17, 2021 at 05:32:=
41PM +0300, Vladislav Yaroshchuk wrote:<br>
&gt; Created separate netdev per each vmnet operating mode<br>
&gt; because they use quite different settings. Especially since<br>
&gt; macOS 11.0 (vmnet.framework API gets lots of updates)<br>
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
dhcpend are=C2=A0 placed in the DHCP pool.<br>
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
&gt; +# Since: 6.1,<br>
&gt; +##<br>
<br>
Same comments about 6.1 vs. 6.2 as before (I&#39;ll quit pointing it out).<=
br>
Spurious trailing comma.<br>
<br>
&gt; +{ &#39;struct&#39;: &#39;NetdevVmnetHostOptions&#39;,<br>
&gt; +=C2=A0 &#39;data&#39;: {<br>
&gt; +=C2=A0 =C2=A0 &#39;*dhcpstart&#39;:=C2=A0 =C2=A0&#39;str&#39;,<br>
&gt; +=C2=A0 =C2=A0 &#39;*dhcpend&#39;:=C2=A0 =C2=A0 =C2=A0&#39;str&#39;,<b=
r>
&gt; +=C2=A0 =C2=A0 &#39;*subnetmask&#39;:=C2=A0 &#39;str&#39;<br>
<br>
Hmm. You listed all three as optional, but document that they must all<br>
be specified together.=C2=A0 Why not just make them all required, and<br>
simplify the documentation?<br>
<br></blockquote><div>All three options can be not specified=C2=A0at all, o=
r, if specified, must be used all together. It&#39;s the user&#39;s choice =
to adjust DHCP settings or leave it for vmnet.framework.</div><div>`-netdev=
 vmnet-host` is correct and `-netdev vmnet-host,dhcpstart=3D&quot;..&quot;,=
dhcpend=3D&quot;..&quot;,subnetmask=3D&quot;..&quot;` is correct too. So we=
 can&#39;t make all the options required</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
&gt; +=C2=A0 },<br>
&gt; +=C2=A0 &#39;if&#39;: &#39;defined(CONFIG_VMNET)&#39; }<br>
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
Spurious double space.<br>
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
&gt; +# Since: 6.1,<br>
&gt; +##<br>
&gt; +{ &#39;struct&#39;: &#39;NetdevVmnetSharedOptions&#39;,<br>
&gt; +=C2=A0 &#39;data&#39;: {<br>
&gt; +=C2=A0 =C2=A0 &#39;*dhcpstart&#39;:=C2=A0 =C2=A0 &#39;str&#39;,<br>
&gt; +=C2=A0 =C2=A0 &#39;*dhcpend&#39;:=C2=A0 =C2=A0 =C2=A0 &#39;str&#39;,<=
br>
&gt; +=C2=A0 =C2=A0 &#39;*subnetmask&#39;:=C2=A0 =C2=A0&#39;str&#39;<br>
&gt; +=C2=A0 },<br>
&gt; +=C2=A0 &#39;if&#39;: &#39;defined(CONFIG_VMNET)&#39; }<br>
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
&gt; +# Since: 6.1<br>
&gt; +##<br>
&gt; +{ &#39;struct&#39;: &#39;NetdevVmnetBridgedOptions&#39;,<br>
&gt; +=C2=A0 &#39;data&#39;: { &#39;ifname&#39;: &#39;str&#39; },<br>
&gt; +=C2=A0 &#39;if&#39;: &#39;defined(CONFIG_VMNET)&#39; }<br>
&gt; +<br>
&gt;=C2=A0 ##<br>
&gt;=C2=A0 # @NetClientDriver:<br>
&gt;=C2=A0 #<br>
&gt; @@ -460,11 +543,16 @@<br>
&gt;=C2=A0 # Since: 2.7<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 @vhost-vdpa since 5.1<br>
&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0 @vmnet since 6.1<br>
<br>
Why are you dropping vmnet?=C2=A0 Especially since you just added it in the=
<br>
previous patch?=C2=A0 That feels like needless churn.<br>
<br></blockquote><div>Yep, that was my mistake, on that stage I decided to =
create separate backends for each vmnet operational mode. Will remove redun=
dant=C2=A0change the next series.</div><div><br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 @vmnet-host since 6.1<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 @vmnet-shared since 6.1<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 @vmnet-bridged since 6.1<br>
&gt;=C2=A0 ##<br>
&gt;=C2=A0 { &#39;enum&#39;: &#39;NetClientDriver&#39;,<br>
&gt;=C2=A0 =C2=A0 &#39;data&#39;: [ &#39;none&#39;, &#39;nic&#39;, &#39;use=
r&#39;, &#39;tap&#39;, &#39;l2tpv3&#39;, &#39;socket&#39;, &#39;vde&#39;,<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;bridge&#39;, &#39;hubp=
ort&#39;, &#39;netmap&#39;, &#39;vhost-user&#39;, &#39;vhost-vdpa&#39;, &#3=
9;vmnet&#39; ] }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;bridge&#39;, &#39;hubp=
ort&#39;, &#39;netmap&#39;, &#39;vhost-user&#39;, &#39;vhost-vdpa&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &#39;name&#39;: &#39;vmne=
t-host&#39;, &#39;if&#39;: &#39;defined(CONFIG_VMNET)&#39; },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &#39;name&#39;: &#39;vmne=
t-shared&#39;, &#39;if&#39;: &#39;defined(CONFIG_VMNET)&#39; },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &#39;name&#39;: &#39;vmne=
t-bridged&#39;, &#39;if&#39;: &#39;defined(CONFIG_VMNET)&#39; }] }<br>
<br>
-- <br>
Eric Blake, Principal Software Engineer<br>
Red Hat, Inc.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+1-919-301-3266<br>
Virtualization:=C2=A0 <a href=3D"http://qemu.org" rel=3D"noreferrer" target=
=3D"_blank">qemu.org</a> | <a href=3D"http://libvirt.org" rel=3D"noreferrer=
" target=3D"_blank">libvirt.org</a><br>
<br></blockquote><div><br></div><div>Will fix all other issues asap, thank =
you!</div><div>=C2=A0</div><div>Regards,</div><div>Vladislav</div></div></d=
iv>

--00000000000039702105c9bdf0ed--

