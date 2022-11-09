Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA846228E0
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 11:46:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osiZk-0000Wr-Io; Wed, 09 Nov 2022 05:44:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1osiZi-0000Wb-NI
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 05:44:54 -0500
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1osiZh-0000RN-2O
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 05:44:54 -0500
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-13b23e29e36so19176052fac.8
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 02:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EQ9SZhW1p3lMuLJL35PepLbD5BDSFwhPb+5/0uoOFVs=;
 b=Sa+LhwbfSkEy5IgRKk+rkOPTrfn/cnQ89CYWNY0704UB0jnV1fogW4yiQjwg8yxjbi
 E5ukXtS0kKHMGf+zWlM/EUMHxGD6kzv+HGqFLse7dpjFKBgR4YkIfslYupWtjWTnOyvh
 0SRxHpJhcnszEfjmzMo8BMFRYXkjhbq7fs5P5Npap1SxqgZrXpKRtRg8T4AAD4pfw3aM
 bviIb0i18mKAWfRlkp9WW/U6ouCOOXwXDRiLHa4tQ5GRYdrTLkymKWk05dXib4aQhBdZ
 l1LwXQzfErqT0rXpFKe6MB3GrzpuEkP46yepTV/wrY9L4jEKiQjFrOMXLMBbIELqKj3T
 Zvmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EQ9SZhW1p3lMuLJL35PepLbD5BDSFwhPb+5/0uoOFVs=;
 b=DfRkfF//FzCWyt56Fs9PSJUiulUqWkTlZSoJNmZFtSNvEDcSMUM5nJMmimCXH+Uv09
 1L369IJkxlVHMfwnf2ggerkCPSY2xSoD/pENd9i6IBfKWSUxjSAXzP5XKAXApaxxCBGa
 J+QH84akBrdtDP3Nt9hoamvJr3XeiUS+ftBVG8Yn6FG0BfDAkLaaaZHkElpct5j4fIWm
 +A8zgWfrfomxYK/LSAlY4mJt8vMqx/iu1bvkas43HKYL5DQ2+vFqwkGHc5KXh2cx/vrQ
 qaSg+0of1F5/0IaaehRlJw7NYGFesY0mWoZB+m47IoeXBMnfMrqNsw3fZDMmhhL6UJ1h
 eetQ==
X-Gm-Message-State: ACrzQf1yh/k8GyZmLVNcBKavRYvKqGHXUdORf3kw3Z8Ub/OdmpoEm+VF
 53MUjP/Z64N/JBLBU2b75z0=
X-Google-Smtp-Source: AMsMyM61xpZU9FVS3zO0CGR5BhC3YpOUQB5GXJIMliN7yDWCmyuwiYqy0eYXFwxOkbHoy3bcBHAM6w==
X-Received: by 2002:a05:6870:a2ce:b0:131:a8bc:54db with SMTP id
 w14-20020a056870a2ce00b00131a8bc54dbmr36868423oak.187.1667990691743; 
 Wed, 09 Nov 2022 02:44:51 -0800 (PST)
Received: from [192.168.10.102] ([187.34.29.120])
 by smtp.gmail.com with ESMTPSA id
 k15-20020a056870350f00b0010d5d5c3fc3sm5891374oah.8.2022.11.09.02.44.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 02:44:51 -0800 (PST)
Message-ID: <cffa84b3-2532-bc4d-ccb0-78cabfd8aeb0@gmail.com>
Date: Wed, 9 Nov 2022 07:44:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] Revert "hw/block/pflash_cfi0{1, 2}: Error out if device
 length isn't a power of two"
To: Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>
References: <20221108172633.860700-1-danielhb413@gmail.com>
 <3c53ebf8-7be6-7838-63d6-0dc232399669@linaro.org>
 <CAJSP0QUTzpuoMaSn7KvVoNfn0NB_GWmij7VMn2k=Vqu9L6tCgQ@mail.gmail.com>
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <CAJSP0QUTzpuoMaSn7KvVoNfn0NB_GWmij7VMn2k=Vqu9L6tCgQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x31.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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



On 11/8/22 15:13, Stefan Hajnoczi wrote:
> On Tue, 8 Nov 2022 at 13:10, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> On 8/11/22 18:26, Daniel Henrique Barboza wrote:
>>> This commit caused a regression [1] that prevents machines that uses
>>> Open Virtual Machine Firmware (OVMF) to boot.
>>>
>>> This is a long standing behavior with how pflash handles images. More
>>> information about why this happens can be found in [2] and commit
>>> 06f1521795 ("pflash: Require backend size to match device, improve
>>> errors").
>>>
>>> This reverts commit 334c388f25707a234c4a0dea05b9df08d7746638.
>>>
>>> [1] https://gitlab.com/qemu-project/qemu/-/issues/1294
>>> [2] https://lore.kernel.org/qemu-devel/20190308062455.29755-1-armbru@redhat.com/
>>>
>>> Cc: Bernhard Beschow <shentey@gmail.com>
>>> Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> Cc: Stefan Hajnoczi <stefanha@gmail.com>
>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1294
>>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>> ---
>>>    hw/block/pflash_cfi01.c | 8 ++------
>>>    hw/block/pflash_cfi02.c | 5 -----
>>>    2 files changed, 2 insertions(+), 11 deletions(-)
>>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>
>> Thanks, our patches crossed :)
>> https://lore.kernel.org/qemu-devel/20221108175755.95141-1-philmd@linaro.org/

Well of course that we both decided to send the PR almost at the same time :D

>>
>> I'm queuing yours which is first and will amend the description
>> (if you don't disagree).
> 
> I've already applied yours, Philippe, because the description is more
> comprehensive.
> 
> Daniel, thank you for sending your version of the patch!

Thank you Phil for sending the revert and Stefan for quickly queueing
it. The sooner we get rid of the regression the better.


Daniel



> 
> Stefan

