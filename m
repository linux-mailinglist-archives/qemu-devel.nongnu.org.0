Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E51853AD545
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 00:34:15 +0200 (CEST)
Received: from localhost ([::1]:47220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luN43-0007j5-0t
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 18:34:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luN2f-0006KE-8v
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 18:32:49 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:45963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luN2d-00012e-LV
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 18:32:49 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 z3-20020a17090a3983b029016bc232e40bso6764011pjb.4
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 15:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qQXiNKnH91BHFUYlNvLp6LZOnVrtvPsPAAmtEFlWL/g=;
 b=tg01LfXzEmCI142sex81KtGFKFd7AhMIpn8GBRoAgmgJj0Pd0Ghuj9J4F3wlf47+5e
 TH78kkgTjEMwwk3m+T9QckkDMvttnwZmlOLLfYXOEStz2lG89oJqaV0p1yfOK3z9gAOq
 IluOt2VBV8lxWZaKITuy+lRuQVl7BGlydycBCFbGxJne+u018EAMI0Gc5OFgA7jhfTWP
 DkQXjkNfJVFX4/kwbiJFmPZNgVapLjzngL3ZZ126voC0mFCTp4ZvrwQSEY81y3TLcsDv
 s9D9TcIOq395iwGY4DjqSECp7x7giL7wcpDVGSaXabLRuh94Ckq129wrhZ9KJglOvCxA
 Truw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qQXiNKnH91BHFUYlNvLp6LZOnVrtvPsPAAmtEFlWL/g=;
 b=fyOQf+Qpo28qEPeEbGPB/jdJr9HzrgxG7BIZGkySC1qsZR2aiKXN/wAAkr4FOL8Zzm
 5HLPucz0fU5KrzVw85GhxVAOn4y42zCpbhKzPl7MCB4F+PR6h5BSkl7oDzJpwA+QqSGO
 hStyiuu5Kt0PgZCavD0ed7wUOfHr9F9iDpgFcZqgyAjrAou8zXvYFIK33fKODF6st76Q
 TrRXD9SplXSNYqsHSBO7wQt3uylxwPBuP6kWWadZsZLtNYuuTGeHlDwr3hvLlVTnlNDg
 p1+3sAsK9NF35oCUVZzWsxfvowQk7T011w/969DF2LcKULXq+j1OMjBoUT//gZ7LHyRb
 Kpdg==
X-Gm-Message-State: AOAM532ujK8dEUWhzU7omi+HJWwIPL/HiymBw4KAuDcEgBer7Pyphwpl
 EQ6QXuzkN/M9cinAEaG/0fvoIw==
X-Google-Smtp-Source: ABdhPJw2QpBOp+jIyAIrLUZK2eF+kZP+lIcrQMCU/eEs/kdYTm3idSYtZZ5cfp+nw+BvZHvSOnJDCA==
X-Received: by 2002:a17:90a:780c:: with SMTP id
 w12mr5049871pjk.42.1624055566360; 
 Fri, 18 Jun 2021 15:32:46 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id p13sm9222346pfn.171.2021.06.18.15.32.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 15:32:46 -0700 (PDT)
Subject: Re: [PATCH 3/9] target/mips: Move TCG trace events to tcg/ sub
 directory
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210617174323.2900831-1-f4bug@amsat.org>
 <20210617174323.2900831-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <eee0d315-9f0a-9aa8-de86-ab9c13d5a4bf@linaro.org>
Date: Fri, 18 Jun 2021 15:32:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210617174323.2900831-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.202,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/17/21 10:43 AM, Philippe Mathieu-Daudé wrote:
> Commit a2b0a27d33e ("target/mips: Move TCG source files under
> tcg/ sub directory") forgot to move the trace-event file.
> As it only contains TCG events, move it for consistency.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   meson.build                        | 2 +-
>   target/mips/tcg/translate.c        | 1 +
>   target/mips/{ => tcg}/trace-events | 0
>   3 files changed, 2 insertions(+), 1 deletion(-)
>   rename target/mips/{ => tcg}/trace-events (100%)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

