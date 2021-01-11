Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB23A2F0CF1
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 07:32:54 +0100 (CET)
Received: from localhost ([::1]:50150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyql3-0004ul-WD
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 01:32:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1kyqiR-0004E3-4O
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 01:30:11 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:34030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1kyqiO-0002Y3-Qe
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 01:30:10 -0500
Received: by mail-pj1-x1034.google.com with SMTP id n3so7779410pjm.1
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 22:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=uBu3x2ia8Pr2SliR1n/xLZYzgvkVxLyp02q3qrd1zC4=;
 b=NOwWvCqn4j5NTOvnF9REsfy1vgQAqvcpQO+lGhxZu1DsiOrZDY+D5eUkcydwsKxPaG
 lxxC0PHNrC2Av5RQspTV1EhE5swX4+iwi+81XfNxWUHP5WocGmqHEwOsQG48CEgaL1uJ
 K7N85rGfZM02ecMRupN6d02rjLGF/BpBU2mUWUrG1ccwnbd7g4ASbN2XEHQHgjU4txaD
 GHXOTWe+RGS78J0pcJiVfbOhRY2JeiSiDCAoH/PK5xoBz2QkA+JkFD6bT5p5bC6lLL2s
 rtvYsDGu5sowGh2mrlR/GolHyDjY8B7bkiqHElbW2KMFHduyBvFKkNEyCbZMlmWJFNeA
 3cqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=uBu3x2ia8Pr2SliR1n/xLZYzgvkVxLyp02q3qrd1zC4=;
 b=UTvdEbVsjcvpqX4eJHEuYjLiQiY4eQVbrJFKv477UQpUqYQW+K5HQ6jKhMlASekdaQ
 TEfoq/db1xccKtZOpWqd6ywLHlAlIKJ0ygej1jnHRdLlMYL4V7F2jy3fgudP9hvrFZYn
 hGDQ3u+JG8K3ezqz/QGi5bZMLAz+bdrCQZgyfDZsmSCoYKD5A3YixQChCSIA6tV313zM
 Ny6JuNazP1GShDZTqI0BJiCfHM5BY5Hu8/A5sU6daiNyPWTapOAzK+eTVMOFhp3zB46E
 KxZgjIM1T/kiw73VcrvZwYCO3QHd2fsX4snFbbfQYFl12euam30iiEl9VR7GWacE4W/r
 Lv0g==
X-Gm-Message-State: AOAM5318fixvEOYne9aj/t8EPgZ112xSZ0UboV8rEy363KelGERWfAGv
 AIkHwmXQal3RsPAIe+SI40lpkvVZx+XEiR+8ccET9sUuZl8=
X-Google-Smtp-Source: ABdhPJxLZK3lLIMZlKCMfAtonfMTBJmvr5fCgNm6kR8zVuCoVGvcrnPgsvEYHzBn0ljI+Wp8EZ5rYNE1XfSOJS+4220=
X-Received: by 2002:a17:902:8341:b029:dc:27b:be2d with SMTP id
 z1-20020a1709028341b02900dc027bbe2dmr15462243pln.30.1610346606585; Sun, 10
 Jan 2021 22:30:06 -0800 (PST)
MIME-Version: 1.0
References: <CAAQ-SiP8G28ade0jHbhTcv0jtGQb4OSgL5p3mAr0MU_FH8vZ3w@mail.gmail.com>
 <87a6tm2sxb.fsf@linaro.org>
 <CAAQ-SiOW8OnWEb0sHUEeS139-Tw0RO2YD1Tx-1s9iuy3ZVQFgw@mail.gmail.com>
 <878s941x85.fsf@linaro.org>
 <20210108083433.pfzhxrd4rezk6yxe@sirius.home.kraxel.org>
 <CAAQ-SiO4VvVTo77J2ga1FmUZ9yrwopeASweO6-AFaakrAUZ80w@mail.gmail.com>
 <CAAQ-SiPiq5NQN=2mvP3isZ9PtYO2Bu64kVEvE6T+3OJd5B-U5A@mail.gmail.com>
In-Reply-To: <CAAQ-SiPiq5NQN=2mvP3isZ9PtYO2Bu64kVEvE6T+3OJd5B-U5A@mail.gmail.com>
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
Date: Mon, 11 Jan 2021 11:59:54 +0530
Message-ID: <CAAQ-SiMkJGBnxWSnybJqMD0LSASMtvA_wbrPDQcg-S+Y1ddjJA@mail.gmail.com>
Subject: Fwd: VirtioSound device emulation implementation
To: qemu-devel@nongnu.org,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000736a1505b89a0989"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pj1-x1034.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000736a1505b89a0989
Content-Type: text/plain; charset="UTF-8"

---------- Forwarded message ---------
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
Date: Mon, 11 Jan 2021 at 11:59
Subject: Re: VirtioSound device emulation implementation
To: Gerd Hoffmann <kraxel@redhat.com>




On Sun, 10 Jan 2021 at 13:55, Shreyansh Chouhan <
chouhan.shreyansh2702@gmail.com> wrote:

> Hi,
>
> I have been reading about the virtio and vhost specifications, however I
> have a few doubts. I tried looking for them but I still
> do not understand them clearly enough. From what I understand, there are
> two protocols:
>
> The virtio protocol: The one that specifies how we can have common
> emulation for virtual devices. The front end drivers
> interact with these devices, and these devices could then process the
> information that they have received either in QEMU,
> or somewhere else. From what I understand the front driver uses mmaps to
> communicate with the virtio device.
>
> The vhost protocol: The one that specifies how we can _offload_ the
> processing from QEMU to a separate process. We
> want to offload so that we do not have to stop the guest when we are
> processing information passed to a virtio device. This
> service could either be implemented in the host kernel or the host
> userspace. Now when we offload the processing, we map the
> memory of the device to this vhost service, so that this service has all
> the information that it should process.
>   Also, this process can generate the vCPU interrupts, and this process
> responds to the ioeventfd notifications.
>
> What I do not understand is, once we have this vhost service, either in
> userspace or in kernel space, which does the information processing,
> why do we need a virtio device still emulated in QEMU? Is it only to pass
> on the configurations between the driver and the
> vhost service? I know that the vhost service doesn't emulate anything, but
> then what is the difference between "processing" the
> information and "emulating" a device?
>
> Also, from article[3], moving the vhost-net service to userspace was
> faster somehow. I am assuming this was only the case for
> networking devices, and would not be true in general. Since there would be
> more context switches between user and kernel space?
> (KVM receives the irq/ioevent notification and then transfers control back
> to user space, as opposed to when vhost was in kernel
> space.)
>
> For context, I've been reading the following:
> [1]
> https://www.redhat.com/en/blog/introduction-virtio-networking-and-vhost-net
> [2]
> https://www.redhat.com/en/blog/deep-dive-virtio-networking-and-vhost-net
> [3] https://www.redhat.com/en/blog/journey-vhost-users-realm
>
>
Found the answers in this blog:
http://blog.vmsplice.net/2011/09/qemu-internals-vhost-architecture.html
In short, yes, the configuration plane still remains with QEMU. The
frontend driver interacts with the PCI
adapter emulated in QEMU, for configurations and memory map setup. Only the
data plane is forwarded
to the vhost service. This makes sense since we would only want to
configure the device once, and hence
having that emulated in QEMU is not a performance issue, as much as having
the data plane was.

There is still a little confusion in my mind regarding a few things, but I
think looking at the source code
of the already implemented drivers will clear that up for me. So that is
what I will be doing next.

I will start looking at the source code for in-QEMU and vhost
implementations of other virtio drivers, and then decide which one I'd like
to
go with. I will probably follow that decision with an implementation
plan/timeline so that everyone can follow the progress on the
development of this project.

--000000000000736a1505b89a0989
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">---------- Forwarded message ---------<br>From: <b class=3D=
"gmail_sendername" dir=3D"auto">Shreyansh Chouhan</b> <span dir=3D"auto">&l=
t;<a href=3D"mailto:chouhan.shreyansh2702@gmail.com">chouhan.shreyansh2702@=
gmail.com</a>&gt;</span><br>Date: Mon, 11 Jan 2021 at 11:59<br>Subject: Re:=
 VirtioSound device emulation implementation<br>To: Gerd Hoffmann &lt;<a hr=
ef=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt;<br></div><br><br>=
<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, 10 Jan 2021 at 13:55, Shreyan=
sh Chouhan &lt;<a href=3D"mailto:chouhan.shreyansh2702@gmail.com" target=3D=
"_blank">chouhan.shreyansh2702@gmail.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Hi,</div><div=
><br></div><div>I have been reading about the virtio and vhost specificatio=
ns, however I have a few doubts. I tried looking for them but I still</div>=
<div>do not understand them clearly enough. From what I understand, there a=
re two protocols:</div><div><br></div><div>The virtio protocol: The one tha=
t specifies how we can have common emulation for virtual devices. The front=
 end drivers</div><div>interact with these devices, and these devices could=
 then process the information that they have received either in QEMU,</div>=
<div>or somewhere else. From what I understand the front driver uses mmaps =
to communicate with the virtio device. <br></div><div><br></div><div>The vh=
ost protocol: The one that specifies how we can _offload_ the processing fr=
om QEMU to a separate process. We</div><div>want to offload so that we do n=
ot have to stop the guest when we are processing information passed to a vi=
rtio device. This</div><div>service could either be implemented in the host=
 kernel or the host userspace. Now when we offload the processing, we map t=
he</div><div>memory of the device to this vhost service, so that this servi=
ce has all the information that it should process.</div><div>=C2=A0 Also, t=
his process can generate the vCPU interrupts, and this process responds to =
the ioeventfd notifications. <br></div><div><br></div><div>What I do not un=
derstand is, once we have this vhost service, either in userspace or in ker=
nel space, which does the information processing,</div><div>why do we need =
a virtio device still emulated in QEMU? Is it only to pass on the configura=
tions between the driver and the</div><div>vhost service? I know that the v=
host service doesn&#39;t emulate anything, but then what is the difference =
between &quot;processing&quot; the</div><div>information and &quot;emulatin=
g&quot; a device?</div><div><br></div><div>Also, from article[3], moving th=
e vhost-net service to userspace was faster somehow. I am assuming this was=
 only the case for</div><div>networking devices, and would not be true in g=
eneral. Since there would be more context switches between user and kernel =
space?</div><div>(KVM receives the irq/ioevent notification and then transf=
ers control back to user space, as opposed to when vhost was in kernel</div=
><div>space.)<br></div><div><br></div><div>For context, I&#39;ve been readi=
ng the following:</div><div>[1] <a href=3D"https://www.redhat.com/en/blog/i=
ntroduction-virtio-networking-and-vhost-net" target=3D"_blank">https://www.=
redhat.com/en/blog/introduction-virtio-networking-and-vhost-net</a></div><d=
iv>[2] <a href=3D"https://www.redhat.com/en/blog/deep-dive-virtio-networkin=
g-and-vhost-net" target=3D"_blank">https://www.redhat.com/en/blog/deep-dive=
-virtio-networking-and-vhost-net</a></div><div>[3] <a href=3D"https://www.r=
edhat.com/en/blog/journey-vhost-users-realm" target=3D"_blank">https://www.=
redhat.com/en/blog/journey-vhost-users-realm</a></div><div><br></div></div>=
</blockquote><div><br></div><div>Found the answers in this blog: <a href=3D=
"http://blog.vmsplice.net/2011/09/qemu-internals-vhost-architecture.html" t=
arget=3D"_blank">http://blog.vmsplice.net/2011/09/qemu-internals-vhost-arch=
itecture.html</a></div><div>In short, yes, the configuration plane still re=
mains with QEMU. The frontend driver interacts with the PCI</div><div>adapt=
er emulated in QEMU, for configurations and memory map setup. Only the data=
 plane is forwarded</div><div>to the vhost service. This makes sense since =
we would only want to configure the device once, and hence</div><div>having=
 that emulated in QEMU is not a performance issue, as much as having the da=
ta plane was. <br></div><div><br></div><div>There is still a little confusi=
on in my mind regarding a few things, but I think looking at the source cod=
e</div><div>of the already implemented drivers will clear that up for me. S=
o that is what I will be doing next.<br></div><div><br></div><div>I will st=
art looking at the source code for in-QEMU and vhost implementations of oth=
er virtio drivers, and then decide which one I&#39;d like to</div><div>go w=
ith. I will probably follow that decision with an implementation plan/timel=
ine so that everyone can follow the progress on the</div><div>development o=
f this project.<br> </div></div></div>
</div></div>

--000000000000736a1505b89a0989--

