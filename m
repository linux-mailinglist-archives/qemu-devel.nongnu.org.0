Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD1E2DC356
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 16:43:14 +0100 (CET)
Received: from localhost ([::1]:54764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpYxN-0004E6-Fu
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 10:43:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpYfz-0005p9-IP
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 10:25:16 -0500
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:37801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpYfu-0006gt-A5
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 10:25:15 -0500
Received: by mail-oi1-x235.google.com with SMTP id l207so27906663oib.4
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 07:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Kzs6N7vPIGjHsPFBWcJpGYTind6XbEBvmk85TtJ8few=;
 b=mPvhtLnilo+vP9OfVkyypVXuaf8iTm1OCCVZQjASJQIco0CVDdFqnldeOUGlcTclrV
 OMis2bAWhQc++Ojufwjylp3YKdgXP2NogaBb8HR/D+Ru2CjLIRS9MozWMeqWycYxfwXH
 JtWSE3aeZbzpI2HvNLzk4wd0nGJGFRkyZvEQt9058BpvVQtL9jfj5ZMguyMkaDAltHHC
 k8kDtiYVMrIjaueOPnV0Prh+Jtd7vOg5Zp6fnJ7xhxCQXeYaICYujJqteP/vBeCqd84P
 FMpbchaJ7ybgne/REZW9tH194kjuDwbvPJoXNYFdIDY269bHQL5trzSdxqSj9t2zQRW0
 5aPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Kzs6N7vPIGjHsPFBWcJpGYTind6XbEBvmk85TtJ8few=;
 b=m8UmR0ZtKCwwBd+DIPIynzcndw9Gc8JVYR3BSrDU8MdQDGI+4N2Y+xHo9pqJPGZqF1
 a/IU9h5zMyKq6aUuCr1l84qWnqmSzIE91xoDsaQI83dkw6BpwgpHXccjmJ0daZOm4Er8
 AQr+2pw7zOF/PPWVVw4p4qCJ1ZoD1jDpC7CpprAZoXN1fGceSQWxcrQVI4BXjHynqcRl
 5wi36DZRxg15w9eEKBCzsTnHfHS6rFuaaggJO4bSppcrB9O49v+t6OlvLfGO7bDiE9aQ
 1GGw5SBf4S0dlVuIuDrJ5Z2KL8QE1YSFh2QicOP9JXbZ81Brs6idIJiFxCEgdXU9mW56
 o8Jw==
X-Gm-Message-State: AOAM532bvkVk3eF3zEKG86hgv1t00mLQEmzn2EMd3TCLOGPeGnYyIdBa
 TwE8qJlBdOuk8LyEMzNIGU+xAA==
X-Google-Smtp-Source: ABdhPJwZeoPo9x8omx+s81/54cyOuzAHHrczEqi/4LBb31/NEc+YbqFYrgBCMYpFAXLQ2fhSxkv3Ug==
X-Received: by 2002:aca:b506:: with SMTP id e6mr2278535oif.119.1608132308042; 
 Wed, 16 Dec 2020 07:25:08 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id 30sm490279oth.7.2020.12.16.07.25.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 07:25:07 -0800 (PST)
Subject: Re: [RFC v2 04/15] target/riscv: rvb: logic-with-negate
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20201216020150.3157-1-frank.chang@sifive.com>
 <20201216020150.3157-5-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <db13a75d-1632-1683-6f3a-af1935fc8b7d@linaro.org>
Date: Wed, 16 Dec 2020 09:25:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201216020150.3157-5-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/20 8:01 PM, frank.chang@sifive.com wrote:
> +static void gen_andn(TCGv ret, TCGv arg1, TCGv arg2)
> +{
> +    TCGv t = tcg_temp_new();
> +    tcg_gen_andc_tl(ret, arg1, arg2);
> +    tcg_temp_free(t);
> +}
> +
> +static void gen_orn(TCGv ret, TCGv arg1, TCGv arg2)
> +{
> +    TCGv t = tcg_temp_new();
> +    tcg_gen_orc_tl(ret, arg1, arg2);
> +    tcg_temp_free(t);
> +}
> +
> +static void gen_xnor(TCGv ret, TCGv arg1, TCGv arg2)
> +{
> +    TCGv t = tcg_temp_new();
> +    tcg_gen_eqv_tl(ret, arg1, arg2);
> +    tcg_temp_free(t);
> +}

Drop these functions entirely, along with their unused temporaries.


r~

