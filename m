Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C659B51C3BA
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 17:20:35 +0200 (CEST)
Received: from localhost ([::1]:39216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmdHO-0006CY-7W
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 11:20:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmdET-0005DD-Dx
 for qemu-devel@nongnu.org; Thu, 05 May 2022 11:17:33 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c]:37447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmdER-0007sz-Em
 for qemu-devel@nongnu.org; Thu, 05 May 2022 11:17:32 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-ed8a3962f8so4500984fac.4
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 08:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=YT/iNx/MD4Q2Za1vOwPbnWvdjbwBChUmeLzriW2TuSk=;
 b=OAPlNvTnfq1ceUMPlLnUpnfTOpWcF8mYdOnejSQUAmSDndJvciFeliG2vVR9eJJa3o
 yPWoG/UrVf4HFbtwyRsudKpG+SuQkA0pLFUG4MybFmjPJHuF6Brx3dlDZx5+7w02srPl
 PzG7LVPNKFm4d3WPDUpn3u24d8QwMulZWa3abhxlHoqOljDxIFtVcG+yODVluCF9n994
 9pDZww2zviEOpPvkpgjLnd/vnv7If3RnnE3TA6HBVZZl605acHQhL83R5cpqVJejRgDr
 R0tja0RKUvO6fpDON6mVrzG0Ck5rs9K0Ap/37DK58festK346scGqDEwpX9WoY50L8y2
 X+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YT/iNx/MD4Q2Za1vOwPbnWvdjbwBChUmeLzriW2TuSk=;
 b=HAPSD8L1p4VDopOZsihGpZ1jaj6RR7fa5n4n7O95BEspOXtyO0b4ZZjAWML9UCdcTU
 VLApcXboleHMMXI2WBPczPIerV193r9MbYWK7BHisazxwxW0YvthVSkRAEbIyjjV/QLd
 IasQU+9nVxaUK8v1Ot5yeSqPGHYRnKWWbRrSTzK/+hGg++naCP+NoNl3Wj1/rp/PK92J
 SYphJrGLrM/dcvTkDG8UNhBlu55u3c0HqjfhlHOnIzTsPUt3Fskg2h3jSdwJDvxosJK9
 C1GJIT3Yi5XCyYCFOjgE2oYF0mnTWt87Hzm73+rRG3WyLB21c6z66zLKf9XSgJDww6bc
 hPiw==
X-Gm-Message-State: AOAM531Hh1htnARWUvc339BoW2jjHxqA4oNVP2JE6Y8gi8jnwUmir4hg
 L4VLL43sRwUg1m91TvjJY+sbzg==
X-Google-Smtp-Source: ABdhPJwBhCQuyItAK3ldBTNppGK3B8jwQiXo/htt7phAk8CkQzyC0l3xSO92EuEYalp5FvRDkrcoeQ==
X-Received: by 2002:a05:6870:120a:b0:e5:ea09:dfed with SMTP id
 10-20020a056870120a00b000e5ea09dfedmr2519280oan.160.1651763848259; 
 Thu, 05 May 2022 08:17:28 -0700 (PDT)
Received: from [172.0.0.47] (c-98-200-150-82.hsd1.tx.comcast.net.
 [98.200.150.82]) by smtp.gmail.com with ESMTPSA id
 el19-20020a056870f69300b000e686d1388csm601906oab.38.2022.05.05.08.17.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 08:17:27 -0700 (PDT)
Message-ID: <8fd8cf3b-08f5-3666-edac-2dec322e88b0@linaro.org>
Date: Thu, 5 May 2022 10:17:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL v4 00/25] Misc patches for 2022-04-29
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220504210615.680072-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504210615.680072-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2c.google.com
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

On 5/4/22 16:06, Paolo Bonzini wrote:
> The following changes since commit f5643914a9e8f79c606a76e6a9d7ea82a3fc3e65:
> 
>    Merge tag 'pull-9p-20220501' of https://github.com/cschoenebeck/qemu into staging (2022-05-01 07:48:11 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/bonzini/qemu.git tags/for-upstream
> 
> for you to fetch changes up to ec7bd939178789b371df86276ba1d983f2de07ce:
> 
>    pc: remove -soundhw pcspk (2022-05-01 23:06:15 +0200)
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

New errors today:

In file included from 
/home/gitlab-runner/builds/Jpwtyaz7/0/qemu-project/qemu/include/qemu/osdep.h:30,
                  from ../block.c:26:
../block.c: In function ‘bdrv_format_is_whitelisted’:
./config-host.h:44:163: error: called object is not a function or function pointer
  #define CONFIG_BDRV_RW_WHITELIST "qcow2", "raw", "file", "host_device", "nbd", "iscsi", 
"rbd", "blkdebug", "luks", "null-co", "nvme", "copy-on-read", "throttle", "gluster"
 
                                                                           ^~~~~~~~~
../block.c:478:9: note: in expansion of macro ‘CONFIG_BDRV_RW_WHITELIST’
          CONFIG_BDRV_RW_WHITELIST
          ^~~~~~~~~~~~~~~~~~~~~~~~
In file included from 
/home/gitlab-runner/builds/Jpwtyaz7/0/qemu-project/qemu/include/qemu/osdep.h:30,
                  from ../block.c:26:
./config-host.h:42:66: error: called object is not a function or function pointer
  #define CONFIG_BDRV_RO_WHITELIST "vmdk", "vhdx", "vpc", "https", "ssh"
                                                                   ^~~~~
../block.c:482:9: note: in expansion of macro ‘CONFIG_BDRV_RO_WHITELIST’
          CONFIG_BDRV_RO_WHITELIST
          ^~~~~~~~~~~~~~~~~~~~~~~~

https://gitlab.com/qemu-project/qemu/-/jobs/2418086124


r~

