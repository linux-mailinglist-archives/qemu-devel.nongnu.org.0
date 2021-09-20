Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1171C41156F
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 15:21:45 +0200 (CEST)
Received: from localhost ([::1]:40576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSJEu-00087Z-4q
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 09:21:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSJ9n-0003kV-Ld
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 09:16:27 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:46891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSJ9j-00080t-LO
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 09:16:27 -0400
Received: by mail-wr1-x434.google.com with SMTP id x6so29553766wrv.13
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 06:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZguIa521U18HbwJbV2pzKFToLaIWEAyyTnnLXXFG/4A=;
 b=Oe0CDgMdiwCuQu0k2FmSWfo0zOcJs+uBoRBCgzOABODQu0sGIABWSfC0cPjtdhH67e
 f4h4XJ+kEKnO0zAdEFiy3i0b5trahHPp4eIrAojgMysOcCRD7FrN5GthKvdlKFgfW4k/
 cMr9x3Z76jnDoIf/DAbEYrt3RUQQEz6xkFD9TnVZX8xi8Au4pHeKU3krIYclu4/+52Hn
 Et+GTCwJg9GMDv6brqUXBgwG57LP8QCHcLJRp/uVeQSxoG6Czv4ZrCrAHwX7Fza7Qxxd
 usQ4VwUmhQJNbdDxS7HakZTSncYOJ/MJ+O2GZmrJUzSGjeXlc+ZBnfZUKukDlsxGEbXl
 uN/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZguIa521U18HbwJbV2pzKFToLaIWEAyyTnnLXXFG/4A=;
 b=E1xKyznCMkjeu1FQ51RoRnXqbsza80XvT/hsbtc6vaafPVip4TCiRxmu9krWJWvLX8
 2P8gnOXD+I/bqMYahoxHdeD8p9YcJ6fg6Qa+iuBOxkkAtVdYUEqPxJRHEUrAmK/4c/Ml
 2mC8z2mbSI97hbnvWlBNB8uh4yFuY39GyUT5xsAmK4DpLZWKwVOd7Rql1KfQB0GP6K15
 KzUctcB+j0bGrevgqgAqY1qgZ2TpGHt+Y2jO91nCRaxA7W+3Y4ZcJrRI3/20TGkMUEWK
 3XGsFH0OEoAaRrqmFf1eIdTSDZRtWz1U3i2XycEWU1dr/ireAYNnvqZLsNeQjn1Mcfci
 XoIQ==
X-Gm-Message-State: AOAM533ixRNH7E27UDhl6HqZx2acl9QCDpxMWx+ugf6BIGP4zNvzGkxf
 z/OLYeKNrlv+mEEkP3CMtDcmITldwtB5vc038d3A/w==
X-Google-Smtp-Source: ABdhPJwLvLZFi4r40LWFNJzkp25iBHg5qIh2oCSZNxTrpT9hLzVFzDiaz6JTJ8t7ZAHp0b5ElRSriQLTUIu6n9mc8/U=
X-Received: by 2002:a05:600c:4848:: with SMTP id
 j8mr29398576wmo.21.1632143781287; 
 Mon, 20 Sep 2021 06:16:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210916155404.86958-1-agraf@csgraf.de>
 <CAFEAcA-LrvO7sg9gY0ZKnvXJyJuFc2Ej1Ve1245FZ7YkH-Oj2A@mail.gmail.com>
In-Reply-To: <CAFEAcA-LrvO7sg9gY0ZKnvXJyJuFc2Ej1Ve1245FZ7YkH-Oj2A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Sep 2021 14:15:29 +0100
Message-ID: <CAFEAcA_Hkqg16VbA1qACK4RG22iXHo8b3VZWQoBRZL0HuBazZA@mail.gmail.com>
Subject: Re: [PATCH v12 00/10] hvf: Implement Apple Silicon Support
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 20 Sept 2021 at 11:11, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 16 Sept 2021 at 16:54, Alexander Graf <agraf@csgraf.de> wrote:
> >
> > Now that Apple Silicon is widely available, people are obviously excited
> > to try and run virtualized workloads on them, such as Linux and Windows.
> >
> > This patch set implements a fully functional version to get the ball
> > going on that. With this applied, I can successfully run both Linux and
> > Windows as guests. I am not aware of any limitations specific to
> > Hypervisor.framework apart from:
> >
> >   - gdbstub debugging (breakpoints)
> >   - missing GICv3 support
> >   - Windows will not work due to UDEF SMC implementation
> >
> > To use hvf support, please make sure to run -M virt,highmem=off to fit
> > in M1's physical address space limits and use -cpu host.
>
> Applied to target-arm.next, thanks (with the unnecessary #include
> in patch 6 removed).

Turns out that the final patch breaks "make check-acceptance".
All the orangepi boot tests timeout:

 (15/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi:
INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
Timeout reached\nOriginal status: ERROR\n{'name':
'15-tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi',
'logdir': '/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/tests/...
(90.24 s)
 (16/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_initrd:
INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
Timeout reached\nOriginal status: ERROR\n{'name':
'16-tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_initrd',
'logdir': '/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang...
(90.24 s)
 (17/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_sd:
INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
Timeout reached\nOriginal status: ERROR\n{'name':
'17-tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_sd',
'logdir': '/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/tes...
(90.24 s)

So I'm going to drop that one; we need to work out what's
going wrong with the orangepi-pc machine.

thanks
-- PMM

