Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C89876BF4CE
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 23:01:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdI79-0001Oa-1A; Fri, 17 Mar 2023 17:59:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pdI76-0001ON-Cm
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 17:59:52 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pdI74-0006OA-IL
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 17:59:52 -0400
Received: by mail-ed1-x52d.google.com with SMTP id r11so25647646edd.5
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 14:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679090389;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=As7bOLl4exKGDl7OT2hieogKWnIdq1FxG+h1J5O0ago=;
 b=eAywmJauXm5PFJbuqQe0SXJwoBszOqd+PRWs7FMcBNgPuXsAEda8PZQA0XuDQcIdE7
 DzmumPhJGOe6rBl0A1T67fMZ/VFaFmuYRJw+ta6hY3R48/n5PkfIt77sdXwEdr6agUKM
 9nCtfIpxVa6ezQDNtCGIyalvrfLtgO8qmT3pgBNr9JN4b40sDGbv0dcek4R9vc9Fz5pT
 TRrMTxUwTCBBrBvUoTTLwtpxwE4BHwGwnPWgcZBc29o10TxxAu9chvg5BsioGMxR+xbk
 L3VEYmi9AsPclXZsh9XWG3COUhJ8Hzs8JJ1QU0gD6VZFlyhUAWkruwUMWuNNBhKNPSf+
 1FCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679090389;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=As7bOLl4exKGDl7OT2hieogKWnIdq1FxG+h1J5O0ago=;
 b=J3NE4nbxUNsxWAYX766Bg+pNpiIRbvg1Vw//nN0SYnzamUytGiWnvfPWcDqDtMUP/y
 uY5DbnudIXYGSs5c+cwl52BAHWlJKNRIYjQsntnIu4ePPlGbKv6Qfu+xHK+adPDdM+38
 bF3jl0SfhCeE8OlsPq+oiAjuWz5Cd7I5jy3wHiT+KaBLg2VGsl09824cnsImqfB82CgJ
 nGmDUAK58KIvwUbpRSM7aKVXkY3vp+lvKmM1rKQ/FVhqHPhAZjDojaT+bU2KxddwgfSX
 qTjbO7vTeJxRgW9zUChQ432UE2mZRL56LVp5+YYzD3YLC0moHjzAcaaKmALbFdNDDyNC
 y3yg==
X-Gm-Message-State: AO0yUKVPP8LounLmbapXki7K1MkpFZD6qnH6fuQXnR7isbQLhBn7VJUq
 F98PfLV1PEhjWHUdHUqI4mEBAA==
X-Google-Smtp-Source: AK7set/e/65Hm+VbbwsAFUt58fkpVsS15Ddi1Ubno4yv6C8ZuT2FbC6iWpQefbsQy9gjGu7TXKzBAA==
X-Received: by 2002:a17:906:3118:b0:92b:6b6d:2daf with SMTP id
 24-20020a170906311800b0092b6b6d2dafmr745785ejx.77.1679090388753; 
 Fri, 17 Mar 2023 14:59:48 -0700 (PDT)
Received: from [192.168.1.101] ([176.187.193.198])
 by smtp.gmail.com with ESMTPSA id
 x21-20020a50d615000000b004bb810e0b87sm1597748edi.39.2023.03.17.14.59.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Mar 2023 14:59:48 -0700 (PDT)
Message-ID: <b84a7f60-f0de-b9e5-254f-3c3c649a08e1@linaro.org>
Date: Fri, 17 Mar 2023 22:59:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] scsi/lsi53c895a: restrict DMA engine to memory regions
 (CVE-2023-0330)
Content-Language: en-US
To: Karl Heubaum <karl.heubaum@oracle.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 "fam@euphon.net" <fam@euphon.net>, "alxndr@bu.edu" <alxndr@bu.edu>,
 "zheyuma97@gmail.com" <zheyuma97@gmail.com>
References: <20230116204232.1142442-1-mcascell@redhat.com>
 <110DADE7-A361-4F53-B735-B926C40C0B9B@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <110DADE7-A361-4F53-B735-B926C40C0B9B@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52d.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 17/3/23 19:18, Karl Heubaum wrote:
> Did this CVE fix fall in the cracks during the QEMU 8.0 merge window?

The patch isn't reviewed, and apparently almost no active contributor
understand this device enough to be sure this security patch doesn't
break normal use. Fuzzed bugs are rarely trivial.

>> On Jan 16, 2023, at 2:42 PM, Mauro Matteo Cascella <mcascell@redhat.com> wrote:
>>
>> This prevents the well known DMA-MMIO reentrancy problem (upstream issue #556)
>> leading to memory corruption bugs like stack overflow or use-after-free.
>>
>> Fixes: CVE-2023-0330
>> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
>> Reported-by: Zheyu Ma <zheyuma97@gmail.com>
>> ---
>> hw/scsi/lsi53c895a.c               | 14 +++++++++----
>> tests/qtest/fuzz-lsi53c895a-test.c | 32 ++++++++++++++++++++++++++++++
>> 2 files changed, 42 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
>> index af93557a9a..89c52594eb 100644
>> --- a/hw/scsi/lsi53c895a.c
>> +++ b/hw/scsi/lsi53c895a.c
>> @@ -446,22 +446,28 @@ static void lsi_reselect(LSIState *s, lsi_request *p);
>> static inline void lsi_mem_read(LSIState *s, dma_addr_t addr,
>>                                 void *buf, dma_addr_t len)
>> {
>> +    const MemTxAttrs attrs = { .memory = true };
>> +
>>      if (s->dmode & LSI_DMODE_SIOM) {
>> -        address_space_read(&s->pci_io_as, addr, MEMTXATTRS_UNSPECIFIED,
>> +        address_space_read(&s->pci_io_as, addr, attrs,
>>                             buf, len);
>>      } else {
>> -        pci_dma_read(PCI_DEVICE(s), addr, buf, len);
>> +        pci_dma_rw(PCI_DEVICE(s), addr, buf, len,
>> +                      DMA_DIRECTION_TO_DEVICE, attrs);
>>      }
>> }
>>
>> static inline void lsi_mem_write(LSIState *s, dma_addr_t addr,
>>                                  const void *buf, dma_addr_t len)
>> {
>> +    const MemTxAttrs attrs = { .memory = true };
>> +
>>      if (s->dmode & LSI_DMODE_DIOM) {
>> -        address_space_write(&s->pci_io_as, addr, MEMTXATTRS_UNSPECIFIED,
>> +        address_space_write(&s->pci_io_as, addr, attrs,
>>                              buf, len);
>>      } else {
>> -        pci_dma_write(PCI_DEVICE(s), addr, buf, len);
>> +        pci_dma_rw(PCI_DEVICE(s), addr, (void *) buf, len,
>> +                      DMA_DIRECTION_FROM_DEVICE, attrs);
>>      }
>> }
>>
>> diff --git a/tests/qtest/fuzz-lsi53c895a-test.c b/tests/qtest/fuzz-lsi53c895a-test.c
>> index 392a7ae7ed..35c02e89f3 100644
>> --- a/tests/qtest/fuzz-lsi53c895a-test.c
>> +++ b/tests/qtest/fuzz-lsi53c895a-test.c
>> @@ -8,6 +8,35 @@
>> #include "qemu/osdep.h"
>> #include "libqtest.h"
>>
>> +/*
>> + * This used to trigger a DMA reentrancy issue
>> + * leading to memory corruption bugs like stack
>> + * overflow or use-after-free
>> + */
>> +static void test_lsi_dma_reentrancy(void)
>> +{
>> +    QTestState *s;
>> +
>> +    s = qtest_init("-M q35 -m 512M -nodefaults "
>> +                   "-blockdev driver=null-co,node-name=null0 "
>> +                   "-device lsi53c810 -device scsi-cd,drive=null0");
>> +
>> +    qtest_outl(s, 0xcf8, 0x80000804); /* PCI Command Register */
>> +    qtest_outw(s, 0xcfc, 0x7);        /* Enables accesses */
>> +    qtest_outl(s, 0xcf8, 0x80000814); /* Memory Bar 1 */
>> +    qtest_outl(s, 0xcfc, 0xff100000); /* Set MMIO Address*/
>> +    qtest_outl(s, 0xcf8, 0x80000818); /* Memory Bar 2 */
>> +    qtest_outl(s, 0xcfc, 0xff000000); /* Set RAM Address*/
>> +    qtest_writel(s, 0xff000000, 0xc0000024);
>> +    qtest_writel(s, 0xff000114, 0x00000080);
>> +    qtest_writel(s, 0xff00012c, 0xff000000);
>> +    qtest_writel(s, 0xff000004, 0xff000114);
>> +    qtest_writel(s, 0xff000008, 0xff100014);
>> +    qtest_writel(s, 0xff10002f, 0x000000ff);
>> +
>> +    qtest_quit(s);
>> +}
>> +
>> /*
>>   * This used to trigger a UAF in lsi_do_msgout()
>>   * https://gitlab.com/qemu-project/qemu/-/issues/972
>> @@ -120,5 +149,8 @@ int main(int argc, char **argv)
>>      qtest_add_func("fuzz/lsi53c895a/lsi_do_msgout_cancel_req",
>>                     test_lsi_do_msgout_cancel_req);
>>
>> +    qtest_add_func("fuzz/lsi53c895a/lsi_dma_reentrancy",
>> +                   test_lsi_dma_reentrancy);
>> +
>>      return g_test_run();
>> }
>> -- 
>> 2.39.0
>>
>>
> 


