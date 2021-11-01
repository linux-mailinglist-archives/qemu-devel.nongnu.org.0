Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE6D442397
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 23:48:57 +0100 (CET)
Received: from localhost ([::1]:57396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhg6q-0005K8-E4
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 18:48:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhfzZ-0007DE-UB; Mon, 01 Nov 2021 18:41:29 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:39726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhfzX-0003yG-MG; Mon, 01 Nov 2021 18:41:25 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 b2-20020a1c8002000000b0032fb900951eso353170wmd.4; 
 Mon, 01 Nov 2021 15:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YCDN8hX0eJ9691xshWbdNdL9gWLZu+BIoeWwjTQ1UCk=;
 b=awy/se/RCEymyzTaJQIl2evv0jqUCnZTe91gL3krnjLuLNNwBfjOr9/V09AA8DAhRL
 yfJBy+UQaeTaOdCh4gibSFLz2hpfZ0WLOQVukmDh1JNKsQnQ9DLmSfQZrH/UqCGCQyzR
 SbxdtDrOsAHH2PMmIk8sOAUykMlnKOca5wR1aL5MnL0eOQfrhxa35jDURyjoNYrXB582
 UH0v7YFAb19NqAj2A3rKZcx19oOpMX+b8qED5MJYMgYm6mHtJkn2n70GBNyZbRTYsUbq
 8wxhvl6sXwRJmGITIu1UPhlRyzD/P2AqU+0LdjLtC5IoKPKeY+mlBVyXAtu/B2EBwswQ
 vjHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YCDN8hX0eJ9691xshWbdNdL9gWLZu+BIoeWwjTQ1UCk=;
 b=GWFKBeLKTO30iDbLmVNoPq5s/ZsLhI+NkDiddmxDFpvKAkGvYNAdqRIWPqTlPY0tWO
 jcsoNx5TC45UUm8bvVE26YW1wRuXld14eqYbuJ+G9Shjlh5mKJ1Tp4MKgbk6w/GkH8x9
 Vho2uPoIKFywh+xs8386iiwPuSWfhQOkcVt+fgjC1A0FsLUHtbgg8eOamtic26V0Cx+U
 aBI8GsSRyugVGGufyAJd3DrAe2mhBsYlZ/9Czqn5Ehbw+yzhwet1ouSFmLlQeGOcZFhL
 FBBP+w3IUw89wJfrIu1LnQIdWNK0miDKmmVwhe6au2UObvTv9kGpUfjDlgDurgTt+Oen
 jRfA==
X-Gm-Message-State: AOAM530Zod7n75qus37+eDyIRfuudfbcxdsbpAP+3ngg1S9BAR/PmYAr
 04NeluM9MwmrgzK7/9yzzXU=
X-Google-Smtp-Source: ABdhPJzr8igDmSHadr3AxamGZsmUIqhKANzoILc66cBQQK7KvNqNAEweX8rhTAnRhnAyZ/yxV2dYsA==
X-Received: by 2002:a1c:7c02:: with SMTP id x2mr2047337wmc.165.1635806481074; 
 Mon, 01 Nov 2021 15:41:21 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id n8sm14256355wrp.95.2021.11.01.15.41.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 15:41:20 -0700 (PDT)
Message-ID: <481299ee-a0db-1b2c-1ef3-e25d8a7bba38@amsat.org>
Date: Mon, 1 Nov 2021 23:41:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 1/6] tests/acceptance: Extract QemuBaseTest from Test
Content-Language: en-US
To: Willian Rampazzo <wrampazz@redhat.com>
References: <20210927163116.1998349-1-f4bug@amsat.org>
 <20210927163116.1998349-2-f4bug@amsat.org>
 <CAKJDGDZ0S1f26T3J6ajJ++5cGBNCQveisVvqf2WhXCy8EPsnCA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <CAKJDGDZ0S1f26T3J6ajJ++5cGBNCQveisVvqf2WhXCy8EPsnCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.14,
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
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, Warner Losh <imp@bsdimp.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/1/21 19:01, Willian Rampazzo wrote:
> On Mon, Sep 27, 2021 at 1:31 PM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> The Avocado Test::fetch_asset() is handy to download artifacts
>> before running tests. The current class is named Test but only
>> tests system emulation. As we want to test user emulation,
>> refactor the common code as QemuBaseTest.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  tests/acceptance/avocado_qemu/__init__.py | 72 +++++++++++++----------
>>  1 file changed, 41 insertions(+), 31 deletions(-)
>>
>> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
>> index 2c4fef3e149..8fcbed74849 100644
>> --- a/tests/acceptance/avocado_qemu/__init__.py
>> +++ b/tests/acceptance/avocado_qemu/__init__.py
>> @@ -175,7 +175,7 @@ def exec_command_and_wait_for_pattern(test, command,
>>      """
>>      _console_interaction(test, success_message, failure_message, command + '\r')
>>
>> -class Test(avocado.Test):
>> +class QemuBaseTest(avocado.Test):
>>      def _get_unique_tag_val(self, tag_name):
>>          """
>>          Gets a tag value, if unique for a key
>> @@ -185,6 +185,46 @@ def _get_unique_tag_val(self, tag_name):
>>              return vals.pop()
>>          return None
>>
>> +    def setUp(self):
>> +        self.arch = self.params.get('arch',
>> +                                    default=self._get_unique_tag_val('arch'))
>> +
>> +        self.cpu = self.params.get('cpu',
>> +                                   default=self._get_unique_tag_val('cpu'))
>> +
>> +        default_qemu_bin = pick_default_qemu_bin(arch=self.arch)
>> +        self.qemu_bin = self.params.get('qemu_bin',
>> +                                        default=default_qemu_bin)
>> +        if self.qemu_bin is None:
>> +            self.cancel("No QEMU binary defined or found in the build tree")
>> +
>> +    def fetch_asset(self, name,
>> +                    asset_hash=None, algorithm=None,
>> +                    locations=None, expire=None,
>> +                    find_only=False, cancel_on_missing=True):
>> +        return super(QemuBaseTest, self).fetch_asset(name,
> 
> It is preferable to use the PEP3135
> (https://www.python.org/dev/peps/pep-3135/) when calling `super` as
> linter are complaining about it:
> 
> return super().fetch_asset(name,
> 
> And after reading through the patch I noticed it was a method move,
> so, feel free to take the suggestion or ignore it for now.

This series was sent before commit  14f02d8a9ec ("Merge
'integration-testing-20210927' into staging") :/

I'll modify, thanks.

