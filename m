Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD29F39306E
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 16:06:22 +0200 (CEST)
Received: from localhost ([::1]:43896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmGeT-0003fC-VO
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 10:06:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lmGVX-0003Wr-VI
 for qemu-devel@nongnu.org; Thu, 27 May 2021 09:57:07 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:36363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lmGVS-0004FS-4T
 for qemu-devel@nongnu.org; Thu, 27 May 2021 09:57:06 -0400
Received: by mail-ed1-x533.google.com with SMTP id df21so975698edb.3
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 06:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FO1+qbFN4FzVSw0x9bwURBi1gx3Yrkp0JPX61Wb0nIg=;
 b=OZqQQ/NDsZKAan1gO9LJ8BdVmbB05EBLPWGG8jULRRAv3b9QYd0IXiwD3Ti0OE5ch9
 IY2NU9MU/pZaimI3reWXBLuwSx8Dg98jVAOcM0v+x4ot9fEjVKY1ptkV0QDHKeLvvFCA
 tCLrJf00prq+JiOYRnJUDaaEnnErX9na47P3AohFF/l/2Hrg/RM+ATARM0UkQQmpMM8n
 D+fZmgcrpA9sqnFjy769W9L8rs+kgFB41iOnLAGtStXDgqXaofkYb+8V2cT+YLHxIv3I
 VYI5Eft7vfNMMf0ZLsqm8/yi/UR9QXG1Hu0850ykM5Qdvj1WSQz/LG/TzPjxO9a4dihC
 YPJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FO1+qbFN4FzVSw0x9bwURBi1gx3Yrkp0JPX61Wb0nIg=;
 b=Pj5M2SenGaSxyxqxVwJ2Ng0m5F847ysTiO01jHwTMVJSF09/BEITe8RmSaK9HqPmFp
 Yg3UKqqKFVvM+jIkD6YJmtECIrY04mxJoYhfsSrsfO3NB8K58btrGtC0aw2AMkDcQ0Bb
 BSDvaEzm0GCqJe17UxHVM2EaLQ8QNbOjyL7nqMppbu7Po1/ZC40wC/aMtDq1UyP9HC2h
 MTXpOSyRHv1zoRaKAtQgLI55Ic4CnZpuEf8obaRUkfivymY524j5al03frMASwTRjjNQ
 qsZ9jf16Qfz6kAZDz5vfAg+uRI7S6mSYrQglgqJSOwyqYBXVuDzjkavFlhu1dT8yxCbE
 dm/A==
X-Gm-Message-State: AOAM532z1whM0sc2Fj/etMfXOsJa1finWIpD7I09cQb7tdNnQyGgGU5O
 ElanM8s4NniexDmQ+es6nQ8aPUMXvsoYbbKszfH5MQ==
X-Google-Smtp-Source: ABdhPJziEmwbC+RGI21oihR9oXZlyk/8qDDQiZel+a02AeIP/DuFtwr/kYqi1SoOsgT/lF5IWutkE9NS4d0Ii0kkOcE=
X-Received: by 2002:a05:6402:3548:: with SMTP id
 f8mr4211747edd.251.1622123819780; 
 Thu, 27 May 2021 06:56:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210526211838.421716-1-f4bug@amsat.org>
In-Reply-To: <20210526211838.421716-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 May 2021 14:56:33 +0100
Message-ID: <CAFEAcA-goVUqVxMd9QmvFsUUky0d1MmJ4N7A_oK4en-16VbUeA@mail.gmail.com>
Subject: Re: [PULL 00/19] gitlab-ci patches for 2021-05-26
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 26 May 2021 at 22:27, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> The following changes since commit 2ab2dad01f6dc3667c0d53d2b1ba46b5110312=
07:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/input-20210526-pull-r=
equest' into staging (2021-05-26 15:27:20 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/philmd/qemu.git tags/gitlab-ci-20210526
>
> for you to fetch changes up to 740890e8935fff09023bb34c52e74ab1d539b775:
>
>   gitlab: Split gprof-gcov job (2021-05-26 23:01:47 +0200)
>
> ----------------------------------------------------------------
> GitLab CI patches queue
>
> - Explode .gitlab-ci.yml in reusable templates
> - Add job to cross build/test TCI on i386 host
> - Remove CentOS 7 linux-user build job
> - Split gprof-gcov job
> - Temporarily set Avocado-based jobs in manual mode
> - Increase time to hold Avocado reports to 1 week
>

Conflict in .gitlab-ci.yml -- can you fix up and resend, please?

thanks
-- PMM

