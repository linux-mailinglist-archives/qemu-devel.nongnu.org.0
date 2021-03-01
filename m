Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C99432804A
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 15:09:12 +0100 (CET)
Received: from localhost ([::1]:50968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGjEV-00082x-DU
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 09:09:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lGj4P-0008Ll-Vo
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 08:58:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lGj4L-00031Z-6R
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 08:58:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614607120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aWYGwvDZ5IWl37T+DiXuZMJjmfXJeJyVBceCibgJAcQ=;
 b=gBcOCfIcbwbupvEv0CKUn36qwJlztfdHXLVKqxdozCbmFKYPHSM1+kqF0uL3KBA1Vs50ta
 i4HCtubQWM6MBuLt+D+Xe+2Z1XzNKq7HSaD7zw2z6/s6sVnvSkw2qE3H10OG9YA8sFczed
 U3r3xRCIzZf0ykC9gGoyOGHJUUnHYk8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-vxD4aBCXOfink8wKqfq4Uw-1; Mon, 01 Mar 2021 08:58:36 -0500
X-MC-Unique: vxD4aBCXOfink8wKqfq4Uw-1
Received: by mail-wm1-f71.google.com with SMTP id z26so1459469wml.4
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 05:58:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aWYGwvDZ5IWl37T+DiXuZMJjmfXJeJyVBceCibgJAcQ=;
 b=Z6hEECD7Oh3Pysa87NnqoqeE06JnXZ2sFutexcoeE7wiGsz69id1LwPjxVhO/saVtI
 FyDpNGjusSnBkWK/oLOUPiDmN1d0+xULMuYPX5pAXZgGIlDhbET7C2wDt1IEGXqbZFdZ
 25ug5MdAGcyevz/E4KX/6xr3CdwCow9HP+lsEWDnUuydm0mapNRd304sU2N0ZopD+TBx
 lmm8I//0uWsdUcYKqUx2dPaRMjHWOqhCT0OGH2Znrn/iunpVBXHgyFV/2ywHHkX7SK0+
 ZRTsa4aRaChq5c0Tjo2E+tucwgBqbrO0mourcXzu6itWeH3sorQVI4huNCHgUsu4Qs1f
 FT2w==
X-Gm-Message-State: AOAM532LF6JhY9ZqBPiJEVxxKWL/Xh6HspwbniqpwTXWynC0WStmeqP1
 P90lEzjTyGHtgofFSkzV6kdvwwwGPusC7Nxd+6tPi2RaanBhUtfwE9Bv3gbTSsFJkOUc55kvMU3
 Y3YCVT1od9/bV4YA=
X-Received: by 2002:adf:df10:: with SMTP id y16mr13438573wrl.372.1614607115609; 
 Mon, 01 Mar 2021 05:58:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwXGVKy+o5gev7essT2n0xiKDf8b4GKkSNCjLxNhCanVnGU/hviiwKmAHFECnSunyg1yFl1QA==
X-Received: by 2002:adf:df10:: with SMTP id y16mr13438560wrl.372.1614607115481; 
 Mon, 01 Mar 2021 05:58:35 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id l2sm25847254wrv.50.2021.03.01.05.58.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 05:58:35 -0800 (PST)
Subject: Re: [RFC PATCH 3/3] hw/block/pflash: use
 memory_region_init_rom_device_from_file()
To: David Edmondson <dme@dme.org>, qemu-devel@nongnu.org
References: <20210225230238.3719051-1-philmd@redhat.com>
 <20210225230238.3719051-4-philmd@redhat.com> <m2im6fb5k9.fsf@dme.org>
 <be6e184a-21e9-81f7-4f2e-363213a389b4@redhat.com> <m2a6rnat9a.fsf@dme.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c0d46509-09ce-47bb-5713-6f742bea4069@redhat.com>
Date: Mon, 1 Mar 2021 14:58:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <m2a6rnat9a.fsf@dme.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Xu Yandong <xuyandong2@huawei.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Zheng Xiang <zhengxiang9@huawei.com>,
 haibinzhang <haibinzhang@tencent.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/1/21 2:38 PM, David Edmondson wrote:
> On Monday, 2021-03-01 at 12:50:33 +01, Philippe Mathieu-Daudé wrote:
> 
>> On 2/26/21 9:23 AM, David Edmondson wrote:
>>> On Friday, 2021-02-26 at 00:02:38 +01, Philippe Mathieu-Daudé wrote:
>>>
>>>> If the block drive is read-only we will model a "protected" flash
>>>> device. We can thus use memory_region_init_rom_device_from_file()
>>>> which mmap the backing file when creating the MemoryRegion.
>>>> If the same backing file is used by multiple QEMU instances, this
>>>> reduces the memory footprint (this is often the case with the
>>>> CODE flash image from OVMF and AAVMF).
>>>>
>>>> Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>> ---
>>>>  hw/block/pflash_cfi01.c | 20 ++++++++++++++------
>>>>  hw/block/pflash_cfi02.c | 18 ++++++++++++++----
>>>>  2 files changed, 28 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
>>>> index a5fa8d8b74a..5757391df1c 100644
>>>> --- a/hw/block/pflash_cfi01.c
>>>> +++ b/hw/block/pflash_cfi01.c
>>>> @@ -743,11 +743,19 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
>>>>          pfl->ro = 0;
>>>>      }
>>>>  
>>>> -    memory_region_init_rom_device(
>>>> -        &pfl->mem, OBJECT(dev),
>>>> -        &pflash_cfi01_ops,
>>>> -        pfl,
>>>> -        pfl->name, total_len, errp);
>>>> +    if (pfl->blk && pfl->ro) {
>>>> +        memory_region_init_rom_device_from_file(&pfl->mem, OBJECT(dev),
>>>> +                                                &pflash_cfi01_ops, pfl,
>>>> +                                                pfl->name, total_len,
>>>> +                                                qemu_real_host_page_size,
>>>> +                                                RAM_SHARED,
>>>> +                                                blk_bs(pfl->blk)->filename,
>>>
>>> How will this behave if someone does:
>>>
>>>     -drive file=OVMF_CODE.fd.qcow2,index=0,if=pflash,format=qcow2,readonly=on
>>>
>>> Honestly, I'm not sure why they would, but it works today.
>>
>> OK I can add a check for "raw" driver, but I don't know to check for
>> offset == 0.
> 
> This is pretty much where I got to when I tried using mmap() and gave up
> (mostly because I figured that adding layer violating checks to the
> pflash driver would not be well received, but also because we don't
> share the same underlying file between multiple VMs and I wasn't sure
> that it would eventually work well for writable devices).

Kevin suggested on IRC (#qemu-block, you are welcome to join) to
introduce a new blk_*() interface to mmap an image (or possibly
part of it), and have it work with non-zero raw offsets.


