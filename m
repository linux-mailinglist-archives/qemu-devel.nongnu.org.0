Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AC94CA48D
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 13:14:59 +0100 (CET)
Received: from localhost ([::1]:38564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPNsg-0003J0-FE
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 07:14:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nPMrM-0001Yc-Iu
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 06:09:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nPMrH-00022Q-Og
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 06:09:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646219367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n03BcH3LOx4QsulJ7Jtgr0dkBHdb9vcP2pyZDrcpEjk=;
 b=XDlWzsDmkp4oyTeXtg5Tm8n7DuZM+A9VsjDxN613yg+zBaFrXCN4DrOLeTEZ7niC22tNRK
 goQ729bnxqOQ/HRRipEsowEXNloEyk4xXDSTKIQ1p/r4KPI9EA5TRkST50Q1JWNC2HKmd0
 bLE7bsq03lf+DYKMGMToaHqU9jU5s4E=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-1jJgo31gPBanxmlO-Mvs7w-1; Wed, 02 Mar 2022 06:09:24 -0500
X-MC-Unique: 1jJgo31gPBanxmlO-Mvs7w-1
Received: by mail-wm1-f70.google.com with SMTP id
 ay7-20020a05600c1e0700b003813d7a7d03so705338wmb.1
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 03:09:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=n03BcH3LOx4QsulJ7Jtgr0dkBHdb9vcP2pyZDrcpEjk=;
 b=eVZLYXv9Sx4jvM1vpUei3jsr5XSNu8k2rFT96n4dDeNfEvaI+UKOIjxXz4GaFykTc9
 kMK+EHf+hJ4ocFyFes3NEmLBT5ll0YMrOsy6MwmN3wqvZI8UKNAfTyXQi450czF0GAcU
 toQ/+XWZ57G/5VXuJ3v/zJKZVatEJrRSz4GtTxEm6uh0jTkD5xT6ImuTPaJ5wsZlXdr1
 Afg++qcbfuhSzC0rZehuYK3SujjFJxS+6Bi8B3T5E9KxO3q5PR985QNa/P5xXrXbKkFx
 sguZqn43rgA/u+Ld6XLYAlo5jLbF1bT1i2pTAyTJFlu0gqnwgckZcsbBxUPXPBfWH81H
 rOAA==
X-Gm-Message-State: AOAM532cJNjsXvCFsZYVITJ2/iuo31qPCqMAd98pZDABCpdN5BD19BRv
 vkRMUwa76vbk2UMReVSdRURj8hCDFplrF2BuS8ZfV5xzcLW8yI3G3u67Ni3TLEyk4n760iqZmjX
 YM9yt421mYjGHa1o=
X-Received: by 2002:adf:e751:0:b0:1f0:2139:2489 with SMTP id
 c17-20020adfe751000000b001f021392489mr4571749wrn.319.1646219363641; 
 Wed, 02 Mar 2022 03:09:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyTddv6NYY2iI9kvvmuFc46rGTeFG4YMsFwgZih6//TzMX5SrT7/f8fZjF2RFoazLB9+sUxdg==
X-Received: by 2002:adf:e751:0:b0:1f0:2139:2489 with SMTP id
 c17-20020adfe751000000b001f021392489mr4571739wrn.319.1646219363456; 
 Wed, 02 Mar 2022 03:09:23 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a05600c198900b0037c0342cb62sm6999063wmq.4.2022.03.02.03.09.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Mar 2022 03:09:23 -0800 (PST)
Message-ID: <17a2a9e8-b0a0-8cd0-f3e3-4e4d71437d45@redhat.com>
Date: Wed, 2 Mar 2022 12:09:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] iotests/303: Check for zstd support
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20220221170845.628429-1-hreitz@redhat.com>
 <20220221170845.628429-3-hreitz@redhat.com>
 <e4e63939-d4c3-795b-1270-0d3f74477ec3@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <e4e63939-d4c3-795b-1270-0d3f74477ec3@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.02.22 16:55, Vladimir Sementsov-Ogievskiy wrote:
> 21.02.2022 20:08, Hanna Reitz wrote:
>> 303 runs two test cases, one of which requires zstd support.
>> Unfortunately, given that this is not a unittest-style test, we cannot
>> easily skip that single case, and instead can only skip the whole test.
>>
>> (Alternatively, we could split this test into a zlib and a zstd part,
>> but that seems excessive, given that this test is not in auto and thus
>> likely only run by developers who have zstd support compiled in.)
>>
>> Fixes: 677e0bae686e7c670a71d1f ("iotest 303: explicit compression type")
>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>> ---
>>   tests/qemu-iotests/303 | 15 +++++++++++----
>>   1 file changed, 11 insertions(+), 4 deletions(-)
>>
>> diff --git a/tests/qemu-iotests/303 b/tests/qemu-iotests/303
>> index 16c2e10827..5a3efb4ba3 100755
>> --- a/tests/qemu-iotests/303
>> +++ b/tests/qemu-iotests/303
>> @@ -21,7 +21,8 @@
>>     import iotests
>>   import subprocess
>> -from iotests import qemu_img_create, qemu_io, file_path, log, 
>> filter_qemu_io
>> +from iotests import notrun, qemu_img_pipe_and_status, qemu_io, 
>> file_path, \
>> +        log, filter_qemu_io
>>     iotests.script_initialize(supported_fmts=['qcow2'],
>> unsupported_imgopts=['refcount_bits', 'compat'])
>> @@ -55,9 +56,15 @@ def add_bitmap(num, begin, end, disabled):
>>       def test(compression_type: str, json_output: bool) -> None:
>> -    qemu_img_create('-f', iotests.imgfmt,
>> -                    '-o', f'compression_type={compression_type}',
>> -                    disk, '10M')
>> +    opts = f'compression_type={compression_type}'
>> +    output, status = qemu_img_pipe_and_status('create',
>> +                                              '-f', iotests.imgfmt,
>> +                                              '-o', opts,
>> +                                              disk, '10M')
>> +    if status == 1 and \
>> +            "'compression-type' does not accept value 'zstd'" in 
>> output:
>> +        notrun('zstd compression not supported')
>> +
>
> Could we make from it a function in iotests.py like has_working_luks() 
> / verify_working_luks() ?
>
> Then in this test we'll simply have at start iotests.verify_zstd(), 
> and in previous test we'll do something like "comp_type = 'zstd' if 
> iotests.has_zstd() else 'zlib'" in classes that wants zstd

Well, to be honest, I deliberately didn’t do that.  We have qemu-img 
create calls in both of these places, where we can simply check the 
returned error string for free, basically.  Adding a function for this 
check doesn’t really reduce complexity (now), because adding such 
functions probably has some more LoC than just checking the returned 
error string in these two places (I say “now” because it’s possible that 
more places are added in the future, though, of course).  With zstd 
support compiled in, such functions would effectively also just add a 
superfluous qemu-img create call wherever they’re used.

I’m not saying I’m right about that judgment, because it does feel a bit 
like premature optimization.  Just saying why I didn’t add such functions.

So, with that said, would you still prefer such iotests.py functions?  
I’ll absolutely add them in v2 if you do.

Hanna


