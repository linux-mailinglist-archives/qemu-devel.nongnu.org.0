Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 949AB6482A2
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 13:56:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3cuH-0008KZ-Bw; Fri, 09 Dec 2022 07:55:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3cuB-0008Ju-NU
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 07:55:09 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3cu9-0001sg-UU
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 07:55:07 -0500
Received: by mail-wr1-x430.google.com with SMTP id h10so5114698wrx.3
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 04:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1mVdunZ5mvSnf8QozEsRRrEKl+zARnrZqEdP5lKiiGQ=;
 b=wuv+SK6t3Tk6fLn2EGDCQxQs4sImyc1Vu7ERfc4vxhXpo17KVj9odH7ADjyDh5jk+b
 jLkV3QYbSF+WUVq3B0x/Kfj6nUnZWH1qKan94h11kj7L0YE2q6Ls/KynLfcJ1SbWIlWz
 i/2xDs+o/k4Q79mRb96IfQBhvlreTR3tKTytEyjNoQ4tlaXAWHM/hw50X4k4naAt4Iyc
 RCrA/i0Vm4PETvIkreI5BTsQnfAsfsHS7GhvUI9nsui2RMq6g2xuryhIMaYixevVcxQp
 EJqnF7RMkBkiNAAe6NI7SbkRY6wRBu3oOMuLIo+YCnqxPIkEfg8N++uNk4mgFlSTCchC
 kHKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1mVdunZ5mvSnf8QozEsRRrEKl+zARnrZqEdP5lKiiGQ=;
 b=VWUpQnLayGUP3fL5Aj9bWA2N/I2rCC2qnUaam/0jyDmZJRJvR2D9M0F8zzSNXzFeoN
 ENVhQbXwTui0l9sJs3Lw9esRUSpdpNB6hHU4PfAH9n8K+VhQf3MtvOxdiqVfha/WssOk
 VA90u4LJgPg6mzlaHcDpGWCshSRx/TnwN6U8YTzC/MRRQyitP1DmMDfbrxF/bqARnmrO
 KtBGFLQPeU/+u3CKbQlbilS80hZ3HuwONLe0X7niOectAImD6X+yPsPtTKBLvFpphR+n
 CPVN6OcnNqo5zXEx3nzE7t+DV+GGILnmiYw8J1qJcM4ODKVBQQDiM0adJPypKFJZwyh+
 RrRw==
X-Gm-Message-State: ANoB5pkMKHpyy3v5VYd5oTJU6Kz8X9zAOTaw5ccsFWa6+h1kWAYwswYx
 ccDSh+t+30ff0QatBejws/CTRYlrx16viz68ANI=
X-Google-Smtp-Source: AA0mqf73+KBcqiU5CTjsrxcG3IX4+MH03xguDLHe2OdfW24nCiooA/0Mu9MtDgELcScZTBkLXHN/hw==
X-Received: by 2002:a5d:53c5:0:b0:242:57bb:ee0f with SMTP id
 a5-20020a5d53c5000000b0024257bbee0fmr3558485wrw.25.1670590504343; 
 Fri, 09 Dec 2022 04:55:04 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 g14-20020adffc8e000000b002421ed1d8c8sm1274862wrr.103.2022.12.09.04.55.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 04:55:03 -0800 (PST)
Message-ID: <bc114971-ee1f-b48b-cee7-ebcdae4d572c@linaro.org>
Date: Fri, 9 Dec 2022 13:55:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 19/30] configure, meson: move --enable-debug-info to Meson
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20221209112409.184703-1-pbonzini@redhat.com>
 <20221209112409.184703-20-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221209112409.184703-20-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.288,
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

On 9/12/22 12:23, Paolo Bonzini wrote:
> Older versions of Meson had an unclear description of the -Ddebug option,
> but this is fixed in 0.63.0 that is required now.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   configure                     | 5 -----
>   scripts/meson-buildoptions.py | 2 ++
>   scripts/meson-buildoptions.sh | 3 +++
>   3 files changed, 5 insertions(+), 5 deletions(-)


> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
> index f91797741eef..cb277347bb18 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh

# This file is generated by meson-buildoptions.py, do not edit!

> @@ -10,6 +10,7 @@ meson_options_help() {
>     printf "%s\n" '                           affects only QEMU, not tools like qemu-img)'
>     printf "%s\n" '  --datadir=VALUE          Data file directory [share]'
>     printf "%s\n" '  --disable-coroutine-pool coroutine freelist (better performance)'
> +  printf "%s\n" '  --disable-debug-info     Enable debug symbols and other information'

We should get '--enable-debug-info' here, ...

>     printf "%s\n" '  --disable-install-blobs  install provided firmware blobs'

... and here. Do we have a bug in meson-buildoptions.py?

>     printf "%s\n" '  --docdir=VALUE           Base directory for documentation installation'
>     printf "%s\n" '                           (can be empty) [share/doc]'

