Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CE15535CB
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 17:20:49 +0200 (CEST)
Received: from localhost ([::1]:49718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3fgO-0007kc-CT
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 11:20:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3fdC-0005Yy-37
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 11:17:30 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:46602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3fdA-0004Z1-Ky
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 11:17:29 -0400
Received: by mail-yb1-xb31.google.com with SMTP id l11so24974329ybu.13
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 08:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P7ELnSGNP1ouk/cYYICG2CVGGvfbKa/Z1F0ptBKCkX4=;
 b=HJxJWvglWG6yxfm45wJBNJu6o0aaw+WnGwmnePzCV+mEHr5DkScQs+NmLigKGpz8C6
 +tltCG1E/ch2zD/9qMV/YdzkqIrwyxuQcI5z1UpBAScvAdheauvs+fKaW1o55mltNcfK
 Gp2z6+brTvof+uSrp16KcYSQJSCAhSHKOpt7rqsQ7xa0Qp9rTvryG6la3/41nHT66Z23
 8mnlLEG6o+N9/aJOJwbKchyWtBcrdnACyK+gKCVloVl4rVNIP1PuHbAtQxczPaY4eikF
 LvnIYexcv/tKZ9Aps0jOkzFIZuvqWP5YD47otV5aYFxIkc/MreF/jkg9yzRxzUiPB+u8
 rJjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P7ELnSGNP1ouk/cYYICG2CVGGvfbKa/Z1F0ptBKCkX4=;
 b=Gbn1r5RTLnzdcNbOSOJMC/FEtRmCq0DMdqyah59JRrz6QHZEoDe+QkafjBoWLC9kgK
 ZBsSuCzEE4ogsezqWLz/k0Waye+mFUeK9597CVTMZMsv4A8Ko2nhlqkGStkfSGe8xbeG
 CqrTb8K8eN8Faqossgtuw0DsUlbMT1wVu+3Hnz7EWRW7cmSBG0DOkCazCdtUdXp84DMF
 RPT56lcPnCmmC9BoWRO8gTg8w49jNdGJ8XrBT20kCFhl3ov5wxTnQpHlK7vkxNnf6wb1
 QKWHXe7t4h/a8SK/R3mz4FSG5KVWw9FFyoJ1jZjXMUd2MyvD+qbinMcDc4fSpqtY+0/W
 Vgkw==
X-Gm-Message-State: AJIora/F7ZiLGF3+phhWzr0D93KuT9AdLeHhTS11eaz1bhCZbnemiK/d
 Kad1hJl07YGuQTBdWqh81vtEY9plOUArG8fECEGNPw==
X-Google-Smtp-Source: AGRyM1uSSqTSyS/Hds9jH+//92xcXQNybLH36P+BAEo828LylS3CQ+LBWR9NfjC4dfCaK3KICDNAPneiq7E8DeDOac8=
X-Received: by 2002:a5b:dd2:0:b0:668:fc4a:9403 with SMTP id
 t18-20020a5b0dd2000000b00668fc4a9403mr13639747ybr.39.1655824647309; Tue, 21
 Jun 2022 08:17:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220621014837.189139-1-richard.henderson@linaro.org>
 <20220621014837.189139-2-richard.henderson@linaro.org>
In-Reply-To: <20220621014837.189139-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Jun 2022 16:16:50 +0100
Message-ID: <CAFEAcA-Fiviv00Npv-xxF-nX3DPJJ4S3e8dSyU29uezD5WRKng@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] util: Merge cacheflush.c and cacheinfo.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, npiggin@gmail.com, qemu-ppc@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 21 Jun 2022 at 02:51, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Combine the two files into cacheflush.c.  There's a couple of bits
> that would be helpful to share between the two, and combining them
> seems better than exporting the bits.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

