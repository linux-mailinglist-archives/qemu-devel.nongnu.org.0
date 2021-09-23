Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 812C941647E
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 19:32:46 +0200 (CEST)
Received: from localhost ([::1]:60738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTSaT-0005da-3e
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 13:32:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mTSMR-0003lA-Lk
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 13:18:15 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:36614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mTSMQ-0003Cd-5M
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 13:18:15 -0400
Received: by mail-wr1-x42e.google.com with SMTP id g16so19304186wrb.3
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 10:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xmxGKe/6A3ct0d1DcB5AMRUZ5mTjs1fyhoLCMLBZqb8=;
 b=p5EB5kSIVi/SIkYtY2w23XsuMaukA3+Lx/ECDT4QbcAIwiBrdLExuiBQtB9x8dhe8G
 EBcuai/poV2UvGZDlO/rlJCYcLv2xpZHxx7Li99I526nE9fVxTiy4glLJayfmenxHg8U
 3PT8ZXqtpZj9F2mcFFi5kbCAnbxX9WX1l+dlm4F+d5UwR8Su09X5VtAcb0yGXjjLRxOb
 7tFCFUM4AblqJLfMpjNvJiJ/Wwr5w2MM4Sot60RMlFugB8IdzGX/a/ImhnRpV4YJqQ7S
 uN2S02UFlcySXf0BvZhXHaK4cUou8i0xBKEnCQxyTlCyE4Gwol7R9AF+IIxG5wWVNFhB
 3E2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xmxGKe/6A3ct0d1DcB5AMRUZ5mTjs1fyhoLCMLBZqb8=;
 b=vsPWiefAzQc4+XDgGIHabbG+IyXY48rvqAIkhqqsEvviQ1oKUEb+E7gcYxOzOCI/SK
 2x9xRWoE1SQRugUc9L9kupVWREyxpNwzlJ1RcFlecCRuHJJ8quS2DAuv7N81GDDl4iCb
 4V6RjdDw15cU0BUCheIcyRNgZDpRKsZsR6dKWFQ6xjKDC4V61CLgzL07w/p749liSenq
 alU4APAtHGIjmWPg3X856FH+Y2AUkJqoKBOpZcQinCJiFsVsu4C0bWyKAyrmjltfnPqy
 PsyjNplupkvI149Fr7YIllEbhXbXyyqx29mB9xLrZ0A1h3lnkH6OBo6XJfEDM/AiYKX1
 c59A==
X-Gm-Message-State: AOAM5312I4CtWeSVdcRFmnWDmsqc1tJMpvve630qCrMTCR38Ss4/ox47
 lk5+CLW2yhs/wr3SLQ86AnHwdzgQ9JE=
X-Google-Smtp-Source: ABdhPJx3j1ySFKXgMMZ/mlYlP4JrppCUx55RkbWJszkpzrnViQ6ENtmJ9QMLVh2WIIs3EBDmiP3HLg==
X-Received: by 2002:adf:ecd2:: with SMTP id s18mr6410269wro.99.1632417492657; 
 Thu, 23 Sep 2021 10:18:12 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id d5sm6143021wra.38.2021.09.23.10.18.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 10:18:11 -0700 (PDT)
Message-ID: <e968ee1e-df05-82b3-1f9c-1759bbebb3a3@amsat.org>
Date: Thu, 23 Sep 2021 19:18:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v5 08/31] accel/tcg: Implement AccelOpsClass::has_work()
 as stub
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210920214447.2998623-1-f4bug@amsat.org>
 <20210920214447.2998623-9-f4bug@amsat.org>
 <77ab9dfa-01c0-6d6f-89de-604adc26bd35@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <77ab9dfa-01c0-6d6f-89de-604adc26bd35@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/21 00:01, Richard Henderson wrote:
> On 9/20/21 2:44 PM, Philippe Mathieu-Daudé wrote:
>> +static bool tcg_cpu_has_work(CPUState *cpu)
>> +{
>> +    CPUClass *cc = CPU_GET_CLASS(cpu);
>> +
>> +    g_assert(cc->tcg_ops->has_work);
>> +    return cc->tcg_ops->has_work(cpu);
>> +}
> 
> Now, you're expecting cc->has_work to disappear as cc->tcg_ops->has_work 
> appears.  If we're expecting cc->has_work to not affect other 
> accelerators, then I think you should first move cc->has_work to this 
> function, *before* you add the tcg_ops hook.

Indeed, thanks.

