Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C11D4370932
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 00:33:13 +0200 (CEST)
Received: from localhost ([::1]:42108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcyAi-0002cd-B4
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 18:33:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcy9U-0001hc-EE
 for qemu-devel@nongnu.org; Sat, 01 May 2021 18:31:56 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:46964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcy9S-00051X-HW
 for qemu-devel@nongnu.org; Sat, 01 May 2021 18:31:56 -0400
Received: by mail-pg1-x52c.google.com with SMTP id q9so1043802pgl.13
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 15:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=89vUrRx/QacWH1ue+QntEaeriquYf0HMx+Akm4+IWl8=;
 b=oTpHr1oRwVpS/+pgMNws9Y8WrEhGgO6rwNP4Uax8PQX36OnE6GQeRI09TYb1gjIdK8
 li44zdEvLdK00KLYrv77+95psIM7ZFM4p+hy7MAHvDL+QSyX/kBdJoygWKhE5D0FYcsv
 z0APVT3zP2LtzEPr0kh3LbgZiBNnshh9FQzjE9SRkLKsNigpMJKsJH6wWoJVemWtGlDQ
 C66+nAdOXF55VeYZ2A8yu/WyH2TO9ZiUJN1BKC0zTY4jNxBR/1Uakow4i7HUigLSqTmm
 NbxXx3XTHMukgSIcRYKGxN4RXZZcY88UCwo3JQJZ/rvC2fsDCB89AxZxm8tjxFFBnf/u
 GTzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=89vUrRx/QacWH1ue+QntEaeriquYf0HMx+Akm4+IWl8=;
 b=KTfxezl6g1JjQo8wby/X6Th8DZvdYJvS5lebhfQeE20bOWR6xiaggH8iiXZcvbPv9E
 +KL+GPhEQL9qwOJQf2fsN0n9zZbnk0PjbmFR51qxgDrXSQ65ekul6kuTMA9RxdR44kRR
 ciAX9uJA5tnvOh3N7kYKT4TM8Z5lJ4aCMKa42PLM+uh5SxYp+OVQzWs8r4RC0Ku7LZss
 fULYBcoDRczvgC1eeANBJRbA6PDPsjnRFMnFrKSA0nnND2g1HUj12kj5RtEXZlYbgTX+
 uANTECr5MOjIVrfFJWYvdrPOyfOsK0wjC0p6XjJHI2DItjY5x/Hb2lJdkeIRsO1c3uoL
 SbBA==
X-Gm-Message-State: AOAM530Ys4qv3O25gObuICCZ87qke2JjArU9vbwW9mJOOGunp6/+AldZ
 3qNafXSflfiP/UyVoXCbEepUjTtpWi3tcg==
X-Google-Smtp-Source: ABdhPJz4rD+gklee9HPcPrwe4ayueZx8AgF+1aIUB52/GcXNu+Na2GHV1t9SYqqpsmEbu3YqCB9rlg==
X-Received: by 2002:aa7:8213:0:b029:27f:62d:ed71 with SMTP id
 k19-20020aa782130000b029027f062ded71mr11337394pfi.48.1619908312742; 
 Sat, 01 May 2021 15:31:52 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e65sm5575785pfe.9.2021.05.01.15.31.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 May 2021 15:31:52 -0700 (PDT)
Subject: Re: [PULL 00/31] target/hexagon patch queue
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210501184324.1338186-1-richard.henderson@linaro.org>
 <CAFEAcA_fP6kPWn=A9EO1H09WN2awZhjkYjTXhSo-r_ttRtp9NQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <73263e2d-ec9e-6eba-f6f1-bd2f3de3fc94@linaro.org>
Date: Sat, 1 May 2021 15:31:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_fP6kPWn=A9EO1H09WN2awZhjkYjTXhSo-r_ttRtp9NQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/1/21 1:40 PM, Peter Maydell wrote:
> Build failure on the gitlab CI "clang-user" job:
> https://gitlab.com/qemu-project/qemu/-/jobs/1229108656
> 
> ../target/hexagon/genptr.c:31:20: error: unused function
> 'gen_read_reg' [-Werror,-Wunused-function]
> static inline TCGv gen_read_reg(TCGv result, int num)
> ^
> ../target/hexagon/genptr.c:322:20: error: unused function
> 'gen_set_byte' [-Werror,-Wunused-function]
> static inline void gen_set_byte(int N, TCGv result, TCGv src)
> ^
> 
> (this is clang being stricter than gcc about unused static
> inline functions again.)

Dangit, I merged Taylor's patch to fix this Friday and then tagged from the 
wrong machine today.


r~

