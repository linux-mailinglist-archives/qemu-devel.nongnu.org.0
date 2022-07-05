Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABDB5660F5
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 04:07:28 +0200 (CEST)
Received: from localhost ([::1]:33296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8XyJ-0000k1-8h
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 22:07:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8XwZ-00087P-Gz
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 22:05:39 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:44559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8XwX-0000SV-Jr
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 22:05:39 -0400
Received: by mail-pf1-x42a.google.com with SMTP id z27so298816pff.11
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 19:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=9gy1SFK4I8KTWAMbnyWixMrtdQtZx6KNpugELpsj4EU=;
 b=o76694ckWzWqJEgNnSc+uiYX3/Y3Awc99jijwQNQSxZNbS0acMn3R6l71p3i3xiCUt
 Kf3tgY3RaF4FWCWm969DJbwdGgCSdz1TvjTFNKu8Lril7exs2zOZ7VWqPF+m1dE6DXYu
 /FMHlEznIDrhjgjv8pZG/YZHjtlWJPTn2JybPxVxUDZvUATak0z2N+aCoQt/GXYCKR6G
 UyKwwBmzrMxebqgHdwfm8lDPRSsKOKlNUboFV/ytvlK2/Q1JP6QTICbc6rez1j/V9cYG
 ZxMVU/Lc9uFH1P/anHscZZA6IRibUt2I7VgI1FwXx6ij5wd28f/kwzDKMULLdiPGsky4
 /9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9gy1SFK4I8KTWAMbnyWixMrtdQtZx6KNpugELpsj4EU=;
 b=BZPuYQjZAHtLlGdeMX7VRZNtzU4VFhn4iExXDe3/A4WLk/L5ze1TzNjYAuE4JxFy5N
 9o10d5abVHS+wBZEvl6sheG9UfBQksHt1AFMoCaAO0iiQa4F/E9Dovkgohdtbln+6jhC
 /jjkEa8qPBBPrFxThEQNFRv3LpWjQq5ehEy8NypMexfuZTCLKScN/Tpkqt6Ah07R6QwO
 DxLNYDMn+gkaBfBI7d0xBopE/L5OWZbfKhRg3/UZELZU37qC2zjIqrPlHrLirdd+Ql7K
 leCLf6nC2L36V/S4aJSGBTyG9IBzK6bOYn4a8cS4c8edTocvU/yf7kW+4KDiPbaZGcfE
 EDYw==
X-Gm-Message-State: AJIora+LTCU2twhko6gYUEhtMoWS7ogYoirCx6tD3yq/zWfGZkaVIdIN
 VThozw4Sv8CweLzSWDOytYXdxw==
X-Google-Smtp-Source: AGRyM1vVl6hYeomqXtHy5Awl99JFzhwBNmbSB16s1rYm38g/nc6uN0rE/8hjZTqbE1q9r0UAymCHeQ==
X-Received: by 2002:a63:70c:0:b0:412:6e3a:f687 with SMTP id
 12-20020a63070c000000b004126e3af687mr1735034pgh.203.1656986733513; 
 Mon, 04 Jul 2022 19:05:33 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 b11-20020a170903228b00b0016bebb0cb96sm1662378plh.266.2022.07.04.19.05.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 19:05:33 -0700 (PDT)
Message-ID: <d3682c9f-3fab-f13a-18be-f76d8cdd0ca9@linaro.org>
Date: Tue, 5 Jul 2022 07:35:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 23/45] target/arm: Implement SME ADDHA, ADDVA
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-24-richard.henderson@linaro.org>
 <CAFEAcA8=bihNgdeAsNGS-cymu7zjCG9nA5cYTm4TokR3h2XptQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8=bihNgdeAsNGS-cymu7zjCG9nA5cYTm4TokR3h2XptQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/4/22 16:20, Peter Maydell wrote:
>> +void HELPER(sme_addha_d)(void *vzda, void *vzn, void *vpn,
>> +                         void *vpm, uint32_t desc)
>> +{
>> +    intptr_t row, col, oprsz = simd_oprsz(desc) / 8;
>> +    uint8_t *pn = vpn, *pm = vpm;
>> +    uint64_t *zda = vzda, *zn = vzn;
>> +
>> +    for (row = 0; row < oprsz; ++row) {
>> +        if (pn[H1(row)] & 1) {
>> +            for (col = 0; col < oprsz; ++col) {
>> +                if (pm[H1(col)] & 1) {
>> +                    zda[row * sizeof(ARMVectorReg) + col] += zn[col];
>> +                }
>> +            }
>> +        }
>> +    }
>> +}
> 
> These array index calculations look wrong again?
> Should be 'row * (sizeof(ARMVectorReg) / 8) + col' or equivalent,
> I think.

The tile rows are N physical rows apart.


r~

