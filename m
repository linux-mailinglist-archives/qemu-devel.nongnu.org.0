Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E7831018D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 01:26:31 +0100 (CET)
Received: from localhost ([::1]:39854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7oxC-0002C7-36
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 19:26:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phillip.ennen@gmail.com>)
 id 1l7owI-0001dG-4R
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 19:25:34 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:51442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phillip.ennen@gmail.com>)
 id 1l7owE-00088p-BV
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 19:25:33 -0500
Received: by mail-pj1-x102c.google.com with SMTP id fa16so2230880pjb.1
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 16:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yhq6nyp8mJUGJ8gSIuE0jFQ9lgf56BdS5D/OT2ntMEg=;
 b=St5xbT4CDmXVYy0rUln0mhki2zJcvi5X9+dKRwJHpjmMBTp73xEOOBsjydgIwwLQ+r
 LQoBYmSlijV53F/EZE/dwU1g4XG3LcWT/ubwyqc77t4JZ+PipLyfS0r6ZklEWSgM2MQU
 ueiG+rjFYCVEcI/8nwxel2SxvBfCo6vC1IYl90sXk8qAKRk75DB/rEfPRjqKZfVDjPF/
 4w0qyBXYm4rusKozwftMK/rIyjxCwhO/4kIqYaAwG3m5gbipqfSRcwDqkRmDHe/X3KS8
 NvL00Tn5Olbz29CYBfMETcew83ZCapQj7M4dow0U9Ds4b8r9B8KxWvTVLm383DMZBfh8
 wUHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yhq6nyp8mJUGJ8gSIuE0jFQ9lgf56BdS5D/OT2ntMEg=;
 b=MvbSESm/u69uthHAq2yoQ8rDw2r/f4hMIWiGlrk0ZUH5ueyJRuB+z11X1L9CjMKhNW
 lYFdGUXqMOHIRjv3WendlEPHBN0EHOtPF4bnqghrwK1dfCe0j7j/+ai8xeTTWFAbUFdQ
 Cuf6dblRkUg0bwdYgrhZFCeXCdcw08IbvFTX8cIOL0MVLKmweFQCnIUGEH/6TpE26HlX
 wp9ccG5vaEzpIQhPNgApEWVSd2cFllQviiiZBqTz9xnBLYN0lFuehjOgPjMAGg3u9W41
 WFFYCN04tyn5oKUDfPUDfgz8oTASIy39lwcdBNNQOQgNcM1PtJG0eIqO7u3/vd+Ok8v8
 jllg==
X-Gm-Message-State: AOAM532F8FqU3bRR9kLxmJcci/TUBv9J2JETNk/3bYX1bYLRrH+kqw5S
 tBwYVLddeHUp3MRBUY9It04Bj+Vk1I3/bgpskd0=
X-Google-Smtp-Source: ABdhPJwDIXBHZe55IExiirIbKRGBKwrjCyyxjkwCsILcAuXGPlktSo3+0TJphmD5giqEpvvUsrMb3BAtLbqjilywU0w=
X-Received: by 2002:a17:903:4111:b029:e2:843c:42d4 with SMTP id
 r17-20020a1709034111b02900e2843c42d4mr1729642pld.45.1612484728638; Thu, 04
 Feb 2021 16:25:28 -0800 (PST)
MIME-Version: 1.0
References: <20210204162544.65439-1-phillip.ennen@gmail.com>
 <20210204162544.65439-3-phillip.ennen@gmail.com>
 <bfa145d6-648a-8b01-03ba-cd64ba082c69@redhat.com>
In-Reply-To: <bfa145d6-648a-8b01-03ba-cd64ba082c69@redhat.com>
From: Phillip Tennen <phillip.ennen@gmail.com>
Date: Fri, 5 Feb 2021 01:25:17 +0100
Message-ID: <CAAi_9z5JTvEfoNbGx2XtEjRqTPvTUbZt9SGqgcYtCN90VLh7Ug@mail.gmail.com>
Subject: Re: [PATCH 2/2] net: implement vmnet-based netdev
To: Eric Blake <eblake@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000074cff805ba8bdb3b"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=phillip.ennen@gmail.com; helo=mail-pj1-x102c.google.com
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>, jasowang@redhat.com,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Phillip Tennen <phillip@axleos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000074cff805ba8bdb3b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks very much for taking a look!

As per my understanding of the submission process, I will resubmit this
patchset (sans my self-introduction =3D) )
in a new [PATCH v2] thread, incorporating the changes you pointed out here.

> Adding Markus in cc; right now, I don't think QAPI supports a union type
> as a branch to another union type. There's nothing that technically
> would prevent us from doing that, just the grunt work of modifying the
> QAPI code generator to support it.

I'm unfamiliar with the QAPI codegen and what it supports~
The `mode` param is shared by all three mode types. Thus,
could I make the `NetdevVmnetOptions` contain a mode field
and a mode-specific union of options, to avoid the direct union-union
nesting?

Phillip

On Thu, Feb 4, 2021 at 8:51 PM Eric Blake <eblake@redhat.com> wrote:

> On 2/4/21 10:25 AM, phillip.ennen@gmail.com wrote:
> > From: Phillip Tennen <phillip@axleos.com>
> >
> > This patch implements a new netdev device, reachable via -netdev
> > vmnet-macos, that=E2=80=99s backed by macOS=E2=80=99s vmnet framework.
> >
> > The vmnet framework provides native bridging support, and its usage in
> > this patch is intended as a replacement for attempts to use a tap devic=
e
> > via the tuntaposx kernel extension. Notably, the tap/tuntaposx approach
> > never would have worked in the first place, as QEMU interacts with the
> > tap device via poll(), and macOS does not support polling device files.
> >
>
> > This is my first QEMU contribution, so please feel free to let me know
> > what I=E2=80=99ve missed or what needs improving. Thanks very much for =
taking a
> > look =3D)
>
> This paragraph would fit better...
>
> >
> > Signed-off-by: Phillip Tennen <phillip@axleos.com>
> > ---
>
> ...here, after the --- marker.  It's useful to the reviewer (and welcome
> to the community, by the way!), but does not need to be enshrined in git
> history.
>
> >  configure         |   2 +-
> >  net/clients.h     |   6 +
> >  net/meson.build   |   1 +
> >  net/net.c         |   3 +
> >  net/vmnet-macos.c | 444 ++++++++++++++++++++++++++++++++++++++++++++++
> >  qapi/net.json     |  64 ++++++-
> >  qemu-options.hx   |   9 +
>
> I'm focusing mainly on the UI aspects, and did not look closely at the
> rest.
>
> > +++ b/qapi/net.json
> > @@ -450,6 +450,65 @@
> >      '*vhostdev':     'str',
> >      '*queues':       'int' } }
> >
> > +##
> > +# @VmnetOperatingMode:
> > +#
> > +# An enumeration of the I/O operation types
> > +#
> > +# @host: the guest may communicate with the host
> > +#        and other guest network interfaces
> > +#
> > +# @shared: the guest may reach the Internet through a NAT,
> > +#          and may communicate with the host and other guest
> > +#          network interfaces
> > +#
> > +# @bridged: the guest's traffic is bridged with a
> > +#           physical network interface of the host
> > +#
> > +# Since: 5.3
>
> The next release will be 6.0, not 5.3.
>
> > +##
> > +{ 'enum': 'VmnetOperatingMode',
> > +  'data': [ 'host', 'shared', 'bridged' ] }
> > +
> > +##
> > +# @NetdevVmnetOptions:
> > +#
> > +# vmnet network backend (only available on macOS)
> > +#
> > +# @mode: the operating mode vmnet should run in
> > +#
> > +# @ifname: the physical network interface to bridge with
> > +#          (only valid with mode=3Dbridged)
>
> If this is only valid with bridged, then you should use a union type,
> where only the bridged branch supports this member.  That is more
> typesafe than always supporting it in the schema and having to
> semantically filter it out after the fact.
>
> > +#
> > +# @dhcp_start_address: the gateway address to use for the interface.
>
> New QAPI additions should favor names with '-' rather than '_', as in
> dhcp-start-address; the exception is if you are closely copying another
> older interface that already used _.
>
> > +#                      The range to dhcp_end_address is placed in the
> DHCP pool.
> > +#                      (only valid with mode=3Dhost|shared)
> > +#                      (must be specified with dhcp_end_address and
> > +#                       dhcp_subnet_mask)
> > +#                      (allocated automatically if unset)
> > +#
> > +# @dhcp_end_address: the DHCP IPv4 range end address to use for the
> interface.
> > +#                      (only valid with mode=3Dhost|shared)
> > +#                      (must be specified with dhcp_start_address and
> > +#                       dhcp_subnet_mask)
> > +#                      (allocated automatically if unset)
> > +#
> > +# @dhcp_subnet_mask: the IPv4 subnet mask (string) to use on the
> interface.
> > +#                    (only valid with mode=3Dhost|shared)
> > +#                    (must be specified with dhcp_start_address and
> > +#                     dhcp_end_address)
> > +#                    (allocated automatically if unset)
> > +#
> > +# Since: 5.3
>
> 6.0
>
> > +##
> > +{ 'struct': 'NetdevVmnetOptions',
> > +  'data': {
> > +    'mode':        'VmnetOperatingMode',
> > +    '*ifname':        'str',
> > +    '*dhcp_start_address':      'str',
> > +    '*dhcp_end_address':        'str',
> > +    '*dhcp_subnet_mask':        'str' } }
>
> In addition to my suggestion of making this a union rather than a
> struct, you probably also want to include an 'if' tag so that the struct
> is present only on MacOS builds (it's nicer for introspection to not
> advertise something that won't work).
>
> > +
> >  ##
> >  # @NetClientDriver:
> >  #
> > @@ -461,7 +520,7 @@
> >  ##
> >  { 'enum': 'NetClientDriver',
> >    'data': [ 'none', 'nic', 'user', 'tap', 'l2tpv3', 'socket', 'vde',
> > -            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa' =
]
> }
> > +            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa',
> 'vmnet-macos' ] }
>
> Missing a doc mention that 'vmnet-macos' is new to 6.0.
>
> >
> >  ##
> >  # @Netdev:
> > @@ -490,7 +549,8 @@
> >      'hubport':  'NetdevHubPortOptions',
> >      'netmap':   'NetdevNetmapOptions',
> >      'vhost-user': 'NetdevVhostUserOptions',
> > -    'vhost-vdpa': 'NetdevVhostVDPAOptions' } }
> > +    'vhost-vdpa': 'NetdevVhostVDPAOptions',
> > +    'vmnet-macos': 'NetdevVmnetOptions' } }
>
> Adding Markus in cc; right now, I don't think QAPI supports a union type
> as a branch to another union type. There's nothing that technically
> would prevent us from doing that, just the grunt work of modifying the
> QAPI code generator to support it.
>
> >
> >  ##
> >  # @NetFilterDirection:
> > diff --git a/qemu-options.hx b/qemu-options.hx
> > index 9172d51659..ec6b40b079 100644
> > --- a/qemu-options.hx
> > +++ b/qemu-options.hx
> > @@ -2483,6 +2483,15 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
> >  #ifdef __linux__
> >      "-netdev vhost-vdpa,id=3Dstr,vhostdev=3D/path/to/dev\n"
> >      "                configure a vhost-vdpa network,Establish a
> vhost-vdpa netdev\n"
> > +#endif
> > +#ifdef CONFIG_DARWIN
> > +    "-netdev vmnet-macos,id=3Dstr,mode=3Dbridged[,ifname=3Difname]\n"
> > +    "         configure a macOS-provided vmnet network in \"physical
> interface bridge\" mode\n"
> > +    "         the physical interface to bridge with defaults to en0 if
> unspecified\n"
> > +    "-netdev vmnet-macos,id=3Dstr,mode=3Dhost|shared\n"
> > +    "
>  [,dhcp_start_address=3Daddr,dhcp_end_address=3Daddr,dhcp_subnet_mask=3Dm=
ask]\n"
> > +    "         configure a macOS-provided vmnet network in \"host\" or
> \"shared\" mode\n"
> > +    "         the DHCP configuration will be set automatically if
> unspecified\n"
> >  #endif
> >      "-netdev hubport,id=3Dstr,hubid=3Dn[,netdev=3Dnd]\n"
> >      "                configure a hub port on the hub with ID 'n'\n",
> QEMU_ARCH_ALL)
> >
>
> --
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3226
> Virtualization:  qemu.org | libvirt.org
>
>

--00000000000074cff805ba8bdb3b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Thanks =
very much for taking a look!=C2=A0<div><br><div>As per my understanding of =
the submission process, I will resubmit this patchset (sans my self-introdu=
ction =3D) )</div><div>in a new [PATCH v2] thread, incorporating the change=
s you pointed out here.</div></div><div><br></div>&gt; Adding Markus in cc;=
 right now, I don&#39;t think QAPI supports a union type<br>&gt; as a branc=
h to another union type. There&#39;s nothing that technically<br>&gt; would=
 prevent us from doing that, just the grunt work of modifying the<br>&gt; Q=
API code generator to support it.</div><div dir=3D"ltr"><br></div><div>I&#3=
9;m unfamiliar with the QAPI codegen and what it supports~=C2=A0</div><div>=
The `mode` param is shared by all three mode types. Thus,=C2=A0</div><div>c=
ould I make the `NetdevVmnetOptions` contain a mode field</div><div>and a m=
ode-specific union of options, to avoid the direct union-union=C2=A0</div><=
div>nesting?</div><div><br></div><div>Phillip</div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 4, 2021 at 8:51 PM=
 Eric Blake &lt;<a href=3D"mailto:eblake@redhat.com">eblake@redhat.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-colo=
r:rgb(204,204,204);padding-left:1ex">On 2/4/21 10:25 AM, <a href=3D"mailto:=
phillip.ennen@gmail.com" target=3D"_blank">phillip.ennen@gmail.com</a> wrot=
e:<br>
&gt; From: Phillip Tennen &lt;<a href=3D"mailto:phillip@axleos.com" target=
=3D"_blank">phillip@axleos.com</a>&gt;<br>
&gt; <br>
&gt; This patch implements a new netdev device, reachable via -netdev<br>
&gt; vmnet-macos, that=E2=80=99s backed by macOS=E2=80=99s vmnet framework.=
<br>
&gt; <br>
&gt; The vmnet framework provides native bridging support, and its usage in=
<br>
&gt; this patch is intended as a replacement for attempts to use a tap devi=
ce<br>
&gt; via the tuntaposx kernel extension. Notably, the tap/tuntaposx approac=
h<br>
&gt; never would have worked in the first place, as QEMU interacts with the=
<br>
&gt; tap device via poll(), and macOS does not support polling device files=
.<br>
&gt; <br>
<br>
&gt; This is my first QEMU contribution, so please feel free to let me know=
<br>
&gt; what I=E2=80=99ve missed or what needs improving. Thanks very much for=
 taking a<br>
&gt; look =3D)<br>
<br>
This paragraph would fit better...<br>
<br>
&gt; <br>
&gt; Signed-off-by: Phillip Tennen &lt;<a href=3D"mailto:phillip@axleos.com=
" target=3D"_blank">phillip@axleos.com</a>&gt;<br>
&gt; ---<br>
<br>
...here, after the --- marker.=C2=A0 It&#39;s useful to the reviewer (and w=
elcome<br>
to the community, by the way!), but does not need to be enshrined in git<br=
>
history.<br>
<br>
&gt;=C2=A0 configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br=
>
&gt;=C2=A0 net/clients.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +<br>
&gt;=C2=A0 net/meson.build=C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 net/net.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 net/vmnet-macos.c | 444 ++++++++++++++++++++++++++++++++++++++++=
++++++<br>
&gt;=C2=A0 qapi/net.json=C2=A0 =C2=A0 =C2=A0|=C2=A0 64 ++++++-<br>
&gt;=C2=A0 qemu-options.hx=C2=A0 =C2=A0|=C2=A0 =C2=A09 +<br>
<br>
I&#39;m focusing mainly on the UI aspects, and did not look closely at the =
rest.<br>
<br>
&gt; +++ b/qapi/net.json<br>
&gt; @@ -450,6 +450,65 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &#39;*vhostdev&#39;:=C2=A0 =C2=A0 =C2=A0&#39;str&#=
39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &#39;*queues&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;=
int&#39; } }<br>
&gt;=C2=A0 <br>
&gt; +##<br>
&gt; +# @VmnetOperatingMode:<br>
&gt; +#<br>
&gt; +# An enumeration of the I/O operation types<br>
&gt; +#<br>
&gt; +# @host: the guest may communicate with the host <br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 and other guest network interfaces<br>
&gt; +#<br>
&gt; +# @shared: the guest may reach the Internet through a NAT, <br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 and may communicate with the host=
 and other guest <br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 network interfaces<br>
&gt; +#<br>
&gt; +# @bridged: the guest&#39;s traffic is bridged with a <br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0physical network interface =
of the host<br>
&gt; +#<br>
&gt; +# Since: 5.3<br>
<br>
The next release will be 6.0, not 5.3.<br>
<br>
&gt; +##<br>
&gt; +{ &#39;enum&#39;: &#39;VmnetOperatingMode&#39;,<br>
&gt; +=C2=A0 &#39;data&#39;: [ &#39;host&#39;, &#39;shared&#39;, &#39;bridg=
ed&#39; ] }<br>
&gt; +<br>
&gt; +##<br>
&gt; +# @NetdevVmnetOptions:<br>
&gt; +#<br>
&gt; +# vmnet network backend (only available on macOS)<br>
&gt; +#<br>
&gt; +# @mode: the operating mode vmnet should run in<br>
&gt; +#<br>
&gt; +# @ifname: the physical network interface to bridge with <br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (only valid with mode=3Dbridged)<=
br>
<br>
If this is only valid with bridged, then you should use a union type,<br>
where only the bridged branch supports this member.=C2=A0 That is more<br>
typesafe than always supporting it in the schema and having to<br>
semantically filter it out after the fact.<br>
<br>
&gt; +#<br>
&gt; +# @dhcp_start_address: the gateway address to use for the interface. =
<br>
<br>
New QAPI additions should favor names with &#39;-&#39; rather than &#39;_&#=
39;, as in<br>
dhcp-start-address; the exception is if you are closely copying another<br>
older interface that already used _.<br>
<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 The range to dhcp_end_address is placed in the DHCP pool.<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (only valid with mode=3Dhost|shared)<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (must be specified with dhcp_end_address and <br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0dhcp_subnet_mask)<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (allocated automatically if unset)<br>
&gt; +#<br>
&gt; +# @dhcp_end_address: the DHCP IPv4 range end address to use for the i=
nterface. <br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (only valid with mode=3Dhost|shared)<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (must be specified with dhcp_start_address and <br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0dhcp_subnet_mask)<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (allocated automatically if unset)<br>
&gt; +#<br>
&gt; +# @dhcp_subnet_mask: the IPv4 subnet mask (string) to use on the inte=
rface.<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (only valid with mode=3Dhost|shared)<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (must be specified with dhcp_start_address and <br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dhcp_end_address)<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (allocated automatically if unset)<br>
&gt; +#<br>
&gt; +# Since: 5.3<br>
<br>
6.0<br>
<br>
&gt; +##<br>
&gt; +{ &#39;struct&#39;: &#39;NetdevVmnetOptions&#39;,<br>
&gt; +=C2=A0 &#39;data&#39;: {<br>
&gt; +=C2=A0 =C2=A0 &#39;mode&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;VmnetOp=
eratingMode&#39;,<br>
&gt; +=C2=A0 =C2=A0 &#39;*ifname&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;str&=
#39;,<br>
&gt; +=C2=A0 =C2=A0 &#39;*dhcp_start_address&#39;:=C2=A0 =C2=A0 =C2=A0 &#39=
;str&#39;,<br>
&gt; +=C2=A0 =C2=A0 &#39;*dhcp_end_address&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &#39;str&#39;,<br>
&gt; +=C2=A0 =C2=A0 &#39;*dhcp_subnet_mask&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &#39;str&#39; } }<br>
<br>
In addition to my suggestion of making this a union rather than a<br>
struct, you probably also want to include an &#39;if&#39; tag so that the s=
truct<br>
is present only on MacOS builds (it&#39;s nicer for introspection to not<br=
>
advertise something that won&#39;t work).<br>
<br>
&gt; +<br>
&gt;=C2=A0 ##<br>
&gt;=C2=A0 # @NetClientDriver:<br>
&gt;=C2=A0 #<br>
&gt; @@ -461,7 +520,7 @@<br>
&gt;=C2=A0 ##<br>
&gt;=C2=A0 { &#39;enum&#39;: &#39;NetClientDriver&#39;,<br>
&gt;=C2=A0 =C2=A0 &#39;data&#39;: [ &#39;none&#39;, &#39;nic&#39;, &#39;use=
r&#39;, &#39;tap&#39;, &#39;l2tpv3&#39;, &#39;socket&#39;, &#39;vde&#39;,<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;bridge&#39;, &#39;hubp=
ort&#39;, &#39;netmap&#39;, &#39;vhost-user&#39;, &#39;vhost-vdpa&#39; ] }<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;bridge&#39;, &#39;hubp=
ort&#39;, &#39;netmap&#39;, &#39;vhost-user&#39;, &#39;vhost-vdpa&#39;, &#3=
9;vmnet-macos&#39; ] }<br>
<br>
Missing a doc mention that &#39;vmnet-macos&#39; is new to 6.0.<br>
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 ##<br>
&gt;=C2=A0 # @Netdev:<br>
&gt; @@ -490,7 +549,8 @@<br>
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
&gt; +=C2=A0 =C2=A0 &#39;vmnet-macos&#39;: &#39;NetdevVmnetOptions&#39; } }=
<br>
<br>
Adding Markus in cc; right now, I don&#39;t think QAPI supports a union typ=
e<br>
as a branch to another union type. There&#39;s nothing that technically<br>
would prevent us from doing that, just the grunt work of modifying the<br>
QAPI code generator to support it.<br>
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 ##<br>
&gt;=C2=A0 # @NetFilterDirection:<br>
&gt; diff --git a/qemu-options.hx b/qemu-options.hx<br>
&gt; index 9172d51659..ec6b40b079 100644<br>
&gt; --- a/qemu-options.hx<br>
&gt; +++ b/qemu-options.hx<br>
&gt; @@ -2483,6 +2483,15 @@ DEF(&quot;netdev&quot;, HAS_ARG, QEMU_OPTION_ne=
tdev,<br>
&gt;=C2=A0 #ifdef __linux__<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;-netdev vhost-vdpa,id=3Dstr,vhostdev=3D/path=
/to/dev\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 configure a vhost-vdpa network,Establish a vhost-vdpa netdev\=
n&quot;<br>
&gt; +#endif<br>
&gt; +#ifdef CONFIG_DARWIN<br>
&gt; +=C2=A0 =C2=A0 &quot;-netdev vmnet-macos,id=3Dstr,mode=3Dbridged[,ifna=
me=3Difname]\n&quot;<br>
&gt; +=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0configure a mac=
OS-provided vmnet network in \&quot;physical interface bridge\&quot; mode\n=
&quot;<br>
&gt; +=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the physical in=
terface to bridge with defaults to en0 if unspecified\n&quot;<br>
&gt; +=C2=A0 =C2=A0 &quot;-netdev vmnet-macos,id=3Dstr,mode=3Dhost|shared\n=
&quot;<br>
&gt; +=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0[,dhcp_start_address=3Daddr,dhcp_end_address=3Da=
ddr,dhcp_subnet_mask=3Dmask]\n&quot;<br>
&gt; +=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0configure a mac=
OS-provided vmnet network in \&quot;host\&quot; or \&quot;shared\&quot; mod=
e\n&quot;<br>
&gt; +=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the DHCP config=
uration will be set automatically if unspecified\n&quot;<br>
&gt;=C2=A0 #endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;-netdev hubport,id=3Dstr,hubid=3Dn[,netdev=
=3Dnd]\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 configure a hub port on the hub with ID &#39;n&#39;\n&quot;, =
QEMU_ARCH_ALL)<br>
&gt; <br>
<br>
-- <br>
Eric Blake, Principal Software Engineer<br>
Red Hat, Inc.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+1-919-301-3226<br>
Virtualization:=C2=A0 <a href=3D"http://qemu.org" rel=3D"noreferrer" target=
=3D"_blank">qemu.org</a> | <a href=3D"http://libvirt.org" rel=3D"noreferrer=
" target=3D"_blank">libvirt.org</a><br>
<br>
</blockquote></div></div></div></div>

--00000000000074cff805ba8bdb3b--

