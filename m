Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2712DC714
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 20:28:09 +0100 (CET)
Received: from localhost ([::1]:42480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpcT2-0001wE-RC
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 14:28:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpcE4-0006ww-AM
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 14:12:41 -0500
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:44820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpcE2-0007wa-GM
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 14:12:40 -0500
Received: by mail-ot1-x334.google.com with SMTP id f16so24132900otl.11
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 11:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wrLp0TZU5A1doI80Dj5z7VLzYZqzRlsFv+sopw357tQ=;
 b=R4eZCxztWzSIToes3+grukCkyWlCwXhdJNRCPLIWqSrUq9hyrHVyyotwAcEhS8DUl9
 mYjq7hkSXLSKquowYYzi5iWChyU9C5A8ngORzjphB1QFyRCNbSWG5cOzuKbbTIEmO8dX
 LEbyp3KLbUYKujfVtcIxVCubSihYX8sDI6tMw6Fd95bmtwuAP/cRut8yVTPPJfM/rHMe
 7/IraZjXRuK1q1kepSqQE8sSx12mctZGYB3avcGQ91urpyu5wEF0GiD86U01QdFtZ/lW
 DlJ1MioVE7Wy8DzJkH71EbfyAlX+r4MlfFlDtXn1e+0wPSCUqOouK6zxMm0qhubmi8zQ
 vUUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wrLp0TZU5A1doI80Dj5z7VLzYZqzRlsFv+sopw357tQ=;
 b=ZM/ggWTrtApmv3vwF707929JA4PeeaKtzxSrLfZ9TZmD+ze7GeipHYjDBvguKP68++
 0YvFc6+ViHSjUP6oU+MRqGz3qkmRP+EeM8m2Z2gxPN+NZYJ1kll5C9n/GjDio0UVB9BP
 et/rZGzQMc5XyDqlybhAteM20ucZb5JBb1YSaKwqDynzEpBPPjKufGsdK9Ms95076J1L
 vpHySpBnYeIEglz+1KWJFJpf1gntjhethXtATpfri3YMWR841w0RhZPuTuxHpGzHVt9K
 KA+HujqT6zfgrzCI0DrijhIwEv75p63iiaYCEwwI4EzyROjPOI+6eAWuAHbAcesHKNe1
 /YuA==
X-Gm-Message-State: AOAM533MB8OPELpQVtcIuT8VVrVuOflh/WLXppzDyqccuZ8a3J9atdcm
 EJ9CWyjRrAulWp3NqjWnC8myIw==
X-Google-Smtp-Source: ABdhPJxKW9o2E2dhFZDdrhN0VQ6QCbbGRI+NhcSLBRwMyLsH+FkTWrHEuyi7Hwj0a6AmhMXCHR1UUA==
X-Received: by 2002:a05:6830:cf:: with SMTP id
 x15mr26812373oto.55.1608145955880; 
 Wed, 16 Dec 2020 11:12:35 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id b71sm602409oii.5.2020.12.16.11.12.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 11:12:35 -0800 (PST)
Subject: Re: [PATCH v2 04/12] target/mips/mips-defs: Use ISA_MIPS32R2
 definition to check Release 2
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201216162744.895920-1-f4bug@amsat.org>
 <20201216162744.895920-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <42a22713-2e32-0654-c8fc-f567d54c7097@linaro.org>
Date: Wed, 16 Dec 2020 13:12:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201216162744.895920-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x334.google.com
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
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Laurent Vivier <laurent@vivier.eu>,
 Paul Burton <paulburton@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/20 10:27 AM, Philippe Mathieu-Daudé wrote:
> Use the single ISA_MIPS32R2 definition to check if the Release 2
> ISA is supported, whether the CPU support 32/64-bit.
> 
> For now we keep '32' in the definition name, we will rename it
> as ISA_MIPS_R2 in few commits.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/mips-defs.h    | 3 +--
>  linux-user/mips/cpu_loop.c | 1 -
>  target/mips/translate.c    | 4 ++--
>  3 files changed, 3 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


