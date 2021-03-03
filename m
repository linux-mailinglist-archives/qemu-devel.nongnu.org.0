Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E98732B957
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 17:57:26 +0100 (CET)
Received: from localhost ([::1]:46358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHUoO-0001Rt-I3
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 11:57:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lHUmM-0000jj-HY
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 11:55:18 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:36755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lHUmF-0004ly-Hh
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 11:55:14 -0500
Received: by mail-ej1-x630.google.com with SMTP id do6so43607532ejc.3
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 08:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rG/ppX9Z4Hdh8a2G1CmtKwvPBHDpzP6FwfM7rJYZqrU=;
 b=wSGt+nvLFbwNwm3byd7UuMC6X91ooIkrJO0OgtwCE9L8J5nQRlxd0jylMDd3/TsDb3
 AvgW63q627it4HFZtYf6UA5jxHdv+WUt1un56j9x2ClEHalYun2r9m5TrP9sM01TCqR3
 veSHGIrNs5FkpULJjeOsJwVSXvdWdaFRHSrzaZKdY7RfI5amQfmTzBc598uRcFALnv5b
 xUufzosTydWFKQj6hOBWreh4lB9AN0ph3B/wd59ebQ2cfodzKR1SB/XXwMSBGL/tP/9x
 jD/Q98Aw6nv+9Jb/ikTGE5SRTYkoWdb7zA94GPqCtR4OODZcwBtKh1VU3aLiyiGrA7kH
 TFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rG/ppX9Z4Hdh8a2G1CmtKwvPBHDpzP6FwfM7rJYZqrU=;
 b=EgjeouNvRsAqVA8DRpGsiX5fETV8zqqqmyxJum8OS+9+hQ0oVqX3HrEtXmdNVJKM8H
 O+xIlXL90HmOSDX+jzXEKaikmgfhSpjnksZfm1196wZm9N3Y7GqyERhGRESzjHWyo9vh
 yMu8T7YQPXaWjpYVRhkx4awZAtYJ9b1Yh8y2J10ApJ6r+WwX/NCLIfL/Q6vDFJzgukgZ
 4P3IMav6P+1F0jB2gq2fG/b70eURH4kORCFZq61r/hi3uocu9JtwPIt+2lvlH/GdUOQ8
 SVg559UdGe1TbckABzCZTmTjZNsKoEzvDJEVM24o/mN7wRpM1KEnyhgNDxsWFTGXd/H4
 LpOg==
X-Gm-Message-State: AOAM533JvQNbNE0z6fnUhqPRfxwy7vKLXiB0pNdYmDNbUEhcs/LJA3WH
 c+IXuw9MNLAZ8fna6hECexL2dx4jO2n/cDEGU2V03A==
X-Google-Smtp-Source: ABdhPJzsWl/DHOKCeM3rxby7ferMHr5R5ZMeoCkKpVKNeljpqEYf1K85g0gMr5zust7Jxo/oW9vRQkQ8SnJ+JRnFBvk=
X-Received: by 2002:a17:906:bd2:: with SMTP id
 y18mr6421082ejg.482.1614790507730; 
 Wed, 03 Mar 2021 08:55:07 -0800 (PST)
MIME-Version: 1.0
References: <20210226080526.651705-1-pbonzini@redhat.com>
In-Reply-To: <20210226080526.651705-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 3 Mar 2021 16:54:52 +0000
Message-ID: <CAFEAcA-TU4z13w=Afz4=q9rN1KARWyvu-x-vU5mwFxuU09DKBA@mail.gmail.com>
Subject: Re: [PULL 00/29] Misc patches for 2021-02-25
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 26 Feb 2021 at 08:09, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 00d8ba9e0d62ea1c7459c25aeabf9c8bb7659462:
>
>   Merge remote-tracking branch 'remotes/philmd-gitlab/tags/mips-20210221' into staging (2021-02-21 19:52:58 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to b7ea7d82903f125e393b7957d1add25cf6b522dd:
>
>   tcg/i386: rdpmc: fix the the condtions (2021-02-25 14:49:01 +0100)
>
> ----------------------------------------------------------------
> * fix --enable-fuzzing linker failures (Alexander)
> * target/i386: Add bus lock debug exception support (Chenyi)
> * update documentation for preferred boolean option syntax (Daniel)
> * make SCSI io_timeout configurable (Hannes)
> * fix handling of guest recoverable SCSI errors (myself)
> * misc fixes (Pavel, Zheng Zhan Liang, Zihao)
> * fix installation of binaries with entitlements (Akihiko)


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

