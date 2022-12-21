Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A68B565386A
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 23:16:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p87ME-0000Ut-2J; Wed, 21 Dec 2022 17:14:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p87M8-0000Ri-90
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:14:32 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p87M6-0004H4-MU
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:14:32 -0500
Received: by mail-pl1-x62d.google.com with SMTP id d15so237148pls.6
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 14:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=w1jHyyFgO5wQjkd0JPZ9kiUccP1yZtbaxlcwpucc/lY=;
 b=WZfTs1oKzXSFv7MsVUCxw7K1KO2mS0SKHd91nOdcg8hfYRNdaAtT9zr5YkHyT55YT+
 q+pu7qQQ5Ng8Ys793gggvw0rs29R6lKSzTPKx2O72YxX1VXet2HHagCMHU+7f0Dlk7Z3
 OIwvB+XHbphp1lkobeqVXrOqsOfPQNnu27zSPiAYOIQBy6RVqlM3TxUWdtg8wivGki92
 bbL48e6nmgJKBqnW1ScqwR8Vxavr54mvsrCdUk93Z3aJwVMyvfgae7Wg6d1YYf6HKPvo
 0atD08bWfQpzs9bBHkZ5uH+mnguXws4VqWnknUfAWw0d1rGi1JXsgyNn2ibjSd+/b9y5
 Wzlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w1jHyyFgO5wQjkd0JPZ9kiUccP1yZtbaxlcwpucc/lY=;
 b=CHx/iO9Jma0q10O0VH0YY5tEFc6HYuVH8+nMi+5M2sCZ4SnxUgkWjbmnPscvk4Kt/h
 gdyCFnu4SWmGv2ZbOlPoBGQjdJVn0UhCR6u7TF/USetTd8TV9pRxgvPe0ATmaqfVGKyW
 JqjpW0K/2nLwFTzyqkErThpftu65q37gG5ADIK3rx8BOEB9YGaAnflUEH8/NaXbq7oW+
 lVtjX1VQFREKLc2eZEkbURtKDUjIdVqwSXeULvn5AIhjC+luKmvoYEqsNiP1iDKv0pxz
 09Y9XkhSiwbmM+rCXqm+fdUT3wmwuT8okwQERkFU67Ayccbcs2ZAnklDgt/OIdnl/k82
 815A==
X-Gm-Message-State: AFqh2kqt06e68W00wQPnKshiuQAnmVGsJCWUC1mzLYCo+59Tsy5hgfTp
 we8GeLWfyxLsEt9xVuIkeCGeKfR8tbQZ0qO8p+10gQ==
X-Google-Smtp-Source: AMrXdXuIjsbDd3gKOL35wuiDzRn0ur4fm+jGmSO1oJm4eL5KLNwB+7AaTRmAFxHxwITnXXKouSmhej7GHhEGJNqTV6M=
X-Received: by 2002:a17:903:2653:b0:189:cdc8:7261 with SMTP id
 je19-20020a170903265300b00189cdc87261mr236272plb.168.1671660868374; Wed, 21
 Dec 2022 14:14:28 -0800 (PST)
MIME-Version: 1.0
References: <20221221172123.297248-1-danielhb413@gmail.com>
In-Reply-To: <20221221172123.297248-1-danielhb413@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 21 Dec 2022 22:14:16 +0000
Message-ID: <CAFEAcA_omTNZPZBoB3UXw3FZ2r-DUDKpiCVcTmHaANAkCi=j-g@mail.gmail.com>
Subject: Re: [PULL v2 00/14] ppc queue
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62d.google.com
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

On Wed, 21 Dec 2022 at 17:21, Daniel Henrique Barboza
<danielhb413@gmail.com> wrote:
>
> v2: removed patch that was breaking clang tests. Thanks,
>
> Daniel
>
> ------
>
> The following changes since commit 700ce3b1bb52da4acbbf1ad8f6256baaf52c7953:
>
>   Merge tag 'pull-tcg-20221220' of https://gitlab.com/rth7680/qemu into staging (2022-12-21 14:15:18 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/danielhb/qemu.git tags/pull-ppc-20221221
>
> for you to fetch changes up to 4091fabfeb54f02762bdecba7344353c56533873:
>
>   target/ppc: Check DEXCR on hash{st, chk} instructions (2022-12-21 14:17:55 -0300)
>
> ----------------------------------------------------------------
> ppc patch queue for 2022-12-21:
>
> This queue contains a MAINTAINERS update, the implementation of the Freescale eSDHC,
> the introduction of the DEXCR/HDEXCR instructions and other assorted fixes (most of
> them for the e500 board).
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

