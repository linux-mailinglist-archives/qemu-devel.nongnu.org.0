Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C4557CC2F
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 15:43:16 +0200 (CEST)
Received: from localhost ([::1]:40158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEWSP-0004pW-RC
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 09:43:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oEWFI-0002C2-R6
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 09:29:41 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:39619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oEWFG-0007h7-Az
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 09:29:40 -0400
Received: by mail-yb1-xb31.google.com with SMTP id r3so2758244ybr.6
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 06:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wMzin7E5Cpn0OOA6iYcfFoj5uTks/7enwFRGFFvEKro=;
 b=StlbiD74wJTpiJhEMR9PHa+7fsYz3vLU8U1XVxJgUGwHkV8Fx9Yehk9kJnxGn0SNoS
 hdQpVvk6MHwgBiI7M5pR/xTXjl2kJyVRlUGR6T6V/tOCkxktV/1QQdTkwx36YvCNewFe
 cpt/ef3E+iXkFW0DIHMPrtemQMj8oyQd+sGxgEEqEKwaNXd/p8fb2uSVS0h3ybpYBh3j
 yar81wwPFme9HuwYCgazyPiQ3wH+mD6kedfNVeFjufXbtUucKp+eDkWg21uIzQjbvQaC
 vOq95E7vBreM1SY+8dpAZKTwF9AaYqnW9xKHetC2BPrn2H54STb9kw3zocxf/J2MlNlW
 vN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wMzin7E5Cpn0OOA6iYcfFoj5uTks/7enwFRGFFvEKro=;
 b=fl+E0XxXAXIriM5PmgmrfL5bJXqw3oBqzuVttwYDGXC6ek+tEgGu13gyh3kuLEkJ7i
 hyURsgYmun0JhEdWk24wcp/j0KiipBOpqsCJ4Ko/1/YtNDyruxzSvmLatHkvXjq8UCn5
 SMnsDN1yGU7Z1kL8Y99PmJ8RESgZTsx0NAr1GFeWTp2nHa+tb3A6EAd2Cxs1BaoDtXKP
 Hnxm1DhFd5JZ3ljTz7uZpmIVYBexNeIKYQZ2pJaAD3XUEXuobGO4oZu9z4kx1kW0YZl0
 1CdG+E0yTML0/HPeWSlGoNf+lnDxnrYCjIn5oRJSO6bYYeDl49Kh+2uflxaR3qw0rsKC
 uTcA==
X-Gm-Message-State: AJIora9nxfNxPQD6dcJ/QYH1pLNteM8fb673AqNKwAqvBTFXqQ4Y7vaa
 WdNjnH3RDlriuWZjWE48kStlCkKUPNAmBJtg5/JbPLovCi8=
X-Google-Smtp-Source: AGRyM1tDVS8izVo533z+0Aiwf4MJETFj5rApYulRswC0u7m7nMGvVHzUya+z95NiEpoP0pexO+JJtRfFSoIWfQw6ZfI=
X-Received: by 2002:a25:4101:0:b0:670:87d4:9c36 with SMTP id
 o1-20020a254101000000b0067087d49c36mr9836388yba.366.1658410176634; Thu, 21
 Jul 2022 06:29:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220709043503.2228736-1-fanjinhao21s@ict.ac.cn>
 <CAJSP0QWSGG4=Vj2j5yw2o13FrHbSC0WZ=MJgPj6Jio_5WhvOyw@mail.gmail.com>
 <4BB551D8-F877-4382-A4B9-D6913580AAE1@ict.ac.cn>
In-Reply-To: <4BB551D8-F877-4382-A4B9-D6913580AAE1@ict.ac.cn>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 21 Jul 2022 09:29:22 -0400
Message-ID: <CAJSP0QUf4K=N7ZDAXrB3WvUxx4DoA4Sg0hSTri1WKGTnsMtN2g@mail.gmail.com>
Subject: Re: [RFC] hw/nvme: Use irqfd to send interrupts
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Klaus Birkelund Jensen <its@irrelevant.dk>, 
 Keith Busch <kbusch@kernel.org>
Content-Type: multipart/alternative; boundary="00000000000078655105e450b5c1"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000078655105e450b5c1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 20, 2022, 22:36 Jinhao Fan <fanjinhao21s@ict.ac.cn> wrote:

> Hi Stefan,
>
> Thanks for the detailed explanation!
>
> at 6:21 PM, Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> > Hi Jinhao,
> > Thanks for working on this!
> >
> > irqfd is not necessarily faster than KVM ioctl interrupt injection.
> >
> > There are at least two non performance reasons for irqfd:
> > 1. It avoids QEMU emulation code, which historically was not thread saf=
e
> and needed the Big QEMU Lock. IOThreads don't hold the BQL and therefore
> cannot safely call the regular interrupt emulation code in QEMU. I think
> this is still true today although parts of the code may now be less relia=
nt
> on the BQL.
>
> This probably means we need to move to irqfd when iothread support is add=
ed
> in qemu-nvme.
>

Yes. You can audit the interrupt code but I'm pretty sure there is shared
state that needs to be protected by the BQL. So the NVMe emulation code
probably needs to use irqfd to avoid the interrupt emulation code.


> > 2. The eventfd interface decouples interrupt injection from the KVM
> ioctl interface. Vhost kernel and vhost-user device emulation code has no
> dependency on KVM thanks to irqfd. They work with any eventfd, including
> irqfd.
>
> This is contrary to our original belief. Klaus once pointed out that irqf=
d
> is KVM specific. I agreed with him since I found irqfd implementation is =
in
> virt/kvm/eventfd.c. But irqfd indeed avoids the KVM ioctl call. Could you
> elaborate on what =E2=80=9Cno dependency on KVM=E2=80=9D means?
>

"They work with any eventfd, including irqfd"

If you look at the vhost kernel or vhost-user code, you'll see they just
signal the eventfd. It doesn't have to be an irqfd.

An irqfd is a specific type of eventfd that the KVM kernel module
implements to inject interrupts when the eventfd is signaled.

By the way, this not only decouples vhost from the KVM kernel module, but
also allows QEMU to emulate MSI-X masking via buffering the interrupt in
userspace.


> > 2. How can I debug this kind of cross QEMU-KVM problems?
> >
> > perf(1) is good at observing both kernel and userspace activity
> together. What is it that you want to debug.
> >
>
> I=E2=80=99ll look into perf(1). I think what I was trying to do is like a=
 breakdown
> analysis on which part caused the latency. For example, what is the root
> cause of the performance improvements or regressions when irqfd is turned
> on.
>

Nice, perf(1) is good for that. You can enable trace events and add
kprobes/uprobes to record timestamps when specific functions are entered.

>
> > What happens when the MSI-X vector is masked?
> >
> > I remember the VIRTIO code having masking support. I'm on my phone and
> can't check now, but I think it registers a temporary eventfd and buffers
> irqs while the vector is masked.
>
> Yes, this RFC ignored interrupt masking support.
>
> >
> > This makes me wonder if the VIRTIO and NVMe IOThread irqfd code can be
> unified. Maybe IOThread support can be built into the core device emulati=
on
> code (e.g. irq APIs) so that it's not necessary to duplicate it.
> >
>
> Agreed. Recently when working on ioeventfd, iothread and polling support,
> my
> typical workflow is to look at how virtio does that and adjust that code
> into nvme. I think unifying their IOThread code can be beneficial since
> VIRTIO has incorporated many optimizations over the years that can not be
> directly enjoyed by nvme. But I fear that subtle differences in the two
> protocols may cause challenges for the unification.
>
> Again, thanks for your help :)
>

--00000000000078655105e450b5c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Jul 20, 2022, 22:36 Jinhao Fan &lt;<a href=3D"=
mailto:fanjinhao21s@ict.ac.cn">fanjinhao21s@ict.ac.cn</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">Hi Stefan,<br>
<br>
Thanks for the detailed explanation! <br>
<br>
at 6:21 PM, Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@gmail.com" targe=
t=3D"_blank" rel=3D"noreferrer">stefanha@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Hi Jinhao,<br>
&gt; Thanks for working on this!<br>
&gt; <br>
&gt; irqfd is not necessarily faster than KVM ioctl interrupt injection.<br=
>
&gt; <br>
&gt; There are at least two non performance reasons for irqfd:<br>
&gt; 1. It avoids QEMU emulation code, which historically was not thread sa=
fe and needed the Big QEMU Lock. IOThreads don&#39;t hold the BQL and there=
fore cannot safely call the regular interrupt emulation code in QEMU. I thi=
nk this is still true today although parts of the code may now be less reli=
ant on the BQL.<br>
<br>
This probably means we need to move to irqfd when iothread support is added=
<br>
in qemu-nvme.<br></blockquote></div></div><div dir=3D"auto"><br></div><div =
dir=3D"auto">Yes. You can audit the interrupt code but I&#39;m pretty sure =
there is shared state that needs to be protected by the BQL. So the NVMe em=
ulation code probably needs to use irqfd to avoid the interrupt emulation c=
ode.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">
<br>
&gt; 2. The eventfd interface decouples interrupt injection from the KVM io=
ctl interface. Vhost kernel and vhost-user device emulation code has no dep=
endency on KVM thanks to irqfd. They work with any eventfd, including irqfd=
.<br>
<br>
This is contrary to our original belief. Klaus once pointed out that irqfd<=
br>
is KVM specific. I agreed with him since I found irqfd implementation is in=
<br>
virt/kvm/eventfd.c. But irqfd indeed avoids the KVM ioctl call. Could you<b=
r>
elaborate on what =E2=80=9Cno dependency on KVM=E2=80=9D means?<br></blockq=
uote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">&quot;They w=
ork with any eventfd, including irqfd&quot;</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">If you look at the vhost kernel or vhost-user code, you=
&#39;ll see they just signal the eventfd. It doesn&#39;t have to be an irqf=
d.</div><div dir=3D"auto"><br></div><div dir=3D"auto">An irqfd is a specifi=
c type of eventfd that the KVM kernel module implements to inject interrupt=
s when the eventfd is signaled.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">By the way, this not only decouples vhost from the KVM kernel mod=
ule, but also allows QEMU to emulate MSI-X masking via buffering the interr=
upt in userspace.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div c=
lass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt; 2. How can I debug this kind of cross QEMU-KVM problems?<br>
&gt; <br>
&gt; perf(1) is good at observing both kernel and userspace activity togeth=
er. What is it that you want to debug.<br>
&gt; <br>
<br>
I=E2=80=99ll look into perf(1). I think what I was trying to do is like a b=
reakdown<br>
analysis on which part caused the latency. For example, what is the root<br=
>
cause of the performance improvements or regressions when irqfd is turned<b=
r>
on.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Nice, perf(1) is good for that. You can enable trace events and add kpro=
bes/uprobes to record timestamps when specific functions are entered.</div>=
<div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>
<br>
&gt; What happens when the MSI-X vector is masked?<br>
&gt; <br>
&gt; I remember the VIRTIO code having masking support. I&#39;m on my phone=
 and can&#39;t check now, but I think it registers a temporary eventfd and =
buffers irqs while the vector is masked.<br>
<br>
Yes, this RFC ignored interrupt masking support. <br>
<br>
&gt; <br>
&gt; This makes me wonder if the VIRTIO and NVMe IOThread irqfd code can be=
 unified. Maybe IOThread support can be built into the core device emulatio=
n code (e.g. irq APIs) so that it&#39;s not necessary to duplicate it.<br>
&gt; <br>
<br>
Agreed. Recently when working on ioeventfd, iothread and polling support, m=
y<br>
typical workflow is to look at how virtio does that and adjust that code<br=
>
into nvme. I think unifying their IOThread code can be beneficial since<br>
VIRTIO has incorporated many optimizations over the years that can not be<b=
r>
directly enjoyed by nvme. But I fear that subtle differences in the two<br>
protocols may cause challenges for the unification.<br>
<br>
Again, thanks for your help :)<br>
</blockquote></div></div></div>

--00000000000078655105e450b5c1--

