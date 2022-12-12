Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FE76499B6
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 08:48:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4dXy-0002ga-UY; Mon, 12 Dec 2022 02:48:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4dXU-0002fN-66
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 02:47:52 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4dXS-0003ma-K7
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 02:47:51 -0500
Received: by mail-wr1-x42f.google.com with SMTP id h16so2197760wrz.12
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 23:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0UU2W7NkZf3GBkgGE5B+3Mhx+zTskXrKgSfY77uDOgQ=;
 b=H0u+UYn1YoWMLO23cPJx5tMsjuJH5Kj1CMiOjmb1ckOkXGzwSvTC7h+QlC6eOsKU2T
 MsM3BVxN9aKt2OoklVmjGYTvLQuk9VF1x/1FSuHXf+iiXTb+sH7aS0cDOK4rpoG5H8Bh
 RSl+qbV63EUFUu2C+m9t0jOZB3iB2EjkE+qevoDmYYNyLhlfb6WXo0sy2UteatV91a1U
 gymcPujEAtSe8WB7fa1nJ3sCNgOGxKCY0MLduHCc+W/y4aluJK4PPDSg7xD9JhgiKgnH
 P9/D7zc+j6ieLTBvkp6Dwro7Ihv4n+i04BJSO4HbPjayHXUxtN4m1CerJtSJ5kE/sIMx
 tTkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0UU2W7NkZf3GBkgGE5B+3Mhx+zTskXrKgSfY77uDOgQ=;
 b=yCDiR1VOYKelw7gRoQg76JduOtoQMDrw77LO5eLJpC0GCCRIirQOJZP6LGqj6G/aG8
 we6UCQw0H+JD8tJjH4n5lmj60D6O4vIClyCVMYvKnYJ/rvF4oiYsmztETi8z3sx77ulM
 C9SmfAsqZufoxqXnsO3/BnS9HdIM7r2HNxp8q+u3gUx3/E+kZIYihiuxeLQGns95XOFo
 iruOFr+DJMOHoEJT4GodZtv71I1kVGQjZwWdTq5XHG0VBDyIPCYDSrcUutuDhgMw0afR
 yIOEk1Z4nWicAYl/kXxNFBrPZCxed6OeA1oGgPkBWKMqhFKRiGBWZ8+2NXT4+4GJR2Rd
 rg7A==
X-Gm-Message-State: ANoB5plmpncAL9sbhe4iGu5oxRX0ZWebu1a0AA1jsBESG2ZpWjFqUqVg
 FhL31wl83YwPWZ7sTUGrciwSiA==
X-Google-Smtp-Source: AA0mqf57v8DqbmEyAEtU+2EO8+GJMW0dQbM6encBDPSZ8SbjZlLbYxPVLlGHZdNpi99++YzxTUT0Sw==
X-Received: by 2002:a5d:5544:0:b0:242:5698:6faf with SMTP id
 g4-20020a5d5544000000b0024256986fafmr9102779wrw.2.1670831269145; 
 Sun, 11 Dec 2022 23:47:49 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h17-20020a5d4fd1000000b0024246991121sm7947477wrw.116.2022.12.11.23.47.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Dec 2022 23:47:48 -0800 (PST)
Message-ID: <2a29a2ef-f0b2-316c-a31b-9c6b7b3946e1@linaro.org>
Date: Mon, 12 Dec 2022 08:47:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH] linux-user: Enhance strace output for various syscalls
To: Helge Deller <deller@gmx.de>, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org
References: <20221209105531.40286-1-deller@gmx.de>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221209105531.40286-1-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 9/12/22 11:55, Helge Deller wrote:
> Add appropriate strace printf formats for various Linux syscalls.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>   linux-user/strace.list | 43 ++++++++++++++++++++++--------------------
>   1 file changed, 23 insertions(+), 20 deletions(-)


>   #ifdef TARGET_NR_poll
> -{ TARGET_NR_poll, "poll" , NULL, NULL, NULL },
> +{ TARGET_NR_poll, "poll" , "%s(%p,%d,%d)", NULL, NULL },

nfds_t is unsigned, so "%s(%p,%u,%d)"

>   #endif
>   #ifdef TARGET_NR_ppoll
> -{ TARGET_NR_ppoll, "ppoll" , NULL, NULL, NULL },
> +{ TARGET_NR_ppoll, "ppoll" , "%s(%p,%d,%p,%p)", NULL, NULL },

Ditto: "%s(%p,%u,%p,%p)"

>   #ifdef TARGET_NR_recv
> -{ TARGET_NR_recv, "recv" , NULL, NULL, NULL },
> +{ TARGET_NR_recv, "recv" , "%s(%d,%p,%d,%u)", NULL, NULL },

It seems you switched the last argument: "%s(%d,%p,%u,%d)".

>   #ifdef TARGET_NR_set_robust_list
> -{ TARGET_NR_set_robust_list, "set_robust_list" , NULL, NULL, NULL },
> +{ TARGET_NR_set_robust_list, "set_robust_list" , "%s(%p,%d)", NULL, NULL },

2nd arg is size_t, so "%s(%p,%u)".

Modulo the few unsigned formats:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


