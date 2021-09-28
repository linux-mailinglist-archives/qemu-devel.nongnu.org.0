Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCC841ABCF
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 11:29:33 +0200 (CEST)
Received: from localhost ([::1]:48880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mV9Qa-0006Eo-OB
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 05:29:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mV9MW-0002TL-OD
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 05:25:20 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:38418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mV9MV-0006a1-91
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 05:25:20 -0400
Received: by mail-wr1-x42e.google.com with SMTP id u18so56866287wrg.5
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 02:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YCfveSGpnLQiU6FC2CuH/6AtV4C+6wscRcEshb+Ro4U=;
 b=DDqEoBy5cZN89RVS4HRZWZ7ENJOnbc74wsrIgOF0UOSBdV/OREIpQ2j8KlhwPNyUd4
 QirnH6SXdf8owivKhUnBLrjdXVE9uUhp9QJ/dJ+lHuPVMh6xvbhXT4VLzVUb2SPyKJt+
 7/+3Bc5+ZYKwZTCHrvAp5NKc7MWlsXGynw4l977qHlpY6jhKRxyJlvp/77W+pfApHiPn
 4gwRlv+mvdP6uSyJde7GFD2QARvCfweWwfd2hvbXJs7ahtWowEOs+DNgZ19ciQeQCDjL
 TjyaZiELqx1E7aomChrd1rNYz9PxU4dd0ODxJvmigtQ9kHCiOWQLepTUHh5419liBeTw
 g9iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YCfveSGpnLQiU6FC2CuH/6AtV4C+6wscRcEshb+Ro4U=;
 b=CVZeDOPSdWcX250In9og/EUPd3tUTGLAK1LZcnpdQcS1VUPZrYb/iRRfGC7ngoBny6
 d92LFjdqPWbKNcumNL6Q9Qp8oucf9GnMoy5wvvALfZ2bErpNiVdNcX9PdDcll3DhbwYx
 JVI/X3abIyfbzCHOebdxr/Qi4DmnhgWeXVZSrQz9q2/5gvxjIzeoxuYbFMxo0cbAz2jw
 l4MDWMZFexrpCh0kOPCNArhd/ATlgZUGvdFfbfz1GHVgPJiteCwHQ7d6lSU5WF48+Uni
 eLW8FLANKyr4ghce2W0aHpszEG57IIeaeYgvQ/SG+36zbmdme3bWIAVvRL/c99nGVIfD
 fPyg==
X-Gm-Message-State: AOAM530yTUe7HTptt1vKJlECuwHtMmYzLAYH9Hi1SzWLodW2DreOlBR7
 jTVjpCNsoO6eUgTKhU1TOQhrHBEFSa6zh5szwU3ubguyNf0=
X-Google-Smtp-Source: ABdhPJyJ9qejj8xHnsHXBMeb/LjNugZ6Gr0qB6KZuPiCjFzdTZYz/C0Bg2rcmrjh0x1ZqGmlWXda3c8tpLT7K+Z4xVY=
X-Received: by 2002:adf:ee48:: with SMTP id w8mr5240426wro.263.1632821117787; 
 Tue, 28 Sep 2021 02:25:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210928020039.184412-1-richard.henderson@linaro.org>
 <20210928020039.184412-17-richard.henderson@linaro.org>
In-Reply-To: <20210928020039.184412-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Sep 2021 10:24:24 +0100
Message-ID: <CAFEAcA93D=JxvkBB3J2+FnW21OXoGm2P_keLdshNt8Jd5c4y9g@mail.gmail.com>
Subject: Re: [PATCH v4 16/25] linux-user/nios2: Document non-use of
 setup_sigtramp
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 28 Sept 2021 at 03:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/nios2/target_signal.h | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/linux-user/nios2/target_signal.h b/linux-user/nios2/target_signal.h
> index aebf749f12..fe266c4c51 100644
> --- a/linux-user/nios2/target_signal.h
> +++ b/linux-user/nios2/target_signal.h
> @@ -19,4 +19,7 @@ typedef struct target_sigaltstack {
>
>  #include "../generic/signal.h"
>
> +/* Nios2 uses a fixed address on the kuser page for sigreturn. */
> +#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 0
> +

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

