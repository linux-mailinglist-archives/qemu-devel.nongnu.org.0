Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B53B411756
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 16:43:30 +0200 (CEST)
Received: from localhost ([::1]:41326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSKW1-0004V0-Kr
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 10:43:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSKHq-0006Gk-Pg
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:28:52 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:43588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSKHn-0007NB-IL
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:28:49 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 k23-20020a17090a591700b001976d2db364so90717pji.2
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 07:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=OIuRHZGux8CmsBjo6615yY1g/nTDPsEHzpTXNuXhJbw=;
 b=qO2nyk6J3aM6JwFHs1WYWFyJVsPSGjqKlaoYGjnCgICSBRJRSv51SRYhwCod+upOKx
 A+emWBXz0tyqjAG4FTtsiNROXBJhjZcFR2fPoQ7rYtks4AIrgA0EIsPe5zHxgalbCGli
 WTxbkBuT7DpBFqkDkcj/v2g71xUlMRToRNCo8cJxT6EvQ253DTdTHn+9bznOCfvUg9r1
 aSqQNmb0sYxG+IF/ecs40UpEgW+6wSEN6ZK9GaonLuZcpGwW61UhQIJQ1gju4SBxxXDu
 UltJSLaEdzk7xvwNHLNClxHj/2DNEUxL26c+gTzBbokZot0dCh/Tp46EPNoGtV5tF36p
 IiQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OIuRHZGux8CmsBjo6615yY1g/nTDPsEHzpTXNuXhJbw=;
 b=T/YzEfnAIomJ79273BRf55FMpwVWGMDGtgnWld1C7AJnV84/xbT5rjO5ChdV+L16/w
 5K72KiajQfOpD52iPrYH/ffdREe+E47ApduJkB3/tnwztMPCrOQ3uFF5hNtXppBDV43o
 25q/pP5IbaNnlVmfNw7HRuOxZEAdhWk8HILBmpEKd2BF7VgsenGdLFE2HWmomd18d/9Q
 NoYrxkEgjveoroyuWUR+ca+0S/e/+92G9mVCLcT/wIz+P03IMdQ0BLjmdQ1fUQrDd156
 P7k9CjGlCiwgGzyb4ZPOXB2b2OCkFEvQB2Lfkg5ye9dE/xbZ7FgqcGR2gHzobufB3Zpc
 +DPA==
X-Gm-Message-State: AOAM531wBzxsP3eT10YSTjj5SHb6jsiWIrxveKYcwwSTLlUG70Ucb4Xq
 0jrB1mtycVr1qcg5LdRNxhJHZjofCun9Vw==
X-Google-Smtp-Source: ABdhPJwUiOpAjTztUGO1EQduCbYlekuogSBIYdaAkkxtOOC96G9xOrzf+8C+uHeSYKjFw2XMPEtTFw==
X-Received: by 2002:a17:902:7e84:b0:13a:3396:1c04 with SMTP id
 z4-20020a1709027e8400b0013a33961c04mr23171842pla.84.1632148126020; 
 Mon, 20 Sep 2021 07:28:46 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q1sm1999133pjq.5.2021.09.20.07.28.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 07:28:45 -0700 (PDT)
Subject: Re: [PATCH 06/30] tcg/loongarch: Define the operand constraints
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210920080451.408655-1-git@xen0n.name>
 <20210920080451.408655-7-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fc6d1a0d-cd3f-7324-b8e1-4b93e71c286f@linaro.org>
Date: Mon, 20 Sep 2021 07:28:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920080451.408655-7-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 1:04 AM, WANG Xuerui wrote:
> +static inline tcg_target_long sextreg(tcg_target_long val, int pos, int len)
> +{
> +    if (TCG_TARGET_REG_BITS == 32) {
> +        return sextract32(val, pos, len);
> +    } else {
> +        return sextract64(val, pos, len);
> +    }
> +}

You don't need this conditional.  Just use sextract64 directly.


r~

