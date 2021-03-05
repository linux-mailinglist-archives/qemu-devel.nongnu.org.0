Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED78832DE75
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 01:51:23 +0100 (CET)
Received: from localhost ([::1]:56342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHygc-0007dU-Fg
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 19:51:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.leslie@gmail.com>)
 id 1lHyff-00077q-Vc
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 19:50:23 -0500
Received: from mail-ua1-f45.google.com ([209.85.222.45]:46295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ben.leslie@gmail.com>)
 id 1lHyfe-0001sK-3S
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 19:50:23 -0500
Received: by mail-ua1-f45.google.com with SMTP id 62so162613uar.13
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 16:50:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WmSZry98ZcAWlYpHZ4KOEfIEbk/uJWwrMdwTtT1qoks=;
 b=pf6Ke4XSK1eRpubaKEujFrvv5MDdaDjRQO10hwx1RW6D5rmkgAU4i77Jy/JbEO637Z
 upXmvQRk6NHCHLVWUIUuQ/1+h46PpWagIt9hzTbjIcBdB0vGJ4ZCOhaqkgEODDzAL7Wl
 HlmWYtFryxZicPR4VHHCvW6Pb/6+LfNPuIO3Q4ZbAcV9hWXQ7SzHWq3G2J4kIMKlt902
 xlWzMIOnP8gOidC8zfz+WoASVNFv3sHF9jT4kHH7Cf3p5CDZ6e2yc4EnUvayb152GECW
 Bvgs1gEAZOPFZnVWJJnoMahvLU2856eomrwXKd9ZclDK3KMov+GrmivrfEApmT2ZAEwB
 92Ig==
X-Gm-Message-State: AOAM530yTITdBeaw+29b7wwisPcN9g3edkT6NhwJNjB8Cf8v8RrXbqKh
 kZX54weZFHKjOiorDq394tGrnmfGIDArzO39Ppc=
X-Google-Smtp-Source: ABdhPJwfq6pvemWxdnYl/iD/Osl0R0DvUYyHrdyGtuvBG0/l1jiZSt3p5fgsYCPwYTEFqG6fbGQ+FGc90Tj2m5LOG8c=
X-Received: by 2002:a9f:3104:: with SMTP id m4mr4525788uab.127.1614905421122; 
 Thu, 04 Mar 2021 16:50:21 -0800 (PST)
MIME-Version: 1.0
References: <CABZ0LtBrGynOoYr=xbT3zNGe3UQg=Dr39_8d9V6+XgGzpnQrsw@mail.gmail.com>
 <20210304143149.jc24h6fh35luzhyb@sirius.home.kraxel.org>
In-Reply-To: <20210304143149.jc24h6fh35luzhyb@sirius.home.kraxel.org>
From: Ben Leslie <benno@benno.id.au>
Date: Fri, 5 Mar 2021 11:50:09 +1100
Message-ID: <CABZ0LtCaQYWPG4A8HYgk5w-d0RWA0dOsOZ9XAuJ67BUJwe3EFg@mail.gmail.com>
Subject: Re: USB port claiming / set configuration problems
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f8cee305bcbf77a8"
Received-SPF: pass client-ip=209.85.222.45; envelope-from=ben.leslie@gmail.com;
 helo=mail-ua1-f45.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f8cee305bcbf77a8
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Mar 2021 at 01:31, Gerd Hoffmann <kraxel@redhat.com> wrote:

>   Hi,
>
> > Would adding support to host-libusb to use these
> > ioctl to claim the port be beneficial?
>
> I don't feel like side-stepping libusb.  That is asking for trouble
> because usbdevfs might behave differently then and confuse libusb.
>
> So, if anything, libusb would need support that, then qemu can use it.
>
> > Based on a simple test program and
> > hardware USB traces for a device connected to a 'claimed' port the kernel
> > does indeed leave the device in an unconfigured state. (Although it still
> > performs some basic control transfers to gather descriptor, and strangely
> > seems to in this case make an explicit SET CONFIGURATION transfer, but
> sets
> > configuration to zero, rather than an actual configuration, which, at
> least
> > for the devices I was able to test with, avoided the problems of calling
> > SET CONFIGURATION (1) twice).
>
> We could try that too (set config to zero first, then set the config we
> actually want) and see if that works better.
>

This approach seems to work well, and let's me just use libusb, which is a
plus.

It seems I had actually misdiagnosed (or only partially diagnosed) the issue
with my 'problem devices'. It turned out that setting *any* valid
configuration
twice in a row causes problems for the device! So, for example, if the
current
configuration was set to 1, and then set configuration 2 was called that
would
also cause problems. I guess that drivers on other systems ensured that
such a sequence never occurred.

I reverted bfe44898848614cfcb3a269bc965afbe1f0f331c and made this change:

--- a/hw/usb/host-libusb.c
+++ b/hw/usb/host-libusb.c
@@ -955,6 +955,11 @@ static int usb_host_open(USBHostDevice *s,
libusb_device *dev, int hostfd)

     usb_host_detach_kernel(s);

+    rc = libusb_set_configuration(s->dh, 0);
+    if (rc != 0) {
+        goto fail;
+    }
+
     libusb_get_device_descriptor(dev, &s->ddesc);
     usb_host_get_port(s->dev, s->port, sizeof(s->port));

This appears to work for my use cases. (Although I still have more testing
to do).

In terms of the transaction on the wire, this is not quite as good as the
'claim port'
approach. Specifically, with the claim port after setting address and
getting some
basic descriptors the kernel will explicitly set configuration to zero and
not perform
any more transactions. Without the 'claim port' the kernel appears to
configure to
the first configuration and then read a few more descriptors. For my test
cases
at least this doesn't appear to be problematic, but I thought it was worth
calling
out the differences. Of course the great benefit of this approach is that
it uses
existing libusb functionality.

Cheers,

Ben

--000000000000f8cee305bcbf77a8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 5 Mar 2021 at 01:31, Gerd Hoffman=
n &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt; wrote:=
<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">=C2=A0 Hi,<br>
<br>&gt; Would adding support to host-libusb to use these<br>
&gt; ioctl to claim the port be beneficial?<br>
<br>
I don&#39;t feel like side-stepping libusb.=C2=A0 That is asking for troubl=
e<br>
because usbdevfs might behave differently then and confuse libusb.<br>
<br>
So, if anything, libusb would need support that, then qemu can use it.<br>
<br>
&gt; Based on a simple test program and<br>
&gt; hardware USB traces for a device connected to a &#39;claimed&#39; port=
 the kernel<br>
&gt; does indeed leave the device in an unconfigured state. (Although it st=
ill<br>
&gt; performs some basic control transfers to gather descriptor, and strang=
ely<br>
&gt; seems to in this case make an explicit SET CONFIGURATION transfer, but=
 sets<br>
&gt; configuration to zero, rather than an actual configuration, which, at =
least<br>
&gt; for the devices I was able to test with, avoided the problems of calli=
ng<br>
&gt; SET CONFIGURATION (1) twice).<br>
<br>
We could try that too (set config to zero first, then set the config we<br>
actually want) and see if that works better.<br></blockquote><div><br></div=
><div>This approach seems to work well, and let&#39;s me just use libusb, w=
hich is a plus.</div><div><br></div><div>It seems I had actually misdiagnos=
ed (or only partially diagnosed) the issue</div><div>with my &#39;problem d=
evices&#39;. It turned out that setting *any* valid configuration</div><div=
>twice in a row causes problems for the device! So, for example, if the cur=
rent</div><div>configuration was set to 1, and then set configuration 2 was=
 called that would</div><div>also cause problems. I guess that drivers on o=
ther systems ensured that</div><div>such a sequence never occurred.</div></=
div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">I rever=
ted bfe44898848614cfcb3a269bc965afbe1f0f331c and made this change:<br></div=
><div class=3D"gmail_quote"><div><br></div><div>--- a/hw/usb/host-libusb.c<=
br>+++ b/hw/usb/host-libusb.c<br>@@ -955,6 +955,11 @@ static int usb_host_o=
pen(USBHostDevice *s, libusb_device *dev, int hostfd)<br><br>=C2=A0 =C2=A0 =
=C2=A0usb_host_detach_kernel(s);<br><br>+ =C2=A0 =C2=A0rc =3D libusb_set_co=
nfiguration(s-&gt;dh, 0);<br>+ =C2=A0 =C2=A0if (rc !=3D 0) {<br>+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0goto fail;<br>+ =C2=A0 =C2=A0}<br>+<br>=C2=A0 =C2=A0 =
=C2=A0libusb_get_device_descriptor(dev, &amp;s-&gt;ddesc);<br>=C2=A0 =C2=A0=
 =C2=A0usb_host_get_port(s-&gt;dev, s-&gt;port, sizeof(s-&gt;port));</div><=
div><br></div><div>This appears to work for my use cases. (Although I still=
 have more testing to do).</div><div><br></div><div>In terms of the transac=
tion on the wire, this is not quite as good as the &#39;claim port&#39;</di=
v><div>approach. Specifically, with the claim port after setting address an=
d getting some</div><div>basic descriptors the kernel will explicitly set c=
onfiguration to zero and not perform</div><div>any more transactions. Witho=
ut the &#39;claim port&#39; the kernel appears to configure to</div><div>th=
e first configuration and then read a few more descriptors. For my test cas=
es</div><div>at least this doesn&#39;t appear to be problematic, but I thou=
ght it was worth calling</div><div>out the differences. Of course the great=
 benefit of this approach is that it uses</div><div>existing libusb functio=
nality.</div><div><br></div><div>Cheers,</div><div><br></div><div>Ben<br></=
div><div><br></div><div><br></div><div><br></div><div>=C2=A0</div></div></d=
iv>

--000000000000f8cee305bcbf77a8--

