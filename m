Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D97C649502
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 16:58:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4OiX-00080g-Tu; Sun, 11 Dec 2022 10:58:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4OiV-0007wh-6b
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:58:15 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4OiT-0000um-CJ
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:58:14 -0500
Received: by mail-ej1-x62b.google.com with SMTP id vv4so22371855ejc.2
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 07:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yRbIwe7AnSmz0RJQo7dGyHFY2bWlUBcIbGMxb7yChe8=;
 b=M7tHDuRRA1pFK2xoJGW9Z4+EF5WjS2dyt9PWWlmWS6GMCJ5n2x0f9fi6um46lUqFD9
 eiMKbiRm8gDz0iN46yobr8SdAXAGmgDEXovgeMazzjSmWyV1iOINly34uSjFG0hwvH8l
 8QEzKRFu57R6Jtxdk7nvXBf3vYAZHddObs70Ex7Jj08lnxy06xvg3w5uZ3FIBQ+IE5PB
 mw4TujWxTqAnWuwBQMPCmiDB8HwMGKH9q9/p73eo+CSm8Kaloyfb7ImVKJfXefToO76l
 SBN1qzTUFMJygO7MaD/8Fosp13VIIJfNTMMCiggsi2AWmjA+uhCSpATUDoOEIn6qcXJn
 E11w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yRbIwe7AnSmz0RJQo7dGyHFY2bWlUBcIbGMxb7yChe8=;
 b=PX1KIg/qgsLNdaX3Ezry5vapYXRQeSeLTG74papfu+ZI9VMjyg3kaVSEqNxtHnPsqP
 LMkit9iL+Lw6vTGnZdMF+TrYOs+ADkXWyJJfXwXlXWfAkf2I/RuAQyCCyFs7Kd3lTym0
 laNYAWNIrB4MvshCpNvRf5BrEe0ts9EKVJdfoBJIkJwPrkBCCTAvVBFAQKXu4Mv2izt+
 SG1L+U0g/aHfONcfQP1xMk2oGfAQjEdeUGuBdNAEdCxhqfy1mnfVcSMZOh0SsAWzpNqW
 lX3Aj7lleqJ/7d6cQ5F9pg1f8G9EXP2jWtE5Za0qqcNgxGuR0XJbCbiv2dxAHnO+Yro3
 fGEA==
X-Gm-Message-State: ANoB5pk4V3Plwj8qqYybyqg6rmYdVqEpScKUBXKok5gb673+pGol8xiD
 60Yd9E/xi2bq2fZpze1O/CyOtw==
X-Google-Smtp-Source: AA0mqf4xfsP74bEG9fIOkRLUcjhZnvuyL+YXd4bgp64i3QMeRy3ZOS3rY36xXmseiCdO29gqqTlXxw==
X-Received: by 2002:a17:907:2458:b0:7c1:1e5a:ed10 with SMTP id
 yw24-20020a170907245800b007c11e5aed10mr16297613ejb.8.1670774291951; 
 Sun, 11 Dec 2022 07:58:11 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 ov4-20020a170906fc0400b007c0dacbe00bsm2177429ejb.115.2022.12.11.07.58.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Dec 2022 07:58:11 -0800 (PST)
Message-ID: <d008c512-7e1c-90c9-16a0-cf3b401d8d23@linaro.org>
Date: Sun, 11 Dec 2022 16:58:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v2 19/27] target/s390x: Introduce help_goto_indirect
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
References: <20221211152802.923900-1-richard.henderson@linaro.org>
 <20221211152802.923900-20-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221211152802.923900-20-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62b.google.com
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

On 11/12/22 16:27, Richard Henderson wrote:
> Add a small helper to handle unconditional indirect jumps.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/s390x/tcg/translate.c | 19 ++++++++++---------
>   1 file changed, 10 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


