Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA11465989D
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 14:19:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBFGc-0006PE-Ea; Fri, 30 Dec 2022 08:17:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBFGa-0006P4-M3
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 08:17:44 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBFGY-000447-UO
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 08:17:44 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so15180966wms.2
 for <qemu-devel@nongnu.org>; Fri, 30 Dec 2022 05:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0PjmwCjJKx5nW8Esm9OPt2gUAai0aLVNerT5iosmZv4=;
 b=c7pxMJcR/+bLgC3zUHt6WNon5nhqmZyOU/4bO60IUZ+PXPNut2u9gGWA7AZQi5RUUq
 diw/0X1DKG11uUdDB3rqjDx+S5R7JMMTRB7Kk94Ae1YsofYvnN1942zU79bgKmYdnITy
 wny0lN2vmB89WNSXpwh4JQ2AkW+bhG6DSXR5spL0kW+pSIeWfwd7yOFatA+DWdaProBz
 /gGIRG8p+CwpER0oDUYgcjKHVFPzmHgfvlhlFuzHEn1NGnQ1Y8u1faLokMyVx0Fyzfjn
 3Wzfr1uXopXLCPDNz1rOHPEhn7cxjuRc8oKxgWjPTuICrwhrnNTp5lfJgJzT0yvfyLzC
 w8Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0PjmwCjJKx5nW8Esm9OPt2gUAai0aLVNerT5iosmZv4=;
 b=0zhGvzk+k1CE7ZfXIw/TG2z9HDA0IUgo6v3px+7Gm996+fR7lexyv19z2jPk0yQd4h
 qz0NtONA60PeV+28QM4DU8wlvX7YXE1u8V219lBX8WHFPiMKfqepEH9pliPytmsRC/wn
 WVHdcPvhmU9NCFjSW/FY331Z76OHc46+6j1t8F4kN6fAlQ01+eNEcp+57Joq32844BCG
 bPePH2vfcNenxttiuqVDvATcZwnv9xlyxfMRRkQpFWKi7gojcOtpSVaIflIxKAfwa+gk
 j0FODqcWBZR98xmj3SIsF0A5DYh+uGZgg0MOE9YwfBVNVemGh7fkRsXNMsIO6yE75O2y
 C3kQ==
X-Gm-Message-State: AFqh2ko7dCD3ctoeLvKb2/loazFcNkkmJjIDZUg9Sc/BMC003J+k1Pj1
 xuiFKy4KQf7IwDXHwzYpTmkFzQ==
X-Google-Smtp-Source: AMrXdXvXQWuxfyXS9t/6jFgWut/UPrZHnUQBH6BgsYrB9CKkvq94wHiNpfQcLHLst/aF/tHJdCSYyg==
X-Received: by 2002:a05:600c:4e04:b0:3d2:381f:2db5 with SMTP id
 b4-20020a05600c4e0400b003d2381f2db5mr22111198wmq.22.1672406261175; 
 Fri, 30 Dec 2022 05:17:41 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 r13-20020a05600c458d00b003d34f170487sm41438530wmo.0.2022.12.30.05.17.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Dec 2022 05:17:40 -0800 (PST)
Message-ID: <886a576c-d7d1-7b89-2859-146706116cab@linaro.org>
Date: Fri, 30 Dec 2022 14:17:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PULL 46/47] accel/tcg: Handle false negative lookup in
 page_check_range
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221230000221.2764875-1-richard.henderson@linaro.org>
 <20221230000221.2764875-47-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221230000221.2764875-47-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 30/12/22 01:02, Richard Henderson wrote:
> As in page_get_flags, we need to try again with the mmap
> lock held if we fail a page lookup.
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/tcg/user-exec.c | 41 ++++++++++++++++++++++++++++++++++-------
>   1 file changed, 34 insertions(+), 7 deletions(-)
> 
> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
> index 2c5c10d2e6..a8eb63ab96 100644
> --- a/accel/tcg/user-exec.c
> +++ b/accel/tcg/user-exec.c
> @@ -525,6 +525,8 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
>   int page_check_range(target_ulong start, target_ulong len, int flags)
>   {
>       target_ulong last;
> +    int locked;  /* tri-state: =0: unlocked, +1: global, -1: local */

Thanks :)


