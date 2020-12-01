Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C36B72CAA57
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 18:59:34 +0100 (CET)
Received: from localhost ([::1]:56834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk9w5-00067A-SJ
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 12:59:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk9cB-0000ty-IG
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 12:38:59 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:38561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk9c7-0005CA-Kg
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 12:38:59 -0500
Received: by mail-ot1-x341.google.com with SMTP id e105so2443057ote.5
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 09:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=22WUza3ugfwdI2aYs11AvFaB68x+9us1UQ0mxZepAuc=;
 b=Q2bWWjS4RvcAUyQe9ckH9qfl8F0G045PPKkTH+gzc7YIlPEnU7AGN37Q4iXcsgYNiw
 sbWhrynT4Elqcr9vUOe9YWp7zQKqL8aMO9X6D9Hxbo47h+p+38nUvybKDZ2iqbhvmutg
 T+6QKs6mKVurPg37Xkh4TWtW0LYRh6IeMCaWzREt+kJGUiwQS+FbZHnXqrBRwu3MHup4
 8IJGSsdiZpwBPoOP6nFiZkHEq2wQp3zDRUnhYEFJlViuOCPu3F5A+3bs1bOkYvTLoRJX
 CTVrTqnoEBE0HvWJf6hOhmKWlTL/4QBtQley9IyGvB+xleII3S+HPc0XVStDtoNZIPdn
 UrIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=22WUza3ugfwdI2aYs11AvFaB68x+9us1UQ0mxZepAuc=;
 b=FULw7C/NDS7KC6HGGep96v1xnZQ/CzcdIiftOAxpl/ctRIr5kZahItWV1Zzh3/DOsS
 5HhdRxZjQ19Sz1IQ6OeAfJHUx+o7HenPwq0T5G/O13KH3AGSklEry5aizO9EB3za22Jp
 /BUCUQUDRcmHy4fbvmbaV505YSwXMV7bZHJht2wB6c/VJf5y6s5mUiZt8Sgq8+pTBT+m
 q9IFwoC9BEN3EuK6Fshw9xA2OefF6XnYEJRu5nEWjqvojvRg6W0/AmiH6VaKNO6MOfnw
 ro8ScxZyjcjjNKX+dAEJo0XhNNLcM3Gc6yBjZLkGMnzEjLNCL+L7FAjac2vf5VQJrppt
 4hSg==
X-Gm-Message-State: AOAM5328aLjMvh6yLWEnnr15mSXnBBwko8L6fZZsEcDpsRXfS7693zcf
 dcj6FyCFev0NQMfN9igfoBrjOHbgXb8bwe+n
X-Google-Smtp-Source: ABdhPJxmwBxlpxWuV2wiShKuoqn53NcHU378OewtSbIQMbWimAfol7glmn01YsX/MJYn55DZKR/oAA==
X-Received: by 2002:a05:6830:1e08:: with SMTP id
 s8mr2619354otr.144.1606844334523; 
 Tue, 01 Dec 2020 09:38:54 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id i82sm47339oia.2.2020.12.01.09.38.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 09:38:53 -0800 (PST)
Subject: Re: [PATCH v2 2/6] linux-user/elfload: Rename MIPS GET_FEATURE() as
 GET_FEATURE_INSN()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Huacai Chen <chenhc@lemote.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-devel@nongnu.org
References: <20201201133525.2866838-1-f4bug@amsat.org>
 <20201201133525.2866838-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0164b2ed-046d-a34e-a33b-3e5486167d7d@linaro.org>
Date: Tue, 1 Dec 2020 11:38:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201201133525.2866838-3-f4bug@amsat.org>
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Meng Zhuo <mengzhuo1203@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/1/20 7:35 AM, Philippe Mathieu-Daudé wrote:
> We want to add macros similar to GET_FEATURE().
> As this one use the 'insn_flags' field, rename it
> GET_FEATURE_INSN().
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  linux-user/elfload.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


