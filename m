Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC62437C605
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 17:48:39 +0200 (CEST)
Received: from localhost ([::1]:57204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgr6E-0007NZ-S4
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 11:48:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lgr24-0005Mf-J2
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:44:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lgr20-0008O1-SO
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:44:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620834256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zm92zXqOJbDGX1KVH7H7p+PlalcmQ5mVCooS4tVZiJo=;
 b=hFOrwMBimOCSOayr764xpAuz9Q8jPmd9ZNTiZnqAwLZEsmFdZgH19QRBD/LK+HUKHb3HPL
 FUVli9xy1wgu24sRJl90W8FsXLeKmuoTub+qK/On+toC93bgPtOyuA/IQsunbO+yG4meOP
 iRDtXcvvYBho/8TaDGIfWOtVHiHIklg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-Zpae36mvP9yN560DZG5SCg-1; Wed, 12 May 2021 11:44:13 -0400
X-MC-Unique: Zpae36mvP9yN560DZG5SCg-1
Received: by mail-wr1-f70.google.com with SMTP id
 67-20020adf81490000b029010756d109e6so10201070wrm.13
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 08:44:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zm92zXqOJbDGX1KVH7H7p+PlalcmQ5mVCooS4tVZiJo=;
 b=P1vxjNrJzbvEeZQEfL4PenEN4aPGAQDyXLWj+2+3tddyCLVSj+At1MCgqINIIzvq3b
 jIl7AixI433wC4WFjxkEquBBLMLSdhhw7Xj81Sw+IUyGgckz3icbIiuB1QlDnYnGy6Ig
 uOr+riaGjJ5qvpUuj9WvfdWVOHJWzt/RHpSVPLGrokXHA+3IcfOjjExHrAZKiWMgZhQ2
 2WSk+YS69wQkw/X2T4ROXmfbf1oHZJ/yMRhvxCV+EjvQtedB+cDA55nyf9UCiIdtkXo2
 Vh5+eY5c7qC1Nm3zYMZDsvTwKtVJj2h0ZIlHIYv153YtQM9N4mrtvuOv7Akw53nd5jyV
 SDlg==
X-Gm-Message-State: AOAM533/xc55jPROQoRseoLKyH6GVYEYemOQGuvMmyTRanzR9Yg7K7yz
 pmOmiKl3Zv1lBD8A0g3vrBkeLxBq43FND1QU/NLYPWQWz+3usR/nqlYJDJSvT2LTXnrPnkc9SL+
 p7TnMUBMn6NszM0s=
X-Received: by 2002:a05:6000:108f:: with SMTP id
 y15mr47524024wrw.115.1620834252472; 
 Wed, 12 May 2021 08:44:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXdkqb8O4YkY01RfyAVzUFB6a5qXFxSRHiMHIpS3B5RmB8zIAgU1RTrGftUQyGdgp5ThQybw==
X-Received: by 2002:a05:6000:108f:: with SMTP id
 y15mr47524000wrw.115.1620834252273; 
 Wed, 12 May 2021 08:44:12 -0700 (PDT)
Received: from thuth.remote.csb (pd9e832bb.dip0.t-ipconnect.de.
 [217.232.50.187])
 by smtp.gmail.com with ESMTPSA id f20sm68755wmh.41.2021.05.12.08.44.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 08:44:11 -0700 (PDT)
Subject: Re: [PATCH] travis-ci: Use clang-10 for the [s390x] Clang
 (disable-tcg) job
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210512152231.3423265-1-philmd@redhat.com>
 <32b21c1c-0d55-d92a-390e-f7d6059d03a9@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <d9eadf82-3fa6-8a52-7822-8da9a9114459@redhat.com>
Date: Wed, 12 May 2021 17:44:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <32b21c1c-0d55-d92a-390e-f7d6059d03a9@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/05/2021 17.26, Philippe Mathieu-Daudé wrote:
> On 5/12/21 5:22 PM, Philippe Mathieu-Daudé wrote:
>> On Ubuntu Bionic 18.04 LTS clang binary points to the 6.0 version:
>>
>>    $ clang --version
>>    clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)
>>
>> However we can install clang-10 from the bionic-updates stream [*]
>> and use it, to silent the following warnings:
>>
>>       CC      pc-bios/s390-ccw/main.o
>>    clang: warning: optimization flag '-fno-delete-null-pointer-checks' is not supported [-Wignored-optimization-argument]
>>    clang: warning: argument unused during compilation: '-msoft-float' [-Wunused-command-line-argument]
>>    /home/travis/build/qemu/qemu/pc-bios/s390-ccw/main.c:284:5: warning: no previous prototype for function 'main' [-Wmissing-prototypes]
>>    int main(void)
>>        ^
>>    1 warning generated.
>>    clang: warning: optimization flag '-fno-delete-null-pointer-checks' is not supported [-Wignored-optimization-argument]
>>
>> [*] https://packages.ubuntu.com/bionic-updates/clang-10
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> However this doesn't resolve:
>>
>>      /home/travis/build/philmd/qemu/pc-bios/s390-ccw/jump2ipl.c:67:18: error: invalid operand for instruction
>>          asm volatile("lghi 1,1\n\t"
>>                       ^
>>      <inline asm>:1:7: note: instantiated into assembly here
>>              lghi 1,1
>>                   ^
>>      /home/travis/build/philmd/qemu/pc-bios/s390-ccw/jump2ipl.c:67:29: error: invalid operand for instruction
>>          asm volatile("lghi 1,1\n\t"
>>                                  ^
>>      <inline asm>:2:7: note: instantiated into assembly here
>>              diag 1,1,0x308
>>                   ^
>>      2 errors generated.
>>      Makefile:20: recipe for target 'jump2ipl.o' failed
>>      make[1]: *** [jump2ipl.o] Error 1
>>
>> (see https://travis-ci.org/github/philmd/qemu/jobs/770920106#L1803,
>> https://travis-ci.org/github/philmd/qemu/jobs/770920522#L1818 for
>> more errors).
>> ---
>>   .travis.yml | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/.travis.yml b/.travis.yml
>> index 4609240b5aa..9c0deea9a06 100644
>> --- a/.travis.yml
>> +++ b/.travis.yml
>> @@ -278,6 +278,7 @@ jobs:
>>         compiler: clang
>>         addons:
>>           apt_packages:
>> +          - clang-10
>>             - libaio-dev
>>             - libattr1-dev
>>             - libbrlapi-dev
>> @@ -303,7 +304,7 @@ jobs:
>>         env:
>>           - TEST_CMD="make check-unit"
>>           - CONFIG="--disable-containers --disable-tcg --enable-kvm
>> -                  --disable-tools --host-cc=clang --cxx=clang++"
>> +                  --disable-tools --host-cc=clang-10 --cc=clang-10 --cxx=clang++-10"
> 
> I forgot to mention we were missing the --cc= flag, so s390-ccw
> was built with an inconsistent $CC. I might respin this part
> separately.

I think the configure script uses the same compiler as --host-cc for --cc if 
it is not specified. So depending on whether Daniel sets the minimum version 
to 6.3 or 6.0, we either can use this patch or we don't need it at all.

  Thomas


