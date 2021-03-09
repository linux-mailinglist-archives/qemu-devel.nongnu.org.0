Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7637332014
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 08:54:38 +0100 (CET)
Received: from localhost ([::1]:35640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJXCP-0006gz-Di
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 02:54:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.leslie@gmail.com>)
 id 1lJXAz-0006Ej-1c
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 02:53:09 -0500
Received: from mail-ej1-f50.google.com ([209.85.218.50]:45634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ben.leslie@gmail.com>)
 id 1lJXAx-0005Xg-88
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 02:53:08 -0500
Received: by mail-ej1-f50.google.com with SMTP id mm21so25492500ejb.12
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 23:53:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PY2VHsDpxouPcVwsWXx4dyG7j2TPcUj52kPEdMDSBcA=;
 b=T6fxn8+KuMUS7FIL63XO+JNxEBfEk4MrEF8RViIBZn0z7Hq8KDi4418pm88iqw2TmM
 ZlHG82MIMHb4bB81jnhGEMhg7mUXcoGOgz5qX4lDKF33R4sx/sBpQfMcsBwy5WNH0vC8
 KCU3PlCcXGkeAqfO+83wmF7aIB+r07VSNjCv8gvpikpglknRxPvwpUtDc3OmT2a1vlZH
 o5Q4pkQ7bnxixWLnrduEC4j94LZLkW6g4ix6nLK5WGcISA/UlO5j6JaUqlTVsKppQScB
 qsb8l/jaOYYNGx3PnWk1thtmXynX/4367du/x+4Tw9p9i6hf15fnJm/nh1SvkVXIx1mQ
 rmgA==
X-Gm-Message-State: AOAM5302xkj83Nu9v+RtUSABIO9NvKa22kkXhpwRy6AsTch715iuDMdL
 g8IPIrBgkMlMdtZN4H+x5fQdU064FuEVKmfvBhE=
X-Google-Smtp-Source: ABdhPJyhrx2174EvfOzIpBb26KyY+v6Qzo0cu6w9FK1IF6+qfds/euXpgGufRovs79jdi4U6pc3VAlRJpi2Zw1Y2NT0=
X-Received: by 2002:a17:906:f0c8:: with SMTP id
 dk8mr16729919ejb.300.1615276385758; 
 Mon, 08 Mar 2021 23:53:05 -0800 (PST)
MIME-Version: 1.0
References: <CABZ0LtBrGynOoYr=xbT3zNGe3UQg=Dr39_8d9V6+XgGzpnQrsw@mail.gmail.com>
 <20210304143149.jc24h6fh35luzhyb@sirius.home.kraxel.org>
 <CABZ0LtCaQYWPG4A8HYgk5w-d0RWA0dOsOZ9XAuJ67BUJwe3EFg@mail.gmail.com>
In-Reply-To: <CABZ0LtCaQYWPG4A8HYgk5w-d0RWA0dOsOZ9XAuJ67BUJwe3EFg@mail.gmail.com>
From: Ben Leslie <benno@benno.id.au>
Date: Tue, 9 Mar 2021 18:52:54 +1100
Message-ID: <CABZ0LtARKHimDLA-jUwF-yRbyxnMSAXk_Z=GM0LzRviAmvEDig@mail.gmail.com>
Subject: Re: USB port claiming / set configuration problems
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000002ff2d505bd15d76e"
Received-SPF: pass client-ip=209.85.218.50; envelope-from=ben.leslie@gmail.com;
 helo=mail-ej1-f50.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

--0000000000002ff2d505bd15d76e
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Mar 2021 at 11:50, Ben Leslie <benno@benno.id.au> wrote:

> On Fri, 5 Mar 2021 at 01:31, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>>   Hi,
>>
>> > Would adding support to host-libusb to use these
>> > ioctl to claim the port be beneficial?
>>
>> I don't feel like side-stepping libusb.  That is asking for trouble
>> because usbdevfs might behave differently then and confuse libusb.
>>
>> So, if anything, libusb would need support that, then qemu can use it.
>>
>> > Based on a simple test program and
>> > hardware USB traces for a device connected to a 'claimed' port the
>> kernel
>> > does indeed leave the device in an unconfigured state. (Although it
>> still
>> > performs some basic control transfers to gather descriptor, and
>> strangely
>> > seems to in this case make an explicit SET CONFIGURATION transfer, but
>> sets
>> > configuration to zero, rather than an actual configuration, which, at
>> least
>> > for the devices I was able to test with, avoided the problems of calling
>> > SET CONFIGURATION (1) twice).
>>
>> We could try that too (set config to zero first, then set the config we
>> actually want) and see if that works better.
>>
>
> This approach seems to work well, and let's me just use libusb, which is a
> plus.
>
> It seems I had actually misdiagnosed (or only partially diagnosed) the
> issue
> with my 'problem devices'. It turned out that setting *any* valid
> configuration
> twice in a row causes problems for the device! So, for example, if the
> current
> configuration was set to 1, and then set configuration 2 was called that
> would
> also cause problems. I guess that drivers on other systems ensured that
> such a sequence never occurred.
>
> I reverted bfe44898848614cfcb3a269bc965afbe1f0f331c and made this change:
>
> --- a/hw/usb/host-libusb.c
> +++ b/hw/usb/host-libusb.c
> @@ -955,6 +955,11 @@ static int usb_host_open(USBHostDevice *s,
> libusb_device *dev, int hostfd)
>
>      usb_host_detach_kernel(s);
>
> +    rc = libusb_set_configuration(s->dh, 0);
> +    if (rc != 0) {
> +        goto fail;
> +    }
> +
>      libusb_get_device_descriptor(dev, &s->ddesc);
>      usb_host_get_port(s->dev, s->port, sizeof(s->port));
>
> This appears to work for my use cases. (Although I still have more testing
> to do).
>
> In terms of the transaction on the wire, this is not quite as good as the
> 'claim port'
> approach. Specifically, with the claim port after setting address and
> getting some
> basic descriptors the kernel will explicitly set configuration to zero and
> not perform
> any more transactions. Without the 'claim port' the kernel appears to
> configure to
> the first configuration and then read a few more descriptors. For my test
> cases
> at least this doesn't appear to be problematic, but I thought it was worth
> calling
> out the differences. Of course the great benefit of this approach is that
> it uses
> existing libusb functionality.
>
>
For the archives, unfortunately this approach did not work for my use case.
I was able to get something working using the claim port approach, but that
meant going behind the back of libusb, which is obviously not suitable to be
merged, and ends up as a reasonably sizable patch.

I'll see if there is any appetite for adding claim port functionality to
libusb
before raising it again here.

Thanks for the feedback and assistance.

Cheers,

Ben

--0000000000002ff2d505bd15d76e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 5 Mar 2021 at 11:50, Ben Leslie &=
lt;<a href=3D"mailto:benno@benno.id.au">benno@benno.id.au</a>&gt; wrote:<br=
></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">On Fri, 5 Mar 2021 at 01:31, G=
erd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" target=3D"_blank">kra=
xel@redhat.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">=C2=A0 Hi,<br>
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
nality.</div><br></div></div></blockquote><div><br></div><div>For the archi=
ves, unfortunately this approach did not work for my use case. <br></div><d=
iv>I was able to get something working using the claim port approach, but t=
hat</div><div>meant going behind the back of libusb, which is obviously not=
 suitable to be</div><div>merged, and ends up as a reasonably sizable patch=
.</div><div><br></div><div>I&#39;ll see if there is any appetite for adding=
 claim port functionality to libusb</div><div>before raising it again here.=
</div><div><br></div><div>Thanks for the feedback and assistance.</div><div=
><br></div><div>Cheers,</div><div><br></div><div>Ben<br></div><div><br></di=
v><div><br></div><div><br></div></div></div>

--0000000000002ff2d505bd15d76e--

