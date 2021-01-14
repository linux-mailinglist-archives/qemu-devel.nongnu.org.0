Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BD32F63D2
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 16:10:40 +0100 (CET)
Received: from localhost ([::1]:43594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l04Gl-000542-KP
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 10:10:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1l047X-0000li-Sj
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 10:01:07 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:43270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1l047U-0000K3-IW
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 10:01:07 -0500
Received: by mail-pl1-x636.google.com with SMTP id x12so3015942plr.10
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 07:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=phLv3Xcpn9jqmT/oljeKvGwUC4YtVHFxFH2yqM2+8u8=;
 b=cxT0pZJ3RYDz/giiGiE4FCe9yRoSevqcOt8GpXK+kcGxBU4km+BrNmXvx5D5aZNcRR
 am6EpMvGoi6oo6swH3fsSe0H0tfLJkqvf5DqgurC9yJMz4iKCPLj5PegVh+BAixeA8xu
 wUodkAceCtSnup8PLjIX9swDVCIn6KgAqvmFvUb6QNeb6+Tvv43hbnvLLavAxPfhmWH8
 R5qPycKkzlMm/Cs087nNL7KAxFkaieRbg5CH0Xex4dkhFlbR3kIlxVXpbOUhosX2P2QD
 7h06gRq0D4VJ5a3y7xr9UHFctWGH85/5A6QmUEuyMeNquj77/rYlQjGninebLPW73g9j
 0x3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=phLv3Xcpn9jqmT/oljeKvGwUC4YtVHFxFH2yqM2+8u8=;
 b=a5OOfDxoOjFI1L1ntSya01sALB3wshDh8rSLlPPkX5mq2s7JhzvDGtDns+exX1hjjO
 h+SpH2d6IsCpvzBDY+SjtrBcowPae36ztHC+pyIlqexny1NgEcm36XSJVlWEcHcMhUPS
 DoQLOwnuvLB/CsPNuHDHgd2eet4n0QCON2Dgmxb5hGxrLgT3dC9xbyGO/f533lE/y+Ln
 l7DWkoft5i9s/xB1sSGhD9FF+J/SdCmY6GnmNdbH/QDEtdvhZ0O5vl0AZWg2YgieOGPr
 RXy1WjSb209QfmHeOFFSakrd7csR2QC3Ol6dRfn8vYhxeyBoqxAdW4fo6qJPalrLDHqR
 y8qg==
X-Gm-Message-State: AOAM530Kd81XtlLC3K8mTKqYqG1y+f535PqKTZFrD26Br4Qtu+MS7HWr
 2HdmNLWzs+Wov69MBKG6dS+nnMc5PK07q4uUY0w=
X-Google-Smtp-Source: ABdhPJy58zsHasGZIqv6lJa5cRQKiEFkrw+yLx/ThB2HAVend2j1dG49V3RRMFy6pjFKkpQ4k3JjKrVW877Utx1xW60=
X-Received: by 2002:a17:902:8341:b029:dc:27b:be2d with SMTP id
 z1-20020a1709028341b02900dc027bbe2dmr7990475pln.30.1610636458147; Thu, 14 Jan
 2021 07:00:58 -0800 (PST)
MIME-Version: 1.0
References: <CAAQ-SiP8G28ade0jHbhTcv0jtGQb4OSgL5p3mAr0MU_FH8vZ3w@mail.gmail.com>
 <87a6tm2sxb.fsf@linaro.org>
 <CAAQ-SiOW8OnWEb0sHUEeS139-Tw0RO2YD1Tx-1s9iuy3ZVQFgw@mail.gmail.com>
 <878s941x85.fsf@linaro.org>
 <20210108083433.pfzhxrd4rezk6yxe@sirius.home.kraxel.org>
 <CAAQ-SiO4VvVTo77J2ga1FmUZ9yrwopeASweO6-AFaakrAUZ80w@mail.gmail.com>
 <CAAQ-SiPiq5NQN=2mvP3isZ9PtYO2Bu64kVEvE6T+3OJd5B-U5A@mail.gmail.com>
 <CAAQ-SiMkJGBnxWSnybJqMD0LSASMtvA_wbrPDQcg-S+Y1ddjJA@mail.gmail.com>
 <878s8zptrf.fsf@linaro.org>
In-Reply-To: <878s8zptrf.fsf@linaro.org>
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
Date: Thu, 14 Jan 2021 20:30:46 +0530
Message-ID: <CAAQ-SiNKXhJcT1XEodQT6kojqppq37Kg8F8igipQ-HVYOU0=zA@mail.gmail.com>
Subject: Re: Fwd: VirtioSound device emulation implementation
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f3441b05b8dd85b5"
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pl1-x636.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f3441b05b8dd85b5
Content-Type: text/plain; charset="UTF-8"

Just an update:

I've studied the virtio specification along with the source code and I now
understand what the device implementation is
going to look like. Also I understand the source code a lot better. I am
now reading about the qemu vhost-user protocol.

Although I haven't read about the vhost-user daemon in detail, from what
little I have read, I would say that the daemon
would get the virtqueues from the virtio device and forward it to the sound
device of the host. (This is the hard part
I think, since an in QEMU device would use code already written for
processing these queues.) I think only the tx and rx
queues would be shared, and although I do not know exactly how the sharing
will be implemented, I think the memory
will be shared to the vhost-user daemon too? So now the virtqueue memory is
shared between the virtio driver in guest
OS, the virtio device in QEMU, and the vhost-user daemon running in the
host userspace.

As for the configuration part, the driver will negotiate features with the
virtio device in QEMU, which in turn will communicate
with the vhost-user daemon (via sockets) to get the features supported I
think.

This is what I think it will roughly look like. (Of course modulo the
implementation details.) I do not yet understand how
much more difficult will implementing the vhost-user daemon be, and since I
was already
warned about the difficulty, I will not risk making any hasty decisions
that later hinder the project. I will read up
about the vhost-user daemon and how it's implemented to get a better idea,
and then make the final call.

Anyways I am super excited about the project. I got to learn about some
really cool things in the past couple of days,
and I can not wait to implement it. :)

--000000000000f3441b05b8dd85b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Just an update:<br><br></div><div>I&=
#39;ve studied the virtio specification along with the source code and I no=
w understand what the device implementation is <br></div><div>going to look=
 like. Also I understand the source code a lot better. I am now reading abo=
ut the qemu vhost-user protocol.</div><div><br></div><div>Although I haven&=
#39;t read about the vhost-user daemon in detail, from what little I have r=
ead, I would say that the daemon</div><div>would get the virtqueues from th=
e virtio device and forward it to the sound device of the host. (This is th=
e hard part</div><div>I think, since an in QEMU device would use code alrea=
dy written for processing these queues.) I think only the tx and rx</div><d=
iv>queues would be shared, and although I do not know exactly how the shari=
ng will be implemented, I think the memory</div><div>will be shared to the =
vhost-user daemon too? So now the virtqueue memory is shared between the vi=
rtio driver in guest</div><div>OS, the virtio device in QEMU, and the vhost=
-user daemon running in the host userspace. <br></div><div><br></div><div>A=
s for the configuration part, the driver will negotiate features with the v=
irtio device in QEMU, which in turn will communicate</div><div>with the vho=
st-user daemon (via sockets) to get the features supported I think. <br></d=
iv><div><br></div><div>This is what I think it will roughly look like. (Of =
course modulo the implementation details.) I do not yet understand how <br>=
</div><div>much more difficult will implementing the vhost-user daemon be, =
and since I was already<div>warned about the difficulty, I will not risk ma=
king any hasty decisions that later hinder the project. I will read up</div=
><div>about the vhost-user daemon and how it&#39;s implemented to get a bet=
ter idea, and then make the final call.<br></div></div><div><br></div><div>=
Anyways I am super excited about the project. I got to learn about some rea=
lly cool things in the past couple of days,</div><div>and I can not wait to=
 implement it. :)<br></div></div></div>

--000000000000f3441b05b8dd85b5--

