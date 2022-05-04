Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B991651955C
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 04:12:05 +0200 (CEST)
Received: from localhost ([::1]:51474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm4Um-0005tS-N5
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 22:12:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nm4Rn-0003TC-HJ
 for qemu-devel@nongnu.org; Tue, 03 May 2022 22:08:59 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:40870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nm4Rj-0004DY-Cp
 for qemu-devel@nongnu.org; Tue, 03 May 2022 22:08:56 -0400
Received: by mail-pf1-x42a.google.com with SMTP id i24so34673pfa.7
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 19:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=LzdLUOwlvZY0E9fadFC+y9CeZ+8mgw558Fg9VnPQj+M=;
 b=VzrjgRCsKoQKx3Yv+QkFB3ZF8ES4/Qf6jwcIZXh9NAyFMhhQQ1rN5qOaYPF1PxnnWr
 AnxLl82N0V/4UgfOlu/WrU/gxW4UZK+oEqgtCV0vi8xiLQrkYtBDllw3xLIIJsVQKD9g
 XxeZ8QRh0Xoao+z4WE+lB8I8X8xeyIKiCVR+tMsyD/9aOCPihieuDQ4xdw82GCPMJBXw
 ltaDdnhQQc16QdqcKShNts3ARQPOvRLnU26gApVWqHmuOLF4hIHNtC6C4+cf5/YGHb0+
 jt1urYa6b4P8ats5K4Cl+W8aSEEi2hcUJhsMukI6DYamRm2pRh12kFzz9RdIkAKYQtwV
 IIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LzdLUOwlvZY0E9fadFC+y9CeZ+8mgw558Fg9VnPQj+M=;
 b=wIQdvMP/kD7VJxm7wlcrRWQhYugH0JSQmWiiESBdKQ73AoDVTct4r+8ARZJ/G3gQwN
 x4p39PrX7Gc69sn8OvwmWIFPRsd2tC9nIcGZJ6HJW7CrWpqRLosha8mMJTRW+airCTsH
 k+g06LTMJ7ueSQQIBU3GS6k5IuvOs4UVBDiNoYt0SUpMA0+pToqgfEAZaJVX7BmHgtOR
 dHQEKcP6/IB0GRpXfkDm0cQwO4kczNJ4+pvOMX+FmHJMqzgIbr/4Emk9hdUMWRagzYKu
 wDWvYLJ5sR25N3yTY3yVtZGwEnip/FvyRA4pl0qbmsfquowSuSpNR7O2Z7L2rbtY45vj
 Wtxg==
X-Gm-Message-State: AOAM530zuhvqH8r3jNuRbc4qP4/FCAX3gxBQN6kcOokzdQAmG6r1Eihs
 FpPAxO9lU9ivSSMYzu+QugIgTg==
X-Google-Smtp-Source: ABdhPJyD2l1gCouzgiGrO34Kgex43dDMImkdU4vroJ5gc8vhjCSF7qh6OPi/xs0y8oYNaPbBiFYDdQ==
X-Received: by 2002:aa7:9557:0:b0:50d:b868:4798 with SMTP id
 w23-20020aa79557000000b0050db8684798mr19222751pfq.84.1651630133780; 
 Tue, 03 May 2022 19:08:53 -0700 (PDT)
Received: from [192.168.4.112] (50-206-49-78-static.hfc.comcastbusiness.net.
 [50.206.49.78]) by smtp.gmail.com with ESMTPSA id
 j11-20020a170903024b00b0015e8d4eb1easm5977062plh.52.2022.05.03.19.08.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 19:08:53 -0700 (PDT)
Message-ID: <3273026d-76e4-0591-3a9c-67ccd3054472@linaro.org>
Date: Tue, 3 May 2022 19:08:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 16/21] target/ppc: Remove msr_ep macro
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, balaton@eik.bme.hu
References: <20220503202441.129549-1-victor.colombo@eldorado.org.br>
 <20220503202441.129549-17-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220503202441.129549-17-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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

On 5/3/22 13:24, Víctor Colombo wrote:
> msr_ep macro hides the usage of env->msr, which is a bad behavior
> Substitute it with FIELD_EX64 calls that explicitly use env->msr
> as a parameter.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Víctor Colombo<victor.colombo@eldorado.org.br>
> 
> ---
> 
> v3: Fix the difference check to use a xor
>      fix incorrect "FIELD_EX64(env->msr, ..." -> "FIELD_EX64(value, ..."
> Signed-off-by: Víctor Colombo<victor.colombo@eldorado.org.br>
> ---
>   target/ppc/cpu.h         | 2 +-
>   target/ppc/helper_regs.c | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

