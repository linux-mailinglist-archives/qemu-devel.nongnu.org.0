Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A527150AB11
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 23:59:31 +0200 (CEST)
Received: from localhost ([::1]:37318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhepm-0002x1-Q0
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 17:59:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhem9-0007K0-7Z
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 17:55:45 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:34513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhem7-00014O-PB
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 17:55:44 -0400
Received: by mail-pl1-x629.google.com with SMTP id n8so6691346plh.1
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 14:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=eVQ2vrc7Esl/S+1Epg34u6Khwtlh5qzI4e51BsDVeGM=;
 b=k5omLmC89WhHhTiSiKgMAVfb4Iz8aFS1JwLIWxaRQeN+IeBzGvaeVfwSnUfEMjnzIc
 64mX6fXHSTk/woNMIzlXs+IvU8oKlq6wMIa+VKbgFWsfr3UdDbXYepvOWtGgfHgyzSLA
 QtHzCVN40BskXsvQxFwHt3j6JifuZQnXmcbEUykGKSKDFa8PqU/thJifQJtH0SDp1c3F
 HLXELijEmCv10dxaexliQJTjpd7iF7p/HWf8LsbPdxjcEVq6PdLy+w65qIZzljl9fHcx
 V+maVFxdkYsB9bkBF/2rCn+arU7aXkaClFJ6S+gUGkv2UZ4nI5sstKrdFcUQpdcl2ISR
 EzsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eVQ2vrc7Esl/S+1Epg34u6Khwtlh5qzI4e51BsDVeGM=;
 b=flJDf5gj/XHv7WkAjl9LCruowZ9A3qvWxFsMe+xfU0sZ8IiOyIWgWKQqpDM9Mh2vUL
 FM6l/5PqQNyxKIp8DQRMA3CE61oE1mFyji9I791g7TRLXFMyezWL7j2gODjYVs2e4RRQ
 9N5bemTpM8f2X3iWFUAvDcOoHBdsllVBs59lAHieB7rFiIKhG2089IwR25ftQByadCVF
 t9R4nyUNMj+O6HPgBO12JHcOzm3N6nJbR2RYsNTaWdLJ9A3jGEtcYGGZS7b1/DyTCQx3
 YWTP053q0pvXivNjTCTTnwkyWCZcy5P5Gpvf2tGnPyAZDI4+lTftcPG9yBBYLPru6E8U
 0VnA==
X-Gm-Message-State: AOAM53215tBgNk3c1O8YFxLJT1ZQ0vly4PLeQgAVQugv+I1r8yuLHdsG
 eQySKteWnDR/8k/BcktAsMwM4qsdyB3Igg==
X-Google-Smtp-Source: ABdhPJyLHg7bIZxjc0wNgM0lSlOcwE9+/fjvQZkoduVAtpANNh8np3wYzPW2yoBHftayUw9ycOEqAA==
X-Received: by 2002:a17:902:76c4:b0:15a:3724:b27b with SMTP id
 j4-20020a17090276c400b0015a3724b27bmr1252776plt.98.1650578142377; 
 Thu, 21 Apr 2022 14:55:42 -0700 (PDT)
Received: from ?IPV6:2607:fb90:8060:946d:d891:f23c:e53:9d47?
 ([2607:fb90:8060:946d:d891:f23c:e53:9d47])
 by smtp.gmail.com with ESMTPSA id
 y8-20020aa78f28000000b00508225493ddsm89242pfr.80.2022.04.21.14.55.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 14:55:41 -0700 (PDT)
Message-ID: <2ec32ab8-455b-6414-34f4-5cd6f09f6aad@linaro.org>
Date: Thu, 21 Apr 2022 14:55:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 4/6] target/xtensa: use tcg_constant_* for numbered
 special registers
Content-Language: en-US
To: Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org
References: <20220421213917.368830-1-jcmvbkbc@gmail.com>
 <20220421213917.368830-5-jcmvbkbc@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220421213917.368830-5-jcmvbkbc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

On 4/21/22 14:39, Max Filippov wrote:
> Numbered special registers are small arrays of consecutive SRs. Use
> tcg_constant_* for the SR index.
> 
> Signed-off-by: Max Filippov<jcmvbkbc@gmail.com>
> ---
>   target/xtensa/translate.c | 16 ++++------------
>   1 file changed, 4 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

