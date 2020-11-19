Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE31D2B98F7
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 18:09:58 +0100 (CET)
Received: from localhost ([::1]:35058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfnRV-0003PI-TP
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 12:09:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kfnQc-0002vh-Jj
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 12:09:02 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:34534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kfnQa-0000Bo-S3
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 12:09:02 -0500
Received: by mail-pg1-x543.google.com with SMTP id q28so4791864pgk.1
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 09:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s3jwRzYh5eBRDXKSUjnimUTZgZnImvs3tPqk9uLXKM8=;
 b=Q09CUPq3p7/L63rO5X2XHwdBmQzH9mQPiPutCAYOmwM2YyafFpTWV111jPTCymkG9Y
 ovduueR9oZ61aWho4Yz17uIz6uTEtuQXdUK4RvAHXzpkmm5rPE1t2Aw4+DSlciucvF5R
 jotssCUfpFMS6O+6wxZgAKOoZoHVV9f8HTl0+iSjpYCT1HGZhBFXrd3/8HtuVTjl7RYb
 bfRM/cst8SBFn9Zml/YxCxPxqLQqOnYCl2Dw3TuOxZf/jmFNY5DwqRr7toUCi6oLaFF4
 QE1LSxuIoEwA9v8eqE65TqJLI3JnEvsRzPIWESo/aSVW59lSNU/8gyo04pJUaw4YwwGt
 OFaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s3jwRzYh5eBRDXKSUjnimUTZgZnImvs3tPqk9uLXKM8=;
 b=ERZ4h28SNEubxaSEKxdUOEoYZl/vv0u3IBl5rZUDS6FBkGBDgsqh1sqFOmUPKJxPRT
 XtlNSkGI8xA0VSnB68yWZU1ZTiX5E3nixmq8OxeqMSqW1QuoimEaRKTegHl8ObA36Att
 D1TWSpctju7hpmsRZGxpMRWMqpF3tcWdyrZ6yqeodQImEDZG+BM+vILczHvYst7A/77Z
 W3Ioh64FlZw54IXXeqTTk2AW7kq5772SlxW0wex3qK3bwGPlVSE2sjWW4m8D28n0GmVj
 Tq5s/Uefo/JLz4CGdbp1eJr8hZBdLnq32xcmXCXLUg8tNdMnWYxUlNQGvR0oiic2jtO4
 oS0w==
X-Gm-Message-State: AOAM531OqvgDLfk1E2enu8OTHPEXnL/ext9SKMm7cKSUK3zerDJWR+6P
 FN1/gOkHafCBeSnySbO7NaAMYNJcvn3JGxesCd0=
X-Google-Smtp-Source: ABdhPJyDEv/rHjyCS4JMHft6qsXpnMX+lNmHydsgOhE+h0eF4acHxdAjpVUYkUc61MNhiw0Te7O/Sse7gIf5gynlGgY=
X-Received: by 2002:a63:4e49:: with SMTP id o9mr13956352pgl.61.1605805739158; 
 Thu, 19 Nov 2020 09:08:59 -0800 (PST)
MIME-Version: 1.0
References: <1605223150-10888-1-git-send-email-michael.christie@oracle.com>
 <20201117164043.GS131917@stefanha-x1.localdomain>
 <b3343762-bb11-b750-46ec-43b5556f2b8e@oracle.com>
 <20201118113117.GF182763@stefanha-x1.localdomain>
 <20201119094315-mutt-send-email-mst@kernel.org>
 <ceebdc90-3ffc-1563-ff85-12a848bcba18@oracle.com>
 <CAJSP0QUvSwX5NCPmfSODV_C+D41E21LZT=oXQ2PLc6baAsGGDQ@mail.gmail.com>
 <ffd88f0c-981e-a102-4b08-f29d6b9a0f71@oracle.com>
In-Reply-To: <ffd88f0c-981e-a102-4b08-f29d6b9a0f71@oracle.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 19 Nov 2020 17:08:47 +0000
Message-ID: <CAJSP0QUfqd=QNFa-RikH4dVcLmfcP-pYCwznP3W0zobYkM+KDw@mail.gmail.com>
Subject: Re: [PATCH 00/10] vhost/qemu: thread per IO SCSI vq
To: Mike Christie <michael.christie@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=stefanha@gmail.com; helo=mail-pg1-x543.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: fam <fam@euphon.net>, linux-scsi <linux-scsi@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 target-devel <target-devel@vger.kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 19, 2020 at 4:43 PM Mike Christie
<michael.christie@oracle.com> wrote:
>
> On 11/19/20 10:24 AM, Stefan Hajnoczi wrote:
> > On Thu, Nov 19, 2020 at 4:13 PM Mike Christie
> > <michael.christie@oracle.com> wrote:
> >>
> >> On 11/19/20 8:46 AM, Michael S. Tsirkin wrote:
> >>> On Wed, Nov 18, 2020 at 11:31:17AM +0000, Stefan Hajnoczi wrote:
> > struct vhost_run_worker_info {
> >      struct timespec *timeout;
> >      sigset_t *sigmask;
> >
> >      /* List of virtqueues to process */
> >      unsigned nvqs;
> >      unsigned vqs[];
> > };
> >
> > /* This blocks until the timeout is reached, a signal is received, or
> > the vhost device is destroyed */
> > int ret = ioctl(vhost_fd, VHOST_RUN_WORKER, &info);
> >
> > As you can see, userspace isn't involved with dealing with the
> > requests. It just acts as a thread donor to the vhost driver.
> >
> > We would want the VHOST_RUN_WORKER calls to be infrequent to avoid the
> > penalty of switching into the kernel, copying in the arguments, etc.
>
> I didn't get this part. Why have the timeout? When the timeout expires,
> does userspace just call right back down to the kernel or does it do
> some sort of processing/operation?
>
> You could have your worker function run from that ioctl wait for a
> signal or a wake up call from the vhost_work/poll functions.

An optional timeout argument is common in blocking interfaces like
poll(2), recvmmsg(2), etc.

Although something can send a signal to the thread instead,
implementing that in an application is more awkward than passing a
struct timespec.

Compared to other blocking calls we don't expect
ioctl(VHOST_RUN_WORKER) to return soon, so maybe the timeout will
rarely be used and can be dropped from the interface.

BTW the code I posted wasn't a carefully thought out proposal :). The
details still need to be considered and I'm going to be offline for
the next week so maybe someone else can think it through in the
meantime.

Stefan

