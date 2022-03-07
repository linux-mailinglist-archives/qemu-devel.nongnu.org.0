Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCD24CF251
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 07:57:26 +0100 (CET)
Received: from localhost ([::1]:40372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR7J7-0008CJ-1l
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 01:57:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nR7Gs-0005o8-0a
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 01:55:06 -0500
Received: from [2607:f8b0:4864:20::22f] (port=46717
 helo=mail-oi1-x22f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nR7Gp-0007a8-Ur
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 01:55:05 -0500
Received: by mail-oi1-x22f.google.com with SMTP id l25so14174151oic.13
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 22:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hGE+m069KkpI2OdzOe5bBGaZW/FLIyc1t4ZVmPp9ufQ=;
 b=PSkTtIW6BAgngX6wYktX9tC6GcpXv0vkbszxv1GbJ0XZYzB1/02ojL/gyZGFg+7eGN
 CJEw1A+mch2IF+qZESs3rA+lMfFIIyjopqSJ+XJkZwW5LVzfVsMd4Uj9tYtQvb+A/kA8
 1/gOXZvv5Sn4ZDIxXYp+ZlVbRHmDlafPb3iQ8UicKfrkx6iSlTIWYhtzCAWmvUmKCwtb
 pl5qYPABnbAlJpaayQuiqkd66PWreC4m/c8GdwGYgKQB0Jpz97FlhKIkYsH+XgDYUzfB
 bvoyHsu6L4lr79lF+piOTsthFH+yknG3u/zZqQMiitX5nskE0ezxsJco59Pyy64CFnEd
 d2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hGE+m069KkpI2OdzOe5bBGaZW/FLIyc1t4ZVmPp9ufQ=;
 b=vziPFv0d1Ivt6lYs91Ihr/Hq3dqFKFFfd065DyEsvSWC1woINVyjC//KSRW4BG3e48
 jXpC5PGFZlwGhhbF0pwEUqXxC9h/U8biKsWVNyTU8aKsx1X/G+u9d2OlxTdQW1Nx6Vuh
 1RCr8Py/3MVmXCIPvi7GaiizYnKY1cphDvdy8GGhv9PiAaJJ0TXWM1avJ3ahV6csBwy8
 CUOFHO4z7SnPS5UwHKtdqOmjg+D8NQEyAnKYs2j6X62phIB/OvXN1Hruk5oyGuAbB69Y
 zpcjIcceSEYEvPyr8Cz6SwfDpfEdWTn3eJXCfUgHsQdwlo6LLKTjXMXTkgD2KG7MGHGW
 eO1Q==
X-Gm-Message-State: AOAM5327j8qOplJ3VsBFmDak+Riqp4wpRFMLDP0yOj3QU4I1UAAcpWRG
 2VXxr4IIhjyqzIJ4nFXLn/2q9LiarYQIr9S3qjo=
X-Google-Smtp-Source: ABdhPJyIcF+8gxYF6cQYtLmV/NjnSPYvLpLajsUH9r1wu2GM4W6GmRO/wcjq9cTxnMhrXNQ5QLkphkLhniW0icVMERE=
X-Received: by 2002:a05:6808:3020:b0:2d9:b433:ddbf with SMTP id
 ay32-20020a056808302000b002d9b433ddbfmr4691126oib.172.1646636102359; Sun, 06
 Mar 2022 22:55:02 -0800 (PST)
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
 <CACGkMEsgqUzm+30jxRCq1Jce6Pu=1+Jw_Q08KzoBviSb-CO6Kg@mail.gmail.com>
 <b3279a3c-6951-8016-617a-81abb04bd137@gmail.com>
 <CACGkMEuzqhVNGo2btM3rWAhaxfFSpAvPqWjjnPqGbSPa=K68bA@mail.gmail.com>
 <CAMVc7JVS8VjqfJjucRu=if5LiwXeq+3eGe+bSNWT0--EZ==tCw@mail.gmail.com>
 <CACGkMEsq_dCqG10rbx2CTzbJiFvtLaZdiL7hfrq3eeJP_s1SQQ@mail.gmail.com>
In-Reply-To: <CACGkMEsq_dCqG10rbx2CTzbJiFvtLaZdiL7hfrq3eeJP_s1SQQ@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Mon, 7 Mar 2022 15:54:51 +0900
Message-ID: <CAMVc7JX+7Bvvf_s4YHDgUy1rO03=+Kyo71SazfY+OeTEwegj5A@mail.gmail.com>
Subject: Re: [PATCH v15 3/8] net/vmnet: implement shared mode (vmnet-shared)
To: Jason Wang <jasowang@redhat.com>, 
 Vladislav Yaroshchuk <vladislav.yaroshchuk@jetbrains.com>
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
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, phillip.ennen@gmail.com,
 qemu Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Markus Armbruster <armbru@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Phillip Tennen <phillip@axleos.com>,
 Roman Bolshakov <roman@roolebo.dev>, Howard Spoelstra <hsp.cat7@gmail.com>,
 Alessio Dionisi <hello@adns.io>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 7, 2022 at 1:52 PM Jason Wang <jasowang@redhat.com> wrote:
>
> On Mon, Mar 7, 2022 at 12:25 PM Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
> >
> > On Mon, Mar 7, 2022 at 12:59 PM Jason Wang <jasowang@redhat.com> wrote:
> > >
> > > On Fri, Mar 4, 2022 at 12:37 PM Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
> > > >
> > > > On 2022/03/04 10:37, Jason Wang wrote:
> > > > > On Thu, Mar 3, 2022 at 11:43 PM Vladislav Yaroshchuk
> > > > > <vladislav.yaroshchuk@jetbrains.com> wrote:
> > > > >>
> > > > >>
> > > > >>
> > > > >> On Tue, Mar 1, 2022 at 11:21 AM Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
> > > > >>>
> > > > >>> On 2022/03/01 17:09, Vladislav Yaroshchuk wrote:
> > > > >>>>       > Not sure that only one field is enough, cause
> > > > >>>>       > we may have two states on bh execution start:
> > > > >>>>       > 1. There are packets in vmnet buffer s->packets_buf
> > > > >>>>       >      that were rejected by qemu_send_async and waiting
> > > > >>>>       >      to be sent. If this happens, we should complete sending
> > > > >>>>       >      these waiting packets with qemu_send_async firstly,
> > > > >>>>       >      and after that we should call vmnet_read to get
> > > > >>>>       >      new ones and send them to QEMU;
> > > > >>>>       > 2. There are no packets in s->packets_buf to be sent to
> > > > >>>>       >      qemu, we only need to get new packets from vmnet
> > > > >>>>       >      with vmnet_read and send them to QEMU
> > > > >>>>
> > > > >>>>      In case 1, you should just keep calling qemu_send_packet_async.
> > > > >>>>      Actually
> > > > >>>>      qemu_send_packet_async adds the packet to its internal queue and calls
> > > > >>>>      the callback when it is consumed.
> > > > >>>>
> > > > >>>>
> > > > >>>> I'm not sure we can keep calling qemu_send_packet_async,
> > > > >>>> because as docs from net/queue.c says:
> > > > >>>>
> > > > >>>> /* [...]
> > > > >>>>    * If a sent callback is provided to send(), the caller must handle a
> > > > >>>>    * zero return from the delivery handler by not sending any more packets
> > > > >>>>    * until we have invoked the callback. Only in that case will we queue
> > > > >>>>    * the packet.
> > > > >>>>    *
> > > > >>>>    * If a sent callback isn't provided, we just drop the packet to avoid
> > > > >>>>    * unbounded queueing.
> > > > >>>>    */
> > > > >>>>
> > > > >>>> So after we did vmnet_read and read N packets
> > > > >>>> into temporary s->packets_buf, we begin calling
> > > > >>>> qemu_send_packet_async. If it returns 0 - it says
> > > > >>>> "no more packets until sent_cb called please".
> > > > >>>> At this moment we have N packets in s->packets_buf
> > > > >>>> and already queued K < N of them. But, packets K..N
> > > > >>>> are not queued and keep waiting for sent_cb to be sent
> > > > >>>> with qemu_send_packet_async.
> > > > >>>> Thus when sent_cb called, we should finish
> > > > >>>> our transfer of packets K..N from s->packets_buf
> > > > >>>> to qemu calling qemu_send_packet_async.
> > > > >>>> I meant this.
> > > > >>>
> > > > >>> I missed the comment. The description is contradicting with the actual
> > > > >>> code; qemu_net_queue_send_iov appends the packet to the queue whenever
> > > > >>> it cannot send one immediately.
> > > > >>>
> > > > >>
> > > > >> Yes, it appends, but (net/queue.c):
> > > > >> *  qemu_net_queue_send tries to deliver the packet
> > > > >>      immediately. If the packet cannot be delivered, the
> > > > >>      qemu_net_queue_append is called and 0 is returned
> > > > >>      to say the caller "the receiver is not ready, hold on";
> > > > >> *  qemu_net_queue_append does a probe before adding
> > > > >>      the packet to the queue:
> > > > >>      if (queue->nq_count >= queue->nq_maxlen && !sent_cb) {
> > > > >>          return; /* drop if queue full and no callback */
> > > > >>      }
> > > > >>
> > > > >> The queue is not infinite, so we have three cases:
> > > > >> 1. The queue is not full -> append the packet, no
> > > > >>      problems here
> > > > >> 2. The queue is full, no callback -> we cannot notify
> > > > >>      a caller when we're ready, so just drop the packet
> > > > >>      if we can't append it.
> > > > >> 3. The queue is full, callback present -> we can notify
> > > > >>      a caller when we are ready, so "let's queue this packet,
> > > > >>      but expect no more (!) packets is sent until I call
> > > > >>      sent_cb when the queue is ready"
> > > > >>
> > > > >> Therefore if we provide a callback and keep sending
> > > > >> packets if 0 is returned, this may cause unlimited(!)
> > > > >> queue growth. To prevent this, we should stop sending
> > > > >> packets and wait for notification callback to continue.
> > > > >
> > > > > Right.
> > > > >
> > > > >>
> > > > >> I don't see any contradiction with that comment.
> > > > >>
> > > > >>> Jason Wang, I saw you are in the MAINTAINERS for net/. Can you tell if
> > > > >>> calling qemu_send_packet_async is allowed after it returns 0?
> > > > >>>
> > > > >>
> > > > >> It may be wrong, but I think it's not allowed to send
> > > > >> packets after qemu_send_packet_async returns 0.
> > > > >>
> > > > >> Jason Wang, can you confirm please?
> > > > >
> > > > > With a cb, we can't do this. All users with cb will disable the source
> > > > > polling and depend on the cb to re-read the polling.
> > > > > (tap/l2tpv3/socket).
> > > > >
> > > > > Without a cb, we can. As analyzed above, qemu_net_queue_append() can
> > > > > limit the number of packets queued in this case.
> > > >
> > > > vmnet can read multiple packets at once. What about such a case? Isn't
> > > > calling qemu_send_packet_async for already read packet and stopping
> > > > reading more fine?
> > >
> > > It should be fine, I remember I've asked whether or not the source
> > > could be disabled but I get the answer that it can't.
> > >
> > > Thanks
> >
> > It can, but there could be more packets before disabling the source
> > because vmnet reads multiple packets with one call. The procedure is:
> > call qemu_send_packet_async with a callback, and if it returns 0,
> > disable the source and keep calling qemu_send_packet_async with a
> > callback until all the packets already read are queued. Is this kind
> > of procedure allowed?
>
> So it might have several issues if we do this:
>
> 1) there's no guarantee that the following call to
> qemu_send_packet_async() will always return 0, this could happen if
> the device has some rx buffer after the first call to
> qemu_send_packet_asnyc(). Then we may end up with out-of order
> delivery.
> 2) calling with a cb may suppress the queue limit check, buggy driver
> may cause unlimited number of packets to be queued under heavy traffic
>
> It looks to me we'd better store those pending buffers in the vmnet,
> and when sent_cb is triggered, start from those buffers first. (Or
> simply drop the packets)

Thanks for the explanation. Vladislav had an idea of such an
implementation so it would be the option we would choose. Let me
review the design again.

On 2022/02/28 20:59, Vladislav Yaroshchuk wrote:
> It can be done kinda this way:
> ```
> struct s:
>      send_bh:                    bh
>      packets_buf:              array[packet]
>      ## Three new fields
>      send_enabled:           bool

send_enabled can be eliminated. When it is enabled, packets_send_pos
and packets_batch_size must be equal. They must not be equal
otherwise. packets_send_pos must represent the position of the packet
which is not sent yet, possibly in the process of sending.
vmnet_send_completed must call qemu_send_wrapper before scheduling
send_bh. bh_send should do nothing if s->packets_send_pos <
s->packets_batch_size.

>      packets_send_pos:    int
>      packets_batch_size:  int

The name packets_batch_size lacks the context that it is used for
sending. The relation between the two members is not obvious either.
Perhaps they could be named packets_send_current_pos and
packets_send_end_pos.

>
> fun bh_send(s):
>      ## Send disabled - do nothing
>      if not s->send_enabled:
>          return
>      ## If some packets are waiting to be sent in
>      ## s->packets_buf - send them
>      if s->packets_send_pos < s->packets_batch_size:
>          if not qemu_send_wrapper(s):
>              return
>
>      ## Try to read new packets from vmnet
>      s->packets_send_pos = 0
>      s->packets_batch_size = 0
>      s->packets_buf = vmnet_read(&s->packets_batch_size)
>      if s->packets_batch_size > 0:
>          # If something received - process them
>          qemu_send_wrapper(s)
> fun qemu_send_wrapper(s):
>      for i in s->packets_send_pos to s->packets_batch_size:
>          size = qemu_send_async(s->packets_buf[i],
>                                                    vmnet_send_completed)
>          if size == 0:
>              ## Disable packets processing until vmnet_send_completed
>              ## Save the state: packets to be sent now in s->packets_buf
>              ## in range s->packets_send_pos..s->packets_batch_size
>              s->send_enabled = false
>              s->packets_send_pos = i + 1
>              break
>          if size < 0:
>              ## On error just drop the packets
>              s->packets_send_pos = 0
>              s->packets_batch_size = 0

We could ignore just one packet. Although it is unlikely, something
specific to the packet may be wrong and other packets may be fine.

>              break
>
>       return s->send_enabled
>
>
> fun vmnet_send_completed(s):
>      ## Complete sending packets from s->packets_buf
>      s->send_enabled = true
>      qemu_bh_schedule(s->send_bh)
>
> ## From callback we only scheduling the bh
> vmnet.set_callback(callback = s: qemu_bh_schedule(s->send_bh))
> ```
>
> I think a simpler implementation may exist, but currently
> I see only this approach with the send_enabled flag and
> two more fields to save packets sending state.

Aside from the send_enabled flag, I agree it is the simplest.

Regards,
Akihiko Odaki

