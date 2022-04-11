Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E28E4FBCCF
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 15:11:00 +0200 (CEST)
Received: from localhost ([::1]:47256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndtom-00017I-RA
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 09:10:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndtnf-0008Sf-7D
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 09:09:47 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:35318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndtnd-0004oD-FU
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 09:09:46 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2ebdf6ebd29so93517457b3.2
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 06:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tJeXZ6fkngkty4VM2TYGySPqW8K5Yykz+a2ja7udUu8=;
 b=IfjUvnt4e3qZ/rx010h+vWX9AaE8mt79YXdyJThl4cu526lzr+yawnIkc8pPbNtqVP
 16rbPfNGRvz9DJoChZECiBoBlU/GrU/IW/fY7HNLabgA1ZxD6oMlLKQbfATAA8g86X9J
 /eLFftNtK5IJjwiBwdjn9N9qbPEHu2FZ3dDnBlfFrgIizeVHTQMv+YlpEvMq1YJInTlU
 bH+ezePqW2PRev6h1nqmtshKQjPKMUoOHw/0mNVQ8qz+f03tTCK65QxWHhD+GAvlxpHi
 qPvSaqCsQEnUBAoESH30lfGpKnSBC/o1jYzgTdkCkCsLiukfxzbqZMtLhy2fl5Y1Fjak
 GQpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tJeXZ6fkngkty4VM2TYGySPqW8K5Yykz+a2ja7udUu8=;
 b=sn2yybnBqpNVlyLU1nH0cEAjTDA6z6ZU8ZhO5lWIpE5qwh4LaFa97cUSPF6FooPPQT
 skbw6dVETjWogpWHnSiQpidc0oNSJc/r5b/Nj1WtAj2Ldiy0NZvPCoskIJISjqySLoh5
 B/G40bdqeESJQXL1OocJMnXjuMVK8AAGNcTQgWUo0sEWOCxra6ohS/LWc46CyEKk6GzN
 3t6f7OzHM2pcsIRd9/uDzupIkXel0qs+YM3tmszeuqyE/fnd6k20blWGfVZjCJR9zaHU
 65pfOINUvTjxit8jVqIrp6/4JIgLlq1Uc4+zIpW65ew0IzqNHgM9UhNor/LHuUoWOFqZ
 npXQ==
X-Gm-Message-State: AOAM531VTKBhYzgh7XnHx9/XyDrmVvPmq32JWA4ued5F4d2aeL79dnbw
 driwIpKi/+yGsOELmwHl8vPQMURVihxJtpBUHGts9A==
X-Google-Smtp-Source: ABdhPJwktj0F9uCn/vUmyQfToTI+TW1IXiY/c8YbkPDtoiQuilCPUyyyIUvK21OB5JlU19kL8TZNrA0/lnyTOkxbYk0=
X-Received: by 2002:a81:13d6:0:b0:2ec:2b3f:28c6 with SMTP id
 205-20020a8113d6000000b002ec2b3f28c6mr3580609ywt.10.1649682584115; Mon, 11
 Apr 2022 06:09:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220409000742.293691-1-richard.henderson@linaro.org>
 <20220409000742.293691-9-richard.henderson@linaro.org>
In-Reply-To: <20220409000742.293691-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 14:09:33 +0100
Message-ID: <CAFEAcA-b5RHzJ0BxeyswL6C6Cr-6fzRF_a0SVkLdWQo4Xs6=dQ@mail.gmail.com>
Subject: Re: [PATCH 08/16] target/arm: Enable FEAT_Debugv8p2 for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 9 Apr 2022 at 01:18, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The only portion of FEAT_Debugv8p2 that is relevant to QEMU
> is CONTEXTIDR_EL2, which is also conditionally implemented
> with FEAT_VHE.  The rest of the debug extension concerns the
> External debug interface, which is outside the scope of QEMU.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.c     | 1 +
>  target/arm/cpu64.c   | 1 +
>  target/arm/cpu_tcg.c | 2 ++
>  3 files changed, 4 insertions(+)
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

