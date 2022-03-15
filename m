Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EDF4DA23A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 19:20:59 +0100 (CET)
Received: from localhost ([::1]:40204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUBmy-0005Ip-Rk
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 14:20:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUBeJ-00008J-Bz
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 14:12:03 -0400
Received: from [2607:f8b0:4864:20::b29] (port=44018
 helo=mail-yb1-xb29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUBeH-0000yR-Uw
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 14:11:59 -0400
Received: by mail-yb1-xb29.google.com with SMTP id v35so75470ybi.10
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 11:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cYrrnYCqdg9IKcw07D572OU+DjPuQoglS2UHEjaMEJM=;
 b=FlCAdX4yu8Ca9Ai3sRaDEKl89XQf8PlHUUZBsWdG41T9Jcs+K6++IYbFMqHX5CTzry
 BXy3Wq2rJNb3WUCLLG/dQybECj5p50ISRCwS3tWEJZnWXx9To/u5Fqw6MqT/3dL0yhoJ
 ocGh96/4VpKZosR5WB7iUYNwA2j+8tdGeK3h4E8P9T39ywVDrFd0nXatCALWTja6nSzr
 Wu/sJAaOn1sE0Y0FVsu6ajextzTf0Pl+fQehe4dY3Nu3jIJg79icLQ9JRt1jNAEycbY4
 IOo5toh4tsVf+mw8dAy5PxlEwZcMlkm68104BA3CbFGShvXRwnx5jR7bu6IPfmsq4kbt
 4cbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cYrrnYCqdg9IKcw07D572OU+DjPuQoglS2UHEjaMEJM=;
 b=In8uNLzK3e4yUjkQJGweGRnbLeseR5ngLfKubFp1NdpQhkF0/kQJl6Yih1tJlNkj1f
 5wZsbvej9QYchKAkcPpo1SWnieTPCNt3pz6mHDgrsaqRMLvKd9H2+zTFgGRqMW493GrK
 85Jlj66rWPjBKrWgvi81XAbBZhq3KAnb55nBK7OCrGrC1k+NcO3midY0rGBw9o8yjWgd
 CpvO2jiJV7WPR7DIizYlCicnP8rpkkgDv9LtCw46689NCq4DgU+Axp7vZF/Mdh3AqED/
 A7gaFOeRhEI8qKZHFL3WnlIsg5mikYC7MNvGf+gAsFNE7nzqNWELXXSsgOkwYTPSNz85
 Y5gg==
X-Gm-Message-State: AOAM532+U/0IrSQcfU3otmBu4ZVFeFQj5UntmkPVGhk7IhAM48jT3ZQY
 zGacmA3ci6LmuRbP3LOk9Cyycwif0/TUa8pCZ81Llw==
X-Google-Smtp-Source: ABdhPJyMife60G/axTnRrsqgFrJ0HNQgzqus/Nz1I8NF4NSoJI/qadLC0Z32djPJc7uOnINmXWhfzkOeqp0yMTSa7QE=
X-Received: by 2002:a25:b11c:0:b0:62c:16d9:c028 with SMTP id
 g28-20020a25b11c000000b0062c16d9c028mr24858139ybj.288.1647367917112; Tue, 15
 Mar 2022 11:11:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220314044305.138794-1-richard.henderson@linaro.org>
 <20220314044305.138794-2-richard.henderson@linaro.org>
In-Reply-To: <20220314044305.138794-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Mar 2022 18:11:45 +0000
Message-ID: <CAFEAcA8iATdOk783sMM16_p-kQQmu+T73trWnuCJiv+2hqmK_g@mail.gmail.com>
Subject: Re: [PATCH 1/3] linux-user/arm: Implement __kernel_memory_barrier
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Mar 2022 at 04:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This fallback syscall was stubbed out.
> It would only matter for emulating pre-armv6.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

