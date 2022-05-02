Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60ECF517991
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 23:58:51 +0200 (CEST)
Received: from localhost ([::1]:56188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nle4A-0004oa-CV
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 17:58:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nle1S-0003pK-HI
 for qemu-devel@nongnu.org; Mon, 02 May 2022 17:56:02 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:45920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nle1P-00059U-S7
 for qemu-devel@nongnu.org; Mon, 02 May 2022 17:56:02 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 w17-20020a17090a529100b001db302efed6so488576pjh.4
 for <qemu-devel@nongnu.org>; Mon, 02 May 2022 14:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=iog16PqUqTtJ4luWY/NcQtDjLAHzf7ya2dGAz8fo4xs=;
 b=t940qDulYF8ptbcKUBVlhl6+Gg45CGBWwTdlsFY66Zr/4Ee0aWLnHoG4FYEkpIPO7B
 fCLjJGMixmuFQP2w+g7l1GCqq9M5FKfbLyRYPTcLnpYI1ompQOZLyz5ayBCvf/7eRg6X
 AFFNSv0/KEuoBNYuJBTlpACtmPDAJ2yZ3GIvnM3CPEECRZElLSBPBA2g3xnBRfTxYv9d
 GwhFeGZJlazZbjwctcJHVx1Pek8dhGQdWYwErclPEhmjIuWEeph/hkhNIuGPFO4ZBPUR
 dMqMrQUGWIYkeequJpAj8DOoWYn7PDVZSjEHNCH7irwhT99AfgSQP1hixhpnXtc6lLcA
 0TeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iog16PqUqTtJ4luWY/NcQtDjLAHzf7ya2dGAz8fo4xs=;
 b=eNrpxyryt6dwXe/35zFKYD3+FdeaVl4JeUKzdBinuC2FpKjng1282l/K00nFWJ30FA
 akwWDe8dc7u2yrLwFfXNmk7SFDQp34QrHzP7Ay5L8xAyxts7+iBl/3g6IeboSJU0ERN6
 b+A+zx3UyYV0+UIXvLiTmU8vEhhok2x9zhaEJ2zGdxPsIpb1FTR61IuiUg4XkXT0Q7Q5
 ncUky3yZLzQxmuy+2xFKFqdrYWXXAKEz8o/YeeVBPa/9nCH5CEWlnaUOdYDyskI/stc9
 aFocaDb+73osmW/yHxLD4jaOK0Aarc0wCSYOMJ+B9VFrvycWt4joRYePzEaXdSCmwQrh
 gtLQ==
X-Gm-Message-State: AOAM532FD/090eQFbGFpzi6PzHz178nGBxvof0GE8S9KaLYjgErT1b5a
 s/Nmm+TVO7TNPHcB/gavQWrRaA==
X-Google-Smtp-Source: ABdhPJxtjl6n7XmuyFF4E9iSTg0JX7fOBeOtUt0hVCPWZUVrRmV6bGhLUVPL7dhIzZnoR9gV/RpqgA==
X-Received: by 2002:a17:903:2ca:b0:156:f1cc:7cb6 with SMTP id
 s10-20020a17090302ca00b00156f1cc7cb6mr13986587plk.174.1651528557926; 
 Mon, 02 May 2022 14:55:57 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 k23-20020a170902ba9700b0015e8d4eb1fesm5133721pls.72.2022.05.02.14.55.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 14:55:57 -0700 (PDT)
Message-ID: <800f1c0a-359b-ec76-bcc8-5ea219e7e7a4@linaro.org>
Date: Mon, 2 May 2022 14:55:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 19/21] target/ppc: Remove msr_hv macro
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, balaton@eik.bme.hu
References: <20220502143934.71908-1-victor.colombo@eldorado.org.br>
 <20220502143934.71908-20-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220502143934.71908-20-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/2/22 07:39, Víctor Colombo wrote:
> msr_hv macro hides the usage of env->msr, which is a bad
> behavior. Substitute it with FIELD_EX64 calls that explicitly use
> env->msr as a parameter.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
> 
> ---
> 
> v2: Remove M_MSR_HV and use FIELD_EX64 instead.
> 
> In this patch I'm having some problems on how to use FIELD in the
> 'not defined TARGET_PPC64' case. IIUC in case the target is 32 bits
> then the mask should be zero. However the mask is created in
> MAKE_64BIT_MASK, and MAKE_64BIT_MASK(_, 0) triggers undefined behavior
> as it would try to do a 64 bit right shift. Am I missing an easy way
> to do this?

Sadly not.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

