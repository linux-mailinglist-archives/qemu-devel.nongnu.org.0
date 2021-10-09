Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 255D0427BD3
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 18:11:11 +0200 (CEST)
Received: from localhost ([::1]:49704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZEwI-0008Jf-4Y
	for lists+qemu-devel@lfdr.de; Sat, 09 Oct 2021 12:11:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mZEt6-0006CF-5v
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 12:07:52 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:36670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mZEt4-0003eN-Lw
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 12:07:51 -0400
Received: by mail-pl1-x634.google.com with SMTP id k8so2751983pls.3
 for <qemu-devel@nongnu.org>; Sat, 09 Oct 2021 09:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LbyfUupmmmJGj97RG3e+S1U4FOOCiLBc3tQBVQJtdHo=;
 b=GxSovLBj8dxcA6UCfDQ+bdWIUrjPcwWw1+it72B6bxkS1+fAOWc1J02w6F6+gkhKfV
 k9niHLy194GYKPcwPj8ka67JMv6Dqap7fQdbjPOwiGtFHCqXdUAjdg03yxcqjz9evNZt
 cIPY0hgGCDIfnuZvXVMQoI/TE+Ai+5ZByYQAzeNE4Zuij7/ZFSbb6KDzMjis4sJW0ZvK
 IIv7rHu6pNdToHegjmksPk2s6S9mgM694AELLuLeAbfraZ+d9AoKsqGr3n8bBiFSNCDi
 EdE2YEyVca3UNpA/nqZgIuNmM3jE+QUzp76nMJlB1OZvpF2oqYTkzlUbtR1VlsXCVTIG
 Zc6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LbyfUupmmmJGj97RG3e+S1U4FOOCiLBc3tQBVQJtdHo=;
 b=8GcZwxXnoKsfB+sjhDNvkCflDtQIbeHJiY2OAE8/IyOwaNt8B+dKV7cb9Oaq1Y4GGX
 T0JWAbWiLK3zdyyRpMT4wOEAmh81bWGZnvac8RkriARTCDrHfBh/7LNyB6Nl4H/gVlqd
 iMIR365UwoMKG+kkCOkP2RznZfoLNTN02rbOEFI3m9qyu7wieLs+EACFCRZxXQ6et0T+
 PoEO7Q8GrHWMxmNL3Medn0XjH77NXUyGV3lwPC2GcvVnVbdANuqk/AHEmvRYy230UAzj
 GW401D9ED1Jyqddr2FGzfaSM8mNfs7FrrOeIRGP2NFRdTAVxpC5OUpdJ8KyMiBf6Ampl
 Jgxw==
X-Gm-Message-State: AOAM533WHUxYvfvJ1dnrnfsEK2GedgORO6lnuQTYlVXadgMBSl8xTauz
 lUKIi6rX741qKYepykF457jAvA==
X-Google-Smtp-Source: ABdhPJzO4wQQU43vunsmVCoqoKCo8N2MHZcdfN68sB57EUpALFCMS4vVEUPF5lcqc5sOwx13StCpnQ==
X-Received: by 2002:a17:90a:1b8b:: with SMTP id
 w11mr18916538pjc.58.1633795668724; 
 Sat, 09 Oct 2021 09:07:48 -0700 (PDT)
Received: from [172.16.83.58] (068-185-026-038.biz.spectrum.com.
 [68.185.26.38])
 by smtp.gmail.com with ESMTPSA id 23sm2765806pfw.97.2021.10.09.09.07.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Oct 2021 09:07:48 -0700 (PDT)
Subject: Re: [PATCH] Trim some trailing space from human-readable output
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20211009152401.2982862-1-armbru@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <25d961c4-610f-8c57-d4b2-7989c4c78a59@linaro.org>
Date: Sat, 9 Oct 2021 09:07:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211009152401.2982862-1-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: jcmvbkbc@gmail.com, groug@kaod.org, jiri@resnulli.us, ehabkost@redhat.com,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/9/21 8:24 AM, Markus Armbruster wrote:
> I noticed -cpu help printing enough trailing spaces to make the output
> at least 84 characters wide.  Looks ugly unless the terminal is wider.
> Ugly or not, trailing spaces are stupid.
> 
> The culprit is this line in x86_cpu_list_entry():
> 
>      qemu_printf("x86 %-20s  %-58s\n", name, desc);
> 
> This prints a string with minimum field left-justified right before a
> newline.  Change it to
> 
>      qemu_printf("x86 %-20s  %s\n", name, desc);
> 
> which avoids the trailing spaces and is simpler to boot.
> 
> A search for the pattern with "git-grep -E '%-[0-9]+s\\n'" found a few
> more instances.  Change them similarly.
> 
> Signed-off-by: Markus Armbruster<armbru@redhat.com>
> ---
>   monitor/hmp-cmds.c         | 2 +-
>   target/i386/cpu-dump.c     | 4 ++--
>   target/i386/cpu.c          | 2 +-
>   target/ppc/cpu_init.c      | 2 +-
>   target/s390x/cpu_models.c  | 4 ++--
>   target/xtensa/mmu_helper.c | 2 +-
>   6 files changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

