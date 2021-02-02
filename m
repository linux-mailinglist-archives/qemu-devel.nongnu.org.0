Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 929EB30C5BA
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 17:32:18 +0100 (CET)
Received: from localhost ([::1]:41392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6ybB-0006YS-Kj
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 11:32:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6yMo-0003XZ-5K
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 11:17:26 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:41591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6yMi-0003rc-Fo
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 11:17:25 -0500
Received: by mail-ej1-x633.google.com with SMTP id f14so6570292ejc.8
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 08:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yH8dRR3VCm4mhJ+0POYrTJGSGnzi4HESWi++Hlvr0Zo=;
 b=c5fLv4wWUnTjH7tsgiNQPXlvyp/zxJPEydDvPi/ZXeu0l7zhsWxQIdTe2Ezi1gkU+r
 nABin2W0QyXKggS04GlhwDuk9HlkmE3Xjx4TtsOODLmMuP2FF40J+QOYu7mbw4+WHLae
 7yQj0EsQNPCki3i1vVRqE+pyqcituEX+77zhN9jEEGfxJjfjbhd9NUpsEA2+4xQjB4fF
 hD+ece70c28OrRH2zeXoXs3R4yT9zJVrdxnOpbYZ7quRMF3vYqkj7B1DN/N7VAtUxo55
 Qkx9/fYKzqJyAanBTEraJgWOilm/7C9BPqtkjA/pJEJNIccYAtTxsLNQ8GyWyN27O1ox
 jETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yH8dRR3VCm4mhJ+0POYrTJGSGnzi4HESWi++Hlvr0Zo=;
 b=TL+yRGGxGHZj5uZx4HBwb3sU5t58Y2NzdeqPqz1WxIoNwqRPzi/tUApk4Gur4/N3/r
 4ShxrvTc072vQIUUFIYp5B/muwH0oNQOnDRADFne/Vkk1bvhI/kl7wEg2gKN1ydrlUtl
 lP8Vyl21AbhjNIkukUy18pbhrT6bCRhQGQH6yPOZUzsHzV8aHfzV2eBFikEKtl1lmmHq
 a/hNTU6787zBM5KkHxOhJXQMNeGLurnQyjivP8vG8CYfOoiDd/oUFMXHRa+jbQyN254w
 8hKzQrC05sgPeYHZIYQDULB6MK2P4eJ9Q22+ENZCzvZLkvn3sAVyBJK5faHAX2salj+u
 IWdw==
X-Gm-Message-State: AOAM530FR9k0mhlNaKxu5+QztvPjgXJSC6rj9C9xOVMkS4I6mpaAU0bs
 c5rFb/qw+ZNJG0BGKXnX1swq+yKED929xSBj5bfN0g==
X-Google-Smtp-Source: ABdhPJwmSveVWZ29wMWWuGyO2goMmCV0+KA17ARMexogpC7jCBwm0uHzamiGzVObIu0XhdnjMuhcmoJTdTL2HDmyHA8=
X-Received: by 2002:a17:906:1d51:: with SMTP id
 o17mr2536670ejh.85.1612282637068; 
 Tue, 02 Feb 2021 08:17:17 -0800 (PST)
MIME-Version: 1.0
References: <20210131164406.349825-1-f4bug@amsat.org>
 <20210131164406.349825-6-f4bug@amsat.org>
In-Reply-To: <20210131164406.349825-6-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 16:17:05 +0000
Message-ID: <CAFEAcA9x4mS2mtbf-+j34VKELYd_xhExR_0sndjQy64cmNLVkA@mail.gmail.com>
Subject: Re: [PATCH 5/5] target/arm: Restrict v7A TCG cpus to TCG accel
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 31 Jan 2021 at 16:44, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> KVM requires the target cpu to be at least ARMv8 architecture
> (support on ARMv7 has been dropped in commit 82bf7ae84ce:
> "target/arm: Remove KVM support for 32-bit Arm hosts").
>
> A KVM-only build won't be able to run TCG cpus, move the
> v7A CPU definitions to cpu_tcg.c.
>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

