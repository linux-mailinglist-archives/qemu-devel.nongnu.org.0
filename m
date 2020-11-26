Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FA02C4BE6
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 01:15:37 +0100 (CET)
Received: from localhost ([::1]:58932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ki4wi-0001kQ-24
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 19:15:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ki4un-0000kJ-TM
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 19:13:39 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:39629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ki4ul-00079U-K2
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 19:13:37 -0500
Received: by mail-ot1-x343.google.com with SMTP id z24so389322oto.6
 for <qemu-devel@nongnu.org>; Wed, 25 Nov 2020 16:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=LU8YAnuqUHiTr2hHZHachgDpMMmCzvD3EmgFCTQU7T8=;
 b=NYyhGeKSvHe8TnxSw+6UNAfhl59oWv55JxVm4jl8Sm0bPms4lKI1bhAl1IntYGyi08
 NkFKTn8qkZNTKfLQsBFSVox5ZitNYmR8hKeawjNilN9goMLhOuLuTmp3qqX6wkFUrYFO
 IDRiM0p0b0X4lixAxbvDZ5L8RPACaSlO/u2CP3ftoNUT4rjmN5qpvIyVXFOHuZKv9WH4
 633nawnSMNyZhZBcrESG17dMTfdFD4leRFIf4Zq2gjuwv6Yn2SrpibnCN2YedoY/gxMv
 3mC96raIV51a7oiODiKedG7TTRcBf4r1rnRt9zoMdPgsCKS4PQXP5AqqnQ+IpFbwj1w1
 5cxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LU8YAnuqUHiTr2hHZHachgDpMMmCzvD3EmgFCTQU7T8=;
 b=OC32xieEodWft/hdGZ2X5NcKtiUGejdyxlpqO1wXd4uKoX+VOfd5060jcjc+KiKrGE
 2jOmG6rpkBbL0EALAQcUgOnPz7qrUr6CG/AO4SoxqwMAIeIdJSDWYtwhNw21lTI5Z/Le
 Kv2atvYwemA/U9cZGRqsXlJxckIIg0ov03RoU+yAUMccko4r/GaizJtviOuoz7oDW5Jg
 ANyIz2NDfsTZpl2M3LuXKvHhnU5K3bfKAK7afS8ZSJ7E5RqIpC0hj7KeUaHfBCZnrNvF
 ou9c683Ra8wDhucdAlCJO6NXlpueNVL9fz374TGKPoGLSBNRT8YGp/kqjZIjJgaI76IG
 nvRg==
X-Gm-Message-State: AOAM530sIJtsWhz85/OFFc8+KEWt0gnDdsfexsRJfs+jJ3aadeaHgyNn
 x1fsijzeCfbcUmYAXLZthMFuZ5oHhPxDBg==
X-Google-Smtp-Source: ABdhPJwDsmszUHAAYF/NuE47Mk/2u4o8/ZUFyMu7B9Mfb8Au4eNCT4gE0oKz+aexTBIaq9Us2XZtZg==
X-Received: by 2002:a9d:3435:: with SMTP id v50mr564129otb.292.1606349613217; 
 Wed, 25 Nov 2020 16:13:33 -0800 (PST)
Received: from [192.168.20.233] ([12.220.158.163])
 by smtp.gmail.com with ESMTPSA id i82sm2172816oia.2.2020.11.25.16.13.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2020 16:13:32 -0800 (PST)
Subject: Re: [PATCH v2 03/28] target/mips: Rename msa_helper.c as
 mod-msa_helper.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201123204448.3260804-1-f4bug@amsat.org>
 <20201123204448.3260804-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3551bfc9-d0a5-36e9-eb5a-349be4589118@linaro.org>
Date: Wed, 25 Nov 2020 16:13:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201123204448.3260804-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x343.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/23/20 12:44 PM, Philippe Mathieu-Daudé wrote:
> MSA means 'MIPS SIMD Architecture' and is defined as a Module by
> MIPS.
> To keep the directory sorted, we use the 'mod' prefix for MIPS
> modules. Rename msa_helper.c as mod-msa_helper.c.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/{msa_helper.c => mod-msa_helper.c} | 0
>  target/mips/meson.build                        | 3 ++-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>  rename target/mips/{msa_helper.c => mod-msa_helper.c} (100%)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


