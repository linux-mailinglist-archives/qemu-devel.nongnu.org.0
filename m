Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 587C3408B22
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 14:37:42 +0200 (CEST)
Received: from localhost ([::1]:41230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPlDR-0003nv-1B
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 08:37:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPkc3-0004eq-5o
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:59:03 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:41901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPkbz-0006cT-K1
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:59:02 -0400
Received: by mail-wr1-x42c.google.com with SMTP id w29so13499486wra.8
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 04:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kv+m7wzDZI30FajW9GsAR4z0YpXe2JN7uOHdZCUJ+oA=;
 b=Qf2TLhvP83HTLZE6mpDOCd2EHLZG68Zu2Wy+BzV1gs1DFW8VrJ/Mqgk+kTADjI+L2R
 T+XVISKhrYDHhThBfMsBeSgRontINt0iuogAcqis7/Fa/k5y/Xib7p9Eh6jYkkXJ0VNv
 046XnY7AGwP5srzH1MDeryYJnb3tXeXuu7Fv2Ko6v3SQNu2FbLndom/srWRQWy/mdWlh
 SDywaH2olN68yQH6wn+0H2Yibjqr0+7om4HsYlrtnbb6VsZxiF2r0ov/GVbiMLwI3Je7
 ti/EoFCXfKCgNTjYzZ7HYw+gxvQBWOTRMJwNnEOTNK1fQUaRYJ/cpbBtp12Fxp60wWB/
 PgvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kv+m7wzDZI30FajW9GsAR4z0YpXe2JN7uOHdZCUJ+oA=;
 b=2HDHw65TCKqdPNhS2die2d3a1ZKFNE5eKKhYB8EvsZLnhbh94XsBCSwnbZXWMSScf7
 Yysh83x6CLajtGPKdV6BkXZgZY5A8w2nvNcommg3h7NpWDeEEqyafoKBLxzPR0Im+EPC
 jVq3cmOd/5GKcf0s+PO/Bp9S73zyskUaWsSZdNaxr3eBF0K+RUf4r4Yra09CbirWpPJ1
 0KFtE6Gmcs7k81DM+T3tuFwcEWhRCEjtcOM3CWAZJiDZjTtIw5wy115BbWW3B7LfxfsQ
 lepwMXThyb7EdWaeJt+WsuVn9NselPSPj587OWPxjrkxMTIRsg0Jky4lB0JjTKWxEu8i
 fKkw==
X-Gm-Message-State: AOAM530S59SqavQaMd7Y0nV3bsGO6IQjkIuj9qTTtx0yjgNkJZfQLPcd
 1ivQI/M/7xaJX8VwoPkxcgL1OxFApNLg/rrpanoZdQ==
X-Google-Smtp-Source: ABdhPJxFf6xVz8rg2apUrJcUYJ9r83shNIvsTUr42k/0HsCiVyX99I4hFv1aFjBx1resoSwSfN0w3WF51B+uHWGV2yA=
X-Received: by 2002:adf:fb91:: with SMTP id a17mr11770777wrr.376.1631534338318; 
 Mon, 13 Sep 2021 04:58:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210907223234.1165705-1-crauer@google.com>
In-Reply-To: <20210907223234.1165705-1-crauer@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Sep 2021 12:58:07 +0100
Message-ID: <CAFEAcA_Mgnf4ENaK0MonaUtw-g07MDSZQ3dcteguUSgLmL3nZg@mail.gmail.com>
Subject: Re: [PATCH v2] hw/arm: Add support for kudo-bmc board.
To: Chris Rauer <crauer@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: CS20 KFTing <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Havard Skinnemoen <hskinnemoen@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 7 Sept 2021 at 23:32, Chris Rauer <crauer@google.com> wrote:
>
> kudo-bmc is a board supported by OpenBMC.
> https://github.com/openbmc/openbmc/tree/master/meta-fii/meta-kudo
>
> Since v1:
> - hyphenated Cortex-A9
>
> Tested: Booted kudo firmware.
> Signed-off-by: Chris Rauer <crauer@google.com>
> ---
>  docs/system/arm/nuvoton.rst |  1 +
>  hw/arm/npcm7xx_boards.c     | 34 ++++++++++++++++++++++++++++++++++
>  2 files changed, 35 insertions(+)



Applied to target-arm.next, thanks.

-- PMM

