Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 688222F05F5
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 09:27:25 +0100 (CET)
Received: from localhost ([::1]:37488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyW4K-00033w-H7
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 03:27:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1kyW3B-0002ZK-8g
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 03:26:14 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:34863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1kyW38-0002Wq-3v
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 03:26:12 -0500
Received: by mail-pg1-x52b.google.com with SMTP id n7so10585771pgg.2
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 00:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U7m68xnFbWFkto9L7vRNFRRGPahBhKm69BfkH9JlObg=;
 b=IQWLVYJ5qecBTteAZ8xYi05hWiC9fsz5aiX5ytZqQYqgKjb71rSikD68VwXXEgTxbm
 05m2gPxo4PnahhdjeEuukmAJT3JD1OTVvEKGYupNqQ2U318lK1zgRIBD9w8uJ0nynbu3
 U/LrrCeHObOAIvybptLl3UmzwG+JLPfrrGfTxZbX3hu/rjmGguxFaANf1P20ws/AZbpm
 JXPC1v2PCBUz4zjBYZEuHN/d9qEvG7eDinlsPf0NegGnxMNSjZKoDWJ5KZq+RKK8PQjr
 jUvkj3QwP1VuLyeRpMcuSkybC/9o9Om/rV9H5Es2+XnFzkkzsF7BENG2gofjCJFK+pkg
 TTJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U7m68xnFbWFkto9L7vRNFRRGPahBhKm69BfkH9JlObg=;
 b=Ixln1o44Mh1PUZSo8YxXTxEi7BrZCXlG64PkUDSzud6Z+if+kZMeSd1KDOPzvb1yvZ
 zf2mIg5YJes83nUzwmykHZRjx9x2B8BdmB72z8MliqGoSIjlgnNxIuP0BSZJXNth6xB4
 U8c1llJWRtcszyMNeFEVyUdsQA/XnHTPtniBstnWmnRvfu8uIyspi/C+jOamRt5L04+X
 utsKfUAp+sHq3UHkQaV5pKfzPvnkcA+pynraSIBsHJUfKbGawIR2ZdMgtbEizEv196DT
 Y4GFi27/oa6ibzNdx16rN5WfcNjz31bnY71pdcPq1qvm4AXW5Cwl5xeX5CYBfa8uyNp0
 o19g==
X-Gm-Message-State: AOAM530Y2nyxIys39/KkciPq6jr5FlPJe6Z1+bGTdImHYZroFsbHPMaY
 oj5zD3DnlqjOvsHNUBjS7IPvcOR/BEO1WXCQiIs=
X-Google-Smtp-Source: ABdhPJxbU9vypP0dZdfQj7NLlMEwzATdNq46SYTSnC2cqvIKPaPf+/TrluY0hFoalKP7JhetjGWxYg4CZAb6133AfZw=
X-Received: by 2002:aa7:9357:0:b029:1a5:43da:b90d with SMTP id
 23-20020aa793570000b02901a543dab90dmr11606733pfn.54.1610267167847; Sun, 10
 Jan 2021 00:26:07 -0800 (PST)
MIME-Version: 1.0
References: <CAAQ-SiP8G28ade0jHbhTcv0jtGQb4OSgL5p3mAr0MU_FH8vZ3w@mail.gmail.com>
 <87a6tm2sxb.fsf@linaro.org>
 <CAAQ-SiOW8OnWEb0sHUEeS139-Tw0RO2YD1Tx-1s9iuy3ZVQFgw@mail.gmail.com>
 <878s941x85.fsf@linaro.org>
 <20210108083433.pfzhxrd4rezk6yxe@sirius.home.kraxel.org>
In-Reply-To: <20210108083433.pfzhxrd4rezk6yxe@sirius.home.kraxel.org>
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
Date: Sun, 10 Jan 2021 13:55:56 +0530
Message-ID: <CAAQ-SiO4VvVTo77J2ga1FmUZ9yrwopeASweO6-AFaakrAUZ80w@mail.gmail.com>
Subject: Re: VirtioSound device emulation implementation
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000088788d05b8878a1a"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pg1-x52b.google.com
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000088788d05b8878a1a
Content-Type: text/plain; charset="UTF-8"

Hi,

I have been reading about the virtio and vhost specifications, however I
have a few doubts. I tried looking for them but I still
do not understand them clearly enough. From what I understand, there are
two protocols:

The virtio protocol: The one that specifies how we can have common
emulation for virtual devices. The front end drivers
interact with these devices, and these devices could then process the
information that they have received either in QEMU,
or somewhere else. From what I understand the front driver uses mmaps to
communicate with the virtio device.

The vhost protocol: The one that specifies how we can _offload_ the
processing from QEMU to a separate process. We
want to offload so that we do not have to stop the guest when we are
processing information passed to a virtio device. This
service could either be implemented in the host kernel or the host
userspace. Now when we offload the processing, we map the
memory of the device to this vhost service, so that this service has all
the information that it should process.
  Also, this process can generate the vCPU interrupts, and this process
responds to the ioeventfd notifications.

What I do not understand is, once we have this vhost service, either in
userspace or in kernel space, which does the information processing,
why do we need a virtio device still emulated in QEMU? Is it only to pass
on the configurations between the driver and the
vhost service? I know that the vhost service doesn't emulate anything, but
then what is the difference between "processing" the
information and "emulating" a device?

Also, from article[3], moving the vhost-net service to userspace was faster
somehow. I am assuming this was only the case for
networking devices, and would not be true in general. Since there would be
more context switches between user and kernel space?
(KVM receives the irq/ioevent notification and then transfers control back
to user space, as opposed to when vhost was in kernel
space.)

For context, I've been reading the following:
[1]
https://www.redhat.com/en/blog/introduction-virtio-networking-and-vhost-net
[2] https://www.redhat.com/en/blog/deep-dive-virtio-networking-and-vhost-net
[3] https://www.redhat.com/en/blog/journey-vhost-users-realm

--00000000000088788d05b8878a1a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>I have been reading abou=
t the virtio and vhost specifications, however I have a few doubts. I tried=
 looking for them but I still</div><div>do not understand them clearly enou=
gh. From what I understand, there are two protocols:</div><div><br></div><d=
iv>The virtio protocol: The one that specifies how we can have common emula=
tion for virtual devices. The front end drivers</div><div>interact with the=
se devices, and these devices could then process the information that they =
have received either in QEMU,</div><div>or somewhere else. From what I unde=
rstand the front driver uses mmaps to communicate with the virtio device. <=
br></div><div><br></div><div>The vhost protocol: The one that specifies how=
 we can _offload_ the processing from QEMU to a separate process. We</div><=
div>want to offload so that we do not have to stop the guest when we are pr=
ocessing information passed to a virtio device. This</div><div>service coul=
d either be implemented in the host kernel or the host userspace. Now when =
we offload the processing, we map the</div><div>memory of the device to thi=
s vhost service, so that this service has all the information that it shoul=
d process.</div><div>=C2=A0 Also, this process can generate the vCPU interr=
upts, and this process responds to the ioeventfd notifications. <br></div><=
div><br></div><div>What I do not understand is, once we have this vhost ser=
vice, either in userspace or in kernel space, which does the information pr=
ocessing,</div><div>why do we need a virtio device still emulated in QEMU? =
Is it only to pass on the configurations between the driver and the</div><d=
iv>vhost service? I know that the vhost service doesn&#39;t emulate anythin=
g, but then what is the difference between &quot;processing&quot; the</div>=
<div>information and &quot;emulating&quot; a device?</div><div><br></div><d=
iv>Also, from article[3], moving the vhost-net service to userspace was fas=
ter somehow. I am assuming this was only the case for</div><div>networking =
devices, and would not be true in general. Since there would be more contex=
t switches between user and kernel space?</div><div>(KVM receives the irq/i=
oevent notification and then transfers control back to user space, as oppos=
ed to when vhost was in kernel</div><div>space.)<br></div><div><br></div><d=
iv>For context, I&#39;ve been reading the following:</div><div>[1] <a href=
=3D"https://www.redhat.com/en/blog/introduction-virtio-networking-and-vhost=
-net">https://www.redhat.com/en/blog/introduction-virtio-networking-and-vho=
st-net</a></div><div>[2] <a href=3D"https://www.redhat.com/en/blog/deep-div=
e-virtio-networking-and-vhost-net">https://www.redhat.com/en/blog/deep-dive=
-virtio-networking-and-vhost-net</a></div><div>[3] <a href=3D"https://www.r=
edhat.com/en/blog/journey-vhost-users-realm">https://www.redhat.com/en/blog=
/journey-vhost-users-realm</a></div><div><br> </div></div>

--00000000000088788d05b8878a1a--

