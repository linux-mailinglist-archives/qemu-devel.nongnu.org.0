Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B513430F094
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 11:27:08 +0100 (CET)
Received: from localhost ([::1]:57408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7bqt-0001Ks-PV
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 05:27:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7bTF-00066T-NI
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:02:42 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:42407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7bTC-0001xE-Gs
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:02:41 -0500
Received: by mail-ej1-x62b.google.com with SMTP id r12so4289690ejb.9
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 02:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Oy7+smgn1Cjo01XixnjTwDHXuEz3tlrtDi2O+vkrH7M=;
 b=bgjVWBAKCFRsMNWJ0P3/NdxurQNxeh588Z0w78wmFdXoooalTFlXsBtMx/TntjTOhY
 sS4Ua9RbPYgQ4cxVGi8NJfSmGiqI3ickU/YZY0cKgbaBLjljy4NPfy+Hz0+qltLXxXF2
 zh14X+bz+WtrAOkdOBNAtB7Ks+wcSCBuNYC6+RZO8NtXOQLcPX1gEYl37bBj/SMGWFOV
 zmFiM9jam6lrwbplIa9+hs6dKXfqnkGCJTIT4rTcou0mB1vnLNnFatBJNxokFB7CnxUB
 E9Vwx3XC7Ub+EVBzyyHY7lLsTgHdmVuWWoghnP+hLzx/ndi5gxyh5ByoXuAwAyrfncby
 A3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Oy7+smgn1Cjo01XixnjTwDHXuEz3tlrtDi2O+vkrH7M=;
 b=jBJFH76mQREmtUf0jvIB1Oc/mBK+q+Sdldd9A57zCR868QM5XrtKgmFApWqkYyWF0z
 y7q4ETpwnx/zC9HbwndMViLJtvumSdwRi3fCo7oBY1MJY2v0YLijwlFTBBH0Qk8OGBMB
 YNlVHEjxgAWZ529Bd8nSJIRtCtNqAcHX71KrPUsNLIcpQxxK5ZkPQDqHN6RRo62xmmhQ
 hnBt+/yNV8ORFL5e7ZLbBnIcYdt7XXwHPfeWTDD9S/HVnKShGtUAtkq8wz3oTo4UHV5b
 6suu29yV2jqEYqyHnQ6oFJKhnK5q7h0Z0ioXWNjF4rKdJrJlZ0uRoUGWrD8JTfEkCv7g
 uSKw==
X-Gm-Message-State: AOAM533mwPMtriDRH6nA/wL19ab3UkIgHC6hBN5olHuK62/v7mYNhYLc
 k1ogF0ChY7J650DcmHEZaVB2J/v3gCH2IxHQX2W+Ng==
X-Google-Smtp-Source: ABdhPJyNYYPdfEgyhkywuVBv29HVHp0nIn2ojwDMawuaRA9sJyNmG8Bz2hHJqh9ir6VK9FPS905PL/BLLDus7HMmN44=
X-Received: by 2002:a17:906:3603:: with SMTP id
 q3mr7026276ejb.382.1612432956708; 
 Thu, 04 Feb 2021 02:02:36 -0800 (PST)
MIME-Version: 1.0
References: <20210204095834.345749-1-stefanha@redhat.com>
In-Reply-To: <20210204095834.345749-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Feb 2021 10:02:25 +0000
Message-ID: <CAFEAcA-jCbyuYQ_HPR2VB1OLZGJ7SebFZ3qz-eehUV=aWuA3Ng@mail.gmail.com>
Subject: Re: [PULL 00/27] Block patches
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 John G Johnson <john.g.johnson@oracle.com>, "Denis V. Lunev" <den@openvz.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 4 Feb 2021 at 09:58, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> The following changes since commit 77f3804ab7ed94b471a14acb260e5aeacf26193f:
>
>   Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into staging (2021-02-02 16:47:51 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/stefanha/qemu.git tags/block-pull-request
>
> for you to fetch changes up to 026362226f1ff6a1168524a326bbd6347ad40e85:
>
>   docs: fix Parallels Image "dirty bitmap" section (2021-02-03 16:48:21 +0000)
>
> ----------------------------------------------------------------
> Pull request
>
> The pull request includes Multi-Process QEMU, GitLab repo URL updates, and even
> a block layer patch to fix the Parallels Image format specification!
>
> ----------------------------------------------------------------

This has merge conflicts:

Auto-merging util/oslib-posix.c
CONFLICT (content): Merge conflict in util/oslib-posix.c
Auto-merging util/mmap-alloc.c
CONFLICT (content): Merge conflict in util/mmap-alloc.c
Auto-merging softmmu/physmem.c
CONFLICT (content): Merge conflict in softmmu/physmem.c
Auto-merging softmmu/memory.c
CONFLICT (content): Merge conflict in softmmu/memory.c
Auto-merging include/qemu/mmap-alloc.h
Auto-merging include/exec/ram_addr.h
CONFLICT (content): Merge conflict in include/exec/ram_addr.h
Auto-merging include/exec/memory.h
Auto-merging hw/Kconfig
Automatic merge failed; fix conflicts and then commit the result.

Can you rebase and resend, please?

thanks
-- PMM

