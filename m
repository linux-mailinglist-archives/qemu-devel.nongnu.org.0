Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F7F3FFE2E
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 12:27:14 +0200 (CEST)
Received: from localhost ([::1]:57882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM6Ph-0000sZ-GA
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 06:27:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mM6OW-00085I-9r
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 06:26:00 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:38825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mM6OT-0008Nk-6v
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 06:26:00 -0400
Received: by mail-wr1-x42d.google.com with SMTP id u16so7508562wrn.5
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 03:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=c2F/8FjIh1byNcF/pA5a4AhRnqo/wZO+extLkysUXMw=;
 b=MWEWq0h+fW7GbyAX7xyghe9vFJ40WLsAPdUgWQzbC5lonUxl65bhmnQx5ANRLHBYYK
 vJyim9Wz+gBdLIrWrB1Tar72G9Yg/kEo+w+jiXycJh5fF1b9n/vehG9BsO0cvDt1sj6X
 kY6810J8c+NRGbSi3AF1g6bxXgomHubRjzx1FSbANxAIIqP57HCdCz47Cvurv+8Nybuu
 ovlk6TSmG+F1bel4Ug415yt3mq5KFXv6gomWfeCNANk7ArU37BYsUQFzlq0kck0ZfY4R
 NCfSBDPIbfJRxbXE5BjznVoDrQ0pFLTpOTyWgK8hbBqJmfuB+XQJKybjs7LO66S6bFFl
 D4TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=c2F/8FjIh1byNcF/pA5a4AhRnqo/wZO+extLkysUXMw=;
 b=UwOFXe7xnr8sqmTJuZcUgrPWFInlSz0xZUtGvT/mNBn/7Nzi2HUE6VmNP4fI1YVnhE
 quO61pdHYgzlwY1mPjKKW4DV/uH8+BjnpkE1Um9KSLUs6Vp6MoG+DGUiBgw4Iof2qGeW
 zwwCIZccBuSLeG0KD4FxX/h3qoQe5ovem7Nb4T6wrEt/x9PjMuZ5i6elyKOeyydR4lpD
 4I6W5/VIkwll2qyWwcHmS5wDN60QcPn05NoTutU4rG2oQM1ee+U69OzT+dmKQAwBRQWK
 JxJ8Tq1DDtWN7Kl/D15EHNj3X2IjAqSohyx8/e3Rr1tWLMs5dElIUOEfA1zwwHvFMyXn
 6zyw==
X-Gm-Message-State: AOAM530iiKj8NoAN/fkGdcitwPa39YhX+b21dV1Iu2G+9covfTvwy0BS
 htlvFwnu2KdNbWVMB+2UGWQk3qt5FePJP6L11DNi9A==
X-Google-Smtp-Source: ABdhPJxPURUi3PQPWAfvYqRCNmmqeB49yiTnklZ407IHb9l+b+LeZ5iyZ/qKQpuO10VvX6ZtX50GbYmKmETIVnwNHXs=
X-Received: by 2002:a5d:4647:: with SMTP id j7mr3243687wrs.149.1630664753674; 
 Fri, 03 Sep 2021 03:25:53 -0700 (PDT)
MIME-Version: 1.0
References: <CALUzjTYPpo680Ub6CCx7-N2o=Q6Q6Kh=DLNCcUq-1F0JbCThOw@mail.gmail.com>
 <CAFEAcA89Dua-t14v3DH-LFG+4UDtU81PuaTOruLTQJw+T25eiA@mail.gmail.com>
 <CALUzjTY56_A3mMtvWGFTyyZAKshWSeUfcHWJFFxYSm7P7BuNAQ@mail.gmail.com>
 <CAFEAcA_Zvw1V5=8OxUXerb3zg=C6AGLfQgZ5k1kCY5NGT-CdHw@mail.gmail.com>
 <CALUzjTa1ZNFFjdo6eCy13TCrqAibYLMzJ7JqjY5+GwpukhfMAQ@mail.gmail.com>
In-Reply-To: <CALUzjTa1ZNFFjdo6eCy13TCrqAibYLMzJ7JqjY5+GwpukhfMAQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Sep 2021 11:25:05 +0100
Message-ID: <CAFEAcA_EAx858BpONn+7+wCCxwCOsUm42gUMP0LW5JZwd5AkCA@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_How_does_qemu_detect_the_completion_of_interrupt?=
 =?UTF-8?Q?_execution=EF=BC=9F?=
To: Duo jia <jiaduo19920301@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

On Fri, 3 Sept 2021 at 09:33, Duo jia <jiaduo19920301@gmail.com> wrote:
>
> I understand the hardware=EF=BC=8Cbut How to achieve this function with q=
emu=EF=BC=9F=EF=BC=8C
>
> For example, this interrupt is not allowed to be nested. When the new int=
errupt comes, how can I detect that the interrupt is executing?

That depends on the hardware. I can't answer unless you tell
me what the hardware is and give me a URL for its specification
or reference manual...

-- PMM

