Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D6E35AEF8
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Apr 2021 18:00:07 +0200 (CEST)
Received: from localhost ([::1]:49094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVG1m-0007Gc-1F
	for lists+qemu-devel@lfdr.de; Sat, 10 Apr 2021 12:00:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVG0f-0006hR-IZ
 for qemu-devel@nongnu.org; Sat, 10 Apr 2021 11:58:57 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:39532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVG0d-0006gP-Tt
 for qemu-devel@nongnu.org; Sat, 10 Apr 2021 11:58:57 -0400
Received: by mail-ed1-x52f.google.com with SMTP id g17so9224098edm.6
 for <qemu-devel@nongnu.org>; Sat, 10 Apr 2021 08:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=91IsKkgwxzRCy14df9bMruJdMtOp7U7Pa19pPWFGPKs=;
 b=PDbInU7Lvyx4mDYmstyIVetnZMHlIYCpgR9/a6W+hRoqfh/WgMK11Wz1yE/2CvrZ5t
 aCL1UPOnKiiHYy5ZmAIJczcrRgqWc9ezUidbff6djhkHWNdVf1GZ1erFKhHMFgAeyjHh
 e4nhdkH1UC+moJ493SjnAwWYz7HopvsebtfLKeCsLvhEIabx51tZa+yG8PbER2SpHVZT
 3bBp0clgPhn3ORxx15I42Sn+MipW6cvW8rZWUiqMlsixKn2CChWhsAvvb5lYAx6yDEZ4
 p4mv4XbEkGV9hdFRFbswvK53LNrSrBzj/Z3BmonGmCb2hJ1h5FdhOn6UpiUjOjLmOFgd
 q4cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=91IsKkgwxzRCy14df9bMruJdMtOp7U7Pa19pPWFGPKs=;
 b=jek6u0XV0GWNYEElasQQmay3lp9F4zPiUw4t4puFGp5c5g558okHpPt/yJDAsLzAo8
 D3/nJ7ofCdgrAnicrqvU4yaggMioq83++v4EJAsS4WutVDMXcjSe0oWTy3mlKgtmVJrV
 rayvQybNCEXmCnes+KRZTNbpOIqCkMPdSfRjSkQTAQDo9+MjsADcgy48qfe1WKFMFPlM
 0iP4n8xLyCjSpFys4NhHNmZ1g7CpvFztjesMzaNd29cBBLV/BkwST9imrBjYjXFHiswq
 qyYQxglSb6y8k6bbBq/xFEO8CApYAqGlohShPiwdBUcrScaLlIJZWPU7KDez9WibMCxC
 a10Q==
X-Gm-Message-State: AOAM531H8k2gE4zUvYJaUg6wulWQk9SxVFJlqRNfexcPRziOQbtr7N3o
 K2OXG3QMi0nx1M6nN5AIbJEbmwXFdiVqbQsYMA7jfg==
X-Google-Smtp-Source: ABdhPJxCdlDWtYlAfPehzRn1NBzefpi8V7sTZz3nGMHj1sSYAIokMYb/HmdmXT3YERdzVt94s3ddaMRVH6D/ScO8TZg=
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr22080341edt.36.1618070334653; 
 Sat, 10 Apr 2021 08:58:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210409161548.341297-1-kwolf@redhat.com>
In-Reply-To: <20210409161548.341297-1-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 10 Apr 2021 16:58:12 +0100
Message-ID: <CAFEAcA8n2PyfCdqg7n=Bu2fhuFZcBtJZMKrbuZ1xLO-JP7KjJQ@mail.gmail.com>
Subject: Re: [PULL 00/10] Block layer fixes for 6.0-rc3
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 9 Apr 2021 at 17:16, Kevin Wolf <kwolf@redhat.com> wrote:
>
> The following changes since commit ce69aa92d71e13db9c3702a8e8305e8d2463aeb8:
>
>   Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request' into staging (2021-04-08 16:45:31 +0100)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/kevin.git tags/for-upstream
>
> for you to fetch changes up to c2c731a4d35062295cd3260e66b3754588a2fad4:
>
>   test-blockjob: Test job_wait_unpaused() (2021-04-09 18:00:29 +0200)
>
> ----------------------------------------------------------------
> Block layer fixes
>
> - mirror: Fix job-complete race condition causing unexpected errors
> - fdc: Fix 'fallback' property on sysbus floppy disk controllers
> - rbd: Fix memory leaks
> - iotest improvements


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

