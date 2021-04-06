Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF667355EA4
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 00:14:15 +0200 (CEST)
Received: from localhost ([::1]:42924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTtxe-00019C-Qq
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 18:14:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTtwd-0000cc-04
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 18:13:11 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:41895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTtwb-0007sM-8v
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 18:13:10 -0400
Received: by mail-pf1-x42d.google.com with SMTP id l123so9938924pfl.8
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 15:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=G009djQjMftplOha1xrOlaDXhdqRL9Ry1Ceq/lr1Huw=;
 b=JAY1Cn4cCgN031gnN56g2SVdMpmYf2UGtXtMTsNLKZKBK3jgFCG/gW6dRla8Lgo+j7
 9DdtNbsY2+4UIXo89gf3qeaTGx8BW7Y9IsfAtzis4BuJOaKXki00S6YSzWXizgPOJQD5
 juFfFyhZFk/Nrp0yXZU43W4E+xmYcCjBUE+DWIVbjXqJeFlXbQRPWmRReQ/b5EMCENVv
 TeVFDwI1KrvTJH86Vy1Rx/Oj3MZJa2tt/LqrtAFFsnRZ8UB6W7yR0/JPXeZPzZdnecj3
 SJzt7uhib6FyQLfpxCX9JX8BhV6rKgZbiQNedMd5JEIrXqnRz7yHjyogiBi5o8rdjJNC
 Gq6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G009djQjMftplOha1xrOlaDXhdqRL9Ry1Ceq/lr1Huw=;
 b=PWu4XIYHppsEhud/fsxWdj+LRhvIzyNsT1ZpRhAY1b0+MdHTamdoVf9PfUVh0XxHdZ
 +XDJlZiXIKVbbFZDaGw2MGZd6SW2QE55jADc9Q2MuE6HbwlggzDD8YP4cnlM9SoBND/k
 kyCCEwpcyDn8c58Pm4MXISj9asUPRgly6TVvmakYhYHJLBIF9uchUgIlZyNF57hsNB1I
 MfHs793pALNWhIqgbths1enQQ5G8uGH0Vj9Acz7h8EMU2O/e+HnNHN1K74lbjk4O4qFG
 5+PNAjIHVsB3XR5qcUzAZPenAm4I6Fs/WjJ9L2Ikp92bEwQG9yPrYpvBvcW33/T4Yihl
 R84Q==
X-Gm-Message-State: AOAM533Uxyqxt3CIlOJssP/ARJFeEC+3Zp6SMW7EZgVqTlUr9vQdF+Ul
 o+eEzX9Earog525+oU8r7lvasw==
X-Google-Smtp-Source: ABdhPJxUciVcBDJwVZax8uRt/5Dlt0G91VLH9OXVchbNfcfnEyQpjfUvW4nBN+3q+o63SQdTbMiQMQ==
X-Received: by 2002:a63:3752:: with SMTP id g18mr293571pgn.388.1617747187657; 
 Tue, 06 Apr 2021 15:13:07 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id j10sm3200193pjs.11.2021.04.06.15.13.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 15:13:07 -0700 (PDT)
Subject: Re: [PATCH v2 12/21] Hexagon (target/hexagon) add F2_sfrecipa
 instruction
To: Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <1617249213-22667-1-git-send-email-tsimpson@quicinc.com>
 <1617249213-22667-13-git-send-email-tsimpson@quicinc.com>
 <13945cfa-a211-8d4d-df64-3df7b8304b04@linaro.org>
 <BYAPR02MB48869FD9CE8F128EC50F668EDE769@BYAPR02MB4886.namprd02.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <47ba8288-f6c9-976e-67ac-9d48a29ce676@linaro.org>
Date: Tue, 6 Apr 2021 15:13:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <BYAPR02MB48869FD9CE8F128EC50F668EDE769@BYAPR02MB4886.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "ale@rev.ng" <ale@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/6/21 2:55 PM, Taylor Simpson wrote:
> 
>> -----Original Message-----
>> From: Richard Henderson <richard.henderson@linaro.org>
>> Sent: Tuesday, April 6, 2021 3:46 PM
>> To: Taylor Simpson <tsimpson@quicinc.com>; qemu-devel@nongnu.org
>> Cc: philmd@redhat.com; ale@rev.ng; Brian Cain <bcain@quicinc.com>
>> Subject: Re: [PATCH v2 12/21] Hexagon (target/hexagon) add F2_sfrecipa
>> instruction
>>
>> On 3/31/21 8:53 PM, Taylor Simpson wrote:
>>> +int arch_recip_lookup(int index)
>>> +{
>>> +    index &= 0x7f;
>>> +    const uint8_t roundrom[128] = {
>>> +        0x0fe, 0x0fa, 0x0f6, 0x0f2, 0x0ef, 0x0eb, 0x0e7, 0x0e4,
>>> +        0x0e0, 0x0dd, 0x0d9, 0x0d6, 0x0d2, 0x0cf, 0x0cc, 0x0c9,
>>> +        0x0c6, 0x0c2, 0x0bf, 0x0bc, 0x0b9, 0x0b6, 0x0b3, 0x0b1,
>>> +        0x0ae, 0x0ab, 0x0a8, 0x0a5, 0x0a3, 0x0a0, 0x09d, 0x09b,
>>> +        0x098, 0x096, 0x093, 0x091, 0x08e, 0x08c, 0x08a, 0x087,
>>> +        0x085, 0x083, 0x080, 0x07e, 0x07c, 0x07a, 0x078, 0x075,
>>> +        0x073, 0x071, 0x06f, 0x06d, 0x06b, 0x069, 0x067, 0x065,
>>> +        0x063, 0x061, 0x05f, 0x05e, 0x05c, 0x05a, 0x058, 0x056,
>>> +        0x054, 0x053, 0x051, 0x04f, 0x04e, 0x04c, 0x04a, 0x049,
>>> +        0x047, 0x045, 0x044, 0x042, 0x040, 0x03f, 0x03d, 0x03c,
>>> +        0x03a, 0x039, 0x037, 0x036, 0x034, 0x033, 0x032, 0x030,
>>> +        0x02f, 0x02d, 0x02c, 0x02b, 0x029, 0x028, 0x027, 0x025,
>>> +        0x024, 0x023, 0x021, 0x020, 0x01f, 0x01e, 0x01c, 0x01b,
>>> +        0x01a, 0x019, 0x017, 0x016, 0x015, 0x014, 0x013, 0x012,
>>> +        0x011, 0x00f, 0x00e, 0x00d, 0x00c, 0x00b, 0x00a, 0x009,
>>> +        0x008, 0x007, 0x006, 0x005, 0x004, 0x003, 0x002, 0x000,
>>> +    };
>>> +    return roundrom[index];
>> ...
>>> +    if (arch_sf_recip_common(&RsV, &RtV, &RdV, &adjust, &env-
>>> fp_status)) {
>>> +        PeV = adjust;
>>> +        idx = (RtV >> 16) & 0x7f;
>>> +        mant = (arch_recip_lookup(idx) << 15) | 1;
>>
>> Why not just export the table and not the function?
>> You're already masking the index at the single use.
> 
> I'll do that for both.  I assume you are still OK giving your Reviewed-by from the previous two emails.

Yep.

r~


