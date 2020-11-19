Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D38E2B97C8
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 17:26:38 +0100 (CET)
Received: from localhost ([::1]:34482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfmlZ-0008Dh-Kv
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 11:26:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kfmk4-00078M-Ip
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 11:25:04 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:46790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kfmk2-0000T0-Fr
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 11:25:04 -0500
Received: by mail-pg1-x544.google.com with SMTP id w4so4621277pgg.13
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 08:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZyaLeGcHosrNL0yuPcvoeG1cDM6m3aA84s9qCKOOfBk=;
 b=RC6kidTr2YeYPX2xrQeUj9TXC9NUQwXuxWUCxmczwSdXNLZDiF+Hm192e5v6Nx7h1V
 2HQeBBMuG07H+NKDJp6Klk7eaZWYXWe/1HmGLnUbbuHTGhqPDmRqkr4TgwgSMxPLzEKm
 pZOHAaOnQP8uQaBdD2aUzg8vZ6vIsdsAubxi857Ubqnl972mpRTvlQFxc1pMvXGH5yVR
 MyqK5FO5f3CO8fIWtHM6pUuUoMACdORbsEY9dOPNYq+lnhPx9j5260uWTPd7e/2fcG1J
 GY+HU+PFHxnB+B8XBW2v+S+JRoVJg0a3bPKxtDDY6OkxNLQSASYUA+QkeDWPQZg48czy
 RNZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZyaLeGcHosrNL0yuPcvoeG1cDM6m3aA84s9qCKOOfBk=;
 b=W1rQSL7E69LIHC6LlEf5GCswm0KItGEFW1EjCjYB5RUG6PFBpF3C/J3BpydeNdHRkW
 n9t0eOhZaeKWHgV1ICjyWfalaJvm8ods/kgLzJNn9neHWK12kLH4GACLiDGxhtOCuj8T
 1dDMIXOTVz+1DOFDeIl+odEjrTtFdBSzDRKlLPq2OLCOC46EqYXLOmmDzafbSONFwLk5
 Th6RwQ+qsd57mCvlXgbzIee3U0HZM544Z562iY5vIkfITEx82RnlgpExA1nfwD0n6TlK
 JWiah5e1TJ0q0oTrZ9OTV6v8H/8h9E+UioTPfAq/bDAw5GCEJCb58o7RfZ2lZ4pX5mBH
 czFA==
X-Gm-Message-State: AOAM532Kycx1AMC6/TOkfG01HZlfB+z2IVvOdHqxwimyGeyfZTDxaaTW
 OgPwj1wznNDfe616ZxtHHBS10sOQPHPmuDPTZ5g=
X-Google-Smtp-Source: ABdhPJyDYnKVIZrUrCssk5aQhnlSJp8mYzI8v3T4NKeqbt8PjfaNWHD6A4UIy617zEZO2F2zer3GCclErwArsUe2J8g=
X-Received: by 2002:a62:7ac2:0:b029:18b:c5bb:303d with SMTP id
 v185-20020a627ac20000b029018bc5bb303dmr9842717pfc.71.1605803100948; Thu, 19
 Nov 2020 08:25:00 -0800 (PST)
MIME-Version: 1.0
References: <1605223150-10888-1-git-send-email-michael.christie@oracle.com>
 <20201117164043.GS131917@stefanha-x1.localdomain>
 <b3343762-bb11-b750-46ec-43b5556f2b8e@oracle.com>
 <20201118113117.GF182763@stefanha-x1.localdomain>
 <20201119094315-mutt-send-email-mst@kernel.org>
 <ceebdc90-3ffc-1563-ff85-12a848bcba18@oracle.com>
In-Reply-To: <ceebdc90-3ffc-1563-ff85-12a848bcba18@oracle.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 19 Nov 2020 16:24:49 +0000
Message-ID: <CAJSP0QUvSwX5NCPmfSODV_C+D41E21LZT=oXQ2PLc6baAsGGDQ@mail.gmail.com>
Subject: Re: [PATCH 00/10] vhost/qemu: thread per IO SCSI vq
To: Mike Christie <michael.christie@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=stefanha@gmail.com; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

On Thu, Nov 19, 2020 at 4:13 PM Mike Christie
<michael.christie@oracle.com> wrote:
>
> On 11/19/20 8:46 AM, Michael S. Tsirkin wrote:
> > On Wed, Nov 18, 2020 at 11:31:17AM +0000, Stefan Hajnoczi wrote:
> >>> My preference has been:
> >>>
> >>> 1. If we were to ditch cgroups, then add a new interface that would allow
> >>> us to bind threads to a specific CPU, so that it lines up with the guest's
> >>> mq to CPU mapping.
> >>
> >> A 1:1 vCPU/vq->CPU mapping isn't desirable in all cases.
> >>
> >> The CPU affinity is a userspace policy decision. The host kernel should
> >> provide a mechanism but not the policy. That way userspace can decide
> >> which workers are shared by multiple vqs and on which physical CPUs they
> >> should run.
> >
> > So if we let userspace dictate the threading policy then I think binding
> > vqs to userspace threads and running there makes the most sense,
> > no need to create the threads.
> >
>
> Just to make sure I am on the same page, in one of the first postings of
> this set at the bottom of the mail:
>
> https://www.spinics.net/lists/linux-scsi/msg148322.html
>
> I asked about a new interface and had done something more like what
> Stefan posted:
>
>    struct vhost_vq_worker_info {
>        /*
>         * The pid of an existing vhost worker that this vq will be
>         * assigned to. When pid is 0 the virtqueue is assigned to the
>         * default vhost worker. When pid is -1 a new worker thread is
>         * created for this virtqueue. When pid is -2 the virtqueue's
>         * worker thread is unchanged.
>         *
>         * If a vhost worker no longer has any virtqueues assigned to it
>         * then it will terminate.
>         *
>         * The pid of the vhost worker is stored to this field when the
>         * ioctl completes successfully. Use pid -2 to query the current
>         * vhost worker pid.
>         */
>        __kernel_pid_t pid;  /* in/out */
>
>        /* The virtqueue index*/
>        unsigned int vq_idx; /* in */
>    };
>
> This approach is simple and it allowed me to have userspace map queues
> and threads optimally for our setups.
>
> Note: Stefan, in response to your previous comment, I am just using my
> 1:1 mapping as an example and would make it configurable from userspace.
>
> In the email above are you guys suggesting to execute the SCSI/vhost
> requests in userspace? We should not do that because:
>
> 1. It negates part of what makes vhost fast where we do not have to kick
> out to userspace then back to the kernel.
>
> 2. It's not doable or becomes a crazy mess because vhost-scsi is tied to
> the scsi/target layer in the kernel. You can't process the scsi command
> in userspace since the scsi state machine and all its configuration info
> is in the kernel's scsi/target layer.
>
> For example, I was just the maintainer of the target_core_user module
> that hooks into LIO/target on the backend (vhost-scsi hooks in on the
> front end) and passes commands to userspace and there we have a
> semi-shadow state machine. It gets nasty to try and maintain/sync state
> between lio/target core in the kernel and in userspace. We also see the
> perf loss I mentioned in #1.

No, if I understand Michael correctly he has suggested a different approach.

My suggestion was that the kernel continues to manage the worker
threads but an ioctl allows userspace to control the policy.

I think Michael is saying that the kernel shouldn't manage/create
threads. Userspace should create threads and then invoke an ioctl from
those threads.

The ioctl will call into the vhost driver where it will execute
something similar to vhost_worker(). So this ioctl will block while
the kernel is using the thread to process vqs.

What isn't clear to me is how to tell the kernel which vqs are
processed by a thread. We could try to pass that information into the
ioctl. I'm not sure what the cleanest solution is here.

Maybe something like:

struct vhost_run_worker_info {
    struct timespec *timeout;
    sigset_t *sigmask;

    /* List of virtqueues to process */
    unsigned nvqs;
    unsigned vqs[];
};

/* This blocks until the timeout is reached, a signal is received, or
the vhost device is destroyed */
int ret = ioctl(vhost_fd, VHOST_RUN_WORKER, &info);

As you can see, userspace isn't involved with dealing with the
requests. It just acts as a thread donor to the vhost driver.

We would want the VHOST_RUN_WORKER calls to be infrequent to avoid the
penalty of switching into the kernel, copying in the arguments, etc.

Michael: is this the kind of thing you were thinking of?

Stefan

