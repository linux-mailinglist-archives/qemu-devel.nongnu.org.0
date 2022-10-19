Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C17BA603FE6
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 11:37:39 +0200 (CEST)
Received: from localhost ([::1]:44702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol5W6-0007Al-N8
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 05:37:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ol5To-0005Zx-L2
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 05:35:16 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ol5Tl-0003In-UT
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 05:35:15 -0400
Received: by mail-wr1-x42a.google.com with SMTP id bk15so28099858wrb.13
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 02:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Mmy0+hDchFgFmmRV39hoqFtCq/TcMPoAW33R1sFbDcE=;
 b=enOrzfOmZbQoDWh/67afBpHAtlJ5mPK8oBhyQUcddlgPW28YnpSVajjldISAcv8X+S
 skygK2tnGb5dWuAmtagusntVJGpjY+fT1HiNcbB4/v279VhY2O6VfljSotZ7BBttdkhi
 KBpn7OWusJzqhI+cpw4wFy2QuJgelk2Bi5lqvbjVr82a6SH0D3ia5CyvgEa5UkPX3Gie
 B1As1QC4Fsi3/VLCsvTzW5nXoFw+CPPw2marmxeDNZYb2owDGdC6o7OHHTqYnUE0BB4y
 CkI3OV0ZjdTEPOxBI+jKThLJLxXsnHDdAeHPhV/Gz5xn3yaFOE39dNTruLO0LHEiugp5
 B6ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mmy0+hDchFgFmmRV39hoqFtCq/TcMPoAW33R1sFbDcE=;
 b=PKiGB+/a/XBRkjavpBic222qc2q5CMOqON/kkzn4ArTMJHzSqUTmEdIaghAvLnVcBV
 Xe0BSZC/hHqbITot2OWrj7ISryqhuHDP2iRbZCUz5gu6+yaf8zcrUH+tg0Ejd6eAxPz/
 L2UiFm1luWR2Kj0JBVGyG52VCDw9mfTezjImB8tZaKo5Otwk+815daJxKJNgwB2oxDwD
 DyCtHtIVP357mW1HkmBtUv+t0VWVnKLw/rZvZTL56gdb7HDEgvXM2e0F/Amcb8QmI7Ci
 4l1be1dFOfkO7K/ksBeNfhDH6bjKEV0MxIQ5+CkBNHQtBemZQHwumXz7y9ATeHxVUcXc
 xcbQ==
X-Gm-Message-State: ACrzQf0TDUBNyBXcdQ5JFAlWPSzTOjowSNLC7acgahkzZDtVQwNRzzWm
 5jr0diytOSkrIbvhsF70Sg0/zw==
X-Google-Smtp-Source: AMsMyM6F7yVVxGnno2P2z80kfYjek5T9Q+DoFlxW7RNZVUyStn1zTRcXR0bmkJSzavVA+qtb8f266g==
X-Received: by 2002:a5d:52cb:0:b0:21a:3cc5:f5f4 with SMTP id
 r11-20020a5d52cb000000b0021a3cc5f5f4mr4516984wrv.367.1666172111749; 
 Wed, 19 Oct 2022 02:35:11 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 c25-20020a7bc019000000b003c6b874a0dfsm19434513wmb.14.2022.10.19.02.35.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 02:35:11 -0700 (PDT)
Message-ID: <297ffc66-9d0a-37c7-f700-cea17ecd5707@linaro.org>
Date: Wed, 19 Oct 2022 11:35:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v5 08/10] acpi/tests/avocado/bits: add acpi and smbios
 avocado tests that uses biosbits
To: Ani Sinha <ani@anisinha.ca>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Maydell Peter
 <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Igor Mammedov <imammedo@redhat.com>,
 Michael Tsirkin <mst@redhat.com>, qemu-devel@nongnu.org
References: <20221019025828.683113-1-ani@anisinha.ca>
 <20221019025828.683113-9-ani@anisinha.ca>
 <CAARzgwz6DwgfOcyq9fFitu7SKUfx6xz_WUiYj8pkP0wmeT=UZQ@mail.gmail.com>
 <CAARzgwyRwh-fYuUTNjOgoRzjf4UZbAVCxJvSGzf4b-2jmqq=cQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAARzgwyRwh-fYuUTNjOgoRzjf4UZbAVCxJvSGzf4b-2jmqq=cQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 19/10/22 10:31, Ani Sinha wrote:
> On Wed, Oct 19, 2022 at 11:59 AM Ani Sinha <ani@anisinha.ca> wrote:
>> On Wed, Oct 19, 2022 at 8:29 AM Ani Sinha <ani@anisinha.ca> wrote:
>>>
>>> This introduces QEMU acpi/smbios biosbits avocado test which is run
>>> from within the python virtual environment. When the bits tests are run, bits
>>> binaries are downloaded from an external repo/location, bios bits iso is
>>> regenerated containing the acpi/smbios bits tests that are maintained as a part
>>> of the QEMU source under tests/avocado/acpi-bits/bits-test . When the VM is
>>> spawned with the iso, it runs the tests in batch mode and the results are pushed
>>> out from the VM to the test machine where they are analyzed by this script and
>>> pass/fail results are reported.
>>>
>>> Cc: Daniel P. Berrangé <berrange@redhat.com>
>>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>>> Cc: Maydell Peter <peter.maydell@linaro.org>
>>> Cc: John Snow <jsnow@redhat.com>
>>> Cc: Thomas Huth <thuth@redhat.com>
>>> Cc: Alex Bennée <alex.bennee@linaro.org>
>>> Cc: Igor Mammedov <imammedo@redhat.com>
>>> Cc: Michael Tsirkin <mst@redhat.com>
>>> Signed-off-by: Ani Sinha <ani@anisinha.ca>
>>> ---
>>>   tests/avocado/acpi-bits.py | 363 +++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 363 insertions(+)
>>>   create mode 100644 tests/avocado/acpi-bits.py

>>> +import logging
>>> +import os
>>> +import re
>>> +import shutil
>>> +import subprocess
>>> +import tarfile
>>> +import tempfile
>>> +import time
>>> +import zipfile
>>> +from typing import (
>>> +    List,
>>> +    Optional,
>>> +    Sequence,
>>> +)
>>> +from qemu.machine import QEMUMachine
>>> +from avocado import skipIf
>>> +from avocado_qemu import QemuBaseTest

>>> +@skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
>>> +class AcpiBitsTest(QemuBaseTest): #pylint: disable=too-many-instance-attributes
>>> +    """
>>> +    ACPI and SMBIOS tests using biosbits.
> 
>   <snip>
> 
>>> +
>>> +    def setUp(self): # pylint: disable=arguments-differ
>>> +        super().setUp('qemu-system-')
>>> +
>>> +        if shutil.which('xorriso') is None:
>>> +            logging.error('xorriso is required to run this test.')
>>> +            self.skipTest("xorriso is not installed. Please install it.")
>>
>> This would result in output like this when xorriso is not found:
>>
>> $ which xorriso
>> /usr/bin/which: no xorriso in
>> (/home/anisinha/.local/bin:/home/anisinha/bin:/usr/share/Modules/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin)
>> [anisinha@centos8 build]$ ./tests/venv/bin/avocado run -t acpi tests/avocado
>> Fetching asset from
>> tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits
>> JOB ID     : 95aba043201755ed888ef7d1598402c555118df4
>> JOB LOG    : /home/anisinha/avocado/job-results/job-2022-10-19T02.27-95aba04/job.log
>>   (1/1) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits:
>> ERROR: xorriso is not installed. Please install it. (0.00 s)

If an optional tool is missing, the test should be SKIPped, this is not 
an ERROR.

>> RESULTS    : PASS 0 | ERROR 1 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0
>> | CANCEL 0
>> JOB TIME   : 0.61 s
>>
>>
> 
> skipIf() was not working for me, hence I had to resort to this. I got
> skipIf() working now so in v6 I will remove the above hunk and add the
> conditional as @skipIf decorator.
> 
> For the records,
>> @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
> does not work for me.
>> @skipIf(os.getenv('GITLAB_CI') is not None, 'Running on GitLab')
> works.
> A quick grep indicates that the former is used all over the place!

Because @skipIf works (at least as a class decorator).

Maybe something is missing on your side? Look at the
tesseract_available() example:

$ git grep tesseract_available
tests/avocado/machine_m68k_nextcube.py:14:from tesseract_utils import 
tesseract_available, tesseract_ocr
tests/avocado/machine_m68k_nextcube.py:58: 
@skipUnless(tesseract_available(3), 'tesseract v3 OCR tool not available')
tests/avocado/machine_m68k_nextcube.py:70: 
@skipUnless(tesseract_available(4), 'tesseract v4 OCR tool not available')
tests/avocado/tesseract_utils.py:14:def 
tesseract_available(expected_version):

> $ grep GITLAB_CI *
> grep: acpi-bits: Is a directory
> acpi-bits.py:@skipIf(os.getenv('GITLAB_CI') is not None, 'Running on GitLab')
> grep: avocado_qemu: Is a directory
> boot_linux.py:    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
> intel_iommu.py:@skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
> linux_initrd.py:    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
> machine_aspeed.py:    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
> machine_aspeed.py:    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
> machine_mips_malta.py:    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
> machine_mips_malta.py:    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
> machine_rx_gdbsim.py:    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
> machine_rx_gdbsim.py:    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
[...]

