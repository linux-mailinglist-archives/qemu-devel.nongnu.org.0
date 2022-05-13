Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB05526685
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 17:51:41 +0200 (CEST)
Received: from localhost ([::1]:60174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npXZs-0007OO-5j
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 11:51:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1npXWz-00057w-48
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:48:41 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:33519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1npXWx-0000dn-2G
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:48:40 -0400
Received: by mail-pf1-x42b.google.com with SMTP id p12so8073941pfn.0
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 08:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=bizbe5Ft22ZhQKRx06XgThXVzhlJEDOf9Pc+Gdz6JhY=;
 b=gbqAivzFfX40wbqjsbo3u5Wf066d6E66W7l7QI5qvmDBvHgv+ZRinrGUT4em/8aXMy
 vKvQqcyxSlK+/Ydc/ZtgMuMTANkCu3RY7yMUX10a1I6DEshfxoqGCiaWVM2GwbhwkMtu
 RKgYe/A2ULrLdCoFeuDj2D9MgB28/40ZPUV5g+rCrvN+gaE/MCFnV2Pid/1AXDEY87gp
 6ikCoJ0vtdb+q6f9iA7+bcP+W5rGEa6pdQQKtDqhFkHA2CosADxxTZIG7H7kjqj8/t+Z
 5jWZMagn9ujlVcT5bL71bjAa7wdUc4sOihS8YWDiroI7XQHzOh/uGqWSTIp8icoryoXc
 /emQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bizbe5Ft22ZhQKRx06XgThXVzhlJEDOf9Pc+Gdz6JhY=;
 b=2mHuAm8Ldua8e6soXUwcAws3EMu8aIJcYTisuBoRSGs8ljaqcZKE9otFHMezEWzq0X
 vgnBc0H1m5/GGlGvywBbOKPaZYion/jQH3ERmwq9Wuj1EVIeKe2f1a0xzjdTlTQ/NBSp
 fMZlRBxABuByAmSYMrNEOPdYFXOxzrVLbH+XGth2jAcNyfOtqs3GNfBMoafSS0yVbhu0
 ONIM2hvZMQRpe5SBXhHtGzh0Ktl8pJFdhf7StJx4dXWmwwfngg1LUR+TkqD+9t1B7D9l
 y8E/zQl0nP/qFJX1auCAdYZyTDR+z3T3aQ25kYBepCQZhb4smzS9IKG/BXgYuPX5kNsD
 DbHw==
X-Gm-Message-State: AOAM533lN6AElcrdA5yPHalJH0DT5bL+QRxdc+ic3fYs53ID1T2uBR33
 h+d01zGeqTySrt9YBWp2eUyi3Q==
X-Google-Smtp-Source: ABdhPJzN91uKkEl69aG40bh2kfCPNX0Rwpq2st9e6xBDe4c0ro5RQ/5gaFyabENwbOmCT17POKjEzw==
X-Received: by 2002:a05:6a00:164c:b0:50a:472a:6b0a with SMTP id
 m12-20020a056a00164c00b0050a472a6b0amr5064296pfc.77.1652456917729; 
 Fri, 13 May 2022 08:48:37 -0700 (PDT)
Received: from ?IPV6:2607:fb90:46a:1099:e682:8d73:3200:dae5?
 ([2607:fb90:46a:1099:e682:8d73:3200:dae5])
 by smtp.gmail.com with ESMTPSA id
 123-20020a630581000000b003c14af5062esm1724110pgf.70.2022.05.13.08.48.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 08:48:37 -0700 (PDT)
Message-ID: <cc37e096-dc47-4ac7-aa3d-87bef3937ab2@linaro.org>
Date: Fri, 13 May 2022 08:48:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 68/74] hw/rx: Handle a kernel file that is ELF
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
 <20220503194843.1379101-69-richard.henderson@linaro.org>
 <CAFEAcA_=xurx4hppNZKqe6s72vyFShiMKP__iE_4Ff9noXSGXg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_=xurx4hppNZKqe6s72vyFShiMKP__iE_4Ff9noXSGXg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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

On 5/13/22 08:44, Peter Maydell wrote:
> On Tue, 3 May 2022 at 21:52, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Attempt to load the kernel with load_elf.  If this fails with
>> ELF_LOAD_NOT_ELF, continue to treat the kernel as a raw image.
>>
>> This will be handy for running semihosting programs.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> I know nothing of the specifics of the rx target, but I'm
> always a bit dubious about adding more behaviour to the
> -kernel option, which is (a) already a morass of undocumented
> target specific behaviours (b) nominally supposed to be
> "load a Linux kernel", not "load any random thing".
> Can you do what you need with the generic-loader device instead?
> That has the benefit of both being documented and also doing
> the same thing on all target architectures.

I'll give that a try.


r~

