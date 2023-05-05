Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB09D6F82C3
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 14:16:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puuLh-00080M-St; Fri, 05 May 2023 08:15:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuLd-0007lN-Mv
 for qemu-devel@nongnu.org; Fri, 05 May 2023 08:15:42 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuLb-0007uA-Aq
 for qemu-devel@nongnu.org; Fri, 05 May 2023 08:15:41 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-50bc4ba28cbso3066773a12.0
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 05:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683288937; x=1685880937;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lO3eW3fZaLa0+rwzfl2C543xJ6D9lu8K8c+iPjNoRVM=;
 b=BSr7gm6LMYphEseQIwyCeggFciVQedUb13wAHIamWju5kbbWmqFDUI6rPQj8mf4zhy
 yk1Nc0iZAYYv6qJv/44p0GxjeCW2usjWMC+a51Y3JMc0585UeuBwqxDeP0IJz1KqAsub
 w+ogk5sBc8qU8UgS1LlVFi2DVJrnYclcMLrZwrAYpfCOHAPSZDIE2BOEompjEdPHEb/B
 SEQcfLgYZRS39r7SJKFLyvv97wAF+SxSvCGGR2shsnLWV/zWsOtMydFQk04skdbV6oAI
 Z1Sx/XmqlzhZtTUYPaGu7MkrpFcAEHTYvVd6O+cWrDckVPEa2KfvRrF8KmmX2Nfx5V+X
 t+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683288937; x=1685880937;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lO3eW3fZaLa0+rwzfl2C543xJ6D9lu8K8c+iPjNoRVM=;
 b=J8cw+2imvnIjPlmCq7r/kuRaxY+SjvVoVTvyZPWdaoLxf/lC+lYTgNKgtK8Hfb6bpg
 Tu5dhxA3ukmPlS6+ZS2FquTi22UA/wl3D7HJ0AT21rlf1IOtbH5YuGjgsKQ1ICcOloYn
 TNWhfuGiVBfXgzie+5VZpKIvVMcZHuu/RhooukZvwBv4qs8NZKc4sFv5cXFJy7loajRi
 MOwkAQ1z+ZldAn9UJdjBQ3RAjL0I3gp4Bza5Zwcy+RLXw1eGsn9jK6hCUVM/1OdK8tGa
 p95cECIsA1mdJHSLr7+SZ2IcMJIB16mYizf11AaNcdtswRzrQfGw9GZu9+/gI/lXX7jY
 FWEQ==
X-Gm-Message-State: AC+VfDw8I9hb3kXbEo4lzPs61RVRzBJPkedWBJOThIvHzDOUWEwP+gA5
 lz4nc7Fs7w9UBoIO47AoW+EWANqJMVnDz+fAx7ACrD35XpPLH++K
X-Google-Smtp-Source: ACHHUZ5ACWXELeAmP2r8O/H2wf7FX3FZcKdmmqHjkvb9BxsDT/FmA5JPrRn4oAm9OIzmxHkfDljBz9GNFWec+X1l1vg=
X-Received: by 2002:a05:6402:3456:b0:50c:cde7:285b with SMTP id
 l22-20020a056402345600b0050ccde7285bmr1370834edc.29.1683288937699; Fri, 05
 May 2023 05:15:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-28-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-28-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 13:15:26 +0100
Message-ID: <CAFEAcA_t-1-ue7PSKd3oXBD04wnYHJu869RRc1J3XuP+40-bmg@mail.gmail.com>
Subject: Re: [PATCH v4 27/57] tcg/arm: Use full load/store helpers in
 user-only mode
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 3 May 2023 at 08:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
> This will allow the fast path to increase alignment to implement atomicity
> while not immediately raising an alignment exception.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

