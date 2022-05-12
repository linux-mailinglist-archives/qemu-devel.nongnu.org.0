Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A89525332
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 19:06:35 +0200 (CEST)
Received: from localhost ([::1]:45722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npCGn-0005ZA-Ij
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 13:06:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1npCCj-0003uO-Hd
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:02:21 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:33528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1npCCh-0000tu-M9
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:02:21 -0400
Received: by mail-pl1-x62b.google.com with SMTP id d17so5532797plg.0
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 10:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Awaov/V2fhYk5KJKUcvWosEcrDcAm90pMwNYCI3OWSE=;
 b=STLHMeQfAdbvMRpktfR+dyo33NVXEqOu+v2Bd3nhPIrLWPE4oGCcEA8xx4JGUFVdOp
 Uf3Syo94sAlkyywOqwn4g4gin79UKQNM9JP1m4E3TphTBwhP79Au68c3NHPlJxkG+X/q
 aC+X70wqVthq1sBEFgi1Bw6YLd2Dtx0Z84rKcrNC1ItEUWmh8MnSkTyQdDrR2SKQR6aX
 2d2L0a6lf0laG2BMcsSCaZmca7GpSBo7zcUiV7lPb989x6r21kuB80vDa10lXPSf9vM5
 kIG6ygmu5bEam/MHq82l4poFKaAKEk+TqQDVmPu72tK6pHFjjjgyveqce2mr5WgTS2lz
 GnMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Awaov/V2fhYk5KJKUcvWosEcrDcAm90pMwNYCI3OWSE=;
 b=JNNwoVLtRDbl3ycLCNILRPzFYnMGv4T5hFkfchb226trZ7TVvF8C2e/hC4TvB2OBvE
 G9+iYZ8w6RBqw2WNU+YlD+e4bIBin1A+bN3eVJ/8QMD6IVE+n3651O7nlmhLa6paaIGu
 xqvyYmUG69IbZDfRMsM58pMndwQ4jtHihHJG8u9356qkrhpHr99Slwor5jWwZtikigsx
 wpD/Wpzp6k++A6xaFGegRAtbCnCDx+jZXUqCe0WxV+P5UNSkStCWjAhJ8rTDiryUK1RV
 xCAdaPqJb7LIMyZY4XBfNKh96rbfe/8/8nmby2W0W0bDSjSi0OFHrhvhbh0N142+TR0Q
 oamA==
X-Gm-Message-State: AOAM532b+wlEAPKJi/JSCUByjjQDwuJzYYdEGIpXXV/yM0xs4zIoznDa
 jI3VXpzsSmzpeIqXzK6HmQ+Oxw==
X-Google-Smtp-Source: ABdhPJwvhoRxpDAYzbOLwocbhP3Skg4klH8v+KjrLHZLkMNaPjAq+kiqMVxdofHyAypFewrwhKHlRQ==
X-Received: by 2002:a17:902:6902:b0:15e:a439:82b6 with SMTP id
 j2-20020a170902690200b0015ea43982b6mr508112plk.76.1652374938163; 
 Thu, 12 May 2022 10:02:18 -0700 (PDT)
Received: from ?IPV6:2607:fb90:2827:e3d7:b6c9:cd59:fac5:b31a?
 ([2607:fb90:2827:e3d7:b6c9:cd59:fac5:b31a])
 by smtp.gmail.com with ESMTPSA id
 g11-20020a62f94b000000b0050dc7628153sm88571pfm.45.2022.05.12.10.02.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 10:02:17 -0700 (PDT)
Message-ID: <99bcb5bd-8ab8-564e-9944-f9fa3448ce6e@linaro.org>
Date: Thu, 12 May 2022 10:02:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 00/10] Block layer patches
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20220512153401.202863-1-kwolf@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220512153401.202863-1-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

On 5/12/22 08:33, Kevin Wolf wrote:
> The following changes since commit ec11dc41eec5142b4776db1296972c6323ba5847:
> 
>    Merge tag 'pull-misc-2022-05-11' of git://repo.or.cz/qemu/armbru into staging (2022-05-11 09:00:26 -0700)
> 
> are available in the Git repository at:
> 
>    git://repo.or.cz/qemu/kevin.git tags/for-upstream
> 
> for you to fetch changes up to f70625299ecc9ba577c87f3d1d75012c747c7d88:
> 
>    qemu-iotests: inline common.config into common.rc (2022-05-12 15:42:49 +0200)
> 
> ----------------------------------------------------------------
> Block layer patches
> 
> - coroutine: Fix crashes due to too large pool batch size
> - fdc: Prevent end-of-track overrun
> - nbd: MULTI_CONN for shared writable exports
> - iotests test runner improvements

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Daniel P. Berrangé (2):
>        tests/qemu-iotests: print intent to run a test in TAP mode
>        .gitlab-ci.d: export meson testlog.txt as an artifact
> 
> Eric Blake (2):
>        qemu-nbd: Pass max connections to blockdev layer
>        nbd/server: Allow MULTI_CONN for shared writable exports
> 
> Hanna Reitz (1):
>        iotests/testrunner: Flush after run_test()
> 
> Kevin Wolf (2):
>        coroutine: Rename qemu_coroutine_inc/dec_pool_size()
>        coroutine: Revert to constant batch size
> 
> Paolo Bonzini (1):
>        qemu-iotests: inline common.config into common.rc
> 
> Philippe Mathieu-Daudé (2):
>        hw/block/fdc: Prevent end-of-track overrun (CVE-2021-3507)
>        tests/qtest/fdc-test: Add a regression test for CVE-2021-3507
> 
>   qapi/block-export.json                           |   8 +-
>   docs/interop/nbd.txt                             |   1 +
>   docs/tools/qemu-nbd.rst                          |   3 +-
>   include/block/nbd.h                              |   5 +-
>   include/qemu/coroutine.h                         |   6 +-
>   blockdev-nbd.c                                   |  13 +-
>   hw/block/fdc.c                                   |   8 ++
>   hw/block/virtio-blk.c                            |   6 +-
>   nbd/server.c                                     |  10 +-
>   qemu-nbd.c                                       |   2 +-
>   tests/qtest/fdc-test.c                           |  21 ++++
>   util/qemu-coroutine.c                            |  26 ++--
>   tests/qemu-iotests/testrunner.py                 |   4 +
>   .gitlab-ci.d/buildtest-template.yml              |  12 +-
>   MAINTAINERS                                      |   1 +
>   tests/qemu-iotests/common.config                 |  41 -------
>   tests/qemu-iotests/common.rc                     |  31 +++--
>   tests/qemu-iotests/tests/nbd-multiconn           | 145 +++++++++++++++++++++++
>   tests/qemu-iotests/tests/nbd-multiconn.out       |   5 +
>   tests/qemu-iotests/tests/nbd-qemu-allocation.out |   2 +-
>   20 files changed, 261 insertions(+), 89 deletions(-)
>   delete mode 100644 tests/qemu-iotests/common.config
>   create mode 100755 tests/qemu-iotests/tests/nbd-multiconn
>   create mode 100644 tests/qemu-iotests/tests/nbd-multiconn.out
> 
> 


