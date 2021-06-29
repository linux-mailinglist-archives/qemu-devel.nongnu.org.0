Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF5D3B70EB
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 12:44:54 +0200 (CEST)
Received: from localhost ([::1]:52538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyBEb-0000TK-59
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 06:44:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyBDo-00088q-Gs
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 06:44:04 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:36728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyBDm-0002Bs-M2
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 06:44:04 -0400
Received: by mail-ej1-x62e.google.com with SMTP id nd37so35608328ejc.3
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 03:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jd2woIm6gqndv7xNCSSLp31F+lGyYkcfMNV7/8kPFNM=;
 b=cz1ilR+mKpCJ6vKcNk8t1E0JJb6jlHOV+ch//S1R1lQpl3XAXT6ZYyWNntI3wkAaTn
 kcnexFtYztZcLekNgAhGvhpqwr1hRW+068ln1Aptjsco+JWM+VjUD4nqjGVPqpGmHlyQ
 Bt6S9pbOBoSmjqucR/cs+TCm0Nym21mBzLyLyQjgCwHnnD2LhpPJjIsOIkbfq3FQUs9N
 bK8E/1OCdgXaNxVA55At7wZZH6G0srR9ozalTpG9v8ZcDjHVU8I8q945Sc0572QK1P+2
 I+yhUDTRF6NMTZg5/AC4+1OI7/jhFnrknO4/vEQ3a4anwHgUUmAO/laZIWauQ1xa83HX
 z/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jd2woIm6gqndv7xNCSSLp31F+lGyYkcfMNV7/8kPFNM=;
 b=LD+iRGkmU9hcDMX5mbKJmqJ0lxr6hDAIbhxRPdv2nUNFlLOeKF2IXw6Lx6gygg3+i2
 pbBWTUEnlcumv3Z63PrBcU0OY9VtYtVHZ9hLci2iGLYRbkdKnxdbiFxTypSpqczO5xPc
 /YRHEeXPlFAE4xVXY6De2t7XByyk/uQyul646AN8SmPG5uqrMmVCsvMTGa8+57da5dhu
 86EGtuLQRUeMr6lEYUIYQk4MGGMohPV1JawvtjJ1nta4X7oSwgWIAmlo0ZKfmoiiV+ab
 qtgImoA01isgHuC2wnr3bWP4aX0UJZG+6ws4zUflkMXxA9F/AjG+UIky7u19tX46+Ep0
 bW9Q==
X-Gm-Message-State: AOAM532NidaXJ/9TPDkMBIcjjLIb5G+bamiAA+/C3le5XQRSw47cWx/n
 IJHMJJs7dssaQhNL6BbchvztvcHDVdvyyjms1xLw+w==
X-Google-Smtp-Source: ABdhPJyIpfabgXJhBFtP9k1FhxrQboeZDiq43X8zVc5UGTUyW8Jq+NUuwlG6rKYXoHxdgN9pdFtSqL1BAEt2l2zpQmE=
X-Received: by 2002:a17:907:a064:: with SMTP id
 ia4mr29582442ejc.482.1624963440480; 
 Tue, 29 Jun 2021 03:44:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210628143551.2870006-1-richard.henderson@linaro.org>
In-Reply-To: <20210628143551.2870006-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jun 2021 11:43:23 +0100
Message-ID: <CAFEAcA91gR47tejFs7e0OoeSF=aYvEM70M-XSbprqiTtfanaUw@mail.gmail.com>
Subject: Re: [PULL 0/5] target/alpha patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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

On Mon, 28 Jun 2021 at 15:35, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit 687f9f7834e30330fd952f1fe096518509ff8ff7:
>
>   Merge remote-tracking branch 'remotes/philmd/tags/mips-20210625' into staging (2021-06-28 09:44:42 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-axp-20210628
>
> for you to fetch changes up to 9d14a0428012b0bb7969aec512f2357247a86236:
>
>   target/alpha: Honor the FEN bit (2021-06-28 07:27:55 -0700)
>
> ----------------------------------------------------------------
> Fixes for NetBSD/alpha:
>   - Provide a proper PCI-ISA bridge
>   - Set PCI device IDs correctly
>   - Pass -nographic flag to PALcode
>   - Update PALcode to set up the Console Terminal Block
>   - Honor the Floating-point ENable bit during translate.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

