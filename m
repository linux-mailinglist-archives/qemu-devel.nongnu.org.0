Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A482A6DDAA3
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 14:19:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmCxL-0001XU-Ie; Tue, 11 Apr 2023 08:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmCxK-0001X6-96
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 08:18:38 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmCxI-0006MD-PT
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 08:18:38 -0400
Received: by mail-wr1-x436.google.com with SMTP id q29so7191820wrc.3
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 05:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681215515;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HP5MQrecttgo8Q/nCbIrov0Z6wyRxSu3X7zSWdpQ50g=;
 b=C6DM48Xzo5mlVWgDGLfXEBYqKZbLe1EC7UPJJmkhTUlsRxKa1Y+ubjPPPruFP6/Ieq
 +muThMOIltsEIGkwnYOL4olNM6WqlQAAJSOHzgtZoXct4I9N6G0Im5tnaEVjrPms0psj
 Q2MqaqEyKDiM0Gvqzh9NKBEXzqzo2+yFeuJ6a2R5E+E+XyczkiPRAeRG3ZMOIPsoCIur
 xTOlsNLYqD1JMI1C4tsTSNT8CPic/xpMkispmlKEKP9e2+GLglelrfE/v6obrEQj7fnH
 aJLKchWaDJh2A/7KqUzOL1UHLno0ddavyrUj7CtoKqCa9meI6hW8MN99Nli5cVmALcDl
 vdtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681215515;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HP5MQrecttgo8Q/nCbIrov0Z6wyRxSu3X7zSWdpQ50g=;
 b=WiBywY9nqaE6C6S1t7pDyIqt5AdP78ycO1ey9neF2f0BQAYYXSaTkk3upUquukBIMU
 pzMq2WRITqATK8/Y5vWPuqIJeCDhhTx9/ydjqUDXYE6aUVbEJFWzW9jdVBPlvN+qCE/f
 Zz7S7eF92nWV7Nr5Gp0ZRMlu0XrTK7qhKopLpAEN+5OmeGRTOTe1pCe1MMx896jJe3UH
 NvoXqTS6Bi55NVZsdMTb72W4me/3ecstAif1T3HTOvOLBslXpLy7i9D8LaVRtIgQrSnY
 R0m1cU6WubdutU55JHszmttRblJHaxx/jrYi/jLLZvWcidGfwX3SBRPu98lwHNakrqUv
 /0EQ==
X-Gm-Message-State: AAQBX9cNQWLUqS/3FgcfSnZUFZ+VwRsZsxt0Z26+rWOxhKlce4x7ZAiU
 9f5Uo24tz2pFLZtuzCKR/p1Djg==
X-Google-Smtp-Source: AKy350YfCHva8TwdOWYae7JEJrbhDK5XR06XUc2HS5wvqi6XE2yNKtCFUqQ8+OYPzmsTqBH3D8lUiQ==
X-Received: by 2002:adf:db06:0:b0:2ef:84c:a4bc with SMTP id
 s6-20020adfdb06000000b002ef084ca4bcmr8803309wri.19.1681215515257; 
 Tue, 11 Apr 2023 05:18:35 -0700 (PDT)
Received: from [192.168.1.101] ([176.187.195.239])
 by smtp.gmail.com with ESMTPSA id
 f4-20020adff8c4000000b002cff06039d7sm14467948wrq.39.2023.04.11.05.18.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 05:18:34 -0700 (PDT)
Message-ID: <4932113d-b270-4f83-25e6-e08004c37471@linaro.org>
Date: Tue, 11 Apr 2023 14:18:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 25/42] tcg/ppc: Use TCGType not bool is_64 in
 tcg_out_qemu_{ld, st}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
 <20230408024314.3357414-27-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230408024314.3357414-27-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

On 8/4/23 04:42, Richard Henderson wrote:
> We need to set this in TCGLabelQemuLdst, so plumb this
> all the way through from tcg_out_op.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/ppc/tcg-target.c.inc | 24 +++++++++++++-----------
>   1 file changed, 13 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


