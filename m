Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4618575F30
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 12:12:59 +0200 (CEST)
Received: from localhost ([::1]:35920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCIJe-0002Cy-Ej
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 06:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oCII3-0000pR-Bg
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 06:11:19 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:38582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oCII1-0007uz-FN
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 06:11:18 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id i206so7716232ybc.5
 for <qemu-devel@nongnu.org>; Fri, 15 Jul 2022 03:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i8L5NYF8g2iJbwNjIZeWaChmXdY454oKHqcmkyRlYEI=;
 b=UEVUFIVc1W95pouPIgiViwJpjfy6tvF+xF/KwI+8umFp5lVE38RaJvaBYEzq05GMx/
 bPnxig6ZL5xCWDPqPMb2+SQjnQFKrf91nI98UQmgPNkwguJc7D2SWZHRFBpUaciT0oz7
 AalODG/w2CZ/Q98VQostBY1PKuwwDUzKGy+HeQjxUk1H+baIlhPrSWX+PXEWh34pQlSe
 8jFrshyet5CzkSPYvAWWbNYF0wk5S1L6CrwQWiE696zoS+ElUEYH869z3W4IxB2FRXiX
 iS/1raPYCvhbyxwCZeIfPczOGnVxlcrtgoF1xgImnL+mTSJHp/7yOAAQPDP6Pu2LKITq
 c82g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i8L5NYF8g2iJbwNjIZeWaChmXdY454oKHqcmkyRlYEI=;
 b=YBMjCxSVFmZuZp+86ZcaLXVvFV00UpbYE9zXHkTqrtTyRZ6rGMXqEqhidZ50medMM0
 M48FEXnJEpFRBS9METHZQYZH88G574IE8pV0ZF0IZVx5fRE6TuNlhCT7g1SE+dnjT3SU
 jFtZLc/M3Lb3+aRCI8evxLvqROFwOg8+vT4YGpNLKKZ9iiS0v9ecFbdJTVljKiVpFTLk
 htr8JcKoRCvUDjvycYN0r/7Rv6v/3/jN4ZzR5TYxgXBp92cMINPpv/xp5hFyHOivhY3U
 4dtOrnCA/H4Oe6EBvlbcvUCsbUWHHQ6B5Yn/Zx/WB0aM03e8i0jVJ5+hzWRXy1BEBVk1
 5Kbw==
X-Gm-Message-State: AJIora+7gWN+gLJ/jF6GITs5VJ9xTJ5YNHLWn73vxT1xCMhRdbKBJhjZ
 MxtIUe64+FYGabpDHWNlfbgvfruLVpW8dB5t3xEO4g==
X-Google-Smtp-Source: AGRyM1sJV32MujzMB6QgNnOw+EkxqoyIWyQwK3mj+2O4JE0Fp0lRg+IGq/cZUaKwYN3rrBCzxwOicCAjDLbLFgtgNcQ=
X-Received: by 2002:a25:bfc7:0:b0:66f:563c:d2e7 with SMTP id
 q7-20020a25bfc7000000b0066f563cd2e7mr12945196ybm.288.1657879876389; Fri, 15
 Jul 2022 03:11:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220714090211.304305-1-pbonzini@redhat.com>
In-Reply-To: <20220714090211.304305-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jul 2022 11:10:36 +0100
Message-ID: <CAFEAcA_MPQ3LGW+1vp=nL4nLQ784qeRQLHem5Bp+=6pRQ0mBJQ@mail.gmail.com>
Subject: Re: [PULL 00/20] SCSI, build system patches for 2022-07-13
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 14 Jul 2022 at 10:14, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 8e3d85d36b77f11ad7bded3a2d48c1f0cc334f82:
>
>   Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2022-07-12 14:12:15 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to c0b3607d5938f5ee7fd16ff1e102afe938fd4b39:
>
>   pc-bios/s390-ccw: add -Wno-array-bounds (2022-07-13 16:58:58 +0200)
>
> ----------------------------------------------------------------
> * SCSI fuzzing fix (Mauro)
> * pre-install data files in the build directory (Akihiko)
> * SCSI fixes for Mac OS (Mark)
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.1
for any user-visible changes.

-- PMM

