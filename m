Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 377626075D8
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 13:13:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olpxY-00048q-0X
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 07:13:04 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olphT-0001Gv-3h
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 06:56:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1olphH-0001Dl-SC; Fri, 21 Oct 2022 06:56:16 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1olphE-0006Ol-Kn; Fri, 21 Oct 2022 06:56:15 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 t4-20020a9d7f84000000b00661c3d864f9so1565650otp.10; 
 Fri, 21 Oct 2022 03:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=40hdAJYWxvdM3C0c/3D7SQniAq9dfGi6ADXsoJ9F0Ac=;
 b=AEjnnFZGv27PlvqcHlK6NMgv4m2DBycOeoSLuYRMhzXTRM9JTDDyjLyOGMWGoml9Ff
 fssOK77pckVww0AQYt1qKXWaARwJgb/sAoXCYW2ks4CvyTwci+nc1cbYT+NPlYUU7D8P
 ucs2YcYDQoN7cGtpPsfqFmGqqVq7KhrncWQqsYbOB8afkr9zAV486P2ZFfYcjW4mEjyL
 cWfE5e5gLmeDSnjyqCLcpIHsWdMWU09r7D4QJqd+yIhOt2n8bnktRg4sQyG3IpQTyX2z
 gwTF6JV+kr6QNiwPnPVpBJiNJFmQGdeCWCKdrW47AmHUy+lUhAWrhDUtQnOTFvMkoim3
 xbNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=40hdAJYWxvdM3C0c/3D7SQniAq9dfGi6ADXsoJ9F0Ac=;
 b=7ec6l8J8Uji/czuRsPqbchsPkTk2xfXnNozYv05dRbY3iTAioGM5vQtUrXh8yiajjt
 qtL+d9p1Yk6FUhSSUddFXBP46m5BxPs5BVgTA/t/ppo6Fq8e1rLLzTq0LZYtM6Wpdefv
 j9/A74YERgNgmYzsqk88rCcdOUUy+t8PS7w4vGuKPHGLusBbeFVfYnFVA3kNVj0eGgZL
 2eiatLMADV/RlQjpLJMFRDM3CQuJLW7CR7Fr+qUOFfjihyxYAWWNiQa19yXKS0cnEVM4
 9lIZ/PiAqfu/IgYh/G9QZ65375BqcEs2Hxk+tsAAN7Dn/0GE1639Xz5RxM/AoryWDX/7
 0nHQ==
X-Gm-Message-State: ACrzQf2AL+xFYFI7NTbB/9QoMdeLyPvs+X+rgAF6vBjgtD1FiHwD9ytn
 YS1wqmwfSBgw7HxqrhNuZus=
X-Google-Smtp-Source: AMsMyM553BKkJMT2iOM/2rQOhrgBhqaI/q/rfu1FhYIN2iCY8trAQVTU/TAwBL5Ge4Z9+/pzKt+DvA==
X-Received: by 2002:a9d:198c:0:b0:661:aa2e:1aa0 with SMTP id
 k12-20020a9d198c000000b00661aa2e1aa0mr9324498otk.154.1666349770251; 
 Fri, 21 Oct 2022 03:56:10 -0700 (PDT)
Received: from [192.168.10.102] ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 33-20020a9d0ba4000000b006618ca5caa0sm898350oth.78.2022.10.21.03.56.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 03:56:09 -0700 (PDT)
Message-ID: <0fc9927d-44cd-8260-1a4d-810364946973@gmail.com>
Date: Fri, 21 Oct 2022 07:56:05 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 00/29] PowerPC interrupt rework
Content-Language: en-US
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 fbarrat@linux.ibm.com, alex.bennee@linaro.org, farosas@linux.ibm.com
References: <20221011204829.1641124-1-matheus.ferst@eldorado.org.br>
 <56d9bc9d-65ac-05a5-d35b-4d64766687a4@gmail.com>
 <3cf56329-4513-d983-88da-4265a1d5f677@gmail.com>
 <d47b8750-02d8-ed94-78d6-4fcbd7b92c56@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <d47b8750-02d8-ed94-78d6-4fcbd7b92c56@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x335.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Matheus,

I did some digging yesterday. There are 2 distinct things happening:

- the apparent problem with the avocado test. After doing more and more tests
it seems like the test failure rate is lower than 10%. With a simple script
to exercise it in my laptop:

n=1
while [ 1 ]; do
	make -j check-avocado \
		AVOCADO_TESTS='tests/avocado/replay_kernel.py:ReplayKernelNormal.test_ppc64_e500' ;
	if [ $? -ne 0 ]; then
		echo "test failed after $n interactions"
		exit 1
	fi
	((n=n+1))
done

In master I managed to get up to 100+ runs without failure. Sometimes I get 90,
50, 30 runs before failure and so on. This is an OK failure rate in my opinion,
so if any code contribution does not dramatically increase this failure rate I'm
fine with it. This also means that I'll not be skipping the test.

- back to this series, I couldn't manage to get a single successful run with
patch 27 applied. On the other hand, running the aforementioned script with
patches 1-26 I just got 96 test runs before the first failure. This is enough
evidence for me to believe that, yeah, patch 27 is really doing something that is
messing with the icount replay for e500 one way or the other.


All that said, patches 1-26 are queued in ppc-next.


On 10/20/22 10:40, Matheus K. Ferst wrote:
> On 20/10/2022 08:18, Daniel Henrique Barboza wrote:
>> On 10/19/22 18:55, Daniel Henrique Barboza wrote:
>>> Matheus,
>>>
>>> This series fails 'make check-avocado' in an e500 test. This is the error output:
>>
>> Scrap that.
>>
>> This avocado test is also failing on master 10% of the time, give or take.
>> It might be case that patch 27 makes the failure more consistent, but I can't
>> say it's the culprit.
>>
>>
>> I'll take a closer look and see if I can diagnose one particular commit that
>> is making the patch fail 1 out of 10 times. It can be case where I might need
>> to skip the test altogether.
>>
> 
> Nice catch. I guess we need a gen_icount_io_start before calling helper_ppc_maybe_interrupt, so maybe it's better to make a gen_ppc_maybe_interrupt that calls icount and the helper. I'll give it a bit more testing and re-spin the series.


Don't need to re-spin everything (unless you needed to do some changes in
the patches prior). Just resend patch 27+.


Thanks,


Daniel

> 
> Thanks,
> Matheus K. Ferst
> Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
> Analista de Software
> Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>
> 

