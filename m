Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5206069DB42
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 08:34:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUN8i-0004Tl-Nw; Tue, 21 Feb 2023 02:32:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUN8f-0004T8-3z
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 02:32:38 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUN8d-0005iI-Cc
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 02:32:36 -0500
Received: by mail-wr1-x434.google.com with SMTP id bo30so2774336wrb.0
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 23:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XgSGtZbh2k1KwRIHkfuUtZPlXezV7+nPmyuan0+JkYo=;
 b=QHKQ0kf8JKmT/8yy/PAUtukX473core8pwXGllxAFMTlZa6YbmDa08qp4aMhWFJbGN
 fgxl8AxIAtDX/babEZLPdcqzDcK2dOa8zjzi4ft8dqXVvx5A2wNGy01F3FUjpENnw1ff
 VDEFJE4fHvAxIsTs5RLIa5LBz97Ssx05c0D7F4EZD62PEptEvOt0V+TB6wetIlgRHfG6
 qq/Bpkg9MGPbJ7o6f0Fy9kYkAxyx+9Au7SHrzcH6bWR6+6qH+aTFvxEfInvx0zyijySL
 /woTdCe+HKVLlAoP/FBldUAbhOV8yB8qNPYXoxLMIvp20MKAtbEhsLGXpUBwOCehFe9w
 LjRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XgSGtZbh2k1KwRIHkfuUtZPlXezV7+nPmyuan0+JkYo=;
 b=0ucYjyzGEXpLFtL7w6sQE+nYTSktRi18sPtW0iTbY8DwX+GhRqpi9IuDMg30zvUlg5
 zxuQcRqmSV+7HM1TFNVx2kZJLob3rXSB0AKV59HlMjWpemHjarMnXACeZrdUyxU3Syql
 2yhmn9Oqu31U4+Rw1X8DRvI3Mqtprd575zfkX32NrHp3khK0z6j78BTUu2sP7Nc+F8ML
 5akdjtaBdGCiknSq85iKAComS0TDXypt9pux9UGg8jUPScv49rGzMAO4qpnlRVPhAXeK
 557sGZlJ1FdG+jOVX4l51F0x8UUV+Qnvt3zYj2GqwWG5xLkPoRHqk9bfH2Mi1lhU1za2
 Upbg==
X-Gm-Message-State: AO0yUKVmaO6BPbfKnXFHifhINxhLLPV8eBMoG/AAF1G91p2xNJYmbFq+
 1hNZ9hoUQs1ddhQpnxIkWUhGEQ==
X-Google-Smtp-Source: AK7set89moDTK9QhvkZBYG87TH83R/QzZQjTgbvh8XvlWrwU3HtrbtMvCgEmJiWNu2uRhHg8395Uyw==
X-Received: by 2002:a5d:5489:0:b0:2c6:d392:5579 with SMTP id
 h9-20020a5d5489000000b002c6d3925579mr2482110wrv.16.1676964753437; 
 Mon, 20 Feb 2023 23:32:33 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 t23-20020a05600c2f9700b003dc521f336esm3082787wmn.14.2023.02.20.23.32.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 23:32:33 -0800 (PST)
Message-ID: <d60bf2f2-99b9-cc14-513f-53e9a007c932@linaro.org>
Date: Tue, 21 Feb 2023 08:32:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 14/14] target/arm: Implement gdbstub m-profile
 systemreg and secext
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, David Reiss <dreiss@meta.com>
References: <20230221021951.453601-1-richard.henderson@linaro.org>
 <20230221021951.453601-15-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230221021951.453601-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 21/2/23 03:19, Richard Henderson wrote:
> The upstream gdb xml only implements {MSP,PSP}{,_NS,S}, but
> go ahead and implement the other system registers as well.
> 
> Since there is significant overlap between the two, implement
> them with common code.  The only exception is the systemreg
> view of CONTROL, which merges the banked bits as per MRS.
> 
> Signed-off-by: David Reiss <dreiss@meta.com>
> [rth: Substatial rewrite using enumerator and shared code.]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu.h     |   2 +
>   target/arm/gdbstub.c | 194 +++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 196 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


