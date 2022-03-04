Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B4C4CCCA4
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 05:40:44 +0100 (CET)
Received: from localhost ([::1]:51248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPzkB-0004yi-3K
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 23:40:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nPzif-0004HF-Mn
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 23:39:09 -0500
Received: from [2607:f8b0:4864:20::102a] (port=56313
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nPzid-0005nZ-Sf
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 23:39:09 -0500
Received: by mail-pj1-x102a.google.com with SMTP id gb21so6408696pjb.5
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 20:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=3I20mvAa5JpG1omtmnM5hWQM857bYm4Qu06tzPBNBns=;
 b=L0zw/GB5kYN50v4VO5HR7mr6G5d8Yja045Juu04LfUUGHE4QpHCtWUo6OmYJiWLZ7K
 F6IENeD0Vs2gWY3Xs+WrYEaVRAuNT4FHu03eoe3pxyi6bmw5vyq4YHsjE84TX95Do0BA
 kglojVvMNkyczdiVwwpB4BD23yTk2m3iSJFKb1jIgyY6NlvRgTWSnWmiOjR6Pb4YSoAU
 RUtWqt+9P6pfCAa2Agyr/GHkRvS8k+0mwBNvpkaORPSENy/GoRv66jyuTQtwV8V8ppP7
 3pOHpaFoToJYLXajZ5K5Kqb38vA12XgL5eghKLMdZjFEvTZPzXidkafzvI5EAl2fWTsl
 XB5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=3I20mvAa5JpG1omtmnM5hWQM857bYm4Qu06tzPBNBns=;
 b=IfpAsWexXBm7ug1vrLM8g9k/1+PTU8U6lg35pSieeCdbL5jgIRB/gcqn7k28T+4NIC
 YE5GfPBNW2gVzm8+Wu2ZbXveJxFWvQXQ4rp5uZNHasIb9EPLWN35EElCe18bQStU610Q
 UWC27+hsSHHz2WYIP/BZiJyGswjIOkgvocXi5v3TlDYkelFtu2/33eTJgBwfD1Hg9fSN
 JwGUyIglKOghe3N9gPE6wlG0S3iFLWZpuLTBCkzMgNgKKZE2Lygkvh7wFZdjYnyxBL1P
 CpkQn/NNp6RXlKBvk4IPMPnyOcyXA8iLTo6nCjinS6/cescIVHcGOMeMMpCVVjkXk/bM
 4QTw==
X-Gm-Message-State: AOAM532cmsSfMp5NG9JGdA7Niuk+nmJiD9lwhr0am7Vf8bFAWVHvyv4g
 QwLjtEDtUFUDAg97XZ+oBc8=
X-Google-Smtp-Source: ABdhPJx1S81gEMLL/LgVOUWf479cr+XnDRZ118amJ/JJZ18ZbwOIUtjlME7m7tM213GlQLIKi0/S2g==
X-Received: by 2002:a17:90a:19d2:b0:1be:d815:477f with SMTP id
 18-20020a17090a19d200b001bed815477fmr8807490pjj.23.1646368746538; 
 Thu, 03 Mar 2022 20:39:06 -0800 (PST)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a17090a3f8b00b001bc299e0aefsm9455293pjc.56.2022.03.03.20.39.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 20:39:06 -0800 (PST)
Message-ID: <a54418ad-0207-4e91-3070-57e337c9d50a@gmail.com>
Date: Fri, 4 Mar 2022 13:39:01 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v15 3/8] net/vmnet: implement shared mode (vmnet-shared)
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 Vladislav Yaroshchuk <vladislav.yaroshchuk@jetbrains.com>
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
 <CAMVc7JWASjc5BCZEyDyS44wPXFGk+Lw78fVNPPT4PL7ac_pJKg@mail.gmail.com>
In-Reply-To: <CAMVc7JWASjc5BCZEyDyS44wPXFGk+Lw78fVNPPT4PL7ac_pJKg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, phillip.ennen@gmail.com,
 qemu Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Markus Armbruster <armbru@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Phillip Tennen <phillip@axleos.com>,
 Roman Bolshakov <roman@roolebo.dev>, Howard Spoelstra <hsp.cat7@gmail.com>,
 Alessio Dionisi <hello@adns.io>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/03/04 3:34, Akihiko Odaki wrote:
> On Fri, Mar 4, 2022 at 12:43 AM Vladislav Yaroshchuk
> <vladislav.yaroshchuk@jetbrains.com> wrote:
>>
>>
>>
>> On Tue, Mar 1, 2022 at 11:21 AM Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>>>
>>> On 2022/03/01 17:09, Vladislav Yaroshchuk wrote:
>>>>       > Not sure that only one field is enough, cause
>>>>       > we may have two states on bh execution start:
>>>>       > 1. There are packets in vmnet buffer s->packets_buf
>>>>       >      that were rejected by qemu_send_async and waiting
>>>>       >      to be sent. If this happens, we should complete sending
>>>>       >      these waiting packets with qemu_send_async firstly,
>>>>       >      and after that we should call vmnet_read to get
>>>>       >      new ones and send them to QEMU;
>>>>       > 2. There are no packets in s->packets_buf to be sent to
>>>>       >      qemu, we only need to get new packets from vmnet
>>>>       >      with vmnet_read and send them to QEMU
>>>>
>>>>      In case 1, you should just keep calling qemu_send_packet_async.
>>>>      Actually
>>>>      qemu_send_packet_async adds the packet to its internal queue and calls
>>>>      the callback when it is consumed.
>>>>
>>>>
>>>> I'm not sure we can keep calling qemu_send_packet_async,
>>>> because as docs from net/queue.c says:
>>>>
>>>> /* [...]
>>>>    * If a sent callback is provided to send(), the caller must handle a
>>>>    * zero return from the delivery handler by not sending any more packets
>>>>    * until we have invoked the callback. Only in that case will we queue
>>>>    * the packet.
>>>>    *
>>>>    * If a sent callback isn't provided, we just drop the packet to avoid
>>>>    * unbounded queueing.
>>>>    */
>>>>
>>>> So after we did vmnet_read and read N packets
>>>> into temporary s->packets_buf, we begin calling
>>>> qemu_send_packet_async. If it returns 0 - it says
>>>> "no more packets until sent_cb called please".
>>>> At this moment we have N packets in s->packets_buf
>>>> and already queued K < N of them. But, packets K..N
>>>> are not queued and keep waiting for sent_cb to be sent
>>>> with qemu_send_packet_async.
>>>> Thus when sent_cb called, we should finish
>>>> our transfer of packets K..N from s->packets_buf
>>>> to qemu calling qemu_send_packet_async.
>>>> I meant this.
>>>
>>> I missed the comment. The description is contradicting with the actual
>>> code; qemu_net_queue_send_iov appends the packet to the queue whenever
>>> it cannot send one immediately.
>>>
>>
>> Yes, it appends, but (net/queue.c):
>> *  qemu_net_queue_send tries to deliver the packet
>>      immediately. If the packet cannot be delivered, the
>>      qemu_net_queue_append is called and 0 is returned
>>      to say the caller "the receiver is not ready, hold on";
>> *  qemu_net_queue_append does a probe before adding
>>      the packet to the queue:
>>      if (queue->nq_count >= queue->nq_maxlen && !sent_cb) {
>>          return; /* drop if queue full and no callback */
>>      }
>>
>> The queue is not infinite, so we have three cases:
>> 1. The queue is not full -> append the packet, no
>>      problems here
>> 2. The queue is full, no callback -> we cannot notify
>>      a caller when we're ready, so just drop the packet
>>      if we can't append it.
>> 3. The queue is full, callback present -> we can notify
>>      a caller when we are ready, so "let's queue this packet,
>>      but expect no more (!) packets is sent until I call
>>      sent_cb when the queue is ready"
>>
>> Therefore if we provide a callback and keep sending
>> packets if 0 is returned, this may cause unlimited(!)
>> queue growth. To prevent this, we should stop sending
>> packets and wait for notification callback to continue.
>>
>> I don't see any contradiction with that comment.
>>
>>> Jason Wang, I saw you are in the MAINTAINERS for net/. Can you tell if
>>> calling qemu_send_packet_async is allowed after it returns 0?
>>>
>>
>> It may be wrong, but I think it's not allowed to send
>> packets after qemu_send_packet_async returns 0.
>>
>> Jason Wang, can you confirm please?
>>
>> Best Regards,
>>
>> Vladislav Yaroshchuk
>>
>>>
>>> Regards,
>>> Akihiko Odaki
>>
>>
>>
> 
> The unlimited queue growth would not happen if you stop calling
> vmnet_read after qemu_send_packet_async returns 0. So I think the
> comment should be amended to say something like:
> "Once qemu_send_packet_async returns 0, the client should stop reading
> more packets from the underlying NIC to prevent infinite growth of the
> queue until the last callback gets called."
> 
> The unique feature of vmnet is that it can read multiple packets at
> once, and I guess it is the reason why the comment in net/queue.c
> missed the case. But this is all my guess so I need confirmation from
> the maintainer.
> 
> Regards,
> Akihiko Odaki

I forgot to include Jason Wang to To for this email.

