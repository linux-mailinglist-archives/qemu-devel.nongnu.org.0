Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4016840C632
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 15:20:22 +0200 (CEST)
Received: from localhost ([::1]:59216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQUpo-0003Ov-IH
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 09:20:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQUn0-00015p-AX; Wed, 15 Sep 2021 09:17:26 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:55317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQUmy-0003FN-Jw; Wed, 15 Sep 2021 09:17:26 -0400
Received: from [192.168.100.1] ([82.142.27.6]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M9Fvl-1mWFwX1zD5-006QmR; Wed, 15 Sep 2021 15:17:18 +0200
Subject: Re: [PATCH] qdev: Complete qdev_init_gpio_out() documentation
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20210819142731.2827912-1-philmd@redhat.com>
 <87k0k0bl1a.fsf@dusky.pond.sub.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <8b99601c-dc2b-7489-e500-aad5b5a8c0a4@vivier.eu>
Date: Wed, 15 Sep 2021 15:17:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87k0k0bl1a.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:BO36pgz7ix95R/JP8o6m/w0FDZxsbyV7KnYSBNyB9vbs+B7X2Lw
 +br5LMwCpZzvfP7KVD5qeuDWcR3RmwccYG8F9NlxU3/dlrKk8YiKD/hpQTtoRc508YLKJfi
 AzzqwgZ1FRo87O/z8a9LwH9pyRby8JGzV+dVyQjY46m18NJzWylYNRHmTg4eKcWXs+Tq9kZ
 je/Lel+HdQcUlnLpJdaJA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VwdTCwp9EL8=:B26kYXWejYovSvxKgGMraI
 7lXDR/0LHE3Xz7GyMd58Vtdv/YviNxd9WwwO/Ou+c7RLy8K90YoP7kDJnYowL1ldt8fnpnV5e
 9WEXbx+R8Fhfr/0cNX++XsPS3zIA6NU0IPLOtaYn++sSowFpKCdDR20+hoBU+jkU8dVEPSRg1
 PrcguGY7eGBIVhURiM625/lWYRC9E15Xx3nVdXKH7CIOAcjOitDfTWQ8TBCldkHq9mbijmpOh
 RGHxqEEEH08s4QK2mOLRQAe0f/ba9MKZCg5kODGUHLlGRtMCSGloCucfaTV0i/4h+bWL10aSX
 hCY589vXa1ZBI1+kqMScved2F0RBzZHuT17Bpms8J8SVWy7RnViDag4GXNw1tiFLfGPocCVHb
 5YLg228qxQh5VUEmZaygtm/1Gc4b9RN9TgLVo0iYi2ZZR0vOFgUtGKZx8VtCNFqkTfSYdrupt
 nWUnn6FllZ6uOKuYA7q47qixCtCisPg+XR/93kt5YvItEGzyrCmjq3Gl99Ts1CYX1I+XCs/EL
 /iQy02jbVGZQjIUX1XqQek1AziOO22gk+D3k4b2287W0P6o11f036aVEJYvvVGwMJrgbMd6d5
 NJGBJbFwYOOlitaa9XEAJFtZy2RO8Qq5erJXQfnkr4UI9JI9mfjU9MEBezJiaq+lV59wjoEnZ
 sC24vAWxcEKCxK7IvWwsNCUcAGnWjJR0BaAFN9Asq0mm1lefYicAtaFMBqSAFFkh0ZKKRGx6c
 IElaR5SyXtLlLPWvCdLLstv0gGAMmVH3mh5vsA==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.698,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 01/09/2021 à 13:19, Markus Armbruster a écrit :
> Cc: qemu-trivial
> 
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
>> qdev_init_gpio_out() states it "creates an array of anonymous
>> output GPIO lines" but doesn't document how this array is
>> released. Add a note that it is automatically free'd in qdev
>> instance_finalize().
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  include/hw/qdev-core.h | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
>> index bafc311bfa1..555d4e444a5 100644
>> --- a/include/hw/qdev-core.h
>> +++ b/include/hw/qdev-core.h
>> @@ -597,6 +597,10 @@ void qdev_init_gpio_in(DeviceState *dev, qemu_irq_handler handler, int n);
>>   *
>>   * See qdev_connect_gpio_out() for how code that uses such a device
>>   * can connect to one of its output GPIO lines.
>> + *
>> + * There is no need to release the @pins allocated array because it
>> + * will be automatically released when @dev calls its instance_finalize()
>> + * handler.
>>   */
>>  void qdev_init_gpio_out(DeviceState *dev, qemu_irq *pins, int n);
>>  /**
> 
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

