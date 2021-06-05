Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E82239C76D
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 12:27:24 +0200 (CEST)
Received: from localhost ([::1]:50730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpTWU-0008RQ-Km
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 06:27:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lpTV5-0007gR-MC
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 06:25:56 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:37419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lpTV1-00081t-Nh
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 06:25:55 -0400
Received: by mail-ed1-x531.google.com with SMTP id b11so14056976edy.4
 for <qemu-devel@nongnu.org>; Sat, 05 Jun 2021 03:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n9Gp8lAG5kBCP5inyCI+Btan60zd5D9cbk8gqF/hHo0=;
 b=c2bmuKQZR9V0u9eN71UKY9/5UJdnrkiJV0nyAfePe8OBkjVo+RB/Lk7WiVdyLy7txD
 nMjXKvaZMjfU/oF0Yzdt+p7K+HRcwdppB4YoE9GhupzDfOMM6PdJng+Lk/nEES7EMQo5
 2PC8Y+CQLg51W+oRwJSwB305mwoncUoLS2844uDdaQl3uEBFUCEJ0uSzc9x3edIrE4Ez
 VtN5ecqkAErkl62XoVbSqVBfMf7srzDRGm/oQ9eO5aeg3H/5hAnKtEbBI/hlWVw/0qBu
 xy4le4k/GEz/3GT8O9eqq0lUfhPJL6u3GWyhQF0n7EclqGRI8CvBitq7e9FB9Ikglrvy
 0s7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n9Gp8lAG5kBCP5inyCI+Btan60zd5D9cbk8gqF/hHo0=;
 b=IXKRoROX9dM6ykJ9mQUw4vf7Z9Bxm++zbEaEb5LWU65faxKl+dONj5Mr9fWKG87C6b
 qRUKpcM2qhm/SEQWlLaD7O/aHU2yrqWBAysHLOYIrbv26wmTE0mCfBTBbK+cN5ZN/Vxs
 ANs+i53h/uKTnrxP/k3pHMK/Qz0eVto8Wu3GzeX57lneoZy2wE9hDVdc3lmxq/hiiWAq
 LA55SeQqC+HDyacCSesoL2x0fiRxAnpnLPMv+Xa5Hspl84hROjEqSXfXyzc4AtNmZef0
 j+9YbR3jt6kcZVWWf2dQO78WHvyn4O26rHGXkJ0yV/ODqKLnWMWAzVTi6zeBl2w565br
 xmOw==
X-Gm-Message-State: AOAM531y422eF7+mACNae2AuDZP3vo7JxYP+kQ9rqCK2Melxo5A5zR/z
 Y5XfC4WGAKqZOFTk7Z9aAL8jC8kLZFK7bL48UwAbRmoQDA4=
X-Google-Smtp-Source: ABdhPJyu2xO9A43tw2J+4BaDh1/COSenSJGcIvTsZ7mnyZFF6lR7e5XcDo9e7spiIfMujGpC/1aXyAKk0htWbQSMnzU=
X-Received: by 2002:a05:6402:1383:: with SMTP id
 b3mr9453670edv.100.1622888747912; 
 Sat, 05 Jun 2021 03:25:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210604151745.310318-1-pbonzini@redhat.com>
In-Reply-To: <20210604151745.310318-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 5 Jun 2021 11:25:13 +0100
Message-ID: <CAFEAcA9CVsjatPKoR6F0oO7ADOmAXF+XxHcS=OtpkW3+Z+A58Q@mail.gmail.com>
Subject: Re: [PULL 00/13] Misc bugfix patches for 2021-06-04
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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

On Fri, 4 Jun 2021 at 16:19, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 5a95f5ce3cd5842cc8f61a91ecd4fb4e8d10104f:
>
>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-fpu-20210603' into staging (2021-06-04 10:04:11 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 49e987695a1873a769a823604f9065aa88e00c55:
>
>   vl: plug -object back into -readconfig (2021-06-04 13:50:04 +0200)
>
> ----------------------------------------------------------------
> * OpenBSD cleanup (Brad)
> * fixes for the i386 accel/cpu refactoring (Claudio)
> * unmap test for emulated SCSI (Kit)
> * fix for iscsi module (myself)
> * fix for -readconfig of objects (myself)
> * fixes for x86 16-bit task switching (myself)
> * fix for x86 MOV from/to CR8 (Richard)
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

