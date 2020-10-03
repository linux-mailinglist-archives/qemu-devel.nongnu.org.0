Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B87C2822F3
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Oct 2020 11:14:36 +0200 (CEST)
Received: from localhost ([::1]:44820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kOdch-0005k3-4f
	for lists+qemu-devel@lfdr.de; Sat, 03 Oct 2020 05:14:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kOdbX-0005CO-TK
 for qemu-devel@nongnu.org; Sat, 03 Oct 2020 05:13:23 -0400
Received: from mail-oo1-xc42.google.com ([2607:f8b0:4864:20::c42]:46135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kOdbV-0006gY-9L
 for qemu-devel@nongnu.org; Sat, 03 Oct 2020 05:13:23 -0400
Received: by mail-oo1-xc42.google.com with SMTP id b12so975604oop.13
 for <qemu-devel@nongnu.org>; Sat, 03 Oct 2020 02:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=V+N6roBMczoEkvPQ/1usVDxzLXsrnEaEaI6P98ExkN8=;
 b=awPMnOdq1T4kpdut+GKLndz1VMH3tU2JmzebXVpH05JbWXk7EoVLkSYl8ZnXq6eU48
 bDayG73Ko/u7QHfYe6uxBIoDoX7Nbigndip70Vq5hmz46vDAhcNGmdn/z5iXMTvYggbf
 3pLgIHGCxbBRAIc+CH8Ais12lN9xMhbBPYEZNOZk2yAmXy5F2ezPQtpdG0aOsKFjgSC8
 imSOaI9gf4lF+cYjtC4xyUXIPpG7/DhHd9wO0WhVZ2FWV4NY+yGOVBTUipZEDGSDjsdn
 nrOVgO7gImyrafJVHirXd+QwElxd4DGscn38ywe0xXikkZYkyU36V1tInwbz9V93vO9Q
 LiJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V+N6roBMczoEkvPQ/1usVDxzLXsrnEaEaI6P98ExkN8=;
 b=rBwUzpqF5kAMN3HQdAug5LGPCvEHMACXKzRu1oLHJasQc1RoQwn57tD89qA9nTHXlt
 DIxeuvn3iRe3nkiNJiGCOv+ICgrtG5uEp2lwU1X2gKjYMcNdTC1b0jz4Q5y429dBaWtJ
 1rPlIXrhUeTERk5QKYw8RloqdxbCnpjrja0O3wMzdmXkk+jnGE8qkJ1CQ/DjjlSNEX1m
 jAlrfGz+uE0xgEWBG1LF3FzFF3xV0NgGC208Yjf8mbGfQ7NsbNP4npmd8QFMO2cZQ+xN
 TqLcdKNEqqIH85KJBuTHK4sp9whFMpLcUTQeO1l8MRYkmCFU1QxPmwtWTTcAayttbH7x
 3KGw==
X-Gm-Message-State: AOAM530KKnX404jIBc+n9jjR9LR7XB8OViSDZC8P1o3xmEzU1MwQY1Am
 Kc82rvyLBQ55CG6wBeXsznG1AA==
X-Google-Smtp-Source: ABdhPJwDyS+3vQCCE/z6hQPZsQUkioDfS81B5I/mwT+QjHwuP7aEz8vec/vBRXJPG9lK5OrPrnuzEg==
X-Received: by 2002:a4a:d38c:: with SMTP id i12mr5006756oos.81.1601716399988; 
 Sat, 03 Oct 2020 02:13:19 -0700 (PDT)
Received: from [10.10.73.179] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id n23sm132277oon.14.2020.10.03.02.13.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Oct 2020 02:13:18 -0700 (PDT)
Subject: Re: [PATCH v4 02/12] meson: Allow optional target/${ARCH}/Kconfig
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200929224355.1224017-1-philmd@redhat.com>
 <20200929224355.1224017-3-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <31a173bf-6aa3-1ce8-7d14-5e8f11e2a279@linaro.org>
Date: Sat, 3 Oct 2020 04:13:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200929224355.1224017-3-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c42;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.256,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/29/20 5:43 PM, Philippe Mathieu-Daudé wrote:
> +++ b/meson.build
> @@ -529,6 +529,7 @@ kconfig_external_symbols = [
>  ]
>  ignored = ['TARGET_XML_FILES', 'TARGET_ABI_DIR', 'TARGET_DIRS']
>  
> +fs = import('fs')

Note that I have this in the capstone update, and I placed it closer to the top
of the file with some other imports.


>  foreach target : target_dirs
>    config_target = keyval.load(meson.current_build_dir() / target / 'config-target.mak')
>  
> @@ -569,8 +570,13 @@ foreach target : target_dirs
>      endforeach
>  
>      config_devices_mak = target + '-config-devices.mak'
> +    target_kconfig = 'target' / config_target['TARGET_BASE_ARCH'] / 'Kconfig'
> +    minikconf_input = ['default-configs' / target + '.mak', 'Kconfig']
> +    if fs.is_file(target_kconfig)

Missing a meson.current_source_dir()?
Leastwise that was a comment that Paolo had for me.


r~

