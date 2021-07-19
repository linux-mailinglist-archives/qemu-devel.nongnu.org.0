Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C793CD595
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 15:15:49 +0200 (CEST)
Received: from localhost ([::1]:38614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5T7c-0002Gd-M6
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 09:15:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5T5u-0001XC-Aa
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 09:14:02 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:40943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5T5r-00018b-0Z
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 09:14:01 -0400
Received: by mail-ed1-x529.google.com with SMTP id t3so23854929edc.7
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 06:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4/CPCpP4sLiMk6e3L7UkslrAVp3Rw8PJd47mWYby5yM=;
 b=XOIFRfdsP8avldKPtKMYQZd8JtsI+LivRI46Wdg/gjEs/pMCWKS8XpVdHpJovLPO/X
 azSrWLz1QBWSQNqLoQuSVCXpxrPZLen541xXxxUIe/6v8FHeHe5yGDyqNmHC+r6466y9
 RbnbXrnt1EhfrpGo43C4jpeuAfWfbKfiqf8gmFWrsbSa/LgQtu6a5DvE/++me82arsIe
 ZGQs3DwigbX9OfHpKZTLIgIiL7yfRiZgAP8a0IpVcJrKUqpDNVl2Yqi67LzrLmvibpX1
 L34tzpE5WAXydJvDRkxCSdtU8C9jIYetaA5g3zPh44Jk1mclrFmtV5FGa3YBaD2+vEk1
 CT5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4/CPCpP4sLiMk6e3L7UkslrAVp3Rw8PJd47mWYby5yM=;
 b=B2VKINuLFyYw0zn5uimghnxs9iMvyJkWM0DBVwFExeBwK+3BCK0A+4IivNDtAJOblv
 eVh68h3dy5/QicmS/LKoMkd6iibFauTvSmsOdS+KtSdcoXz4JoNIU+nPu6eiOFj9Axmn
 quNWuMQjqQV9+waSvMBiWuxJbTAiTCXbD7VtyCtTlrdkGw0eFOPapTdLagpDzrmXdEP1
 Thqz/fJn+eqw/mXKMcHYtIISfpUC7YjzRbn2lMyyEqRBe0jH0kP0afdHyCq8AJa6usDe
 x3DYcLuVo98lzzpojPeKRCDBPIS4GCERBMcZ7nsOccQDhDqcOOnM2d9B9kRElmADhops
 9zbQ==
X-Gm-Message-State: AOAM5317TpNmNKyR5zPYp/3W7cHPlEWWI4OnSq9f7Xd+Fc2g3AC18gQ6
 06smnhkyROo1grPgcGNCM01qjYs6xX5h2mDJNHc62Q==
X-Google-Smtp-Source: ABdhPJzKbsUq4dr9bCWekIbGomqAPRorKy0U6hOsruvkOSKNb2mNUxXTXZoXlmDEqHnAS35JL+4KmmaZM4WjOZ9uBFM=
X-Received: by 2002:aa7:c6d4:: with SMTP id b20mr33823231eds.204.1626700436994; 
 Mon, 19 Jul 2021 06:13:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210719102640.2610368-1-thuth@redhat.com>
In-Reply-To: <20210719102640.2610368-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jul 2021 14:13:16 +0100
Message-ID: <CAFEAcA80uwHz2R0e1Nk=GuwqRsBiQUdsKuo+Ny2bhrJdPUO78A@mail.gmail.com>
Subject: Re: [PULL 0/5] Misc fixes for 6.1
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 19 Jul 2021 at 11:26, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi Peter!
>
> The following changes since commit fd79f89c76c8e2f409dd9db5d7a367b1f64b6dc6:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210718' into staging (2021-07-18 13:46:39 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/thuth/qemu.git tags/pull-request-2021-07-19
>
> for you to fetch changes up to 9405d87be25db6dff4d7b5ab48a81bbf6d083e47:
>
>   hw/ide: Fix crash when plugging a piix3-ide device into the x-remote machine (2021-07-19 10:08:45 +0200)
>
> ----------------------------------------------------------------
> - Compile-test the Windows installer in the Gitlab-CI
> - Fix endianess detection problem with LTO in "configure"
> - Fix two abort()s in the vmxnet code
> - Fix crash with x-remote machine and IDE devices
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

