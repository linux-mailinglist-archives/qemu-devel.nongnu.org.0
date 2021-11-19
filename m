Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A474568A0
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 04:31:41 +0100 (CET)
Received: from localhost ([::1]:60682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnucm-0001N0-FY
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 22:31:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mnubu-0000gB-Im
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 22:30:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mnubo-0007jK-MG
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 22:30:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637292635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y6VoJU99skFZBYQK7/VV97cOUWLxGbHjYj694z1MjWA=;
 b=HjR26CkueJZUWWVNWQmxijvAR3MryfowuZs63Vv6bnpJoMikU+QWLThXmSmBTuhVTrBcG/
 u+RY0j6MHyTAs47ZTdCV8WG4sF7wszWNkoqj945RQraECL8mBVwuysDCead2WjQpEeAyw9
 NIhX3pfuplLcGF51PipRtz2/OnTRaoE=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-527-Rc0l84qYMhKNu7FsNRWe_A-1; Thu, 18 Nov 2021 22:30:32 -0500
X-MC-Unique: Rc0l84qYMhKNu7FsNRWe_A-1
Received: by mail-pj1-f69.google.com with SMTP id
 b11-20020a17090acc0b00b001a9179dc89fso5984072pju.6
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 19:30:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Y6VoJU99skFZBYQK7/VV97cOUWLxGbHjYj694z1MjWA=;
 b=Bw3sxjTemGbsyQ1PQ7XBZhQxJ0wPtgUR8Mwz5nBaeR6t4Xyax0zfzXr+Xd942N4NGZ
 nn8U2c64KzcCKcL+qdTlf/atwIaY3cky9F/EVxSUfXAZyWNk3IfN5HroALPnzZ05dtvo
 qjRVb+LI1edqpfhl/jOzWC2Z0rZbW2VphCRvS+T/mYFh1AUSTJToXOuDGz7QQR8FNt8D
 efIF5KnAUaOAG+pC8ZTaOeeqmqbyC75isttABZq8rsSiTJVLBSCKdSy1Gaizj31kNMrg
 t/jpPM2WQnkGmV1f5B33ny7fudAHCM0SjMukIKo3adKt6OK1Et3BnYNqvf8WL0t79FyC
 6w8g==
X-Gm-Message-State: AOAM530R/YPD78x+oCFek8mETtQF+W7BH4VxpGGlUeEp1tRC/x2GoEgr
 VDi1kbbWpEQtAGx2XeTrguAt5okV+OrERE4TCCMS7LLNQ3Teux4LvkZFUnElLGHeSYuK2YVq7m+
 tmbZmBx9M5cKgsfg=
X-Received: by 2002:a17:903:245:b0:143:c5ba:8bd8 with SMTP id
 j5-20020a170903024500b00143c5ba8bd8mr48495000plh.64.1637292631536; 
 Thu, 18 Nov 2021 19:30:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz8zio3+EHp8iYGAg3y3/FqSWcOeVj1VBX1DQ7l94mqh0fkaRoLI0fmN6tGLiKGhXfuK8VPSQ==
X-Received: by 2002:a17:903:245:b0:143:c5ba:8bd8 with SMTP id
 j5-20020a170903024500b00143c5ba8bd8mr48494967plh.64.1637292631260; 
 Thu, 18 Nov 2021 19:30:31 -0800 (PST)
Received: from [10.72.13.18] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id j7sm1059876pfc.74.2021.11.18.19.30.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Nov 2021 19:30:30 -0800 (PST)
Message-ID: <943156db-07ca-5815-9eb7-f24ea6947716@redhat.com>
Date: Fri, 19 Nov 2021 11:30:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [PATCH-for-6.2] net: vmxnet3: validate configuration values
 during activate (CVE-2021-20203)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 P J P <pj.pandit@yahoo.co.in>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>
References: <20210130131652.954143-1-ppandit@redhat.com>
 <c15f0f4f-dee0-4414-6496-fe4844d34bdf@redhat.com>
 <1881029915.2747345.1634548172221@mail.yahoo.com>
 <a6f1b39a-a9ac-1d5e-7b48-9b886bc3680e@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <a6f1b39a-a9ac-1d5e-7b48-9b886bc3680e@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.084, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Gaoning Pan <pgn@zju.edu.cn>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/11/18 下午8:32, Philippe Mathieu-Daudé 写道:
> ping?


Applied.

Thanks


>
> On 10/18/21 11:09, P J P wrote:
>> On Monday, 18 October, 2021, 12:20:55 pm IST, Thomas Huth <thuth@redhat.com> wrote:
>> On 30/01/2021 14.16, P J P wrote:
>>>> diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
>>>> index eff299f629..4a910ca971 100644
>>>> --- a/hw/net/vmxnet3.c
>>>> +++ b/hw/net/vmxnet3.c
>>>> @@ -1420,6 +1420,7 @@ static void vmxnet3_activate_device(VMXNET3State *s)
>>>>        vmxnet3_setup_rx_filtering(s);
>>>>        /* Cache fields from shared memory */
>>>>        s->mtu = VMXNET3_READ_DRV_SHARED32(d, s->drv_shmem, devRead.misc.mtu);
>>>> +    assert(VMXNET3_MIN_MTU <= s->mtu && s->mtu < VMXNET3_MAX_MTU);
>>>>        VMW_CFPRN("MTU is %u", s->mtu);
>>>>    
>>>>        s->max_rx_frags =
>>>> @@ -1473,6 +1474,9 @@ static void vmxnet3_activate_device(VMXNET3State *s)
>>>>            /* Read rings memory locations for TX queues */
>>>>            pa = VMXNET3_READ_TX_QUEUE_DESCR64(d, qdescr_pa, conf.txRingBasePA);
>>>>            size = VMXNET3_READ_TX_QUEUE_DESCR32(d, qdescr_pa, conf.txRingSize);
>>>> +        if (size > VMXNET3_TX_RING_MAX_SIZE) {
>>>> +            size = VMXNET3_TX_RING_MAX_SIZE;
>>>> +        }
>>>>    
>>>>            vmxnet3_ring_init(d, &s->txq_descr[i].tx_ring, pa, size,
>>>>                              sizeof(struct Vmxnet3_TxDesc), false);
>>>> @@ -1483,6 +1487,9 @@ static void vmxnet3_activate_device(VMXNET3State *s)
>>>>            /* TXC ring */
>>>>            pa = VMXNET3_READ_TX_QUEUE_DESCR64(d, qdescr_pa, conf.compRingBasePA);
>>>>            size = VMXNET3_READ_TX_QUEUE_DESCR32(d, qdescr_pa, conf.compRingSize);
>>>> +        if (size > VMXNET3_TC_RING_MAX_SIZE) {
>>>> +            size = VMXNET3_TC_RING_MAX_SIZE;
>>>> +        }
>>>>            vmxnet3_ring_init(d, &s->txq_descr[i].comp_ring, pa, size,
>>>>                              sizeof(struct Vmxnet3_TxCompDesc), true);
>>>>            VMXNET3_RING_DUMP(VMW_CFPRN, "TXC", i, &s->txq_descr[i].comp_ring);
>>>> @@ -1524,6 +1531,9 @@ static void vmxnet3_activate_device(VMXNET3State *s)
>>>>                /* RX rings */
>>>>                pa = VMXNET3_READ_RX_QUEUE_DESCR64(d, qd_pa, conf.rxRingBasePA[j]);
>>>>                size = VMXNET3_READ_RX_QUEUE_DESCR32(d, qd_pa, conf.rxRingSize[j]);
>>>> +            if (size > VMXNET3_RX_RING_MAX_SIZE) {
>>>> +                size = VMXNET3_RX_RING_MAX_SIZE;
>>>> +            }
>>>>                vmxnet3_ring_init(d, &s->rxq_descr[i].rx_ring[j], pa, size,
>>>>                                  sizeof(struct Vmxnet3_RxDesc), false);
>>>>                VMW_CFPRN("RX queue %d:%d: Base: %" PRIx64 ", Size: %d",
>>>> @@ -1533,6 +1543,9 @@ static void vmxnet3_activate_device(VMXNET3State *s)
>>>>            /* RXC ring */
>>>>            pa = VMXNET3_READ_RX_QUEUE_DESCR64(d, qd_pa, conf.compRingBasePA);
>>>>            size = VMXNET3_READ_RX_QUEUE_DESCR32(d, qd_pa, conf.compRingSize);
>>>> +        if (size > VMXNET3_RC_RING_MAX_SIZE) {
>>>> +            size = VMXNET3_RC_RING_MAX_SIZE;
>>>> +        }
>>>>            vmxnet3_ring_init(d, &s->rxq_descr[i].comp_ring, pa, size,
>>>>                              sizeof(struct Vmxnet3_RxCompDesc), true);
>>>>            VMW_CFPRN("RXC queue %d: Base: %" PRIx64 ", Size: %d", i, pa, size);
>>>>
>>>>
>>> Ping!
>>>
>>> According to
>>> https://gitlab.com/qemu-project/qemu/-/issues/308#note_705736713 this is
>>> still an issue...
>>>
>>> Patch looks fine to me ... maybe just add some
>>> qemu_log_mask(LOG_GUEST_ERROR, ...) statements before correcting the values?
>>
>> * Oops! Not sure how I missed it, thought it was pulled upstream.
>>    Will send a revised patch.
>>
>>
>> Thank you.
>> ---
>>    - P J P
>>


