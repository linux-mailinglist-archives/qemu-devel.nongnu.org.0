Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C033AEC2A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 17:17:48 +0200 (CEST)
Received: from localhost ([::1]:55378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvLgI-0002Xk-Vp
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 11:17:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lvLcI-0007H2-5K
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 11:13:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lvLcF-0004HB-M3
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 11:13:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624288415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PSv6I1S84xm9rmcowb3klUt+kkFEmY/jzfRHI3uQWaw=;
 b=fKSqQzHU+fD6aBxxke4e1TWKdTn6h2D2SttTkBkvlGXZ1FjkPnSd6qPviduUGotxdl4/6p
 YRFtr73NvN9LDf22A5M80K9wMDq3QyOxjCtxvfOE7zvCEcUz8XZ5VuXywPqK9Bg9wYlGwu
 FH2eYUTFhYSXSGKtayeuOonTe97K8Ww=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-x7GoLxc3OHKmKgBKX370Pw-1; Mon, 21 Jun 2021 11:13:30 -0400
X-MC-Unique: x7GoLxc3OHKmKgBKX370Pw-1
Received: by mail-wr1-f70.google.com with SMTP id
 d9-20020adffbc90000b029011a3b249b10so8491334wrs.3
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 08:13:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PSv6I1S84xm9rmcowb3klUt+kkFEmY/jzfRHI3uQWaw=;
 b=gI4p9p5iML4YMDGgflBCESlKomFnswEf7Q4DPzGF1tZckNU8H3M6AJ56OBPzzWRIEZ
 alLWPLjOWScHj4EkmLPECVn5YetU9zlyhTzFcDaVLNs9L3gte5LhVQfG3iYRPjauNPYR
 gl5CdFMr+Zuy/jDQp7GtUfUUSidt4RtMQsolVK9pOa6ARVm0I9/P8zqeYJT2ucKj7QWT
 NaGPSthMzMqqSls/6pOUzsAvw/g18xitc72Q0CezBzCvtUqf+hiWdSBaJ1092KV0rrUX
 4c4pffShqwCqErD5q3NPe6uLEvPKGMiDYdFspKK14L/QYrR+RbjpTnbGm+oT2VUEy4Nj
 kbBw==
X-Gm-Message-State: AOAM5329q4rZTVxddX4LnjvPtfZwZrczglHWkYuT+MEEyyL43uamVB/f
 4p/2+SN4bmRVN8ZuB0TdgTHhN7I+/IDzzvrX4rjxAxZ8b+DfPacbeHVFLqrOfL2HqDivI7OMLAX
 WVNoIiD7qB3NLpQw=
X-Received: by 2002:a05:600c:2282:: with SMTP id
 2mr6154205wmf.115.1624288409509; 
 Mon, 21 Jun 2021 08:13:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUyjRG98du/q2y8OxjwwT4rNkSE49JA8QdqTe+rCG9DE694e7j5uS6ADaTE19QS2D835PMoA==
X-Received: by 2002:a05:600c:2282:: with SMTP id
 2mr6154178wmf.115.1624288409359; 
 Mon, 21 Jun 2021 08:13:29 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id c7sm18053042wrs.23.2021.06.21.08.13.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 08:13:28 -0700 (PDT)
Subject: Re: [PATCH v2] block/nvme: Fix VFIO_MAP_DMA failed: No space left on
 device
To: Fam Zheng <fam@euphon.net>
References: <20210621093240.4170701-1-philmd@redhat.com>
 <9A674DF3-041E-4E7C-BB49-481AA77B1F7B@euphon.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6b77db0c-8625-992e-8546-15b9a24ae928@redhat.com>
Date: Mon, 21 Jun 2021 17:13:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <9A674DF3-041E-4E7C-BB49-481AA77B1F7B@euphon.net>
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>,
 qemu-stable@nongnu.org, qemu-devel@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/21/21 3:18 PM, Fam Zheng wrote:
> 
> 
>> On 21 Jun 2021, at 10:32, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> When the NVMe block driver was introduced (see commit bdd6a90a9e5,
>> January 2018), Linux VFIO_IOMMU_MAP_DMA ioctl was only returning
>> -ENOMEM in case of error. The driver was correctly handling the
>> error path to recycle its volatile IOVA mappings.
>>
>> To fix CVE-2019-3882, Linux commit 492855939bdb ("vfio/type1: Limit
>> DMA mappings per container", April 2019) added the -ENOSPC error to
>> signal the user exhausted the DMA mappings available for a container.
>>
>> The block driver started to mis-behave:
>>
>>  qemu-system-x86_64: VFIO_MAP_DMA failed: No space left on device
>>  (qemu)
>>  (qemu) info status
>>  VM status: paused (io-error)
>>  (qemu) c
>>  VFIO_MAP_DMA failed: No space left on device
>>  qemu-system-x86_64: block/block-backend.c:1968: blk_get_aio_context: Assertion `ctx == blk->ctx' failed.
> 
> Hi Phil,
>  
> 
> The diff looks good to me, but I’m not sure what exactly caused the assertion failure. There is `if (r) { goto fail; }` that handles -ENOSPC before, so it should be treated as a general case. What am I missing?

Good catch, ENOSPC ends setting BLOCK_DEVICE_IO_STATUS_NOSPACE
-> BLOCK_ERROR_ACTION_STOP, so the VM is paused with DMA mapping
exhausted. I don't understand the full "VM resume" path, but this
is not what we want (IO_NOSPACE is to warn the operator to add
more storage and resume, which is pointless in our case, resuming
won't help until we flush the mappings).

IIUC what we want is return ENOMEM to set BLOCK_DEVICE_IO_STATUS_FAILED.


