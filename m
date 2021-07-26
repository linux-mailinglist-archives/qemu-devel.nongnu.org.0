Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F4A3D679F
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 21:45:07 +0200 (CEST)
Received: from localhost ([::1]:48672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m86XC-0002Ov-VC
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 15:45:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m86WG-0001PX-7e
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 15:44:08 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:37753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m86WE-0007Qk-9c
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 15:44:07 -0400
Received: by mail-ed1-x52c.google.com with SMTP id h8so12150995ede.4
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 12:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZADfshDZCDv4B5CFVHr24DoKi+hKcHz8fvwE0bi+tgA=;
 b=c/yfqTi5BocyMRWBIAibd8U74GxbEnM19SFLXJMNMS9TA1Js+T7YaYOHl9+UFgI/YC
 7bTCgLWKxC/FJrLbZI99GIPjXvjMPCjnYW4xKx0Au+ufBcz7jx98S7jlrPbJkmanCDu1
 ZQTsjSc+IR2w085XTbbygY9bcIabjC1y5NEHx32gTBFgchVllujXswT/vE6fhE8mbVEy
 tcc3eD9AQ77J0oU1BdXMbnixYZ9HIjZiCgASMgd8vL8znXicpCg2jq8ApsgYSZp/8/b5
 3KSYr0zcQP0NxdINawk0BD+rYnrruufWmzeSfOEj5mRxSsjDto+ITUvwv2LvYrA/62Nn
 cX8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZADfshDZCDv4B5CFVHr24DoKi+hKcHz8fvwE0bi+tgA=;
 b=eiPRtP+ZJnqU/KlXzXfxQKQwRJHvUU1gCgnxjCSCRHnCMaq8YuodQWehq/bHXlDZ5y
 Lmdsty+pyCByw61eQNMvMZl7oKk1OVgTM7l+HbLLOgmoPaJLuB7Gth6DL/9yUpRz2EvE
 pjg4V0LNbZX9IQxd6xjlNYjiTH7lnTL6HbuiDsE39qRc077U2l+iSHQaXofcQelNgNOc
 F+nWp24qHWrhjFQnOBmpdPEL1+OS2Dh4UHbK8ekJTB9FLAJxtzR3bycQVv2LJoseLCqP
 WTnaSBiLmU85UNVCKrFI43TLcKXGVFHUUtcJoy6QR11Ys+UIjJOa6eFLV/Wi/4U9i4JG
 qUHw==
X-Gm-Message-State: AOAM531Z6H93woqh34nx2R3XFrDwjlEXqOva8Z+pG6L62OtUZlQLuC+0
 uVv6X/6CAVG8UR59NqFg7DcZqD0DO22cexa60LsEXg==
X-Google-Smtp-Source: ABdhPJxz3TB1w3l5r6jnRRpbjrnIOnINdpwY3h3/xvN4FOzSfIDAgTqFqBTbiy711Bvl3aZ9R926VWng24cFKxouU38=
X-Received: by 2002:a05:6402:35c7:: with SMTP id
 z7mr23579936edc.36.1627328644561; 
 Mon, 26 Jul 2021 12:44:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210726085306.729309-1-stefanha@redhat.com>
In-Reply-To: <20210726085306.729309-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Jul 2021 20:43:22 +0100
Message-ID: <CAFEAcA-fdRDKDreKnw5S5qWHT5-CM+Dw05UstkL6LsucbsqCJg@mail.gmail.com>
Subject: Re: [PULL for-6.1 0/1] Block patches
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 26 Jul 2021 at 09:53, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> The following changes since commit a2376507f615495b1d16685449ce0ea78c2caf9d:
>
>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-07-24 11:04:57 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/stefanha/qemu.git tags/block-pull-request
>
> for you to fetch changes up to 15a730e7a3aaac180df72cd5730e0617bcf44a5a:
>
>   block/nvme: Fix VFIO_MAP_DMA failed: No space left on device (2021-07-26 09:38:12 +0100)
>
> ----------------------------------------------------------------
> Pull request
>
> Phil's block/nvme.c ENOSPC fix for newer Linux kernels that return this errno.
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

