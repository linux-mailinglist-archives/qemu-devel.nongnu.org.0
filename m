Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C60F363745
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 21:11:49 +0200 (CEST)
Received: from localhost ([::1]:46470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYCpg-00043Q-Il
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 15:11:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYCo1-0003Qr-CM
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 15:10:05 -0400
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830]:37846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYCnz-0000g8-F7
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 15:10:05 -0400
Received: by mail-qt1-x830.google.com with SMTP id o2so11213188qtr.4
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 12:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VyAJlx5Tcgp1hXXI0TJVc4yJgvVt+wMjjbktfFPWSOY=;
 b=Y62GwEcnCMT5xy++UFdRf8yEIHwsJZfG9FD7m8umylbDaHuW01OyMp5J44qGhaPb2/
 9Hp2dsoiqEmosGVDuIoTdKmNec3D50sS8+lQx9dxMgXYDLXI0QbCuJ70C2N1qWDfYAPe
 aX2vdWod+buhHdorf5waQsQIywuiFlPFuRB0OhcDaeqoHgClb11hT8i1Czhf5H5Bg8QV
 LAsuJygFQExSXC0c6JhauuDYaa9z7AQmsXPzSq5Y0Y7fV2VBf8P4cpSbyL2SFMpv+YHa
 Vv+0LamUO+ROOOSIv0qvoITWA515IzNjXSx59+bcPyAOh5q5ZnsIyy5sCm/AQRQRrUbI
 BSWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VyAJlx5Tcgp1hXXI0TJVc4yJgvVt+wMjjbktfFPWSOY=;
 b=ioa9VLUpvhAQjjnFMl22quRmMJb/8jxqd5o4XBrhXJpusenycC9KFV36hjOWOSB8UV
 izNJ5KBfW6vrsS1es/9ESfPq9PUFD2kDcP/85GlSXwGueY3+S9k8yTFzFeKI2rh5kXAk
 fkNfIgwlIeYVsewrWRsXg7mMyoiivtuyIV7fJwT5FOxcmntWfX3fPPMkg9ooWlR9+HPS
 pXMuLZP08nwjpMypGSJExmc5kyG/NjrpaVEDcoewxGSOgms1MlI+hG4/V8lUuSRPP8hc
 u/GItSI/bVoiVqWJoo1qyj/UEy37NRQHgoVwjThx/1zOTEFPn7M3+SaLlyGZirwSIgAE
 VwIA==
X-Gm-Message-State: AOAM533RVXeFtd65SZdpODeipmrRReGc4Cj2NCLehhLIiqnULDR1NRA2
 npi2REp6cYFhe1wDLfHMFyTadg==
X-Google-Smtp-Source: ABdhPJyfBxS7WTTNiYGasRiZJ1Zzwk90rLjER4bE4PnZNgVJonOs90r2BaAox6sA9KuQkg8YyZlv8A==
X-Received: by 2002:ac8:5847:: with SMTP id h7mr8725694qth.108.1618773002469; 
 Sun, 18 Apr 2021 12:10:02 -0700 (PDT)
Received: from ?IPv6:2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3?
 ([2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3])
 by smtp.gmail.com with ESMTPSA id f12sm7885660qtq.84.2021.04.18.12.10.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Apr 2021 12:10:02 -0700 (PDT)
Subject: Re: [PATCH 07/26] meson: Introduce meson_user_arch source set for
 arch-specific user-mode
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210418163134.1133100-1-f4bug@amsat.org>
 <20210418163134.1133100-8-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0bd8bce6-3d79-99c8-01e4-2352ba30a88f@linaro.org>
Date: Sun, 18 Apr 2021 12:09:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210418163134.1133100-8-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x830.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/18/21 9:31 AM, Philippe Mathieu-Daudé wrote:
> Similarly to the 'target_softmmu_arch' source set which allows
> to restrict target-specific sources to system emulation, add
> the equivalent 'meson_user_arch' set for user emulation.

You didn't call it meson_user_arch in the end.  Last minute change?
Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   meson.build | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/meson.build b/meson.build
> index d8bb1ec5aa9..1ffdc9e6c4e 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1751,6 +1751,7 @@
>   hw_arch = {}
>   target_arch = {}
>   target_softmmu_arch = {}
> +target_user_arch = {}
>   
>   ###############
>   # Trace files #
> @@ -2168,6 +2169,11 @@
>       abi = config_target['TARGET_ABI_DIR']
>       target_type='user'
>       qemu_target_name = 'qemu-' + target_name
> +    if arch in target_user_arch
> +      t = target_user_arch[arch].apply(config_target, strict: false)
> +      arch_srcs += t.sources()
> +      arch_deps += t.dependencies()
> +    endif
>       if 'CONFIG_LINUX_USER' in config_target
>         base_dir = 'linux-user'
>         target_inc += include_directories('linux-user/host/' / config_host['ARCH'])
> 


