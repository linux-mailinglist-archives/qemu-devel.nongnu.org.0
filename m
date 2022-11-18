Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7264B62EE81
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 08:36:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovvvC-0002r5-Sf; Fri, 18 Nov 2022 02:36:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ovvuG-0002mb-LB
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 02:35:33 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ovvuC-000723-T9
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 02:35:23 -0500
Received: by mail-wr1-x42f.google.com with SMTP id v1so7884704wrt.11
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 23:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9x3aw57bHpLrIFGYlxPif4AzwsedVQK1l7WqxqYWzf0=;
 b=c3Xh0yhfutBq8FhwHo52bvKs4vLtLVegFeCcVLkQcE2VedRn3USvn6Y021aZi50g4Q
 nfLU/8i2ljYyB17Vd99ymZkwkvYcXKL3/5BZ6btUV12TjwyF7jUQptlhXM1u2q0QUT4g
 HA4SeCzCgae199TOIkMR5IeBIqb0aapr+3IofbU5hubI8gKkgsGzem0QZ/8kyOQ8Urca
 rBDmP1YzR5mKn/yb+Yf2HX2t1WsG9K16UVnyRrUuOtgtfBS2C7tr+ba0Lk9CEAxURhiR
 rB2dy6tzMam8pCXNT6oaLhooupnccvhwCEEpHJ9ZulglFyLpQUiczEpvf9ekMmBTpuub
 Pwsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9x3aw57bHpLrIFGYlxPif4AzwsedVQK1l7WqxqYWzf0=;
 b=eL/LNh/RnVUgHe+S6d6T5C+F3iwJrwTaq2Z3QJtZJbgPQnMztO02mY5QO+DPUHLYQ8
 MqT+65RlrzM/O+JN1AskjnkoIKYXw4oH/TMOM1aI90FSobYKpzzVqtEZ0oRYfuu5FOlM
 yZQZXMKCGBtsjpZ81ueUmNE/3LTL4UH0LeQ+c537TfpQsEmeSgbW9Tm/YDKUxjs5fDBi
 tJQLYCzkP0zDJlH+ni30L5PDQCABk+dC6FUaKSOcZUsVoMVhYnECCyXeRDHe7WcFX1ZT
 tDV+yS458Hjo7xI5G/U1s0Selxnd5IMRsbaKtIaRcxLijNdFDelVlDF35cHTF4nIsa89
 MZ4A==
X-Gm-Message-State: ANoB5pmNy4j+GmTpwT0iyXunvWn8mJ89ZGhgqs3ujZo8k1JDnNm4SHQ1
 2K+1hdfRmHQdxriLfsI+XBEfbQ==
X-Google-Smtp-Source: AA0mqf5BN/I4sgAkWdBkFzHzJodRSF2Z6F6KZRc3XDvC/o+A90sAabzAD/nVw0c7KZSZfldGJkdVeA==
X-Received: by 2002:adf:efd2:0:b0:236:e5a2:4f66 with SMTP id
 i18-20020adfefd2000000b00236e5a24f66mr3684011wrp.357.1668756917503; 
 Thu, 17 Nov 2022 23:35:17 -0800 (PST)
Received: from [192.168.230.175] (34.red-88-29-175.dynamicip.rima-tde.net.
 [88.29.175.34]) by smtp.gmail.com with ESMTPSA id
 c18-20020adffb12000000b002365730eae8sm2803212wrr.55.2022.11.17.23.35.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 23:35:16 -0800 (PST)
Message-ID: <6febdfbb-1d13-bbfc-1dc5-4f8fa788fc48@linaro.org>
Date: Fri, 18 Nov 2022 08:35:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v3 1/3] accel: introduce accelerator blocker API
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, kvm@vger.kernel.org
References: <20221111154758.1372674-1-eesposit@redhat.com>
 <20221111154758.1372674-2-eesposit@redhat.com>
 <e8e6fce8-9912-7684-d4c3-c30d731bfcd7@linaro.org>
In-Reply-To: <e8e6fce8-9912-7684-d4c3-c30d731bfcd7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

On 18/11/22 08:32, Philippe Mathieu-Daudé wrote:
> On 11/11/22 16:47, Emanuele Giuseppe Esposito wrote:
>> This API allows the accelerators to prevent vcpus from issuing
>> new ioctls while execting a critical section marked with the

Typo "executing".

>> accel_ioctl_inhibit_begin/end functions.
>>
>> Note that all functions submitting ioctls must mark where the
>> ioctl is being called with accel_{cpu_}ioctl_begin/end().
>>
>> This API requires the caller to always hold the BQL.
>> API documentation is in sysemu/accel-blocker.h
>>
>> Internally, it uses a QemuLockCnt together with a per-CPU QemuLockCnt
>> (to minimize cache line bouncing) to keep avoid that new ioctls
>> run when the critical section starts, and a QemuEvent to wait
>> that all running ioctls finish.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>   accel/accel-blocker.c          | 154 +++++++++++++++++++++++++++++++++
>>   accel/meson.build              |   2 +-
>>   hw/core/cpu-common.c           |   2 +
>>   include/hw/core/cpu.h          |   3 +
>>   include/sysemu/accel-blocker.h |  56 ++++++++++++
>>   5 files changed, 216 insertions(+), 1 deletion(-)
>>   create mode 100644 accel/accel-blocker.c
>>   create mode 100644 include/sysemu/accel-blocker.h
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 


