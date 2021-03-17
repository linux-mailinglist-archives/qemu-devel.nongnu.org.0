Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B8633F123
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 14:27:09 +0100 (CET)
Received: from localhost ([::1]:58136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMWCa-0000PG-Q1
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 09:27:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMWBk-00081X-1u
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 09:26:16 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:40662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMWBi-0006Ez-9x
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 09:26:15 -0400
Received: by mail-wr1-x433.google.com with SMTP id v11so1812123wro.7
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 06:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RWUzQfAiX4FfMvneoGNVU2wKdirvyusjOKqLBANMyKo=;
 b=GRFt0+ckPW+8seQLB+4YYWo0jx1zexQyymRJhhWa7tSKoDPlEMUus6xa1fUW7cplU0
 1cgIo9fz38plYZ1+08M5eItRk7bdOmrZfVmqB1gzcSkte2/OQEoPNa2XU1ObGyKEgSQl
 v3wl8l/3DCXZrfjAt/ZD1QUDARLkdk9uZrP4Q0vjRd/IbIaPjDPD18oM2kh4LaifrQlB
 AgFaX64ArSIlZzclaFvjfAt4cBkkllBQ8n6iVoNbKQCoWoEzJB/ILbRCWQfneZHMvNRm
 Du/d7WqFJTQyzPInmdLdhe3EuvVQc8AZ5WZZRf33PVm3GtLnV0GTRtcI4lkD3h5klnOI
 PrzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RWUzQfAiX4FfMvneoGNVU2wKdirvyusjOKqLBANMyKo=;
 b=ruaDAoKUucFHLhni6sWB4mP/WVrgGBiIbtTTpO3hJLimITpLQZxGLHiAT73TwMbR4H
 nP0t2QcwLfWtbd9nGv6lihd7+5AphOtVU00hJBkr1OTa0NoXrf6Yis+r1XwP+ZDan1Ep
 GJIF8KpL3e3oe1SXjyz2LacVoQe8oFx65mQCmIMol2l3fwJ4vJ0XzwcyJeHomZ1vdBbP
 n5YsdC5Z6FyVcAUtwVhIhGCRaStXRLJvWg25C4MA/ivyJTM/RPik2N2XLCmMvSEoZ51n
 0P13bX85F9EkAg0GZQIt5Q2iq5Qsc6nXGL8ZCygdm+dMDJxGRefWVFC+gg9RCqeuAjxr
 WxOg==
X-Gm-Message-State: AOAM533iSKnbkuDnjb0JGOZp4uM6X2Cb5EF4cfcZ9BL0legdaYGeeJ22
 wCRBQMr//eEou/Hn+6uHqTqTh4xyUiItzA==
X-Google-Smtp-Source: ABdhPJwHhrfzYaPzLTnlY1nlFHn/tSNJC23JYxrm91WgBC0tZ3iJoQ9cJH3j451lNyEw8j7ryAgkPw==
X-Received: by 2002:a05:6000:114e:: with SMTP id
 d14mr4513640wrx.236.1615987572781; 
 Wed, 17 Mar 2021 06:26:12 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id o2sm2442353wmc.23.2021.03.17.06.26.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Mar 2021 06:26:12 -0700 (PDT)
Subject: Re: [PATCH v3 1/5] tests/acceptance: Extract QemuBaseTest from Test
To: Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org
References: <20210315230838.2973103-1-f4bug@amsat.org>
 <20210315230838.2973103-2-f4bug@amsat.org>
 <7d97e67e-e09d-a3cd-8b54-49d7fe51fc15@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f66ad969-2648-b599-f1b5-b9d01e4146ca@amsat.org>
Date: Wed, 17 Mar 2021 14:26:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <7d97e67e-e09d-a3cd-8b54-49d7fe51fc15@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/21 2:08 PM, Wainer dos Santos Moschetta wrote:> On 3/15/21 8:08
PM, Philippe Mathieu-Daudé wrote:
>> The Avocado Test::fetch_asset() is handy to download artifacts
>> before running tests. The current class is named Test but only
>> tests system emulation. As we want to test user emulation,
>> refactor the common code as QemuBaseTest.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   tests/acceptance/avocado_qemu/__init__.py | 23 ++++++++++++++++++++---
>>   1 file changed, 20 insertions(+), 3 deletions(-)
>>
>> diff --git a/tests/acceptance/avocado_qemu/__init__.py
>> b/tests/acceptance/avocado_qemu/__init__.py
>> index df167b142cc..4f814047176 100644
>> --- a/tests/acceptance/avocado_qemu/__init__.py
>> +++ b/tests/acceptance/avocado_qemu/__init__.py
>> @@ -155,7 +155,7 @@ def exec_command_and_wait_for_pattern(test, command,
>>       """
>>       _console_interaction(test, success_message, failure_message,
>> command + '\r')
>>   -class Test(avocado.Test):
>> +class QemuBaseTest(avocado.Test):
> 
> The QemuBaseTest class still defines require_accelerator() which is only
> used by qemu-system tests (thus, it should rather live on the Test
> class). Same thing for self.machine, unless that property is used on
> qemu-user tests.

require_accelerator() has been added recently (efe30d5011b7, 2021-02-03)
and this patch is 2 years old, so I missed that while rebasing.

> 
>>       def _get_unique_tag_val(self, tag_name):
>>           """
>>           Gets a tag value, if unique for a key
>> @@ -188,8 +188,6 @@ def require_accelerator(self, accelerator):
>>                           "available" % accelerator)
>>         def setUp(self):
>> -        self._vms = {}
>> -
>>           self.arch = self.params.get('arch',
>>                                      
>> default=self._get_unique_tag_val('arch'))
>>   @@ -202,6 +200,25 @@ def setUp(self):
>>           if self.qemu_bin is None:
>>               self.cancel("No QEMU binary defined or found in the
>> build tree")
>>   +
>> +    def fetch_asset(self, name,
>> +                    asset_hash=None, algorithm=None,
>> +                    locations=None, expire=None,
>> +                    find_only=False, cancel_on_missing=True):
>> +        return super(QemuBaseTest, self).fetch_asset(name,
>> +                        asset_hash=asset_hash,
>> +                        algorithm=algorithm,
>> +                        locations=locations,
>> +                        expire=expire,
>> +                        find_only=find_only,
>> +                        cancel_on_missing=cancel_on_missing)
> Do you overwrite this fetch_asset() on class Test on purpose? I didn't
> get why fetch_asset() is defined on the classes inherited from
> QemuBaseTest.

No idea. Maybe I had to do that back then, and now it is pointless.
This is why peer-review is helpful :) I'll revisit.

>> +
>> +# a.k.a. QemuSystemTest for system emulation...
> Above comment could become the class docstring.

No, there should be no comment at all. We have to see if we are OK to
rename or not. You suggested this change:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg659843.html
But the there was more discussion and we never agreed on anything.
I don't want to restart doing this change if it is ignored again,
as it was a waste of time.

>> +class Test(QemuBaseTest):
>> +    def setUp(self):
>> +        self._vms = {}
>> +        super(Test, self).setUp()
>> +
>>       def _new_vm(self, *args):
>>           self._sd = tempfile.TemporaryDirectory(prefix="avo_qemu_sock_")
>>           vm = QEMUMachine(self.qemu_bin, sock_dir=self._sd.name)
> 

