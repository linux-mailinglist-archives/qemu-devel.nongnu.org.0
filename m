Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB4E33F06A
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 13:34:23 +0100 (CET)
Received: from localhost ([::1]:38536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMVNW-0002wi-6o
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 08:34:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangjiachen.jaycee@bytedance.com>)
 id 1lMVM1-0002Ei-T1
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 08:32:50 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:44243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhangjiachen.jaycee@bytedance.com>)
 id 1lMVLx-0008AJ-5i
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 08:32:47 -0400
Received: by mail-qk1-x72c.google.com with SMTP id 130so38593114qkh.11
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 05:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wwTbuNPne9pTDpqWEBar9ogzQkO9XEiXzRQcmGkEMNw=;
 b=gCKfMWfPRCBcIrEgzD5LWIEdI8O0W7zntE76aG7NhdKUvSoZf1JeDyCbr88wiMGMK/
 J1tzci2SDWrjpQ5vCqon8CEuU+Bxo32PzkaZa8tOSrP43PCCoNOKytVKL8nVrzjZR4Uo
 4gBHZsHRh5ikmxRxUDqbXRhJCRqH7jsO/JoGjvrtT70S9Ioy4v262uLI9tqdPivgSN8x
 sfPmzNwpi8H4xeR2OtyeEmYQOt+FCjKdY7Tdeem5/PQ4QyCF/b0mrGB/xpgwkKbgTTrY
 hf8F8a6tadMu5leSdcbkMgJKBeiiNfOncIjGH0DL0xZO6+vC6CVjAnqXFUg2nwRyIBPS
 W4wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wwTbuNPne9pTDpqWEBar9ogzQkO9XEiXzRQcmGkEMNw=;
 b=pQ7KxiIQv8T0GxFdlRAXcq5NR9FXv/9x5yOOcyLh6cVAYDfCkZyc82OE5Fi8syTgsR
 MBO+GG0relvVEIkz94nEAegleaaBD8VOLfL8XGdXhqrYJ1ITYXOFL7Qzga8Y8nqCPMpL
 puAg4q8XROJWeD6Ewg4Xgt8gFtyAwr3kvbSdhvACDzexPCfNX7hmPWfgKDmkThlOBPMi
 eRh/Ap6+XMUV5q+LAr6ul4SghbzMFbsp3cpo79iEs3zFTCBz4bMQVUWeXQhYvx3N9M6X
 gekvpDB7BUnrGlAFLXcC4ezIBd5ihGp6/UjV3TduWMyUUcfbh1NC11usZtkRHuJ/ZYrw
 rcWw==
X-Gm-Message-State: AOAM533U2a/JfKYMDk9kJPkfeBOjTLH4A3M6qi6pn1GAG92NmFhfR0fD
 Wz3WzUBzkk6p7bUJySGhWDKHvWEN5PJHFMrWbYxU0g==
X-Google-Smtp-Source: ABdhPJzZgDNdO+gVeJeuTn368RmbdMATezSFJ5aX6j5XeR5hWrmRNXI6mLVn1GRv4pfv8J+a+8452vDfUJ6RwAltzK4=
X-Received: by 2002:a37:cc7:: with SMTP id 190mr4572841qkm.99.1615984362653;
 Wed, 17 Mar 2021 05:32:42 -0700 (PDT)
MIME-Version: 1.0
References: <20201215162119.27360-1-zhangjiachen.jaycee@bytedance.com>
 <CAJ+F1CLZ4VtgKp5fEdC70m22PgV2VHvRHunR-nPOWDnJPFvqqg@mail.gmail.com>
 <CAFQAk7hCqSMMfRjUO8vtK-B2cKxJZZTJgSDAbRycd1AOSktM_w@mail.gmail.com>
 <YFHUbEdszo4nursr@stefanha-x1.localdomain>
In-Reply-To: <YFHUbEdszo4nursr@stefanha-x1.localdomain>
From: Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>
Date: Wed, 17 Mar 2021 20:32:31 +0800
Message-ID: <CAFQAk7ia5HsX0e4WBrhDtytGKnd5LsPrUSz9DJVFoo+ShDRP7Q@mail.gmail.com>
Subject: Re: [External] Re: [RFC PATCH 0/9] Support for Virtio-fs daemon crash
 reconnection
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000e66ecd05bdbaadc9"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=zhangjiachen.jaycee@bytedance.com; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>, slp@redhat.com,
 "Michael S . Tsirkin" <mst@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, virtio-fs@redhat.com,
 Xie Yongji <xieyongji@bytedance.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e66ecd05bdbaadc9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 17, 2021 at 6:05 PM Stefan Hajnoczi <stefanha@redhat.com> wrote=
:

> On Fri, Dec 18, 2020 at 05:39:34PM +0800, Jiachen Zhang wrote:
> > Thanks for the suggestions. Actually, we choose to save all state
> > information to QEMU because a virtiofsd has the same lifecycle as its
> > QEMU master. However, saving things to a file do avoid communication wi=
th
> > QEMU, and we no longer need to increase the complexity of vhost-user
> > protocol. The suggestion to save fds to the systemd is also very
> reasonable
> > if we don't consider the lifecycle issues, we will try it.
>
> Hi,
> We recently discussed crash recovery in the virtio-fs bi-weekly call and
> I read some of this email thread because it's a topic I'm interested in.
>
> I agree with Marc-Andr=C3=A9 that storing file descriptors does not need =
to
> be in the vhost-user protocol. The lifetime of a vhost-user device
> backend is not controlled by the VMM since the device backend is
> launched separately. Therefore it's reasonable for the component that
> launched the device backend to also have the responsibility of cleaning
> up the vhost-user device backend.
>
> Using the sd_notify(3) interface is a neat idea. It's supported natively
> by systemd but you can also implement a compatible interface in your own
> software. This way the vhost-user device backend can be launched using
> systemd or your own software.
>
> That said, if people find it more convenient to store fds using the
> vhost-user protocol, then I think that is enough justification to add a
> generic message to the vhost-user protocol. The important thing is to
> make the message generic so it solves all crash recovery use cases. The
> inflight fd messages were too specific and now we're having to think
> about adding more messages again.
>
> Stefan
>


Hi, Stefan,

I agreed with you that a virtiofsd must be launched by a software like
systemd. So we are planning to define more generic persist/restore
interfaces (callbacks). Then anyone can implement their own persist/restore
callbacks to store states to proper places.  And I think in the next
version we will implement default callbacks for the interfaces. Instead of
vhost-user messages, systemd's sd_notify(3) will be the default method for
storing fds, and several tmpfs files can be the default place to store the
shm regions.

Jiachen

--000000000000e66ecd05bdbaadc9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Mar 17, 2021 at 6:05 PM Stefan Ha=
jnoczi &lt;<a href=3D"mailto:stefanha@redhat.com">stefanha@redhat.com</a>&g=
t; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">On Fri, Dec 18, 2020 at 05:39:34PM +0800, Jiachen Zhan=
g wrote:<br>
&gt; Thanks for the suggestions. Actually, we choose to save all state<br>
&gt; information to QEMU because a virtiofsd has the same lifecycle as its<=
br>
&gt; QEMU master. However, saving things to a file do avoid communication w=
ith<br>
&gt; QEMU, and we no longer need to increase the complexity of vhost-user<b=
r>
&gt; protocol. The suggestion to save fds to the systemd is also very reaso=
nable<br>
&gt; if we don&#39;t consider the lifecycle issues, we will try it.<br>
<br>
Hi,<br>
We recently discussed crash recovery in the virtio-fs bi-weekly call and<br=
>
I read some of this email thread because it&#39;s a topic I&#39;m intereste=
d in.<br>
<br>
I agree with Marc-Andr=C3=A9 that storing file descriptors does not need to=
<br>
be in the vhost-user protocol. The lifetime of a vhost-user device<br>
backend is not controlled by the VMM since the device backend is<br>
launched separately. Therefore it&#39;s reasonable for the component that<b=
r>
launched the device backend to also have the responsibility of cleaning<br>
up the vhost-user device backend.<br>
<br>
Using the sd_notify(3) interface is a neat idea. It&#39;s supported nativel=
y<br>
by systemd but you can also implement a compatible interface in your own<br=
>
software. This way the vhost-user device backend can be launched using<br>
systemd or your own software.<br>
<br>
That said, if people find it more convenient to store fds using the<br>
vhost-user protocol, then I think that is enough justification to add a<br>
generic message to the vhost-user protocol. The important thing is to<br>
make the message generic so it solves all crash recovery use cases. The<br>
inflight fd messages were too specific and now we&#39;re having to think<br=
>
about adding more messages again.<br>
<br>
Stefan<br></blockquote><div><br></div><div><br></div><div>Hi, Stefan,</div>=
<div><br></div><div>I agreed with you that a virtiofsd must be launched by =
a software like systemd. So we are planning to define more generic persist/=
restore interfaces (callbacks). Then anyone can implement their own persist=
/restore callbacks to store states to proper places.=C2=A0 And I think in t=
he next version we will implement default callbacks for the interfaces. Ins=
tead of vhost-user messages, systemd&#39;s sd_notify(3) will be the default=
 method for storing fds, and several tmpfs files can be the default place t=
o store the shm regions.</div><div><br></div><div>Jiachen</div><div><br></d=
iv><div><br></div></div></div>

--000000000000e66ecd05bdbaadc9--

