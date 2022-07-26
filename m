Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E9C581BB1
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 23:37:36 +0200 (CEST)
Received: from localhost ([::1]:57024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGSFD-0006mX-O1
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 17:37:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oGSDe-00057E-Kt
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 17:35:58 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:43898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oGSDZ-0007CM-29
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 17:35:58 -0400
Received: by mail-pl1-x62b.google.com with SMTP id y15so14471570plp.10
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 14:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4fUD7qMwznQRZX7t8SsuOMqgRYh5DVy1YPW3f2buatM=;
 b=F1s3PpfM1YJ05K9FK0e2ONRJ8IPZFi0oCV5tRrSPDScjqCNFAgKopWuprrahOHFyzU
 S8xZKLDXZ68TdkipNrf9DaVNLRXOPesg9N+UKZnVhK8djRVLTlDLqW+PohrLGeKCgtH1
 gH+DoCR7m8Gjl0SkHx3Cr6JWiJg6lTcWErNzU2U2P5+satn9xU81geUsA6Itke+uZJTI
 HQ7rCyzg3slH+liCVVujYqxAxQKk1mDB+nBtCs5r4ps5wRmDm6XvhRaKff4Lqdz7bEbg
 orxZ21U4RhsOpZ+Wgx+Oh2+s3B7M4qLiAapt4b0e58SVjon+Asproy39QE6usnW2GpZ+
 0CVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4fUD7qMwznQRZX7t8SsuOMqgRYh5DVy1YPW3f2buatM=;
 b=XOH6kcakkPlM8zHBQFXwksYLPigBVeP4lMNEoZpEGb0YrMAIWIGe68Os9cktUb1X21
 DKg1ua2aE3Dwd3IZo8Ya7BDyDPLWhdBP6CwBlByNo0Okp5VnpMS4HS1SrodJ/XbVVehd
 kxBSzIx/3X4lJNKsg7+9G1sAIdZ7aHWKpMgB2Pu7YWQFexrmkjXsPGkBrUx9Vuz/TIKy
 9c3bLO6mGwBzOpYhoRzixnUe5VkdyQFS2VNKf9ECL/WWStIb5NDgz/ctEGNRw4OXWpY0
 i1XKIBzzuhWR3/H637jLSjwp0g2ZPseql0lZxrcbYgv15GM6egcrc377o/2K51wMbaoo
 Fl9w==
X-Gm-Message-State: AJIora8ZrlyR11HPR3UGkTXYCXwjZ6IO0uBQ0BO/BQeA+5rPEJNLQliS
 k7njgyAFrSd7Mb28CiTHxYs=
X-Google-Smtp-Source: AGRyM1um/vErQDuNtNPtGcQxf0k/EHUwEyn9FVsbHDhrF+rvS9P70SWfX5O+AxQZpmdH0BN2K0VfNg==
X-Received: by 2002:a17:902:ecd0:b0:16d:5001:48f with SMTP id
 a16-20020a170902ecd000b0016d5001048fmr17246016plh.90.1658871351092; 
 Tue, 26 Jul 2022 14:35:51 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a170902d4c600b0016c1b178628sm12272389plg.269.2022.07.26.14.35.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jul 2022 14:35:50 -0700 (PDT)
Message-ID: <c13afe31-6b53-f819-a434-3b608ce23f99@amsat.org>
Date: Tue, 26 Jul 2022 23:35:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: hexagon docker test failure
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
References: <e23e406a-bd4f-3ff0-a3f6-4f15eb18eecc@linaro.org>
 <SN4PR0201MB880842E568E6F1BEAE5E1139DE949@SN4PR0201MB8808.namprd02.prod.outlook.com>
In-Reply-To: <SN4PR0201MB880842E568E6F1BEAE5E1139DE949@SN4PR0201MB8808.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

(Cc'ing Paolo for commit cd362defb)

On 26/7/22 19:23, Taylor Simpson wrote:
> 
>> -----Original Message-----
>> From: Richard Henderson <richard.henderson@linaro.org>
>> Sent: Tuesday, July 26, 2022 10:41 AM
>> To: Taylor Simpson <tsimpson@quicinc.com>
>> Cc: qemu-devel <qemu-devel@nongnu.org>
>> Subject: hexagon docker test failure
>>
>> Hi Taylor,
>>
>> One of your recent hexagon testsuite changes is incompatible with the
>> docker image that we're using:
>>
>> tests/tcg/hexagon/multi_result.c:79:16: error: invalid instruction
>>
>>     asm volatile("%0,p0 = vminub(%2, %3)\n\t"
>>
>>                  ^
>>
>> <inline asm>:1:2: note: instantiated into assembly here
>>
>>           r3:2,p0 = vminub(r1:0, r3:2)
>>
>>           ^
>>
>> 1 error generated.
>>
>>
>> Can we try again to update debian-hexagon-cross?  I recall that last time
>> there was a compiler bug that prevented forward progress.  Perhaps that has
>> been fixed in the interim?
>>
>> I'm willing to accept such an update in the next week before rc1, but if we
>> can't manage that we'll need to disable the failing test(s?).  Thanks in
>> advance,
>>
>>
>> r~
> 
> Hi Richard,
> 
> Some of the tests require the -mv67 flag to be passed to the compiler because they have instructions that are new in v67.
> 
> This patch
> commit cd362defbbd09cbbc08b3bb465141542887b8cef
> Author: Paolo Bonzini <pbonzini@redhat.com>
> Date:   Fri May 27 16:35:48 2022 +0100
> 
>      tests/tcg: merge configure.sh back into main configure script
> 
> Moved this line from tests/tcg/configure.sh to the main configure script
> : ${cross_cc_cflags_hexagon="-mv67 -O2 -static"}
> 
> 
> However, those flags aren't actually passed to the compiler any more - at least by default.
> 
> The gitlab builder is passing
> https://gitlab.com/qemu-project/qemu/-/jobs/2771528066
> So, there must be something in $MAKE_CHECK_ARGS
> 
> I use the following when I run
> make EXTRA_CFLAGS='-mv67 -O2' check-tcg
> 
> 
> So, we probably don't need a new docker image.  Do other targets have their cross_cc_cflags?  Please advise.
> 
> Thanks,
> Taylor
> 


