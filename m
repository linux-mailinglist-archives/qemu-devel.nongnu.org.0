Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5A46B9F83
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 20:22:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcADU-0000e7-Nh; Tue, 14 Mar 2023 15:21:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pcADM-0000aL-QP
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 15:21:43 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pcADL-0003Xx-3b
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 15:21:40 -0400
Received: by mail-pf1-x42d.google.com with SMTP id n16so4252343pfa.12
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 12:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678821698;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WU4ReylnqheDxq19FOND79achSDBUVZRzCnalq9fVTo=;
 b=DYXSArW1jYbu1c/tP3kEeIR9g3NgRCuvJpdG4nSA8Hl+FznSQ41sIa/HnsiCDf6aMM
 3WdT7VOwtNL1PUy3pcDnFS4CQsvhBAonuMdLqsPa5C17Cj/fPhv3m96FjbjNemWFr8GM
 bJzsATJEgLqBCqX4DlHEzoedOmRh4/MgEO1kw3sK78E0wbR1Xt+mKENozEvOi6cOSGqs
 mJmrCL/shUHEoEbouAfcYC/IVcsqJqwV/ftvRmLYWjqu5VAehPjUdT0QA7ufgGiHCQe1
 DudzhiGxL9JP7CekMhtkItv0Yo5Ak/cRkb8GuiX3t32JA4iWN4uUkJ9YPSO294lPaAdW
 Un9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678821698;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WU4ReylnqheDxq19FOND79achSDBUVZRzCnalq9fVTo=;
 b=WDqcGV3+NQXIMdJmkuPa8VMTKWFaTv+GvrkOvHgz7YkQ2EfQqCph7ou17pMg3TJPeN
 twJ7vG8W18aoWT9RLoxyeOWSFaHntCOgIYyVYHyz79XuN0nRpbZEltGbnAWCSpp6ksSI
 PeRCztMd5/GbtTkYxwWUp5YF8sLBg8Kp+4fWpSXtnFRykY2nkk2Xxlwm40s/ORjc9Mw8
 iLo0ibZcjeMceSpcFFTETz+l6lm4bsXsjAbVuA21YGZi4vo00/hYwZUDs5V4lMwG0RxF
 EHah8mJ3Rpcmss4F62Mx34Vo5q6ba60MuZGjeRx+EDye/4zxTHTnoPYBn2coRyN3MYgL
 MJGQ==
X-Gm-Message-State: AO0yUKVJN0IYQtlCfdaPnSIGaC1gckWvTtM9grq0zMtH7QySKgLbEbS6
 WA/dF0wstByJ4u3cwLtWaAmxLwSVNb+t1/AhTWwAAStkuOF86aL8
X-Google-Smtp-Source: AK7set90P8RrfnLe3O4+oJupm4aNZF31uvme/CKlQsLM0qbIoWM2sOl5i1HXNA5G2f8MPvb4rbifuTYgM0myLPASBKw=
X-Received: by 2002:a63:5904:0:b0:503:a26a:2e7a with SMTP id
 n4-20020a635904000000b00503a26a2e7amr13556342pgb.6.1678821697451; Tue, 14 Mar
 2023 12:21:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230314063812.30450-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20230314063812.30450-1-alistair.francis@opensource.wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Mar 2023 19:21:26 +0000
Message-ID: <CAFEAcA8S4EPc=y+8BXxwfFZQP6k0=Bvmfm6=iMaH9yujsht++Q@mail.gmail.com>
Subject: Re: [PULL 0/2] riscv-to-apply queue
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: qemu-devel@nongnu.org, alistair23@gmail.com, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42d.google.com
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

On Tue, 14 Mar 2023 at 06:39, Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> The following changes since commit 284c52eec2d0a1b9c47f06c3eee46762c5fc0915:
>
>   Merge tag 'win-socket-pull-request' of https://gitlab.com/marcandre.lureau/qemu into staging (2023-03-13 13:44:17 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/alistair23/qemu.git tags/pull-riscv-to-apply-20230314
>
> for you to fetch changes up to 0d581506de803204c5a321100afa270573382932:
>
>   Fix incorrect register name in disassembler for fmv,fabs,fneg instructions (2023-03-14 16:36:43 +1000)
>
> ----------------------------------------------------------------
> Seventh RISC-V PR for 8.0
>
> * Fix slli_uw decoding
> * Fix incorrect register name in disassembler for fmv,fabs,fneg instructions
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

