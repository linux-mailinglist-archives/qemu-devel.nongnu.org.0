Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A045D36D735
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 14:24:44 +0200 (CEST)
Received: from localhost ([::1]:54054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbjFD-0003XD-4e
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 08:24:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lbjC8-00028A-Lw
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 08:21:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lbjBx-0001Hl-O5
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 08:21:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619612478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QVk7PRjZpc1WmRJu65ZMq2aqmJ8Q+KBufZvuKtF1hpQ=;
 b=LAERl2HiO/G6cqAvbGT9N9c7DlMhjXtP/vxixzCKQUHzmgxsmforOuPHUOLGpejrBmJMZ8
 21m/LhGUwaJQihWZue3DtSgZCZBhyNXWZRFR+yKOFmvJDHz0+POCe/THJ6GU+U/jQEOsBZ
 sHJxhLSa5Lc6WOj9Di5ooyq8ps9TYKE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-t-cXHL4ENgWhk0g1MoHsCQ-1; Wed, 28 Apr 2021 08:21:17 -0400
X-MC-Unique: t-cXHL4ENgWhk0g1MoHsCQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 cz7-20020a0564021ca7b02903853d41d8adso17476315edb.17
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 05:21:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QVk7PRjZpc1WmRJu65ZMq2aqmJ8Q+KBufZvuKtF1hpQ=;
 b=PiFxLLKyoCqw9Ts7+KIquAY1AvWJ5t0pIy/3IllKP/u5vN2l4+Wk/qjIiun3S0iCP1
 57rKJcjENeJr7JVFBdy8p2KodhwAEn9A99oD7nlR4uKondnWcAFJ4uehFsYRxJggrJQ+
 yOU6xKpLJ1TcwrA7OJuK0GCxajQiaLfxUDac2CRhXJvEvFB99C/luAe+BwLqlnpGYGRz
 Ke94V4pzmvPjcvHu+kmLkC7zXNpvW3qNUzXJdHHgj9LcBVFn5YbqdeS/kPpIsrxc4JNb
 ATHL1ctKzyoFEw5Vg4+RAGRXa/yzTLktGx2NsIxc/bo7JyR6yI0rPZckI/8SB/qvzknS
 rDpg==
X-Gm-Message-State: AOAM531YomElW1i2w9bOsccVnpX+qyh2XSg+HL/HvfG48o//ZZ2GpZIp
 TYdvZ2f2JsT9E0q/QcbARI0O6+//5omGGxjvTei2n9tIavknZPVd22G0L0cmpN3ia2n1OYKTlh5
 g5TutHk9UmTir4go=
X-Received: by 2002:a17:906:6959:: with SMTP id
 c25mr18054579ejs.392.1619612475545; 
 Wed, 28 Apr 2021 05:21:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbQX9bWHpBL+e0/67NfQpobyS3mqobXjb3XOqnolKa4evLOosorEOxDOa12Q2/9JRz58rvpQ==
X-Received: by 2002:a17:906:6959:: with SMTP id
 c25mr18054560ejs.392.1619612475361; 
 Wed, 28 Apr 2021 05:21:15 -0700 (PDT)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id bh14sm1816421ejb.104.2021.04.28.05.21.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 05:21:14 -0700 (PDT)
Date: Wed, 28 Apr 2021 14:21:12 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Yongji Xie <xieyongji@bytedance.com>
Subject: Re: [PATCH 0/3] Introduce vhost-vdpa block device
Message-ID: <20210428122112.saxrwawnzv5y3ebq@steredhat>
References: <20210408101252.552-1-xieyongji@bytedance.com>
 <YIbdYdxD0CDcX+C2@stefanha-x1.localdomain>
 <CACycT3sU3LDnAvk_iefo=91L91=8TNRQJfKyRvOy2EOtiesBMw@mail.gmail.com>
 <YIgfh632Evrdid12@stefanha-x1.localdomain>
 <CACycT3sV_Bv63Y5pvYV=e2-B5c3Lky2UWWc4tk=DDN0tKs=6Ng@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACycT3sV_Bv63Y5pvYV=e2-B5c3Lky2UWWc4tk=DDN0tKs=6Ng@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Zhu,
 Lingshan" <lingshan.zhu@intel.com>, mreitz@redhat.com, changpeng.liu@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 28, 2021 at 07:27:03PM +0800, Yongji Xie wrote:
>On Tue, Apr 27, 2021 at 10:28 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>>
>> On Tue, Apr 27, 2021 at 06:24:55PM +0800, Yongji Xie wrote:
>> > On Mon, Apr 26, 2021 at 11:34 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>> > >
>> > > On Thu, Apr 08, 2021 at 06:12:49PM +0800, Xie Yongji wrote:
>> > > > Since we already have some ways to emulate vDPA block device
>> > > > in kernel[1] or userspace[2]. This series tries to introduce a
>> > > > new vhost-vdpa block device for that. To use it, we can add
>> > > > something like:
>> > > >
>> > > > qemu-system-x86_64 \
>> > > >     -device vhost-vdpa-blk-pci,vdpa-dev=/dev/vhost-vdpa-0
>> > >
>> > > This device is similar to vhost-user-blk. QEMU does not see it as a
>> > > block device so storage migration, I/O throttling, image formats, etc
>> > > are not supported. Stefano Garzarella and I discussed how vdpa-blk
>> > > devices could integrate more deeply with QEMU's block layer. The QEMU
>> > > block layer could be enabled only when necessary and otherwise bypassed
>> > > for maximum performance.
>> > >
>> >
>> > Do you mean we can make use of the shadow virtqueue for the slow path
>> > (I/O will go through the block layer) and add a fast path (like what
>> > we do now) to bypass the block layer?
>>
>> Yes.
>>
>> > > This alternative approach is similar to how vhost-net is implemented in
>> > > QEMU. A BlockDriver would handle the vdpa-blk device and the regular
>> > > virtio-blk-pci device would still be present. The virtqueues could be
>> > > delegated to the vdpa-blk device in order to bypass the QEMU block
>> > > layer.
>> > >
>> > > I wanted to mention this since it's likely that this kind of vdpa-blk
>> > > device implementation will be posted in the future and you might be
>> > > interested. It makes live migration with non-shared storage possible,
>> > > for example.
>> > >
>> >
>> > That would be nice, I'm looking forward to it!
>> >
>> > So do you think whether it's necessary to continue this approach?
>> > Looks like we don't need a vhost-vdpa-blk device any more in the new
>> > approach.
>>
>> There is no code for the vdpa-blk BlockDriver yet and the implementation
>> will be more complex than this patch series (more risk the feature could
>> be delayed).
>>
>> If you need vdpa-blk as soon as possible then this patch series may be a
>> pragmatic solution. As long as it doesn't limit the vdpa-blk interface
>> in a way that prevents the BlockDriver implementation then I think QEMU
>> could support both.
>>
>> In the long term the vdpa-blk BlockDriver could replace -device
>> vdpa-blk-pci since the performance should be identical and it supports
>> more use cases.
>>
>> It's up to you. You're welcome to wait for the BlockDriver, work
>> together with Stefano on the BlockDriver, or continue with your patch
>> series.
>>
>
>I like the new idea! Let me wait for it.
>

Thanks for this great discussion!

I'll keep you updated and I'll CC you on the RFC when I have something 
ready.

Cheers,
Stefano


