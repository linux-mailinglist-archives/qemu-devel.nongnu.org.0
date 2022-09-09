Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 943A95B31A5
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 10:27:16 +0200 (CEST)
Received: from localhost ([::1]:49942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWZM3-0002IK-L4
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 04:27:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oWZ0U-0004Mp-3u
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 04:04:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oWZ0O-0002Gm-Tl
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 04:04:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662710690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZhiapT8W3Dsxl8eue9JSdoDtzpl5bhQQHua5fIvPGNE=;
 b=VAdBiVVO4iKi08vgDusWWs5kz5FaKWXa3sJjmEhe2FnDEMZmZL1iWj2vifHk7OanrJnxuf
 09YzvccDpd6ZTaERgLah8KlPyEzVvb6rEuCD+1/80c3w/fROhwWFnRf+4Urn/7vO4YIuUt
 QetB85qhQSUnvT1NEQk5ugeCXNqlpw0=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-255-6u4eLScyNR6GkXPvmCfIwQ-1; Fri, 09 Sep 2022 04:04:49 -0400
X-MC-Unique: 6u4eLScyNR6GkXPvmCfIwQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 b10-20020a05622a020a00b003437e336ca7so901848qtx.16
 for <qemu-devel@nongnu.org>; Fri, 09 Sep 2022 01:04:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=ZhiapT8W3Dsxl8eue9JSdoDtzpl5bhQQHua5fIvPGNE=;
 b=fw531+bznTZ2Ga4lM8l6Dkl5Nc0mbmCX3anqIDNeYH6Cs4HHk/xukegsM69hZLneQ6
 k4Rwep3/WDBg0rme3ayU3RD3DjlvPS6tXkke/NVe5Lj7CSU+sLpu90hF6DF9Mtqlg5Gs
 HNK8m1rkGVv+2HNmVcWD/t4TjAILoRaFOd0tbbqcJhUBJBGxenO7DOd8z82POcxBTxOR
 dYCykTGFAohtlRZI8GJfx+4EK2H13aPo9xzOa7eucmatHL4nrTyLhg4dR1rgBC8d40+6
 JZIXNjc/YV73lUNDuQPVgHSAvwjL8RxugIywvXFpHG2QLxEo09EGNToIW6waWhK7wQXZ
 4bJg==
X-Gm-Message-State: ACgBeo0y2Tf8bW51h5+sr91wO/uXZelSb2rAaCBh7vCQD8BGCJp8GN2m
 Lz1t4fIfsJliyc2zCsw4PVogEkh5HnHR9Q+kDC/Kbv/jX8UeQFsNOUtDovI0EhcaaJUtvMbHAFO
 9FRx/i1LbqoUsgWE=
X-Received: by 2002:a05:620a:d51:b0:6bc:c53:5789 with SMTP id
 o17-20020a05620a0d5100b006bc0c535789mr9235742qkl.47.1662710689049; 
 Fri, 09 Sep 2022 01:04:49 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4mGyHZ+OsnDu4dZxyfIVPB9bNJtnch0V3/Q2qfbyx3gFFzpfxyr6PiBdGybLudYBTBEQ7a0w==
X-Received: by 2002:a05:620a:d51:b0:6bc:c53:5789 with SMTP id
 o17-20020a05620a0d5100b006bc0c535789mr9235733qkl.47.1662710688850; 
 Fri, 09 Sep 2022 01:04:48 -0700 (PDT)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 v5-20020a05620a0f0500b006a6ebde4799sm883135qkl.90.2022.09.09.01.04.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Sep 2022 01:04:48 -0700 (PDT)
Message-ID: <2efe546d-2bc9-68b7-3016-a4674b42729c@redhat.com>
Date: Fri, 9 Sep 2022 10:04:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH 2/2] kvm/kvm-all.c: listener should delay kvm_vm_ioctl
 to the commit phase
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org
References: <20220816101250.1715523-1-eesposit@redhat.com>
 <20220816101250.1715523-3-eesposit@redhat.com>
 <6cb75197-1d9e-babd-349a-3e56b3482620@redhat.com>
 <c1e0a91e-5c95-8c10-e578-39e41de79f6a@redhat.com>
 <e0a5f20c-32a5-b57d-0b32-3b1256243b02@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <e0a5f20c-32a5-b57d-0b32-3b1256243b02@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.142, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 26/08/2022 um 16:44 schrieb David Hildenbrand:
> On 26.08.22 16:32, Emanuele Giuseppe Esposito wrote:
>>
>>
>> Am 26/08/2022 um 16:15 schrieb David Hildenbrand:
>>> On 16.08.22 12:12, Emanuele Giuseppe Esposito wrote:
>>>> Instead of sending a single ioctl every time ->region_* or ->log_*
>>>> callbacks are called, "queue" all memory regions in a list that will
>>>> be emptied only when committing.
>>>>
>>>
>>> Out of interest, how many such regions does the ioctl support? As many
>>> as KVM theoretically supports? (32k IIRC)
>>>
>>
>> I assume you mean for the new ioctl, but yes that's a good question.
>>
>> The problem here is that we could have more than a single update per
>> memory region. So we are not limited anymore to the number of regions,
>> but the number of operations * number of region.
>>
>> I was thinking, maybe when pre-processing QEMU could divide a single
>> transaction into multiple atomic operations (ie operations on the same
>> memory region)? That way avoid sending a single ioctl with 32k *
>> #operation elements. Is that what you mean?
> 
> Oh, so we're effectively collecting slot updates and not the complete
> "slot" view, got it. Was the kernel series already sent so I can have a
> look?

I am going to send it today. I got something working, but it's a little
bit messy on the invalid slots part.

> 
> Note that there are some possible slot updates (like a split, or a
> merge) that involve multiple slots and that would have to be part of the
> same "transaction" to be atomic.
> 
> 

Limiting the size of operations in the IOCTL can be something for the
future. Currently it's already pretty complicated as it is (in the KVM
side), plus I don't see ioctls with more than 8 requests.

Thank you,
Emanuele


