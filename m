Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC2933C6FC
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 20:43:13 +0100 (CET)
Received: from localhost ([::1]:35892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLt7Q-0007wx-0K
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 15:43:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLt5x-0007TT-BY
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 15:41:41 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:33482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLt5v-0000ZN-GR
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 15:41:41 -0400
Received: by mail-qt1-x82d.google.com with SMTP id 94so10002369qtc.0
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 12:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=acJEBM0+nes2Sep8EJh8njsf+NzmMvwWvbMvA5RpbUc=;
 b=qBdR8olrMRBMHCt0T7/o1yeWSII2rNRLN+utFM5xg8Q9iLTU8GFZjlL/DSu8fLrfP/
 xmVVAOR9+LakXvvtH8fpqd3i/plfoUpacESBrRvh2/I18Z0InuT2laxtuNOOt4aRPmpD
 tTI3q45kUUeJCWuZrh5pB8Jw9jqt21JLwEnS+46CEKkojQjOkZxOMLo6R8C0PLsx5qV4
 iOInKzTan6IGWY5tbruKIGhvu6egLQQKie3MYUUA6YRky8h8+sDJk5mAgchmHxn358Zk
 sTwgHePQ+Qlet4eA4kgfBIc9ul4EQJRUYCM1bXLp0CFpglAn7zKK3MPVAF8893tHkqzk
 e+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=acJEBM0+nes2Sep8EJh8njsf+NzmMvwWvbMvA5RpbUc=;
 b=dYaPllTMvj1057XML05XRWfbczxcGcXVilDemYs1oUoozJBqvRgqGgspwviqmjEi8J
 GayWNHbESzUbci4QBNpIzvfFzHwIoDNeUm2Jnj3mQZEF3aWBD25ZrBuzRaFoAMFdfoHR
 Zquf3fwkloHskc92BW7AwZ1TY0brRXsmXvJ+Jq5LatN+8bjXDqPgvWc0/QXLQqs9Qhz8
 jefOWuEtgHu9G86XFWAmk0A3gvccdQBO0cifQ82oAth+NDVoCCc5Q5YEkbyGFsQuQULf
 9Vqkw+lvZMnDmXv62k+f98YyuvgBeW/5fDZalGofuRy4JQbDpLLsdxSpdY21IhnStO3p
 EknQ==
X-Gm-Message-State: AOAM533lvlZQwzWqJjnCw4G6jXWCK/YSQhH2vUKmnWTh1KILiwKcBSNR
 5wtaEeS/gOd7AfCX0FdYtfpWbA==
X-Google-Smtp-Source: ABdhPJwpKCHPxGBaWqqZJxPDstxon0JKL3FPvxjbMWKmmEc4pfv1VfWZsipfMI+F+sDW0vNHK+segQ==
X-Received: by 2002:ac8:57cf:: with SMTP id w15mr9346170qta.336.1615837298368; 
 Mon, 15 Mar 2021 12:41:38 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id b22sm13439170qkk.45.2021.03.15.12.41.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 12:41:37 -0700 (PDT)
Subject: Re: [PATCH] Hexagon (target/hexagon) translation changes
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1615783984-25918-1-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d911b3ef-980b-bde0-d9b6-17cd9798f1ef@linaro.org>
Date: Mon, 15 Mar 2021 13:41:35 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1615783984-25918-1-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/14/21 10:53 PM, Taylor Simpson wrote:
> Change cpu_ldl_code to translator_ldl
> Don't end the TB after every packet when HEX_DEBUG is on
> Make gen_check_store_width a simple call
> 
> Address feedback from Richard Henderson <<richard.henderson@linaro.org>
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/translate.c | 26 +++++++++-----------------
>   1 file changed, 9 insertions(+), 17 deletions(-)

Queued.


r~

