Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1A75846F8
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 22:22:43 +0200 (CEST)
Received: from localhost ([::1]:44436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHA1q-0004Mg-FJ
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 16:22:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oH9xh-0001vC-Mp
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 16:18:29 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:56015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oH9xg-0006MD-0g
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 16:18:25 -0400
Received: by mail-pj1-x1030.google.com with SMTP id b10so2804396pjq.5
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 13:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=OvbDVShkWFuLlTrKjaY61ZJ2IPiCN90fV1g7dlwW2Zg=;
 b=R9zcICx1OpXaasUvWv7r2eRLnWGGdhHGFPRMDLP9gvNlymX/gwcOlVahRkV3Hi3l9t
 WA3531uFdevUHwmE6LReScRtPfNlTeDxZdLINzrcpA7ic2IWDI5+74OysSD5BwCqK9Gk
 QenY9Vw6lpHXGKdNji4JUHixSSJGqTtfqEcBkxqVqJx+ALOkdLz+Xm/lyxhT8tF8Ae9X
 Ybm4xrPl/7zEoywJMHpbkPTT8bd3hdO2LXc0tJYiYES9LMRE1BmaqDO3RS3f4rT+Ul6B
 d92o0ubNTl5vcTp4dWpni9EQEEEkIn4/jIp8VNtm54HGViW1OyWBaSEzrX9T8KzrwJD7
 0ThQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OvbDVShkWFuLlTrKjaY61ZJ2IPiCN90fV1g7dlwW2Zg=;
 b=tJiGMzsZxcjaf6fcHl7aMfp6B2HyxVhCvtyok9t0neMvrU9TYiZT4rUs34hf93pAeb
 VPAabmSigVbgeq8p5J6wKn/fhKUA8VrJq8tdsR7L9ctF+Br0J/xf7qXP9e7NTIt5QiNA
 Tn8MnPs2nvn0ECPaP1juzVfhBp3e9bDqrS91/X9ppsK0T2QK5KJvMk6Ylmk/IdCsVRB7
 /V6FmaAZVJ0eScurbO+WoDhYyf5zsQ8WqUen55B0oGxx+jCvQwMbZ6nlJeQ2P6MYfsIC
 rIttP9YsUpGdrLPgyotu0P0O4C7F5AU2ghE/XhsG8i4R9twQec6v2zO3mklPWxhBsJbn
 03dA==
X-Gm-Message-State: ACgBeo2drVkvnza4Ugr1U6MdudiPWQF/E09o1ZbmAX6EmjDkepVqqqxk
 3np6hQjg/knyoFVoI3j4vOzNRg==
X-Google-Smtp-Source: AA6agR7a8o7liFWG2rFjjtAThYHLNClNbM1T3n4TxJGD/UzK4TYahklvoxux18PQyKTeQVtzBRkgog==
X-Received: by 2002:a17:902:930b:b0:16d:191e:cb7c with SMTP id
 bc11-20020a170902930b00b0016d191ecb7cmr485146plb.43.1659039502320; 
 Thu, 28 Jul 2022 13:18:22 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:d1a3:8e57:d847:7607?
 ([2602:ae:1549:801:d1a3:8e57:d847:7607])
 by smtp.gmail.com with ESMTPSA id
 a19-20020a656413000000b0040c74f0cdb5sm1378505pgv.6.2022.07.28.13.18.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 13:18:21 -0700 (PDT)
Message-ID: <8a7f394c-55ac-09cb-91b0-41f5d4c12fff@linaro.org>
Date: Thu, 28 Jul 2022 13:18:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 0/3] ppc queue
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, peter.maydell@linaro.org
References: <20220728165519.2101401-1-danielhb413@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220728165519.2101401-1-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 7/28/22 09:55, Daniel Henrique Barboza wrote:
>    https://gitlab.com/danielhb/qemu.git  pull-ppc-20220728

fatal: couldn't find remote ref pull-ppc-20220728


Did you forget to push the tag to gitlab?


r~

