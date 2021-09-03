Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3112640018B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 16:53:15 +0200 (CEST)
Received: from localhost ([::1]:51486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMAZ8-0006PI-26
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 10:53:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mMAY2-0005Wj-ML
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 10:52:06 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:33499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mMAY0-0004qU-78
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 10:52:06 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 192-20020a1c04c9000000b002f7a4ab0a49so3139725wme.0
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 07:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5roshyboZ+kdsi0TGTdaUsmAx+q/9fSdGUMKEh7BkIM=;
 b=JHhKAcmYF47Y4Zonh+3Ic2E52jmIY7yQ7YS/5pVoOCN0SCGL5IaVl+WYbF52f753fi
 7RdBNREcUOgEgyTi/khjpHQ98p9Ohzcmz7vGl9Ub6ruDkTgNIoivEoARo30Q2EIDHayt
 TV2lLzrhg59cCRcvO7oqToI/7jodNZS3PfET86Pn9Hrwq/zDvk4aSlVDeSW0sHL2+LOu
 /w5EB7sonBQw5xbRbxHNJroAAvifsRWC79WZvn1DQFyMnTQluRPvxr/0DemcHHAFDqcy
 E/jn74kSM+epierYJYgUU2YP/zItaC+Pzdp+82NJC6aJRPlloWb6IDlyiYgVnAb5+3cU
 c+xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5roshyboZ+kdsi0TGTdaUsmAx+q/9fSdGUMKEh7BkIM=;
 b=r6PQn0sR8vAyTbrN0ZheNRutFGF9W2E+QvlQBsKGgbXOaK8eXawHwNJdiJNB2NFpFq
 NWwboKiuipfAiK4RhGkxaVxvcyyxKK2G8eOowb4b3WnZZmN2VIpP/ER8MlNDYuRgxi71
 tCWVQxK1bApR4+ZmC0gu1E4mjoVV03W90sBqYtY7vBhTSOn4FH36VLgKf3TOs9iTH1c3
 KNMgupBW5e7KE3U5lANFiYmuksHn/Dh7wzn2R+BFzUgPwdIhG0I+r1csG2uIw2gZT7P3
 5BGuYu3gUSBKNWivYu+3qnI9bYz4EsakfG/w+uer+5qtyrUxGbb3LA+UXUdk6zVdyo/i
 njSA==
X-Gm-Message-State: AOAM5325nGkrAd6tUojLgJuPouJpyjzDaxJ71959r3cLw3CRlpi86Gn8
 BXjVb3xB7itJOfAnP0WGqY7GMNKl8TLJzwfrtK4Arg==
X-Google-Smtp-Source: ABdhPJw2OgOkeuETz9SfH2yt7kDRqeYlxnQQFAOR+Y+xULk3QO6ALq2S0iFER6UWZWNThsnmC3Lqy3k3eLiRdbjzTFs=
X-Received: by 2002:a7b:c246:: with SMTP id b6mr8696159wmj.37.1630680722660;
 Fri, 03 Sep 2021 07:52:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210902181642.315792-1-crauer@google.com>
In-Reply-To: <20210902181642.315792-1-crauer@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Sep 2021 15:51:14 +0100
Message-ID: <CAFEAcA-wG4FW_ddfpj+CH22OwGbaqjmYoi2FQdBUHdrDnfSvjA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: Add support for kudo-bmc board.
To: Chris Rauer <crauer@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: CS20 KFTing <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Havard Skinnemoen <hskinnemoen@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2 Sept 2021 at 19:17, Chris Rauer <crauer@google.com> wrote:
>
> kudo-bmc is a board supported by OpenBMC.
> https://github.com/openbmc/openbmc/tree/master/meta-fii/meta-kudo
>
> Tested: Booted kudo firmware.
> Signed-off-by: Chris Rauer <crauer@google.com>

> +static void kudo_bmc_machine_class_init(ObjectClass *oc, void *data)
> +{
> +    NPCM7xxMachineClass *nmc = NPCM7XX_MACHINE_CLASS(oc);
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +
> +    npcm7xx_set_soc_type(nmc, TYPE_NPCM730);
> +
> +    mc->desc = "Kudo BMC (Cortex A9)";

"Cortex-A9" should be hyphenated; see commit f548f20176c.

> +    mc->init = kudo_bmc_init;
> +    mc->default_ram_size = 1 * GiB;
> +};

-- PMM

