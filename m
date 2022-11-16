Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8D462BB20
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 12:14:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovGLJ-0003zQ-PD; Wed, 16 Nov 2022 06:12:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ovGLH-0003ws-59
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 06:12:31 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ovGLF-0004HR-FW
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 06:12:30 -0500
Received: by mail-ej1-x632.google.com with SMTP id gv23so10497410ejb.3
 for <qemu-devel@nongnu.org>; Wed, 16 Nov 2022 03:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+Wsk026TR3dtY0AyLm3/JEjcZeSbHXpFCu22WmM7F60=;
 b=MAiotr4yJVo2/rlNFFfk8ltS9IP6324Ak9zsxAczTmJzJjkAQivIlFxVFX+Qelrb1C
 dDIpei6LgExi/kQWskABK8M6ELSuGXZ7es9mTyImPryEQQNEkiSlqbmGnm7wjCsDOdJH
 8yDNTfvuIwpnrEdlMabyuIBDrw15DZwGLkgBHJYQxhhBE3nMxtrlKSQIX3A7Ripaxxlc
 71pDpZroeljg1a9NzvZy/C+MYTSi7mTu7uFRDNbYWCwHXXQHjEi2nFHyC5lpQ4t4pRZY
 AQKv2y7PjElpBv1lccVt9EUaauSTkt8tdU1S8W482aBlXbDHFkE5mbvKwgsXWm8FbpQW
 dXkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+Wsk026TR3dtY0AyLm3/JEjcZeSbHXpFCu22WmM7F60=;
 b=wvrjQ+QVhkMrgyiFBhCj0kHwzP7wLbEzlnpEnTtlphLVjAWqGoAJGW1HFd3n9vhB4A
 TuIfjqpyElFFA4lzxVp2x+Wm4hKgUxZDRIiboIbbh53hWnCGqRWNB56axnASxTYxRS9a
 r+MnGWAP21n3bqKylAdrjd3QcIawIBW0KvtSc6R77t9ny7kwKna6heNC/B7lPHVXUBv5
 CfWjl6nBfNgRpPGVVtFVpfrQgOyeUTCBk4+svhhV2llrhYML2RTERIAkhuuPLYfkjyy3
 3fAhnoYs1cuo4gt3VeJaP1uFgsLdse+/H6n1m1ftU20NEqoOwQBa8BjxClBuO3fW+EGx
 DaGw==
X-Gm-Message-State: ANoB5pla45ww7OvA3I6YUFR46IPk8Lijc1ZwoE+JeP/eu95XjZl1/LWO
 VM1p+4y1p4PlMrkPRmdmHbV4Gg==
X-Google-Smtp-Source: AA0mqf5rZGejIqgHzJmYFMc9Ji1/zsez5YINA51m6fcW6gTg7aHRN8dG7Cj6ICYXMXIOc2UWY0eNnQ==
X-Received: by 2002:a17:906:9618:b0:7ad:dd43:5d53 with SMTP id
 s24-20020a170906961800b007addd435d53mr16323417ejx.376.1668597147134; 
 Wed, 16 Nov 2022 03:12:27 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 eg25-20020a056402289900b00457b5ba968csm7295977edb.27.2022.11.16.03.12.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Nov 2022 03:12:26 -0800 (PST)
Message-ID: <2575d09e-f7a7-a8fc-2a70-d8e7d56353c2@linaro.org>
Date: Wed, 16 Nov 2022 12:12:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: tests/avocado/machine_s390_ccw_virtio: Fedora test failing
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Cornelia Huck
 <cohuck@redhat.com>, "open list:S390 general arch..."
 <qemu-s390x@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Jan Richter <jarichte@redhat.com>
References: <0245aa92-e9a0-5c1f-cd62-65002ba2ef81@linaro.org>
 <3b848b0f-4040-c281-58ad-2d6c8dff1998@redhat.com>
 <d984ce52-4fc3-8c22-83bb-93e901a67ce6@linaro.org>
 <731fb01a-b9ce-c68e-e0d7-2e3602955502@redhat.com>
 <1d0baf8b-c757-265c-b206-07ca3f218b2a@linaro.org>
 <4b6e726c-55aa-cc44-7c95-1f31655ff37a@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <4b6e726c-55aa-cc44-7c95-1f31655ff37a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 16/11/22 11:58, Thomas Huth wrote:
> On 16/11/2022 11.23, Philippe Mathieu-Daudé wrote:
>> Cc'ing Jan/Cleber/Beraldo.
>>
>> On 16/11/22 10:43, Thomas Huth wrote:
>>> On 15/11/2022 12.13, Philippe Mathieu-Daudé wrote:
>>>> On 15/11/22 12:05, Thomas Huth wrote:
>>>>> On 15/11/2022 12.03, Philippe Mathieu-Daudé wrote:
>>>>>> Hi,
>>>>>>
>>>>>> As of v7.2.0-rc0 I am getting:
>>>>>>
>>>>>>   (101/198) 
>>>>>> tests/avocado/machine_s390_ccw_virtio.py:S390CCWVirtioMachine.test_s390x_fedora: FAIL (23.51 s)
>>>>>
>>>>> Is it 100% reproducible? ... the test is known to be a little bit 
>>>>> shaky, that's also why it is disabled in the gitlab CI.
>>>>
>>>> I am running it on my workstation, not GitLab.
>>>
>>> I just double-checked and for me, it's working fine an my laptop, 
>>> with both, rc0 and rc1.
>>>
>>>> 5/5 failures. I'll skip it locally (no need to send a patch) and we can
>>>> have a look after the release.
>>>
>>> If it is a real bug, we should fix it before the release. Could you 
>>> maybe bisect it, please?
>>>
>>> Also, what do you get when dumping the console? I.e.:
>>>
>>> ./tests/venv/bin/avocado --show=console run -t arch:s390x \
>>> tests/avocado/machine_s390_ccw_virtio.py:S390CCWVirtioMachine.test_s390x_fedora
>>
>> When running with the current (old) Avocado runner I get:
>>
>> Avocado crashed: TypeError: cannot pickle '_thread.RLock' object
>> Please include the traceback info and command line used on your bug 
>> report
>> Report bugs visiting 
>> https://github.com/avocado-framework/avocado/issues/new
>>
>> I can use the 'new' runner:
>>
>> $ TMPDIR=/tmp ./tests/venv/bin/avocado --show=app,console run 
>> --test-runner=nrunner -t arch:s390x 
> 
> Uh, don't do that. nrunner does not seem to be able to execute that test 
> yet. Or did you also upgrade your avocado to a newer installation? ... 
> in that case it sounds like you might have messed up your installation? 
> Maybe try again with a fresh and clean checkout of the QEMU repository / 
> a new build folder.

Well the current (old) runner doesn't work on Darwin ARM64:

   Avocado crashed: TypeError: cannot pickle '_thread.RLock' object

Using `TMPDIR=/tmp avocado --test-runner=nrunner` almost all other tests
pass. I'll wait for Cleber's nrunner update before re-testing/bisecting.

