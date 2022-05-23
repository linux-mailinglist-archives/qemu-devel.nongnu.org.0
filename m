Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD865311AC
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 17:46:16 +0200 (CEST)
Received: from localhost ([::1]:47482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntAG6-00058U-P7
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 11:46:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntABs-000213-Mu
 for qemu-devel@nongnu.org; Mon, 23 May 2022 11:41:53 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:38406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntABp-0006YS-Tf
 for qemu-devel@nongnu.org; Mon, 23 May 2022 11:41:52 -0400
Received: by mail-pf1-x42f.google.com with SMTP id h13so7777831pfq.5
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 08:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5Jz6a7Dh9j1loD/7a/jdI5yPEfv4nhW1m4QFg1rCXf8=;
 b=mVMLKGthRcRsbFpdPsnKgYBCMPPHXdw+hLS4j7lph/3VxSvWJWIC5T14YX5U9lb8qW
 /zPreZvL1SHJ3H2LD+lic/BeC5TCBboY7hT+hxgmcm5184EVo+TmO5qQko25GUF7sX7y
 lqoEZw+I1/9xz2N/DD/4y1Kzd0E2Fi5J3xE9s8IuLBhDXKipQQ10n7KCUeMhACzWrPro
 n692O1bLpjZUR9+90FaLe67HhwnUSRR6EjqUgVX1V6IHgQYy2bR1u8BQ9SkPsOUgiU9S
 XzFifgOZZx+euF4Sj3aXB6uxcIL9I5BGV/fx8b3KZ3UHboSY1/M+q2Y10wbbVrMqQqoO
 NCiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5Jz6a7Dh9j1loD/7a/jdI5yPEfv4nhW1m4QFg1rCXf8=;
 b=Q/g6Z+JiI4aJmLJtbSIwQdBOWq3tyt3cdtM3WWVxRgLM9LGhvO1DdOotkgE+AEAClt
 BuLyel76f/b+/SEu4BENFv5SFZrf0GO4yDHeIOjm8GaMjEb8Ok/YmJGtgL72ENdch7n/
 xdz6gRg3TrqN8U3p24xFetdgxrELhl0yHxpMCnGx78yIHS7kCmB5JT21nZ198t5xNU3+
 iFog2FLBSW25y0tCmXkRo0J53X8klZS9bd784UC+uXfBAtJlkCGK86iQj9is5Cy9SKpk
 F6z5a5YADxWpHDQ/njvALeSMUnM/S2tn+hJM5BqD1KwseoXS/ZmTImPO2f2V6GZejwZ5
 TF4Q==
X-Gm-Message-State: AOAM530NF01df2N/rddzyEq5aALechzCyQ9dYeCrvVNjxBTePz6OGdb5
 rTaFW3JIgkjPnZP5zx63C9NP3w==
X-Google-Smtp-Source: ABdhPJysvoJdtHIT59kBFYK+NSUVAruh0OirtYbVwOb1iJZx7fvWhMYpWO6TycAH3wymJ2b3vmb88g==
X-Received: by 2002:a63:df0f:0:b0:3db:2d4:ded9 with SMTP id
 u15-20020a63df0f000000b003db02d4ded9mr20455603pgg.267.1653320508412; 
 Mon, 23 May 2022 08:41:48 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 i23-20020aa78b57000000b005187ed76a78sm5453725pfd.174.2022.05.23.08.41.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 May 2022 08:41:47 -0700 (PDT)
Message-ID: <3f2230ca-ef92-644e-adef-1cbab56750aa@linaro.org>
Date: Mon, 23 May 2022 08:41:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 21/49] semihosting: Use env more often in
 do_common_semihosting
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org
References: <20220521000400.454525-1-richard.henderson@linaro.org>
 <20220521000400.454525-22-richard.henderson@linaro.org>
 <CAFEAcA9K8ZLQGUo3OW6TZGGjG1O3TOwNguBpnSa7RvH24JB+DA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9K8ZLQGUo3OW6TZGGjG1O3TOwNguBpnSa7RvH24JB+DA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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

On 5/23/22 05:53, Peter Maydell wrote:
> On Sat, 21 May 2022 at 01:04, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> We've already loaded cs->env_ptr into a local variable; use it.
>> Since env is unconditionally used, we don't need a dummy use.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/common-semi-target.h   |  62 ++++++++++++++++++
>>   target/riscv/common-semi-target.h |  50 +++++++++++++++
>>   semihosting/arm-compat-semi.c     | 101 ++----------------------------
>>   3 files changed, 116 insertions(+), 97 deletions(-)
>>   create mode 100644 target/arm/common-semi-target.h
>>   create mode 100644 target/riscv/common-semi-target.h
> 
> Commit message doesn't match contents -- two changes accidentally
> squashed together here ?

Yep, that's exactly it.


r~

