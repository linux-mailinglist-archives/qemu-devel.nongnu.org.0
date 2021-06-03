Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFB8399D55
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 11:02:31 +0200 (CEST)
Received: from localhost ([::1]:57656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lojFG-0000VN-DM
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 05:02:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lojD2-0006kI-Im
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 05:00:13 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:42539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lojCz-0006Zp-Lz
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 05:00:12 -0400
Received: by mail-ej1-x62f.google.com with SMTP id k25so2604600eja.9
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 02:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1TCd7BJvYrOfFh+IBsjWdV0Ku7/ebHbY+W81MzMzCRM=;
 b=S6thsWIs7LPg6GIZjsJ0eJyqiq1bdN6pABBHBRID8/J4timasOqMh9g9phPSyQjSJ1
 KNHlUAPXHOFMDM379H5gy8paKNh7BAKmie1Al8B1P2os/k9pHBk+4dHRdGvgkL80fHlZ
 VzV1JW5wJkfHdIHurDrtoRHdOJO6b6aBXFJ9Jxz4Od2UTW6QAWpCu1PNERq3Xmh1S1Pm
 tXKnvVpXIbF7CQn6CBcA0KKBS8paaO8IwQJlqadIVsWh/x0sLn/5LwYgtoThtxPrR3zq
 yH/Yhugy5FDLZ3ld7Dw+W8BCqA6jhZCfr31U6VRZ+V8GKN8r9L1LOCEpPsVIZwG8HSXN
 Tp/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1TCd7BJvYrOfFh+IBsjWdV0Ku7/ebHbY+W81MzMzCRM=;
 b=pNc/pOhZ//cSdJYYWQnyKwY5FdtC4hAQp29+gp9Pt610sfvyVc8sFvlp2NtSiBFeJ/
 AEaXQTTPcDO2nYDUuBz+/OZ+G+CVCdWt2TivnjUIlsHDIKIpdStDv1+nfO9shAfw/nA+
 EimDvDKaDqC8JwaxWAT4BIzkIOEv+Gooqr4JVoYZ3HNLTIUIQkZVqTdZq8tbmLLdjVVg
 E/pt5Ox0S7U3adBEThBGo6cdq7MSlSx6daZHdyuun6KxSe4V9WmDUHjmxpcksOqCtr/4
 sfxKYxXNa8apeudhgrNBAeMfBttYyasL2+RGlONLEwS0ZOOlKY137FW6fXn415wyGr1e
 pqKQ==
X-Gm-Message-State: AOAM531bDJxNkt5zPQg3CqviUG2Q6BS6+rAy51r1UlWlLi5NVQh1hFUH
 2qqy+lQfp0dLbIyJL6N+BABEY0TLyuo1vw8bAYUUlw==
X-Google-Smtp-Source: ABdhPJymnfNRMJEp85f6Y0csVqSVDk8OOGHwDJsvQZG5xZGuelipwW3Hl8gXgsvtZzRrrgnRpQ4j+NSGHEMt3kdss18=
X-Received: by 2002:a17:906:5299:: with SMTP id
 c25mr22552085ejm.85.1622710807264; 
 Thu, 03 Jun 2021 02:00:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210602134529.231756-1-kwolf@redhat.com>
In-Reply-To: <20210602134529.231756-1-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jun 2021 09:59:34 +0100
Message-ID: <CAFEAcA-g4KVmc4sNxG1NtDdVJ1-8JxW94fdO0G951wqXdpOCAQ@mail.gmail.com>
Subject: Re: [PULL 00/20] Block layer patches
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Jun 2021 at 14:45, Kevin Wolf <kwolf@redhat.com> wrote:
>
> The following changes since commit dd2db39d78431ab5a0b78777afaab3d61e94533e:
>
>   Merge remote-tracking branch 'remotes/ehabkost-gl/tags/x86-next-pull-request' into staging (2021-06-01 21:23:26 +0100)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/kevin.git tags/for-upstream
>
> for you to fetch changes up to b317006a3f1f04191a7981cef83417cb2477213b:
>
>   docs/secure-coding-practices: Describe how to use 'null-co' block driver (2021-06-02 14:29:14 +0200)
>
> ----------------------------------------------------------------
> Block layer patches
>
> - NBD server: Fix crashes related to switching between AioContexts
> - file-posix: Workaround for discard/write_zeroes on buggy filesystems
> - Follow-up fixes for the reopen vs. permission changes
> - quorum: Fix error handling for flush
> - block-copy: Refactor copy_range handling
> - docs: Describe how to use 'null-co' block driver
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

