Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 320886AC1C9
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 14:49:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZBD3-0002nk-Oe; Mon, 06 Mar 2023 08:49:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZBCR-0002cP-Ok
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:48:24 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZBCP-0003bJ-7N
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:48:23 -0500
Received: by mail-wr1-x432.google.com with SMTP id bx12so8845638wrb.11
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 05:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678110499;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bY0W063cVUeBO6Zy5flXsy/MS0XG4b0EthfuVGWoFXc=;
 b=WqUKRhGACjXDM4/x5e5Wk5wlU5XAyGwbDvc3p5i03Y+x5+BrLaO4JNkCrTsGadVXly
 x1nHp0tic5cp/h5OO5CQRtBTuka86wLronwowNj9qhZGmnQ5t8ieM9nY4ELyNvurGTKn
 dxv+2njFo3IZAcrFjMC0x5/rjxcadPsL9Leu9nO9I2AzYwPdKrdbvFZtYTDsfQYbYCeS
 5U2GAPPAloA8kwZnN06xrBTiSvJlF0C66u6U5+YUiuJDruARyXE9jaq+jbrhONAZn214
 CIdrjoSdgogTxUrNrpCaMJFd7syr2zBDmvW3rF7co/G3vwIIWnsfmZ7cA9CXiwSlXyUb
 z2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678110499;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bY0W063cVUeBO6Zy5flXsy/MS0XG4b0EthfuVGWoFXc=;
 b=kmGDZHYhXBgYjgn6vCYBP/PHf5nkkZ1u4MFAoDtRbZ4gA6DjtQX1G/lnlWhPnz43bd
 05QEVby26S8HJE6AGlvlBC3jAV9Foy6bpPP5Zf952OoE4VpRxlX4fTiO15urqlNnoW2z
 802LLRlK66kqpmY0uixtdchQhjDV/v0Z3HPi+5VJ4LkOThwU/g2f/0Y8R5hrwgXxi8Tn
 zMailqVVcvSj7lg8K5NCdt49cOmaIp0oHDzHVMuusBnoUUmxLX6cBJNsTV19AydohiUp
 kL8k8A5BpcVeRVUFQsy1B5bB6mT8GNLiEeYtLpJKcYndFbe18RmTAgmnaRINPgk28VMY
 necg==
X-Gm-Message-State: AO0yUKVGwd6iuxECXYYzBqUeuO2rvIHCLlfVlklugOLJHevm772cZr+1
 RsOEF9pSWjBdbj5Lwk37YI8EiQ==
X-Google-Smtp-Source: AK7set/iV5GpYNhIwoCKEMvT4cY2jANqUt48bTb5CgS1e2tXRdgA+wbH3v18xhuuMexDa4hadpDQAQ==
X-Received: by 2002:a5d:6e02:0:b0:2c6:e827:21c1 with SMTP id
 h2-20020a5d6e02000000b002c6e82721c1mr6478456wrz.50.1678110499396; 
 Mon, 06 Mar 2023 05:48:19 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m5-20020a5d4a05000000b002c706c754fesm9638645wrq.32.2023.03.06.05.48.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 05:48:19 -0800 (PST)
Message-ID: <64d51c6e-f898-d1ab-b30c-4e3b6d394eef@linaro.org>
Date: Mon, 6 Mar 2023 14:48:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 46/70] target/rx: Use tcg_gen_abs_i32
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-47-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-47-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 27/2/23 06:42, Richard Henderson wrote:
> Remove the local definition of rx_abs.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/rx/translate.c | 12 +-----------
>   1 file changed, 1 insertion(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


