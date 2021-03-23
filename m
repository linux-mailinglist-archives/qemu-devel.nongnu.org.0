Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F466346578
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 17:39:17 +0100 (CET)
Received: from localhost ([::1]:44398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOk3o-0001F6-IT
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 12:39:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lOjIH-00028B-DJ
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:50:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lOjIF-0002Pg-7o
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:50:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616514606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7a9x9sMPjTQMRh3A7PB7wDsHaKp6dbnl2aXjY9m6eTs=;
 b=fmjWvRig8gJxAAhUHKpbxAZt1SjJZsicS4v6UeeAPtq95uh4YuPsSO9G3BMMzwJ2lCD4bZ
 E4TTv+4XQLMEK9Ea1WHf/BBpYpWxethFkf01LRxsCVN1MQ6E1Rer1OALJaMjdO/kylHCYa
 ulzZ3xT++dROQr474//O3X64N/9nOws=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-B_FIg6wiMC-2vPCxJ8A0vw-1; Tue, 23 Mar 2021 11:50:01 -0400
X-MC-Unique: B_FIg6wiMC-2vPCxJ8A0vw-1
Received: by mail-vk1-f198.google.com with SMTP id i65so654571vkg.19
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 08:50:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7a9x9sMPjTQMRh3A7PB7wDsHaKp6dbnl2aXjY9m6eTs=;
 b=qqYRLo9b39llPqn3AXch8d/Ki84zlGUYkQmArx3CPatxSe0OGMvanGGuShOqYSkLl7
 xyzB1slCmFh/7JBeYEpbvhfN3BSbukJ4+cUjbd1Um6elJdpxacQDJ9BeX3isbwlsmPUm
 84XmOUkHEA3sVt+v6VP2SkNRrlC223tZZp34Tflrc8YSO61goiYsNx9rJ9Ocyo38Cj/2
 plvXxssTCsDdGXMaoRV2JnLUxAce+Ku12fIRw6IfiTcnvm2OsSxf3r9Xqbm9C+1GaDh6
 urw/2iJ1L+DBPjW0hIkmnM0GznS889nRCmfrdPxiipThg2raQqoZ9w+IcyxurKpBiNMh
 oQiw==
X-Gm-Message-State: AOAM532CLz6b+gWOJlb2huQOpH85hqrHU9QQO+FGh3Z8iVTi2BYhnBLe
 o++WPXzaWTBeQAyc8quAybCWGT/zddbskJST/ZmqO0ak3EvQEiBTi5KPPuhIrYQdrzcI1/T484j
 NkxhRZkHjYC0my2am2MuiYldhoV1Gofk=
X-Received: by 2002:a67:fe93:: with SMTP id b19mr4016355vsr.1.1616514601141;
 Tue, 23 Mar 2021 08:50:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwl5u6In+VfxfepTYYlC34z133duIKeVfrPfU1upBhZ7shimBQbXc/kGHR3BOJtyNjGIlVy7ghew6RUWoFliUY=
X-Received: by 2002:a67:fe93:: with SMTP id b19mr4016340vsr.1.1616514600958;
 Tue, 23 Mar 2021 08:50:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA_j3iBiwxNCN7AdDUv6rTGTn_gAzQ9E-h2dG9bmk3ez_g@mail.gmail.com>
In-Reply-To: <CAFEAcA_j3iBiwxNCN7AdDUv6rTGTn_gAzQ9E-h2dG9bmk3ez_g@mail.gmail.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 23 Mar 2021 12:49:34 -0300
Message-ID: <CAKJDGDZJJ-b7H4xf0+kCk59kD894XH+efhF1u73EYqJ_OXZAOg@mail.gmail.com>
Subject: Re: 'make check-acceptance' odd error: "'bytes' object has no
 attribute 'encode'"
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On Tue, Mar 23, 2021 at 12:28 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> I just got this running 'make check-acceptance': does it
> ring a bell with anybody?
>
> [etc]
> Fetching asset from
> tests/acceptance/replay_kernel.py:ReplayKernelSlow.test_mips64el_malta_5KEc_cpio
> Fetching asset from
> tests/acceptance/replay_kernel.py:ReplayKernelSlow.test_mips64el_malta_5KEc_cpio
> Fetching asset from
> tests/acceptance/replay_kernel.py:ReplayKernelSlow.test_mips_malta32el_nanomips_4k
> Fetching asset from
> tests/acceptance/replay_kernel.py:ReplayKernelSlow.test_mips_malta32el_nanomips_16k_up
> Fetching asset from
> tests/acceptance/replay_kernel.py:ReplayKernelSlow.test_mips_malta32el_nanomips_64k_dbg
> Fetching asset from
> tests/acceptance/reverse_debugging.py:ReverseDebugging_AArch64.test_aarch64_virt
> Fetching asset from
> tests/acceptance/virtio-gpu.py:VirtioGPUx86.test_virtio_vga_virgl
> Error running method "pre_tests" of plugin "fetchasset": 'bytes'
> object has no attribute 'encode'

The side effect of this bug is that when you run check-acceptance for
the first time, it won't download this specific image before the test
starts, but during the test execution. After the first run, the asset
is already on cache and will not be downloaded again, working as
expected.

This bug is fixed here
https://github.com/avocado-framework/avocado/pull/4416 and already
available on release 86.0 of Avocado.

It will reach the QEMU side as soon as we bump the version here.

> JOB ID     : 71b2d5569d9ccc8b68957d3ad2b2026bea437d66
> JOB LOG    : /home/petmay01/linaro/qemu-from-laptop/qemu/build/clang/tests/results/job-2021-03-23T15.09-71b2d55/job.log
>  (001/142) tests/acceptance/boot_linux.py:BootLinuxX8664.test_pc_i440fx_tcg:
> PASS (465.84 s)
>  (002/142) tests/acceptance/boot_linux.py:BootLinuxX8664.test_pc_i440fx_kvm:
> PASS (27.46 s)
>  (003/142) tests/acceptance/boot_linux.py:BootLinuxX8664.test_pc_q35_tcg:
> PASS (99.43 s)
> [etc]
>
> thanks
> -- PMM
>


