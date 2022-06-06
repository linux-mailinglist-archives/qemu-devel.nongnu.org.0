Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 255EE53E44F
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 14:15:46 +0200 (CEST)
Received: from localhost ([::1]:44432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyBe4-0003AT-NK
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 08:15:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyBcd-0002G7-7s
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 08:14:15 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:42629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyBcW-0007Xm-Qq
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 08:14:11 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2ef5380669cso140756197b3.9
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 05:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JIdPmc1YBJ8vzAMfiIbKjD7kCmqo5jCkHEkoAgC8fak=;
 b=beJmeu6meGCdJSi4T/koKo8a7JGLcZS8H2xKGOZH5zsSu9xOjV2BC6OQSlvkqH6CuS
 8cZxo/ONffwF58mSOiBdesmFOB5N3iDfZBEMn/awHQu9RG6/jaBRCLwQQf5XMkxop2L9
 ey6QfbgMZFHLFOIYGL3kkyvFUAWSckeLhJuBxd7b1djact/qH+sAsJA2Pvn05mvG3lXh
 c3Vx/wmHviFhE5eSvBWtmuaaEAPklzV99ad6svdU0OAwKMQRFRYVYjuUbseMRbcQG+Y/
 HmiQwrhOAjHUaZXHfqdmL39B1ceLaZMI+foAe0hZGAQZbQ8KeLQUGCaDrvX27sf1eVNy
 Snog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JIdPmc1YBJ8vzAMfiIbKjD7kCmqo5jCkHEkoAgC8fak=;
 b=P4RmD/5nX+xw9wDXvaVT4tUJhUvelmce2Hy6+Yh/og/po3NfFxVRuScut2wOmtcurP
 MgOVUYocYUTHJKlTDLhovYjko+pDYFF7OIyRoONwtTa3Fj52iq1vLVHGnM3GE8LKhIit
 zV//pFlp9gqgQuqxf9bUljnAVtq5yfdReGDZDJXp886ReoFtkGFDdcOZ/VCfGJuNT7jf
 Kap6q0poLwJ5eVs9GCylXfhmDa9Z369PSK62bGC2BsQkE8tdCG1SVlkdv7mm3jauXjAQ
 xJB8BVkP08KxzJXPFAxsvOSQy+273U5iqqtyDqhjXOagsuNiB+VYVmjKl6Lh/xlQwnNb
 Qq3w==
X-Gm-Message-State: AOAM533K58XnA6HkXZXTxLCjQ4tHDT/qR/IA/wD1QhTXP9AVFsAzpJXA
 0dk3A5D6SMeL3jwRxsQhnuFrFNXU/qJ9MoD29Ryzvg==
X-Google-Smtp-Source: ABdhPJz9cTe3PzNh/zCU3+/tCGx/vIDhJt3VK72TiV6Hk/e/TpegKyCWcE4dyiwlpgldzIlijFK63se8GSGrr2Ik8y4=
X-Received: by 2002:a81:1a4c:0:b0:30c:8363:e170 with SMTP id
 a73-20020a811a4c000000b0030c8363e170mr25132481ywa.455.1654517647602; Mon, 06
 Jun 2022 05:14:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-4-richard.henderson@linaro.org>
In-Reply-To: <20220602214853.496211-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jun 2022 13:13:57 +0100
Message-ID: <CAFEAcA9ZCSHakozNwoN+LiKG6vpJM8QqBPsJm0oRBJi0SqYVRg@mail.gmail.com>
Subject: Re: [PATCH 03/71] target/arm: Remove route_to_el2 check from
 sve_exception_el
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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

On Thu, 2 Jun 2022 at 22:51, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We handle this routing in raise_exception.  Promoting the value early
> means that we can't directly compare FPEXC_EL and SVEEXC_EL.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

