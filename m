Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DB53FEC97
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 13:01:01 +0200 (CEST)
Received: from localhost ([::1]:49056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLkSp-0004jy-Ky
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 07:00:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLkQQ-0003L1-9X
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 06:58:30 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:46649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLkQM-0007WL-OR
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 06:58:30 -0400
Received: by mail-wr1-x431.google.com with SMTP id x6so2195018wrv.13
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 03:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DJTBI/22baRze8QybYSZcKlDyWI60cwjnCON6Z/rSFc=;
 b=zkU8/LnKecmzwFuIDu/riQjIrDCFvMTFP/J8Cz0kx0fIXTh1clj7UZXXx9RgmvA79r
 4udrzjLor6nSUqTKs5I1tsFhZMynIp37kzYvEW6w7QuEz8WnUC50rXOc6yFwy4NlRzle
 FglLGs0xJCx7OWLllfaXvnYvO2DT0c+1jBo2ys30+5abZmL9WExVfiO0/o+jwfCcXVeg
 Gxt32ELyVnDRdEaio89WENt93txzhHXU5lpXGgI7bKG0NrC8ulvST5f6/SGQcazGM5xh
 RGiJEnhwUbh6p5uBmskPRteKSsYTEyuYCEZjdYlEVx9Od6XTj75arZRtpbwdCtt4fTy/
 f/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DJTBI/22baRze8QybYSZcKlDyWI60cwjnCON6Z/rSFc=;
 b=t7Qlj31aU1vtk4VnryiQ4ldbhj9ii7ba6Xa4Duzjz1s2M9vGEuX7tMetnCy4tyGZAc
 Pho/kfnupcJmXWN0EqX0TwHzAJmBYsqlTWg6Vp7TwwzLIEdbCtMX8reOAm5k9yvbW42D
 izfbx3ihNAhFdCCkjsYoAIZ8JpF3jQ+ZexJ3iss+TNrOZzqMxLfHw8MWOtqdPOvZN1Hg
 ErY7rdqri52RNbeF4oCxK+OiWBTXQVog46XLZ0uQukNFja6sJGtOSUw8DZPdEdwgHt/s
 smweYzW/OF0W0fPNQdEA/qMGHVNt9MV10tqw27yMwKAtPlmpkrN+ikjJmPllnpe/fNSK
 cUlw==
X-Gm-Message-State: AOAM533dzATrenwYIdGt1n45OcQYLRrS7FBblmQZ76cDjXUWh76CXz/D
 VJwNPkON+HwFZI3HxCIIjSBdbK/RNviZ+L35PSeHYA==
X-Google-Smtp-Source: ABdhPJxGWFoZroOFklD7F/bJfgY5E8JGwMDNu20QLuaYoD/Ob20US+cZV0vJJLD6j3iMG956TNFAPzrltFleqctAyW0=
X-Received: by 2002:adf:b748:: with SMTP id n8mr2948003wre.133.1630580305159; 
 Thu, 02 Sep 2021 03:58:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210901122143.1867023-1-stefanb@linux.ibm.com>
In-Reply-To: <20210901122143.1867023-1-stefanb@linux.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Sep 2021 11:57:36 +0100
Message-ID: <CAFEAcA_Y2znUNQDeuNrKE=PT92wTdPchcQt_PGe1iRddvo6FuQ@mail.gmail.com>
Subject: Re: [PULL v1 00/10] Merge tpm 2021/09/01 v1
To: Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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

On Wed, 1 Sept 2021 at 13:22, Stefan Berger <stefanb@linux.ibm.com> wrote:
>
> This series of patches adds an ACPI test case for TPM 1.2 support.
>
>    Stefan
>
> The following changes since commit d52dff5d8048d4982437db9606c27bb4127cf9d0:
>
>   Merge remote-tracking branch 'remotes/marcandre/tags/clip-pull-request' into staging (2021-08-31 14:38:15 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/stefanberger/qemu-tpm.git tags/pull-tpm-2021-09-01-1
>
> for you to fetch changes up to 75539b886ade79a30365badf95831bd5b3068342:
>
>   tests: acpi: tpm1.2: Add expected TPM 1.2 ACPI blobs (2021-08-31 17:33:12 -0400)
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

