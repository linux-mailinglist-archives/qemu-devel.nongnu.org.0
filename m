Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C936CC75B
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 18:02:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phBkp-0005jE-4h; Tue, 28 Mar 2023 12:00:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1phBkS-0005K5-53
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 12:00:42 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1phBkP-0003mP-D9
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 12:00:35 -0400
Received: by mail-ed1-x536.google.com with SMTP id y4so51845265edo.2
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 09:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680019231;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/osdWzJCElLXcA4fxi/B8eM7YZienX1jvnNYuDcGddI=;
 b=zjoAw0dri0grFbQD2e1xh+SeJyUAkdxm3DxDXeJq9gfiuvuVOUM951CoTJEQt6MqxV
 VQGULEq1+7ZnKbYaqaCLGPFV5RgO8PgmuyIWAIxWQa6LZts/pzEB1yq2IMoyIclMJYPR
 lOXatJhagdg44vdGzSuHEl/GQqptAIpSaOyTNpSfdieXYbWRcSPFxgdWl17ZQDC0TRih
 c7+D7N5QBejXI8zfaXXSaiuy9VqsDEIf21LeLNyX8nc2AtGCg3Xvr/hT4UVfJI2reO/c
 Bz8bohFYkY+xg6t2UB+RSCgUkGJ18CQirdfIFICAl+nZrFzGE3JAEGLDIJre82urYiV1
 t3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680019231;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/osdWzJCElLXcA4fxi/B8eM7YZienX1jvnNYuDcGddI=;
 b=5FVPZbIQcHtyNZu82kHY3pcthCNLcWwH0fUhDbpVEqbj4iNFU7+K7QRTnzF2UKOA79
 ro482KYRdH4SneRTkBGdlOFNW+MsieIsqWdNUek7z/Qsu8iTQZ51L8iKfZGyPat09218
 pUN7bj4XRu26oKSKFPmjmT2LZTQSK3f1Nhp2MZi5empwpc0yORjIe0T+/SeRBBhCwu8x
 D/H21Z1eTxg1+Y/kO2BmgL4LUB2pOpd2OwzhLNRVV+b66rCS1iOmEx5DC0fZ32VBU9Gb
 b+LZvLQDbR+gnGxUvv7JioX1VG3F/iHzvdcVlqgpmZ+QMSH6O6q3UpkIt8s8Yh6cI+AX
 GA4g==
X-Gm-Message-State: AAQBX9eZZPJMJy0QXEDg+JuVOOQ43WexgnuExsJFXBEY9ssMEmRy5z1M
 7P7bxf4cVHtuhwRZr3hQXMcrCLcnIvghvyIyGjf4gQ==
X-Google-Smtp-Source: AKy350ac8pKNQfLSeOuLzPAP+mWeLgTcD46EJqU9SmZphAF5kDZRH/bphwL7U6lAuBGAR/8gLtRzcpFHevf7+297p5I=
X-Received: by 2002:a50:9e89:0:b0:500:547b:4e1b with SMTP id
 a9-20020a509e89000000b00500547b4e1bmr8101912edf.6.1680019231138; Tue, 28 Mar
 2023 09:00:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230327170944.57033-1-its@irrelevant.dk>
In-Reply-To: <20230327170944.57033-1-its@irrelevant.dk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Mar 2023 17:00:20 +0100
Message-ID: <CAFEAcA_6hr=NcGjaictO3DQBwnnt5pEh8qP8+yiPz0KnTiuiQA@mail.gmail.com>
Subject: Re: [PULL 0/2] hw/nvme fixes
To: Klaus Jensen <its@irrelevant.dk>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>, 
 Klaus Jensen <k.jensen@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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

On Mon, 27 Mar 2023 at 18:09, Klaus Jensen <its@irrelevant.dk> wrote:
>
> From: Klaus Jensen <k.jensen@samsung.com>
>
> Hi Peter,
>
> The following changes since commit e3debd5e7d0ce031356024878a0a18b9d109354a:
>
>   Merge tag 'pull-request-2023-03-24' of https://gitlab.com/thuth/qemu into staging (2023-03-24 16:08:46 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/birkelund/qemu.git tags/nvme-next-pull-request
>
> for you to fetch changes up to ca2a091802872b265bc6007a2d36276d51d8e4b3:
>
>   hw/nvme: fix missing DNR on compare failure (2023-03-27 19:05:23 +0200)
>
> ----------------------------------------------------------------
> hw/nvme fixes
>
> ----------------------------------------------------------------
>
> Klaus Jensen (1):
>   hw/nvme: fix missing DNR on compare failure
>
> Mateusz Kozlowski (1):
>   hw/nvme: Change alignment in dma functions for nvme_blk_*
>
>  hw/nvme/ctrl.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

