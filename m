Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1853318B58
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 14:02:21 +0100 (CET)
Received: from localhost ([::1]:35638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lABbw-00019W-Sz
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 08:02:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phillip.ennen@gmail.com>)
 id 1lABK3-0003An-Iz
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:43:51 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:46998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phillip.ennen@gmail.com>)
 id 1lABK1-0001hE-3g
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:43:51 -0500
Received: by mail-pf1-x42b.google.com with SMTP id k13so3600812pfh.13
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YZXBCD2/z4jeD26gNNVTOPx4m8ZxwodVshd1b0/j/yY=;
 b=QkV+467U2jExDVzI34TvMsWKehU0cTpNzQb67fbsbottMnSUlf8+uGyGXvtmyDVTsU
 Qum7PHgTEty76t6gExz6zu15+nPfYCIuY6IZY7GWHgU/fHW07l7dNZn+f1LkjPZiyRgw
 3/FnFVhLZflJGVgqyIgnNBZ9w5zkmOOBmOADhr1UiKHFWpsvHe9InF8l0jQKX3NwFMcW
 RIcqCibVpWOCLC9dP9hy7PGmfvfX4i2Ms7rdRtNclqcCbY+rsBuYMwA/sLdcp26f3di8
 woOzFTxZty6ddZTSMnFBjEWiOLjZJj1f6F5NJbG27toRFW3fdlp5kWzzFtaU0B6MKXUv
 NBGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YZXBCD2/z4jeD26gNNVTOPx4m8ZxwodVshd1b0/j/yY=;
 b=RGJuwKUPrEf8c0XSvooa4K1Zt52Oh3O/avL0DekwLj1NFMFURkmJyxC6V8X5jUZ29H
 AQ+v8hKby+qSGz8XVlCc0pjgZnpNZXUtFz5GsqkVwj2qcarpR3Uzv6I5AhjVZ1GOWNTr
 jNvFr/SPCDSIRQIVl1h4sKFkhBiGsxDZWoDyXAnoXgjbBR9h0ei1mngvw1j7odRQ0FPs
 Rd0bPanCmF2FRvNJmXx0AlZXZlJ9iTCFO1MVvVk1gAUJXjWK5uCTG7sYNRCWe8XTdycc
 CSLeYFMd0FMxxwhwV8LDDO2n+QiOiFNYbbDeE8CiVMJN1il50hTz1sI+evCIJ3bNOHlo
 2/ew==
X-Gm-Message-State: AOAM532nV2SLmwUEFzKYZR1Fho3OdxMbv6qnsaFycU3+qbtecxBNpDcw
 /xhY+Hlk0FYTkBf/31puYmViO2pKYo1nf00oNpA=
X-Google-Smtp-Source: ABdhPJxlj3k5dKzJhQu1k5l5EoqZcERufkQBWYMlwyIgfDayM2xWOwtsMVJHUtrpo/wGdpcuh9MC6rAAdukWTCH440c=
X-Received: by 2002:a63:1e12:: with SMTP id e18mr7660836pge.173.1613047427148; 
 Thu, 11 Feb 2021 04:43:47 -0800 (PST)
MIME-Version: 1.0
References: <20210205164106.6664-1-phillip.ennen@gmail.com>
 <CABLmASGzRf+VWAy79jGst7U_TN9Wy=DxFCn9Uc8zRVF=j+m6-w@mail.gmail.com>
In-Reply-To: <CABLmASGzRf+VWAy79jGst7U_TN9Wy=DxFCn9Uc8zRVF=j+m6-w@mail.gmail.com>
From: Phillip Tennen <phillip.ennen@gmail.com>
Date: Thu, 11 Feb 2021 13:43:36 +0100
Message-ID: <CAAi_9z4nH7qo4kBa5QByNKn9qo7W9T-Pr4vL=9cQs7e34SH1FA@mail.gmail.com>
Subject: Re: [PATCH v2] net/macos: implement vmnet-based network device
To: Howard Spoelstra <hsp.cat7@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000e6acd405bb0edee2"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=phillip.ennen@gmail.com; helo=mail-pf1-x42b.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 jasowang@redhat.com, qemu-devel qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Phillip Tennen <phillip@axleos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e6acd405bb0edee2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Howard,

Thanks very much for taking a look and testing it out!

This is a good catch - VMNET_SHARING_SERVICE_BUSY
was added in macOS Big Sur, and is not available in prior versions.

I'll submit a v3 of this patch that adds a compile-guard around this
constant (assuming the #available macro is... available), and will
validate the other vmnet symbols I reference as well.

Phillip

On Thu, Feb 11, 2021 at 7:51 AM Howard Spoelstra <hsp.cat7@gmail.com> wrote=
:

> On Fri, Feb 5, 2021 at 5:54 PM <phillip.ennen@gmail.com> wrote:
> >
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
> > vmnet requires either a special entitlement, granted via a provisioning
> > profile, or root access. Otherwise attempts to create the virtual
> > interface will fail with a =E2=80=9Cgeneric error=E2=80=9D status code.=
 QEMU may not
> > currently be signed with an entitlement granted in a provisioning
> > profile, as this would necessitate pre-signed binary build distribution=
,
> > rather than source-code distribution. As such, using this netdev
> > currently requires that qemu be run with root access. I=E2=80=99ve open=
ed a
> > feedback report with Apple to allow the use of the relevant entitlement
> > with this use case:
> > https://openradar.appspot.com/radar?id=3D5007417364447232
> >
> > vmnet offers three operating modes, all of which are supported by this
> > patch via the =E2=80=9Cmode=3Dhost|shared|bridge=E2=80=9D option:
> >
> > * "Host" mode: Allows the vmnet interface to communicate with other
> > * vmnet
> > interfaces that are in host mode and also with the native host.
> > * "Shared" mode: Allows traffic originating from the vmnet interface to
> > reach the Internet through a NAT. The vmnet interface can also
> > communicate with the native host.
> > * "Bridged" mode: Bridges the vmnet interface with a physical network
> > interface.
> >
> > Each of these modes also provide some extra configuration that=E2=80=99=
s
> > supported by this patch:
> >
> > * "Bridged" mode: The user may specify the physical interface to bridge
> > with. Defaults to en0.
> > * "Host" mode / "Shared" mode: The user may specify the DHCP range and
> > subnet. Allocated by vmnet if not provided.
> >
> > vmnet also offers some extra configuration options that are not
> > supported by this patch:
> >
> > * Enable isolation from other VMs using vmnet
> > * Port forwarding rules
> > * Enabling TCP segmentation offload
> > * Only applicable in "shared" mode: specifying the NAT IPv6 prefix
> > * Only available in "host" mode: specifying the IP address for the VM
> > within an isolated network
> >
> > Note that this patch requires macOS 10.15 as a minimum, as this is when
> > bridging support was implemented in vmnet.framework.
> >
> > Signed-off-by: Phillip Tennen <phillip@axleos.com>
> >
> Hi Phillip,
>
> Thank you very much for this patch. As you wrote it should apply from
> 10.15 upwards. I have no problem building on Big Sur, but Catalina
> stumbles. See below. Latest Xcode installed, other requirements
> installed through brew.
>
> Thanks for looking into this,
>
> Best,
> Howard
>
> [1181/2135] Compiling C object libcommon.fa.p/net_vmnet-macos.c.o
> FAILED: libcommon.fa.p/net_vmnet-macos.c.o
> cc -Ilibcommon.fa.p -I. -I.. -I../capstone/include/capstone
> -I../dtc/libfdt -I../slirp -I../slirp/src -Iqapi -Itrace -Iui
> -Iui/shader -I/usr/local/Cellar/libffi/3.3_2/include
> -I/usr/local/Cellar/glib/2.66.6/include
> -I/usr/local/Cellar/glib/2.66.6/include/glib-2.0
> -I/usr/local/Cellar/glib/2.66.6/lib/glib-2.0/include
> -I/usr/local/opt/gettext/include -I/usr/local/Cellar/pcre/8.44/include
> -I/usr/local/Cellar/glib/2.66.6/include/gio-unix-2.0
> -I/usr/local/Cellar/libusb/1.0.24/include/libusb-1.0
> -I/usr/local/Cellar/pixman/0.40.0/include/pixman-1 -Xclang
> -fcolor-diagnostics -pipe -Wall -Winvalid-pch -std=3Dgnu99 -O2 -g
> -iquote . -iquote /Users/hsp/src/qemu-master -iquote
> /Users/hsp/src/qemu-master/include -iquote
> /Users/hsp/src/qemu-master/disas/libvixl -iquote
> /Users/hsp/src/qemu-master/tcg/i386 -iquote
> /Users/hsp/src/qemu-master/accel/tcg -m64 -mcx16
> -DOS_OBJECT_USE_OBJC=3D0 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64
> -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef
> -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common
> -fwrapv -Wold-style-definition -Wtype-limits -Wformat-security
> -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body
> -Wnested-externs -Wendif-labels -Wexpansion-to-defined
> -Wno-initializer-overrides -Wno-missing-include-dirs
> -Wno-shift-negative-value -Wno-string-plus-int
> -Wno-typedef-redefinition -Wno-tautological-type-limit-compare
> -fstack-protector-strong -DSTRUCT_IOVEC_DEFINED -MD -MQ
> libcommon.fa.p/net_vmnet-macos.c.o -MF
> libcommon.fa.p/net_vmnet-macos.c.o.d -o
> libcommon.fa.p/net_vmnet-macos.c.o -c ../net/vmnet-macos.c
> ../net/vmnet-macos.c:54:10: error: use of undeclared identifier
> 'VMNET_SHARING_SERVICE_BUSY'
>     case VMNET_SHARING_SERVICE_BUSY:
>          ^
>

--000000000000e6acd405bb0edee2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hi Howard,<div><br></div=
><div>Thanks very much for taking a look and=C2=A0testing it out!</div><div=
><br></div><div>This is a good catch - VMNET_SHARING_SERVICE_BUSY=C2=A0</di=
v><div>was added in macOS Big Sur, and is not available in prior versions.=
=C2=A0</div><div><br></div><div>I&#39;ll submit a v3 of this patch that add=
s a compile-guard around this=C2=A0</div><div>constant (assuming the=C2=A0<=
span style=3D"font-family:inherit;font-style:inherit;font-variant-caps:inhe=
rit;white-space:inherit;font-size:13px">#</span><span class=3D"gmail-hljs-f=
unction" style=3D"font-family:inherit;font-style:inherit;font-variant-caps:=
inherit;white-space:inherit;font-size:13px;margin:0px;padding:0px;border:0p=
x;font-stretch:inherit;line-height:inherit;vertical-align:baseline;box-sizi=
ng:inherit"><span class=3D"gmail-hljs-title" style=3D"margin:0px;padding:0p=
x;border:0px;font-family:inherit;font-style:inherit;font-variant-caps:inher=
it;font-stretch:inherit;line-height:inherit;vertical-align:baseline;box-siz=
ing:inherit">available macro is... available), and will=C2=A0</span></span>=
</div><div><span class=3D"gmail-hljs-function" style=3D"font-family:inherit=
;font-style:inherit;font-variant-caps:inherit;white-space:inherit;font-size=
:13px;margin:0px;padding:0px;border:0px;font-stretch:inherit;line-height:in=
herit;vertical-align:baseline;box-sizing:inherit"><span class=3D"gmail-hljs=
-title" style=3D"margin:0px;padding:0px;border:0px;font-family:inherit;font=
-style:inherit;font-variant-caps:inherit;font-stretch:inherit;line-height:i=
nherit;vertical-align:baseline;box-sizing:inherit">validate the=C2=A0</span=
></span><span style=3D"font-family:inherit;font-style:inherit;font-variant-=
caps:inherit;font-size:13px;white-space:inherit">other vmnet symbols I refe=
rence as well.</span></div><div><span class=3D"gmail-hljs-function" style=
=3D"font-family:inherit;font-style:inherit;font-variant-caps:inherit;white-=
space:inherit;font-size:13px;margin:0px;padding:0px;border:0px;font-stretch=
:inherit;line-height:inherit;vertical-align:baseline;box-sizing:inherit"><s=
pan class=3D"gmail-hljs-title" style=3D"margin:0px;padding:0px;border:0px;f=
ont-family:inherit;font-style:inherit;font-variant-caps:inherit;font-stretc=
h:inherit;line-height:inherit;vertical-align:baseline;box-sizing:inherit"><=
br></span></span></div><div><span class=3D"gmail-hljs-function" style=3D"fo=
nt-family:inherit;font-style:inherit;font-variant-caps:inherit;white-space:=
inherit;font-size:13px;margin:0px;padding:0px;border:0px;font-stretch:inher=
it;line-height:inherit;vertical-align:baseline;box-sizing:inherit"><span cl=
ass=3D"gmail-hljs-title" style=3D"margin:0px;padding:0px;border:0px;font-fa=
mily:inherit;font-style:inherit;font-variant-caps:inherit;font-stretch:inhe=
rit;line-height:inherit;vertical-align:baseline;box-sizing:inherit">Phillip=
</span></span></div></div></div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 11, 2021 at 7:51 AM Howard Spoe=
lstra &lt;<a href=3D"mailto:hsp.cat7@gmail.com">hsp.cat7@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rg=
b(204,204,204);padding-left:1ex">On Fri, Feb 5, 2021 at 5:54 PM &lt;<a href=
=3D"mailto:phillip.ennen@gmail.com" target=3D"_blank">phillip.ennen@gmail.c=
om</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Phillip Tennen &lt;<a href=3D"mailto:phillip@axleos.com" target=
=3D"_blank">phillip@axleos.com</a>&gt;<br>
&gt;<br>
&gt; This patch implements a new netdev device, reachable via -netdev<br>
&gt; vmnet-macos, that=E2=80=99s backed by macOS=E2=80=99s vmnet framework.=
<br>
&gt;<br>
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
&gt;<br>
&gt; vmnet requires either a special entitlement, granted via a provisionin=
g<br>
&gt; profile, or root access. Otherwise attempts to create the virtual<br>
&gt; interface will fail with a =E2=80=9Cgeneric error=E2=80=9D status code=
. QEMU may not<br>
&gt; currently be signed with an entitlement granted in a provisioning<br>
&gt; profile, as this would necessitate pre-signed binary build distributio=
n,<br>
&gt; rather than source-code distribution. As such, using this netdev<br>
&gt; currently requires that qemu be run with root access. I=E2=80=99ve ope=
ned a<br>
&gt; feedback report with Apple to allow the use of the relevant entitlemen=
t<br>
&gt; with this use case:<br>
&gt; <a href=3D"https://openradar.appspot.com/radar?id=3D5007417364447232" =
rel=3D"noreferrer" target=3D"_blank">https://openradar.appspot.com/radar?id=
=3D5007417364447232</a><br>
&gt;<br>
&gt; vmnet offers three operating modes, all of which are supported by this=
<br>
&gt; patch via the =E2=80=9Cmode=3Dhost|shared|bridge=E2=80=9D option:<br>
&gt;<br>
&gt; * &quot;Host&quot; mode: Allows the vmnet interface to communicate wit=
h other<br>
&gt; * vmnet<br>
&gt; interfaces that are in host mode and also with the native host.<br>
&gt; * &quot;Shared&quot; mode: Allows traffic originating from the vmnet i=
nterface to<br>
&gt; reach the Internet through a NAT. The vmnet interface can also<br>
&gt; communicate with the native host.<br>
&gt; * &quot;Bridged&quot; mode: Bridges the vmnet interface with a physica=
l network<br>
&gt; interface.<br>
&gt;<br>
&gt; Each of these modes also provide some extra configuration that=E2=80=
=99s<br>
&gt; supported by this patch:<br>
&gt;<br>
&gt; * &quot;Bridged&quot; mode: The user may specify the physical interfac=
e to bridge<br>
&gt; with. Defaults to en0.<br>
&gt; * &quot;Host&quot; mode / &quot;Shared&quot; mode: The user may specif=
y the DHCP range and<br>
&gt; subnet. Allocated by vmnet if not provided.<br>
&gt;<br>
&gt; vmnet also offers some extra configuration options that are not<br>
&gt; supported by this patch:<br>
&gt;<br>
&gt; * Enable isolation from other VMs using vmnet<br>
&gt; * Port forwarding rules<br>
&gt; * Enabling TCP segmentation offload<br>
&gt; * Only applicable in &quot;shared&quot; mode: specifying the NAT IPv6 =
prefix<br>
&gt; * Only available in &quot;host&quot; mode: specifying the IP address f=
or the VM<br>
&gt; within an isolated network<br>
&gt;<br>
&gt; Note that this patch requires macOS 10.15 as a minimum, as this is whe=
n<br>
&gt; bridging support was implemented in vmnet.framework.<br>
&gt;<br>
&gt; Signed-off-by: Phillip Tennen &lt;<a href=3D"mailto:phillip@axleos.com=
" target=3D"_blank">phillip@axleos.com</a>&gt;<br>
&gt;<br>
Hi Phillip,<br>
<br>
Thank you very much for this patch. As you wrote it should apply from<br>
10.15 upwards. I have no problem building on Big Sur, but Catalina<br>
stumbles. See below. Latest Xcode installed, other requirements<br>
installed through brew.<br>
<br>
Thanks for looking into this,<br>
<br>
Best,<br>
Howard<br>
<br>
[1181/2135] Compiling C object libcommon.fa.p/net_vmnet-macos.c.o<br>
FAILED: libcommon.fa.p/net_vmnet-macos.c.o<br>
cc -Ilibcommon.fa.p -I. -I.. -I../capstone/include/capstone<br>
-I../dtc/libfdt -I../slirp -I../slirp/src -Iqapi -Itrace -Iui<br>
-Iui/shader -I/usr/local/Cellar/libffi/3.3_2/include<br>
-I/usr/local/Cellar/glib/2.66.6/include<br>
-I/usr/local/Cellar/glib/2.66.6/include/glib-2.0<br>
-I/usr/local/Cellar/glib/2.66.6/lib/glib-2.0/include<br>
-I/usr/local/opt/gettext/include -I/usr/local/Cellar/pcre/8.44/include<br>
-I/usr/local/Cellar/glib/2.66.6/include/gio-unix-2.0<br>
-I/usr/local/Cellar/libusb/1.0.24/include/libusb-1.0<br>
-I/usr/local/Cellar/pixman/0.40.0/include/pixman-1 -Xclang<br>
-fcolor-diagnostics -pipe -Wall -Winvalid-pch -std=3Dgnu99 -O2 -g<br>
-iquote . -iquote /Users/hsp/src/qemu-master -iquote<br>
/Users/hsp/src/qemu-master/include -iquote<br>
/Users/hsp/src/qemu-master/disas/libvixl -iquote<br>
/Users/hsp/src/qemu-master/tcg/i386 -iquote<br>
/Users/hsp/src/qemu-master/accel/tcg -m64 -mcx16<br>
-DOS_OBJECT_USE_OBJC=3D0 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64<br>
-D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef<br>
-Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common<br>
-fwrapv -Wold-style-definition -Wtype-limits -Wformat-security<br>
-Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body<br>
-Wnested-externs -Wendif-labels -Wexpansion-to-defined<br>
-Wno-initializer-overrides -Wno-missing-include-dirs<br>
-Wno-shift-negative-value -Wno-string-plus-int<br>
-Wno-typedef-redefinition -Wno-tautological-type-limit-compare<br>
-fstack-protector-strong -DSTRUCT_IOVEC_DEFINED -MD -MQ<br>
libcommon.fa.p/net_vmnet-macos.c.o -MF<br>
libcommon.fa.p/net_vmnet-macos.c.o.d -o<br>
libcommon.fa.p/net_vmnet-macos.c.o -c ../net/vmnet-macos.c<br>
../net/vmnet-macos.c:54:10: error: use of undeclared identifier<br>
&#39;VMNET_SHARING_SERVICE_BUSY&#39;<br>
=C2=A0 =C2=A0 case VMNET_SHARING_SERVICE_BUSY:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
</blockquote></div>

--000000000000e6acd405bb0edee2--

