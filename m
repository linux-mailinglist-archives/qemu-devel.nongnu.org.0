Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 358A239287D
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 09:26:00 +0200 (CEST)
Received: from localhost ([::1]:41758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmAP1-0000Fh-9a
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 03:25:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lmANA-0007Ek-HA
 for qemu-devel@nongnu.org; Thu, 27 May 2021 03:24:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lmAN5-0003tG-HN
 for qemu-devel@nongnu.org; Thu, 27 May 2021 03:24:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622100237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1KsYUoihwn06MVpZw8PoJp8Xh8L46ngOZaD9+2VXIEQ=;
 b=dYDLqJewZ/cqrjbxHNGaVwSgu8OAK2JiUks+e+B7rv+Z3JpA6PTOL4GDLs2Ot+/GyGwj5d
 R4LtPoNi5KFgw+xm0YaiXZ/AFzQMG0OrqRzwRGqAKvEzdS3r1toNSO95tNx4g7v0dd35Hp
 BK1B30JLKCVYh0zbV4T4/VgK+NTn8J0=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-rw0dM9YwMTG51rf557GfyQ-1; Thu, 27 May 2021 03:23:56 -0400
X-MC-Unique: rw0dM9YwMTG51rf557GfyQ-1
Received: by mail-pg1-f199.google.com with SMTP id
 s21-20020a6569150000b0290216803bf41cso2452222pgq.0
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 00:23:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=1KsYUoihwn06MVpZw8PoJp8Xh8L46ngOZaD9+2VXIEQ=;
 b=FhyA+IK2XdHTTdW3Q/4zRBqxOhN6iVfn853U/NNdQNB2yfIeb64xyEeHAN+MV509JF
 dS5lbpJeGjH759o70h+3VkgtJlnTQC4BYfGPEUKp8+So9d7khN31neudmqt1I5B82bJS
 5JC6BLkqEqXt19pZtpRnoH0D/6GMZs3sGgz9Xkztt3u8BDvksfoAUHf9ggJZcDJWqRX6
 AHoq6hZ9hXsygcswkCOjwB9PnF0cNHJz/2MRkKyFhcUZP2IexgZ9KL+goS5Te2HA8NGN
 U3x8zP2NvCycqNNECYk51YQQWUSKwotDnwrl9FdDtPqmt/rn8ebe7xw3rRN761XRizxU
 02Sg==
X-Gm-Message-State: AOAM532xwBX4hoFUaKQlxzubRfhjLaXoe8KaUnlI4wuBywKgEcip4Bu+
 EB5gI5WDMuOJyLpgdSmh476pUsQbn6qrKYARCiKF/2yxXEUf5HFoFbCZSDcsSyyvVgtD0co4j6E
 SZDj0MkTd25ih3MWAuGkxyalvs6WDLGR5y2abjrMotGYRhSShD8NSY2ZwFZ1YryRRCvk=
X-Received: by 2002:a17:902:6ac2:b029:fc:86b1:579b with SMTP id
 i2-20020a1709026ac2b02900fc86b1579bmr2015200plt.37.1622100229723; 
 Thu, 27 May 2021 00:23:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsqnsNepr7Q+83WlGlErNnbKpAW4thVbzYpx8RVQ/yuBTWCjYFBScQj536nasqpAGn8gljTg==
X-Received: by 2002:a17:902:6ac2:b029:fc:86b1:579b with SMTP id
 i2-20020a1709026ac2b02900fc86b1579bmr2015175plt.37.1622100229321; 
 Thu, 27 May 2021 00:23:49 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id 194sm1176550pfy.146.2021.05.27.00.23.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 May 2021 00:23:48 -0700 (PDT)
Subject: Re: [PULL V2 0/3] Net patches
To: Bin Meng <bmeng.cn@gmail.com>
References: <1622089478-5426-1-git-send-email-jasowang@redhat.com>
 <CAEUhbmW2dHstLd6gE43gdyBr+xpoGXjZSuh+6fwKwtSrQjmuWg@mail.gmail.com>
 <43e3dd04-edac-f0a5-0b99-9a8c8b9d1a5f@redhat.com>
 <CAEUhbmUJG9vckLWE_r=SCRpW5z1T_NZJkRy4fhUrMHAP_zbW4Q@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <08fe1ac7-8db6-bc08-7550-b1d40eaf9039@redhat.com>
Date: Thu, 27 May 2021 15:23:29 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <CAEUhbmUJG9vckLWE_r=SCRpW5z1T_NZJkRy4fhUrMHAP_zbW4Q@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/5/27 下午3:14, Bin Meng 写道:
> On Thu, May 27, 2021 at 2:35 PM Jason Wang <jasowang@redhat.com> wrote:
>>
>> 在 2021/5/27 下午2:13, Bin Meng 写道:
>>> Hi Jason,
>>>
>>> On Thu, May 27, 2021 at 12:24 PM Jason Wang <jasowang@redhat.com> wrote:
>>>> The following changes since commit d90f154867ec0ec22fd719164b88716e8fd48672:
>>>>
>>>>     Merge remote-tracking branch 'remotes/dg-gitlab/tags/ppc-for-6.1-20210504' into staging (2021-05-05 20:29:14 +0100)
>>>>
>>>> are available in the git repository at:
>>>>
>>>>     https://github.com/jasowang/qemu.git tags/net-pull-request
>>>>
>>>> for you to fetch changes up to 4f8a39494aded9f2026a26b137378ea2ee3d5338:
>>>>
>>>>     tap-bsd: Remove special casing for older OpenBSD releases (2021-05-27 11:03:55 +0800)
>>>>
>>>> ----------------------------------------------------------------
>>>>
>>>> ----------------------------------------------------------------
>>>> Brad Smith (1):
>>>>         tap-bsd: Remove special casing for older OpenBSD releases
>>>>
>>>> Guenter Roeck (1):
>>>>         hw/net/imx_fec: return 0xffff when accessing non-existing PHY
>>>>
>>>> Laurent Vivier (1):
>>>>         virtio-net: failover: add missing remove_migration_state_change_notifier()
>>>>
>>>>    hw/net/imx_fec.c    | 8 +++-----
>>>>    hw/net/trace-events | 2 ++
>>>>    hw/net/virtio-net.c | 1 +
>>>>    net/tap-bsd.c       | 8 --------
>>>>    4 files changed, 6 insertions(+), 13 deletions(-)
>>> What happened to patch 5-12 in the following series?
>>> http://patchwork.ozlabs.org/project/qemu-devel/cover/20210317062638.72626-1-bmeng.cn@gmail.com/
>>
>> I want to do some test before the merging. Or if possible, could you
>> please write a test for this function?
>>
> For each of these network adapter models?


e1000 and virtio-net should be sufficient.


>   What kind of tests are
> needed?


Test whether padding works.


>   Any pointers?


You can start to look at virtio-net-test.c.

Thanks


>
> Regards,
> Bin
>


