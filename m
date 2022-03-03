Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 833494CC546
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 19:36:52 +0100 (CET)
Received: from localhost ([::1]:38932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPqJn-0007PG-1U
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 13:36:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nPqI5-0006Bl-Ob
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 13:35:05 -0500
Received: from [2607:f8b0:4864:20::22f] (port=36392
 helo=mail-oi1-x22f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nPqI4-0007ZT-1F
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 13:35:05 -0500
Received: by mail-oi1-x22f.google.com with SMTP id z8so2266257oix.3
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 10:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q0kWy4cBIBx5bbtGsiekDRYvZAuFQs57BWk0ujeOLyI=;
 b=Ps2gxO0a9bGmzyH5iQ6MYwYM1EDewgJS7RpPgr3vBzSNGlKPVw6sACCBLGMuW8bnKz
 mUVwgBYmWxxOe9UULxzR//0cLoWtLKoWVTEI29GeXqhVcMmpl6lHnqTBEiyipCISRjBZ
 ULlIaO/g9hwHO98cflETVkGSeZFDVgM4tSnmD8Tm/neL/viB+0JAxeBniLDMKgIvpPnJ
 4qT806OizdjjNLRxndYhcL66rMVSEYVFcANMjnaI9eNwL99L40NzZO4Cvc3HK7S93BLy
 5VMsnQtbpJL7xeqpvudLUhd9gMAx11pb3ewV0CHWMhn2ZSXXym3suK2G/F2ULZC7KLoO
 Ya8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q0kWy4cBIBx5bbtGsiekDRYvZAuFQs57BWk0ujeOLyI=;
 b=qxxjNNsau0SqAaC8IAdVsj1qjCQejvpo3NuUapDIvBToGXl+OkaEFY8/bGgmDhMw+e
 +HIlOpT4PlVqnFoTCzzi5+gvFrMoP/MJXKybW/XlawnuEz+Jddv6dM1LgK80hsotNhVo
 k3ZVC3vrduJdfdngRxHJ+8/Acz1pVYWiQL7wFhbn0XGP2bnKwMg5WSOoKerA61Y7Z9H9
 y7VE2O72zpeSpdwUQZtn+x9gcO+IC8mlyuL8kxUA6hqNwU3kidZgESw354+vqXxvPTSp
 OGSJgsc4xxXWWz6+BVbYYGLH39KTYuaTTB03+H0Iia/FhbHguJPTfc/VO4ebWTC/Rd2D
 aKVg==
X-Gm-Message-State: AOAM531fDIGi4HE3hrmEQ7QiIB+K3Mxo9KLXIiM/jveKuuj2U/ASkWFy
 6wIqmaxnRPsYmD2YNY+0tC3YJPnmYkhUHyPQTpA=
X-Google-Smtp-Source: ABdhPJyRuGKKXOdWbGMCDdWSDr5E9XNbPMYBJNAYRGoRxIaM5JqG9SsZU7NR018pV54cVXlCIPkgUquVScOIHxv7BjE=
X-Received: by 2002:a05:6808:2386:b0:2d5:4499:cc4e with SMTP id
 bp6-20020a056808238600b002d54499cc4emr5705263oib.11.1646332502255; Thu, 03
 Mar 2022 10:35:02 -0800 (PST)
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
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Fri, 4 Mar 2022 03:34:51 +0900
Message-ID: <CAMVc7JWASjc5BCZEyDyS44wPXFGk+Lw78fVNPPT4PL7ac_pJKg@mail.gmail.com>
Subject: Re: [PATCH v15 3/8] net/vmnet: implement shared mode (vmnet-shared)
To: Vladislav Yaroshchuk <vladislav.yaroshchuk@jetbrains.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>, phillip.ennen@gmail.com,
 qemu Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Markus Armbruster <armbru@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Phillip Tennen <phillip@axleos.com>,
 Roman Bolshakov <roman@roolebo.dev>, Howard Spoelstra <hsp.cat7@gmail.com>,
 Alessio Dionisi <hello@adns.io>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 4, 2022 at 12:43 AM Vladislav Yaroshchuk
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

The unlimited queue growth would not happen if you stop calling
vmnet_read after qemu_send_packet_async returns 0. So I think the
comment should be amended to say something like:
"Once qemu_send_packet_async returns 0, the client should stop reading
more packets from the underlying NIC to prevent infinite growth of the
queue until the last callback gets called."

The unique feature of vmnet is that it can read multiple packets at
once, and I guess it is the reason why the comment in net/queue.c
missed the case. But this is all my guess so I need confirmation from
the maintainer.

Regards,
Akihiko Odaki

