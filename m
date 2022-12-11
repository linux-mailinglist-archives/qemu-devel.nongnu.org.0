Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7295E649501
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 16:58:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4Ohf-0007e4-AM; Sun, 11 Dec 2022 10:57:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4Ohd-0007dL-I8
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:57:21 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4Ohc-0000mH-3I
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:57:21 -0500
Received: by mail-ed1-x533.google.com with SMTP id l11so9638544edb.4
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 07:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5XH/YfVQtHm14R8dFPtd7aoDDYxwa62qXAFvaq7yPms=;
 b=pv4v7oHlio+jNMPrzCiWoUbFgELYJ7FrphxJwnYBuUfqSZi2wP4jTme7MTG1Awe4pr
 vTe93JjR4DVdMRG5/TKNSuzrBa9/EFWmy/xw2xOyMIdosGXpO7lTMygos0GXxsI7c2OR
 b9Y6UCfObF2vrH0WlSBL5A1DQx58uImCt11fFy8c2rYCH4q8h3+EuflsmSMj9yCWr1sf
 AsIerULcDo2K4npvI49QFIVLbB7Zz4FWTiDg2942NT/XrEmjk83H3KCw6E5AZd//vnZs
 z2IpR2N/A8eGpLptrcSI6vIlXnLEouUTR8MFJJOui711QipqBcmLhRrthH17U6iXJIU7
 XbxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5XH/YfVQtHm14R8dFPtd7aoDDYxwa62qXAFvaq7yPms=;
 b=zavNPd+yMUYzr9TdqJVDIqPW8Pxt93i1GHdziJy5HhgFrp198bJ1QIUMBvQFI552Oj
 fCVAhAgPUrKQiK1f0Q3fe+2edZwEZUs3MQkelpYvMwrcBaLc0pA/11V1iSKc5yxE0CME
 CVnX/GOpHcjQmH1nmSo0aUEx1GZMcLZATmvxxVvS4O/l8iw6pqbcx0Znt9naIiIDS9mL
 U5FNhlGARRjIZ3R1wqF83lCTIRh25aNE7D7DFUnrIucb0iCQekaPbsLxxpPBzWQsWIC2
 wiL0lsXoXRfn+uHZPrudlSIbr84UrfwbQbGzOp3N3js0fFp2Z2IunKy7w7cWoZ7LY4Fq
 CbHg==
X-Gm-Message-State: ANoB5pkxDbZoMVsTEJmRztWiI0sSvJvyO8uMmg+WpCm13wQ/PeV9Aa2c
 nNcPYD2gGBwy2TLzvUm1sX5sAA==
X-Google-Smtp-Source: AA0mqf7MlW1H6I9Ugqe2yYnR64Z5tOssUTkxsnPb+ZE8PkMXESZlD0fGrgkCCDXUOQPQaCEAHqDjbg==
X-Received: by 2002:a05:6402:3609:b0:461:8be6:1ac5 with SMTP id
 el9-20020a056402360900b004618be61ac5mr10810233edb.3.1670774236601; 
 Sun, 11 Dec 2022 07:57:16 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u30-20020a50951e000000b0046150ee13besm2814657eda.65.2022.12.11.07.57.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Dec 2022 07:57:16 -0800 (PST)
Message-ID: <99a1b0b6-3a2b-1099-bd0e-b8842808552d@linaro.org>
Date: Sun, 11 Dec 2022 16:57:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v2 15/27] target/s390x: Add disp argument to
 update_psw_addr
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20221211152802.923900-1-richard.henderson@linaro.org>
 <20221211152802.923900-16-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221211152802.923900-16-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x533.google.com
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
> Rename to update_psw_addr_disp at the same time.
> 
> Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/s390x/tcg/translate.c | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


