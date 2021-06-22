Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8383AFEC1
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 10:07:56 +0200 (CEST)
Received: from localhost ([::1]:39008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvbRr-00053y-71
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 04:07:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lvbQx-0003lX-W1
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 04:07:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lvbQV-0001Y4-En
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 04:06:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624349188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Yl/tr0Oc1gVf3AyJaUiecSSGBvDgPag8e+2mSu1GEw=;
 b=V6Vd+0H2K9zJrDG+T2smcUEaOr7NOVXJevWlXCZtzzeWB4B1nJeK5fnHpt0Vlxc+Rq8Jfz
 oSSpM9l3aJDaelaJBF1lrgE7EblUXEux+HZ16JlzSqPajEhXrcyhZFHPLN4jdpZUmZZBcz
 XXA5jpj7BGYuvtf24F5Zt/3k29XhmpA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-LiGS78-HM-m8KHX3x9x-yw-1; Tue, 22 Jun 2021 04:06:25 -0400
X-MC-Unique: LiGS78-HM-m8KHX3x9x-yw-1
Received: by mail-wm1-f70.google.com with SMTP id
 j38-20020a05600c1c26b02901dbf7d18ff8so420568wms.8
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 01:06:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4Yl/tr0Oc1gVf3AyJaUiecSSGBvDgPag8e+2mSu1GEw=;
 b=sFKoYeNYHntIT00MlJRvuD38GlRjR+tz2KGLGrzTzbRSMDIWiRhak10oQG/z1PiwB+
 AFuV/Lo8Oi8qjNglEBUUNBJoCNNzbnJiJd2pkLU0SHrXotONe1RxHcLhDPs14SQ3rmOK
 wLzowMTJqHn+edCSkSYKoQSNxWnlEMC8tHT3iErJhgCUZf9bo6Mu5sw3cNVvHq7Js54i
 podMyzEFAUGHpeXM1ZgTtz+rJmRdHvpSbYwPzO/i7VDV85rrAvCDfREDyk7vRKvQweV7
 c+4mn+g0+FlbuyZeO2boUxoD3WGy+U7jcnKjpfa2pD0mrs9Dmv784JvcrV6SPFTjt2aU
 7p/g==
X-Gm-Message-State: AOAM533GRIf/8zRbIOUkCiIaVen9E7EWtdO3yorgXC31dI9xhXh0PuoJ
 inLwBUk3UwpLfHsvT/ACv6QSgbA2s0bUSEI7+BSsxJBqj0427qUf6vcIM//s/eb0U9Uh5KPki2v
 AJ8kiX5rdl3aGWdg=
X-Received: by 2002:a05:600c:1c27:: with SMTP id
 j39mr2871352wms.139.1624349184120; 
 Tue, 22 Jun 2021 01:06:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSKWYM2WOibF2Hekx3saiq/5GR4uvAjjJN0sUFT1UYW83pX9VIYRzxWp5OK8RqXkqB8/WOZw==
X-Received: by 2002:a05:600c:1c27:: with SMTP id
 j39mr2871315wms.139.1624349183764; 
 Tue, 22 Jun 2021 01:06:23 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id v22sm1432114wmh.40.2021.06.22.01.06.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 01:06:23 -0700 (PDT)
Subject: Re: [PATCH v2] block/nvme: Fix VFIO_MAP_DMA failed: No space left on
 device
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Fam Zheng <fam@euphon.net>
References: <20210621093240.4170701-1-philmd@redhat.com>
 <9A674DF3-041E-4E7C-BB49-481AA77B1F7B@euphon.net>
 <6b77db0c-8625-992e-8546-15b9a24ae928@redhat.com>
 <0EF3A65E-39CB-4114-8572-001C2DF05863@euphon.net>
 <a7cd0827-5ce3-0aaf-c222-f13f84cd4f2c@redhat.com>
Message-ID: <30f81ba5-cd6a-faee-328d-8ccb8ef76202@redhat.com>
Date: Tue, 22 Jun 2021 10:06:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <a7cd0827-5ce3-0aaf-c222-f13f84cd4f2c@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>,
 qemu-stable@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/22/21 9:29 AM, Philippe Mathieu-Daudé wrote:
> On 6/21/21 5:36 PM, Fam Zheng wrote:
>>> On 21 Jun 2021, at 16:13, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>> On 6/21/21 3:18 PM, Fam Zheng wrote:
>>>>> On 21 Jun 2021, at 10:32, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>>>>
>>>>> When the NVMe block driver was introduced (see commit bdd6a90a9e5,
>>>>> January 2018), Linux VFIO_IOMMU_MAP_DMA ioctl was only returning
>>>>> -ENOMEM in case of error. The driver was correctly handling the
>>>>> error path to recycle its volatile IOVA mappings.
>>>>>
>>>>> To fix CVE-2019-3882, Linux commit 492855939bdb ("vfio/type1: Limit
>>>>> DMA mappings per container", April 2019) added the -ENOSPC error to
>>>>> signal the user exhausted the DMA mappings available for a container.
>>>>>
>>>>> The block driver started to mis-behave:
>>>>>
>>>>> qemu-system-x86_64: VFIO_MAP_DMA failed: No space left on device
>>>>> (qemu)
>>>>> (qemu) info status
>>>>> VM status: paused (io-error)
>>>>> (qemu) c
>>>>> VFIO_MAP_DMA failed: No space left on device
>>>>> qemu-system-x86_64: block/block-backend.c:1968: blk_get_aio_context: Assertion `ctx == blk->ctx' failed.
>>>>
>>>> Hi Phil,
>>>>
>>>>
>>>> The diff looks good to me, but I’m not sure what exactly caused the assertion failure. There is `if (r) { goto fail; }` that handles -ENOSPC before, so it should be treated as a general case. What am I missing?
>>>
>>> Good catch, ENOSPC ends setting BLOCK_DEVICE_IO_STATUS_NOSPACE
>>> -> BLOCK_ERROR_ACTION_STOP, so the VM is paused with DMA mapping
>>> exhausted. I don't understand the full "VM resume" path, but this
>>> is not what we want (IO_NOSPACE is to warn the operator to add
>>> more storage and resume, which is pointless in our case, resuming
>>> won't help until we flush the mappings).
>>>
>>> IIUC what we want is return ENOMEM to set BLOCK_DEVICE_IO_STATUS_FAILED.
>>
>> I agree with that. It just makes me feel there’s another bug in the resuming code path. Can you get a backtrace?
> 
> It seems the resuming code path bug has been fixed elsewhere:
> 
> (qemu) info status
> info status
> VM status: paused (io-error)
> (qemu) c
> c
> 2021-06-22T07:27:00.745466Z qemu-system-x86_64: VFIO_MAP_DMA failed: No
> space left on device
> (qemu) info status
> info status
> VM status: paused (io-error)
> (qemu) c
> c
> 2021-06-22T07:27:12.458137Z qemu-system-x86_64: VFIO_MAP_DMA failed: No
> space left on device
> (qemu) c
> c
> 2021-06-22T07:27:13.439167Z qemu-system-x86_64: VFIO_MAP_DMA failed: No
> space left on device
> (qemu) c
> c
> 2021-06-22T07:27:14.272071Z qemu-system-x86_64: VFIO_MAP_DMA failed: No
> space left on device
> (qemu)
> 

I tested all releases up to v4.1.0 and could not trigger the
blk_get_aio_context() assertion. Building using --enable-debug.
IIRC Gentoo is more aggressive, so I'll restart using -O2.


