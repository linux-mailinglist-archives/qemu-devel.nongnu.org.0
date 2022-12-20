Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1C06516F3
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 01:02:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Q4g-0003kj-8B; Mon, 19 Dec 2022 19:01:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7Q4d-0003in-OE
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 19:01:35 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7Q4b-0004mK-W4
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 19:01:35 -0500
Received: by mail-pl1-x632.google.com with SMTP id 4so10627326plj.3
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 16:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iS4THvKnSwTsfAxz+CNXXE5rmskm9qZha4MGsWEDNw8=;
 b=DuRyjxz9g1j4Co4nQRnYDHsun/hSB9+vkWLk1gS0HCd7bgf8YFb2HJC000U0ecMhq4
 q++N+EDKWO09cqLrojpnzrynz6uNT6WLk8MxKBDeLiUfU+GHVHA2AePbw019wDDaM2CS
 lHzlG67rRgi1jcBEFkBavs6mjyA8pRsswTycfZtbm6j2DSdOWI51FBgwSGMDCoUh7MQq
 Rp/pFPyCC0cbkf2rAjax9HWdRS2o9SmKRTjpN28V9bdRRwiOkqd013wHt4dB8UR/pX1i
 FPBHQ+gjXjiAZ0UuZ8/GzfXVCz0+G6ZfhKhyvXEsqegaOBPOubPw8WnOe7j3cawWwyoR
 8W1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iS4THvKnSwTsfAxz+CNXXE5rmskm9qZha4MGsWEDNw8=;
 b=2V2tCvgFYkAhZpmJzizPwJqlp3DP/2uGrAJm5gIR/n4VQhOoxE+DS+tlSlv8MwvU8B
 26S6gUCnxulHiaJXrSOS7foMqmuNhFInmV4/pYxA7Mnw9jUpUJIhIWNc2PZY7iyNnFT5
 Ta/YvezYhHV+twRTeIU2biXgEVPl/NgBaX7gK5tSW+Hn5IhzxE8AYWlSDYcYh/LxDEa4
 ulJ19VAondlgSFgV35MWMoNUnnbJfnX9sd8tIoNBmBxsxScrbMDV368+aIRvhVf+B2Md
 yFmSyCIfUBcJoilW0T13pKhtgcXWbcmuaQ21FSABQ2O+j1DBhxHEjbSB2hKGeKKcTdg9
 5dBg==
X-Gm-Message-State: AFqh2kpO+yP5fvWvXny76uggu6QyIlpsQ9xh8+r4YyqlUiU6ysRbIwCk
 5pwlU5iPTdh5lhak5eD6qDDVwOwFagpkGmRk
X-Google-Smtp-Source: AMrXdXsJbN54YYCKssRW8huXH46mnjyBsrQdb6fy1HoRVX1GAZUBDmdrGtarFGFueIjpekX5ZvRleQ==
X-Received: by 2002:a17:90b:297:b0:223:de05:eace with SMTP id
 az23-20020a17090b029700b00223de05eacemr2204671pjb.41.1671494492131; 
 Mon, 19 Dec 2022 16:01:32 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:b343:d344:137b:e318?
 ([2602:47:d48c:8101:b343:d344:137b:e318])
 by smtp.gmail.com with ESMTPSA id
 e13-20020a17090a7c4d00b00218e8a0d7f0sm9759066pjl.22.2022.12.19.16.01.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 16:01:31 -0800 (PST)
Message-ID: <fb0772c7-123e-c862-3f7d-875c2180cfda@linaro.org>
Date: Mon, 19 Dec 2022 16:01:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 5/4] target/i386: Restrict 'qapi-commands-machine.h' to
 system emulation
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>
References: <20221219211034.70491-1-philmd@linaro.org>
 <20221219212229.72052-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221219212229.72052-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

On 12/19/22 13:22, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daude<philmd@linaro.org>
> 
> Since commit a0e61807a3 ("qapi: Remove QMP events and commands from
> user-mode builds") we don't generate the "qapi-commands-machine.h"
> header in a user-emulation-only build.
> 
> Guard qmp_query_cpu_definitions() within CONFIG_USER_ONLY; move
> x86_cpu_class_check_missing_features() closer since it is only used
> by this QMP command handler.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/i386/cpu.c | 74 +++++++++++++++++++++++++----------------------
>   1 file changed, 39 insertions(+), 35 deletions(-)

Not moving these out to a separate file?  Anyway,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

