Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B523B5870CE
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 21:03:42 +0200 (CEST)
Received: from localhost ([::1]:49886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIahZ-0007q3-BK
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 15:03:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oIadm-0005FQ-WD
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 14:59:47 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:40877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oIadk-0007vg-90
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 14:59:46 -0400
Received: by mail-pl1-x633.google.com with SMTP id x23so2666358pll.7
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 11:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=GN0fZiqOblR680Y8B0qTIwb+IX3mw/bC0Phf/bc9zEg=;
 b=J/dtdNFUEteclNorJBbUs1+gGoNn1CqKIuLun34MDFurOmHC/oHn7/c1e4iEBj+5u7
 QAe1Z+r85BTNFiNax6jBzE1/Mon6+2nWhuqzd06qwjbL2fQ8yusliomaHh3SvCLEghjU
 H1z7c7XxVskKV4QIaKRZXJT3X7qiyma0lnkeelIH9def+T/FoD1y0vpr+ai5M/BP+TrW
 /alB7qv9A4VhfBUyEyp2WTLER4O6tkKCok96XC7fPNeuTIEmfpsBUcCfF65yuWcJRHbr
 woybkdBxBzI5onaIc5KRYN3M9C8jaFrNn1md2D+/gnT1va9/xANSz+ss6KmflWhAi+9m
 2Wnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GN0fZiqOblR680Y8B0qTIwb+IX3mw/bC0Phf/bc9zEg=;
 b=ZnRLR1w3p6sQHGCtU1lp/A8gnf2g8FsxNLwxi17j3wFA0vsgCVT4PF4uK+AzJC/W0i
 7GOJvaj2H/85zyHcclKPTdjnlZJ4obnkyAHZFTniKBtuG1OQSJsXzrqpmw6neLNhbbKW
 8j89+hpkMLZG4DiKpy3Q3no+EsmcNhLkRUpIhNxOagaQjgU4LXBStk0ekIzujB3OgmPM
 ICU2kAh5cT8GAH8ujK3mkkEa9O7EG+fih7qMqVFj713QEsYpiqnMj5usGq+fyBrjSnrS
 M94unmYzI5Xc7XatWqIV/9UQqUpMhSWMqebdUSDsdSgvZk/aEMiYglU6oVSTrOATGE/6
 PyWA==
X-Gm-Message-State: ACgBeo20xCZNOl2d3i9WU0A70E7BPEL96cGrxg0TdySAp0jW1o0UK/fD
 Ji29DGktIV8QrpiEHJho51QJTw==
X-Google-Smtp-Source: AA6agR4QY+A3FRsa5yaZrvl0xI15NJmxBqJ8L0TXqm9mxlKEtUN8F4vkd/9K3wtUGTNeaWMZo1EaSw==
X-Received: by 2002:a17:90b:3805:b0:1f4:ebfe:558b with SMTP id
 mq5-20020a17090b380500b001f4ebfe558bmr10389807pjb.48.1659380378713; 
 Mon, 01 Aug 2022 11:59:38 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:e82c:8cfb:9ffa:3c7c?
 ([2602:ae:1549:801:e82c:8cfb:9ffa:3c7c])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a170903235000b0016c28a68ad0sm3884414plh.253.2022.08.01.11.59.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Aug 2022 11:59:38 -0700 (PDT)
Message-ID: <b2bad252-bb05-69ae-2ba0-73e258eb19f8@linaro.org>
Date: Mon, 1 Aug 2022 11:59:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 0/7] Testing and wording fixes
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 berrange@redhat.com
References: <20220801155506.254316-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220801155506.254316-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

On 8/1/22 08:54, Thomas Huth wrote:
>   Hi!
> 
> The following changes since commit 3916603e0c1d909e14e09d5ebcbdaa9c9e21adf3:
> 
>    Merge tag 'pull-la-20220729' of https://gitlab.com/rth7680/qemu into staging (2022-07-29 17:39:17 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/thuth/qemu.git tags/pull-request-2022-08-01
> 
> for you to fetch changes up to 1bca64a3f0490861c03ceb849821ebf42c926f82:
> 
>    tests/qtest/migration-test: Run the dirty ring tests only with the x86 target (2022-08-01 16:30:18 +0200)
> 
> ----------------------------------------------------------------
> - Some fixes for various tests
> - Improve wordings in some files

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Daniel P. Berrangé (1):
>    misc: fix commonly doubled up words
> 
> Ilya Leoshkevich (1):
>    tests/tcg/linux-test: Fix random hangs in test_socket
> 
> Peter Xu (2):
>    migration-test: Use migrate_ensure_converge() for auto-converge
>    migration-test: Allow test to run without uffd
> 
> Thomas Huth (3):
>    tests/unit/test-qga: Replace the word 'blacklist' in the guest agent
>      unit test
>    trivial: Fix duplicated words
>    tests/qtest/migration-test: Run the dirty ring tests only with the x86
>      target
> 
>   docs/devel/qom.rst                            |  4 +-
>   docs/interop/live-block-operations.rst        |  4 +-
>   docs/system/arm/cpu-features.rst              |  2 +-
>   docs/system/devices/cxl.rst                   |  2 +-
>   docs/system/s390x/bootdevices.rst             |  2 +-
>   docs/system/tls.rst                           |  2 +-
>   docs/tools/qemu-pr-helper.rst                 |  4 +-
>   hw/usb/u2f.h                                  |  2 +-
>   include/hw/qdev-core.h                        |  2 +-
>   include/user/safe-syscall.h                   |  2 +-
>   block/linux-aio.c                             |  2 +-
>   block/qcow2-bitmap.c                          |  8 +-
>   contrib/plugins/cache.c                       |  2 +-
>   hw/arm/omap2.c                                |  2 +-
>   hw/core/clock.c                               |  2 +-
>   hw/intc/arm_gicv3_redist.c                    |  2 +-
>   hw/misc/iotkit-secctl.c                       |  2 +-
>   hw/misc/iotkit-sysctl.c                       |  4 +-
>   hw/misc/mac_via.c                             |  2 +-
>   hw/s390x/s390-ccw.c                           |  2 +-
>   linux-user/i386/cpu_loop.c                    |  2 +-
>   pc-bios/s390-ccw/virtio-scsi.c                |  2 +-
>   target/arm/helper.c                           |  2 +-
>   target/arm/translate.c                        |  2 +-
>   target/i386/cpu.c                             |  2 +-
>   tests/qtest/microbit-test.c                   |  6 +-
>   tests/qtest/migration-test.c                  | 74 ++++++++-----------
>   tests/tcg/multiarch/linux/linux-test.c        |  2 +-
>   tests/unit/test-qga.c                         |  6 +-
>   tools/virtiofsd/fuse_virtio.c                 |  2 +-
>   ui/vdagent.c                                  |  2 +-
>   tcg/i386/tcg-target.c.inc                     |  2 +-
>   python/Makefile                               |  2 +-
>   python/qemu/utils/__init__.py                 |  2 +-
>   tests/docker/dockerfiles/debian-native.docker |  2 +-
>   35 files changed, 76 insertions(+), 88 deletions(-)
> 


