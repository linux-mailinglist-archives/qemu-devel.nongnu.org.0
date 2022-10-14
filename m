Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DEB5FED4A
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 13:42:51 +0200 (CEST)
Received: from localhost ([::1]:46888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojJ5W-0006k0-79
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 07:42:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ojIs6-0000Fg-1S
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 07:29:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ojIs2-0001jE-Cl
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 07:28:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665746924;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=OIYUaom3h9NHt8DmFN6cudmKwq+hC0jmODKFpvW2zoc=;
 b=fDtZi0W9sRyVb76N46HeyB8hsvZtOIH0AyQAAhkB2XgzvQn7rZastpDPS+ph21HtUJjKI9
 Xim81xHk8knIfJpbjpwvtP+psu3phjsqx9Cxf5v8FS7hU5sYYoaVLC0KI0jpCo0T3xP4me
 Yc0ICLGps9x30sWZzi9n3gqLlSBBl30=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-424-NBNNOrP6NZGLFcfw19iBXg-1; Fri, 14 Oct 2022 07:28:43 -0400
X-MC-Unique: NBNNOrP6NZGLFcfw19iBXg-1
Received: by mail-wr1-f70.google.com with SMTP id
 g27-20020adfa49b000000b0022cd5476cc7so1847630wrb.17
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 04:28:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OIYUaom3h9NHt8DmFN6cudmKwq+hC0jmODKFpvW2zoc=;
 b=0hhyiIOb5iuQG7p2hU4v7rTqvhPc8n7BERyZPSGbv8trXfDgJhz8FZdo2xfdP5ayW1
 OfGvisrHJw21yU7caAelbDZjweJPdu++1q6OBLJiHpn/xyInEFH4OwDcRk4vhVKzHvxt
 cBwMJORB01VDxP6l4Z5xc7ea6a7n2ViDTCX97YpqZd5dzGw7V/VFqmNoAMkRAsIz8WRc
 2hBbEwk4V3qg0uAn17OKmbbWUmPNq+/jAP28wo1n1dLc25RfUf9fR1lnnD6ywQ4IY5iD
 Jjb4l5KzYYXeBkUZvNB1886hYUjUv8cq5xA9+96odNyeV7NqRAd7gGuInefMxJXHCpqJ
 cK/Q==
X-Gm-Message-State: ACrzQf13qFFmfmwEeiOSCr210HNcW3Hti5Q4zTzd8q9XhAz3Y3JJfwNs
 9uQ3emWqnX1lHLydUNLkzYeGTucWv/qs/KlaUFBdkLtuG866SeN/lAcrQE5z5dx/DRmkqtOjTHi
 AUZAiDk73jrlUF+0=
X-Received: by 2002:adf:fbc7:0:b0:220:6004:18ca with SMTP id
 d7-20020adffbc7000000b00220600418camr2971879wrs.632.1665746922523; 
 Fri, 14 Oct 2022 04:28:42 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6XigRv3Gi4MhhNrKwxZUfDqdmyIw84eoIxfZJznMWGndCcESR9aNr2t1JqM81dNJt3UGhj+g==
X-Received: by 2002:adf:fbc7:0:b0:220:6004:18ca with SMTP id
 d7-20020adffbc7000000b00220600418camr2971838wrs.632.1665746922116; 
 Fri, 14 Oct 2022 04:28:42 -0700 (PDT)
Received: from localhost (84.125.93.114.dyn.user.ono.com. [84.125.93.114])
 by smtp.gmail.com with ESMTPSA id
 bg38-20020a05600c3ca600b003c6c182bef9sm8735086wmb.36.2022.10.14.04.28.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 04:28:40 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: Alex Williamson <alex.williamson@redhat.com>,  Eric Blake
 <eblake@redhat.com>,  Stefan Hajnoczi <stefanha@redhat.com>,  Fam Zheng
 <fam@euphon.net>,  qemu-s390x@nongnu.org,  Cornelia Huck
 <cohuck@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Vladimir
 Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,  Laurent Vivier
 <lvivier@redhat.com>,  John Snow <jsnow@redhat.com>,  "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>,  Christian Borntraeger
 <borntraeger@linux.ibm.com>,  Halil Pasic <pasic@linux.ibm.com>,  Paolo
 Bonzini <pbonzini@redhat.com>,  qemu-block@nongnu.org,  Eric Farman
 <farman@linux.ibm.com>,  Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,  Avihai Horon <avihaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>,  qemu-devel@nongnu.org
Subject: Re: [RFC 7/7] migration: call qemu_savevm_state_pending_exact()
 with the guest stopped
In-Reply-To: <803b7e06-d379-1115-a2f7-8bf09ec5a1e1@oracle.com> (Joao Martins's
 message of "Fri, 14 Oct 2022 11:36:51 +0100")
References: <20221003031600.20084-1-quintela@redhat.com>
 <20221003031600.20084-8-quintela@redhat.com>
 <bf945182-5c73-b1cc-13b2-5594bc21823f@oracle.com>
 <87ilknemef.fsf@secure.mitica>
 <803b7e06-d379-1115-a2f7-8bf09ec5a1e1@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Fri, 14 Oct 2022 13:28:39 +0200
Message-ID: <87h706wsns.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Joao Martins <joao.m.martins@oracle.com> wrote:
> On 13/10/2022 17:08, Juan Quintela wrote:
>> Oops.  My understanding was that once the guest is stopped you can say
>> how big is it. 

Hi

> It's worth keeping in mind that conceptually a VF won't stop (e.g. DMA) until
> really told through VFIO. So, stopping CPUs (guest) just means that guest code
> does not arm the VF for more I/O but still is a weak guarantee as VF still has
> outstanding I/O to deal with until VFIO tells it to quiesce DMA (for devices
> that support it).

How can we make sure about that?

i.e. I know I have a vfio device.  I need two things:
- in the iterative stage, I eed to check the size, but a estimate is ok.
  for example with RAM, we use whatever is the size of the dirty bitmap
  at that moment.
  If the estimated size is smaller than the theshold, we
   * stop the guest
   * sync dirty bitmap
   * now we test the (real) dirty bitmap size

How can we do something like that with a vfio device.


>> That is a deal breaker.  We can't continue if we don't
>> know the size.  Copying the whole state to know the size looks too much.
>> 
>
> It's fair to say that the kernel could know the size of the state once the VF is
> stopped but right now it is only on the STOP -> STOP_COPY arc (which is when it
> is saved to kernel pages, regardless of userspace reading it). And it will block
> read() until device has finished transferring it (unless you do a nonblocking
> read ofc). Knowing the device state would need to be reflected in the vfio UAPI
> and needs that adjustment. Providing total length ahead of device transfer might
> depend on the hardware, but current vfio vendor drivers look capable of that
> (from looking at the code).

I have no clue about vfio, so I need help here.  I can only provide
hooks.  But I expect that we should be able to convince firmware to give
us that information.

>>> It would need a @data_size in addition to @data_fd in
>>> vfio_device_feature_mig_state, or getting fseek supported over the fd
>> 
>> Ok, we can decided how to do it, but I think that putting fseek into it
>> will only make things more complicated.
>>
>
> fseek() was just a suggestion as a way to calculate file length (device state
> length) with current file APIs:
>
> 	fseek(data_fd, 0L, SEEK_END);
> 	size = ftell(data_fd);
>
> @data_size way is likely better (or simpler), but it would need to get an extra
> u64 added into  VFIO_DEVICE_FEATURE_MIG_DEVICE_STATE ioctl
>
> I am sure there are other alternatives

My understanding from NVidia folks was that newer firmware have an ioctl
to return than information.

>>>> So we need to stop the vm "before" we
>>>> cal the functions.
>>>>
>>>> It is a hack because:
>>>> - we are "starting" the guest again to stop it in migration_complete()
>>>>   I know, I know, but it is not trivial to get all the information
>>>>   easily to migration_complete(), so this hack.
>>>>
>>>
>>> Could you expand on that? Naively, I was assuming that by 'all information' the
>>> locally stored counters in migration_iteration_run() that aren't present in
>>> MigrateState?
>> 
>> This is not related to vfio at all.
>> > The problem is that current code assumes that the guest is still
>> running, and then do qemu_mutex_lock_iothread() and unlock() inside the
>> pending handlers.  To stop the guest, we need to lock the iothread
>> first.  So this was going to hang.  I fixed it doing the lock/unlock
>> twice.  That is the hack.  I will change the callers once that we decide
>> what is the right path ahead.  This is not a problem related to vfio. it
>> is a problem related about how we can stop/resume guests programatically
>> in the middle of qemu code.
>>
> /me nods
>>> Couldn't we just have an extra patch that just stores pend_pre and pending_size
>>> in MigrateState, which would allow all this check to be moved into
>>> migration_completion(). Or maybe that wasn't an option for some other reason?
>> 
>> This is not an option, because we don't have a way to get back from
>> migration_completion() to migrate_iteration_run() if there is not enough
>> space to send all the state.
>> 
>>> Additionally what about having a migration helper function that
>>> vfio_save_complete_precopy() callback needs to use into to check if the
>>> expected-device state size meets the threshold/downtime as it is saving the
>>> device state and otherwise fail earlier accordingly when saving beyond the
>>> threshold?
>> 
>> That is what I tried to do with the code.
>> See patch 4. ram.c
>> 
> So what I was saying earlier was to have something like a:
>
> 	migration_check_pending(ms, device_state_size)
>
> Which would call into migration core to check the SLA is still met. But callable
> from the client (hw/vfio/migration) as opposed to the core calling into the
> client. This allows that the client controls when to stop the VF
>
> The copy to userspace one could probably be amortized via pread() at
> at an arbritary offset to read 1 byte, and get an estimate size. Say you could
> check that the size is readable with a @threshold_size + 1 offset without
> necessarily copying the whole thing to userspace. If it reads succesfully it
> would bailing off earlier (failing the migration) -- and it would avoid doing
> the full copy to userspace.
>
> But the one gotcha is the STOP -> STOP_COPY needs to
> happen and that is what triggers the transfer the device state into
> kernel-managed pages before userspace decides to do anything to access/copy said
> state.
>
>> How I have two functions:
>> - ram_state_pending_estimate()
>> - ram_state_pending_exact()
>> 
>> 1st should work without any locking, i.e. just best estimation without
>> too much work, second should give the real value.
>> 
> Right -- I did notice that
>
>> What we had discussed before for vfio is that the device will "cache"
>> the value returned from previous ram_state_pending_exact().
>>
>
> A concern I see is that if we stop and resume the VF on a regular basis to
> accommodate a calculation just to be made available throughout all migration
> flow -- it is going to be a little invasive from guest performance/behaviour PoV?

It is *kind* of invasive (make things slower), but we already have the
problem that current code, we are not counting the size of the devices
state on calculation, and we should.  This adds a hook for all devices
to include this information.

I see two options:
- we stop the guest for the calculations (it makes the last iteration
  downtime faster), but it makes the rest of the end of iterations
  slower.  Notice that we should not have so many iterations to start with.

> Perhaps this check ought to be amortized at different major stage transitions of
> migration (as opposed to any iteration) as this can end up happening very often
> as soon as non-VFIO state + dirty pages get to a small enough threshold?

This is the reason why we add the estimate size for the vfio.  if the
estimate is good enough, we shouldn't stop so many times.

>>> It would allow supporting both the (current UAPI) case where you need to
>>> transfer the state to get device state size (so checking against threshold_size
>>> pending_pre constantly would allow to not violate the SLA) as well as any other
>>> UAPI improvement to fseek()/data_size that lets you fail even earlier.
>>>
>>> Seems like at least it keeps some of the rules (both under iothread lock) as
>>> this patch
>> 
>> Coming to worse thing, you need to read the state into a local buffer
>> and then calculate the size in exact?  Looks overkill, but in your case,
>> I can't see other way to do it.
>> 
>> My understanding was that for new hardware you have an easy way to
>> calculate this value "if the guest was stopped".
>> 
> s/guest/VF

The use case that I was discussing the whole card was assigned to the
guest, not a VF.  I have no clue if that makes the problem easier of
more difficult.

>> My next series are a way to do in parallel the read/send of the state
>> with respect to the migration_thread(), but that is a different
>> problem. 
>
> There's also non-blocking reads not sure it helps towards the asynchronous transfer?

My current "cunning" plan is to create a new channel for each vfio
device, hat allow the device to do whatever they want, and using a
blocking interface.

>> I need a way to calculate sizes to start with, 
>> otherwise  I
>> have no way to decide if I can enter the completion stage (or for old
>> devices one can lie and assume than size is zero, 
>
> to be fair that's what happens right now with migration v1 protocol -- it's not
> unprecedented IIUC

Ok, thanks for the comments.

Later, Juan.


