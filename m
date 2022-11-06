Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE2D61E526
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 18:55:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orjqi-00066V-F4; Sun, 06 Nov 2022 12:54:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1orjqh-00066J-0p
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 12:54:23 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1orjqf-0002VR-I8
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 12:54:22 -0500
Received: by mail-wr1-x431.google.com with SMTP id y16so13249247wrt.12
 for <qemu-devel@nongnu.org>; Sun, 06 Nov 2022 09:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XLLBz4OlpLtv4ZHGhAgXF3XnoiKV7da5s36y83PUVfU=;
 b=t18R8UfBxc4P5DpuPb9nwOZTiDbWXiRrK+YcmQ2x2ljSYmCyNVNjPpWow1LHq5LwtP
 rWzidXmFvQ7SCZBjeF1g3kA8xuU8TX0USESBdt2qK7pcV+w+RH8epuKVy+KKDgNHR8ze
 qv0ctdmBGMuy3LLvQ+gFt8vlEB7oiYsLEu7uhGpykpx6IvoXJheq0YpIRUZO+/oPBaan
 Ik2980kcCGfWHMDgWDjKnPclYAnohK+hPgXypzJ7JWJURWyTnyP1yZRd2ZwBb2K1Cav4
 qDZavRZJJvtQxB6Yg618yztLis1id2TCG6VEpmZs9UCfOZ3HLw6LUm5rZOT9sURlgMI8
 T/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XLLBz4OlpLtv4ZHGhAgXF3XnoiKV7da5s36y83PUVfU=;
 b=x3JpNWjEMCAAsKXWtTXNY9I+t02LLgXi35KGh3rovPzx9jbRLMG3l8d49f6GksggwW
 /WC2O74J0VFfwCJ+cWHnOEQqTpZG0AHKM8616NRxmgrGalefCwTlO8pFMzuSTvVZFsnA
 uKfg/8PMJK6W0AN5/QVLksbJ0GR+d3WDROm64xqHxS6Vz+V+iZFn3B+6F1CQVDTV4wkP
 dfJ9QnGHyPvbq51pluIncSaZOYxLFSnknILRfX1UXPkiu6tbg65t1jfFyNnT0zM8v6lj
 agvRTQSxaIad+4LX+gCzvnswbM43wgXLDiqcC1h02jYEn1eTLpL094bqDiIV0mpYKtIC
 mNvg==
X-Gm-Message-State: ACrzQf2mxAwaRVrtvZjszegO7k9YsMti/eaC1ZA0NBYBK0BL++EeJOWm
 3uQqQMt2zz2DPTcEzza9KjYfWU3jd1haaw==
X-Google-Smtp-Source: AMsMyM49WUB0eAcURnlUTWYofxh4LEuaTfLBiK6O/A5lYFTiqt5ZY6o2mBWHtMZT/ETCcdIDfm3X1g==
X-Received: by 2002:a5d:4d4c:0:b0:238:6aec:878b with SMTP id
 a12-20020a5d4d4c000000b002386aec878bmr12438650wru.0.1667757259875; 
 Sun, 06 Nov 2022 09:54:19 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a056000010f00b0023691d62cffsm5174274wrx.70.2022.11.06.09.54.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Nov 2022 09:54:19 -0800 (PST)
Message-ID: <fb3b58f4-fc6b-a4b4-da7b-6802ff54e0af@linaro.org>
Date: Sun, 6 Nov 2022 18:54:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [RESEND PATCH 6/6] accel/tcg: Split out setjmp_gen_code
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: sw@weilnetz.de
References: <20221106023735.5277-1-richard.henderson@linaro.org>
 <20221106023735.5277-7-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221106023735.5277-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 6/11/22 03:37, Richard Henderson wrote:
> Isolate the code protected by setjmp.  Fixes:
> 
> translate-all.c: In function ‘tb_gen_code’:
> translate-all.c:748:51: error: argument ‘cflags’ might be clobbered by ‘longjmp’ or ‘vfork’ [-Werror=clobbered]
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/tcg/translate-all.c | 58 ++++++++++++++++++++++-----------------
>   1 file changed, 33 insertions(+), 25 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


