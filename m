Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB77407F70
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 20:38:50 +0200 (CEST)
Received: from localhost ([::1]:55794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPUNN-0000Yw-Fi
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 14:38:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPUKk-00065U-Sj
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 14:36:06 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:44984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPUKj-0007Kh-C2
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 14:36:06 -0400
Received: by mail-pg1-x52f.google.com with SMTP id s11so7240536pgr.11
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 11:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0Mc8dqu3cJr5IlZVKu6NlG245zd0YF4wv2kqwXM3698=;
 b=HHjKS/t472l8PVioMwL2DeKsjsA/J1AJh1ej4obyEI9aJ1YRhvj4DN2qZj9eMMFe3G
 fJcNcuwCPtQnAW/8LBCFgEzRbLTgGoC57LRo1iUIjUl3ZRRgK5++RILTDIVwsKugAtvJ
 REeARG8d6WcbljSvYrqQOL7T2Ujc77EWv07U2pbwp20/tlrg0xhtSYdpZ3/C7t4eppyH
 ap9et6BFPAIF2BcujMUd2bqXMLMnY49BG0R/7RV7PDkXx2kWRYsypV/LFIKEsTg+z59E
 hwCdaZARQB9Tc8FhlZYTHeDaW5KymcdFQB7AaGi0fyRtsOMbs3wR7o1zUcLJAA2U5W7X
 l0Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0Mc8dqu3cJr5IlZVKu6NlG245zd0YF4wv2kqwXM3698=;
 b=zzf85fNylFRzg1fHq5CoeGBrAaCUAEnJgrDbbxXf0lWPSsut9aK3aRjcRy+S0qaYMQ
 Rj2CcYLw271NrFD7zi3bZJGSSLcDvvMJTCZ0hxlIYKH1DpufFwrAgF2ALwiz51w/CLVb
 pPBcfB6ed9q/rhUxY7t5N1ZaTp86OLhCZtqNkLLzry1oOCPbk94n65QJbzDavZEn5VjU
 nZ9vocEOdz1ZAtvwwB8UUWEqmIFPefmVZOcnMxK5k/8hnI7GUc4vFwqptepFYy5zXOom
 A23bi/6GUcw877F4gL/6ZMPowQaJ7W6AccLeHK2SAnWM1tPdycbr91+wpL0ItwFHcN0V
 b2UQ==
X-Gm-Message-State: AOAM5317zPqVoqzIl3sy49rVsTIdBlGEyHlz1X/JMDhX8uoInDM1BC30
 X99QTK3cNKg44vuHTwdPIoLkug==
X-Google-Smtp-Source: ABdhPJzFXcNdHP0vcu+7TlWP0a3rcQDAY3atRfbyS5fVdisYZbZO6XbF3tbWqT6+UJSxTSspxDw1Zg==
X-Received: by 2002:a63:f306:: with SMTP id l6mr7584275pgh.72.1631471763519;
 Sun, 12 Sep 2021 11:36:03 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id d10sm4608966pfq.205.2021.09.12.11.36.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 11:36:03 -0700 (PDT)
Subject: Re: [PATCH v4 26/30] target/sparc: Remove pointless use of CONFIG_TCG
 definition
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210912172731.789788-1-f4bug@amsat.org>
 <20210912172731.789788-27-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2600f4b6-a912-c516-d9c0-32d69684ba8c@linaro.org>
Date: Sun, 12 Sep 2021 11:36:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210912172731.789788-27-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.584,
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
Cc: David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/12/21 10:27 AM, Philippe Mathieu-Daudé wrote:
> The SPARC target only support TCG acceleration. Remove the CONFIG_TCG

supports

> definition introduced by mistake in commit 78271684719 ("cpu: tcg_ops:
> move to tcg-cpu-ops.h, keep a pointer in CPUClass").
> 
> Reported-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/sparc/cpu.c | 2 --
>   1 file changed, 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

