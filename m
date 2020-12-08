Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E86D02D36AC
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 00:06:42 +0100 (CET)
Received: from localhost ([::1]:48762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmm49-0000Jk-UE
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 18:06:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmlrp-0005GR-KN
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 17:53:57 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:32874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmlrm-0003IZ-Tr
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 17:53:57 -0500
Received: by mail-ot1-x341.google.com with SMTP id b18so403382ots.0
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 14:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+MTowHTwHlTml8/iPoRSaOL/Y+tLwUXRr6m65X+52IY=;
 b=cmUnCR9OfByQykzKCGSRD7gy/a+7cS0hgIK26ajqXmYZ45Rsi2LTW4UhIO3XyHMoa2
 YNctGFYUcUvkM5aXexwgvtLHCjZEEpJnMUH8GqT9QY0jKFdFhzIM+9pNaGwXdzxqV5iI
 /DoqdP61BbmiSU03iTUxNm99jh5J/Jo/hWyCl6t9o+MpyPkTREF2YXERCLkc7Yk6tI0L
 0h/9VgA/jjSRWjeCIQ8kXPCoZa29rP+1c1fLHSOhYtZWAcwa7IJe2MaXf8DzdmMTygp5
 l8IHlv6Agj4gAIAlWjenYFjuv240MiSSiH8tdsxQetuX9m1AR3nNULEFzFMahHEGcYwv
 x4Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+MTowHTwHlTml8/iPoRSaOL/Y+tLwUXRr6m65X+52IY=;
 b=aFLt+L6WFirOzfIedk9Javzzhx4fB2h/Pe8NpEMyTMMcjS5fzDeE86EI3WdgCW6JeF
 zDYwF6FDVoWk7nOlGSC6oeJ+idF4FS0zG2jOxKDPRPaGYH4fJoKETYx/tGNjwKvHTycl
 YtxkbjtinhpFzcNJ2Vwrjqqv0KOfps55X8V4XMgC2qdFBd8F/oxN33xagQD8aXo98lSq
 toTNeP8zrEGR2+gweLJghzSs33mgaDTLxx7al04ekLGsHtujEQzJj0Jv6ur8JaVgORjq
 0T6YUr+elfoHS37DewW1tT+ddHEpCRCH+k0B8Y/abyCz/hsoquvLHnpSypoYrdCRCik4
 xtBA==
X-Gm-Message-State: AOAM533H0RqTuQD0y4PZZ7b1hxLK/Pmz7bhxW+yrceVq9I7f9l3YvM4k
 jmnuAOvVrkz1x6gxJ9t9pWk3gg==
X-Google-Smtp-Source: ABdhPJyZmdBqRzd11Np1LvV707p56CpX6aTQgJe+CFjOWwN/REk0GlGeGshBI4eSum1lXOHqyRgMiA==
X-Received: by 2002:a9d:2043:: with SMTP id n61mr299770ota.254.1607468029166; 
 Tue, 08 Dec 2020 14:53:49 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t19sm47807otp.36.2020.12.08.14.53.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 14:53:48 -0800 (PST)
Subject: Re: [PATCH 2/7] target/mips/translate: Add declarations for generic
 code
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201207235539.4070364-1-f4bug@amsat.org>
 <20201207235539.4070364-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e710d5aa-19d4-e2be-9dab-eb0fd94ec6b1@linaro.org>
Date: Tue, 8 Dec 2020 16:53:46 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201207235539.4070364-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x341.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/20 5:55 PM, Philippe Mathieu-Daudé wrote:
> Some CPU translation functions / registers / macros and
> definitions can be used by ISA / ASE / extensions out of
> the big translate.c file. Declare them in "translate.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.h | 33 ++++++++++++++++++++++++++++++++
>  target/mips/translate.c | 42 ++++++++++++-----------------------------
>  2 files changed, 45 insertions(+), 30 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


