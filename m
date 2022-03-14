Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 478E24D7FB6
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 11:19:26 +0100 (CET)
Received: from localhost ([::1]:42960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nThnR-0000St-DB
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 06:19:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nThmB-0007bz-3X
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 06:18:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nThm8-0007EC-7Q
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 06:18:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647253082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sYpXg9YGYPFhNbezwmXJKH5/Rw6Dlp34vEHrPdXPdtI=;
 b=h9+trBFlRYJVzBsZDn6gHVe2CN3lHt/ANH1Ck9ATNzw1XSorLpIvcBO7CTAoaV3eh/40zc
 sTNX6QmriRqg6y+CH/8A/3dpKrfSNQnEoBTKbgETX/WrakYmvRYlL/qYG2cyZLJdndVwjD
 QpiaZ2KApJPxvh8yHirjwr2eX8OwfkQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-458-5YK85SooOWmSjSrKuSg7nw-1; Mon, 14 Mar 2022 06:18:01 -0400
X-MC-Unique: 5YK85SooOWmSjSrKuSg7nw-1
Received: by mail-wr1-f70.google.com with SMTP id
 b9-20020a05600003c900b00203647caa11so4195072wrg.5
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 03:18:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=sYpXg9YGYPFhNbezwmXJKH5/Rw6Dlp34vEHrPdXPdtI=;
 b=VIWe51g1CpRX+USI1FRoRFn/AABz5VZ0TyKNwC641EduxkgtWSJjOpkc+A8GOw2r4L
 tQf4DQFHk0EFHn8rYU09Ju2mpx4fqpRQQv4no2de7qr9NAMpYPnh7nyMel0Ubmyw3I1K
 LJqJyu5UB1F0HajXgNKNI40OIJpOF7BMb3mQu0yMF3i/qNBFkQVMbVTu3Xk8edT4+7oL
 IvdfCaBMBHPOtRD6+OTm3ZpoCrckkK7s0nJ5sSfVWGIQlFV5T17VBJm6fEJMkhRkTymb
 +k09ijSjqFsweOUnVW5mxegNund2AHTQ10vEOae7gxgCuG803bTDuq5po3BQnI5DhG/q
 YRew==
X-Gm-Message-State: AOAM532WzM/MDhtPW7KvA447oz0UbhLvLGlXsd7W5gqAB3flpXFWbNqa
 /hfuG1brt29k1lqeIqdH7z3yXJo25REoT/Olebf4o4sjaaUCy/RhgokkwlKBg5SMP8BgqmFeN/M
 EI/qcJxcb66sHF6s=
X-Received: by 2002:a7b:c4d8:0:b0:386:69ef:6ca with SMTP id
 g24-20020a7bc4d8000000b0038669ef06camr16982259wmk.6.1647253080423; 
 Mon, 14 Mar 2022 03:18:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQh2eeCU8uToDbJJ3Yep5ex+Wr8rqiEi+ZXtcbUk4H9I23NitGcl1L2ijXW0SGtQZqp6APKQ==
X-Received: by 2002:a7b:c4d8:0:b0:386:69ef:6ca with SMTP id
 g24-20020a7bc4d8000000b0038669ef06camr16982235wmk.6.1647253080124; 
 Mon, 14 Mar 2022 03:18:00 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:9a00:b2c1:8682:b807:e870?
 (p200300cbc7049a00b2c18682b807e870.dip0.t-ipconnect.de.
 [2003:cb:c704:9a00:b2c1:8682:b807:e870])
 by smtp.gmail.com with ESMTPSA id
 y2-20020a056000108200b001f078fc13a7sm13148413wrw.73.2022.03.14.03.17.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Mar 2022 03:17:59 -0700 (PDT)
Message-ID: <a73c2239-7891-7551-68ad-603d2e058777@redhat.com>
Date: Mon, 14 Mar 2022 11:17:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 3/3] tests/tcg/s390x: Test BRASL and BRCL with large
 negative offsets
To: Christian Borntraeger <borntraeger@de.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20220311184911.557245-1-iii@linux.ibm.com>
 <20220311184911.557245-4-iii@linux.ibm.com>
 <46cd7fbe-c96e-71b5-a648-da0fce0d2f8d@linaro.org>
 <a97d0416-111a-4b03-c787-b51facea4a3c@de.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <a97d0416-111a-4b03-c787-b51facea4a3c@de.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14.03.22 09:30, Christian Borntraeger wrote:
> 
> 
> Am 11.03.22 um 21:32 schrieb Richard Henderson:
>> On 3/11/22 10:49, Ilya Leoshkevich wrote:
>>> +    size_t length = 0x100000006;
>>> +    unsigned char *buf;
>>> +    int i;
>>> +
>>> +    buf = mmap(NULL, length, PROT_READ | PROT_WRITE | PROT_EXEC,
>>> +               MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>>> +    assert(buf != MAP_FAILED);
>>
>> I'm thinking exit success here, as such a large allocation may well fail depending on the host.
> 
> What about using MAP_NORESERVE ?

+1


-- 
Thanks,

David / dhildenb


