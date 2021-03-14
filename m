Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3D033A72E
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 18:49:10 +0100 (CET)
Received: from localhost ([::1]:50254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLUrU-0003qQ-Tk
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 13:49:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lLUqK-0003Nz-Gz
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 13:47:56 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:33291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lLUqF-0005TW-Id
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 13:47:56 -0400
Received: by mail-ej1-x62f.google.com with SMTP id jt13so62543328ejb.0
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 10:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3+QmsP0VcbmkczhOD7sDCX5xFuEMx0CTdGonlU03rHE=;
 b=Ae6Qx+jJkMo/Q1vd+9D5kyRTKL6126mAWH21BBuPQCbhZbVbPxxmzF5ov/37KR4SsA
 dok/fmTPIfm+YBq6Yz/NXmr95udXaRhRvmwqMbp2PCYJmEnMqy+zpgbbzRBV5x0gU+jY
 X8Lp9yLRKEFbgptXKRiXyHISOjZYYHIE+cBTDux6sx8kf3ffIf/h79GEqHVQ7IlCrtUW
 VQeT455/DasSl880sLP+/NgocgNrlC4/5hgwkGimqdlFFcKMz/aI09RvSEzY44zvwLgT
 cArsMgeLF/Q2bttpNJryhm52a+dGAWA61KV2E2E4t0ZU/LnDM/R8E9arHZH04HCatkC0
 1NQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3+QmsP0VcbmkczhOD7sDCX5xFuEMx0CTdGonlU03rHE=;
 b=KgqNalccPN1U56cupr9XWDINijaLpgRVoFtHVoICKl70jwlFQ9oOHF1nHHPw5dx8uO
 vp8J2kFoWF5dSOL8RsPBU01YRYPffmvmWhWXzQviGDMte6/mD6Bqs8IDXQ2d43B1hsow
 JDJyZ+iRN9ZeJPSIJSzUU1+C7ZEkaNcPljwztKmYVQ0+b0XrwgHEWLIyblifj/0TAtjt
 wZLxCON7KnKl72KfUsVOQTndIr0BIoUkp4IwoJEvSnit8WrVq420IQG4slneG33DzcDT
 o9u3MZoHm1Yr3FTQguw41dsxSOcj5W5nsQMLAodjm1InR6rh9lnHCrng7wL3DxFPI/kJ
 wGGw==
X-Gm-Message-State: AOAM5326OiMJlZUXB9tMJU4s6RgmbXdQaGgXE9ISlU8tgPMwusg0eXsk
 psAXj0VeLV2/N99v5q/djJ1NxPRbKr8wsBXFei9akw==
X-Google-Smtp-Source: ABdhPJy32DB3RaRCTpDMOaoHiZgDAeViBH7eBtZeOwEqCh0iQphd5Qec7m3h73HGhehrW0eYe7H4PhpgbKAwNxyxRzs=
X-Received: by 2002:a17:906:c301:: with SMTP id
 s1mr19223823ejz.382.1615744069666; 
 Sun, 14 Mar 2021 10:47:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210312172356.968219-1-thuth@redhat.com>
In-Reply-To: <20210312172356.968219-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 14 Mar 2021 17:47:28 +0000
Message-ID: <CAFEAcA9_O0n1-_N+eaiiEgcO2n5mO8OKyhXbwM+Abbte0k_NTA@mail.gmail.com>
Subject: Re: [PULL 0/9] Gitlab-CI, tests and docs
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 12 Mar 2021 at 17:24, Thomas Huth <thuth@redhat.com> wrote:
>
> The following changes since commit 363fc963054d8e82cfd55fa9b9aa130692a8dbd7:
>
>   Merge remote-tracking branch 'remotes/legoater/tags/pull-aspeed-20210309' into staging (2021-03-11 11:18:27 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/thuth/qemu.git tags/pull-request-2021-03-12
>
> for you to fetch changes up to 33bf47291ed575847d7de26b503c50e72f5aa6c3:
>
>   README: Add Documentation blurb (2021-03-12 15:46:30 +0100)
>
> ----------------------------------------------------------------
> * Move unit and bench tests into separate directories
> * Clean-up and improve gitlab-ci jobs
> * Drop the non-working "check-speed" makefile target
> * Minor documentation updates
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

