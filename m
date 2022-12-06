Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B4D6442D1
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 13:01:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2Wd2-0004iU-2i; Tue, 06 Dec 2022 07:00:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2Wcy-0004gp-Eo
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 07:00:48 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2Wcw-0002i6-NN
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 07:00:48 -0500
Received: by mail-wr1-x430.google.com with SMTP id o5so23150723wrm.1
 for <qemu-devel@nongnu.org>; Tue, 06 Dec 2022 04:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ik0ht7odnIzibPDZH+4gXD6VXdvKBxYAd+6/G8QM2wI=;
 b=Y+dxaUBxeWzk5ERMlFpz9IPAFt7WLiuFRHJ2x6YC3xrrL24qZrSblVTCR+FqYLPKFp
 OGq3X/9DMZdkQkb8D3aqdw340aOl4XQNWeCTD3Ad95dYxqAfpcszg8CflYHLM9iNs4Aa
 FONb5ZxMI+yGYgMizKHfkPCahoEdMPuIptxHbdxYY0ZqMSDYjruPqizo/v1r7h52sX7C
 BWDdOg20WcthSNpdu8A4gWmVc6M97a/MpkyYv9sfra22bxKSFMVjVWYX8xfQ7rPeQBZo
 ddveuyMUOS8c82uf3btZbDUoLtegyRjC7SEXBbXWoXbe1KY3CyLSanySZSFhvKwebj1M
 NOkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ik0ht7odnIzibPDZH+4gXD6VXdvKBxYAd+6/G8QM2wI=;
 b=EOWJ+XBfkIraXU0cpNTKi1kptcfzToEht+LR81emnKF9V30ESx8ONJKz4+p3PXgYhA
 8b2Ufz7nZ4YROCE4x6kBD9sZGsczJj97yqm6eRC0VZ9boj5TTdgGhoQWqUM3E/6ejJOS
 Hd6rjhbD1R/I7ksueAaPx9hND8hXg0CoaV1UUGmNI5OVU5E7WR1Za6eoSSz4N/KTwR+y
 SDllDKtjB5eXhvX7FxJyWv/IECL9SPm1Pwie5TEomhEUhVQounRgLDHCed9QShTCxurv
 a7FgUc4i6wlrzhi2fNupwX9yY6HYxLqMyWESYCoAKABbL1vngtPI7FPv7Ulvl+346im5
 Rrbg==
X-Gm-Message-State: ANoB5pm8n22n7DDheirFdQ4ExMkw4afKIFyXfRjimCpxnsSL3tB30045
 v3Elb64+NUS9VRtZ79naDOp4Ng==
X-Google-Smtp-Source: AA0mqf467E7YAHDlJwHudAKBfjsXXYeoi/xqqszpypAFJfkfAt/tvslYj5gIWO0XqK+7xxU4R5lk8w==
X-Received: by 2002:adf:fd01:0:b0:235:83aa:a6ed with SMTP id
 e1-20020adffd01000000b0023583aaa6edmr50450731wrr.543.1670328038776; 
 Tue, 06 Dec 2022 04:00:38 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 a1-20020adffac1000000b0024194bba380sm16882032wrs.22.2022.12.06.04.00.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 04:00:38 -0800 (PST)
Message-ID: <3132236c-93f6-70fa-a10b-b7bdf5afbc92@linaro.org>
Date: Tue, 6 Dec 2022 13:00:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v6 0/7] Add ARM Cortex-R52 CPU
Content-Language: en-US
To: Tobias Roehmel <tobias.roehmel@rwth-aachen.de>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20221206102504.165775-1-tobias.roehmel@rwth-aachen.de>
 <5f98f1c6-e6a9-cea6-427f-3fa2c4493e5d@linaro.org>
 <59771f97-e036-84de-4feb-aab7ef55e659@rwth-aachen.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <59771f97-e036-84de-4feb-aab7ef55e659@rwth-aachen.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.265,
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

On 6/12/22 12:43, Tobias Roehmel wrote:
> 
> On 06.12.22 11:39, Philippe Mathieu-Daudé wrote:
>> On 6/12/22 11:24, tobias.roehmel@rwth-aachen.de wrote:
>>> From: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>
>>
>>> v6:
>>> patch 5:
>>> - I'm freeing the PRBAR/... strings explicitly now since
>>>    I don't know how to use autofree in this setup correctly.
>>>    Maybe {} around the part were the string is created/used,
>>>    such that it is dropped at }?
>>
>> The pointer is declared outside of a for() statement. Then
>> inside this statement you alloc/free twice, using the same
>> pointer. This is correct.  If you really want to use
>> g_autofree in such case, you'd need to declare within the
>> same statement, one pointer for each string:
>>
>>   for (i = 0; i < MIN(cpu->pmsav7_dregion, 32); ++i) {
>>       uint8_t crm = 0b1000 | extract32(i, 1, 3);
>>       uint8_t opc1 = extract32(i, 4, 1);
>>       uint8_t opc2 = extract32(i, 0, 1) << 2;
>>       g_autofree char *prbarn_str = g_strdup_printf("PRBAR%u", i);
>>       g_autofree char *prlarn_str = g_strdup_printf("PRLAR%u", i);
>>
>>       const ARMCPRegInfo tmp_prbarn_reginfo = {
>>           .name = prbarn_str, .type = ARM_CP_ALIAS | ARM_CP_NO_RAW,
>>           .cp = 15, .opc1 = opc1, .crn = 6, .crm = crm, .opc2 = opc2,
>>           .access = PL1_RW, .resetvalue = 0,
>>           .accessfn = access_tvm_trvm,
>>           .writefn = pmsav8r_regn_write, .readfn = pmsav8r_regn_read
>>       };
>>       define_one_arm_cp_reg(cpu, &tmp_prbarn_reginfo);
>>
>>       opc2 = extract32(i, 0, 1) << 2 | 0x1;
>>       const ARMCPRegInfo tmp_prlarn_reginfo = {
>>           .name = prlarn_str, .type = ARM_CP_ALIAS | ARM_CP_NO_RAW,
>>           .cp = 15, .opc1 = opc1, .crn = 6, .crm = crm, .opc2 = opc2,
>>           .access = PL1_RW, .resetvalue = 0,
>>           .accessfn = access_tvm_trvm,
>>           .writefn = pmsav8r_regn_write, .readfn = pmsav8r_regn_read
>>       };
>>       define_one_arm_cp_reg(cpu, &tmp_prlarn_reginfo);
>>   }
>>
>> (Note ARMCPRegInfo can be qualified const).
>>
>> Regards,
>>
>> Phil.
> 
> Thanks for the explanation! Would that be the preferred way?

What you posted is good enough IMO :) AFAIK there is no formal style
recommendation on using g_autofree.

