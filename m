Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F2240CBC6
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 19:37:29 +0200 (CEST)
Received: from localhost ([::1]:59614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQYqe-0005DY-1S
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 13:37:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQYow-0004V3-OL
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:35:42 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:45814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQYov-0008Pd-3a
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:35:42 -0400
Received: by mail-wr1-x429.google.com with SMTP id d21so5086216wra.12
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 10:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gSLuy7VhdwhZNrcCEmQYbRw3DlmGyIuJ0TFX16j/o9A=;
 b=E/lk3dZkP+GCLh62NDc/QvJuWeiKUV/1Ywlo3XoOMQTblnUOcTcUx6kw5YejVJOuR8
 bmclPai1VhBVTXNAjNUyx74wfkbyEXgqfT4pdrhXMT5BR37ey9m+kK7LVl7+qrmYjNBH
 b/v/61dcUX45Qzrxkp9zkGxUsANkE+crkX2UilO0Ld0RhvvmHQGTTMVMb8MuXumtpglq
 N8EDLaSXdgD2R1eFbHFIVhb7sD2i9H+9S8u6F53cnVma/h+fmNFW0ctwP5pvOj3jKPEC
 sgJoNC+vBildI6i0ZCwrqCnscvuZlrOKZeA+chIjWJXtUSzCsgIth0KPwaGtiM1L7/uE
 Yyxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gSLuy7VhdwhZNrcCEmQYbRw3DlmGyIuJ0TFX16j/o9A=;
 b=g4t6X+cG1wGjEl1UmfSZcfZS0d/TdWS3gZNGo1gCN8yVQxmexrMCcfPRhzP+6Ywhhq
 R99wOCSIfIjvUAU7CF3bCs/vhVBrFFDJS+ZG/lz4is6MybGB59go0VzMIEI9QNExV4ro
 Dg95dzfi6QgyDr9qTsuUwpkq2XweuFgqCpc7S4U22XjxTAkoTEcNrS5RnJ7+I7hmfNOt
 GB//tVA/tX+O7hR49SjQ5uj2QMN4dG2EpYFIyjCKbP42UQXlwkb/i8Vr221CQPaJvLQv
 4BjuaaqZtK/CiF/obBHXVc1djkT7AE3k2Tzk8bHUgPwE5/qHMXzFxGkn+4U/+F5Nn7VB
 BTqg==
X-Gm-Message-State: AOAM533g4ii0IZJYTeSly5PMc8skyE6MGR9qHUA0SNG7Du5O+REgKs5v
 rhTpqzhkGYL0WO5D+EcNA7knl/sr4SyINjZO2HOHPQ==
X-Google-Smtp-Source: ABdhPJzwSrcL0HzD+VIKmpiUWFAeX96waqj0VHLRJlsCHQ40Q6cFGJSvVo+RNXGWYjYHvAfv+WtiR21Pklx99HvVV3Y=
X-Received: by 2002:adf:fd12:: with SMTP id e18mr1318846wrr.275.1631727339290; 
 Wed, 15 Sep 2021 10:35:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210915164329.13815-1-pbonzini@redhat.com>
In-Reply-To: <20210915164329.13815-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 15 Sep 2021 18:34:48 +0100
Message-ID: <CAFEAcA_6kdWX37d+Ak6nQVywE6f_4sGYvQZ2_H3+9ONzi7HJeA@mail.gmail.com>
Subject: Re: [PULL 0/4] Update meson version
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

On Wed, 15 Sept 2021 at 18:14, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 831aaf24967a49d7750090b9dcfd6bf356f16529:
>
>   Merge remote-tracking branch 'remotes/marcandre/tags/misc-pull-request' into staging (2021-09-14 18:14:56 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 3bfc2d0b71a59e17b886769d56bef2771701f4f0:
>
>   target/xtensa: list cores in a text file (2021-09-15 09:12:55 +0200)
>
> ----------------------------------------------------------------
> * Update Meson to 0.58.2
>
> ----------------------------------------------------------------
> Paolo Bonzini (4):
>       meson: bump submodule to 0.58.2
>       meson: switch minimum meson version to 0.58.2
>       hexagon: use env keyword argument to pass PYTHONPATH
>       target/xtensa: list cores in a text file

Was this intended to be a pull request ? AFAICT patch 4 at least
has not been seen before on the list for review.

-- PMM

