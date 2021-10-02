Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0242B41FC8B
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 16:33:53 +0200 (CEST)
Received: from localhost ([::1]:37962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWg5H-0007Hm-VC
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 10:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWg09-0001jf-NS
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 10:28:33 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:35388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWg08-0005Of-7t
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 10:28:33 -0400
Received: by mail-wr1-x431.google.com with SMTP id v25so9764419wra.2
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 07:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=szCz1otVrubXjJm911qeLMfpDnJmMjGhma0VbK5XvHk=;
 b=KOv28h2eWY7SZyKc/ODHmkEozXAycZf2ApkF702w90b1bGj2ntsyX0gHb1IfHwMjYw
 lGkbAieXzBCFnX0nuyJC5Yc586BPhGAu6CHR1bWKbGam/bBWAZUvzmIqL3pK5SAWq0Kv
 IKFYGtalqLt+GKT9Z1BMLZfoiVZ3e/wnHfuWR0owAyEgz6iTs2w7ALKnwz4LbjObxmBw
 54XapiNGD8+tw6SIY6bIdzcwPyzmHDr6qD0trP6rViS5Nh3spFNaa68GTQILJJnJYAex
 sxPNYtBmgjw/XONRxA8OwdldLQ3EB07qz3gYWhU3mBTJQfjknVZf8GTZ7n4uF5DMDvn5
 45lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=szCz1otVrubXjJm911qeLMfpDnJmMjGhma0VbK5XvHk=;
 b=Yv2aqqhr7ERrlTb5vYDXS7FBi0DsBOeNOygKvAUoT9uTsZECyUDggezyoECScZI3DV
 ZQ880gCnnPGTT3wyTEHo8hcbIxmq4WXzFv7h8UVg4MxCmiV6jpWINKczI4IyOZVpw0Ox
 A8Itagdu2zQWqRvwaIj5xxiIiLgR9Vp2SU3D1A10rv1/pt+yG+g6lUyWUv0P2/2BkpZ5
 HM90bEwrpSO9mdHtf8lk2o6f7O2eb0OO8Ob3ccl5RMfsly+N38jdCKeFMB64k6ncyPo0
 Vv8TNmscGoeLRQnIEqQn9xnLUACpsoJ1X9gQdcvwT21PIK6pfMyfEwvdlEw0N4NHG241
 U7nQ==
X-Gm-Message-State: AOAM530WBb9pcLeI1u3rr8tFeNQq4mkDLeddqz5f6yO2afFbFs9EYjy6
 pNFzO291M025IAjt8A/GHSkY2zcqMMU=
X-Google-Smtp-Source: ABdhPJysglUxJlV5VtZNMXBDQd63WB3rKuDmYMFNv5rGvWsZiSpARKb1Up+JHGFQy9CQM0FP/vkwRg==
X-Received: by 2002:a05:6000:154f:: with SMTP id
 15mr3718761wry.254.1633184910549; 
 Sat, 02 Oct 2021 07:28:30 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id i9sm1043415wmd.22.2021.10.02.07.28.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Oct 2021 07:28:29 -0700 (PDT)
Message-ID: <8308c75f-9c51-89d9-7692-a1a81edbdaa0@amsat.org>
Date: Sat, 2 Oct 2021 16:28:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 39/41] target/sparc: Make sparc_cpu_tlb_fill sysemu only
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211001171151.1739472-1-richard.henderson@linaro.org>
 <20211001171151.1739472-40-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211001171151.1739472-40-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.413,
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
Cc: alex.bennee@linaro.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/1/21 19:11, Richard Henderson wrote:
> The fallback code in raise_sigsegv is sufficient for sparc.
> 
> This makes all of the code in mmu_helper.c sysemu only, so remove
> the ifdefs and move the file to sparc_softmmu_ss.  Remove the code
> from cpu_loop that handled TT_DFAULT and TT_TFAULT.
> 
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/sparc/cpu_loop.c | 25 -------------------------
>  target/sparc/cpu.c          |  2 +-
>  target/sparc/mmu_helper.c   | 25 -------------------------
>  target/sparc/meson.build    |  2 +-
>  4 files changed, 2 insertions(+), 52 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

