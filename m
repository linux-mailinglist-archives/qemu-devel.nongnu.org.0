Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CADBE1F5AAD
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jun 2020 19:35:10 +0200 (CEST)
Received: from localhost ([::1]:36196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jj4d3-00032C-Ro
	for lists+qemu-devel@lfdr.de; Wed, 10 Jun 2020 13:35:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jj4c5-0002FM-NH
 for qemu-devel@nongnu.org; Wed, 10 Jun 2020 13:34:09 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:41802)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jj4c4-0003CJ-I3
 for qemu-devel@nongnu.org; Wed, 10 Jun 2020 13:34:09 -0400
Received: by mail-pl1-x642.google.com with SMTP id y17so1212319plb.8
 for <qemu-devel@nongnu.org>; Wed, 10 Jun 2020 10:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=btNqLFwPFUT5hq/IqXjWUMWAkF+LGRElOorxEgC/Fdo=;
 b=kFJwQkEDd54pk4aQqbN8ePtbaiMQEFjNWhBDnQ1FHzbN2GJ350U1Cayp5N8xL/CIzl
 RRfXHwpFLp7hw/+p7oDb3gljvn5p+nF0vCFZoN3craAiTfqguGB/pZ+q/TzHIbW+Nkpn
 hC/JLj9la2m/P+R/lAcFO9lTZvrPoQg1FkDENvF5G42h7xfvj2HFGZEEuKy/CPobd2tQ
 earoF+VFNFIQyuypeOL8YLHvDIfQx4MClt9XaFW4++AiNiueDhQtKeqwvy2LE4ZpExh0
 u6lYZ+UtVsoIyIqFOQ+pM+5kaHW38MJ6rlAY64OCK3seCQgGxEo9Vv73IBy+MppnTjDj
 LbWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=btNqLFwPFUT5hq/IqXjWUMWAkF+LGRElOorxEgC/Fdo=;
 b=I/mn2HNe+vsSDxvGnii1OH70Y49FkQ3cgmirXMewUGqN2FWk09+fF+y+Uh0F8h1qoI
 BGsQ7mXvy7YSoH1qNrr0AjL8olaZLhM32L39rnsc6LMCNDOiCpdzXCfGDeacNLzDrH66
 Sw0NCoVYd36oEnPr0j68NI7+fAwIBUmu8ZCc99uPcF9EbbcK6VxV8fi6ggfgREW5ln8c
 zXHqeBVdlnYpEpKyjEdoaQ45XW558sCUBpkz6UXaGaSahD6kw/BjhSJSMG6pnqO020XD
 h9f61APebAGePW1u16tVWMMSH6QmVzLDv4JVBy6p4rLeEOoBFPdJwEiNcNQFhgTC33hO
 Ljqg==
X-Gm-Message-State: AOAM530LcyHMZ1tLwcZTWVNw07nSNIzTI1qdgOTxgjpst7jYbbSFMLTR
 eJSt258Alg//Nrg+s+lZskj0Dg==
X-Google-Smtp-Source: ABdhPJzY7dul/0xgORnECo3iJlwEjYmdm7KqffO5UyN2tYVvSfPpcPo/fphPHhx0zu4F09Xb3e+N/A==
X-Received: by 2002:a17:902:7c8f:: with SMTP id
 y15mr3795286pll.95.1591810440615; 
 Wed, 10 Jun 2020 10:34:00 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id t201sm511414pfc.104.2020.06.10.10.33.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jun 2020 10:33:59 -0700 (PDT)
Subject: Re: [PATCH v9 39/61] target/riscv: vector floating-point compare
 instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20200610113748.4754-1-zhiwei_liu@c-sky.com>
 <20200610113748.4754-40-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e6d05624-8e4d-76d5-d085-a81553773fd7@linaro.org>
Date: Wed, 10 Jun 2020 10:33:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200610113748.4754-40-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: palmer@dabbelt.com, wenmeng_zhang@c-sky.com, Alistair.Francis@wdc.com,
 wxy194768@alibaba-inc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/10/20 4:37 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Richard Henderson <richard.henderson@linaro.org>
> ---

Missed the actual "Reviewed-by:" :-)


r~

