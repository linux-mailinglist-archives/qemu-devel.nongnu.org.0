Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 307A4694274
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 11:12:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVp2-0007xH-GJ; Mon, 13 Feb 2023 05:12:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRVoo-0007c4-Nf
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 05:12:20 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRVok-0003kC-Dc
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 05:12:17 -0500
Received: by mail-wr1-x431.google.com with SMTP id o15so8240586wrc.9
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 02:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K2hibvpiLHVEpfVQdlQcSMJSIPHHnaEFPTuotKSTueE=;
 b=wwNuAZoUz6ZrfdsE+lGgeRBrG1hkRVca+c+vyIaCWFXEIYE0+vexAMA0BDHCFJrly2
 x0737YKlNumiO8YWlSjcHzKJXGIO57InTTbl4ZTXhkp3Qw7rbnzGwKZEhnDKXCPt42t9
 mhF03gznwfLVR+twxaedPszoKdG0mXbMcKN291EBebiYR7P4u9sRtiDXjsa1pnLPV/Cf
 12RGvEqxaFrkVi0wPxzCTaz36fIFsCofNtvLEzI3wkiEYqNjECy5MKfPr4IoWYGovgLC
 pjRyW5L0unSIPZXPM0511szUMD1Ff8sMB6WgOI1r3rO9qileu1+ONjxiQ0XP8KQzF7X6
 tkxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K2hibvpiLHVEpfVQdlQcSMJSIPHHnaEFPTuotKSTueE=;
 b=DQQcz2vkzRh42DV6L6zeK58DptJx8GyzWGumyiM4Elf4TsSG7En/iNdiHwoQV2AfYi
 Mc9chHA5S04vQPQ6OaqteWZ8AM0mAa14n7NsYa7WfC8tpSUG0056jw309mVF1+6R1vU0
 ElnpilC4WigY3ji9+5gFCyw6VLc8/2s98Np8KIMcg8yG54oVHFpwi4EIdb9jVtS956pG
 qESa7wJGul8OCP8fu6OEdvgeUtdSpgt7rfXggm7TxQz36O+99cvXv7s61HpTdOeNHwP6
 I9n+1ZcK5FFhLPUXzP+lrnlqLDNsi1tw21S1Iz9/CfA0Nzt3TF9YRPtqIjOJJ2E1GwAM
 +zmQ==
X-Gm-Message-State: AO0yUKXdBLppG34KT4Wix8sCizOMajdFneB3wod3JxlFoAV375bmP6EH
 l/yJrRg5atO93b1yxfOTxhyGAd6ej1qnPRbI
X-Google-Smtp-Source: AK7set83/vHlZPvTPC72gDvBKlqCyFhl4d9MPVusx7bPAH0SwLHNdnKocSxmPaemWn5zMrYi2hZQYw==
X-Received: by 2002:adf:aa98:0:b0:2c5:4c07:9593 with SMTP id
 h24-20020adfaa98000000b002c54c079593mr7864069wrc.16.1676283129147; 
 Mon, 13 Feb 2023 02:12:09 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h5-20020a5d5045000000b002c54d9fbea5sm5979647wrt.73.2023.02.13.02.12.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 02:12:08 -0800 (PST)
Message-ID: <6870a3fe-384d-c802-0d9b-41a4405176b2@linaro.org>
Date: Mon, 13 Feb 2023 11:12:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v2 08/19] hw/net/eepro100: Introduce TYPE_EEPRO100 QOM
 abstract parent
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Li Qiang <liq3ea@163.com>, qemu-s390x@nongnu.org,
 Hu Tao <hutao@cn.fujitsu.com>, Gonglei Arei <arei.gonglei@huawei.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, xiaoqiang zhao <zxq_yx_007@163.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>, Jason Wang <jasowang@redhat.com>
References: <20230213070820.76881-1-philmd@linaro.org>
 <20230213070820.76881-9-philmd@linaro.org>
 <a39dff9f-d205-a381-0d75-54d191f93320@linaro.org>
In-Reply-To: <a39dff9f-d205-a381-0d75-54d191f93320@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.348,
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

On 13/2/23 09:36, Philippe Mathieu-Daudé wrote:
> On 13/2/23 08:08, Philippe Mathieu-Daudé wrote:
>> Have all the EEPRO100-based devices share a common (abstract)
>> QOM parent.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/net/eepro100.c | 40 ++++++++++++++++++++++++++--------------
>>   1 file changed, 26 insertions(+), 14 deletions(-)
>>
>> diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
>> index dc07984ae9..dac42ba17b 100644
>> --- a/hw/net/eepro100.c
>> +++ b/hw/net/eepro100.c
>> @@ -235,8 +235,14 @@ typedef enum {
>>       ru_ready = 4
>>   } ru_state_t;
>> -typedef struct {
>> +#define TYPE_EEPRO100 "eepro100"
>> +OBJECT_DECLARE_SIMPLE_TYPE(EEPRO100State, EEPRO100)
> 
> Self-NACK, I'll respin also introducing EEPRO100Class for completeness.

Respin posted here:
https://lore.kernel.org/qemu-devel/20230213101048.94519-1-philmd@linaro.org/

