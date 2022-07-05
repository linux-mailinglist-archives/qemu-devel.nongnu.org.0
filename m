Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A65085661D2
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 05:25:46 +0200 (CEST)
Received: from localhost ([::1]:60800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8ZC5-00079P-A4
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 23:25:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ZAb-0006B3-Ms
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 23:24:13 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:51059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ZAa-0003iF-3s
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 23:24:13 -0400
Received: by mail-pj1-x102c.google.com with SMTP id a15so4160497pjs.0
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 20:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=MVvpbrHa6kMv9FamREUllnSG24yUEjpHJ6mfQxq02Og=;
 b=IJnFCYlFhcJlqypgrdEXK1OHetDmllhEbL2GKlxx4T5aOjvJX4V4OsAYizXs/XFpnD
 vdtybz7ErFKG/gEvdehaKSsT0QRhMcDyKb/6V0z1pFk4BlD6VZscPGas0gaXAi80+cs8
 57XGZUujhevDLzU/Y837Q+d0Gg/0S7LetRFfdEszpjBoquzeDCc5cFwUUTOKMYlfyGJy
 eUUtjkESWnlA/zPh8o6CyZQ2TtegTu9rgBfRQ4ppM1XLcgAHJCLzAQBx79LBOW/0VOTv
 hI05Yu6u/DrX1asRXdm3WP4ZVD2OkWlyoujVpo0Ab1Nxs1NXshhO4a3+yNyK8B3nAGrn
 yeQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MVvpbrHa6kMv9FamREUllnSG24yUEjpHJ6mfQxq02Og=;
 b=YpNxduXHnIvSZqVuVrh0HJjNySpUb1/5TdNXLUBMNL2E+psp3CONyfIbHCGiAh5wT5
 kDFBMJBLatolFFeXE0kDO/BB/VxBt2tuBrbK4iC49L1P2JJ0A2+7EZiptVvkKk8wvCcL
 YSLD16wqCxjMx64UL2JyVgIsifLWYQBBKjiXYA2+i0HER7jTunNXLszhgfqmo3cVHG+K
 upOwmH5dlK/2vaMiLfINgBJk5IdIiQtf/GCP1hodcbOTRumEfMkDYjlG1dKTUwDlL/9X
 OPt1cd9OxzPr/8KP3KCemKeZTUecAdJzxy50qbrfmwkMQkJqpDHJfdp0x/UGLoJ96oN6
 W3Mw==
X-Gm-Message-State: AJIora8w3Lv774i8JpHsK+IBM46qcB3FO2bZ/O7Ygxed6MlQckxSwVe/
 Oekui1/my3j0EOkBXD8OOpmL9g==
X-Google-Smtp-Source: AGRyM1t4/eQr9GKUytfatDsoB1hRjHkhqZDD7TCl3gUD399qHbmZhLgcam92UqckBtfxeILfZ1PIpQ==
X-Received: by 2002:a17:902:8ec9:b0:168:c341:847e with SMTP id
 x9-20020a1709028ec900b00168c341847emr40310173plo.170.1656991450179; 
 Mon, 04 Jul 2022 20:24:10 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 y11-20020a170902d64b00b0016782c55790sm21973924plh.232.2022.07.04.20.24.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 20:24:09 -0700 (PDT)
Message-ID: <4adabd72-b975-88c7-aac1-11841d31e9f3@linaro.org>
Date: Tue, 5 Jul 2022 08:54:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 35/45] linux-user/aarch64: Add SM bit to SVE signal
 context
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-36-richard.henderson@linaro.org>
 <CAFEAcA80YR_jKXqW=qfVBFgd_FG9ZiMiqLs29Njsw3jtXdSgxw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA80YR_jKXqW=qfVBFgd_FG9ZiMiqLs29Njsw3jtXdSgxw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

On 7/4/22 17:32, Peter Maydell wrote:
>> @@ -177,9 +180,13 @@ static void target_setup_sve_record(struct target_sve_context *sve,
>>   {
>>       int i, j;
>>
>> +    memset(sve, 0, sizeof(*sve));
>>       __put_user(TARGET_SVE_MAGIC, &sve->head.magic);
>>       __put_user(size, &sve->head.size);
>>       __put_user(vq * TARGET_SVE_VQ_BYTES, &sve->vl);
>> +    if (FIELD_EX64(env->svcr, SVCR, SM)) {
>> +        __put_user(TARGET_SVE_SIG_FLAG_SM, &sve->flags);
>> +    }
>>
> 
> The kernel documentation says that if this is set then the SVE
> record contains the streaming vector length. Does that happen
> automatically (ie vq is the right thing for both streaming
> and non-streaming) or do we need to do something there?

It is automatically correct (modulo the typo you found in patch 40).  The two helpers we 
have are for VL and SVL, with no direct access to NVL.

> I gather that the other half of handling this bit (allowing
> it to be changed on signal-return) is in a later patch.

Yes.


r~

