Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F36D2314144
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 22:08:35 +0100 (CET)
Received: from localhost ([::1]:50316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Dlq-0001at-MB
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 16:08:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9AEX-0000MT-Vs
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 12:21:58 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:37354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9AEV-0000Kg-DK
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 12:21:57 -0500
Received: by mail-ej1-x630.google.com with SMTP id jj19so26168810ejc.4
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 09:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FSIPjGSh9GFEfNi2norBGtnk5ZpSgj51G+THylcaW4I=;
 b=fld2WnWMBohLkw7Rh9AWagJac9Fo7oWC76xgobHm1szt0TtzSxRDEhtNJxpF9lwxnG
 YWXswBljBAsUKl04osz9OSC5yvaC8Z66tgz5M7/hRtmbpcEKrJAdIdmLveKK61WUc1Yu
 A3/UokkDTRQF30QeoOxV9U8VVzn8MfwIKBeL26SPG38Aapqy8o1DPk8dXFidzPR+ChMB
 93fJZ001Q6kUVDSBLsIy1SojXvbKQLia+YX+JAZgzvkVV0qzXHp2WNYVo8cse3LJAKY2
 0a1uFMn+MulzcfDA7fy7ZARhCHev1Y2hoMdTP9/0uA+HVo/6c8DoVSTXVHaRaCoXA9NP
 fmmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FSIPjGSh9GFEfNi2norBGtnk5ZpSgj51G+THylcaW4I=;
 b=soZLDBWivi4wdtUoKZzbcEzBO70uoaYoEHJzkqnDcPiLtSlD67OyU8tHdLrewTlhDF
 yOuwdFUt+bamZroeByFEojV3NzWzaC5gyeQMYdaOc2m5wFm7A/4L12Y7ar13COgW8uLw
 yxgWaqLrml9eZGKQ39rXS4ZSzKNO+Vgxk6dhdVAu4lomScohI1PKYcmjZRoReJj0eBXX
 IDMcEgN7g9mlASu37SFfDRm69lxMmj2UKohhzSRJ63GaYgrtTItlfmA0zi38rVqr8UN9
 1kZZSVwuDWbNxOWMfO0UmAmQ3RBjParx2OqYXzHJzhvBCaZGJl2m1FBSwtZL1FsfM9CZ
 92Kg==
X-Gm-Message-State: AOAM530J6G6pNacSLMLO0oTcds0iuRCGlMRIt09pIUpCn6AcWNkOatPe
 hxNwgyc6ZX+YqgYkWyovzO8B1c2nln4QSQo2OF3shA/5EFE=
X-Google-Smtp-Source: ABdhPJx4LGYaagJUR58+mz4iYUWHSNyv23tNh9OgchalHszP+2OJHGe/hdE6UAAjCTB6+taBQ/tCpQhI3uVwh9OrdRY=
X-Received: by 2002:a17:906:184e:: with SMTP id
 w14mr9333988eje.56.1612804913692; 
 Mon, 08 Feb 2021 09:21:53 -0800 (PST)
MIME-Version: 1.0
References: <20210202232838.1641382-1-dje@google.com>
 <20210202232838.1641382-4-dje@google.com>
In-Reply-To: <20210202232838.1641382-4-dje@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 17:21:42 +0000
Message-ID: <CAFEAcA9TcGG2GCqa7FVv2KHdHft9dqL5gGL+5BKTm088XxrytQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] tests/qtests: Add npcm7xx emc model test
To: Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: Hao Wu <wuhaotsh@google.com>, Jason Wang <jasowang@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Avi Fishman <avi.fishman@nuvoton.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2 Feb 2021 at 23:29, Doug Evans <dje@google.com> wrote:
>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Avi Fishman <avi.fishman@nuvoton.com>
> Signed-off-by: Doug Evans <dje@google.com>
> ---
>  tests/qtest/meson.build        |   1 +
>  tests/qtest/npcm7xx_emc-test.c | 793 +++++++++++++++++++++++++++++++++
>  2 files changed, 794 insertions(+)
>  create mode 100644 tests/qtest/npcm7xx_emc-test.c

I see some more middle-of-function variable declarations here,
but otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

