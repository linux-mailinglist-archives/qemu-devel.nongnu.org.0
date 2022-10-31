Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E06612FF3
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 06:47:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opNdH-0002id-K0; Mon, 31 Oct 2022 01:46:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opNd0-0002hm-J6
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 01:46:30 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opNcu-0005eN-JA
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 01:46:29 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-13bd19c3b68so12461802fac.7
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 22:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ACRVt1rN5V97Esv0WtUoaVRhLNAJQmqGq66U1+w5x7E=;
 b=t8pNQTCze/a1i6Pr2CuPk7MWR/BbWWZjBxumy81TrP3MGTkQMZ6H1jswZo/g2rRVIz
 rhBbtTnz3XDIALfgElaOP7v3rCCTahIeaj6YqurGfJM3KToN2dh32rosDDckEUm4o7xV
 ZBdF3oAho/0uOvNnTJqmOyF/yj7wMB6xk5ROIirpchZ2jBN5QRO+UncfdbegkMy4fEcs
 1CQ1Eshfn8mNcWwFJg2v38BmzFe19gHbvMzjeU94pfuMlIhH5xeeh1DZEiRIyXF9owO7
 ebfbd51vcNBmAxZ2BRew6rvyG/ILXtHlVj/36UhgvSAhyyS/OoFDrChERtuE3hNZo88/
 U95Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ACRVt1rN5V97Esv0WtUoaVRhLNAJQmqGq66U1+w5x7E=;
 b=dkdOwaqo25sY+74VhGA8TeOmG3Z1l1pNDE6MkctfFzoTI8+ngHgXB6ud5UxZ6STe89
 dMlvMvkas+Ujt3UJlKTpHodwHpM6scXRSj6W6tXTqbudeO6fMPFKeVQu6xw12f3fcYoF
 U8aC5/ZiCQYQK14Z9B5zD/CxALOluu7cdP0fqC3ykFu+0t+J3W0jXvoKUOg6CyovWNia
 dEtXZwN7klkKOs0mNURmeUpQq7W9s4Svs++d+3fQF5b9BnHpXjLplIdrlcTTjmcLA/5/
 GJjgB/G8dYT8YkwsYDbfOg2t8LPi7jpr3uDhG8/xuWS0wd9mogMUsMr5xltHyNbVru3N
 fWow==
X-Gm-Message-State: ACrzQf29qVFpNo+4sB/ny8li0NiiANG8MSG6qDpd/+bf6O/TP9Fzlqwa
 01qHZKyiC7A0VA95LUrJy8iL7A==
X-Google-Smtp-Source: AMsMyM4Z7k15+nQASNg4GM2qDbaq1JPw7Go+lcgq++leG0bREyobFd7IzqEglBfoJF9+VCGa8H/krQ==
X-Received: by 2002:a05:6870:970e:b0:13c:5da4:aeb0 with SMTP id
 n14-20020a056870970e00b0013c5da4aeb0mr11780682oaq.27.1667195182580; 
 Sun, 30 Oct 2022 22:46:22 -0700 (PDT)
Received: from [192.168.108.227] ([172.58.142.196])
 by smtp.gmail.com with ESMTPSA id
 v11-20020a4aaecb000000b004807de5c302sm2065534oon.17.2022.10.30.22.46.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Oct 2022 22:46:22 -0700 (PDT)
Message-ID: <146bc303-cd24-1c4b-2552-40e3a9df256f@linaro.org>
Date: Mon, 31 Oct 2022 11:10:41 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PULL 25/47] accel/tcg: Add restore_state_to_opc to TCGCPUOps
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: stefanha@redhat.com, Claudio Fontana <cfontana@suse.de>,
 qemu-devel@nongnu.org
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
 <20221026021116.1988449-26-richard.henderson@linaro.org>
 <87r0yqua43.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87r0yqua43.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x30.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 10/29/22 21:42, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> Add a tcg_ops hook to replace the restore_state_to_opc
>> function call.  Because these generic hooks cannot depend
>> on target-specific types, temporarily, copy the current
>> target_ulong data[] into uint64_t d64[].
>>
>> Reviewed-by: Claudio Fontana <cfontana@suse.de>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> This has triggered a regression in x86_64 stuff:

Patches posted: 20221027100254.215253-1-richard.henderson@linaro.org
("[PATCH v2 0/6] tcg: Fix x86 TARGET_TB_PCREL (#1269)")


r~

