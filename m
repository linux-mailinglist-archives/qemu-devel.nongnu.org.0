Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E71454E6CA
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 18:18:02 +0200 (CEST)
Received: from localhost ([::1]:43734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1sC1-0000sl-He
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 12:18:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o1s8O-00074g-2i
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 12:14:16 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:39907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o1s8L-0001Jc-VH
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 12:14:15 -0400
Received: by mail-pg1-x535.google.com with SMTP id q140so1669850pgq.6
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 09:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=M73+V1fWZDwdGBq6vktqKh70KdQSgYeH42DWREkAboU=;
 b=F0DEVZMD+8dR0dEL94DL+OCqMn1LQmhdEuFS8pA5sqgHmagQw11RXS3/U77kYZnLQ+
 XnyVE4iEDGuoKPl+GP2+GjRPRxpfc4+29X6pnyHUs5GfGEhYbH/isR354QIwgDeXbgk7
 ydvaFGJIAyfOzM1na7Vw6vc3HpjPgz172kZdmAbkkC5cs4yznWiAYcElypkrYJJ1rh8/
 NChjGchmdquLP1rNBmv0QZRSsazfArxuiTox0Y0QsMbRyaCcobfN7kh6Rgin9F0FiJf/
 12TNoUoOhQKSxjZEnh6KVKrjb+282+7EBp2y1iR+l0VJVr1QE0UCEcDCq6xcD4xKH/Mm
 oVJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=M73+V1fWZDwdGBq6vktqKh70KdQSgYeH42DWREkAboU=;
 b=e5UwKfOzHsp0n9gYkqQ7jUhikpDuSzZYp7s1evgq98t8smcAayMJWj3gjpH+nAtU2p
 hlXhlhBSV+KH2OqbDSGR+gbY4gCEKorujM2/DjTQgnUtZP+Rox2Ed63V58gAHS7eX05/
 ASZ1NfJtKfAbSTSj0AXCQANxti6+Fs+la0vWMVLzznGWDJ/wZCAc9Roi366mhSQsLv13
 g+tg+Z0MTfZyKYbEwDlE3TnecQIJ0VGv0BQsgXQHV1QK9IjJKFi45TjYePHLL+UGpxYy
 Bod1ylTglusIiEMQrPIlWptTXhzMdttEa75GCSERnHTJZ230h7ofZSsXTG12QQCK2LCP
 FYSA==
X-Gm-Message-State: AJIora9ybRBvuMVXZgCN/sCptCj81eTbZFG54npfb1XfLdZm98pUaiwM
 lJ6YuozbV5sULeNRkwEuJj3l+A==
X-Google-Smtp-Source: AGRyM1uViHzX+5V4/gYi2e8KxdObCGIK7ZdCOx+GfzEy77LdsYBGipisjL6spe8Tfa1jSdoWhxN67Q==
X-Received: by 2002:a65:6b95:0:b0:408:9d1b:2e56 with SMTP id
 d21-20020a656b95000000b004089d1b2e56mr5132738pgw.381.1655396051892; 
 Thu, 16 Jun 2022 09:14:11 -0700 (PDT)
Received: from [172.22.33.109] ([192.77.111.2])
 by smtp.gmail.com with ESMTPSA id
 x13-20020a17090300cd00b00161455d8029sm1837747plc.12.2022.06.16.09.14.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jun 2022 09:14:11 -0700 (PDT)
Message-ID: <fe18ed57-2051-ccca-8ad8-b016d784e2be@linaro.org>
Date: Thu, 16 Jun 2022 09:14:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 00/21] Statistics, preconfig and cleanup patches for
 2022-06-16
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220616083209.117397-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220616083209.117397-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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

On 6/16/22 01:31, Paolo Bonzini wrote:
> The following changes since commit debd0753663bc89c86f5462a53268f2e3f680f60:
> 
>    Merge tag 'pull-testing-next-140622-1' of https://github.com/stsquad/qemu into staging (2022-06-13 21:10:57 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/bonzini/qemu.git tags/for-upstream
> 
> for you to fetch changes up to 76ca98b0f85222601bd449252ac71df19e0dab29:
> 
>    build: include pc-bios/ part in the ROMS variable (2022-06-15 11:12:32 +0200)
> 
> ----------------------------------------------------------------
> * statistics subsystem
> * virtio reset cleanups
> * build system cleanups
> * fix Cirrus CI

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Alexander Bulekov (1):
>        build: fix check for -fsanitize-coverage-allowlist
> 
> Mark Kanda (3):
>        qmp: Support for querying stats
>        kvm: Support for querying fd-based stats
>        hmp: add basic "info stats" implementation
> 
> Paolo Bonzini (16):
>        qmp: add filtering of statistics by target vCPU
>        cutils: add functions for IEC and SI prefixes
>        qmp: add filtering of statistics by provider
>        hmp: add filtering of statistics by provider
>        qmp: add filtering of statistics by name
>        hmp: add filtering of statistics by name
>        block: add more commands to preconfig mode
>        s390x: simplify virtio_ccw_reset_virtio
>        virtio-mmio: stop ioeventfd on legacy reset
>        virtio: stop ioeventfd on reset
>        virtio-mmio: cleanup reset
>        configure: update list of preserved environment variables
>        configure: cleanup -fno-pie detection
>        tests/vm: allow running tests in an unconfigured source tree
>        meson: put cross compiler info in a separate section
>        build: include pc-bios/ part in the ROMS variable
> 
> Zhenzhong Duan (1):
>        q35：Enable TSEG only when G_SMRAME and TSEG_EN both enabled
> 
>   Makefile                  |  12 +-
>   accel/kvm/kvm-all.c       | 403 ++++++++++++++++++++++++++++++++++++++++++++++
>   configure                 |  22 +--
>   hmp-commands-info.hx      |  14 ++
>   hmp-commands.hx           |  14 ++
>   hw/pci-host/q35.c         |   3 +-
>   hw/s390x/virtio-ccw.c     |  12 +-
>   hw/virtio/virtio-bus.c    |   1 +
>   hw/virtio/virtio-mmio.c   |  18 +--
>   hw/virtio/virtio-pci.c    |   1 -
>   include/monitor/hmp.h     |   1 +
>   include/monitor/stats.h   |  45 ++++++
>   include/qemu/cutils.h     |  18 +++
>   meson.build               |  25 +--
>   monitor/hmp-cmds.c        | 232 ++++++++++++++++++++++++++
>   monitor/qmp-cmds.c        | 155 ++++++++++++++++++
>   qapi/block-core.json      | 117 +++++++++-----
>   qapi/block-export.json    |  21 ++-
>   qapi/block.json           |   6 +-
>   qapi/meson.build          |   1 +
>   qapi/qapi-schema.json     |   1 +
>   qapi/stats.json           | 249 ++++++++++++++++++++++++++++
>   tests/unit/test-cutils.c  |  52 ++++++
>   tests/vm/Makefile.include |  26 +--
>   util/cutils.c             |  34 ++--
>   25 files changed, 1368 insertions(+), 115 deletions(-)
>   create mode 100644 include/monitor/stats.h
>   create mode 100644 qapi/stats.json


