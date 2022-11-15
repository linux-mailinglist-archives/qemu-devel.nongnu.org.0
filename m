Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC2D6296B6
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 12:04:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1outjI-0004BV-23; Tue, 15 Nov 2022 06:03:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1outit-00049X-TD
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 06:03:29 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1outiq-0008Of-8e
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 06:03:22 -0500
Received: by mail-ej1-x635.google.com with SMTP id f27so35179432eje.1
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 03:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QiKj+ywAfpGLwfNgw76B+sHxnF26cGoUtS63kZZO6MI=;
 b=EKMbVCHJB9tlVOStoOleu0xbLAAOlzRcN6nt1QBKk6WsUl7ved41g025BEVQHQCFdh
 6pFmztSCuoI/Kfcx0TolXzSYBolmu4QtctnMNS8oyppRfUs+AieamWzSyY11luxvF6zh
 WBQhXxsELfCSChMP3Q+X4yKCAjiIcDrJJahvlu3CZI2jdlznEipVFN37WozG4i+2YQ4h
 toLSDvmBUPhuw7hsv1KIY3I2b+o+z5Y6v3Cyqp6R1qU3xMtIVDXYVvm8K6L+S9z6Oc0z
 us3qMx9Ec3gyWeWbVGtm4yMbFtGLi8r3+aJmDpOp3UbzPvqfvBMjdYApSamRFjz1wBzp
 B83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=QiKj+ywAfpGLwfNgw76B+sHxnF26cGoUtS63kZZO6MI=;
 b=Wqu05Ny9V3Nyw4CV40UHMQXo/4zTGKB4gnr2teTioM9xk/hEyG3seGQ1fRA12M+ptq
 P5FDFytPNao07lAT0EM/WItJfvbXUI3hbx0kdn8y914wJBcfxgvAyxh4jEZEJwF1x05T
 ww3X72axVslPnpvzML9D+1Bj98udltew8TdACLktzzP54IXrp84nGTh0uuhfOHAJ0g+I
 euZgN+G3GTWT+YJj13koTml4mLQVPhAynY67gmGxo+NTeQoPrpbyjpOtnoa9iiQWO6Fm
 pVkU+BVwA9aNldc1Z1iUgDAKuUKAuzMXTRoDh7bdupR46kc+mFAo9XUEL2DHGuhWUr74
 qkww==
X-Gm-Message-State: ANoB5pmcCUklpdP1CryahFx5Oa+BEZWqIYnqjQ4zZdn1c5RxQE34W0XD
 LkJ2DskuYEFYY0rfMTmHE9GuAQ==
X-Google-Smtp-Source: AA0mqf7YN8iw6SQ1t8ewLBN6Uji4wQnmhg/pasBpNNJxFQ1gxn8VZna7jIqzRUaNG4zfl0B8GVG6Lw==
X-Received: by 2002:a17:906:9618:b0:7ad:dd43:5d53 with SMTP id
 s24-20020a170906961800b007addd435d53mr12591939ejx.376.1668510197924; 
 Tue, 15 Nov 2022 03:03:17 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 eg25-20020a056402289900b00457b5ba968csm5958444edb.27.2022.11.15.03.03.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Nov 2022 03:03:16 -0800 (PST)
Message-ID: <0245aa92-e9a0-5c1f-cd62-65002ba2ef81@linaro.org>
Date: Tue, 15 Nov 2022 12:03:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Subject: tests/avocado/machine_s390_ccw_virtio: Fedora test failing
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Hi,

As of v7.2.0-rc0 I am getting:

  (101/198) 
tests/avocado/machine_s390_ccw_virtio.py:S390CCWVirtioMachine.test_s390x_fedora: 
FAIL (23.51 s)

$ cat 
test-results/101-tests_avocado_machine_s390_ccw_virtio.py_S390CCWVirtioMachine.test_s390x_fedora/debug.log
01:20:44 INFO | INIT 1-S390CCWVirtioMachine.test_s390x_fedora
01:20:44 DEBUG| PARAMS (key=timeout, path=*, default=120) => 120
01:20:44 DEBUG| Test metadata:
01:20:44 DEBUG|   filename: 
/builddir/qemu/tests/avocado/machine_s390_ccw_virtio.py
01:20:44 DEBUG|   teststmpdir: /tmp/avocado_ccw348hc
01:20:44 DEBUG|   workdir: 
/tmp/tmp2qg0mcch/test-results/tmp_dirkh7k2yra/1-S390CCWVirtioMachine.test_s390x_fedora
01:20:44 INFO | START 1-S390CCWVirtioMachine.test_s390x_fedora
01:20:44 DEBUG| DATA (filename=output.expected) => NOT FOUND (data 
sources: variant, test, file)
01:20:44 DEBUG| PARAMS (key=arch, path=*, default=s390x) => 's390x'
01:20:44 DEBUG| PARAMS (key=cpu, path=*, default=None) => None
01:20:44 DEBUG| PARAMS (key=qemu_bin, path=*, 
default=./qemu-system-s390x) => './qemu-system-s390x'
01:20:44 DEBUG| PARAMS (key=machine, path=*, default=s390-ccw-virtio) => 
's390-ccw-virtio'
01:20:46 DEBUG| QEMUMachine "default" created
01:20:46 DEBUG| QEMUMachine "default" temp_dir: 
/tmp/tmp2qg0mcch/test-results/tmp_dirkh7k2yra/1-S390CCWVirtioMachine.test_s390x_fedora/qemu-machine-da4ubla3
01:20:46 DEBUG| QEMUMachine "default" log_dir: 
/tmp/tmp2qg0mcch/test-results/1-S390CCWVirtioMachine.test_s390x_fedora
01:21:05 INFO | Test whether QEMU CLI options have been considered
01:21:06 INFO | Test screendump of virtio-gpu device
01:21:07 ERROR|
01:21:07 ERROR| Reproduced traceback from: 
/builddir/qemu/tests/venv/lib/python3.10/site-packages/avocado/core/test.py:772
01:21:07 ERROR| Traceback (most recent call last):
01:21:07 ERROR|   File 
"/builddir/qemu/tests/venv/lib/python3.10/site-packages/avocado/core/decorators.py", 
line 90, in wrapper
01:21:07 ERROR|     return function(obj, *args, **kwargs)
01:21:07 ERROR|   File 
"/builddir/qemu/tests/avocado/machine_s390_ccw_virtio.py", line 256, in 
test_s390x_fedora
01:21:07 ERROR|     self.assertEqual(line, b"The quick fox jumps over a 
lazy dog\n")
01:21:07 ERROR|   File 
"/opt/homebrew/Cellar/python@3.10/3.10.8/Frameworks/Python.framework/Versions/3.10/lib/python3.10/unittest/case.py", 
line 845, in assertEqual
01:21:07 ERROR|     assertion_func(first, second, msg=msg)
01:21:07 ERROR|   File 
"/opt/homebrew/Cellar/python@3.10/3.10.8/Frameworks/Python.framework/Versions/3.10/lib/python3.10/unittest/case.py", 
line 838, in _baseAssertEqual
01:21:07 ERROR|     raise self.failureException(msg)
01:21:07 ERROR| AssertionError: 
b'\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\[979 chars]\x00' != b'The 
quick fox jumps over a lazy dog\n'
01:21:07 ERROR|
01:21:07 DEBUG| Local variables:
01:21:07 DEBUG|  -> obj <class 
'machine_s390_ccw_virtio.S390CCWVirtioMachine'>: 
1-S390CCWVirtioMachine.test_s390x_fedora
01:21:07 DEBUG|  -> args <class 'tuple'>: ()
01:21:07 DEBUG|  -> kwargs <class 'dict'>: {}
01:21:07 DEBUG|  -> condition <class 'NoneType'>: None
01:21:07 DEBUG|  -> function <class 'function'>: <function 
S390CCWVirtioMachine.test_s390x_fedora at 0x1063b1990>
01:21:07 DEBUG|  -> message <class 'str'>: Running on GitLab
01:21:07 DEBUG|  -> negate <class 'bool'>: False
01:21:07 ERROR| FAIL 1-S390CCWVirtioMachine.test_s390x_fedora -> 
AssertionError: b'\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\[979 
chars]\x00' != b'The quick fox jumps over a lazy dog\n'

