Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD4F398EBA
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 17:33:49 +0200 (CEST)
Received: from localhost ([::1]:34558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loSsO-0006lQ-0E
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 11:33:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1loSqx-00062p-1k
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 11:32:19 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:42982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1loSqv-0007fg-AH
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 11:32:18 -0400
Received: by mail-wr1-x432.google.com with SMTP id c5so2724307wrq.9
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 08:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=1QZLj35CSWXc4MKeptcNiWFhJpaZJbBeYZxzV+x6UvM=;
 b=RLA78mW7m1U4MPGU1VnEPoIu/WFYLUdnT/S1ffn/shms+f8lGZ4C/wennjjXJatCNj
 PUJ+EUkPVDm0kmxdP6HYBO3lTgumoyEAh7XOF0zs2ZWIWNQKRSK0Wm7G+KQ2ImcSAot7
 GzXiqSR7f1IAoCYRdE+EJjrhjIoj6UwGq4YnfUOiB0pUSWNpJ7050dlSjFsH2BVyPFNt
 ZzgujQLyVRrqXk+5zad0/ARFKf9EdxmJsTaepbkc61kCfssMPMK+NiWNXOjpXbNLw8vB
 YEmLJ8TI7XBY7iz5UapIk3mWNzQKBUFf3Yh4TXrcU9PkYkCnpEhwjmEfraoyYrvI+yeI
 n11A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=1QZLj35CSWXc4MKeptcNiWFhJpaZJbBeYZxzV+x6UvM=;
 b=gtfHSu+VqBxEYBxfGwdWRFTGEIOmmfoyuRZG3YJAVN0UdBeXA63nFBagDTEsDaml0g
 mgsNHHsG3Nj+DLo61TMK6+VGnCBYxjV9qenNj6M+u+E2Veoxta9LBWnq6aL5eNU97PZt
 T6b8O/c/vcqd2fRIpBzRCg7fns3lLR1LgiAXoe7jnoxwd83VOf2pxEU4JlCUBi1MQPgQ
 RmErezXvn8EnRc3rK6Sqbrz0jI0yJ+ZZ7SwTx++6578x4a4M7HW0Hwl94dUnYxNvRy9W
 u1uBu8bhX+oM4nxSaDB5vhBHB4ptQKsDtR/LmCaIhecizhYz91bDKOsXWh/jJAVgSRiE
 lA6A==
X-Gm-Message-State: AOAM532XtMU+AoxhrWwQcCy3Wa1xBKYOy2VSSa9IA3mxq0hZrxMBAkCj
 moHuCScnQA4mugudchsJHdzQUQ==
X-Google-Smtp-Source: ABdhPJxeUuWay3pGpexBORP2uFzUXeK5CbDJLVhAKa4J0ZveMJLzmQ1uaGWq/ER4wHgVlYaTr3FdqQ==
X-Received: by 2002:adf:df8a:: with SMTP id z10mr6364463wrl.62.1622647935212; 
 Wed, 02 Jun 2021 08:32:15 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x3sm3137676wmj.30.2021.06.02.08.32.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 08:32:13 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 052EA1FF7E;
 Wed,  2 Jun 2021 16:32:13 +0100 (BST)
References: <20210525150706.294968-1-richard.henderson@linaro.org>
 <20210525150706.294968-26-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 25/28] softfloat: Move floatN_log2 to
 softfloat-parts.c.inc
Date: Wed, 02 Jun 2021 16:28:54 +0100
In-reply-to: <20210525150706.294968-26-richard.henderson@linaro.org>
Message-ID: <87zgw89tab.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Rename to parts$N_log2.  Though this is partly a ruse, since I do not
> believe the code will succeed for float128 without work.  Which is ok
> for now, because we do not need this for more than float32 and float64.
>
> Since berkeley-testfloat-3 doesn't support log2, compare float64_log2
> vs the system log2.  Fix the errors for inputs near 1.0:
>
> test: 3ff00000000000b0  +0x1.00000000000b0p+0
>   sf: 3d2fa00000000000  +0x1.fa00000000000p-45
> libm: 3d2fbd422b1bd36f  +0x1.fbd422b1bd36fp-45
> Error in fraction: 32170028290927 ulp
>
> test: 3feec24f6770b100  +0x1.ec24f6770b100p-1
>   sf: bfad3740d13c9ec0  -0x1.d3740d13c9ec0p-5
> libm: bfad3740d13c9e98  -0x1.d3740d13c9e98p-5
> Error in fraction: 40 ulp
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
<snip>
> +
> +    /* glibc allows 3 ulp error in its libm-test-ulps; allow 4 here */
> +    if (!exact && ulp <=3D 4) {
> +        return;
> +    }
> +

nit: some whitespace there you won't see unless your editor highlights
it and you've been tweaking the checkpatch invocation :-/

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

