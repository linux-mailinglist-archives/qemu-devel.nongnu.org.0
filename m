Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8844F4857F2
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 19:07:49 +0100 (CET)
Received: from localhost ([::1]:49860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5AhQ-0000IT-4L
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 13:07:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5Afb-0007TL-Rs
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 13:05:55 -0500
Received: from [2607:f8b0:4864:20::102e] (port=37659
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5Afa-0002IL-6P
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 13:05:55 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 y16-20020a17090a6c9000b001b13ffaa625so5173104pjj.2
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 10:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Ksf9tRslybycsEH7gzIh8BFJHTxn24C1Wmj+Ncp1Sr4=;
 b=gm//C++1iwwKIe5CkaGs2W1/sej4Hp4CZIRiI6NRB0henOy/BvtEN02Lf5zERhHAAT
 6OEEFJklYnCeZJJBnS15MlMY8MNGMfAMHpWQdEX4nkN/oqv4vwapy+0OlicK+cQLtG7Z
 Xj9bnX3X6FQUgKDZiOSGKxN57/ftRg3s2SYjg1loYBifDgtQxC0GFcOMgIsrw21eEMof
 vO8vwkMBQwOInrRFC3r5BUH2HyPcsSGmFZ0vq6xr79aIBX5ZZmufdJdSJtUQ9+s1EuhQ
 6WsQSEB/t/q+ENy3iLNFTcfpeZoBktJ7YECdLke4JzfKkDxD0/v9H7oF11npXNXQslep
 R6Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ksf9tRslybycsEH7gzIh8BFJHTxn24C1Wmj+Ncp1Sr4=;
 b=HRb2g2ya/wrpj3C9drPmNkB5ufRidDMEQ1jazkav2INcDVvKNflHyAKp9H4iL/Nfgf
 Owq95OByQqjMnrhjMBZHBBs2h4XZ59wj4wpqrnb4YUXqIN6v1b352XvfYQiH0fncKP8I
 iVagsogiPQLnZEPEME43vOjsiDuW6vi6SdSoiqwApM0mwpQzd84jpATuloa163rMB+PO
 S9A/cbZ54xh0wCRes3aZCHiiF0JjZ8APaFpasWOXWtMBtRcTcPWv3oycuZoqb5OGwTt9
 StPbxlBFrDibrSNXM5zqx9eDeVNF16X00QulCc9ujG71QflLhJqrTbhvzf0GxIf3KA9I
 Mf4Q==
X-Gm-Message-State: AOAM532C8WuFnUyR8h/QXmSVkAL4Q6/XTUFaWaX0IZcmpmno0enH87am
 ApvvxXLZr5fE4WRLwblMPKlhAsZrAOBvUQ==
X-Google-Smtp-Source: ABdhPJykERnqXu06OOl/zs3i282CcvE/tAgISZA5qNfJqwPWNEd0UL2gw9ET5Ri8fu+mzM6hrf6bRQ==
X-Received: by 2002:a17:902:7849:b0:149:eb60:17b6 with SMTP id
 e9-20020a170902784900b00149eb6017b6mr385860pln.89.1641405952136; 
 Wed, 05 Jan 2022 10:05:52 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id h3sm3380988pjk.48.2022.01.05.10.05.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jan 2022 10:05:51 -0800 (PST)
Subject: Re: [PULL 0/8] Misc patches (tests, docs, compat machines)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20220105123612.432038-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <109f0ae1-3fea-f28a-1de3-cac80ec0a89b@linaro.org>
Date: Wed, 5 Jan 2022 10:05:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220105123612.432038-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.057,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/5/22 4:36 AM, Thomas Huth wrote:
>   Hi!
> 
> The following changes since commit fb084237a3b78b20fd9d888dffd673b6656ea3be:
> 
>    common-user: Really fix i386 calls to safe_syscall_set_errno_tail (2022-01-04 21:14:23 -0800)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/thuth/qemu.git tags/pull-request-2022-01-05
> 
> for you to fetch changes up to 057dc9a635fe37118a98b32e8bd9d8ed47b1a102:
> 
>    docs/tools/qemu-trace-stap.rst: Do not hard-code the QEMU binary name (2022-01-05 11:10:13 +0100)
> 
> ----------------------------------------------------------------
> * Add compat machines for 7.0
> * Some minor qtest and unit test improvements
> * Remove -no-quit option
> * Fixes for the docs
> 
> ----------------------------------------------------------------
> Cornelia Huck (1):
>        hw: Add compat machines for 7.0
> 
> Marc-André Lureau (1):
>        docs/sphinx: fix compatibility with sphinx < 1.8
> 
> Philippe Mathieu-Daudé (1):
>        tests/unit/test-util-sockets: Use g_file_open_tmp() to create temp file
> 
> Thomas Huth (5):
>        tests/qtest/test-x86-cpuid-compat: Check for machines before using them
>        tests/qtest/hd-geo-test: Check for the lsi53c895a controller before using it
>        qemu-options: Remove the deprecated -no-quit option
>        gitlab-ci: Enable docs in the centos job
>        docs/tools/qemu-trace-stap.rst: Do not hard-code the QEMU binary name
> 
>   .gitlab-ci.d/buildtest.yml          |  2 +-
>   docs/about/deprecated.rst           |  6 ---
>   docs/about/removed-features.rst     |  7 +++
>   docs/sphinx/fakedbusdoc.py          |  4 +-
>   docs/tools/qemu-trace-stap.rst      | 24 +++++------
>   hw/arm/virt.c                       |  9 +++-
>   hw/core/machine.c                   |  3 ++
>   hw/i386/pc.c                        |  3 ++
>   hw/i386/pc_piix.c                   | 14 +++++-
>   hw/i386/pc_q35.c                    | 13 +++++-
>   hw/ppc/spapr.c                      | 15 ++++++-
>   hw/s390x/s390-virtio-ccw.c          | 14 +++++-
>   include/hw/boards.h                 |  3 ++
>   include/hw/i386/pc.h                |  3 ++
>   qemu-options.hx                     |  8 ----
>   softmmu/vl.c                        |  8 +---
>   tests/qtest/hd-geo-test.c           |  8 ++--
>   tests/qtest/test-x86-cpuid-compat.c | 85 +++++++++++++++++++++----------------
>   tests/unit/test-util-sockets.c      |  6 ++-
>   19 files changed, 151 insertions(+), 84 deletions(-)

Applied, thanks.

r~

