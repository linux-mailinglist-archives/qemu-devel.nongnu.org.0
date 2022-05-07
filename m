Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5561F51E760
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 15:20:51 +0200 (CEST)
Received: from localhost ([::1]:34408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnKMa-0006u4-UK
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 09:20:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnKJz-0005eH-Fv
 for qemu-devel@nongnu.org; Sat, 07 May 2022 09:18:07 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:55908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnKJx-0003W7-Kq
 for qemu-devel@nongnu.org; Sat, 07 May 2022 09:18:07 -0400
Received: by mail-pj1-x1033.google.com with SMTP id r9so9340931pjo.5
 for <qemu-devel@nongnu.org>; Sat, 07 May 2022 06:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=n6b4I5scTDTwC63SIXdi0sl633SnvArXi8I6a0tj5gI=;
 b=L6JMpPZVcQlBeU9wKOHs2nkOrIUOzK986nJq08VZ95tFDBkUYwhsnTByOS8lfhirgh
 1lYo6zakmKkpO8qWFwpelDnaAnOJvBJtKok4QrlCTZ1dO2lk6RCgtrVq3zDUOHeIm8l0
 bWhsmzugAJnKGhJp0G5wlROnWSYg4C6mqLu7fhUw/UpMClPmx4HSgbEbS4lr9QQpm4fe
 mcTNmyVhw87zejXUxiCeFsECPhEJuOsTrrdn3vdQcfnROEJOL0uLgv8GvvTW3StCMnRk
 aEy9ZhFzKJZv5IhG8vS87mgi7WhWYUA9l+YapJF43PRFCfvsS73zRYmtF6l50oTCbkOc
 eD4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=n6b4I5scTDTwC63SIXdi0sl633SnvArXi8I6a0tj5gI=;
 b=bLuG2yZNnIkNF6thiK3AwGlXJHF/V4dLdy2Wtn8bSgDaTyStXVUMCur4bHRgcFO1uL
 ixdqn/irOOKYJ6jQoEupqTpV0ot+dqWT6XnA3M/RV9mNX8xL3q22tBC8ZbHG5iij2pa/
 YlVhJGd+79pAmW2DsaeC8TugYWpybirKpmr3n//YCuoLnnMyUDAVUuC/Rp526tC/E0QF
 sDwedahEfOfOj/8MPku4ER80H6XkRvnBDrKbfNy6vBHf7z3dBVH/UCpOVsrUxMCCNDa1
 3FPlZRzg6PU1Fm/iT2+H3l4Zj4pOVungaHbmOAVNZdxThe5foma9sPCGImqdgCUvZIDw
 ey+Q==
X-Gm-Message-State: AOAM531godCZpgAP6IzMRfSkOlzwJvjMeP36MJz97ARTPxPKT6tuJZgn
 HRg7f6WAe0ghb00eGMC8mvFopA==
X-Google-Smtp-Source: ABdhPJxK0175HuAqnebwTMq6Vp6CCQVM+UIAvPcF60xr+aay4hNEcll1WTujmszAq+3kHeiOM2jQsg==
X-Received: by 2002:a17:903:2495:b0:15a:a0f7:d779 with SMTP id
 p21-20020a170903249500b0015aa0f7d779mr8269942plw.163.1651929483950; 
 Sat, 07 May 2022 06:18:03 -0700 (PDT)
Received: from [192.168.138.233] (50-233-235-3-static.hfc.comcastbusiness.net.
 [50.233.235.3]) by smtp.gmail.com with ESMTPSA id
 b7-20020aa79507000000b0050dc7628163sm5240038pfp.61.2022.05.07.06.18.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 May 2022 06:18:03 -0700 (PDT)
Message-ID: <3ff848fc-0e6a-b31d-a3fe-4306367cc559@linaro.org>
Date: Sat, 7 May 2022 08:17:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL v5 00/25] Misc patches for 2022-04-29
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220507055059.125324-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220507055059.125324-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

On 5/7/22 00:50, Paolo Bonzini wrote:
> The following changes since commit 13220a46e27ef95159651acd5e408b6aac9dbf3e:
> 
>    Merge tag 'vfio-updates-20220506.1' of https://gitlab.com/alex.williamson/qemu into staging (2022-05-06 16:18:14 -0500)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/bonzini/qemu.git tags/for-upstream
> 
> for you to fetch changes up to 6033b9ecd4f6a26b78f44a94813e1e464f5b0549:
> 
>    pc: remove -soundhw pcspk (2022-05-07 07:46:59 +0200)
> 
> ----------------------------------------------------------------
> * WHPX support for xcr0
> * qga-wss fixes
> * Meson conversions
> * Removed -soundhw pcspk
> 


Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


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
>   Kconfig.host                                    |   3 -
>   backends/meson.build                            |   8 +-
>   configure                                       | 673 ++----------------------
>   docs/meson.build                                |   2 +-
>   hw/audio/pcspk.c                                |  10 -
>   hw/audio/soundhw.c                              |  27 +-
>   hw/net/meson.build                              |   8 +-
>   hw/scsi/Kconfig                                 |   5 +
>   hw/virtio/Kconfig                               |  18 +-
>   hw/virtio/meson.build                           |  34 +-
>   include/hw/audio/soundhw.h                      |   3 -
>   include/hw/virtio/virtio-scsi.h                 |   2 -
>   meson.build                                     | 256 ++++++---
>   meson_options.txt                               |  28 +-
>   net/meson.build                                 |  12 +-
>   qga/vss-win32/meson.build                       |   4 +-
>   scripts/ci/org.centos/stream/8/x86_64/configure |   3 -
>   scripts/meson-buildoptions.py                   |  86 ++-
>   scripts/meson-buildoptions.sh                   |  74 ++-
>   scripts/qemu-stamp.py                           |  24 +
>   scripts/xen-detect.c                            | 203 +++++++
>   target/i386/whpx/whpx-all.c                     |  87 +++
>   target/i386/whpx/whpx-internal.h                |   3 +
>   tests/meson.build                               |   2 +-
>   tests/qtest/meson.build                         |   4 +-
>   tools/meson.build                               |   2 +-
>   26 files changed, 776 insertions(+), 805 deletions(-)
>   create mode 100644 scripts/qemu-stamp.py
>   create mode 100644 scripts/xen-detect.c


