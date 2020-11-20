Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6162BA507
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 09:47:36 +0100 (CET)
Received: from localhost ([::1]:52972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg24t-0003uE-NZ
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 03:47:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kg23T-0002nl-P1
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 03:46:07 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:34828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kg23P-00079B-Lk
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 03:46:07 -0500
Received: by mail-pf1-x443.google.com with SMTP id g7so7212071pfc.2
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 00:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zzLhdipAOZ9XDbcgIs0h7PqDNReMT5wMo/AtToftNec=;
 b=n8GqcylgM95SMIeQwGPSut2nXHvOeygSf352H18yjXCxZiKOaeO/jlAMvcHrchT8HY
 TzIU680Wtcs9y2ru8pAdLN94RAd3ywkX70tqYGfhLBHUz1+I7D6EtysIVn8qcMCliVKn
 yB498fx/TXdvr1+NbYvJ2BGM70G00BR001H8UkYxu1SVfNl20G4TVKmRwwT2CuwXNCru
 qrqyU3kPcxGJEb81Am2Nelptu/6ktN7t1k5unnRwOiOrBLzdYVQX0zRQKsOpedUh6kK2
 nutqrMQsdWDUVtCJmTcjiXp+dOMIs+FUYifC93QWZAea7BsQw2+pSjhaTfWVXKslr+NO
 FSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zzLhdipAOZ9XDbcgIs0h7PqDNReMT5wMo/AtToftNec=;
 b=VdP/yYJulfMvi3862IXdxn2sgfdbjVmpAM28jzwgcdejdw7Oaz+3mM+0O7bORjVw9O
 GXSyToFYMiGzFfdBM5H29XtcSghzBa6Ze8Cdv/p50IivCgF0RyNiri/mLG1/bt8fzC1g
 UGJ25DZQhV3hVeoNM4y5j1qIb7Xjdw5P7BGROQfPW7Ahjr6gqzvNRMpOidB5r8SXGYfc
 bRhcffaOAVH4FADp/Q0LtLBmrTdv6hCLq8A12odoJnkYTKc/Zz36qo7RVlw4EIydcOKe
 i4SCX+XQUtKwFDQfEwf61TmZPlFq7BtiYBBcFrpDlOu6WovMx5DT1wKUnBl0GGHicVWJ
 dvoA==
X-Gm-Message-State: AOAM531HNhn0r7lX+18d5VlOh1FPAnx4BLmN7IOihv8BPMFb8b/jj7Jc
 9/hod1VcoP7pfKarIeC4MDeCRdDqNAORK1mLy20=
X-Google-Smtp-Source: ABdhPJwBAXGphEVi30nMDVfjF2cmDlkL9jj8SyvK56Jd2R64dGyHl7cXJfapXWClM+dJeOj6Ndmy9jW0HRU/cO4mJeY=
X-Received: by 2002:a62:7ac2:0:b029:18b:c5bb:303d with SMTP id
 v185-20020a627ac20000b029018bc5bb303dmr13010657pfc.71.1605861960893; Fri, 20
 Nov 2020 00:46:00 -0800 (PST)
MIME-Version: 1.0
References: <1605223150-10888-1-git-send-email-michael.christie@oracle.com>
 <20201117164043.GS131917@stefanha-x1.localdomain>
 <b3343762-bb11-b750-46ec-43b5556f2b8e@oracle.com>
 <20201118113117.GF182763@stefanha-x1.localdomain>
 <20201119094315-mutt-send-email-mst@kernel.org>
 <ceebdc90-3ffc-1563-ff85-12a848bcba18@oracle.com>
 <CAJSP0QUvSwX5NCPmfSODV_C+D41E21LZT=oXQ2PLc6baAsGGDQ@mail.gmail.com>
 <ffd88f0c-981e-a102-4b08-f29d6b9a0f71@oracle.com>
 <CAJSP0QUfqd=QNFa-RikH4dVcLmfcP-pYCwznP3W0zobYkM+KDw@mail.gmail.com>
In-Reply-To: <CAJSP0QUfqd=QNFa-RikH4dVcLmfcP-pYCwznP3W0zobYkM+KDw@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Fri, 20 Nov 2020 08:45:49 +0000
Message-ID: <CAJSP0QVu4P6c+kdFkhw1S_OEaj7B-eiDqFOVDxWAaSOcsAADrA@mail.gmail.com>
Subject: Re: [PATCH 00/10] vhost/qemu: thread per IO SCSI vq
To: Mike Christie <michael.christie@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=stefanha@gmail.com; helo=mail-pf1-x443.google.com
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
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 19, 2020 at 5:08 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> On Thu, Nov 19, 2020 at 4:43 PM Mike Christie
> <michael.christie@oracle.com> wrote:
> >
> > On 11/19/20 10:24 AM, Stefan Hajnoczi wrote:
> > > On Thu, Nov 19, 2020 at 4:13 PM Mike Christie
> > > <michael.christie@oracle.com> wrote:
> > >>
> > >> On 11/19/20 8:46 AM, Michael S. Tsirkin wrote:
> > >>> On Wed, Nov 18, 2020 at 11:31:17AM +0000, Stefan Hajnoczi wrote:
> > > struct vhost_run_worker_info {
> > >      struct timespec *timeout;
> > >      sigset_t *sigmask;
> > >
> > >      /* List of virtqueues to process */
> > >      unsigned nvqs;
> > >      unsigned vqs[];
> > > };
> > >
> > > /* This blocks until the timeout is reached, a signal is received, or
> > > the vhost device is destroyed */
> > > int ret = ioctl(vhost_fd, VHOST_RUN_WORKER, &info);
> > >
> > > As you can see, userspace isn't involved with dealing with the
> > > requests. It just acts as a thread donor to the vhost driver.
> > >
> > > We would want the VHOST_RUN_WORKER calls to be infrequent to avoid the
> > > penalty of switching into the kernel, copying in the arguments, etc.
> >
> > I didn't get this part. Why have the timeout? When the timeout expires,
> > does userspace just call right back down to the kernel or does it do
> > some sort of processing/operation?
> >
> > You could have your worker function run from that ioctl wait for a
> > signal or a wake up call from the vhost_work/poll functions.
>
> An optional timeout argument is common in blocking interfaces like
> poll(2), recvmmsg(2), etc.
>
> Although something can send a signal to the thread instead,
> implementing that in an application is more awkward than passing a
> struct timespec.
>
> Compared to other blocking calls we don't expect
> ioctl(VHOST_RUN_WORKER) to return soon, so maybe the timeout will
> rarely be used and can be dropped from the interface.
>
> BTW the code I posted wasn't a carefully thought out proposal :). The
> details still need to be considered and I'm going to be offline for
> the next week so maybe someone else can think it through in the
> meantime.

One final thought before I'm offline for a week. If
ioctl(VHOST_RUN_WORKER) is specific to a single vhost device instance
then it's hard to support poll-mode (busy waiting) workers because
each device instance consumes a whole CPU. If we stick to an interface
where the kernel manages the worker threads then it's easier to share
workers between devices for polling.

I have CCed Stefano Garzarella, who is looking at similar designs for
vDPA software device implementations.

Stefan

