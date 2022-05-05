Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C29FE51C052
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 15:13:11 +0200 (CEST)
Received: from localhost ([::1]:42394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmbI6-0007Fb-BO
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 09:13:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmbEz-0005Lp-E0
 for qemu-devel@nongnu.org; Thu, 05 May 2022 09:09:59 -0400
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d]:45862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmbEx-0006rg-BO
 for qemu-devel@nongnu.org; Thu, 05 May 2022 09:09:57 -0400
Received: by mail-oo1-xc2d.google.com with SMTP id
 c19-20020a4a3813000000b0035ea4a3b97eso704013ooa.12
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 06:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=XdRiCBsAVW9moj8hbtAuFEz+LOmheV9LHKC4aGdJ7jo=;
 b=bbkPOJ9Tfg6iFNmBsgnuEJuZLH5OLSVnvMJNiiwYs9LJB2iKAWguKh3eQHNnzVEF5B
 76nktxV40J1w6h/Q4VBMfZvEe61P8QzmHZcaQQKU0PeW/cKl+WKoEVq+6Y9wKyaOnLfb
 jBldlrnhM2dFoQ0LhsPVxcvwSHeSyYj9iA95HRwHls0561hfxNaE10Y8DWlfef9GSsNO
 SSfNTSDlWYx/mx0xepI4UGtK7HObs1T++xiPFpAjpDiIAc1yDU55mEDpm7b2s/jI7VQB
 GPvu1M08TP+PWFIKizt1GkMmlQlFcHBsirXcWdshDXUELmzLsDh/PHo/kPLycN6nDenV
 BLOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XdRiCBsAVW9moj8hbtAuFEz+LOmheV9LHKC4aGdJ7jo=;
 b=5LfHrr7vQvdfDsyAVxMZ8o55dIwS+0SEsUg17/dhZ9zkxzoQTRNTNeEgc4SiDbFouy
 58R+c/RW4f2eYEzuQ8LPnYS9EoEUHXv8K+mMfIP4CTFrBKIiRrsYGo2aW9g9b2Y+qHTA
 r5LAaRcR0WHmSGOtzU9XrdDE9+ccumoQP8QJ+7VoaiLdul5b+qUhzewICFG2nb2fzW85
 85JMLlOZkkN5zxaG0ENJhWZIHoXRikBFTwmv8gTdkQdnIndOacPQNX3L+gASfTghRi2f
 CH5/OFTrUMjm5hHJoA877trIj6jIGp3365B6meRNaNj97uAauP9Rln/3w47iVUcfbUds
 biNQ==
X-Gm-Message-State: AOAM532nwTucth5VlSvwSBvVFmVOOAq7sYVZMV7KzYlHGJ0YKAdv6O8z
 xVuSYeRfxdk03jygvl6aH6qEPw==
X-Google-Smtp-Source: ABdhPJxD4rmvqMK4RsSQCe3f8fuZ5d2denOMJVRIVWxYqJksTVHfOeTYKof4sONnWrj2mrxzwppJ2g==
X-Received: by 2002:a4a:41d2:0:b0:35e:9b72:4b01 with SMTP id
 x201-20020a4a41d2000000b0035e9b724b01mr9201886ooa.67.1651756193572; 
 Thu, 05 May 2022 06:09:53 -0700 (PDT)
Received: from [172.0.0.47] (c-98-200-150-82.hsd1.tx.comcast.net.
 [98.200.150.82]) by smtp.gmail.com with ESMTPSA id
 n20-20020a056870e41400b000e686d1388esm441540oag.40.2022.05.05.06.09.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 06:09:52 -0700 (PDT)
Message-ID: <4e47fa08-f149-a100-d662-29ba45d62baa@linaro.org>
Date: Thu, 5 May 2022 08:09:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 00/13] Block layer patches
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20220504142522.167506-1-kwolf@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504142522.167506-1-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 5/4/22 09:25, Kevin Wolf wrote:
> The following changes since commit 2e3408b3cc7de4e87a9adafc8c19bfce3abec947:
> 
>    Merge tag 'misc-pull-request' of gitlab.com:marcandre.lureau/qemu into staging (2022-05-03 09:13:17 -0700)
> 
> are available in the Git repository at:
> 
>    git://repo.or.cz/qemu/kevin.git tags/for-upstream
> 
> for you to fetch changes up to c1fe694357a328c807ae3cc6961c19e923448fcc:
> 
>    coroutine-win32: use QEMU_DEFINE_STATIC_CO_TLS() (2022-05-04 15:55:23 +0200)
> 
> ----------------------------------------------------------------
> Block layer patches
> 
> - Fix and re-enable GLOBAL_STATE_CODE assertions
> - vhost-user: Fixes for VHOST_USER_ADD/REM_MEM_REG
> - vmdk: Fix reopening bs->file
> - coroutine: use QEMU_DEFINE_STATIC_CO_TLS()
> - docs/qemu-img: Fix list of formats which implement check

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Denis V. Lunev (1):
>        qemu-img: properly list formats which have consistency check implemented
> 
> Hanna Reitz (6):
>        block: Classify bdrv_get_flags() as I/O function
>        qcow2: Do not reopen data_file in invalidate_cache
>        Revert "main-loop: Disable GLOBAL_STATE_CODE() assertions"
>        iotests: Add regression test for issue 945
>        block/vmdk: Fix reopening bs->file
>        iotests/reopen-file: Test reopening file child
> 
> Kevin Wolf (3):
>        docs/vhost-user: Clarifications for VHOST_USER_ADD/REM_MEM_REG
>        libvhost-user: Fix extra vu_add/rem_mem_reg reply
>        vhost-user: Don't pass file descriptor for VHOST_USER_REM_MEM_REG
> 
> Stefan Hajnoczi (3):
>        coroutine-ucontext: use QEMU_DEFINE_STATIC_CO_TLS()
>        coroutine: use QEMU_DEFINE_STATIC_CO_TLS()
>        coroutine-win32: use QEMU_DEFINE_STATIC_CO_TLS()
> 
>   docs/interop/vhost-user.rst                        |  17 ++++
>   docs/tools/qemu-img.rst                            |   4 +-
>   include/block/block-global-state.h                 |   1 -
>   include/block/block-io.h                           |   1 +
>   include/qemu/main-loop.h                           |   3 +-
>   block.c                                            |   2 +-
>   block/qcow2.c                                      | 104 ++++++++++++---------
>   block/vmdk.c                                       |  56 ++++++++++-
>   hw/virtio/vhost-user.c                             |   2 +-
>   subprojects/libvhost-user/libvhost-user.c          |  17 ++--
>   util/coroutine-ucontext.c                          |  38 +++++---
>   util/coroutine-win32.c                             |  18 +++-
>   util/qemu-coroutine.c                              |  41 ++++----
>   tests/qemu-iotests/tests/export-incoming-iothread  |  81 ++++++++++++++++
>   .../tests/export-incoming-iothread.out             |   5 +
>   tests/qemu-iotests/tests/reopen-file               |  89 ++++++++++++++++++
>   tests/qemu-iotests/tests/reopen-file.out           |   5 +
>   17 files changed, 388 insertions(+), 96 deletions(-)
>   create mode 100755 tests/qemu-iotests/tests/export-incoming-iothread
>   create mode 100644 tests/qemu-iotests/tests/export-incoming-iothread.out
>   create mode 100755 tests/qemu-iotests/tests/reopen-file
>   create mode 100644 tests/qemu-iotests/tests/reopen-file.out
> 
> 


