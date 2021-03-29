Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4609434C47C
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 09:04:56 +0200 (CEST)
Received: from localhost ([::1]:44316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQlxH-0003KL-9i
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 03:04:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lQlvQ-0002s8-Sk
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 03:03:00 -0400
Received: from mx2.suse.de ([195.135.220.15]:43108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lQlvP-0004QT-EV
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 03:03:00 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2752EB025;
 Mon, 29 Mar 2021 07:02:58 +0000 (UTC)
Subject: Re: [RFC v12 40/65] tests/qtest: skip bios-tables-test
 test_acpi_oem_fields_virt for KVM
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-41-cfontana@suse.de>
 <be6e704a-8c61-052a-daaf-deddd683c6cc@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <4d052899-9645-d98b-50d2-17d91271bc39@suse.de>
Date: Mon, 29 Mar 2021 09:02:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <be6e704a-8c61-052a-daaf-deddd683c6cc@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/28/21 7:21 PM, Richard Henderson wrote:
> On 3/26/21 1:36 PM, Claudio Fontana wrote:
>> test is TCG-only.
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   tests/qtest/bios-tables-test.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
>> index e020c83d2a..bd7b85909c 100644
>> --- a/tests/qtest/bios-tables-test.c
>> +++ b/tests/qtest/bios-tables-test.c
>> @@ -1488,6 +1488,13 @@ static void test_acpi_oem_fields_virt(void)
>>       };
>>       char *args;
>>   
>> +#ifndef CONFIG_TCG
>> +    if (data.tcg_only) {
>> +        g_test_skip("TCG disabled, skipping ACPI tcg_only test");
>> +        return;
>> +    }
>> +#endif /* CONFIG_TCG */
> 
> Why is this an ifdef and not tcg_enabled()?

We want to launch this whenever TCG is compiled in.

> We're using kvm_enabled() elsewhere...

where?


> 
> 
> r~
> 



