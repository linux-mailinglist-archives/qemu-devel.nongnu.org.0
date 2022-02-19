Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 968EF4BC92B
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Feb 2022 16:35:29 +0100 (CET)
Received: from localhost ([::1]:41722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLRlg-0002yj-8A
	for lists+qemu-devel@lfdr.de; Sat, 19 Feb 2022 10:35:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nLRge-0000dT-RS
 for qemu-devel@nongnu.org; Sat, 19 Feb 2022 10:30:16 -0500
Received: from [2607:f8b0:4864:20::936] (port=34392
 helo=mail-ua1-x936.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nLRfZ-0006un-II
 for qemu-devel@nongnu.org; Sat, 19 Feb 2022 10:30:15 -0500
Received: by mail-ua1-x936.google.com with SMTP id 60so5730288uae.1
 for <qemu-devel@nongnu.org>; Sat, 19 Feb 2022 07:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8klJnrHZlO2sTN4AigPY1Gu3jhXFl/CbuNN8qW46dII=;
 b=pu+zxITKmGQ3n2mWpOtwwPgexVMkQ+IipQM2USA0qykQBeIOHW7bvlE9buEk1T92oG
 rxp3Ec/gy4gxfGMtdARK38dB+a1NjBMffcsL20Xhu/8NvHEh8DWFig4f2rcCo1yhOcyF
 lTJ4g75Qeb3C4taX3YsNUl6TI+/wwcrrwH2UA8TDxAiguViXKcwnvTGSMW6bCyt6f8IP
 CyrVvyUHh7ekb/MGowVn4GEuFaUwYM32fVOBQMgD4VCwCf18Coo2mwicpAdniPGbR83M
 zIv7ofgk3/4KGAf1KaKsOl+wrKj+kGlMzwkv9A1D34y24WTLoMN5TvytPJP5UZe2wtSo
 jNww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8klJnrHZlO2sTN4AigPY1Gu3jhXFl/CbuNN8qW46dII=;
 b=VS91Bk6yAJgPGOjFjGZdQxKLIPll0wKS7HKrRS620eO26vs4VhVh4Hx3nYV+V0/luc
 YJAoSPjXPnxQ5r8ElDTqi9ec8wjT1bXUYciVs0l/z/auaNqFHQNGYzPjxffi8RxfrSna
 2PKFEuhLUOt0bbRHL8luFKqkY8xnPCCyIFKLb04J2x4R2PAl5KQolJ8+lEwi/eRCPRFs
 HYUdjALUnvcNyHCbtUF4y4wBOFPAwEug50iO+ulOsK9JFhbv/yEJK05sHH3Tpyxdwv31
 uZtptJmxNlZ07/YtTCkLtNmdSQa5uAugkpy6m9yEbxml+ozJmBeUxW45JpVQ/3CNOGxy
 d5vA==
X-Gm-Message-State: AOAM530RyuSwZgYhiDOycZbWKk7zDQwiKCgI3Kxu6IlgJO7nUMIce99D
 CLi4rntoKH4efjs/By91QaESE9P8j0KuFLvyeW1DWco/L18=
X-Google-Smtp-Source: ABdhPJwdtsTdEaw4u8U1+T4qrPqIUotiaVh2z/upHetBIhGjoJ4AZYTlfyFxowavP5T6i2X2EdiRRHsmIKcGjJEd2P4=
X-Received: by 2002:a0d:d5c8:0:b0:2d5:e0a:56c0 with SMTP id
 x191-20020a0dd5c8000000b002d50e0a56c0mr12160886ywd.10.1645284124821; Sat, 19
 Feb 2022 07:22:04 -0800 (PST)
MIME-Version: 1.0
References: <cover.1645114783.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1645114783.git.qemu_oss@crudebyte.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 19 Feb 2022 15:21:53 +0000
Message-ID: <CAFEAcA9e7-+tG-vWM=57xcCTQ584UZ5r=b=h=OnX9qxyKUjpEg@mail.gmail.com>
Subject: Re: [PULL v2 0/5] 9p queue (previous 2022-02-10)
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::936
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::936;
 envelope-from=peter.maydell@linaro.org; helo=mail-ua1-x936.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Feb 2022 at 16:38, Christian Schoenebeck
<qemu_oss@crudebyte.com> wrote:
>
> The following changes since commit c13b8e9973635f34f3ce4356af27a311c993729c:
>
>   Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20220216' into staging (2022-02-16 09:57:11 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/cschoenebeck/qemu.git tags/pull-9p-20220217
>
> for you to fetch changes up to e64e27d5cb103b7764f1a05b6eda7e7fedd517c5:
>
>   9pfs: Fix segfault in do_readdir_many caused by struct dirent overread (2022-02-17 16:57:58 +0100)
>
> ----------------------------------------------------------------
> 9pfs: fixes and cleanup
>
> * Fifth patch fixes a 9pfs server crash that happened on some systems due
>   to incorrect (system dependant) handling of struct dirent size.
>
> * Tests: Second patch fixes a test error that happened on some systems due
>   mkdir() being called twice for creating the test directory for the 9p
>   'local' tests.
>
> * Tests: Third patch fixes a memory leak.
>
> * Tests: The remaining two patches are code cleanup.
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

