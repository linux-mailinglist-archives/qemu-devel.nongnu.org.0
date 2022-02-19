Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 318FC4BC87D
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Feb 2022 14:11:36 +0100 (CET)
Received: from localhost ([::1]:56174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLPWQ-0003eJ-V7
	for lists+qemu-devel@lfdr.de; Sat, 19 Feb 2022 08:11:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nLPNV-0001em-3T
 for qemu-devel@nongnu.org; Sat, 19 Feb 2022 08:02:21 -0500
Received: from mail-yb1-f182.google.com ([209.85.219.182]:47010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nLPMq-0001XA-Rm
 for qemu-devel@nongnu.org; Sat, 19 Feb 2022 08:02:20 -0500
Received: by mail-yb1-f182.google.com with SMTP id p5so24683166ybd.13
 for <qemu-devel@nongnu.org>; Sat, 19 Feb 2022 05:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RgOaOkrcoZ67VXOknM6p9RoO/SIGgoe+lSs18g7y0fE=;
 b=zD1xGUF9SllWyyNKUFc8h5zKAb4Lfsj6I8yghLDs30ehDI8/nwzMyaN7i6zlav8wz9
 BrsXLCz1w2MbPfmCHCVzscEWIT7DEBfK1lAgaJJquZNV/OQ/fHD325ZUtmazx3SRChJb
 +B3+k0rPaFOCMZYjuJezMJ98Yke6UlRFOYyP9anRx6m+RjEAPMW7OZ4cgaIiXxrOODf0
 rW1t/zqkgRnb6KAfOlX34nCkaMmogoIlUWpDVVGNAYih2A/FJydca+yP4XX9XkyyABtB
 VDPE8GvM5GTHUcKxBVKxTGBim29FczUQRDL/jIpjwqLPoYyICKVlHYiPGRfKP/TGytT7
 jmpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RgOaOkrcoZ67VXOknM6p9RoO/SIGgoe+lSs18g7y0fE=;
 b=otc+Qk5evnQzAASyBbXyNtrFpTECRRSXLq4wZ8M1hJLJskCxRUm/4f1r3cEXHC2Rbe
 DOFz74sz6DyaZAJgOHKPvdpvlenL/MG2ZL+bntZLggmoldbY9ZV47xI4Z2Q/yB7HZkH5
 M9Wv2N8O5vLsBncUleaYZd2ECvHDzVe6hDznWA+GdKT+8e76jDFrfR/F8T6g2lNTYyIc
 ci58JjSiMa36v6lGjWAmZoyk5Vjh6HGpSIzhfz1DtfkZ97UnWaH7otQs87PutSQM9XWh
 x8wGLIaKYIQGe42kCHILVChHZsdxfzRi37oyXyC5NW8+0e7YJWvf6WtiSjfBsCum+vqW
 wjPA==
X-Gm-Message-State: AOAM5324OZ/uIuqSrILaegOs+Wrb/wQXKRKfhnASd9cgnQEMuq86iEyh
 uGi9gTj9auYDNMtikygFFBvLPE1R4F737kaQ37qe5xa9FYI=
X-Google-Smtp-Source: ABdhPJzR/waQ4EG/NG9hbsaQaCliBo+D4+VSw6cldxY7tO/jR3puSl22YqRnqrO7WK6S5LFMaB554tc5Rpc4kqK+X7o=
X-Received: by 2002:a05:6902:83:b0:61a:709b:d841 with SMTP id
 h3-20020a056902008300b0061a709bd841mr11265718ybs.140.1645275699610; Sat, 19
 Feb 2022 05:01:39 -0800 (PST)
MIME-Version: 1.0
References: <20220219064210.3145381-1-shorne@gmail.com>
 <20220219064210.3145381-4-shorne@gmail.com>
In-Reply-To: <20220219064210.3145381-4-shorne@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 19 Feb 2022 13:01:28 +0000
Message-ID: <CAFEAcA95vd49x05oOLqkwajwHYRphpeV51os-2XZex3TabTkGA@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] hw/openrisc/openrisc_sim: Use IRQ splitter when
 connecting UART
To: Stafford Horne <shorne@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.219.182;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-f182.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: QEMU Development <qemu-devel@nongnu.org>, Jia Liu <proljc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 19 Feb 2022 at 06:42, Stafford Horne <shorne@gmail.com> wrote:
>
> Currently the OpenRISC SMP configuration only supports 2 cores due to
> the UART IRQ routing being limited to 2 cores.  As was done in commit
> 1eeffbeb11 ("hw/openrisc/openrisc_sim: Use IRQ splitter when connecting
> IRQ to multiple CPUs") we can use a splitter to wire more than 2 CPUs.
>
> This patch moves serial initialization out to it's own function and
> uses a splitter to connect multiple CPU irq lines to the UART.
>
> Signed-off-by: Stafford Horne <shorne@gmail.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

