Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 341EF6261CD
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 20:21:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otZZp-0003Pl-Qg; Fri, 11 Nov 2022 14:20:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1otZZk-0003H0-1c; Fri, 11 Nov 2022 14:20:28 -0500
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1otZZi-000176-9v; Fri, 11 Nov 2022 14:20:27 -0500
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-370547b8ca0so52773717b3.0; 
 Fri, 11 Nov 2022 11:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WYPrVMU7ZDyQ8DW1fBjOraxkdvRjvPBB3kDawCrgtAs=;
 b=LfJEw/VomD/4ffTAR32x/XKa0YOVxkDaewkCLgExtC/4P8xCfW7NvKCVtlb1wSAnCq
 HHHzYuXV+o5Zw6cC9ImEAGVdhAVoFyaTG9zp1RuIUv+gx9nplCQbGsTc8eIYLoA0swze
 F4lqxZ7w7IQmNfIkovcFdJPQQTG9y/rGoX8EU/pnzYumdFl34SZ4hrC8Mg1s1QQfoQOJ
 u4AVK6DYOaHn/+wTibQRLONwmZqpcz7rgy7wRP6CVJ55gqoGKecAaGBOQrZtF5u9UWz1
 MKFpqcrlaW/UoRil4SmcHuXftSgfd9C2mJbtBX6cWUo2ek1D3rX+fobkWLJtiCKM22TP
 l7lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WYPrVMU7ZDyQ8DW1fBjOraxkdvRjvPBB3kDawCrgtAs=;
 b=VY5KNFH+jlc5a1JAbNcKDSqbAtfKg3gaOg5DAkfW8SfqUXFilfW8yIMBa15ut8rOim
 1kv+8OZMT5oJ7GtvkCKWEBi4Uu6twwuFlLZZu/nFvZWsvednGnXOeuwMFvZ51g19fmGh
 p0ZFMcNb0DvITds3gWzx5KPw1/fS3AuNH50VOUnqRYW+YPITzJPtssbsmA4PqB4iobqO
 FmwUfx99Ak5CmigbiWAwaolC8LBSJYQzWCfSkgXa7p8YlCvi4M37YksnocJKTh3N3s7j
 Qsbd+iznf2tXc0oQVVhWaef71ujyxV3y29sW4W9IWEtRibYuZjIHIP5uMUrF0tVpGH2p
 7rNA==
X-Gm-Message-State: ANoB5plQ26WyPJmbHV51lnHn3f46BOE7oM62fo4OAuHayh1DRGFb2Aci
 5jWVxwa/hkd/I8sNrWMU2ITVbtcId+onSN6bgCY=
X-Google-Smtp-Source: AA0mqf7iyXrP5B4kDKmILCixomyCUh6Uj3xOmQQv7BZAJdTO4aREKwaM3fORwuRpICVLMk/6xeOjlN7+8uDNJdqfHgw=
X-Received: by 2002:a81:1946:0:b0:369:b7df:f02 with SMTP id
 67-20020a811946000000b00369b7df0f02mr3174383ywz.239.1668194424789; Fri, 11
 Nov 2022 11:20:24 -0800 (PST)
MIME-Version: 1.0
References: <20221111152744.261358-1-kwolf@redhat.com>
In-Reply-To: <20221111152744.261358-1-kwolf@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Fri, 11 Nov 2022 14:20:13 -0500
Message-ID: <CAJSP0QVgzEAEdzrBd2Q3KsPBmCPTwzdO1dOb6KrY729esKLkZA@mail.gmail.com>
Subject: Re: [PULL 00/11] Block layer patches
To: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Cc: qemu-block@nongnu.org, stefanha@redhat.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 11 Nov 2022 at 10:29, Kevin Wolf <kwolf@redhat.com> wrote:
>
> The following changes since commit 2ccad61746ca7de5dd3e25146062264387e43bd4:
>
>   Merge tag 'pull-tcg-20221109' of https://gitlab.com/rth7680/qemu into staging (2022-11-09 13:26:45 -0500)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/kevin.git tags/for-upstream
>
> for you to fetch changes up to b04af371af685c12970ea93027dc6d8bf86265aa:
>
>   tests/stream-under-throttle: New test (2022-11-11 13:02:43 +0100)
>
> ----------------------------------------------------------------
> Block layer patches
>
> - Fix deadlock in graph modification with iothreads
> - mirror: Fix non-converging cases for active mirror
> - qapi: Fix BlockdevOptionsNvmeIoUring @path description
> - blkio: Set BlockDriver::has_variable_length to false
>
> ----------------------------------------------------------------
> Alberto Faria (2):
>       qapi/block-core: Fix BlockdevOptionsNvmeIoUring @path description
>       block/blkio: Set BlockDriver::has_variable_length to false
>
> Hanna Reitz (9):
>       block/mirror: Do not wait for active writes
>       block/mirror: Drop mirror_wait_for_any_operation()
>       block/mirror: Fix NULL s->job in active writes
>       iotests/151: Test that active mirror progresses
>       iotests/151: Test active requests on mirror start
>       block: Make bdrv_child_get_parent_aio_context I/O
>       block-backend: Update ctx immediately after root
>       block: Start/end drain on correct AioContext
>       tests/stream-under-throttle: New test

Hi Hanna,
This test is broken, probably due to the minimum Python version:
https://gitlab.com/qemu-project/qemu/-/jobs/3311521303

Stefan

