Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 388FA3712EE
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 11:23:29 +0200 (CEST)
Received: from localhost ([::1]:36088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldUnY-0007SZ-9c
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 05:23:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ldUiJ-0001ji-2a
 for qemu-devel@nongnu.org; Mon, 03 May 2021 05:18:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ldUiF-0007kk-Ai
 for qemu-devel@nongnu.org; Mon, 03 May 2021 05:18:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620033478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uu/NQS4vezdnx3VZg60xxqPNxYE+UoHCOxam2cBLAPo=;
 b=AT04e5qQ0cd9mziPYmaXFIm8v7vN9kFRmk7NDV00EFHHrhCeLIWQL58LVt8mm57iqJUG/l
 P+7IYL9kfQH6bKVvTsDFez9DehvR1UrU9TnugiAjJKoOGPPRp2fjE29pBtNLF0XATgt3ox
 YvIydkizfK9T1S+gJA975sBfq0U/Tu4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-hTcfu-i4Nv-Sz2u9ufC6sQ-1; Mon, 03 May 2021 05:17:57 -0400
X-MC-Unique: hTcfu-i4Nv-Sz2u9ufC6sQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 67-20020adf81490000b029010756d109e6so3532799wrm.13
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 02:17:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=uu/NQS4vezdnx3VZg60xxqPNxYE+UoHCOxam2cBLAPo=;
 b=or36YPSYcMBOLGsMghBPDnWXKl0MGBZDamOi6VSheHFnARbcbBL+5VhwLgCoDVQD/v
 kR/3dx0wuLb3fLgCIb0gUrByzgcSHyCY7DVUWf+qgi7imAj77Q48pEERl49gsh5W6rGf
 CMQaxLVU8Py3dd6dVQDmOWFEw/d1FFK5I6SlNzMkF/5atvhVJiVuDtE5lqNWPqa570y3
 yZVdCXABu4Yi2CI6Qslty+VCBGEMQtNpGXP+e0GGHq4sN4WGPT7pnr+AKNQLvGrBpOdv
 BqNPHARYWLOHhuwXtXXZKNSDOL6EcPbJ3cFAgPGved8vlVn2cZJpT0u0+gXArZx4l6RR
 CRQQ==
X-Gm-Message-State: AOAM533aK/GzdEXVa7ZFBEaxKiq4ihmytoXahkGcH0QmaAZmCe42EKR2
 nfBLQzwhspmlEZJeOieSKt4RNZO9Q5gwrZJ7mpoLdYBnRIg3u6ZbDVjJFzAVZ83MIW6f4NOfuHu
 nunKQAxy5O4ZYYcsp5RgBBtBJV6hFH9oc+0X30LyZsQfkSsbM+3yamRrnziMGIOM=
X-Received: by 2002:a05:600c:3544:: with SMTP id
 i4mr20139588wmq.38.1620033475931; 
 Mon, 03 May 2021 02:17:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUWeU7SoOx52VdMYGWBWB2310ipC3C8ByYku4oAVBny6cX5lcabLqDq/+1VGoEh6ATu0HnyQ==
X-Received: by 2002:a05:600c:3544:: with SMTP id
 i4mr20139559wmq.38.1620033475505; 
 Mon, 03 May 2021 02:17:55 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c649f.dip0.t-ipconnect.de. [91.12.100.159])
 by smtp.gmail.com with ESMTPSA id l18sm11652841wrx.96.2021.05.03.02.17.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 02:17:55 -0700 (PDT)
Subject: Re: [PATCH 4/4] pc-bios/s390-ccw: Allow building with Clang, too
To: Cornelia Huck <cohuck@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20210502174836.838816-1-thuth@redhat.com>
 <20210502174836.838816-5-thuth@redhat.com>
 <87r1iofm61.fsf@dusky.pond.sub.org>
 <15271277-98c2-3925-5937-b9f04ad376b3@redhat.com>
 <3808e5d4-b755-bce5-a25f-2d46ed6a59e7@redhat.com>
 <87mttcdy4n.fsf@dusky.pond.sub.org>
 <20210503111457.6f8e3597.cohuck@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <18b0bccc-145b-c324-9054-3d64af330a99@redhat.com>
Date: Mon, 3 May 2021 11:17:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210503111457.6f8e3597.cohuck@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03.05.21 11:14, Cornelia Huck wrote:
> On Mon, 03 May 2021 10:23:20 +0200
> Markus Armbruster <armbru@redhat.com> wrote:
> 
>> David Hildenbrand <david@redhat.com> writes:
>>
>>> On 03.05.21 07:17, Thomas Huth wrote:
>>>> On 03/05/2021 06.58, Markus Armbruster wrote:
>>>>> Thomas Huth <thuth@redhat.com> writes:
>>>>>   
>>>>>> Clang unfortunately does not support generating code for the z900
>>>>>> architecture level and starts with the z10 instead. Thus to be able
>>>>>> to support compiling with Clang, we have to check for the supported
>>>>>> compiler flags. The disadvantage is of course that the bios image
>>>>>> will only run with z10 guest CPUs upwards (which is what most people
>>>>>> use anyway), so just in case let's also emit a warning in that case.
>>>>>
>>>>> What happens when you try to use this bios with an old CPU anyway?
>>>>
>>>> Interesting question. I was expecting the guest to crash since it would be
>>>> using a CPU instruction that is not supported on the old CPU model. But I
>>>> just gave it a try, and there was no crash. The guest booted just fine.
>>>> Either Clang only emits instructions that work with the old z900 anyway, or
>>>> our emulation in QEMU is imprecise and we allow newer instructions to be
>>>> executed on old models, too.
>>>
>>> Yes, that's currently still done. We once thought about disabling that
>>> (there was a patch from Richard), but decided against it because -- back
>>> then -- the default QEMU model was still very basic and would have
>>> essentially disabled all more recent instructions as default.
>>>
>>> We can most probably do that change soon as we have a "fairly new"
>>> default QEMU CPU model. I can glue it to my z14 change.
>>
>> In case this makes the BIOS crash with old CPUs: when a guest refuses to
>> start because the BIOS was compiled the wrong way for it, configure
>> having told you so back then is not a nice user experience.  Can we do
>> better, with reasonable effort?
> 
> I fear the experience will be as bad as for any guest that is using
> features from a newer cpu level (i.e. random crashes when the guest
> actually tries to use that newer instruction.)
> 
> I see two options:
> - Just try to start and hope that it works.
> - Deprecate any cpu model older than z10.
> 
> Anyone have a better idea? I don't particularly like any of the two.

As the default CPU model with new compat machines is >= z13, I wouldn't 
lose sleep about this. Even with a broken bios one can still boot an 
external kernel+initrd for testing purposes.

-- 
Thanks,

David / dhildenb


