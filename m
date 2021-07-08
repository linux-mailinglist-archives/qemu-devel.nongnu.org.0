Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 763933BFA5C
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 14:39:38 +0200 (CEST)
Received: from localhost ([::1]:33900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1TJZ-0008Un-Gh
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 08:39:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1TGC-00051x-Bp
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 08:36:08 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:38764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1TGA-00028X-Gr
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 08:36:08 -0400
Received: by mail-ej1-x630.google.com with SMTP id gb6so9336351ejc.5
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 05:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gygvwY6+X3zRzQejl5ZncR5ry9yItbFYKkLsTUCJDpA=;
 b=TWIQvugO1DPibeGU0KsY/ZEAoH89x43Lm9N/rer1TJ/dg4Fw9Dgme+YqdIO7Ao3lo7
 GGGE+OeaMr+bIfqnRYf+N5i9D0ePEFlPJiTW7CzvijRGI4ATWL1solCHcGLFVYBFV7uX
 Oa+sS/E9SXF6j1q4yXTu49jJrKRWYsm/2DngTsZwUbFyPnYQHlA2uuUfui3n3z+tana2
 B38nWjiEtJ1Lu5qF4sOOk8s42JFB3WGRV/ooPo86Knb56jC/KCf/Q+GrNzcGj8xWoJUm
 W9Y1Q0gtwjUp9gldJS6S6HS+OgAEqSER+WSO8al9GODA4yDhONoxa16qir/QI2TBQWbV
 nwGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gygvwY6+X3zRzQejl5ZncR5ry9yItbFYKkLsTUCJDpA=;
 b=Uk7md3HwJN2ELj3F2L1UwJ9UDYtKtgTbG+9NwmhKvIk7rv5ISmYcLugrAR7ouWOPIA
 1/f5YpXiXEfcp2FZlZ3bljfThXW+KoHVKxNQ8K9wmxxC3jptF2gBAvzh0BylXIFpxXd9
 SClU777+vdSj2+8e/erFf+LtLNVb1vqDGr0g/sg6OXg9Nnmfi0EsZ7RMXe023+Elb7hU
 ecmiMqEophmuYbroYxbbFA3g+6RMwATQzNKfAnS1mu2k+wXRxLqaefK/4WQErYsIg35j
 YnegivSauP398D/MSVFN5iJlaSbJr1Toge4G1nVc7UiqtpEYcWOT4AD7Ig2qyJW02bAB
 amow==
X-Gm-Message-State: AOAM530xFRA4Bn5HNYrpLHyaYMVhNBQhJ+9QhQ7kysH+1utknV5pta5c
 eO2rHNg9XpKq/2GiuOINmMbl/FC4MpvlDY77AVkNVA==
X-Google-Smtp-Source: ABdhPJxkjZCwUXQGgyzery+/KpB+TK24aE49RPO1Sw11ZILv+blLCL0COnAM9XfzKzT2F/ZmLsa8BxrkmFARZQPF+Ys=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr30409822ejy.407.1625747765106; 
 Thu, 08 Jul 2021 05:36:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
 <20210630183226.3290849-4-richard.henderson@linaro.org>
In-Reply-To: <20210630183226.3290849-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jul 2021 13:35:26 +0100
Message-ID: <CAFEAcA_Axi_+7Oc=UkTpdeBDRhJDWjbGcR9EZa87eK1PFWU4+g@mail.gmail.com>
Subject: Re: [PATCH v2 03/28] target/alpha: Remove in_superpage
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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

On Wed, 30 Jun 2021 at 19:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The number of links across (normal) pages using this is low,
> and it will shortly violate the contract for breakpoints.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

