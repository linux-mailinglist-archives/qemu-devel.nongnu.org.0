Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A55399320
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 21:03:23 +0200 (CEST)
Received: from localhost ([::1]:58468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loW9C-00037I-5e
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 15:03:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loW81-000276-Nz
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 15:02:10 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:40699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loW7z-0003oZ-Sf
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 15:02:09 -0400
Received: by mail-pf1-x430.google.com with SMTP id q25so2937262pfh.7
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 12:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZwSU2E/6RpKKcXsFr2QAetwN4V6PJytQI5uom63pQ0o=;
 b=lm3uARgMotfALoc8MUIajMC/OoH3fflOxleX6ydNCuuWmVfAhb1q/74xZqsQpkVdBc
 mVNH/YNqt3FiX1QMfuUOTD/NlESn9T7fjYK5rlXwSnbCeOkrYGkN10C78tpEBiz1QB/a
 w2bwgJ9JtL40n+3OmG0DxokJ0ddokNV2Emd5oY3kbOkIBZYp+abprlE4Ye69qXkn9i6a
 i0qw3JeitTCEE7SIrB21SWT84wtN4yCbnQnz+u1OVnRpO1Xk+gqOv89otgywNGfreExe
 tpk0EpSNwLtWUzEHItyHLAhfdOGmuhKMrOXNegAUmDZjGMhPMcerUyKBPMXAOloI7G+q
 ec2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZwSU2E/6RpKKcXsFr2QAetwN4V6PJytQI5uom63pQ0o=;
 b=ENm+PUMW3C3+SxL5XdH/hIAA4iLt97WKRVxNgyYllh8VGCsfqpvH0rU0CXfXpwmIhg
 j33sKlwYd/HBacbr+othPN3pVfbxna1Gh7MheOpUPagbkJfAZcjkTzrgnE+/XW1lxNu8
 W0UFAXjRHHbuckciEgnQrqHeTSQ6hW21MNkblWB13+AZKtrmQyUHaMkkn5rxIRF+ngn1
 bTu0pANk2QzszxUIcoTgLeN4KGIG3p+/s1Tjbh6mUDuvH4sbt2UekDxW8CwlyqqYF866
 m14AtFBHGY9SC94r+1AlBzYv3qJHsHnHH0/WxtMU1RTCcNCxAc9FuGYfRjmotrC6t3Mz
 Lvfw==
X-Gm-Message-State: AOAM532xt4FNWX9Q6w6Yp9NUBUWHhf9Ru658/q95IHtWj4XHUlACKs4H
 i5oxUfb+aZuVdWKoqXima6nhuG7F0gDA8g==
X-Google-Smtp-Source: ABdhPJzfwgWzq36ZvmsOMbR+FE1mSYIfUJ85XjQK1rCsmhZzBLHPk0dzbS7mEh8k4DiSVZvBVNfYXA==
X-Received: by 2002:a63:164f:: with SMTP id 15mr35539723pgw.175.1622660525883; 
 Wed, 02 Jun 2021 12:02:05 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id x9sm462787pgp.5.2021.06.02.12.02.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 12:02:05 -0700 (PDT)
Subject: Re: [RFC] Adding the A64FX's HPC funtions.
To: Peter Maydell <peter.maydell@linaro.org>,
 "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
References: <OS3PR01MB61515F08F0709D9E22B8DDDFE9249@OS3PR01MB6151.jpnprd01.prod.outlook.com>
 <TYCPR01MB6160FB4A9712F3F5E14D8BBAE93E9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
 <CAFEAcA_fZ_jC640XrFUCSk6YxzoSmdwDaMDAXoX47mBFKdS9hg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a56283b3-3bb2-d9a3-9a6e-8175cc17b376@linaro.org>
Date: Wed, 2 Jun 2021 12:02:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_fZ_jC640XrFUCSk6YxzoSmdwDaMDAXoX47mBFKdS9hg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.613,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/1/21 8:21 AM, Peter Maydell wrote:
>>> I'm thinking of implementing A64FX HPC extension in qemu.
>>> A64FX [1] is a CPU developed by Fujitsu that implements armv8+SVE.
>>>
>>> [1]
>>> https://github.com/fujitsu/A64FX/blob/master/doc/A64FX_Microarchitecture
>>> _Manual_en_1.4.pdf
>>>
>>> A64FX is a CPU developed for HPC (High Performance Computing), and HPC
>>> extensions [2] are implemented to improve the performance of user programs.
>>>
>>> [2]
>>> https://github.com/fujitsu/A64FX/blob/master/doc/A64FX_Specification_HP
>>> C_Extension_v1_EN.pdf
>>>
>>> The details of each function are described in [2], and the HPC extensions
>>> include
>>> 1) Tag address override
>>> 2) Sector cache
>>> 3) Hardware barrier
>>> 4) Hardware prefetch assist
>>> are implemented.

Thanks for the pointers.  It looks to me that it'll be easy to implement these 
in qemu.  We'll need to implement the registers, so that the OS can read back 
the values, but we do not need to actually do anything with them.

>>> 1) Is target/arm/helper.c enough to implement the register (ARMCPRegInfo
>>> structure) of HPC extension function of A64FX?

Yes.

>>> 2) Is it OK to specify the option to set the HPC extension of A64FX as follows,
>>> for example?
>>>
>>> -M virt -cpu max,a64fx-hpc-sec=on (*sector cache function) -M virt -cpu
>>> max,a64fx-hpc-hwpf=on (*hardware prefetvh assist function) -M virt -cpu
>>> max,a64fx-hpc-hwb=on (*hardware barrier function)
>>>
>>> It is also possible to implement something like -cpu a64fx, but since we don't
>>> know if we can implement it immediately, we assume that we will use the -cpu
>>> max option first.

My first thought is that -cpu max can simply enable the extensions, without 
extra flags.  The max cpu has all of the features that we can enable, and as I 
see it this is just one more.

I would like to add -cpu a64fx at some point.  But as you say, that need not 
happen right away.

>>> Since there is no example of A64FX function implemented in QEMU, we would
>>> appreciate your comments before we post a patch.

We endeavor to enable features by the architectural id registers when possible. 
  Thus the cpu_isar_feature() checks in helper.c.

The microarchitectural document provided does not list all of the system 
register reset values for the A64FX, and I would be surprised if there were an 
architectural id register that specified a non-standard extension like this. 
Thus I would expect to add ARM_FEATURE_A64FX with which to enable these 
extensions in helper.c.

I can certainly help you with this.


r~

