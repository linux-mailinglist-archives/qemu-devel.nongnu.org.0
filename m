Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAB3363737
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 20:55:33 +0200 (CEST)
Received: from localhost ([::1]:55748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYCZw-0003jI-Rm
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 14:55:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYCWX-0002ML-NO
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 14:52:01 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:34472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYCWV-000740-1q
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 14:52:01 -0400
Received: by mail-qk1-x731.google.com with SMTP id y136so1812214qkb.1
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 11:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HBgRFnF01VCbnNcCv6F8+o99a5k2AsfdxhHfWarCcgs=;
 b=ylOEbJHqijZhTHrowsFUOf7CmU39nJ6nZ1ZPAXjOCvApAHZ8JWWKagWcs9n7lpJBXb
 zL4nOQeR77HE8R0xoQPIeHvgHt4cx5K8i6+lutcMYbnlLNZrv9tZYepFoitoizcTsmth
 Ab3wENlyrgumSNqcQiZ99ZNIirPHHJqEH46S0+Flg1UwQPn/aL7aaMIzK94Iej9T1zGQ
 Z2xTQdDV1AH14pbzfNHvDb14Ggl7a2gkxJHLubvWnakTYZrqOYWfyjIpt+GbySXh06BA
 K2bEQ02DnONhrO5/LRGNqA7Pi/xOTY1KbXtJhOdJFf0XSn9xueWCD5C/6bc1rnpiFWfA
 i3sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HBgRFnF01VCbnNcCv6F8+o99a5k2AsfdxhHfWarCcgs=;
 b=Q8R1de7C5VEH8YLxy/sPwTN0UuCsubkKy5mqTnIgg1WPthFoVuCfa2v5T9PA2Crda/
 6QasXXMUFozvR2IDzCxf9NMRMHXwFbR1CpkSvE6yqIEridzhLIahP1IzhA9G+uE6s+XW
 RKY+d20qbFAi5vx1+x5/AYeU7ashq8x/BhG179dqoMtE6IqMAiJm/DpljP6TbvAMPgaQ
 OVNMy4Fktnpqp3nZm1U1IdsrJ/44JhHXzJ7egZ/Y0fPEYkVY6SFBZItCSlOoY+SK4vAi
 ILN6xEkEc3O2zNkhcpJWpTTn2W5f/l4iFH9uj3LJSX34HjcrGwq+RRNBflyLqkVIyudn
 K3Og==
X-Gm-Message-State: AOAM533lEaL4VB5qPwReERKH1SfvK0v2gtrl+2qy7atNERmJ6Y46H5N5
 Oe4fHfcSik7iARSXNmYj+sl25g==
X-Google-Smtp-Source: ABdhPJw/nj5CRFmP2cuYv9OESgQxoSl+yos0CAR+6DLItyM5cgRwMQ+2JNmixXGC27h016ixmCHfOw==
X-Received: by 2002:a05:620a:7d1:: with SMTP id
 17mr8798814qkb.403.1618771918058; 
 Sun, 18 Apr 2021 11:51:58 -0700 (PDT)
Received: from ?IPv6:2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3?
 ([2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3])
 by smtp.gmail.com with ESMTPSA id m29sm261519qkm.101.2021.04.18.11.51.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Apr 2021 11:51:57 -0700 (PDT)
Subject: Re: [PATCH 02/26] target/mips: Move IEEE rounding mode array to new
 source file
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210418163134.1133100-1-f4bug@amsat.org>
 <20210418163134.1133100-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f4657f3c-c1fd-5041-c327-195f664034d5@linaro.org>
Date: Sun, 18 Apr 2021 11:51:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210418163134.1133100-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x731.google.com
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
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/18/21 9:31 AM, Philippe Mathieu-Daudé wrote:
> restore_msa_fp_status() is declared inlined in fpu_helper.h,
> and uses the ieee_rm[] array. Therefore any code calling
> restore_msa_fp_status() must have access to this ieee_rm[] array.
> 
> kvm_mips_get_fpu_registers(), which is in target/mips/kvm.c,
> calls restore_msa_fp_status.
> 
> Except this tiny array, the rest of fpu_helper.c is only useful
> for the TCG accelerator.
> 
> To be able to restrict fpu_helper.c to TCG, we need to move the
> ieee_rm[] array to a new source file.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/fpu.c        | 18 ++++++++++++++++++
>   target/mips/fpu_helper.c |  8 --------
>   target/mips/meson.build  |  1 +
>   3 files changed, 19 insertions(+), 8 deletions(-)
>   create mode 100644 target/mips/fpu.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

