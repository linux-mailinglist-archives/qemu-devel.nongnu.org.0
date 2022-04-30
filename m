Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E442351594C
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 02:22:47 +0200 (CEST)
Received: from localhost ([::1]:54186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkaso-00030J-GU
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 20:22:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkarV-0002Iw-BG
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 20:21:25 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:38614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkarT-0000ia-Bu
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 20:21:24 -0400
Received: by mail-pf1-x429.google.com with SMTP id g8so5761949pfh.5
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 17:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=PFlm/Dym8UEGFlNu7bjxf1StTfjEs2pFRYU82L4Pyws=;
 b=XQ1yX25jgAjMrJEZ3obz+PobOE/uTNkE5KLjzPnYH2xtlmLdjDIVA5+apz8qUvMYEI
 sFAvS7RTWD6yMAEfuFFhqicUE2Ffh+bII06cWth2h0tgMZ+Bju+UxjfcLOmJprU2kIlg
 0QBAKjAEpKQOqS2xCSJDaUgwmj5J4R1B+hzfnj5pY96fxAb0RgIiVE03hnvOsK9tVlve
 wA9AaIm4kXg9263oAeSr1zASXTKQTjLXcIKuMlUe1TWQ2JRrGk8DLapgQ8C4PHCl2eoI
 qQn2IBkHcjiR+kjlpD8KvdTA+kaltLyEYmkJwTz0ZbEZbFqMAzlPsIrNZY9jetaRYqnT
 9xrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PFlm/Dym8UEGFlNu7bjxf1StTfjEs2pFRYU82L4Pyws=;
 b=orfkW5N72q8c9lNB13ovU2HUMIbyGP2EhDjHR6pIzMY0T9hbGCAZ5pUcPZwTzybJKj
 jaAGHopo27rx54itKQkV2tsfffB8bcW9Z1tgdX40sXaO2ghQiipd5hvcmTQI02W2dNTz
 nSBXvsnSDefLc486iog4WEfQ1k07ycTZzfGA2su7lkzoTVvG3VWXv8+vDhPDBqDSQZ1R
 PQci2tHtjByKshi0gvsW4luQBrkqqZ3tomAr/ArCkV5jHqGPyYYGYaEh7oa0J4OzC/66
 /kBWuyLWQeRzPjqavAHaV/qGcCod+7C+S9f0pnaDagzCBZ+04Re6LsoEtANR3MUQ5ibu
 nHrQ==
X-Gm-Message-State: AOAM532srE+zuamK4cTB7mMgy+oQS4C2y0lUI1Y3GUfKcoBmjwSaJrcx
 mWLnulbSyq4qR0J/q6Xp9zl3xg==
X-Google-Smtp-Source: ABdhPJyLdB5Rbz4aexboxWQIqfk9tdqOnNnWKVW5BmPd4hRbcS/G8vHIfTw2v9ncN6eu8Am4s3CcJA==
X-Received: by 2002:a05:6a00:814:b0:50d:450a:dc5e with SMTP id
 m20-20020a056a00081400b0050d450adc5emr1591153pfk.15.1651278081317; 
 Fri, 29 Apr 2022 17:21:21 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a17090aa38200b001cb6527ca39sm15737701pjp.0.2022.04.29.17.21.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 17:21:20 -0700 (PDT)
Message-ID: <4d9a948b-d27a-3570-197b-ac27bac5843e@linaro.org>
Date: Fri, 29 Apr 2022 17:21:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 00/25] Misc patches for 2022-04-29
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220429152312.335715-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220429152312.335715-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/29/22 08:22, Paolo Bonzini wrote:
> The following changes since commit f22833602095b05733bceaddeb20f3edfced3c07:
> 
>    Merge tag 'pull-target-arm-20220428' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-04-28 08:34:17 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/bonzini/qemu.git tags/for-upstream
> 
> for you to fetch changes up to ec31a2f9b5b128c06a499ad076d8b29d664d3896:
> 
>    pc: remove -soundhw pcspk (2022-04-29 15:07:21 +0200)
> 
> ----------------------------------------------------------------
> * WHPX support for xcr0
> * qga-wss fixes
> * Meson conversions
> * Removed -soundhw pcspk
> 
> ----------------------------------------------------------------
> Konstantin Kostiuk (2):
>        configure: Add cross prefix for widl tool
>        qga-vss: always build qga-vss.tlb when qga-vss.dll is built
> 
> Paolo Bonzini (22):
>        meson-buildoptions: add support for string options
>        meson, configure: move Xen detection to meson
>        configure, meson: move iasl detection to meson
>        configure: move Windows flags detection to meson
>        configure: switch string options to automatic parsing
>        meson, configure: move --tls-priority to meson
>        meson, configure: move bdrv whitelists to meson
>        meson, configure: move --with-pkgversion, CONFIG_STAMP to meson
>        meson, configure: move --interp-prefix to meson
>        meson: always combine directories with prefix
>        configure: switch directory options to automatic parsing
>        meson: pass more options directly as -D
>        configure: omit options with default values from meson command line
>        meson, virtio: place all virtio-pci devices under virtio_pci_ss
>        configure: simplify vhost-net-{user, vdpa} configuration
>        build: move vhost-vsock configuration to Kconfig
>        build: move vhost-scsi configuration to Kconfig
>        build: move vhost-user-fs configuration to Kconfig
>        meson: create have_vhost_* variables
>        meson: use have_vhost_* variables to pick sources
>        configure, meson: move vhost options to Meson
>        pc: remove -soundhw pcspk
> 
> Sunil Muthuswamy (1):
>        WHPX: support for xcr0
> 
>   Kconfig.host                     |   3 -
>   backends/meson.build             |   8 +-
>   configure                        | 673 ++-------------------------------------
>   docs/meson.build                 |   2 +-
>   hw/audio/pcspk.c                 |  10 -
>   hw/audio/soundhw.c               |  27 +-
>   hw/net/meson.build               |   8 +-
>   hw/scsi/Kconfig                  |   5 +
>   hw/virtio/Kconfig                |  18 +-
>   hw/virtio/meson.build            |  34 +-
>   include/hw/audio/soundhw.h       |   3 -
>   include/hw/virtio/virtio-scsi.h  |   2 -
>   meson.build                      | 256 +++++++++++----
>   meson_options.txt                |  28 +-
>   net/meson.build                  |  12 +-
>   qga/vss-win32/meson.build        |   4 +-
>   scripts/meson-buildoptions.py    |  86 ++++-
>   scripts/meson-buildoptions.sh    |  74 ++++-
>   scripts/qemu-stamp.py            |  24 ++
>   scripts/xen-detect.c             | 203 ++++++++++++
>   target/i386/whpx/whpx-all.c      |  89 ++++++
>   target/i386/whpx/whpx-internal.h |   3 +
>   tests/meson.build                |   2 +-
>   tests/qtest/meson.build          |   4 +-
>   tools/meson.build                |   2 +-
>   25 files changed, 778 insertions(+), 802 deletions(-)
>   create mode 100644 scripts/qemu-stamp.py
>   create mode 100644 scripts/xen-detect.c

Fails:

../target/i386/whpx/whpx-all.c: In function 'whpx_set_xcrs':
../target/i386/whpx/whpx-all.c:312:31: error: initialization of 'struct CPUX86State *' 
from incompatible pointer type 'CPUArchState *' [-Werror=incompatible-pointer-types]
   312 |     struct CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
       |                               ^
../target/i386/whpx/whpx-all.c:323:21: error: invalid use of undefined type 'struct 
CPUX86State'
   323 |     xcr0.Reg64 = env->xcr0;
       |                     ^~
../target/i386/whpx/whpx-all.c: In function 'whpx_get_xcrs':
../target/i386/whpx/whpx-all.c:581:31: error: initialization of 'struct CPUX86State *' 
from incompatible pointer type 'CPUArchState *' [-Werror=incompatible-pointer-types]
   581 |     struct CPUX86State *env = (CPUArchState *)(cpu->env_ptr);
       |                               ^
../target/i386/whpx/whpx-all.c:599:8: error: invalid use of undefined type 'struct 
CPUX86State'
   599 |     env->xcr0 = xcr0.Reg64;
       |        ^~


r~

