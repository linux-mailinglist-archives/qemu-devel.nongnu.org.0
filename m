Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B4A3AF651
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 21:42:55 +0200 (CEST)
Received: from localhost ([::1]:32892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvPos-0000Gk-O6
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 15:42:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvPmk-0005gZ-SA
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 15:40:42 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:46608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvPmj-0001W8-2x
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 15:40:42 -0400
Received: by mail-ej1-x62b.google.com with SMTP id he7so30637257ejc.13
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 12:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4kH14VxK8XD9Y+NJZcYT9At2MarQn3LtmKPM43KLRmk=;
 b=PNGMv2efF3J4/zpnEV0BTDK6vH5IO6//GWSKE/7fq6ArXZvaZQ1tB6PWPZqrWGNQYH
 XpueCHt5mcOJxY7/L186nZCf3Jjr3O9ObVnvTaFNB6cKFvk/GYQ2uQ6udLwDQNQQDRyu
 wFQfxwGNxMgjYy/n/rkC2eohkZcUkMA2+ypDP4cpsRvE3GR3DTPQ+uSwHQXMkUaeWdmg
 2WJLGude6W78v4hs0HhqfTXD4moF1KX6yTpgEoTH0xUl7Y2adm6/BLfHp0e0D2jMkgH+
 OwkPj8jBsAiMFPIe8chSbJpy1h0zv9NQ7+um0FsIfVmPXhCRL0uNAeKPVQExJKP/5JJf
 +UvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4kH14VxK8XD9Y+NJZcYT9At2MarQn3LtmKPM43KLRmk=;
 b=aI6rnlYgGjl7az6AgO89fdc1LU19FyROJBxbdBOps/qYzoVhB/yu7fnhKW+WxYvxoz
 dmrIdSLXIbjPkhLUmX22FbrsRuzoKUAY3ACEeGoTuA2BF83zlTdBkQPwz/0rYS2faVQB
 wOunkNFPYYC2MYKXDBet2uXbFPZhhf2KW5uHJujUDjiD79MNYW90/Cqm+Dadk/R9bfCo
 LlfKekkqUu2eTZYtfYZd4K181y6IvazyOCSBMFOz1SSAnhyrg0c+L6xJYJ9zlGZ969FJ
 6z4aVDrE7dgLIN2otGTp9oOUxQi3JSw35R81MDEiiwuk9n8LNV+xUss5nH7OZSVP49nZ
 VO/Q==
X-Gm-Message-State: AOAM533i/Ah2AAxw5t10/M2r1//QQpLHSWF5nmIT53zG1a/XQrW4WHI8
 tu/OIhaRWPf7KAeXkJQhJ17aTCSRZVcC+IHFuvW7gg==
X-Google-Smtp-Source: ABdhPJyMEjh8QZH588Wa0Z4jXJ0wOjoNhjOkAVMnZqhI24GRlp6MnSDbyoUNJtyfXoeDTrbiapm55JA7ilBdiYvSuR8=
X-Received: by 2002:a17:906:90c4:: with SMTP id
 v4mr11746918ejw.382.1624304439339; 
 Mon, 21 Jun 2021 12:40:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-4-richard.henderson@linaro.org>
 <CAFEAcA-VMwff+-qzzwR_VLpZCSxJqga9ssHSDiLq9LyHKhPPSw@mail.gmail.com>
 <5a03a209-567a-df86-1b47-9cc39d82eb7b@linaro.org>
In-Reply-To: <5a03a209-567a-df86-1b47-9cc39d82eb7b@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Jun 2021 20:40:03 +0100
Message-ID: <CAFEAcA--+n5aJVM9nv53v5cUCGxjPB7GPCNxxGCy02Dm6a77yA@mail.gmail.com>
Subject: Re: [PATCH 03/28] tcg/aarch64: Support bswap flags
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Jun 2021 at 19:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/21/21 7:01 AM, Peter Maydell wrote:
> > Side note: it's rather confusing that tcg_out_rev32() doesn't
> > emit a REV32 insn (it emits REV with sf==0).
>
> Which is REV with SF=0 also has OPC=10, which is REV32.

No, REV32 has SF=1. The two operations are different:

 REV <Wd>, <Wn> -- swaps byte order of the bottom 32 bits
                   (zeroes the top half of Xd, as usual for Wn ops)
 REV32 <Xd>, <Xn> -- swaps byte order of bottom 32 bits and
                     also swaps byte order of top 32 bits
                     (ie it is a 64-bit to 64-bit operation
                      which does does two bswap32()s)

-- PMM

