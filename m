Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5C668C48B
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 18:23:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP5C4-0004yC-TZ; Mon, 06 Feb 2023 12:22:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pP5Bs-0004xj-Il
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 12:22:10 -0500
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pP5Bp-0003Mc-Qv
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 12:22:04 -0500
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-52a849206adso19145287b3.4
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 09:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6JU+HqMvj9rTBsqUK7nwQ9sxFLLsZWmVB3Bc71Ax2yI=;
 b=nyz2M+qFPKQOuO2vvcRi4bxlauc9/I9vaV4MlKW3iWTq8JVh4FsJrQrgKPcvprKQvL
 CM1TpBQqJEXMf+ZbKhad0GyRKV7XEc3lpkJjwQN3bTlrSVhnduCB7vQBAUYa2zwPFVT9
 C8MnE0shBPJDXpFUr3yyiUYpwIegrZAiwkb4btjtjfD9q5V12ZwVfMST8jU0WWZdUGc3
 u20HmaRcR3bnVhBAP3y8L3vj29FCtrb+vT3aVCHhTDC7ltD7kS2dfsqBqr/IAQbOBQ0g
 Puw4KmfzeQZInseINM1mlc+2Wyfxtx1DkXUowDfKSrGEJpH5DV4BpqP79NDSElV+yyXQ
 Jc6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6JU+HqMvj9rTBsqUK7nwQ9sxFLLsZWmVB3Bc71Ax2yI=;
 b=BAb+e1I759naYHhvZaaNq7VZ9M68VEadz6m8u6YECIU7j80uV+EXDyo9tZOPAhWmIq
 OHB97WJXgMBvdECDHAWWXmquOxbNzi5oo9VAo69bD4Zy4EfR+emZHDR4vNfqp1cTJBTC
 ZHPGBHdr1OOZYhVJnMysGPufd9sMj8yvUdZU6zV1Gu4/frFjvUCgEzrC5PtOKYJbnfz2
 wKwwOJUstw4WEmM93EryEcuZxkCuxv2YHH48efBO/m0KTb8eAKEAp3cG+/RLasqtygk/
 7yqJ3mEJ1j4NJAHpnqfu7aqojgAFPM9mixGOpawJ9l3VGJdpX+5ZQM2xwRcP0sRLpB3z
 J7Lw==
X-Gm-Message-State: AO0yUKUHCH8OkHVfc9da/FPA8JZJF+s4zihMgpnA5IBm+/Ym8rJVwfpW
 xq06JZ7pgafFCQd3RaPolNDbAjGpUxo0Sx8v+Di/e4lrCe8=
X-Google-Smtp-Source: AK7set/JO0GdcwpkyQSG5oBASsXjI6OBXOLFD2w+KazFhABa7SrepaC7EffFCffQhI12MS9GJN3siDJARYdBc7TCcqc=
X-Received: by 2002:a0d:e6c4:0:b0:527:ad38:2c5b with SMTP id
 p187-20020a0de6c4000000b00527ad382c5bmr862025ywe.336.1675704120311; Mon, 06
 Feb 2023 09:22:00 -0800 (PST)
MIME-Version: 1.0
References: <CAJSP0QUuuZLC0DJNEfZ7amyd3XnRhRNr1k+1OgLfDeF77X1ZDQ@mail.gmail.com>
 <CAJaqyWd+g5fso6AEGKwj0ByxFVc8EpCS9+ezoMpnjyMo5tbj8Q@mail.gmail.com>
 <CAJSP0QXyO4qXJseMzbgsVdXK-4-W4U9DxPcxr6wX45d6VBTeWQ@mail.gmail.com>
 <CAJaqyWczFwbxNWrZ8dcFHvYrV2=tH7Tv0Apf=qORT+gzDpBN4Q@mail.gmail.com>
 <CAJSP0QX+mpmdVE-13L9p=02_XbmPFT-mFAbz-JJjqB5V-2ON6Q@mail.gmail.com>
 <CAJaqyWd8EhfDmTtmLNzuoVDoF641Tq3LL1jvvdXK+DDbAfjccQ@mail.gmail.com>
In-Reply-To: <CAJaqyWd8EhfDmTtmLNzuoVDoF641Tq3LL1jvvdXK+DDbAfjccQ@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 6 Feb 2023 12:21:48 -0500
Message-ID: <CAJSP0QUFR_Nhd2dDkXJ_NjSo=+GNHFswztuGLLJ1QuokqOMUqA@mail.gmail.com>
Subject: Re: Call for GSoC and Outreachy project ideas for summer 2023
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, kvm <kvm@vger.kernel.org>, 
 Rust-VMM Mailing List <rust-vmm@lists.opendev.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, "Florescu,
 Andreea" <fandree@amazon.com>, Damien <damien.lemoal@opensource.wdc.com>, 
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Hanna Reitz <hreitz@redhat.com>, 
 Alberto Faria <afaria@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Bernhard Beschow <shentey@gmail.com>, Sean Christopherson <seanjc@google.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, gmaglione@redhat.com, 
 Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 6 Feb 2023 at 11:47, Eugenio Perez Martin <eperezma@redhat.com> wrote:
>
> On Mon, Feb 6, 2023 at 3:21 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:
> >
> > On Mon, 6 Feb 2023 at 06:53, Eugenio Perez Martin <eperezma@redhat.com> wrote:
> > >
> > > On Sun, Feb 5, 2023 at 2:57 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:
> > > >
> > > > On Sun, 5 Feb 2023 at 03:15, Eugenio Perez Martin <eperezma@redhat.com> wrote:
> > > > >
> > > > > On Fri, Jan 27, 2023 at 4:18 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:
> > > > > >
> > > > > > Dear QEMU, KVM, and rust-vmm communities,
> > > > > > QEMU will apply for Google Summer of Code 2023
> > > > > > (https://summerofcode.withgoogle.com/) and has been accepted into
> > > > > > Outreachy May 2023 (https://www.outreachy.org/). You can now
> > > > > > submit internship project ideas for QEMU, KVM, and rust-vmm!
> > > > > >
> > > > > > Please reply to this email by February 6th with your project ideas.
> > > > > >
> > > > > > If you have experience contributing to QEMU, KVM, or rust-vmm you can
> > > > > > be a mentor. Mentors support interns as they work on their project. It's a
> > > > > > great way to give back and you get to work with people who are just
> > > > > > starting out in open source.
> > > > > >
> > > > > > Good project ideas are suitable for remote work by a competent
> > > > > > programmer who is not yet familiar with the codebase. In
> > > > > > addition, they are:
> > > > > > - Well-defined - the scope is clear
> > > > > > - Self-contained - there are few dependencies
> > > > > > - Uncontroversial - they are acceptable to the community
> > > > > > - Incremental - they produce deliverables along the way
> > > > > >
> > > > > > Feel free to post ideas even if you are unable to mentor the project.
> > > > > > It doesn't hurt to share the idea!
> > > > > >
> > > > > > I will review project ideas and keep you up-to-date on QEMU's
> > > > > > acceptance into GSoC.
> > > > > >
> > > > > > Internship program details:
> > > > > > - Paid, remote work open source internships
> > > > > > - GSoC projects are 175 or 350 hours, Outreachy projects are 30
> > > > > > hrs/week for 12 weeks
> > > > > > - Mentored by volunteers from QEMU, KVM, and rust-vmm
> > > > > > - Mentors typically spend at least 5 hours per week during the coding period
> > > > > >
> > > > > > For more background on QEMU internships, check out this video:
> > > > > > https://www.youtube.com/watch?v=xNVCX7YMUL8
> > > > > >
> > > > > > Please let me know if you have any questions!
> > > > > >
> > > > > > Stefan
> > > > > >
> > > > >
> > > > > Appending the different ideas here.
> > > >
> > > > Hi Eugenio,
> > > > Thanks for sharing your project ideas. I have added some questions
> > > > below before we add them to the ideas list wiki page.
> >
> > Thanks for the discussion. Do you want to focus on 1 or 2 project
> > ideas? 3 might be a bit much to mentor.
> >
>
> Right, my idea was to reduce that amount afterwards just in case some
> of them were rejected. But sure, we can filter out some if needed.

Do you mean in case there is no realistic applicant? You can do that
if you want, just keep in mind it may be more work for you during the
application phase. If it turns out there is a strong applicant for
each project idea you could see if someone else is willing to mentor
the project(s) you don't have time for.

I'll post the project ideas once you've updated them.

> > Please send an updated version of the project descriptions and I'll
> > post it on the wiki.
> >
> > > >
> > > > > VIRTIO_F_IN_ORDER feature support for virtio devices
> > > > > ===
> > > > > This was already a project the last year, and it produced a few series
> > > > > upstream but was never merged. The previous series are totally useful
> > > > > to start with, so it's not starting from scratch with them [1]:
> > > >
> > > > Has Zhi Guo stopped working on the patches?
> > > >
> > >
> > > I can ask him for sure.
> > >
> > > > What is the state of the existing patches? What work remains to be done?
> > > >
> > >
> > > There are some pending comments from upstream. However if somebody
> > > starts it from scratch it needs time to review some of the VirtIO
> > > standard to understand the virtio in_order feature, both in split and
> > > packed vq.
> >
> > The intern will need to take ownership and deal with code review
> > feedback for code they didn't write. That can be difficult for someone
> > who is new unless the requested changes are easy to address.
> >
>
> Indeed that is a very good point.
>
> > It's okay to start from scratch. You're in a better position than an
> > applicant to decide whether that's the best approach.
> >
> > >
> > >
> > > > >
> > > > > Summary
> > > > > ---
> > > > > Implement VIRTIO_F_IN_ORDER in QEMU and Linux (vhost and virtio drivers)
> > > > >
> > > > > The VIRTIO specification defines a feature bit (VIRTIO_F_IN_ORDER)
> > > > > that devices and drivers can negotiate when the device uses
> > > > > descriptors in the same order in which they were made available by the
> > > > > driver.
> > > > >
> > > > > This feature can simplify device and driver implementations and
> > > > > increase performance. For example, when VIRTIO_F_IN_ORDER is
> > > > > negotiated, it may be easier to create a batch of buffers and reduce
> > > > > DMA transactions when the device uses a batch of buffers.
> > > > >
> > > > > Currently the devices and drivers available in Linux and QEMU do not
> > > > > support this feature. An implementation is available in DPDK for the
> > > > > virtio-net driver.
> > > > >
> > > > > Goals
> > > > > ---
> > > > > Implement VIRTIO_F_IN_ORDER for a single device/driver in QEMU and
> > > > > Linux (virtio-net or virtio-serial are good starting points).
> > > > > Generalize your approach to the common virtio core code for split and
> > > > > packed virtqueue layouts.
> > > > > If time allows, support for the packed virtqueue layout can be added
> > > > > to Linux vhost, QEMU's libvhost-user, and/or QEMU's virtio qtest code.
> > > > >
> > > > > Shadow Virtqueue missing virtio features
> > > > > ===
> > > > >
> > > > > Summary
> > > > > ---
> > > > > Some VirtIO devices like virtio-net have a control virtqueue (CVQ)
> > > > > that allows them to dynamically change a number of parameters like MAC
> > > > > or number of active queues. Changes to passthrough devices using vDPA
> > > > > using CVQ are inherently hard to track if CVQ is handled as
> > > > > passthrough data queues, because qemu is not aware of that
> > > > > communication for performance reasons. In this situation, qemu is not
> > > > > able to migrate these devices, as it is not able to tell the actual
> > > > > state of the device.
> > > > >
> > > > > Shadow Virtqueue (SVQ) allows qemu to offer an emulated queue to the
> > > > > device, effectively forwarding the descriptors of that communication,
> > > > > tracking the device internal state, and being able to migrate it to a
> > > > > new destination qemu.
> > > > >
> > > > > To restore that state in the destination, SVQ is able to send these
> > > > > messages as regular CVQ commands. The code to understand and parse
> > > > > virtio-net CVQ commands is already in qemu as part of its emulated
> > > > > device, but the code to send the some of the new state is not, and
> > > > > some features are missing. There is already code to restore basic
> > > > > commands like mac or multiqueue, and it is easy to use it as a
> > > > > template.
> > > > >
> > > > > Goals
> > > > > ---
> > > > > To implement missing virtio-net commands sending:
> > > > > * VIRTIO_NET_CTRL_RX family, to control receive mode.
> > > > > * VIRTIO_NET_CTRL_GUEST_OFFLOADS
> > > > > * VIRTIO_NET_CTRL_VLAN family
> > > > > * VIRTIO_NET_CTRL_MQ_HASH config
> > > > > * VIRTIO_NET_CTRL_MQ_RSS config
> > > >
> > > > Is there enough work here for a 350 hour or 175 hour GSoC project?
> > > >
> > >
> > > I think 175 hour should fit better. If needed more features can be
> > > added (packed vq, ring reset, etc), but to start contributing a 175
> > > hour should work.
> > >
> > > > The project description mentions "there is already code to restore
> > > > basic commands like mac and multiqueue", please include a link.
> > > >
> > >
> > > MAC address was merged with ASID support so the whole series is more
> > > complicated than it should be. Here is it the most relevant patch:
> > > * https://lists.gnu.org/archive/html/qemu-devel/2022-09/msg00342.html
> > >
> > > MQ is way cleaner in that regard, and future series should look more
> > > similar to this one:
> > > * https://www.mail-archive.com/qemu-devel@nongnu.org/msg906273.html
> > >
> > > > > Shadow Virtqueue performance optimization
> > > > > ===
> > > > > Summary
> > > > > ---
> > > > > To perform a virtual machine live migration with an external device to
> > > > > qemu, qemu needs a way to know which memory the device modifies so it
> > > > > is able to resend it. Otherwise the guest would resume with invalid /
> > > > > outdated memory in the destination.
> > > > >
> > > > > This is especially hard with passthrough hardware devices, as
> > > > > transports like PCI imposes a few security and performance challenges.
> > > > > As a method to overcome this for virtio devices, qemu can offer an
> > > > > emulated virtqueue to the device, called Shadow Virtqueue (SVQ),
> > > > > instead of allowing the device to communicate directly with the guest.
> > > > > SVQ will then forward the writes to the guest, being the effective
> > > > > writer in the guest memory and knowing when a portion of it needs to
> > > > > be resent.
> > > > >
> > > > > As this is effectively breaking the passthrough and it adds extra
> > > > > steps in the communication, this comes with a performance penalty in
> > > > > some forms: Context switches, more memory reads and writes increasing
> > > > > cache pressure, etc.
> > > > >
> > > > > At this moment the SVQ code is not optimized. It cannot forward
> > > > > buffers in parallel using multiqueue and multithread, and it does not
> > > > > use posted interrupts to notify the device skipping the host kernel
> > > > > context switch (doorbells).
> > > > >
> > > > > The SVQ code requires minimal modifications for the multithreading,
> > > > > and these are examples of multithreaded devices already like
> > > > > virtio-blk which can be used as a template-alike. Regarding the posted
> > > > > interrupts, DPDK is able to use them so that code can also be used as
> > > > > a template.
> > > > >
> > > > > Goals
> > > > > ---
> > > > > * Measure the latest SVQ performance compared to non-SVQ.
> > > >
> > > > Which benchmark workload and which benchmarking tool do you recommend?
> > > > Someone unfamiliar with QEMU and SVQ needs more details in order to
> > > > know what to do.
> > > >
> > >
> > > In my opinion netperf (TCP_STREAM & TCP_RR) or iperf equivalent +
> > > testpmd in AF_PACKET mode should test these scenarios better. But
> > > maybe upstream requests additional testings. Feedback on this would be
> > > appreciated actually.
> > >
> > > My intention is not for the intern to develop new tests or anything
> > > like that, they are just a means to justify the changes in SVQ. This
> > > part would be very guided, or it can be offloaded from the project. So
> > > if these tools are not enough descriptive maybe it's better to take
> > > this out of the goals and add it to the description like that.
> >
> > Great, "netperf (TCP_STREAM & TCP_RR) or iperf equivalent + testpmd in
> > AF_PACKET mode" is enough information.
> >
> > >
> > > > > * Add multithreading to SVQ, extracting the code from the Big QEMU Lock (BQL).
> > > >
> > > > What do you have in mind? Allowing individual virtqueues to be
> > > > assigned to IOThreads? Or processing all virtqueues in a single
> > > > IOThread (like virtio-blk and virtio-scsi do today)?
> > > >
> > >
> > > My idea was to use iothreads. I thought virtio-blk and virtio-scsi
> > > were done that way actually, is there a reason / advantage to use just
> > > a single iothread?
> >
> > The reason for only supporting a single IOThread at the moment is
> > thread-safety. There is multi-queue work in progress that will remove
> > this limitation in the future.
> >
> > I sent a patch series proposing a command-line syntax for multi-queue here:
> > https://www.mail-archive.com/qemu-devel@nongnu.org/msg933001.html
> >
> > The idea is that the same syntax can be used by other devices that
> > support mapping vqs to multiple IOThreads.
> >
>
> Understood. I'll take a look, thanks!
>
> > >
> > > > > * Add posted thread capabilities to QEMU, following the model of DPDK to it.
> > > >
> > > > What is this about? I thought KVM uses posted interrupts when
> > > > available, so what needs to be done here? Please also include a link
> > > > to the relevant DPDK code.
> > > >
> > >
> > > The guest in KVM may use posted interrupts but SVQ code runs in
> > > userland qemu :). There were no previous uses of HW posted interrupts
> > > as far as I know so SVQ is only able to use vhost-vdpa kick eventfds
> > > to notify queues. This has a performance penalty in the form of host
> > > kernel context switches.
> > >
> > > If I'm not wrong this patch adds it to DPDK, but I may be missing
> > > additional context or versions:
> > > * https://lore.kernel.org/all/1579539790-3882-31-git-send-email-matan@mellanox.com/
> > >
> > > Please let me know if you need further information. Thanks!
> >
> > This patch does not appear related to posted interrupts because it's
> > using the kickfd (available buffer notification) instead of the callfd
> > (used buffer notification). It's the glue that forwards a virtqueue
> > kick to hardware.
> >
>
> I'm sorry, that's because I confused the terms in my head and I wanted
> to say "host notifiers memory regions" or "hardware doorbell mapping".
> Maybe it is clearer that way?

The VIRTIO spec calls this memory the Queue Notify address.

>
> > I don't think that userspace available buffer notification
> > interception can be bypassed in the SVQ model. SVQ needs to take a
> > copy of available buffers so it knows the scatter-gather lists before
> > forwarding the kick to the vDPA device. If the notification is
> > bypassed then SVQ cannot reliably capture the scatter-gather list.
> >
> > I also don't think it's possible to bypass userspace in the used
> > buffer notification path. The vDPA used buffer notification must be
> > intercepted so SVQ can mark memory pages in the scatter-gather list
> > dirty before it fills in a guest used buffer and sends a guest used
> > buffer notification.
> >
> > The guest used buffer notification should already be a VT-d Posted
> > Interrupt on hardware that supports the feature. KVM takes care of
> > that.
> >
> > I probably don't understand what the optimization idea is. You want
> > SVQ to avoid a system call when sending vDPA available buffer
> > notifications? That's not related to posted interrupts though, so I'm
> > confused...
> >
>
> That's right, you described the idea perfectly that way :). I'll
> complete the projects summary but I'll be ok if you think it is not
> qualified, we can leave that part out of the proposal.

Thanks, I think I get it now. The task is to implement the dual of
QEMU's virtio_queue_set_host_notifier_mr() so SVQ can perform
virtqueue kicks on the vDPA device via memory store instructions.

That's a cool feature and I think it should be included in the project idea.

Stefan

