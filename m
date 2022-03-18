Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A077C4DE01F
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 18:42:59 +0100 (CET)
Received: from localhost ([::1]:51824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVGcs-0004zm-8v
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 13:42:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nVGWS-0001hN-2q
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 13:36:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nVGWP-0002df-Tr
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 13:36:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647624977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=alnTTAo29KjSBSgTLbWIOagNRTQk9ep1fxxqRgciHLw=;
 b=P5EKtVmfDJHq48b14RTNe7l96RJZzhbJDfu/2aqorTkCvxa34bVzJYlb91TeJkNBimlZJf
 Jya7bxfNRLHI7VDHwANCxb2FRzs9qoZFE/lRb9kOKjc+8yrh8BqqSjS4PnYDl99cOdP/Hn
 TSgN1zsRm2OLflbmFmK5mXrJjymB2+U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-Wd1sRWGsON6aKwaX_CdvdA-1; Fri, 18 Mar 2022 13:36:13 -0400
X-MC-Unique: Wd1sRWGsON6aKwaX_CdvdA-1
Received: by mail-wm1-f69.google.com with SMTP id
 t2-20020a7bc3c2000000b003528fe59cb9so3469798wmj.5
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 10:36:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=alnTTAo29KjSBSgTLbWIOagNRTQk9ep1fxxqRgciHLw=;
 b=O96NxZoXi4BcmZgi63NmZK+9grGiZQv3ysKb/fterxRn92OSDInmLY4SbzHSpDfU+l
 RjJD6guzjCsSRAg7Hp1yWMg1CPYObGw/+ENv5nf9xNiraoQgN8ShiCPgyYY4Rgw9Rdg6
 9CDB/kqODSe9ZIbaWctZy5qcyq0JT8m3k2AiQyCD2v2oyhCSER/PUK/4rVkc8cRFn1yN
 CFDvNHlydTiFBiM2RW4NpAFKtG7xQTLTBKvtJ2r6SYa9CNZQJqehTPtjiuSr4IY91eQL
 5kXr4wGPtCkwWhdfzrZi0W+KfCQNpwVb5Fxg6VF4ixh2SSeHpWws68c+KXVF/ZGAI+EW
 i5RA==
X-Gm-Message-State: AOAM530lQD/GedAb19EVP1t1ndUil/pSgCE5HMqPTVvp/ZpLXtuF/LTW
 M6M8q3qxXYHsH5D6TRE5pwovHS1ljoJNFAXP5aD9afs4WYJolR+S4v/MW1WnJbecj8V2vO/RCuJ
 aag/QEtr52OAg0qs=
X-Received: by 2002:a05:600c:1552:b0:38b:4281:a312 with SMTP id
 f18-20020a05600c155200b0038b4281a312mr9097153wmg.55.1647624972303; 
 Fri, 18 Mar 2022 10:36:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhQLM6I7FD33lmqtjtZJJa3tJKAegYpTSdidyLCn8yLCdgdS7hP3A5Qt3DllkFywqwdvqgfg==
X-Received: by 2002:a05:600c:1552:b0:38b:4281:a312 with SMTP id
 f18-20020a05600c155200b0038b4281a312mr9097141wmg.55.1647624972006; 
 Fri, 18 Mar 2022 10:36:12 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218]) by smtp.gmail.com with ESMTPSA id
 j7-20020a05600c410700b0038c72ef3f15sm5937923wmi.38.2022.03.18.10.36.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 10:36:11 -0700 (PDT)
Message-ID: <d59847b7-98cb-9e9c-0c42-74576f152737@redhat.com>
Date: Fri, 18 Mar 2022 18:36:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v4] tests: Do not treat the iotests as separate meson test
 target anymore
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220310075048.2303495-1-thuth@redhat.com>
 <2a2dadb8-24ba-50c4-617e-ab6d08166e83@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <2a2dadb8-24ba-50c4-617e-ab6d08166e83@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/03/2022 18.04, Hanna Reitz wrote:
> On 10.03.22 08:50, Thomas Huth wrote:
>> If there is a failing iotest, the output is currently not logged to
>> the console anymore. To get this working again, we need to run the
>> meson test runner with "--print-errorlogs" (and without "--verbose"
>> due to a current meson bug that will be fixed here:
>> https://github.com/mesonbuild/meson/commit/c3f145ca2b9f5.patch ).
>> We could update the "meson test" call in tests/Makefile.include,
>> but actually it's nicer and easier if we simply do not treat the
>> iotests as separate test target anymore and integrate them along
>> with the other test suites. This has the disadvantage of not getting
>> the detailed progress indication there anymore, but since that was
>> only working right in single-threaded "make -j1" mode anyway, it's
>> not a huge loss right now.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   v4: updated commit description
>>
>>   meson.build            | 6 +++---
>>   scripts/mtest2make.py  | 4 ----
>>   tests/Makefile.include | 9 +--------
>>   3 files changed, 4 insertions(+), 15 deletions(-)
> 
> I can’t really say I understand what’s going on in this patch and around it, 
> but I can confirm that it before this patch, fail diffs aren’t printed; but 
> afterwards, they are

It's a bug in Meson. It will be fixed in 0.61.3 and later (so this patch 
won't be needed there anymore), but the update to meson 0.61.3 caused other 
problems so we also can't do that right now... so I'm not sure whether we 
now want to have this patch here included, wait for a better version of 
meson, or even rather want to revert the TAP support / meson integration 
again for 7.0 ... ?

  Thomas


