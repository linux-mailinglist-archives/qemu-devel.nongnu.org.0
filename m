Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A790608431
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Oct 2022 06:15:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1om5VH-0008GR-1c; Fri, 21 Oct 2022 23:48:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1om5V6-0008GH-UE
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 23:48:45 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1om5V5-0006vz-CT
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 23:48:44 -0400
Received: by mail-pl1-x636.google.com with SMTP id y4so4026884plb.2
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 20:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2FMfNamVahSuxwjYqGFC1Hhng8tL07qsjnBOi05OHm8=;
 b=hnMGS9pD0SIkLkLJbhL+SNM5CI5Hq+Gs8IXF3CvspgplPoSqawuTRjya/AU5KPgRSj
 mEKCTvNXkrj+583ReR6I8igsvd4HEegObFrlc0D1nVxs0R0jZYil9eC8xrg3iBLmL+Gq
 n6Ogy0XhNmFomSu8raaVPEFiXlpXdMr4VFyEBUFh5E6/UuY1R/0LaWVqnD9pwZXTRBPZ
 z1GXdry8O91n5ojOv5L1M9/Y3UPSD8hSdQ+2m/63jvS0HUgi7TeU0hzIyyNSqYCabc7z
 H200/ZDx3FKWUlbCREzueM78vcVHo1pvxyQx0reItRsWKQmvkzy/FAsOk1MfUFjNiVBH
 2QSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2FMfNamVahSuxwjYqGFC1Hhng8tL07qsjnBOi05OHm8=;
 b=LtiYgT8KSx2mKxqz+nQotCRV+WIsjNgB+CJaRpLPD3X2B68V9qo8gYmhs/GbadiDIm
 kDKX4yuVsFruo4GPpHVNOZfWAjtwTxB81oWwgTuc7tRRMgaC7EI/v/KwKqm2C057Nil1
 VGZN0y2BDHqG3ngMgKzpR11RU8tpEJwVf6Q0OH8aBIDIi7DVPWb1nqkPVzMyRYZDgKaV
 ot1D3Zfh5LPvABb3xRsYuQx8Y8Xv5BftWjwwZWxVe+NoldKiv4iZN6HKQos2z5DVmQ4n
 1E/cuUfA2Elrih/RoiSymoYjZOb4VPuIU01dIQTRfxHTpBX+i6DnuyEyaOKJU5OKuQSC
 N3wA==
X-Gm-Message-State: ACrzQf0ASEijGvFL1FEXu9VrMEtWEaxTK31Wh1STliICJECEd99lWaRs
 Zru+GBkmtBjG/h7fhiutGIoJeQ==
X-Google-Smtp-Source: AMsMyM7e/yd7XRUE2wW36Z2x4lfsIg383UWluSuMrQv5eZ1qTIfeZxYzI5i/lS3BGpLs9vNvkUvmGw==
X-Received: by 2002:a17:90a:13:b0:212:d139:748a with SMTP id
 19-20020a17090a001300b00212d139748amr6560460pja.182.1666410521769; 
 Fri, 21 Oct 2022 20:48:41 -0700 (PDT)
Received: from [192.168.1.107] ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 e30-20020a056a0000de00b00560c9048569sm15868475pfj.67.2022.10.21.20.48.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 20:48:41 -0700 (PDT)
Message-ID: <07833419-4fb0-b7f3-3c5c-d6c1c308c059@linaro.org>
Date: Sat, 22 Oct 2022 13:48:35 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 33/36] tcg/tci: Add TCG_TARGET_CALL_{RET,ARG}_I128
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
References: <20221021071549.2398137-1-richard.henderson@linaro.org>
 <20221021071549.2398137-34-richard.henderson@linaro.org>
 <56c357ca-c481-5a69-6bc2-5579c0bf4503@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <56c357ca-c481-5a69-6bc2-5579c0bf4503@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/21/22 20:47, Philippe Mathieu-Daudé wrote:
> On 21/10/22 09:15, Richard Henderson wrote:
>> Fill in the parameters for libffi for Int128.
>> Adjust the interpreter to allow for 16-byte return values.
>> Adjust tcg_out_call to record the return value length.
>>
>> Call parameters are no longer all the same size, so we
>> cannot reuse the same call_slots array for every function.
>> Compute it each time now, but only fill in slots required
>> for the call we're about to make.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/tci/tcg-target.h     |  3 +++
>>   tcg/tcg.c                | 18 ++++++++++++++++
>>   tcg/tci.c                | 45 ++++++++++++++++++++--------------------
>>   tcg/tci/tcg-target.c.inc |  8 +++----
>>   4 files changed, 48 insertions(+), 26 deletions(-)
> 
>>   static ffi_type *typecode_to_ffi(int argmask)
>>   {
>> +    /*
>> +     * libffi does not support __int128_t, so we have forced Int128
>> +     * to use the structure definition instead of the builtin type.
>> +     */
>> +    static ffi_type *ffi_type_i128_elements[3] = {
> 
> static const.
> 
>> +        &ffi_type_uint64,
>> +        &ffi_type_uint64,
>> +        NULL
>> +    };
>> +    static ffi_type ffi_type_i128 = {
> 
> static const.

Can't, because of the libffi interface.  Indeed this second structure will be modified by 
the library to complete the library-specific initialization.


r~

