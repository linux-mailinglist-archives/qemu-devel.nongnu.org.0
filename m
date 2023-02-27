Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D15C6A3CF3
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 09:28:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWXn6-0004s2-SC; Mon, 27 Feb 2023 02:19:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWXn3-0004pX-1H
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 02:19:17 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWXmz-0005ew-R1
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 02:19:16 -0500
Received: by mail-wm1-x333.google.com with SMTP id j3so3580197wms.2
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 23:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EkabTtd7DUB+19zLLPs/zHOycE77u2Vk1pv1TbWdLw8=;
 b=fy5cOHwCUrL9UkxIJSSolZ8m4lbo9PsUZpKRuYs0a9pbPOpEwudDRnoZuaK6o1cLrH
 0bprjYHNFlMqrHMkKXR3+ZQC38iiInw4C7k+p3+UZHufxrUGzaurQ6HGAM25PJTI/K2u
 S5nFVmi3SVSGwSGvBtb1PbKYCpWR4om3eAj0YjFIWTQxPGrNR6X1ePFavA4ts8sGF8fs
 vMTMknKvWrruTV+ImWUgnzTGp11qnHggCHS/DcL6iKLNvRBBlOLYr4uKEtWlIIBj2D++
 xZ4X7D9ixqCynIA1OI4QvDmUEh8Wrk0uUYAxUzqbAr/hJIAWbVkZKUit0CoSlXoLL0Nj
 FECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EkabTtd7DUB+19zLLPs/zHOycE77u2Vk1pv1TbWdLw8=;
 b=mhjmyhQGXjccvwRejyvvg05CMFqj4/7+Gon0lM7nVfzBYBgN9P92Oa03+nA6osUfTJ
 bV8kN2ZgzO37zON7AxGpgJyu7mrZmtBbDGUK9uIetU0Ct2k9i2MGHUjvUkfvOyvYD+KP
 PrIGWvcpYFHFJFwudsnzoF41geEPut4J8epjXLI699mPNw5hkd32DD19CrQUyLHh6iM2
 j5t19XdDq2+MSdzfDqFs23hsF4mrvKThxM9afM1+mq2jDsBQ5h3GSUhBX+s/3HViEd2d
 tcGgEXwSsYIR5GbZHRDmsMxASawoi86MOCHbM53NEzZnklOn6OKkTZql7/dEL3bd8Mbt
 1N6g==
X-Gm-Message-State: AO0yUKXJHUVKsM3nE7VBwPF6MtYTRNlViljzlOUPoRBvcDb0FDpt4l9M
 gY+TXR013CvYvwfBwASfeDKHjg==
X-Google-Smtp-Source: AK7set/uLA6J57SQAhzhLmTu88L3XFpIItUCCGp1qjUwEHyrQs3A/Trbz+FnMl3LO75sVajkrY1c2g==
X-Received: by 2002:a05:600c:1609:b0:3eb:3f2d:f22f with SMTP id
 m9-20020a05600c160900b003eb3f2df22fmr2840340wmn.21.1677482346561; 
 Sun, 26 Feb 2023 23:19:06 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 i14-20020a5d55ce000000b002c559405a1csm6169808wrw.20.2023.02.26.23.19.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Feb 2023 23:19:06 -0800 (PST)
Message-ID: <8aacf5f2-22ca-8905-0187-094e66d1261e@linaro.org>
Date: Mon, 27 Feb 2023 08:19:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v4 23/31] target/hexagon/idef-parser: Drop gen_tmp_local
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227053701.368744-1-richard.henderson@linaro.org>
 <20230227053701.368744-24-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227053701.368744-24-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

On 27/2/23 06:36, Richard Henderson wrote:
> This is now equivalent to gen_tmp.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/hexagon/idef-parser/parser-helpers.c | 24 ++-------------------
>   1 file changed, 2 insertions(+), 22 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


