Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF76702A3D
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 12:15:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyVEc-0000RV-UG; Mon, 15 May 2023 06:15:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pyVEa-0000Qr-3J
 for qemu-devel@nongnu.org; Mon, 15 May 2023 06:15:16 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pyVEY-0003TF-GS
 for qemu-devel@nongnu.org; Mon, 15 May 2023 06:15:15 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-965fc25f009so2028266866b.3
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 03:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684145712; x=1686737712;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pUyt6cq5H2QA7Z8MrH9w6MMRtJKb//FNz6GK1kVGROc=;
 b=eyOm7c1bryLjcSncR/jCpUrsUBQK5PuLUqPIvlqjlLuGiBA3IAIy5Hx3sZQi3urnlB
 ZYubw18XOLx7gH0j29dV7mhbKfrtPb8ReMlkMefC2+6DVEkrtjStTrU20kxj1uC50I0+
 qtHpWNrsmqB5qVG7khW/9ewvG8wqivy+2h/b5wlgPLqcbGVauDGcodKh3mSp/dvD4BY6
 BJtfy7VgIT1AS94OtcspvcGnp2YwxMdMhgcz+BL0dPWEmNTjTX5ngLJ9hy7ZV0t6SZbL
 iJxy97oqYbwhwzemrh8EC2ZvQgph7YBZFPVR0i5zrk1n9/De3WRe42diGuZI78G8cMrV
 xYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684145712; x=1686737712;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pUyt6cq5H2QA7Z8MrH9w6MMRtJKb//FNz6GK1kVGROc=;
 b=XNZwmJzRTi0rVRz2LFAWXk5uOlYWdZ0aSODTl0ut7IzE83mEey1g2jJuhJ8QgLYIiU
 oCih6IfNmwTWvVDy/4YaU1ZF1oTh+AtuXrFTXLXaIZEHM3Hg238ecw3cXiRF56I5cYiO
 m/FGVssrQh7i2qMRRDFduZvS4ujZTcW6SZN7Iw/5VSVSPVmze87Hq0JDQp74cT9KW5Td
 xGcEdNN5QmndJJQEYcPVnYiiwou7cw272ji/vK8fkpL+C8MW7SGTS4tnNXKJ7kCG3aXf
 +q0lw3WMOSPnB6ykfg4YGePrWsrN/eiZ2y8Z3KWBtjOwOU/ykGsJ8lwC5jbE9ZhJlRS0
 I6pQ==
X-Gm-Message-State: AC+VfDxw9FTyiG/zrf2ndl+hILoJy59XsA8FM0oT/XkF5kyb00UwGkGJ
 1An2ZWrc289ub2zXt36QsukpBM7DDV3d3ffpTrOCTrO/CKUE/qM6
X-Google-Smtp-Source: ACHHUZ4G2Bs+gj1LnrYAv94AhrRofWaE5zvaLTBNciuUslDokr055mS+RlMmlku+IAdQtw+K/Ah6M4uXZQQaKCsXT4w=
X-Received: by 2002:a17:907:3d92:b0:969:fc68:fa9a with SMTP id
 he18-20020a1709073d9200b00969fc68fa9amr20519050ejc.40.1684145712412; Mon, 15
 May 2023 03:15:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230515100438.359690-1-marcin.juszkiewicz@linaro.org>
In-Reply-To: <20230515100438.359690-1-marcin.juszkiewicz@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 May 2023 11:15:01 +0100
Message-ID: <CAFEAcA_beOoOH2GHQuaCyBU10yhkJ44FSrdVsHi7wTSz9QQxmA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/sbsa-ref: add GIC node into DT
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Leif Lindholm <quic_llindhol@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Mon, 15 May 2023 at 11:04, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> Let add GIC information into DeviceTree as part of SBSA-REF versioning.
>
> Trusted Firmware will read it and provide to next firmware level.
>
> Bumps platform version to 0.1 one so we can check is node is present.

(Missing signed-off-by.)

I thought the idea with the sbsa-ref dtb was that it was
really just a minimal provision of data to the firmware,
not a real DTB, and that (as on real hardware) creating
the DTB to pass to the next level of the guest code was
the job of the guest firmware.

Why do we need to provide a full GIC DTB node ?

thanks
-- PMM

