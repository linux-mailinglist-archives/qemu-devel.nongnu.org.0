Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A358511BF9
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 17:41:05 +0200 (CEST)
Received: from localhost ([::1]:47224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njjmq-0006VN-7w
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 11:41:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njjlf-00059P-4x
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 11:39:51 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:42756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njjld-0001pR-Fi
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 11:39:50 -0400
Received: by mail-pl1-x635.google.com with SMTP id p6so1861022plf.9
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 08:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3adkDDHlX2i3g+YcRlwIssZK7o62pEadOzWZaqPnmMg=;
 b=LoN1wQk6w7RXSQlh4shDtx3MbRWEq4vn1QT210toOC3epScXYuU6XupxikVb2oQOdE
 SCPO3rB2lgSd9KGvBK1WEek9D6QGCBGLOluP6IWA46xVhmk8vcb72deb8b6RNrAW5IAB
 IqalGpNpQQT4mWF0rSyIL81LQPFRvnkA7kQ/2mrJv2+5NByS/EAiaZ5uAht8eyj3pzVY
 SC9F/TcT9HWlgPHmCWxBtXZ0oooeis3V2oFB4m+rq2k4e5dTIOVOY9WQmP0X9v2wd/vx
 WtlM/Kky5q2HPCTT+WmTWu7W6yX2cuE1aY0WG92NVT1exUFpRi/niaav+3GgixR5xrt/
 vmQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3adkDDHlX2i3g+YcRlwIssZK7o62pEadOzWZaqPnmMg=;
 b=R3zU2xpaPSdtCKEV6GPiP3G3rceNdg/AlNdGkhyBvYWz9qWum0w2zkW5YmQrhKjU5Z
 NNsfmHjeNf3FAo3Ehn2pNKqn1fjaOwTSHkpDA2IBGX7jMZBaPN/JCilK4ELzfhWnvjDK
 TJ+6qFsYyP+4RH5Qc9F/EJlJpCq17PtRKCW7IjIDoZuU3MdAVoqY+yWcZONyzOO4kfLi
 kqcT99VA0zPePAA3WibdLPeb3VU6+buiDtyOnnDccZ1JAlR1u1HvNBeXlYjc7XHDUuGh
 FOzQFOE4x+QWs+tS0KrYCe8CvFXNw7ygEtsIBN7+d4WJgIhkuw6+BkM5mX/YIc+qRmKx
 3YsA==
X-Gm-Message-State: AOAM532csIT+c4ZUpSvCZ+Dagjdx6qIIe8K/ZfTCQ1OlZW9xeV+ljHB7
 h2qgzAvStEgodoskceE6/TVg/A==
X-Google-Smtp-Source: ABdhPJzBaaeLhBacfQ4wjsybPgK87lUH+VmoHoPQHJ7c8APExQcjWXFw87xKpF5kzE1p814kxgIfxg==
X-Received: by 2002:a17:902:8497:b0:154:9282:bc01 with SMTP id
 c23-20020a170902849700b001549282bc01mr29772538plo.33.1651073987952; 
 Wed, 27 Apr 2022 08:39:47 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a056a0016c500b004f768db4c94sm20137260pfc.212.2022.04.27.08.39.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 08:39:47 -0700 (PDT)
Message-ID: <e459e678-01a9-dde5-7c11-d945f78b26fc@linaro.org>
Date: Wed, 27 Apr 2022 08:39:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] target/arm: Disable cryptographic instructions when
 neon is disabled
Content-Language: en-US
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
References: <20220427090117.6954-1-damien.hedde@greensocs.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220427090117.6954-1-damien.hedde@greensocs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/27/22 02:01, Damien Hedde wrote:
> As of now, cryptographic instructions ISAR fields are never cleared so
> we can end up with a cpu with cryptographic instructions but no
> floating-point/neon instructions which is not a possible configuration
> according to ARM specifications.
> 
> In QEMU, we have 3 kinds of cpus regarding cryptographic instructions:
> + no support
> + cortex-a57/a72: cryptographic extension is optional,
>    floating-point/neon is not.
> + cortex-a53: crytographic extension is optional as well as
>    floationg-point/neon. But cryptographic requires
>    floating-point/neon support.
> 
> Therefore we can safely clear the ISAR fields when neon is disabled.
> 
> Note that other arm cpus seem to follow this. For example cortex-a55 is
> like cortex-a53 and cortex-a76/cortex-a710 are like cortex-a57/a72.
> 
> Signed-off-by: Damien Hedde<damien.hedde@greensocs.com>
> ---
> 
> v2: also clear SHA3 / SM3 / SM4 (Richard)
> ---
>   target/arm/cpu.c | 9 +++++++++
>   1 file changed, 9 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

