Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 151BE51A34D
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 17:09:18 +0200 (CEST)
Received: from localhost ([::1]:45416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmGcu-0003oe-M0
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 11:09:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmGZg-0007Cw-CK
 for qemu-devel@nongnu.org; Wed, 04 May 2022 11:05:58 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:40957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmGZc-0008PC-LE
 for qemu-devel@nongnu.org; Wed, 04 May 2022 11:05:56 -0400
Received: by mail-io1-xd34.google.com with SMTP id f2so1770929ioh.7
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 08:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=Nm4Lp9RYymFigbS5JhbWTdSbPaBsSjhmATw/aqLPXSE=;
 b=eJygPfhQxgyOzlsfTtI04uMYfDh8Ymz7cBp33KdYJy+xLIAL/T1CKFpCbTk27Nb6DL
 ojGe5zZtnVXcT5WSII1LNFSNZ8AXZ6pUodK+FXJLp4RYYew3HPsnl+gNZtECJVa43Cwu
 bc+3R3Efrlk+1OJ3niKKvIMHUvF/H0mLWYGgtHGEIJcu3bPMMsKgxioFr9T/691hK+/s
 qTLfUONzmfcMesQae/Ol7M0/3rkbQYMTHnK5ZqDPkjwIRtNynQoIJ4mTjQMRkw4b6Kkc
 4ZU1wS0zlJqREwDwKiRn23ScfTAsJGiHlSsUW52ihCMLQZbInnUWK40NhIDIwSL2IvvE
 9mVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Nm4Lp9RYymFigbS5JhbWTdSbPaBsSjhmATw/aqLPXSE=;
 b=3fTllhDkHGowm8nC2zti6cIYSmsACyMx0o+sCW+uAi0jra4/4/2tTB0YpnsfkbgOM1
 xHSJOvPf3kW7t7pk6L50+savCSlIgqUn61jc1DwlQGxX/VK92VW5FPpsU8R6szHmJE0y
 13JfKr58/6Ho9C4KEtgGuAq/vcToT8wfLxXeAqS1YOQ6kd4ucEa6EfZ8fcD6eaHZGsga
 K+B8qfg4UmNDOK7Y8NW05HMlD5iva+O3kfuXJlNj4Bj9y0VFfkMHt1LkvPvcOwTunj+Y
 VE1Aj0zGql4MVLKDmxmiSJGKK7UhWUFo7JAzrrYrQQoMCWGkvjLvWp/3qFq/kh5nqYBn
 rppA==
X-Gm-Message-State: AOAM532g8aoq8XgRaex0b3v8rBoSDsfkzaOYDVznoW/9SQ4p66/zwvdF
 dyuOevl1pZ5gnQNgXvTVfjTKBg==
X-Google-Smtp-Source: ABdhPJz42aLzZ5j4oGGCDbQmKOiFViHshrpsgAgzmBTVu7+RYogPOyzHX831Vw903/M+c6bSWlTx0g==
X-Received: by 2002:a02:7a06:0:b0:32b:1b83:649a with SMTP id
 a6-20020a027a06000000b0032b1b83649amr9075536jac.29.1651676733260; 
 Wed, 04 May 2022 08:05:33 -0700 (PDT)
Received: from [172.19.1.158] ([75.104.86.150])
 by smtp.gmail.com with ESMTPSA id
 r2-20020a92d442000000b002cde6e352f8sm4214040ilm.66.2022.05.04.08.05.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 08:05:32 -0700 (PDT)
Message-ID: <edef07a2-c209-9155-c048-3badf50e1e9f@linaro.org>
Date: Wed, 4 May 2022 07:02:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] target/mips: Fix store adress of high 64bit in
 helper_msa_st_b()
Content-Language: en-US
To: nihui <shuizhuyuanluo@126.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220504023319.12923-1-shuizhuyuanluo@126.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504023319.12923-1-shuizhuyuanluo@126.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd34.google.com
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

On 5/3/22 19:33, nihui wrote:
> This patch fix the issue that helper_msa_st_b() write high 64bit
> data to where the low 64bit resides, leaving high 64bit undefined.
> 
> Signed-off-by: Ni Hui<shuizhuyuanluo@126.com>
> ---
>   target/mips/tcg/msa_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

