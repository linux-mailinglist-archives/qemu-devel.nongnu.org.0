Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9325F76AE
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 12:13:24 +0200 (CEST)
Received: from localhost ([::1]:39290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogkM7-0001I2-4F
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 06:13:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1ogkDv-0004cH-Os
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:05:05 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:43853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1ogkDk-0004xo-V2
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:04:48 -0400
Received: by mail-ed1-x533.google.com with SMTP id z3so5345598edc.10
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 03:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1iifIEkFqOx21PbYu2SYSZR1pWpEUPpfD9W/DNlYdWI=;
 b=ZKMtP0LGTNUjkoW3rTexa+d8V52P3q+n6gt2y9nosyan7m6moTic2HU+aNSGSWhqIi
 fs+8pSy7uKiKs6g2F6WOiXWGf5Pfl1zoppRPDgVfPRAiAB4qFZJGUfgARg0JeHYkqPd2
 z73b8rEsizzrdcUoLvKHvWgRy0bM/ScttklcY/QRH8z0Fa8myUmZxQ47e4LE9UFNcjzi
 i7TJYna2X9UN7oS6lfpte+wKHHc3VzMJcmWBYmGKy8jKO6D+jG6w9jVAcvZz1JqhlZsE
 7NhWGlgEKYYRvVfWGS4LR78s61YVKRqJyzCrd0nKr3rpuK7rtV3t7avybwF5+1x2WQCA
 dFIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1iifIEkFqOx21PbYu2SYSZR1pWpEUPpfD9W/DNlYdWI=;
 b=wJQ6XBNZEJoQb4TFWPwRPbqYjXDSNk9X145WlFnIbWi23V1UvcluiONtVMM7NTYEfK
 O16xR/xiruCwBjW5ZrgDHkol56eGliNodJYkFShoVlIlmRYHv9+FJOsXhwY04AHYiDSy
 dWhmC8E6eRf1ds8zddppUEPzlfeWd0jFWytuC6lqsyKijV213u7SEoc768RDPt0uzVMp
 zGKNoFYujOgfL4gzsRob7SjMFZTv+i7exBp9EvXSbshgP2UhT1q0bg5tIRWnX14GYL2g
 J2THr5z2jBbT7OC5OsL7B/mEUBqeunkzGg5paNQXrvWBuYEIYeXHtQnHE1iuKQZw30QP
 izqg==
X-Gm-Message-State: ACrzQf2jWdCREPICn9i4BHDTzLn/XZPrl5e98rTBLKIHkYQFvh8tI1P8
 SjGB/JBBXlA8+q0NpfV881vnblKIvs2S648G/Qtb
X-Google-Smtp-Source: AMsMyM4e5wtnUbDbMUa7Ln5mJl3S3oV+lXr/PQWXtBS6+tnHoiYQhUCafIH1ziEbWaUko7QSe0mMPEmLWcAhch2qYKQ=
X-Received: by 2002:a05:6402:1856:b0:458:db1e:20ec with SMTP id
 v22-20020a056402185600b00458db1e20ecmr3897594edy.14.1665137081898; Fri, 07
 Oct 2022 03:04:41 -0700 (PDT)
MIME-Version: 1.0
References: <Yza1u1KfKa7ycQm0@T590> <Yzs9xQlVuW41TuNC@fedora>
 <YzwARuAZdaoGTUfP@T590>
 <CAJSP0QXVK=wUy_JgJ9NmNMtKTRoRX0MwOZUuFWU-1mVWWKij8A@mail.gmail.com>
 <Yz0FrzJVZTqlQtJ5@T590>
 <CAJSP0QUQgA8Az3Kx8-6ynbWxDxaSVW3xWOPj4VBPhhUhsRYT9g@mail.gmail.com>
 <Yz668hfMAuES2/lt@T590>
In-Reply-To: <Yz668hfMAuES2/lt@T590>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Fri, 7 Oct 2022 18:04:29 +0800
Message-ID: <CACycT3t346g2gc9anp_T8vz5=9ds=NAGJhcSU8T2EmyCNuDCSw@mail.gmail.com>
Subject: Re: ublk-qcow2: ublk-qcow2 is available
To: Ming Lei <tom.leiming@gmail.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 io-uring@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, 
 Kirill Tkhai <kirill.tkhai@openvz.org>,
 Manuel Bentele <development@manuel-bentele.de>, 
 qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>, rjones@redhat.com, 
 "Denis V. Lunev" <den@openvz.org>, Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=xieyongji@bytedance.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Oct 6, 2022 at 7:24 PM Ming Lei <tom.leiming@gmail.com> wrote:
>
> On Wed, Oct 05, 2022 at 08:21:45AM -0400, Stefan Hajnoczi wrote:
> > On Wed, 5 Oct 2022 at 00:19, Ming Lei <tom.leiming@gmail.com> wrote:
> > >
> > > On Tue, Oct 04, 2022 at 09:53:32AM -0400, Stefan Hajnoczi wrote:
> > > > On Tue, 4 Oct 2022 at 05:44, Ming Lei <tom.leiming@gmail.com> wrote:
> > > > >
> > > > > On Mon, Oct 03, 2022 at 03:53:41PM -0400, Stefan Hajnoczi wrote:
> > > > > > On Fri, Sep 30, 2022 at 05:24:11PM +0800, Ming Lei wrote:
> > > > > > > ublk-qcow2 is available now.
> > > > > >
> > > > > > Cool, thanks for sharing!
> > > > > >
> > > > > > >
> > > > > > > So far it provides basic read/write function, and compression and snapshot
> > > > > > > aren't supported yet. The target/backend implementation is completely
> > > > > > > based on io_uring, and share the same io_uring with ublk IO command
> > > > > > > handler, just like what ublk-loop does.
> > > > > > >
> > > > > > > Follows the main motivations of ublk-qcow2:
> > > > > > >
> > > > > > > - building one complicated target from scratch helps libublksrv APIs/functions
> > > > > > >   become mature/stable more quickly, since qcow2 is complicated and needs more
> > > > > > >   requirement from libublksrv compared with other simple ones(loop, null)
> > > > > > >
> > > > > > > - there are several attempts of implementing qcow2 driver in kernel, such as
> > > > > > >   ``qloop`` [2], ``dm-qcow2`` [3] and ``in kernel qcow2(ro)`` [4], so ublk-qcow2
> > > > > > >   might useful be for covering requirement in this field
> > > > > > >
> > > > > > > - performance comparison with qemu-nbd, and it was my 1st thought to evaluate
> > > > > > >   performance of ublk/io_uring backend by writing one ublk-qcow2 since ublksrv
> > > > > > >   is started
> > > > > > >
> > > > > > > - help to abstract common building block or design pattern for writing new ublk
> > > > > > >   target/backend
> > > > > > >
> > > > > > > So far it basically passes xfstest(XFS) test by using ublk-qcow2 block
> > > > > > > device as TEST_DEV, and kernel building workload is verified too. Also
> > > > > > > soft update approach is applied in meta flushing, and meta data
> > > > > > > integrity is guaranteed, 'make test T=qcow2/040' covers this kind of
> > > > > > > test, and only cluster leak is reported during this test.
> > > > > > >
> > > > > > > The performance data looks much better compared with qemu-nbd, see
> > > > > > > details in commit log[1], README[5] and STATUS[6]. And the test covers both
> > > > > > > empty image and pre-allocated image, for example of pre-allocated qcow2
> > > > > > > image(8GB):
> > > > > > >
> > > > > > > - qemu-nbd (make test T=qcow2/002)
> > > > > >
> > > > > > Single queue?
> > > > >
> > > > > Yeah.
> > > > >
> > > > > >
> > > > > > >     randwrite(4k): jobs 1, iops 24605
> > > > > > >     randread(4k): jobs 1, iops 30938
> > > > > > >     randrw(4k): jobs 1, iops read 13981 write 14001
> > > > > > >     rw(512k): jobs 1, iops read 724 write 728
> > > > > >
> > > > > > Please try qemu-storage-daemon's VDUSE export type as well. The
> > > > > > command-line should be similar to this:
> > > > > >
> > > > > >   # modprobe virtio_vdpa # attaches vDPA devices to host kernel
> > > > >
> > > > > Not found virtio_vdpa module even though I enabled all the following
> > > > > options:
> > > > >
> > > > >         --- vDPA drivers
> > > > >           <M>   vDPA device simulator core
> > > > >           <M>     vDPA simulator for networking device
> > > > >           <M>     vDPA simulator for block device
> > > > >           <M>   VDUSE (vDPA Device in Userspace) support
> > > > >           <M>   Intel IFC VF vDPA driver
> > > > >           <M>   Virtio PCI bridge vDPA driver
> > > > >           <M>   vDPA driver for Alibaba ENI
> > > > >
> > > > > BTW, my test environment is VM and the shared data is done in VM too, and
> > > > > can virtio_vdpa be used inside VM?
> > > >
> > > > I hope Xie Yongji can help explain how to benchmark VDUSE.
> > > >
> > > > virtio_vdpa is available inside guests too. Please check that
> > > > VIRTIO_VDPA ("vDPA driver for virtio devices") is enabled in "Virtio
> > > > drivers" menu.
> > > >
> > > > >
> > > > > >   # modprobe vduse
> > > > > >   # qemu-storage-daemon \
> > > > > >       --blockdev file,filename=test.qcow2,cache.direct=of|off,aio=native,node-name=file \
> > > > > >       --blockdev qcow2,file=file,node-name=qcow2 \
> > > > > >       --object iothread,id=iothread0 \
> > > > > >       --export vduse-blk,id=vduse0,name=vduse0,num-queues=$(nproc),node-name=qcow2,writable=on,iothread=iothread0
> > > > > >   # vdpa dev add name vduse0 mgmtdev vduse
> > > > > >
> > > > > > A virtio-blk device should appear and xfstests can be run on it
> > > > > > (typically /dev/vda unless you already have other virtio-blk devices).
> > > > > >
> > > > > > Afterwards you can destroy the device using:
> > > > > >
> > > > > >   # vdpa dev del vduse0
> > > > > >
> > > > > > >
> > > > > > > - ublk-qcow2 (make test T=qcow2/022)
> > > > > >
> > > > > > There are a lot of other factors not directly related to NBD vs ublk. In
> > > > > > order to get an apples-to-apples comparison with qemu-* a ublk export
> > > > > > type is needed in qemu-storage-daemon. That way only the difference is
> > > > > > the ublk interface and the rest of the code path is identical, making it
> > > > > > possible to compare NBD, VDUSE, ublk, etc more precisely.
> > > > >
> > > > > Maybe not true.
> > > > >
> > > > > ublk-qcow2 uses io_uring to handle all backend IO(include meta IO) completely,
> > > > > and so far single io_uring/pthread is for handling all qcow2 IOs and IO
> > > > > command.
> > > >
> > > > qemu-nbd doesn't use io_uring to handle the backend IO, so we don't
> > >
> > > I tried to use it via --aio=io_uring for setting up qemu-nbd, but not succeed.
> > >
> > > > know whether the benchmark demonstrates that ublk is faster than NBD,
> > > > that the ublk-qcow2 implementation is faster than qemu-nbd's qcow2,
> > > > whether there are miscellaneous implementation differences between
> > > > ublk-qcow2 and qemu-nbd (like using the same io_uring context for both
> > > > ublk and backend IO), or something else.
> > >
> > > The theory shouldn't be too complicated:
> > >
> > > 1) io uring passthough(pt) communication is fast than socket, and io command
> > > is carried over io_uring pt commands, and should be fast than virio
> > > communication too.
> > >
> > > 2) io uring io handling is fast than libaio which is taken in the
> > > test on qemu-nbd, and all qcow2 backend io(include meta io) is handled
> > > by io_uring.
> > >
> > > https://github.com/ming1/ubdsrv/blob/master/tests/common/qcow2_common
> > >
> > > 3) ublk uses one single io_uring to handle all io commands and qcow2
> > > backend IOs, so batching handling is common, and it is easy to see
> > > dozens of IOs/io commands handled in single syscall, or even more.
> >
> > I agree with the theory but theory has to be tested through
> > experiments in order to validate it. We can all learn from systematic
> > performance analysis - there might even be bottlenecks in ublk that
> > can be solved to improve performance further.
>
> Indeed, one thing is that ublk uses get user pages to retrieve user pages
> for copying data, this way may add latency for big chunk IO, since
> latency of get user pages should be increased linearly by nr_pages.
>
> I looked into vduse code a bit too, and vduse still needs the page copy,
> but lots of bounce pages are allocated and cached in the whole device
> lifetime, this way can void the latency for retrieving & allocating
> pages runtime with cost of extra memory consumption. Correct me
> if it is wrong, Xie Yongji or anyone?
>

Yes, you are right. Another way is registering the preallocated
userspace memory as bounce buffer.

Thanks,
Yongji

