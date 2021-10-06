Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 639C6424235
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 18:08:37 +0200 (CEST)
Received: from localhost ([::1]:49360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY9T9-0001NH-VM
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 12:08:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mY9Au-0002ib-Qt
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:49:44 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:41849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mY9Ar-0003PF-VM
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:49:43 -0400
Received: by mail-pl1-x634.google.com with SMTP id x8so1915237plv.8
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 08:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YG1imy3G2FWFh8UjonAZVctTKww3Tatoe480K92Az5w=;
 b=TMuqVVvP15BE8XWvwt5B7tgc/Zq5tlCVPpR7kaPgxoZ20lr/wN037cp9uUzU844JEO
 rjj6+TZd60GplVGFyXVgCxR+r2PV1PSdgfadfANXV9qkj2hu1zPG9zRp0WzfNaszrh46
 DPELK407cZ4uhshwSPVjT58v/VjpnFVxFZAirSDZ5McHCh7XQonZo8ute4hro3zVh1nL
 MtyDbpILHY9xCUI3AerDzn2asK+btSBc5dokHUCWIkq/6GSp7kgjkDOAr5Evt00KdSl9
 NuJ/b6cZ8KuV3DmoFET/WQXheM94OcSTySn9tsi/VqcQsGUbvGb52Ktip5SQRW96CCLG
 FMOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YG1imy3G2FWFh8UjonAZVctTKww3Tatoe480K92Az5w=;
 b=f1seF15tmQQ2c1KJ+kE4AzbSjJwwIM7LeLc1CNo5CJ2eNzX59Xr+Y71HDHJn2/nrXt
 j69iK6San/LB9NkpsRozobpJXtxVWqq6YoN2xQ8CM8RVZgxHtS3MzmAbceoIB6OfI058
 I4RNPlsDEKIps+cAG7axa4zB0KcPUluDD4COtq9xHq0bf0T2IAymcQEyRkjcoApUH3XU
 FN8EU8zQECaERPr7bviE+65JXBs18csuf7+IV8RxIvO+DW2BlcOpRMyronrZNLERajI2
 SSXMEl+kjO8O1NWdPgTK2M3oIJ7IAlrwkvynDsgh/RoTPBgiy8TkWtO0YgwzHi+EqjD2
 g1Eg==
X-Gm-Message-State: AOAM533XgJMvp+pi0b/ezBdEJbVRl7Xoe8zrS2xBHYHWF/ZAP8o9N+Rp
 VpFYHGcb4W1dbrGlPl7G7/JUPBC3CpgOZA==
X-Google-Smtp-Source: ABdhPJznIJILUl5huMKYOHKd+Vb5PAnmx17ne7LMKBz7FoFNiiebAA2v2m4OCDEUg9IwDw5n1cMr9g==
X-Received: by 2002:a17:90a:d3cb:: with SMTP id
 d11mr11821060pjw.109.1633535380317; 
 Wed, 06 Oct 2021 08:49:40 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b8sm3375699pfm.65.2021.10.06.08.49.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 08:49:39 -0700 (PDT)
Subject: Re: [PULL 00/13] Block layer patches
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20211006105923.223549-1-kwolf@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ef0abcab-393d-cad6-3d1a-77d4104420d2@linaro.org>
Date: Wed, 6 Oct 2021 08:49:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211006105923.223549-1-kwolf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.964,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/6/21 3:59 AM, Kevin Wolf wrote:
> The following changes since commit e3acc2c1961cbe22ca474cd5da4163b7bbf7cea3:
> 
>    tests/docker/dockerfiles: Bump fedora-i386-cross to fedora 34 (2021-10-05 16:40:39 -0700)
> 
> are available in the Git repository at:
> 
>    git://repo.or.cz/qemu/kevin.git tags/for-upstream
> 
> for you to fetch changes up to 3765315d4c84f9c0799744f43a314169baaccc05:
> 
>    iotests: Update for pylint 2.11.1 (2021-10-06 10:25:55 +0200)
> 
> ----------------------------------------------------------------
> Block layer patches
> 
> - Fix I/O errors because of incorrectly detected max_iov
> - Fix not white-listed copy-before-write
> - qemu-storage-daemon: Only display FUSE help when FUSE is built-in
> - iotests: update environment and linting configuration
> 
> ----------------------------------------------------------------
> Emanuele Giuseppe Esposito (1):
>        include/block.h: remove outdated comment
> 
> John Snow (5):
>        iotests: add 'qemu' package location to PYTHONPATH in testenv
>        iotests/linters: check mypy files all at once
>        iotests/mirror-top-perms: Adjust imports
>        iotests/migrate-bitmaps-test: delint
>        iotests: Update for pylint 2.11.1
> 
> Paolo Bonzini (1):
>        block: introduce max_hw_iov for use in scsi-generic
> 
> Philippe Mathieu-Daudé (1):
>        qemu-storage-daemon: Only display FUSE help when FUSE is built-in
> 
> Vladimir Sementsov-Ogievskiy (5):
>        block: implement bdrv_new_open_driver_opts()
>        block: bdrv_insert_node(): fix and improve error handling
>        block: bdrv_insert_node(): doc and style
>        block: bdrv_insert_node(): don't use bdrv_open()
>        iotests/image-fleecing: declare requirement of copy-before-write
> 
>   include/block/block.h                         |  8 ++-
>   include/block/block_int.h                     |  7 +++
>   include/sysemu/block-backend.h                |  1 +
>   block.c                                       | 79 ++++++++++++++++++++++-----
>   block/block-backend.c                         |  6 ++
>   block/file-posix.c                            |  2 +-
>   block/io.c                                    |  1 +
>   hw/scsi/scsi-generic.c                        |  2 +-
>   storage-daemon/qemu-storage-daemon.c          |  2 +
>   tests/qemu-iotests/iotests.py                 |  2 -
>   tests/qemu-iotests/testenv.py                 | 15 +++--
>   tests/qemu-iotests/testrunner.py              |  7 ++-
>   tests/qemu-iotests/235                        |  2 -
>   tests/qemu-iotests/297                        | 52 +++++++-----------
>   tests/qemu-iotests/300                        |  5 +-
>   tests/qemu-iotests/pylintrc                   |  6 +-
>   tests/qemu-iotests/tests/image-fleecing       |  1 +
>   tests/qemu-iotests/tests/migrate-bitmaps-test | 50 +++++++++--------
>   tests/qemu-iotests/tests/mirror-top-perms     | 12 ++--
>   19 files changed, 164 insertions(+), 96 deletions(-)

Applied, thanks.

r~


