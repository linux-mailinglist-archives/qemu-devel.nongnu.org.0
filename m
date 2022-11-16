Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A647C62B7F0
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 11:23:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovFZv-00081S-0W; Wed, 16 Nov 2022 05:23:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ovFZm-0007yW-Pv
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 05:23:27 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ovFZk-0006zn-C0
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 05:23:26 -0500
Received: by mail-ej1-x636.google.com with SMTP id k2so42956504ejr.2
 for <qemu-devel@nongnu.org>; Wed, 16 Nov 2022 02:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LQfDxRQaAMzCXwMcnQQEUO39+yUu7h7eoUTCVG0QpqA=;
 b=BpesuSUK2U210e4m8ab3sKyDcKh7RlnKjvvJqB1LXtViQfe8opi9LM8oIgCGmwRrLR
 aGtaclXoHmnkWHw5t7VlZ6m/LodFDrBb3fSXCFnUZYnj4ve7RhyHEXcFEG7d4tPlF0RO
 mqqu+VlNb7FBpogj2SmDOAH0dldgZ8cGydJDqF23Lwko9/lLtoVasBbtBko4xMriqy4R
 3xZM9MZ19ful+RrmbUlYJqeDn33uQrV1IZi8TrzI6Mk/2bLmXvbHhuS5eaINKHNYZyal
 Zw9PCEFH9bn/emdeShoPyuE1doxCD39J1nTwWcwEPMHiHu5RC5J3DE84dyHfYZEHCs+O
 Sk5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LQfDxRQaAMzCXwMcnQQEUO39+yUu7h7eoUTCVG0QpqA=;
 b=TUs1/IrQJPHmq+pM6AGF4ZkUEzHYCH77VC6DIwQ4cFbKuukt1vsUEHhf53fDneEWxR
 XZPlBORlAZgOcYIYLh90zAtTVpfc7ASbDyNuITNTUwZCORJDRoVrJVGIYcgd8jkRKyeF
 JkMl/QyV15NOF9w6miKLbS07Vrysmn8ml8oO4Ya3Md+NVodGdOYcNRK/JwKv4AY18EWb
 uX8K1OgZ8h8H7NfxXQZuCdzYPiIskWXVyyVgPKwNJeRIbRgrG8U4sL9hWmih5Z82HxMU
 wvVAOhm7X58Wyxkjg6AtNTt5GzR88xqFL12zb6LPOvC0isv8hC3s5Y9HqApRUChxTdbE
 KvBA==
X-Gm-Message-State: ANoB5pmbYp+L6x+opi81zVhjo0aH5rKC8rpYN1ACUVE08kueXqO/ZvKz
 iCGsklPMEhvimYMj6DzZ7lOFwQ==
X-Google-Smtp-Source: AA0mqf6+InRjWc5xfNNooydpOLKkuuQWogtQcOyvXv2Y8G6JeECjvA6XcwhECM2OyYPmRkAVC46ErA==
X-Received: by 2002:a17:906:fb81:b0:7ae:9187:eb70 with SMTP id
 lr1-20020a170906fb8100b007ae9187eb70mr16124780ejb.533.1668594199745; 
 Wed, 16 Nov 2022 02:23:19 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q5-20020a17090676c500b007ad94422cf6sm6624401ejn.198.2022.11.16.02.23.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Nov 2022 02:23:19 -0800 (PST)
Message-ID: <1d0baf8b-c757-265c-b206-07ca3f218b2a@linaro.org>
Date: Wed, 16 Nov 2022 11:23:17 +0100
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
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <731fb01a-b9ce-c68e-e0d7-2e3602955502@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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

Cc'ing Jan/Cleber/Beraldo.

On 16/11/22 10:43, Thomas Huth wrote:
> On 15/11/2022 12.13, Philippe Mathieu-Daudé wrote:
>> On 15/11/22 12:05, Thomas Huth wrote:
>>> On 15/11/2022 12.03, Philippe Mathieu-Daudé wrote:
>>>> Hi,
>>>>
>>>> As of v7.2.0-rc0 I am getting:
>>>>
>>>>   (101/198) 
>>>> tests/avocado/machine_s390_ccw_virtio.py:S390CCWVirtioMachine.test_s390x_fedora: FAIL (23.51 s)
>>>
>>> Is it 100% reproducible? ... the test is known to be a little bit 
>>> shaky, that's also why it is disabled in the gitlab CI.
>>
>> I am running it on my workstation, not GitLab.
> 
> I just double-checked and for me, it's working fine an my laptop, with 
> both, rc0 and rc1.
> 
>> 5/5 failures. I'll skip it locally (no need to send a patch) and we can
>> have a look after the release.
> 
> If it is a real bug, we should fix it before the release. Could you 
> maybe bisect it, please?
> 
> Also, what do you get when dumping the console? I.e.:
> 
> ./tests/venv/bin/avocado --show=console run -t arch:s390x \
> tests/avocado/machine_s390_ccw_virtio.py:S390CCWVirtioMachine.test_s390x_fedora

When running with the current (old) Avocado runner I get:

Avocado crashed: TypeError: cannot pickle '_thread.RLock' object
Please include the traceback info and command line used on your bug report
Report bugs visiting https://github.com/avocado-framework/avocado/issues/new

I can use the 'new' runner:

$ TMPDIR=/tmp ./tests/venv/bin/avocado --show=app,console run 
--test-runner=nrunner -t arch:s390x 
tests/avocado/machine_s390_ccw_virtio.py:S390CCWVirtioMachine.test_s390x_fedora
JOB ID     : 2e62ee88c4f04926281f31ab696f4cd4703612f5
JOB LOG    : 
/Users/philmd/avocado/job-results/job-2022-11-16T11.05-2e62ee8/job.log
  (1/1) 
tests/avocado/machine_s390_ccw_virtio.py:S390CCWVirtioMachine.test_s390x_fedora: 
STARTED
  (1/1) 
tests/avocado/machine_s390_ccw_virtio.py:S390CCWVirtioMachine.test_s390x_fedora: 
FAIL (24.63 s)
RESULTS    : PASS 0 | ERROR 0 | FAIL 1 | SKIP 0 | WARN 0 | INTERRUPT 0 | 
CANCEL 0
JOB TIME   : 25.16 s

but I'm almost blind: I don't get any console output. The only useful
info I found is closer to stderr:

$ cat 
/Users/philmd/avocado/job-results/job-2022-11-16T11.05-2e62ee8//test-results/1-tests_avocado_machine_s390_ccw_virtio.py_S390CCWVirtioMachine.test_s390x_fedora/debug.log
11:05:20 INFO | INIT 1-S390CCWVirtioMachine.test_s390x_fedora
11:05:20 DEBUG| PARAMS (key=timeout, path=*, default=120) => 120
11:05:20 DEBUG| Test metadata:
11:05:20 DEBUG|   filename: 
/Users/philmd/source/qemu/build/tests/avocado/machine_s390_ccw_virtio.py
11:05:20 DEBUG|   teststmpdir: /tmp/avocado_zswqnw_l
11:05:20 DEBUG|   workdir: 
/tmp/tmppq8l13fn/test-results/tmp_dir2cjl2nd2/1-S390CCWVirtioMachine.test_s390x_fedora
11:05:20 INFO | START 1-S390CCWVirtioMachine.test_s390x_fedora
11:05:20 DEBUG| DATA (filename=output.expected) => NOT FOUND (data 
sources: variant, test, file)
11:05:20 DEBUG| PARAMS (key=arch, path=*, default=s390x) => 's390x'
11:05:20 DEBUG| PARAMS (key=cpu, path=*, default=None) => None
11:05:20 DEBUG| PARAMS (key=qemu_bin, path=*, 
default=./qemu-system-s390x) => './qemu-system-s390x'
11:05:20 DEBUG| PARAMS (key=machine, path=*, default=s390-ccw-virtio) => 
's390-ccw-virtio'
11:05:22 DEBUG| QEMUMachine "default" created
11:05:22 DEBUG| QEMUMachine "default" temp_dir: 
/tmp/tmppq8l13fn/test-results/tmp_dir2cjl2nd2/1-S390CCWVirtioMachine.test_s390x_fedora/qemu-machine-di5d3r66
11:05:22 DEBUG| QEMUMachine "default" log_dir: 
/tmp/tmppq8l13fn/test-results/1-S390CCWVirtioMachine.test_s390x_fedora
11:05:40 INFO | Test whether QEMU CLI options have been considered
11:05:41 INFO | Test screendump of virtio-gpu device
11:05:44 ERROR|
11:05:44 ERROR| Reproduced traceback from: 
/Users/philmd/source/qemu/build/tests/venv/lib/python3.10/site-packages/avocado/core/test.py:772
11:05:44 ERROR| Traceback (most recent call last):
11:05:44 ERROR|   File 
"/Users/philmd/source/qemu/build/tests/venv/lib/python3.10/site-packages/avocado/core/decorators.py", 
line 90, in wrapper
11:05:44 ERROR|     return function(obj, *args, **kwargs)
11:05:44 ERROR|   File 
"/Users/philmd/source/qemu/build/tests/avocado/machine_s390_ccw_virtio.py", 
line 256, in test_s390x_fedora
11:05:44 ERROR|     self.assertEqual(line, b"The quick fox jumps over a 
lazy dog\n")
11:05:44 ERROR|   File 
"/opt/homebrew/Cellar/python@3.10/3.10.8/Frameworks/Python.framework/Versions/3.10/lib/python3.10/unittest/case.py", 
line 845, in assertEqual
11:05:44 ERROR|     assertion_func(first, second, msg=msg)
11:05:44 ERROR|   File 
"/opt/homebrew/Cellar/python@3.10/3.10.8/Frameworks/Python.framework/Versions/3.10/lib/python3.10/unittest/case.py", 
line 838, in _baseAssertEqual
11:05:44 ERROR|     raise self.failureException(msg)
11:05:44 ERROR| AssertionError: 
b'\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\[979 chars]\x00' != b'The 
quick fox jumps over a lazy dog\n'
11:05:44 ERROR|
11:05:44 DEBUG| Local variables:
11:05:44 DEBUG|  -> obj <class 
'machine_s390_ccw_virtio.S390CCWVirtioMachine'>: 
1-S390CCWVirtioMachine.test_s390x_fedora
11:05:44 DEBUG|  -> args <class 'tuple'>: ()
11:05:44 DEBUG|  -> kwargs <class 'dict'>: {}
11:05:44 DEBUG|  -> condition <class 'NoneType'>: None
11:05:44 DEBUG|  -> function <class 'function'>: <function 
S390CCWVirtioMachine.test_s390x_fedora at 0x1030d1990>
11:05:44 DEBUG|  -> message <class 'str'>: Running on GitLab
11:05:44 DEBUG|  -> negate <class 'bool'>: False
11:05:44 ERROR| FAIL 1-S390CCWVirtioMachine.test_s390x_fedora -> 
AssertionError: b'\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\[979 
chars]\x00' != b'The quick fox jumps over a lazy dog\n'
11:05:44 INFO |

IIUC Cleber should post a series soon upgrading the QEMU Avocado
framework to use the 'new' runner.

