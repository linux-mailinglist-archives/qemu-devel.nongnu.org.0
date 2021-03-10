Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 678A63348B0
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 21:13:24 +0100 (CET)
Received: from localhost ([::1]:34808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK5Ct-0008BV-0z
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 15:13:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lK5BI-0007IT-T2
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 15:11:45 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:39215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lK5B9-0007Mo-CI
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 15:11:42 -0500
Received: by mail-ej1-x629.google.com with SMTP id p7so29913940eju.6
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 12:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PajkNznzSNYEQVoSPFeh0UBHz82mSmrHWSvtpcXYTsY=;
 b=ApzzWiohztuH4DDjvuxaf6/59ysjhrmEpIjf4vFjeWL/eBPyBOgkjb+K4yz2Df7fOe
 Cuew4rO5ZDrE9lhyyATNMtpwGrRLOIJ2JEGl0OjiNVpBuo+2e1OOiMRe8z0ctxqBxQjx
 D0z03fVtobWTUpYy3p2a5f5F8HJYoFXv2DNfBW6oCGUNZMDifFY7CcHXebooe6pKqP4r
 +ZKfPNWHvkVFK/olbePEmUARBS6cas+D1nVWakQnqfr1vkIdI+WGXjetE7LFDit0W0ND
 Dhz8Kll2umIamU9vw2wqpqwwk0ZUVxfkUxRlARE0PoRaSOGHS/hH2VBRqj4Zt1kpRM0P
 E/sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PajkNznzSNYEQVoSPFeh0UBHz82mSmrHWSvtpcXYTsY=;
 b=q48xJeqtgYHXPZaebYybxIU/jYe/wDgpUHxfLdTfX6ho7g8GlsB7Filt1Qp3a6+ZV3
 9EgaxC5ONyDt5ae6An5DQhLyVf+6mTtZpkXXUaqYFMdA+X8GFCuOvDwvjd5TtNj1hXR2
 QWsNfa5cBSeAVN09EYZMg57wpCtmElgRv34Yx+J4xCC9YHH4K/IVzSqz1HieI/vrUL5G
 0uvf6SFLhELkVorBGNA0V/99RBin5P0PcaX9nELexGiRtDEVp/Ml5nTdPt4cchYNH5We
 k7+zV5avsZ7ElXLRJrwUomJGtdWI1Nm/btRa9EH+XSalPSkJQlYwUjL9iSrZKUPt7bDD
 5udA==
X-Gm-Message-State: AOAM5319nbmKTByHaRW85TGSTcSfcHctlPtRgSw/8LQJENhMgY8Detw4
 OEetx624lDwM9JHIOUV8Ucf6fbyl63SLKtgSeMT9DQ==
X-Google-Smtp-Source: ABdhPJyI04oEEjj6k10iY57+985VW/ihNA1KM3WB5kMc3SdA68t0q1WNSX22IKMkj2OYIMuy+5ZkolWZgqL4N2dLT44=
X-Received: by 2002:a17:906:b14d:: with SMTP id
 bt13mr139371ejb.407.1615407090511; 
 Wed, 10 Mar 2021 12:11:30 -0800 (PST)
MIME-Version: 1.0
References: <20210309104617.714908-1-thuth@redhat.com>
In-Reply-To: <20210309104617.714908-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 10 Mar 2021 20:11:12 +0000
Message-ID: <CAFEAcA_0prebLG7_xZmqaWh8Va8f-iwBVMqxg9=v+XUKmB2B=Q@mail.gmail.com>
Subject: Re: [PULL 00/14] Gitlab, testing and misc patches
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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

On Tue, 9 Mar 2021 at 10:55, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi Peter,
>
> the following changes since commit 229a834518b950d56fd1bc94923276504d0ee9d4:
>
>   Merge remote-tracking branch 'remotes/philmd-gitlab/tags/renesas-20210306' into staging (2021-03-08 15:45:48 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/thuth/qemu.git tags/pull-request-2021-03-09
>
> for you to fetch changes up to 65a9d3807e9a0ffd9f9719416a07be41b6f39e94:
>
>   bsd-user: Add new maintainers (2021-03-09 11:26:32 +0100)
>
> Gitlab-CI run can be found here:
>
>  https://gitlab.com/thuth/qemu/-/pipelines/267522743
>
> ----------------------------------------------------------------
> * Add some missing gitlab-CI job dependencies
> * Re-enable "make check SPEED=slow"
> * Improve the gitlab-pipeline-status script
> * Clean up inclusing of qtest.h headers
> * Improve libqos/qgraph documentation
> * Fix downloading problem in the acceptance tests
> * Remove deprecated target tilegx
> * Add new bsd-user maintainers


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

