Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A3658A0D8
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 20:51:39 +0200 (CEST)
Received: from localhost ([::1]:57168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJfwY-0002PL-1U
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 14:51:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJfQq-0006AU-1O; Thu, 04 Aug 2022 14:18:52 -0400
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935]:36761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJfQn-0001Jd-Ls; Thu, 04 Aug 2022 14:18:51 -0400
Received: by mail-ua1-x935.google.com with SMTP id t21so166907uaq.3;
 Thu, 04 Aug 2022 11:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=W17FRTj9Q3+ka9z/bSwEBi3CHozp6PLjORHctslYND8=;
 b=HourHj9h6UfI63iaXnpwJmdYlinxWab3Z0dW525NukuQfnw19r2SUQbswwzf0N+Mni
 fW1M/834TrHu8O+CRzmWxtnrgU2fi3ah+j4ROy2WCYHnhlz2xtBnZ5Sbbib5oMgs4PSj
 1HFYcit2HFKBaevDLHIRLx9x3hOuKNIaeEhCHiYhcwfqjFaJl1PjfGlHe8KNUBY1+Bq7
 MYT/ME5PzolYWN+0Dacx2gprCIXBGAlCj/oa+Jbj9IaygUbhTxwifO9hz9SIQy4meWC0
 rQGM9Yhm/KSznq2gT4e5b5lDLI86d3lKC6ofXS803FmXDIyZk5TGh9KY/PoFZSvSR1BN
 mgHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=W17FRTj9Q3+ka9z/bSwEBi3CHozp6PLjORHctslYND8=;
 b=4ddzvjtNDLkndYeYgHtJ8Edq9VEKclMZ787mx5Ifvw9qWi+b+1y2XG4ekPo5kF0LZg
 KobxBh7v7PhJ1U/uIibH5X7RSxH1VmJCjI8LUV47H3Z7OeC3vcClAuwtXylP+0YRR9cY
 gxKA3Tv67f5YDRmmSw2uhX9BpGTV/GwaoKSA92uyP2awDhFuqr+ifzzMOvfCECdpwxqY
 2llfTXe2sVLjzufTd1Iz3VmCe/Ik4KczkNKpZafodBa9XK4CsPcFMLuGnuVB2CY1gYjP
 EcuwXgpNQmnjhDdSqM+bmua+ylwhWa310N1ssDPoCBrlC1gV4gs12th8rCz9yCefHms3
 zy2Q==
X-Gm-Message-State: ACgBeo137dU/zAivKSq8COG8hH8lKGicvr7f0B4L2VEKR4tE0tgD+tfH
 9yfVfWQ+9JUAkM8fAbQ7Qxs=
X-Google-Smtp-Source: AA6agR7Hh7sYS3kWxDKH2Ux3WLlZntxiCaVLDGlsAhup9bZOKhjpk9vgO1ZFvXcBO1RbRTKS797mBg==
X-Received: by 2002:ab0:1393:0:b0:383:26e8:7bf3 with SMTP id
 m19-20020ab01393000000b0038326e87bf3mr1581002uae.22.1659637128223; 
 Thu, 04 Aug 2022 11:18:48 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c7:52e2:fb25:323c:5709:7237?
 ([2804:431:c7c7:52e2:fb25:323c:5709:7237])
 by smtp.gmail.com with ESMTPSA id
 b144-20020a1f1b96000000b00376fed84e9dsm1427460vkb.45.2022.08.04.11.18.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Aug 2022 11:18:47 -0700 (PDT)
Message-ID: <6668b59a-5f04-0801-f0af-c8bb4f3d1681@gmail.com>
Date: Thu, 4 Aug 2022 15:18:44 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/1] target/ppc: fix unreachable code in do_ldst_quad()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
References: <20220725202122.1810709-1-danielhb413@gmail.com>
 <20220725202122.1810709-2-danielhb413@gmail.com>
 <CAFEAcA8Pk47gdvbPqqyx6QGVNrqUCYiKSr-KAz+oV_Z6dP7G_w@mail.gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <CAFEAcA8Pk47gdvbPqqyx6QGVNrqUCYiKSr-KAz+oV_Z6dP7G_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x935.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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



On 8/4/22 15:05, Peter Maydell wrote:
> On Mon, 25 Jul 2022 at 21:24, Daniel Henrique Barboza
> <danielhb413@gmail.com> wrote:
>>
>> Coverity reports that commit fc34e81acd51 ("target/ppc: add macros to
>> check privilege level") turned the following code unreachable:
>>
>> if (!prefixed && !(ctx->insns_flags2 & PPC2_LSQ_ISA207)) {
>>      /* lq and stq were privileged prior to V. 2.07 */
>>      REQUIRE_SV(ctx);
>>
>>>>>      CID 1490757:  Control flow issues  (UNREACHABLE)
>>>>>      This code cannot be reached: "if (ctx->le_mode) {
>>      if (ctx->le_mode) {
>>          gen_align_no_le(ctx);
>>          return true;
>>      }
>> }
>>
>> This happens because the macro REQUIRE_SV(), in CONFIG_USER_MODE, will
>> always result in a 'return true' statement. In fact, all REQUIRE_*
>> macros for target/ppc/translate.c behave the same way: if a condition
>> isn't met, an exception is generated and a 'return' statement is issued.
>>
>> The difference is that all other callers are using it in insns that are
>> not implemented in user mode. do_ldst_quad(), on the other hand, is user
>> mode compatible.
> 
> This is a Coverity false positive, and I'd already marked it that way
> in the Coverity UI back on the 20th. Coverity gets confused sometimes
> by ifdeffery.
> 
> So you don't need this patch, unless you think the code is genuinely
> better (more readable to humans, etc) this way.

The idea was to make Coverity happy. If Coverity is already happy then
let's drop this patch - there's no particular improvement made here that
justifies it.


Thanks,

Daniel

> 
> thanks
> -- PMM

