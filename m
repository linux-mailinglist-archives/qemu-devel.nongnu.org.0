Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F39606AD35F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 01:33:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZLFl-0006ef-V0; Mon, 06 Mar 2023 19:32:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZLFj-0006d3-TM
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 19:32:27 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZLFg-0007rW-Va
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 19:32:27 -0500
Received: by mail-wm1-x32c.google.com with SMTP id j3so6808883wms.2
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 16:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678149143;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qe2ODlTs4IBzXzGgr2jSDMy447akIdm4ZtVi3N5Y4XM=;
 b=M9SvHaNqPVenACAukgW0dZLxO+S+PURldLFBQSe69KsWjBidotxl9f7AEJ2ylbwz4+
 vAOgWM9sgJHn8lojQjXb8JHEliDpAwHQzLFIZ/mZIxb0HNGDGmFwlnE0KyWRq1hoYJeP
 QHsI7cPXIzursAG0wJaBVpfhHNLK29xO3SlfsTqMAJIDvZ+nYN9GihIScZtqmcGr0pok
 lS5/SRJXai76hrdTn5Vj4km67bCdamAP7vWpyaAJ37m0JqRPdxJL3QGVhT32kAAqMQzp
 vNJF1Nc7X22+yAo+uS5ilINXzkSyWgylBk7sFcGMypLu3RqVGHhlDpxHnS+dGnWwiRwM
 6Xxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678149143;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qe2ODlTs4IBzXzGgr2jSDMy447akIdm4ZtVi3N5Y4XM=;
 b=6NVFbhWiaNYlrTJg3diMuaM7Dfv5DQl2v1mmQzflAWMlXN5mvWPkqlQcm2CO/FH92Q
 avUVTwh3kkY0hmOuI6WDlxEQFYfDyoIaePsz0Vu+CwwQTltNfeu/4uhBDLXScLEOXDx6
 1hKSOtWyHVDhTRWD/r6nce/4ThnBBZj4WdEVcAmdAvA7Cn4cAm4Y3WSPwqUbCJAQhE9I
 Abb7/OYE7pccjGyQKMfowWcKUKYEUIoosT1nYm4TdXjqjNfLKgxwpBm6l/ij5ezw30uv
 LbtO0IecdeXl90TJ/1QZKvK0OH/4Rbn3TvySC85iqPQsf8SXGVjOR0zdfhrljoPjvelP
 YFAw==
X-Gm-Message-State: AO0yUKXv+Z907gcdr3IlH737ojtP0GHA1z3hFPka7SxUcbo9YdBgCxyo
 KRZd85Eep5kDWLZv5TF/Z0oWDQ==
X-Google-Smtp-Source: AK7set+bWe0mEoYlmFbhjL9xtwjla8AgxcgirujLaRx3kzzrNm2yd7wgnPJCtyhJGRtZhbfsCT239w==
X-Received: by 2002:a05:600c:46cb:b0:3eb:4cb5:e13 with SMTP id
 q11-20020a05600c46cb00b003eb4cb50e13mr11138169wmo.31.1678149143380; 
 Mon, 06 Mar 2023 16:32:23 -0800 (PST)
Received: from [192.168.1.115] (138.red-88-29-178.dynamicip.rima-tde.net.
 [88.29.178.138]) by smtp.gmail.com with ESMTPSA id
 o11-20020a05600c4fcb00b003e8f0334db8sm16618566wmq.5.2023.03.06.16.32.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 16:32:22 -0800 (PST)
Message-ID: <cfd598bf-1276-eee1-b4cd-6030a06967a9@linaro.org>
Date: Tue, 7 Mar 2023 01:32:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 47/70] target/rx: Use cpu_psw_z as temp in flags
 computation
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-48-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-48-richard.henderson@linaro.org>
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

On 27/2/23 06:42, Richard Henderson wrote:
> Since PSW_Z = PSW_S, we can move that assignment to the end
> and use PSW_Z as a temporary while computing PSW_O.

Nice :)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Use tcg_constant_i32 instead of tcg_const_i32.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/rx/translate.c | 28 +++++++++++++---------------
>   1 file changed, 13 insertions(+), 15 deletions(-)


