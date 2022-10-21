Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2DD60740F
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 11:30:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oloLu-000639-NZ
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:30:06 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oloBf-0007ig-4f
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:19:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oloBO-0007SY-6A
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:19:16 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oloBJ-00040B-K2
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:19:13 -0400
Received: by mail-wr1-x435.google.com with SMTP id n12so3811393wrp.10
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 02:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bhkasDf+xRkJVcLAstxQYa8JpMtDeQpL/dvxlK2qwUI=;
 b=AVS5C5+3hQsYo9JwqYAX2XE1RDhh9jkZkTjpFZ5UfGwV5Iu2+AP2qAJoB+mCyT9zEB
 7p2J/F8aPWs/j7KoDggaDRwhUYuB6zCfbo9vNZGETMkZP4PTEeFZt7bvyEleIz6evy3o
 FqhYRb/IXiIe95SdKPvf/a2Ggv03KOEK2KZU4alUyWlT4x8kq2kQqM+u474pXvNDLMyo
 SFQyIayPhpvVSTo9gSxu27YhyzocFTxqwM99b6lTYkVd4Cokg1iht8eDa4LBegyfZDl3
 eC/M4GyDd0MZsnYxDXfVxAUxI9YCS4y9syreVQxFJeNmdLSL3c7rmUuteVpkVCTg+DAS
 8CCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bhkasDf+xRkJVcLAstxQYa8JpMtDeQpL/dvxlK2qwUI=;
 b=RM+ac2f8mo2/Dj/yhWqpSGVby3fix7F5XmrgnNta4yTF5HBgR9qzQJXdagr8px846V
 pcn3L/W6v7HpwP6AphuXKzH1QeFvATe/0ojgt0QZx/uH/3TGz1buYmmvStj1P13KRu27
 TQXIPnzvzddgePCv1b4C80f77ySDjDAV/XiCCNdnV7FZUUCEDCTwXOk9MQTzQrHYjZG7
 YezAv0IX5pZBneCfyf45uxkKe4+iiE6sUP/4ob3WsHCF9YpXWfuEg9POh76f6suxqV5+
 SDk9tcfX5Wn7n+fK6m0ZyWP3rYCdTQOVvf6DEC/BT6nwcqrT8Hv+JYcOtnihogSvLpjO
 T7mA==
X-Gm-Message-State: ACrzQf3YfeY9BlEZrE4B1aebx2NteYVE4DaxkiNxkCak9dMkyhjbg9a4
 mykSqPbpbs+d7jcRYaYM+EpugQ==
X-Google-Smtp-Source: AMsMyM59x+5Iwyryr25aJj5lzYIUshHqivg9sR2BdXJEguUeIrvfmjTXng3UrYr5fhfZb4yoFKPhfg==
X-Received: by 2002:a5d:64ab:0:b0:231:44c1:32b0 with SMTP id
 m11-20020a5d64ab000000b0023144c132b0mr11599593wrp.255.1666343944815; 
 Fri, 21 Oct 2022 02:19:04 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a05600c468900b003c452678025sm2384526wmo.4.2022.10.21.02.19.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 02:19:03 -0700 (PDT)
Message-ID: <a5177035-344e-72bf-4267-d7b753cfb2fb@linaro.org>
Date: Fri, 21 Oct 2022 11:19:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v5 01/14] target/arm: Introduce regime_is_stage2
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20221020223548.2310496-1-richard.henderson@linaro.org>
 <20221020223548.2310496-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221020223548.2310496-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/10/22 00:35, Richard Henderson wrote:
> Reduce the amount of typing required for this check.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h |  5 +++++
>   target/arm/helper.c    | 14 +++++---------
>   target/arm/ptw.c       | 14 ++++++--------
>   3 files changed, 16 insertions(+), 17 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


