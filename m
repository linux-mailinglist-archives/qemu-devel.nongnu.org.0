Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF0A539336
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 16:37:01 +0200 (CEST)
Received: from localhost ([::1]:40498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw2zU-0007a2-HJ
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 10:37:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nw2xL-0005g8-Ly
 for qemu-devel@nongnu.org; Tue, 31 May 2022 10:34:47 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:44029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nw2xJ-0004uH-DY
 for qemu-devel@nongnu.org; Tue, 31 May 2022 10:34:46 -0400
Received: by mail-pg1-x532.google.com with SMTP id s68so12990072pgs.10
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 07:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=JmkndiAKQRhnkSBP6ytZ3Qi1SfVd1ySDssf2jp1dqqw=;
 b=Z44MYzPlD+xebnzBb3bgJrZPhyHhZ3+w6IRZ7McqN/+3VP7s7mY2FKYRd52MDPT21G
 znYXF/Vk8EHoyBKOH1V8wxt960htHTK+Yb615wGGgtM2941IkFToofwJhA78oWSyQefw
 Ce2Q0zcH29BUk8BmDmi/CArIoUvU9yIiL4lzyuGx99uCgOMrbs+J/0eJOPfcOSq8c2EY
 mG30IJEbdtyEY7yB/QsOd4PKkBU61ASh6fd4hkqEmk3cxAydAzpOv9qntZZ88uq4TnoK
 hDfotTUTnRXklM2xR7ssalVdurX2/shhxbsQs/9mAzdClXCubLDKRKFPpXssC+mn7O71
 1tZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JmkndiAKQRhnkSBP6ytZ3Qi1SfVd1ySDssf2jp1dqqw=;
 b=Dc6Zds7DyisUelCL9YZInXseDrDnqhAuhSaQQRb5l8LMXxx8poYW1riSWH968YHEku
 l1Nv1fM7oyJy8gfdhQZeqH5AyYlJ5hMDiTS/uXTq9gp//eat8ySsYallNqFgliDHcJmN
 c+ak4ADVRSOR1OgWupMhVMxjTI9TO/crUuBtCdEO+CraMjV90t6UCn6ymFdt7AG/6R3h
 GTrPVYkDwXlTdqb3GR19lqgwPJIr/cYGl1K310aKBcgivUfN5gWmIGyDeRimH+wElgR7
 fpW/zPwV4oNk6byIEBtJa+uZNr9J+bIUwZry6ZmsmmgIA+pO+9bhMM+DQDHZvGsoPZux
 lhyw==
X-Gm-Message-State: AOAM531eUE6ZakkAE3eDpc3bkd7yaLpTJ5xJaxsvAvP2T7lUVEs0h3iY
 1iBkFC7gKeF4CeDNUWPaWJUl/Q==
X-Google-Smtp-Source: ABdhPJzLxjrJL5WA5150Milp6ol75tB+vXjUj2QvtNGa9E2ixfnl96xI4GHYbQmR5Uidh3HJY5g1ng==
X-Received: by 2002:a63:e516:0:b0:3fa:dc6:7ace with SMTP id
 r22-20020a63e516000000b003fa0dc67acemr41755208pgh.215.1654007684005; 
 Tue, 31 May 2022 07:34:44 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:4ae9:ceee:85cc:a70c?
 ([2602:ae:1547:e101:4ae9:ceee:85cc:a70c])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a170902d4c600b0015e8d4eb259sm6643661plg.163.2022.05.31.07.34.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 May 2022 07:34:43 -0700 (PDT)
Message-ID: <0d33860d-2f6b-6b47-45a5-303d4d9d9e62@linaro.org>
Date: Tue, 31 May 2022 07:34:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 17/18] target/arm: Add cur_el parameter to
 arm_generate_debug_exceptions
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220523204742.740932-1-richard.henderson@linaro.org>
 <20220523204742.740932-18-richard.henderson@linaro.org>
 <CAFEAcA_pFQqZtpqeBLf8htev=sNDEPS1UdJaBonhsPnyO1LVSw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_pFQqZtpqeBLf8htev=sNDEPS1UdJaBonhsPnyO1LVSw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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

On 5/31/22 05:07, Peter Maydell wrote:
> On Mon, 23 May 2022 at 22:07, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> We often have this value already handy in the caller.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> True, but it makes the function clunkier to use. Does it really
> make a noticeable difference to performance ?

Probably not.  I'll drop this one.


r~

