Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE64069F8B9
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 17:12:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUria-0006Af-S4; Wed, 22 Feb 2023 11:11:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUriX-00069m-Jw
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 11:11:43 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUriV-0006eo-Rt
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 11:11:41 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so3834464wmq.2
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 08:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E/XA2y/70mfsuEWrV6iHpFct0yC4BbmOCAUV1cf92Ug=;
 b=YGShkIRKsqFjkcWm4+l03lhWXkJucdZxbj63eS0GB0kY5SY29eB4riEthtkct8Vf1K
 Ix7WpjtaO3af8ftH1pItJPOE5GmHeWF1nKr3eOiMDbCjc7diX4WW21lRw6cBiwNmNdpW
 66rWZ0RVdUVK3lIVUvOSratP0QYX2pmNf+wYzwZhr2hK2GJPlD/OBRUlRDPyEu+h473K
 utOR3QT/GQPWnxLiO/jMwGHdbHmqGJwVfI55vL18iywG+vlQ6cdZJKBN8FMBu74MEI8K
 iKVC0F+aw+kPLHVY4gzOPKrVWqfdiqxQVy8ZxxXF6REqe4B7pbtX7qFFRI7sxo0W3J1r
 iUtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E/XA2y/70mfsuEWrV6iHpFct0yC4BbmOCAUV1cf92Ug=;
 b=IUGnjYg8Pg0c8MlH/4Gyuz7AT7oljgHTluymZrPLfrWXIYzgy141MYNiRT+XvdK+p0
 Ioom91ciOP9XSQoBOYpr/PEt+NuAGv2cvlN+kdSMoA/SoxI0dLHnSlkaT1KfuHe28YmG
 +M7xA07qOOdQBz9wef8oJ1HqGIYwKXp07BrbfROjuIXE96YkTlExZ8Kh1OOLj6guaYj3
 vu+XHATbvriitEsJ1J9wrZT6V7EMS1w/nTzEANigJ7Aj6J50TU8ukliFP8ZF6+mYtUFi
 rex1yWSu6oHrW5bA1mwRQ3qgBZ43qXf+gEVrD4OAVSCLhkDtnohhCOdg8m8TzoczsSNq
 PuCA==
X-Gm-Message-State: AO0yUKVQ2R9yPeRd1TJ3Y63ZmmHHbN6qrMXG/67dSQWtJsR0GEfcw8Lf
 b0HXRSTuEVpp33b9md7pVg27Ug==
X-Google-Smtp-Source: AK7set/7R2veLrfjj7b1i3WeTVWZAVBV/aHstGZblokJkYwpHZWhT/UfKPf2MDSF38MQyrBPhukOuw==
X-Received: by 2002:a05:600c:54ee:b0:3dc:4356:533c with SMTP id
 jb14-20020a05600c54ee00b003dc4356533cmr6092270wmb.5.1677082298194; 
 Wed, 22 Feb 2023 08:11:38 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a1c4c10000000b003e2096da239sm7992324wmf.7.2023.02.22.08.11.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 08:11:37 -0800 (PST)
Message-ID: <3544bf56-4d5c-174d-5bfd-a67c9689ca37@linaro.org>
Date: Wed, 22 Feb 2023 17:11:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 5/5] hw: Remove mentions of NDEBUG
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>
References: <20230221232520.14480-1-philmd@linaro.org>
 <20230221232520.14480-6-philmd@linaro.org>
 <20230222070529-mutt-send-email-mst@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230222070529-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.102,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 22/2/23 13:05, Michael S. Tsirkin wrote:
> On Wed, Feb 22, 2023 at 12:25:20AM +0100, Philippe Mathieu-Daudé wrote:
>> Since commit 262a69f428 ("osdep.h: Prohibit disabling
>> assert() in supported builds") 'NDEBUG' can not be defined.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> this exactly says NDEBUG is not allowed. why are you removing this?

The project can not be built with NDEBUG. There is no point in
mentioning it in each individual function.

>> ---
>>   hw/scsi/mptsas.c   | 2 --
>>   hw/virtio/virtio.c | 2 --
>>   2 files changed, 4 deletions(-)
>>
>> diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
>> index c485da792c..5b373d3ed6 100644
>> --- a/hw/scsi/mptsas.c
>> +++ b/hw/scsi/mptsas.c
>> @@ -1240,8 +1240,6 @@ static void *mptsas_load_request(QEMUFile *f, SCSIRequest *sreq)
>>       n = qemu_get_be32(f);
>>       /* TODO: add a way for SCSIBusInfo's load_request to fail,
>>        * and fail migration instead of asserting here.
>> -     * This is just one thing (there are probably more) that must be
>> -     * fixed before we can allow NDEBUG compilation.
>>        */
>>       assert(n >= 0);
>>
>> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
>> index f35178f5fc..c6b3e3fb08 100644
>> --- a/hw/virtio/virtio.c
>> +++ b/hw/virtio/virtio.c
>> @@ -1898,8 +1898,6 @@ void *qemu_get_virtqueue_element(VirtIODevice *vdev, QEMUFile *f, size_t sz)
>>   
>>       /* TODO: teach all callers that this can fail, and return failure instead
>>        * of asserting here.
>> -     * This is just one thing (there are probably more) that must be
>> -     * fixed before we can allow NDEBUG compilation.
>>        */
>>       assert(ARRAY_SIZE(data.in_addr) >= data.in_num);
>>       assert(ARRAY_SIZE(data.out_addr) >= data.out_num);
>> -- 
>> 2.38.1
> 


