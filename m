Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A6133DFC6
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 22:07:36 +0100 (CET)
Received: from localhost ([::1]:55010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMGuc-0000mq-Tx
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 17:07:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lMGtS-0000LY-DS
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:06:22 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:37853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lMGtO-0007OI-Bo
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:06:22 -0400
Received: by mail-ed1-x52f.google.com with SMTP id x21so23217918eds.4
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 14:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S94xBvMZ4hLCSEUk9oQfqOyc0RD6AWsKKl7iGhyo0UU=;
 b=HPlOjCP26RD3yXPiCaegC2Bi6TEF1g1UbNl3Jol0BsU6cOpspRnnqy+Z/fxFqdlB0y
 99oMB8m5UfNmt8HFXkS/xU4MiERKMDrojDplgITd5FCbqje6ur4TbpQmECMYquwifNPv
 n3IqBgf1W17goKt3gSoG9XBd/YMMBeQewapjgK6+yMheilniEaNM1wP2uYLbwfaE9iYW
 NT20AKqxRRYYYBN+k8NlU5IqoHBwENe52LCJlkBjuAukEBtjtyiMCIX3nrt3jAnVdF2C
 MI6eVJ7xFxvMJVE1wATqtCiBKp2k7boNS21MfjyutBVVFtS3taY8Vos284WsaUBZrBnp
 gXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S94xBvMZ4hLCSEUk9oQfqOyc0RD6AWsKKl7iGhyo0UU=;
 b=g9jZZJ+CS+42p6GQtd7vyVubq8x399RDmhk2DQKBc9BFvF3Y3c0kIGhtDgAau5G+iN
 9aBpAPb65ElM+Gupi9F0vnb47gNVnQW21x0pta9L7wBQuSow0LBl9+F5vCWMcCSFKaha
 KDdcRpp+1Z85Jo0+kUPT9FMU5ouLUBlr4LLn1xeLrNZexpkdSIJvt79glbMrF+19zFSI
 aYnOWlcm31cf9pasOhOsAKqLX5c6uCFbNgEpAlnhkjFuQHreO7TQmIkGFQew4fQjNb9Z
 pg2vdjArhDUczS5ch5O6JFYfNwTQqDz4YbT32kXkBt+LTJUmiG7KuKM39AlJNMtuKPIH
 d5SA==
X-Gm-Message-State: AOAM532Ec5s6PIBLHeZXBblx0YzrI0L+QFbUTh1vIwqAmSZlZT6fu4kc
 jpatg19Zi3upDNRrkaN//kLgXBlOjr+YSYTYqN0=
X-Google-Smtp-Source: ABdhPJzTTfT2YLCL+jqTnZjkDcg2r2v5ijbr+TMYHpiiIIt/rbjg8ptsxEDD+u3LYCTJv/ALsuaB4a6KjpU04NSAEt4=
X-Received: by 2002:a50:ee05:: with SMTP id g5mr38303699eds.164.1615928775900; 
 Tue, 16 Mar 2021 14:06:15 -0700 (PDT)
MIME-Version: 1.0
References: <YFDo/oHikOEcXFcg@work-vm>
 <630f4307-20ed-8834-4df9-ed90c22ee018@redhat.com>
 <YFD8mXa4P/fVIZd6@work-vm>
In-Reply-To: <YFD8mXa4P/fVIZd6@work-vm>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 17 Mar 2021 01:06:04 +0400
Message-ID: <CAJ+F1CL7Dj4EO8ESVM5bhryRAK3aUTOHBF5yK0zkDwX6OG+fNw@mail.gmail.com>
Subject: Re: Half a usb-redir idea
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000ab811105bdadbc20"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x52f.google.com
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
Cc: QEMU <qemu-devel@nongnu.org>, Victor Toso <victortoso@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ab811105bdadbc20
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Mar 16, 2021 at 11:33 PM Dr. David Alan Gilbert <dgilbert@redhat.co=
m>
wrote:

> * Philippe Mathieu-Daud=C3=A9 (philmd@redhat.com) wrote:
> > On 3/16/21 6:21 PM, Dr. David Alan Gilbert wrote:
> > > Hi,
> > >   I've got a half-baked idea, which I thought might be worth
> mentioning.
> > >
> > > How hard would it be to give qemu a usbredir server rather than clien=
t?
> > > It would have nothing guest visible but would look logically like the
> > > front (?) half of a usb interface; then you could use all of the
> > > existing qemu emulated and passthrough device code, to build a usb
> > > hierarchy and present it to a remote qemu.
> > >
> > > You'd get the ability to do emulated USB CDROM/storage, audio, networ=
k
> > > and the glue for host USB connection (and smart cards??) - all in one
> > > client that you can then use for connecting to a remote qemu.
> > >
> > > The next step of that is to make something analogous to a
> > > qemu-storage-daemon, but for USB, so you have something that can
> > > do all that USB stuff without actually having any processors.
> > >
> > > The even crazier step would then be to add a VNC client, and then you
> > > have an almost complete remote client.
> >
> > Similarly to the out-of-process feature (on the same host)?
> > Are you also interested in remote use (different host)?
>
> I was mainly interested in it for remote access; but potentially this
> provides a clean break point to move all of the USB device emulation
> into one separate process.
>
>
It's an idea I suggested a few times too, once at least during 2017 KVM
Forum multi-process talk, & when it was decided to implement usb CD
emulation in spice-gtk (which I wish would use existing qemu code instead,
or the NBD server I implemented initially, long time ago..). So yup, I'd
like to see this happen too eventually. However it's not so attractive
imho, you rather want virtio/vhost-user and for other devices you don't
have a choice I'd focus on vfio-user. At some point hopefully, qemu should
be able to provide a usb controller via vfio-user if you need it.

--000000000000ab811105bdadbc20
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 16, 2021 at 11:33 PM Dr=
. David Alan Gilbert &lt;<a href=3D"mailto:dgilbert@redhat.com">dgilbert@re=
dhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">* Philippe Mathieu-Daud=C3=A9 (<a href=3D"mailto:philmd@redhat.com"=
 target=3D"_blank">philmd@redhat.com</a>) wrote:<br>
&gt; On 3/16/21 6:21 PM, Dr. David Alan Gilbert wrote:<br>
&gt; &gt; Hi,<br>
&gt; &gt;=C2=A0 =C2=A0I&#39;ve got a half-baked idea, which I thought might=
 be worth mentioning.<br>
&gt; &gt; <br>
&gt; &gt; How hard would it be to give qemu a usbredir server rather than c=
lient?<br>
&gt; &gt; It would have nothing guest visible but would look logically like=
 the<br>
&gt; &gt; front (?) half of a usb interface; then you could use all of the<=
br>
&gt; &gt; existing qemu emulated and passthrough device code, to build a us=
b<br>
&gt; &gt; hierarchy and present it to a remote qemu.<br>
&gt; &gt; <br>
&gt; &gt; You&#39;d get the ability to do emulated USB CDROM/storage, audio=
, network<br>
&gt; &gt; and the glue for host USB connection (and smart cards??) - all in=
 one<br>
&gt; &gt; client that you can then use for connecting to a remote qemu.<br>
&gt; &gt; <br>
&gt; &gt; The next step of that is to make something analogous to a<br>
&gt; &gt; qemu-storage-daemon, but for USB, so you have something that can<=
br>
&gt; &gt; do all that USB stuff without actually having any processors.<br>
&gt; &gt; <br>
&gt; &gt; The even crazier step would then be to add a VNC client, and then=
 you<br>
&gt; &gt; have an almost complete remote client.<br>
&gt; <br>
&gt; Similarly to the out-of-process feature (on the same host)?<br>
&gt; Are you also interested in remote use (different host)?<br>
<br>
I was mainly interested in it for remote access; but potentially this<br>
provides a clean break point to move all of the USB device emulation<br>
into one separate process.<br>
<br></blockquote><div><br></div><div>It&#39;s an idea I suggested a few tim=
es too, once at least during 2017 KVM Forum multi-process talk, &amp; when =
it was decided to implement usb CD emulation in spice-gtk (which I wish wou=
ld use existing qemu code instead, or the NBD server I implemented initiall=
y, long time ago..). So yup, I&#39;d like to see this happen too eventually=
. However it&#39;s not so attractive imho, you rather want virtio/vhost-use=
r and for other devices you don&#39;t have a choice I&#39;d focus on vfio-u=
ser. At some point hopefully, qemu should be able to provide a usb controll=
er via vfio-user if you need it.<br></div></div></div>

--000000000000ab811105bdadbc20--

