Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BC5517DF2
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 08:57:37 +0200 (CEST)
Received: from localhost ([::1]:38696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlmTY-0001lh-5v
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 02:57:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nlmRv-0000yQ-Ge
 for qemu-devel@nongnu.org; Tue, 03 May 2022 02:55:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nlmRs-00076K-I9
 for qemu-devel@nongnu.org; Tue, 03 May 2022 02:55:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651560951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/RovPfaO4vWfkaoJO4SECi+1v74TIRKRkhM00FV1TYs=;
 b=MhryAt5MNBSvN94gyHUE50Gq1+8CGRQGKV/Jog7pmi2eZfjlRpFITGwG8lecWKJWyU8ezR
 um3iNCX24LHPtEN4thsXkrwIUZmyPzOT001vUTm5HLavck2bbyV3QqAWt9BPVEzwR1SmFv
 6FDStYJ2N4p3+MfER+P4ZsZ5ndFAJnc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-235-Vcp2rMcUMMe-qiZvwaxJ1g-1; Tue, 03 May 2022 02:55:48 -0400
X-MC-Unique: Vcp2rMcUMMe-qiZvwaxJ1g-1
Received: by mail-wm1-f69.google.com with SMTP id
 m186-20020a1c26c3000000b003943e12185dso1452839wmm.7
 for <qemu-devel@nongnu.org>; Mon, 02 May 2022 23:55:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/RovPfaO4vWfkaoJO4SECi+1v74TIRKRkhM00FV1TYs=;
 b=UDw3t0V2URPIXtayVREl/eO8bG+nW3JkWirrIuNrtY99ihbK71UYzNsP6yGzRiDYGO
 i6ouOEyEWngZoIsK2x+j8v1Bri8FwuJ3Sx/1Pbe+dOcWnEY3LOwcpoKNlaLKYGdyOe98
 QZO6DJ1+JTIthnEiRBSphqLBqK6/PoyB3RpF9qZFDqtY6iLInlK2b+jf8ZyYlsiNL9Ge
 UQeCTIMoXEwV8h+EUArCgJBqrnPvsNuQEXpypmPkA3qDmZqHUaVkuMDH3ThNT3i9bulH
 w32EgexkEGjE9faagSspOzRVXRDXiP7XeTjzoio40LwtqpiamZOzlyrETRHClCEkdHXN
 gDMw==
X-Gm-Message-State: AOAM533ffYxtPaAcrkepnFyX5FBgkZVBiXzcKebMNXS3isytv7t63XnT
 CRVXZdFdIwQ8td1swrZdv1YlWcjy1p2EjpsbJmZcPrvSE0q3Om9VCkcfsP8L8gZNAorllww0KZ6
 53z8ayIGBU8ZfYZ0=
X-Received: by 2002:a5d:67c6:0:b0:20c:3e1c:d333 with SMTP id
 n6-20020a5d67c6000000b0020c3e1cd333mr11337877wrw.66.1651560947308; 
 Mon, 02 May 2022 23:55:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyv6JcBWZwJwy6cSz8IyS5jiZpJIIZ/kouW4r30tXGJzL6RCBwRqzQWGeAj9IbvMeYmTkBtnQ==
X-Received: by 2002:a5d:67c6:0:b0:20c:3e1c:d333 with SMTP id
 n6-20020a5d67c6000000b0020c3e1cd333mr11337859wrw.66.1651560947066; 
 Mon, 02 May 2022 23:55:47 -0700 (PDT)
Received: from [10.33.198.128] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 be13-20020a05600c1e8d00b003942a244ee6sm1200262wmb.43.2022.05.02.23.55.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 23:55:46 -0700 (PDT)
Message-ID: <348d3383-0bd4-1f18-2d14-08962be66c32@redhat.com>
Date: Tue, 3 May 2022 08:55:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v6 00/13] s390x/tcg: Implement Vector-Enhancements
 Facility 2
Content-Language: en-US
To: David Miller <dmiller423@gmail.com>, David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>
References: <20220428094708.84835-1-david@redhat.com>
 <97f9be15-4ccd-505b-a35e-8d95823df03a@redhat.com>
 <85dffe1d-a6d2-9e93-749b-29febb0b6dc5@redhat.com>
 <CAEgyohV9kjXUW_LMQM7YryQL1=0VW3pSCbffG2uFG7d5vNo5iw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAEgyohV9kjXUW_LMQM7YryQL1=0VW3pSCbffG2uFG7d5vNo5iw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

  Hi!

On 02/05/2022 18.06, David Miller wrote:
> There was also the patch that had them as .insn in the other series of emails.

Sorry, I missed that patch, could you please point me to the mail on 
https://lore.kernel.org/qemu-devel/ ? I remember that there was a discussion 
about the vri-d encoding, but I apparently missed the patch that came out of 
this discussion...

  Thomas

> On Mon, May 2, 2022 at 11:52 AM David Hildenbrand <david@redhat.com> wrote:
>>
>> On 02.05.22 09:20, Thomas Huth wrote:
>>> On 28/04/2022 11.46, David Hildenbrand wrote:
>>>> Implement Vector-Enhancements Facility 2 for s390x
>>>>
>>>> resolves: https://gitlab.com/qemu-project/qemu/-/issues/738
>>>>
>>>> implements:
>>>>       VECTOR LOAD ELEMENTS REVERSED               (VLER)
>>>>       VECTOR LOAD BYTE REVERSED ELEMENTS          (VLBR)
>>>>       VECTOR LOAD BYTE REVERSED ELEMENT           (VLEBRH, VLEBRF, VLEBRG)
>>>>       VECTOR LOAD BYTE REVERSED ELEMENT AND ZERO  (VLLEBRZ)
>>>>       VECTOR LOAD BYTE REVERSED ELEMENT AND REPLICATE (VLBRREP)
>>>>       VECTOR STORE ELEMENTS REVERSED              (VSTER)
>>>>       VECTOR STORE BYTE REVERSED ELEMENTS         (VSTBR)
>>>>       VECTOR STORE BYTE REVERSED ELEMENTS         (VSTEBRH, VSTEBRF, VSTEBRG)
>>>>       VECTOR SHIFT LEFT DOUBLE BY BIT             (VSLD)
>>>>       VECTOR SHIFT RIGHT DOUBLE BY BIT            (VSRD)
>>>>       VECTOR STRING SEARCH                        (VSTRS)
>>>>
>>>>       modifies:
>>>>       VECTOR FP CONVERT FROM FIXED                (VCFPS)
>>>>       VECTOR FP CONVERT FROM LOGICAL              (VCFPL)
>>>>       VECTOR FP CONVERT TO FIXED                  (VCSFP)
>>>>       VECTOR FP CONVERT TO LOGICAL                (VCLFP)
>>>>       VECTOR SHIFT LEFT                           (VSL)
>>>>       VECTOR SHIFT RIGHT ARITHMETIC               (VSRA)
>>>>       VECTOR SHIFT RIGHT LOGICAL                  (VSRL)
>>>
>>> Thanks, queued to my s390x-next branch now:
>>>
>>>    https://gitlab.com/thuth/qemu/-/commits/s390x-next/
>>>
>> Thanks for fixing up. At this point I would have suggested to exclude
>> the tests for now.
>>
>> --
>> Thanks,
>>
>> David / dhildenb
>>
> 


