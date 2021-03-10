Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8EE333894
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 10:20:38 +0100 (CET)
Received: from localhost ([::1]:40086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJv1B-00056E-Ks
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 04:20:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJuyl-0004OF-B1; Wed, 10 Mar 2021 04:18:07 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:38038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJuyj-00005Z-RQ; Wed, 10 Mar 2021 04:18:07 -0500
Received: by mail-ed1-x535.google.com with SMTP id m9so26925934edd.5;
 Wed, 10 Mar 2021 01:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tMkseT58JlbgdbLf9R29Egw9XG+FKOftPIDYso044tI=;
 b=XAfhpOXRcquVtbGxn6WPyQ0ObkWMgYtIpZGLNiXiiPWa+zllygsG7U9sNHoNc/M7Ab
 vdsU8T0nWz6KUmERDPemHpYIhTr6LyC61I7LytMQqKwlHshbYsNw2veEUOE/YWkzMS+V
 KqrjEchgLp9gfyRKbKkdKR/E/rPpMXmc415RwSP6LeyghC8UgBYm0HXceaIYAXFaTvM/
 6SK7RKgrzVBPwgebbjhJFVOm0m/zI+85vgwK0M45ucCKe8u9anwD5DY/C/5UA0Si2BCE
 v764ZUU1W1GkXR+kLOmSBAuwd0sbKeKI4aVKvxpXm3qUEyUOqpWYRoibBDAsH0VT0Q/A
 Vjmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tMkseT58JlbgdbLf9R29Egw9XG+FKOftPIDYso044tI=;
 b=VKDYT6fEV2Tl5dPxMpAIA/G9XrP5B+TZe26fN+sfB1BIUYkt5t2fCvVUumJ/VxHFv0
 VxxBChN0ApvWt/Cl/QnsorF29sdNLA4ZGCG+qbbXdAqvqmp4wOHxzBdwWfV66sY3WMwf
 r25RCQb8bBQMq1f3MY9+hZn0+5fFdBHwxMKhdLVmwSsyqIIWurYdvrKSNUbKqCD77Pei
 RZ5CTYgTryDRQ1a0TnceHAPzIwPQs822EU2IJNr85CpSzjXT8qRuTWQSDuGqgiCgb8BI
 V6AEqRkI6PO+0D4z9GhlzpUOzdo6Up7DxuNjM6I+UZpogpLZU6eeQIH+H6iDlvK29HbZ
 n4pA==
X-Gm-Message-State: AOAM531nr4raP9Acxoyp0YWxy5aT9BObnPfExUAKK0eiVlEXwItP8bEa
 pB0URByWc5RDr0+byVvldMY=
X-Google-Smtp-Source: ABdhPJyzSCdmu+XyNDPxnreKQ7X9nnc/B3njyFkZH3fdEfRATavmDmmdrNj3dHmzKf9KiJjepJANrQ==
X-Received: by 2002:aa7:db95:: with SMTP id u21mr2180545edt.152.1615367883987; 
 Wed, 10 Mar 2021 01:18:03 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id q1sm9547938ejt.65.2021.03.10.01.18.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 01:18:03 -0800 (PST)
Subject: Re: [PATCH v2] tests/acceptance: Add bFLT loader linux-user test
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210214194524.768660-1-f4bug@amsat.org>
 <f3d3ab84-3008-b90c-1b9d-c282429496da@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7487c29b-ea70-7016-2fa6-946c58afc92e@amsat.org>
Date: Wed, 10 Mar 2021 10:18:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <f3d3ab84-3008-b90c-1b9d-c282429496da@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/21 10:14 AM, Thomas Huth wrote:
> On 14/02/2021 20.45, Philippe Mathieu-Daudé wrote:
>> Add a very quick test that runs a busybox binary in bFLT format:
>>
>>    $ avocado --show=app run -t linux_user tests/acceptance/load_bflt.py
>>    JOB ID     : db94d5960ce564c50904d666a7e259148c27e88f
>>    JOB LOG    :
>> ~/avocado/job-results/job-2019-06-25T10.52-db94d59/job.log
>>     (1/1) tests/acceptance/load_bflt.py:LoadBFLT.test_stm32: PASS
>> (0.15 s)
>>    RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 |
>> INTERRUPT 0 | CANCEL 0
>>    JOB TIME   : 0.54 s
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> Based-on: <20210214175912.732946-1-f4bug@amsat.org>
>>    tests/acceptance: Extract QemuBaseTest from Test
>>    tests/acceptance: Make pick_default_qemu_bin() more generic
>>    tests/acceptance: Introduce QemuUserTest base class
>> ---
>>   tests/acceptance/load_bflt.py | 51 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 51 insertions(+)
>>   create mode 100644 tests/acceptance/load_bflt.py

>> +class LoadBFLT(QemuUserTest):
>> +
>> +    def extract_cpio(self, cpio_path):
>> +        """
>> +        Extracts a cpio archive into the test workdir
>> +
>> +        :param cpio_path: path to the cpio archive
>> +        """
>> +        cwd = os.getcwd()
>> +        os.chdir(self.workdir)
>> +        with bz2.open(cpio_path, 'rb') as archive_cpio:
>> +            subprocess.run(['cpio', '-i'], input=archive_cpio.read(),
>> +                           stderr=subprocess.DEVNULL)
>> +        os.chdir(cwd)
>> +
>> +    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted
>> code')
> 
> Can we assume that cpio is always available? Otherwise this needs a
> skipUnless check for has_cmd('cpio' ...).

Good point! Thanks for having a look,

Phil.

