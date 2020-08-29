Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A869256A09
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Aug 2020 22:23:44 +0200 (CEST)
Received: from localhost ([::1]:52566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kC7O3-00006O-Jx
	for lists+qemu-devel@lfdr.de; Sat, 29 Aug 2020 16:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC7MK-0007EM-Py
 for qemu-devel@nongnu.org; Sat, 29 Aug 2020 16:21:56 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:51595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC7MJ-0007nn-Bf
 for qemu-devel@nongnu.org; Sat, 29 Aug 2020 16:21:56 -0400
Received: by mail-pj1-x102b.google.com with SMTP id ds1so1123771pjb.1
 for <qemu-devel@nongnu.org>; Sat, 29 Aug 2020 13:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9L/aGUaP3iq4qPOXVXMB3tKy0tWK8spjI5tS1ind9xw=;
 b=KgZt3NJU8GLEYtnk4a/EHS8K77MXgKw/DoddZBq3oECH9XbqfVuTFfznOKVPEvljid
 jQPh770UP9ybJJ/wl8m+G3oR18LN4k9Uc49aTkP6sskilIcPiF5AW1o6CsILsjPV1nti
 f/VrAG9Bgd6pwQmmAvOtsyYiORpt6FCDL3I/vEBP/Au2cmIKovFi1tTwn1ccUw2GRX7e
 QYlpEIQPS60v9AkTLuYEkgu5Gv75iQRWEkI4k1mi8I9SuuiRcknvlftjRWHDnCIH/7U5
 6RfqjB9QaKk3lhDg7MeWn6V6FUNhN/3im5HTTlHfRsDraOZIJxlE5ovOyZB5a/tL5e01
 6GVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9L/aGUaP3iq4qPOXVXMB3tKy0tWK8spjI5tS1ind9xw=;
 b=CMB+EadAf40a8xPjPudrnNEOXSBFfGmFhZVrAx390vkHcLMfzXzjT3zaUaAUhc79w2
 1/rIJrXsrBBTSgYt1o7MowDOxiFObdB7LLj0PtgNsSoAAylXbqe1BfITgxdTtZkW3Kt1
 6YPxREs7z1vZbTKqGy4gCku8NKZs9tXIvFROgxKeJrlfjctP6jvZq/DkLRq0UqHirAqy
 jt/8SlpzK2kFL9qJWtT8aYY7WmYAfOJ7paGyZLrWPzLzro91x9c5kN6MG7kd/At5RJoh
 zh/1Eou4m28z7mdsAa242WpeM6WS4xF4HajDaR1fm+zUTH6AYF9s/ZUPwzMmxo0nvoDD
 XBmA==
X-Gm-Message-State: AOAM5307IY2miHo1wEErvyW7KNCVQeJQ4aNvmgzJGJzI10yg0dXhgU5i
 qqdpRFOjwS0YPK9Il1+Idr60Ulj43NZMdw==
X-Google-Smtp-Source: ABdhPJzF4dJzSfpumAvcRExs3WAXsUXL82+pHCcf39Jyhs2cXcOmnjYPVLDVk93vRF12kRJ8ELjtFg==
X-Received: by 2002:a17:90a:950a:: with SMTP id
 t10mr4092385pjo.107.1598732513829; 
 Sat, 29 Aug 2020 13:21:53 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id i20sm3566533pfq.204.2020.08.29.13.21.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Aug 2020 13:21:53 -0700 (PDT)
Subject: Re: [RFC v4 45/70] target/riscv: rvv-1.0: add Zvqmac extension
From: Richard Henderson <richard.henderson@linaro.org>
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200817084955.28793-1-frank.chang@sifive.com>
 <20200817084955.28793-46-frank.chang@sifive.com>
 <39cd6665-b74e-c61d-97ba-1ef1d41487f8@linaro.org>
Message-ID: <48cad5a8-c81f-dd8e-4452-add26d351e8a@linaro.org>
Date: Sat, 29 Aug 2020 13:21:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <39cd6665-b74e-c61d-97ba-1ef1d41487f8@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/29/20 1:17 PM, Richard Henderson wrote:
> On 8/17/20 1:49 AM, frank.chang@sifive.com wrote:
>> From: Frank Chang <frank.chang@sifive.com>
>>
>> Signed-off-by: Frank Chang <frank.chang@sifive.com>
>> ---
>>  target/riscv/cpu.c       | 1 +
>>  target/riscv/cpu.h       | 1 +
>>  target/riscv/translate.c | 2 ++
>>  3 files changed, 4 insertions(+)
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

On second thought, the current manual says

# This is only a proposal for a future extension after v1.0 and might change
substantially before ratifcation.

and does not even include the opcodes for these.

I think we should focus on 1.0 and drop this extension for now.


r~

