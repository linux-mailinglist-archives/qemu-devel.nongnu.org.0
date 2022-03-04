Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF374CCB5F
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 02:41:42 +0100 (CET)
Received: from localhost ([::1]:50786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPwwv-0004i3-I2
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 20:41:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nPwtY-0003uL-KE
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 20:38:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nPwtT-0003rO-4c
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 20:38:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646357885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YwjzNOAYhjUUDVx+984iQgFChLlN5FQVU66u0rldfaQ=;
 b=K9j5TdgwhmmEK+enMiR39BVrM85sWMsgyokRBe5JewDPJUnM2BUr2yIgUf3+/KFv3KmMmz
 d9YuGSspjTr7EaiXDNgoVPqN2sbRyEIOKnZ9qfxKxPKk4TwpZRRRtyhZfDMHVLv25GbN7h
 XE50eF1IGnEYReJYTX5T2ImnCNxq7YQ=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-371-1KhZqWUGMdGFggSGraequw-1; Thu, 03 Mar 2022 20:38:02 -0500
X-MC-Unique: 1KhZqWUGMdGFggSGraequw-1
Received: by mail-lj1-f199.google.com with SMTP id
 6-20020a2eb946000000b002463d2915d2so2537041ljs.9
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 17:38:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YwjzNOAYhjUUDVx+984iQgFChLlN5FQVU66u0rldfaQ=;
 b=HAqACChkCG8+RfDFsviXu3LQ4AeybgxpnWOfA6eIqTNHGca7+dh7nBvE04UW5eaATN
 MH1hl3RTBM89yjVhstYsaYxEFlZJx+Kq4Y4MKbQ3AmIez+nTY6sQcltxdvYWNeCjwias
 fUeCvF+GQhIiHRa2kffFvt8ARqoF+3n4Mf93pB3YM4IQ6L6mJsK7paOPVvnI1IkgACyC
 g89i8OtntVTJXooVfsMrRrRRg3eHyzodtXW7e0ceAC6loP6qL/E0rzjYeG/E8RlLz6aM
 fWHiQ/EpiLOoVAZM6KXpghjP8TVmC0oBBWsK7ab9qufIPP3D2Q6ZMSdb8jYbc2IJZRR9
 h6Xg==
X-Gm-Message-State: AOAM533ayiGjOBNIjTsnErMJ1rbfskjCtkGe2Gh38oFWS4VKHXRlCljS
 vlIEOgxuXaokU/E7Je6U3qye/31uW8AIY9DdCTa76P5LMmO4ojLGf+5LY/MuQz3WXrCgOI2cT5n
 robWZ+fQnfGv5uQyPI7ODSWdBLQZRYYE=
X-Received: by 2002:a2e:7a15:0:b0:236:deb2:1f74 with SMTP id
 v21-20020a2e7a15000000b00236deb21f74mr24902890ljc.315.1646357880669; 
 Thu, 03 Mar 2022 17:38:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyC4R2oiEwQ+5L4mGAJLzl1WDbljndn2ikc7wc/llHi+aT/d32FkI2HUCix/uEGDSntYoiMdnA1FF8FehP96Jo=
X-Received: by 2002:a2e:7a15:0:b0:236:deb2:1f74 with SMTP id
 v21-20020a2e7a15000000b00236deb21f74mr24902858ljc.315.1646357880392; Thu, 03
 Mar 2022 17:38:00 -0800 (PST)
MIME-Version: 1.0
References: <20220225171402.64861-1-Vladislav.Yaroshchuk@jetbrains.com>
 <20220225171402.64861-4-Vladislav.Yaroshchuk@jetbrains.com>
 <50a27646-ce9c-c702-965f-46b602be9220@gmail.com>
 <CAGmdLqQ8J+-sK=Huh-G8w-S0RQUEyKkN2rb6PsZAFXbd6Jk2EQ@mail.gmail.com>
 <f839edfc-de5f-7002-4916-21c541a5185b@gmail.com>
 <CAGmdLqRVtJN8YoxfeCYuay-k+RVofM8W=wicn0fRdjau0uwCHQ@mail.gmail.com>
 <CAMVc7JVnxNTMhked8x=Z0baY2ApMKwB8FrESYWQjm43-6Wm+3A@mail.gmail.com>
 <CAGmdLqQhd9q9VQUKEd_hb9rnb2HwrdAv31aB67sUj_=jiLX_Sw@mail.gmail.com>
 <7b4e06fe-4d10-0870-5d6e-d2e70d7eb3a2@gmail.com>
 <CAGmdLqTqcESsiyTMavKZ3U8=5yPtqdq2tunZTH-tfrzwfUMGug@mail.gmail.com>
 <e5302fba-e773-c56d-388f-a3593bacd977@gmail.com>
 <CAGmdLqRCSYzjWBT7OhfP-hZHYwP8F3=4hpwQ+E76ShxjmRTO5Q@mail.gmail.com>
In-Reply-To: <CAGmdLqRCSYzjWBT7OhfP-hZHYwP8F3=4hpwQ+E76ShxjmRTO5Q@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 4 Mar 2022 09:37:49 +0800
Message-ID: <CACGkMEsgqUzm+30jxRCq1Jce6Pu=1+Jw_Q08KzoBviSb-CO6Kg@mail.gmail.com>
Subject: Re: [PATCH v15 3/8] net/vmnet: implement shared mode (vmnet-shared)
To: Vladislav Yaroshchuk <vladislav.yaroshchuk@jetbrains.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, phillip.ennen@gmail.com,
 qemu Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Markus Armbruster <armbru@redhat.com>, Roman Bolshakov <roman@roolebo.dev>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 Phillip Tennen <phillip@axleos.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Howard Spoelstra <hsp.cat7@gmail.com>, Alessio Dionisi <hello@adns.io>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 3, 2022 at 11:43 PM Vladislav Yaroshchuk
<vladislav.yaroshchuk@jetbrains.com> wrote:
>
>
>
> On Tue, Mar 1, 2022 at 11:21 AM Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>>
>> On 2022/03/01 17:09, Vladislav Yaroshchuk wrote:
>> >      > Not sure that only one field is enough, cause
>> >      > we may have two states on bh execution start:
>> >      > 1. There are packets in vmnet buffer s->packets_buf
>> >      >      that were rejected by qemu_send_async and waiting
>> >      >      to be sent. If this happens, we should complete sending
>> >      >      these waiting packets with qemu_send_async firstly,
>> >      >      and after that we should call vmnet_read to get
>> >      >      new ones and send them to QEMU;
>> >      > 2. There are no packets in s->packets_buf to be sent to
>> >      >      qemu, we only need to get new packets from vmnet
>> >      >      with vmnet_read and send them to QEMU
>> >
>> >     In case 1, you should just keep calling qemu_send_packet_async.
>> >     Actually
>> >     qemu_send_packet_async adds the packet to its internal queue and calls
>> >     the callback when it is consumed.
>> >
>> >
>> > I'm not sure we can keep calling qemu_send_packet_async,
>> > because as docs from net/queue.c says:
>> >
>> > /* [...]
>> >   * If a sent callback is provided to send(), the caller must handle a
>> >   * zero return from the delivery handler by not sending any more packets
>> >   * until we have invoked the callback. Only in that case will we queue
>> >   * the packet.
>> >   *
>> >   * If a sent callback isn't provided, we just drop the packet to avoid
>> >   * unbounded queueing.
>> >   */
>> >
>> > So after we did vmnet_read and read N packets
>> > into temporary s->packets_buf, we begin calling
>> > qemu_send_packet_async. If it returns 0 - it says
>> > "no more packets until sent_cb called please".
>> > At this moment we have N packets in s->packets_buf
>> > and already queued K < N of them. But, packets K..N
>> > are not queued and keep waiting for sent_cb to be sent
>> > with qemu_send_packet_async.
>> > Thus when sent_cb called, we should finish
>> > our transfer of packets K..N from s->packets_buf
>> > to qemu calling qemu_send_packet_async.
>> > I meant this.
>>
>> I missed the comment. The description is contradicting with the actual
>> code; qemu_net_queue_send_iov appends the packet to the queue whenever
>> it cannot send one immediately.
>>
>
> Yes, it appends, but (net/queue.c):
> *  qemu_net_queue_send tries to deliver the packet
>     immediately. If the packet cannot be delivered, the
>     qemu_net_queue_append is called and 0 is returned
>     to say the caller "the receiver is not ready, hold on";
> *  qemu_net_queue_append does a probe before adding
>     the packet to the queue:
>     if (queue->nq_count >= queue->nq_maxlen && !sent_cb) {
>         return; /* drop if queue full and no callback */
>     }
>
> The queue is not infinite, so we have three cases:
> 1. The queue is not full -> append the packet, no
>     problems here
> 2. The queue is full, no callback -> we cannot notify
>     a caller when we're ready, so just drop the packet
>     if we can't append it.
> 3. The queue is full, callback present -> we can notify
>     a caller when we are ready, so "let's queue this packet,
>     but expect no more (!) packets is sent until I call
>     sent_cb when the queue is ready"
>
> Therefore if we provide a callback and keep sending
> packets if 0 is returned, this may cause unlimited(!)
> queue growth. To prevent this, we should stop sending
> packets and wait for notification callback to continue.

Right.

>
> I don't see any contradiction with that comment.
>
>> Jason Wang, I saw you are in the MAINTAINERS for net/. Can you tell if
>> calling qemu_send_packet_async is allowed after it returns 0?
>>
>
> It may be wrong, but I think it's not allowed to send
> packets after qemu_send_packet_async returns 0.
>
> Jason Wang, can you confirm please?

With a cb, we can't do this. All users with cb will disable the source
polling and depend on the cb to re-read the polling.
(tap/l2tpv3/socket).

Without a cb, we can. As analyzed above, qemu_net_queue_append() can
limit the number of packets queued in this case.

Thanks

>
> Best Regards,
>
> Vladislav Yaroshchuk
>
>>
>> Regards,
>> Akihiko Odaki
>
>
>


