Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8203AEAE2
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 16:12:45 +0200 (CEST)
Received: from localhost ([::1]:42430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvKfM-0002L6-Uq
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 10:12:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvKdK-0000i5-Ia
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 10:10:39 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:43829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvKdF-0001YS-Vw
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 10:10:38 -0400
Received: by mail-ed1-x532.google.com with SMTP id s6so19106757edu.10
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 07:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SR8u0mvH9hJWntEEuAgNyw2mftQEf0JG5f0r97QTFY4=;
 b=vH44BCHyqDxzGWfyzn7OsVUisTvYFDYiPrIGp1BxcyNjIxjl8xdtokMFjt9psQmwdV
 ANNDZaRBU69ec1QuVK1o7vl52QqLCoj/xDAVIWYD/4UxV4SgAHePBwZMiSsnij45jbns
 2sPhXPl/uvYD6lhVN12ehIuHvUNEPCjFUOj3MM6Pzs5WQvZzU9qtI8tJNCli0sAEMx+N
 LwHu9wViUjHMREtyt5khezd0KXyNKPogKEP1v7Fvi02fZAxU6Zp/LO/Pk5Ft8QuK1TbB
 Ezg2d0bdw8RLeeJo/ioRvQ7CeC6zFr7NPmILQqIy20Pdu6uTBbdEhOtgw8s5VVwQEq9O
 KnkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SR8u0mvH9hJWntEEuAgNyw2mftQEf0JG5f0r97QTFY4=;
 b=XUUb0I7y3zlrn5bswty3G88o6smy6MdhWYpKcSHYnYIWtocslNDILCI/TeW2lZE50J
 f01zWIn8d/5SdTovqnvSMhLh0dfE1+HuR5yPD+7KxGyyx7f5PenjukRQSfKOadnW1FHm
 psCGwh+Cho1EHn+AvvSIytIB5eyadmm/RARZAAldCTGvc49BoZiRC35hGmnEJPOKIhIY
 2yjo8QTaUmGcl+zbZPMlAIWFrEOMVirUdh7yhVNDAGBW0qdtCzR37IuAa0N/a3i5BpiT
 VYUuVBaI6ET/uSM/QFKYy07fbd6qQnsGVv/PXXO+rO46cAN58dLOOm6l4bIKxK+dC6Ob
 RaGA==
X-Gm-Message-State: AOAM531TeUrZbXCZt3A1aYaBC1E9OvWFhvnwlVqzirmtXhY6CUthJtQa
 NdngqaUX+SqvZ7EoCcp/01+vSWhLdhstVFsnlEfMtg==
X-Google-Smtp-Source: ABdhPJyru8I5sa2x1ZbuQ8MwIEuO2qH0tCNl8GUa1z7uaNMsCmdyvo8PziKRi14NfmLfSh2NDqEDx9zRpfFlZ9dxTSQ=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr21421873edt.100.1624284631984; 
 Mon, 21 Jun 2021 07:10:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-5-richard.henderson@linaro.org>
In-Reply-To: <20210614083800.1166166-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Jun 2021 15:09:56 +0100
Message-ID: <CAFEAcA_QTaNWKyDz8SdAgviR_S2_xZoxrqvc+D_bMx3xot=c4Q@mail.gmail.com>
Subject: Re: [PATCH 04/28] tcg/arm: Support bswap flags
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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

On Mon, 14 Jun 2021 at 09:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Combine the three bswap16 routines, and differentiate via the flags.
> Use the correct flags combination from the load/store routines, and
> pass along the constant parameter from tcg_out_op.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/arm/tcg-target.c.inc | 78 ++++++++++++++++++++--------------------
>  1 file changed, 38 insertions(+), 40 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

