Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB3E66DF33
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 14:47:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHmIQ-0004m0-On; Tue, 17 Jan 2023 08:46:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHmIB-0004h2-0S
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 08:46:23 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHmI9-0004to-CW
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 08:46:22 -0500
Received: by mail-pf1-x42b.google.com with SMTP id s3so20959391pfd.12
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 05:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=c+jFfAOifm3pb1BL+sMlYdRXDLpW3TylbRRklTfoANU=;
 b=Bt3n5QYOuszyffbSlQxSWZYyeP2pbp94afJLvilVKk1zIhyXb88+AYliKh2a1kOJKA
 8MKTpoUSlt0MAN75i6444TN8Zbwag/e/KblKpCqbfIuPL+ADkEDpPd7VaIygmGk2FLhG
 MjTDw5CA1kuPE3UOiqauvPOmyj/9pjt+j40d7AMdo/MZb8vl6Vxm7D1ycS0BTMMGxBW7
 o8SMnM1DKKVnpX+5uCLjFjQFTYCbxFvrSIHNcTbg2EPuyLJwZf3ihMAOD4UJLB7VtH/3
 yv5d+vMp9pZ7ozHwHxHWI7j32MeoBb2j0j0pGOfWWOaNgLn51sUckV4t/LEJl49BNhke
 rw1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c+jFfAOifm3pb1BL+sMlYdRXDLpW3TylbRRklTfoANU=;
 b=UbdExSBy6idE6Id0QEDKUlBwJQrrdCNdUErijFpSCjZfnPgp/jTOZgIrPDeT66/sDN
 8v/onBO/Gwof0jL0911Y4CdknD7Bh6sDkUSd4HgY5CRORz+uUtjU1uYyjJLpfugIKy4g
 luxxSjxobe5fGM5xNZ/SBL7ym5fvX9h8LNEkj11EeBLJPRG7s6LkN9Afu+a2rl39iYrN
 VtpvgAY+U3O3hNHsgg/Q64gCESOzA30liIkw0K9wtBEjCa/1IduU79hKA9dXU+B2g2U5
 JGhjr0r2h6I3nXNWUB9znbfxnwhRojcsofG8TZcZEivFTKfGNkmGkErRVFhmCIa4YhW2
 6zzw==
X-Gm-Message-State: AFqh2kq5ybnlq/HyVXOHvNC1oFbyWbFdu2zqU6zU7kBA30wH4iwZEf7c
 sGFfoatQfFfVKEGqMB4GzZRxYHrThrl3L6Nb98pNyw==
X-Google-Smtp-Source: AMrXdXvpgsBm919ZmBcZQDxIJlk1DOSqFDyAwc1AvG96ASYFh7u1JuWK7VRou8lr6NTMDsIUfkQbN6ubA8hfvMPQgbM=
X-Received: by 2002:a63:1005:0:b0:4af:9f91:54d1 with SMTP id
 f5-20020a631005000000b004af9f9154d1mr154206pgl.192.1673963179837; Tue, 17 Jan
 2023 05:46:19 -0800 (PST)
MIME-Version: 1.0
References: <167330628518.10497.13100425787268927786-0@git.sr.ht>
 <CAFEAcA_50YsaEZ4KX5T6r01y8sFJZZ5fYccF9kBJgL+_epbTGQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_50YsaEZ4KX5T6r01y8sFJZZ5fYccF9kBJgL+_epbTGQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jan 2023 13:46:08 +0000
Message-ID: <CAFEAcA9Jyq97b_0aTgDa+bgaYn9DgAFcyPtt_FwShgFe4QohmQ@mail.gmail.com>
Subject: Re: [PATCH qemu 1/3] target/arm: Unify checking for M Main Extension
 in MRS/MSR
To: "~dreiss-meta" <dreiss@meta.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 17 Jan 2023 at 11:35, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 9 Jan 2023 at 23:18, ~dreiss-meta <dreiss-meta@git.sr.ht> wrote:
> >
> > From: David Reiss <dreiss@meta.com>
> >
> > BASEPRI, FAULTMASK, and their _NS equivalents only exist on devices with
> > the Main Extension.  However, the MRS instruction did not check this,
> > and the MSR instruction handled it inconsistently (warning BASEPRI, but
> > silently ignoring writes to BASEPRI_NS).  Unify this behavior and always
> > warn when reading or writing any of these registers if the extension is
> > not present.
> >
> > Signed-off-by: David Reiss <dreiss@meta.com>
> > ---
>
> Hi; it looks like you didn't send a cover letter for this patchset.
> If you're making contributions in future, if you could send a cover
> letter for a multi-patch submission, that's helpful because our
> automated tooling tends to get confused by patchsets which don't
> have one. (A single standalone patch doesn't need a cover letter.)
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Since this patch is OK and not really related to 2 and 3,
I'm going to apply this to target-arm.next. I've left
review comments on the other two patches.

thanks
-- PMM

