Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2A037F3FA
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 10:22:44 +0200 (CEST)
Received: from localhost ([::1]:39990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh6cE-0001m0-Vv
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 04:22:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangjiachen.jaycee@bytedance.com>)
 id 1lh6ae-0000KM-BA
 for qemu-devel@nongnu.org; Thu, 13 May 2021 04:21:04 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:35404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhangjiachen.jaycee@bytedance.com>)
 id 1lh6aY-0005ZS-RB
 for qemu-devel@nongnu.org; Thu, 13 May 2021 04:21:02 -0400
Received: by mail-qt1-x82d.google.com with SMTP id c11so19120625qth.2
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 01:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l7L2znK2f0zqMyDvrSJq8fah8dMOz2i3I6OVYRzOwE8=;
 b=Yvt+AJkSxSwyLDeAFCEhduYLsTjONEu+ol9jnRE/zBKAAKqxYiLam0148D0h08+z7Z
 DTREDrPUC3kS07/Ofl12GZqFUQ0MTuFpZMCxKmz1EZsEdWvh5rcaN0SJFdWFUjuJrL5I
 qLd/zFdS9mBF8IA+4YJWeY8GH0W+0zFGafp5sdJmyWgjA4gp5ztgzLlXyoz4BNdb6p08
 ungcC+R5298g31rKOGrI8nZy0VYw29a0chA2I4iGi2wwZzDCrPb/P096jIwVfyNx11hE
 pTGgwwqaLXoEyMjkBcJy6/1Fg8nDORP6jbOpjjWh5raXZNLQNilTBBZy8RfWhaShGSRz
 BFoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l7L2znK2f0zqMyDvrSJq8fah8dMOz2i3I6OVYRzOwE8=;
 b=ugCrIisSwUEKF/PjNlPzHICKZ5+UkUuvpMvVzy5EWlzwbkb8Bw8ufGjpxT6WV7PtR1
 BLHpLfeD7HZG3K6r/xPEJYFg4IrV6TnuyF7Uo+vF6RtGk+yMn9K0ROvLRo3T9Wstzgi7
 89TY+0piZqihwXYTmxUKWsdHEM9hnXTqPY8C6t3I8DmnV5LvTZQ6zsXuF2ZmBOCNqDNc
 BPEh+LiQSaYBu23RSsGkuGP5jr3+cRuq1NrtIegn3OZwPP5G8LohWk5ZI9j8gQjDPoZ1
 YjHgaW5YsjBfltS1BwphwKIkr1S237YQw657RvVmhk3QLAX/SxIJDsdMvRIIqsNu5vyO
 p1XA==
X-Gm-Message-State: AOAM531SelOX3NVfd8rLjF+Ui9CtaXsl2cxiseHh7dboH3Er8mM55htC
 5SmuTfr55Ykp3wCS1a6Pxhp7B//XloCi2VHkf1go3g==
X-Google-Smtp-Source: ABdhPJxQZUoMU3O84lKZX5MeelrZWqi3UzCvmMZ2KdSHYc6S/Whe1BJYsg7jYZ2axUUPKx0PbVqLL8LCBiJYIlYZwPE=
X-Received: by 2002:a05:622a:1044:: with SMTP id
 f4mr21585340qte.181.1620894032851; 
 Thu, 13 May 2021 01:20:32 -0700 (PDT)
MIME-Version: 1.0
References: <BY5PR11MB44018CADDC7A5C04F3D32BC4EA539@BY5PR11MB4401.namprd11.prod.outlook.com>
In-Reply-To: <BY5PR11MB44018CADDC7A5C04F3D32BC4EA539@BY5PR11MB4401.namprd11.prod.outlook.com>
From: Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>
Date: Thu, 13 May 2021 16:20:22 +0800
Message-ID: <CAFQAk7jhNzMqh9VcsxUmsqxM25K=cR546hpNUY+5M50-UHSg-A@mail.gmail.com>
Subject: Re: [Phishing Risk] [External] Re: [Virtio-fs] vhost-user
 reconnection and crash recovery
To: "Boeuf, Sebastien" <sebastien.boeuf@intel.com>
Content-Type: multipart/alternative; boundary="0000000000000c0e7505c231cdea"
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=zhangjiachen.jaycee@bytedance.com; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, LOTS_OF_MONEY=0.001,
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
Cc: "virtio-fs@redhat.com" <virtio-fs@redhat.com>,
 Yongji Xie <xieyongji@bytedance.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, fam.zheng@bytedance.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000c0e7505c231cdea
Content-Type: text/plain; charset="UTF-8"

Hi Stefan and Sebastien,

I think I should give some background context from my perspective.

For the virtiofsd crash reconnection (recovery) to QEMU, as said by
Stefan, we discussed the possible implementation on the bi-weekly virtio-fs
call. I had also sent an RFC patch to the virtio-fs mail-list (
https://patchwork.kernel.org/project/qemu-devel/cover/20201215162119.27360-1-zhangjiachen.jaycee@bytedance.com/),
we also have some discussion on the further revision direction in that
mail.

We also have some needs to support virtiofsd crash recovery when it is used
with cloud-hypervisor (https://github.com/cloud-hypervisor/cloud-hypervisor).
However, the virtiofsd crash reconnection RFC patch relies on
QEMU's vhost-user socket reconnection feature and QEMU's vhost-user
inflight I/O tracking feature, which are both not supported by
cloud-hypervisor.

So I also issued an initial pull-request of cloud-hypervisor vhost-user
socket reconnection (
https://github.com/cloud-hypervisor/cloud-hypervisor/pull/2387), which is
reviewed by Sebastien. Based on vhost-user socket reconnection, we also
want to further develop vhost-user inflight I/O tracking feature for
cloud-hypervisor, and finally to support virtiofsd crash reconnection.

I am sorry for the delayed patch-revision of the two patch sets. I hope I
can free up some time in these two months to make some further progress.

All the best,
Jiachen

On Tue, May 11, 2021 at 11:02 PM Boeuf, Sebastien <sebastien.boeuf@intel.com>
wrote:

> Hi Stefan,
>
> Thanks for the explanation.
>
> So reconnection for vhost-user is not a well defined behavior,
> and QEMU is doing its best to retry when possible, depending
> on each device.
>
> The guest does not know about it, so it's never notified that
> the device needs to be reset.
>
> But what about the vhost-user backend initialization? Does
> QEMU go again through initializing memory table, vrings, etc...
> since it can't assume anything from the backend?
>
> Thanks,
> Sebastien
>
> ------------------------------
> *From:* Stefan Hajnoczi
> *Sent:* Tuesday, May 11, 2021 2:45 PM
> *To:* Boeuf, Sebastien
> *Cc:* virtio-fs@redhat.com; qemu-devel@nongnu.org
> *Subject:* vhost-user reconnection and crash recovery
>
> Hi Sebastien,
> On #virtio-fs IRC you asked:
>
>  I have a vhost-user question regarding disconnection/reconnection. How
>  should this be handled? Let's say the vhost-user backend disconnects,
>  and reconnects later on, does QEMU reset the virtio device by notifying
>  the guest? Or does it simply reconnects to the backend without letting
>  the guest know about what happened?
>
> The vhost-user protocol does not have a generic reconnection solution.
> Reconnection is handled on a case-by-case basis because device-specific
> and implementation-specific state is involved.
>
> The vhost-user-fs-pci device in QEMU has not been tested with
> reconnection as far as I know.
>
> The ideal reconnection behavior is to resume the device from its
> previous state without disrupting the guest. Device state must survive
> reconnection in order for this to work. Neither QEMU virtiofsd nor
> virtiofsd-rs implement this today.
>
> virtiofs has a lot of state, making it particularly difficult to support
> either DEVICE_NEEDS_RESET or transparent vhost-user reconnection. We
> have discussed virtiofs crash recovery on the bi-weekly virtiofs call
> (https://etherpad.opendev.org/p/virtiofs-external-meeting). If you want
> to work on this then joining the call would be a good starting point to
> coordinate with others.
>
> One approach for transparent crash recovery is for virtiofsd to keep its
> state in tmpfs (e.g. inode/fd mappings) and open fds shared with a
> clone(2) process via CLONE_FILES. This way the virtiofsd process can
> terminate but its state persists in memory thanks to its clone process.
> The clone can then be used to launch the new virtiofsd process from the
> old state. This would allow the device to resume transparently with QEMU
> only reconnecting the vhost-user UNIX domain socket. This is an idea
> that we discussed in the bi-weekly virtiofs call.
>
> You mentioned device reset. VIRTIO 1.1 has the Device Status Field
> DEVICE_NEEDS_RESET flat that the device can use to tell the driver that
> a reset is necessary. This feature is present in the specification but
> not implemented in the Linux guest drivers. Again the reason is that
> handling it requires driver-specific logic for restoring state after
> reset...otherwise the device reset would be visible to userspace.
>
> Stefan
>
> ---------------------------------------------------------------------
> Intel Corporation SAS (French simplified joint stock company)
> Registered headquarters: "Les Montalets"- 2, rue de Paris,
> 92196 Meudon Cedex, France
> Registration Number:  302 456 199 R.C.S. NANTERRE
> Capital: 4,572,000 Euros
>
> This e-mail and any attachments may contain confidential material for
> the sole use of the intended recipient(s). Any review or distribution
> by others is strictly prohibited. If you are not the intended
> recipient, please contact the sender and delete all copies.
> _______________________________________________
> Virtio-fs mailing list
> Virtio-fs@redhat.com
> https://listman.redhat.com/mailman/listinfo/virtio-fs
>

--0000000000000c0e7505c231cdea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Stefan and Sebastien,<div><br></div><d=
iv>I think I should give some background context from my perspective.</div>=
<div><br></div><div>For the virtiofsd crash reconnection (recovery) to QEMU=
, as said by Stefan,=C2=A0we discussed the possible implementation on the b=
i-weekly virtio-fs call. I had also sent an RFC patch to the virtio-fs mail=
-list (<a href=3D"https://patchwork.kernel.org/project/qemu-devel/cover/202=
01215162119.27360-1-zhangjiachen.jaycee@bytedance.com/">https://patchwork.k=
ernel.org/project/qemu-devel/cover/20201215162119.27360-1-zhangjiachen.jayc=
ee@bytedance.com/</a>), we also have some discussion on the further revisio=
n direction in that mail.=C2=A0</div><div><br></div><div>We also have some =
needs to support virtiofsd crash recovery when it is used with cloud-hyperv=
isor (<a href=3D"https://github.com/cloud-hypervisor/cloud-hypervisor">http=
s://github.com/cloud-hypervisor/cloud-hypervisor</a>). However, the virtiof=
sd crash reconnection RFC patch relies on QEMU&#39;s=C2=A0vhost-user socket=
 reconnection feature and QEMU&#39;s=C2=A0vhost-user inflight I/O tracking =
feature, which are both not supported by cloud-hypervisor.</div><div><br></=
div><div>So I also issued=C2=A0an initial pull-request=C2=A0of cloud-hyperv=
isor vhost-user socket reconnection (<a href=3D"https://github.com/cloud-hy=
pervisor/cloud-hypervisor/pull/2387">https://github.com/cloud-hypervisor/cl=
oud-hypervisor/pull/2387</a>), which is reviewed by Sebastien. Based on=C2=
=A0vhost-user socket reconnection, we also want to further develop vhost-us=
er inflight I/O tracking feature for cloud-hypervisor, and finally to suppo=
rt virtiofsd crash reconnection.</div><div><br></div><div>I am sorry for th=
e delayed patch-revision of the two patch sets. I hope I can free up some t=
ime in these two months to make some further progress.</div><div><br></div>=
<div>All the best,</div><div>Jiachen</div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 11, 2021 at 11:02 PM =
Boeuf, Sebastien &lt;<a href=3D"mailto:sebastien.boeuf@intel.com">sebastien=
.boeuf@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">




<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Hi Stefan,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Thanks for the explanation.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
So reconnection for vhost-user is not a well defined behavior,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
and QEMU is doing its best to retry when possible, depending</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
on each device.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
The guest does not know about it, so it&#39;s never notified that</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
the device needs to be reset.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
But what about the vhost-user backend initialization? Does</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
QEMU go again through initializing memory table, vrings, etc...</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
since it can&#39;t assume anything from the backend?</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Thanks,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Sebastien<br>
</div>
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
<hr style=3D"display:inline-block;width:98%">
<b>From:</b> Stefan Hajnoczi<br>
<b>Sent:</b> Tuesday, May 11, 2021 2:45 PM<br>
<b>To:</b> Boeuf, Sebastien<br>
<b>Cc:</b> <a href=3D"mailto:virtio-fs@redhat.com" target=3D"_blank">virtio=
-fs@redhat.com</a>; <a href=3D"mailto:qemu-devel@nongnu.org" target=3D"_bla=
nk">qemu-devel@nongnu.org</a><br>
<b>Subject:</b> vhost-user reconnection and crash recovery
<div><br>
</div>
</div>
<div><font size=3D"2"><span style=3D"font-size:11pt">
<div>Hi Sebastien,<br>
On #virtio-fs IRC you asked:<br>
<br>
=C2=A0I have a vhost-user question regarding disconnection/reconnection. Ho=
w<br>
=C2=A0should this be handled? Let&#39;s say the vhost-user backend disconne=
cts,<br>
=C2=A0and reconnects later on, does QEMU reset the virtio device by notifyi=
ng<br>
=C2=A0the guest? Or does it simply reconnects to the backend without lettin=
g<br>
=C2=A0the guest know about what happened?<br>
<br>
The vhost-user protocol does not have a generic reconnection solution.<br>
Reconnection is handled on a case-by-case basis because device-specific<br>
and implementation-specific state is involved.<br>
<br>
The vhost-user-fs-pci device in QEMU has not been tested with<br>
reconnection as far as I know.<br>
<br>
The ideal reconnection behavior is to resume the device from its<br>
previous state without disrupting the guest. Device state must survive<br>
reconnection in order for this to work. Neither QEMU virtiofsd nor<br>
virtiofsd-rs implement this today.<br>
<br>
virtiofs has a lot of state, making it particularly difficult to support<br=
>
either DEVICE_NEEDS_RESET or transparent vhost-user reconnection. We<br>
have discussed virtiofs crash recovery on the bi-weekly virtiofs call<br>
(<a href=3D"https://etherpad.opendev.org/p/virtiofs-external-meeting" rel=
=3D"noopener noreferrer" target=3D"_blank">https://etherpad.opendev.org/p/v=
irtiofs-external-meeting</a>). If you want<br>
to work on this then joining the call would be a good starting point to<br>
coordinate with others.<br>
<br>
One approach for transparent crash recovery is for virtiofsd to keep its<br=
>
state in tmpfs (e.g. inode/fd mappings) and open fds shared with a<br>
clone(2) process via CLONE_FILES. This way the virtiofsd process can<br>
terminate but its state persists in memory thanks to its clone process.<br>
The clone can then be used to launch the new virtiofsd process from the<br>
old state. This would allow the device to resume transparently with QEMU<br=
>
only reconnecting the vhost-user UNIX domain socket. This is an idea<br>
that we discussed in the bi-weekly virtiofs call.<br>
<br>
You mentioned device reset. VIRTIO 1.1 has the Device Status Field<br>
DEVICE_NEEDS_RESET flat that the device can use to tell the driver that<br>
a reset is necessary. This feature is present in the specification but<br>
not implemented in the Linux guest drivers. Again the reason is that<br>
handling it requires driver-specific logic for restoring state after<br>
reset...otherwise the device reset would be visible to userspace.<br>
<br>
Stefan<br>
</div>
</span></font></div>
</div>
<p>---------------------------------------------------------------------<br=
>
Intel Corporation SAS (French simplified joint stock company)<br>
Registered headquarters: &quot;Les Montalets&quot;- 2, rue de Paris, <br>
92196 Meudon Cedex, France<br>
Registration Number:=C2=A0 302 456 199 R.C.S. NANTERRE<br>
Capital: 4,572,000 Euros</p>

<p>This e-mail and any attachments may contain confidential material for<br=
>
the sole use of the intended recipient(s). Any review or distribution<br>
by others is strictly prohibited. If you are not the intended<br>
recipient, please contact the sender and delete all copies.</p></div>

_______________________________________________<br>
Virtio-fs mailing list<br>
<a href=3D"mailto:Virtio-fs@redhat.com" target=3D"_blank">Virtio-fs@redhat.=
com</a><br>
<a href=3D"https://listman.redhat.com/mailman/listinfo/virtio-fs" rel=3D"no=
referrer" target=3D"_blank">https://listman.redhat.com/mailman/listinfo/vir=
tio-fs</a><br>
</blockquote></div></div>

--0000000000000c0e7505c231cdea--

