Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC2D510599
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 19:39:17 +0200 (CEST)
Received: from localhost ([::1]:37134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njP9g-0008Ey-8w
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 13:39:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njP6C-0007Mc-QM
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 13:35:40 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:41771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njP6A-0005qj-7d
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 13:35:40 -0400
Received: by mail-pg1-x52f.google.com with SMTP id t13so16626846pgn.8
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 10:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7IWo4fAGYGSy9/9/tmcHXb7G47tAkA8A/GAp9r3AioI=;
 b=I3gT4dcKovv8qFEnEXLvkLTg9oDNVZx1eIi91F0FoypIQvWCL/fgiwCrfkeKYS6+cD
 CwaHPuVU/3PyeCW04+mRd59jfz9B4Pv8m4Ile+GKX/hP6kTXv0RQ2cEn/bvAn8H+HmTW
 aB0yKGJsvmX0qGprRqUSR1lSMBZVASXFvl90Xt9QE4Sv9LZbdHdF+4otwICsmTBjpkpl
 3yHo83ZRmxxxV4S32OBJWeWmyLVMx3OTeYjURDK7Kk12mdPj6gnqY7nhlxBMs07pJ8Ik
 FR1UDFZNk+WSLu0s9BnhtX9/HeiH0UDknj8SjbiMtsBOpsPJQJiCnMEy+/4Wfe33cjkA
 w/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7IWo4fAGYGSy9/9/tmcHXb7G47tAkA8A/GAp9r3AioI=;
 b=ywnGBS0/RZxpn2aNjMcqCSwwZW3kky5N+EScKL7p8vVRQnLjkdwQgyzfNzFjD6CH+E
 6YTH5EVW2KGYUmYy+ipNtcDlljSMhv9ura2gPdPUxXFdr0cJHpxAkW7RfUP37NKX99cu
 Z1f0vqCCjGFX3C5KelSXHauRHYiVHVkzjlvyXbBQWTsrR6maNyLL0QttzznIBoOifdvg
 q3vsJK8LZLVuaRYPkFk7zK9Fq/GRLdxdVATmuW+TzsMqxdqLaz9b96iTjZwKCvNzR+go
 GxcMEYy1ZhvkxhREZvh+6p6TAYhAJWTe6xckIpqp6UZmO5msJ1ubI/usmkiGb5UAg3Rt
 jxiA==
X-Gm-Message-State: AOAM5310b1W6lf2ROU93b4iLlZk0VVs2bnf8gbzVgOETmivqsnF6CZ0E
 bKAGwCrDnNeJ2WC9AG5ajIIN0Q==
X-Google-Smtp-Source: ABdhPJwRfkRCYcBoCbXJ5V/xBQAVICOsNe48q28+GPsoRH3Zqmj4PU3cWDUq19geYJCZlLf7Q5e2NA==
X-Received: by 2002:a63:b40a:0:b0:35e:d274:5f54 with SMTP id
 s10-20020a63b40a000000b0035ed2745f54mr19937299pgf.200.1650994536622; 
 Tue, 26 Apr 2022 10:35:36 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 u4-20020a62d444000000b0050d5b6bd65dsm3382211pfl.66.2022.04.26.10.35.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 10:35:35 -0700 (PDT)
Message-ID: <f3d9e691-2b81-3143-96ef-53c120e6fcd0@linaro.org>
Date: Tue, 26 Apr 2022 10:35:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 2/9] Replacing CONFIG_VNC_PNG with CONFIG_PNG
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20220426110358.1570723-1-kraxel@redhat.com>
 <20220426110358.1570723-3-kraxel@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220426110358.1570723-3-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Kshitij Suri <kshitij.suri@nutanix.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/26/22 04:03, Gerd Hoffmann wrote:
> From: Kshitij Suri <kshitij.suri@nutanix.com>
> 
> Libpng is only detected if VNC is enabled currently. This patch adds a
> generalised png option in the meson build which is aimed to replace use of
> CONFIG_VNC_PNG with CONFIG_PNG.
> 
> Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Message-Id: <20220408071336.99839-2-kshitij.suri@nutanix.com>
> 
> [ kraxel: add meson-buildoptions.sh updates ]
> [ kraxel: fix centos8 testcase ]
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   meson_options.txt                              |  4 ++--
>   ui/vnc.h                                       |  2 +-
>   ui/vnc-enc-tight.c                             | 18 +++++++++---------
>   ui/vnc.c                                       |  4 ++--
>   meson.build                                    | 12 +++++++-----
>   .../ci/org.centos/stream/8/x86_64/configure    |  2 +-
>   scripts/meson-buildoptions.sh                  |  6 +++---
>   7 files changed, 25 insertions(+), 23 deletions(-)

There are still two references to --enable-vnc-png:

$ git grep enable-vnc-png

scripts/ci/org.centos/stream/8/x86_64/configure:--enable-vnc-png \

scripts/coverity-scan/run-coverity-scan:    --enable-vnc --enable-vnc-sasl 
--enable-vnc-jpeg --enable-vnc-png \


r~

