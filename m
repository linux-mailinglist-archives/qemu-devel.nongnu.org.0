Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9016AC1BA
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 14:47:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZBAy-0000wS-VZ; Mon, 06 Mar 2023 08:46:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZBAs-0000v2-CS
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:46:47 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZBAp-0003Oy-LL
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:46:46 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 j19-20020a05600c1c1300b003e9b564fae9so8231016wms.2
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 05:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678110402;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SwaZDzRVPvtDvH5F1nsKxdtLqYHNV8MypDVVMH5bCTM=;
 b=kTkpyZfHmLwD33iRcyFXfmwA8L8hVnd6JkVAZQSP/F1qoguqXPfZAuhP9rS2OfgXJc
 dfTQzZnG/TNNLVsc03zYPyyspe0jAFqwZuXhmQthsMu7h28frQGBRGkRzOkljsNLV8Ze
 k5LeBMiqkm02f90f1br416MRRpsAGQyde8PkUv6O6ScPFC//a0YkXWoEIy7Jo0HrINVU
 /CwoTW2+quwxK9IgHtQtWCSmT2mYUP6vR1xpgeiU+9i37cWOfYgf4huMF0eU6lSOIYPG
 +UXfJGwr8W5ilSp3oChj3rXqiPkIgScgzYvjFAyhh8ldZWjTuu11C+Wg92M5AI5IjZmq
 28OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678110402;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SwaZDzRVPvtDvH5F1nsKxdtLqYHNV8MypDVVMH5bCTM=;
 b=p3BGsAApmgeYit8PPwtmQj8qLc3IxsdPzsdFIZYqsYO8DFB6g//rzEigBN0ltLcOK+
 fTLtj8xV9G9S/YY20L9RFDsHC/iZ++n4g650UWHgDn79kqepY3Y3hSyybUOlsbm0uLyU
 9gZaQLf0orIsc4dYsusoO+mvr4HhC7ZZPq+mfLFGO6hp6C1vnfKs/u8KDuxVg1kdJzVo
 bNGRK64RGGHfmSON76BnW9z+pNapNgEA/bDB//Pf9mu0BPFAfeAguxSM2d3h9DZKJKZy
 IdBZ/p+9rIPIRDvPIzz/fFj7EhQByuVn6JZqUtp8tWaKNWSEYjEc6GGTLVHXAIW/z9DR
 z0Qw==
X-Gm-Message-State: AO0yUKW8uOs/fEunx5DUzpW3Fc74mKjaUU8gT/NRDkpRwSHQKvRfA50L
 mGJ7JQPEbaUTYnotL00N8i2eUw==
X-Google-Smtp-Source: AK7set+jceZd0PoJBJ40YpVEnsqykgKK8sAXq3rjd3wpP2o3NQEIy9DhdTqU1ovoSrCs70sQjaTMdg==
X-Received: by 2002:a05:600c:5127:b0:3ea:f01d:2346 with SMTP id
 o39-20020a05600c512700b003eaf01d2346mr9578742wms.15.1678110402130; 
 Mon, 06 Mar 2023 05:46:42 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 b41-20020a05600c4aa900b003dc42d48defsm10447543wmp.6.2023.03.06.05.46.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 05:46:41 -0800 (PST)
Message-ID: <605a242e-f5d5-788f-fc78-e24abb186ee7@linaro.org>
Date: Mon, 6 Mar 2023 14:46:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 33/70] target/mips: Avoid tcg_const_* throughout
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-34-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-34-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

On 27/2/23 06:41, Richard Henderson wrote:
> All remaining uses are strictly read-only.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/mips/tcg/mxu_translate.c           |  4 +-
>   target/mips/tcg/translate.c               | 56 +++++++++++------------
>   target/mips/tcg/tx79_translate.c          |  4 +-
>   target/mips/tcg/micromips_translate.c.inc |  4 +-
>   target/mips/tcg/nanomips_translate.c.inc  | 16 ++++---
>   5 files changed, 43 insertions(+), 41 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


