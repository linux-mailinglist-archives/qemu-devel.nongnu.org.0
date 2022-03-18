Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9870F4DD904
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 12:35:12 +0100 (CET)
Received: from localhost ([::1]:50370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVAsx-0000DC-6i
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 07:35:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVAr1-0006oI-R5
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 07:33:11 -0400
Received: from [2607:f8b0:4864:20::b34] (port=42882
 helo=mail-yb1-xb34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVAr0-0007mY-4z
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 07:33:11 -0400
Received: by mail-yb1-xb34.google.com with SMTP id u103so15279971ybi.9
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 04:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uyYwVfi99L+VoqlqiP+4CzARSg/tg1ZHsiv7iuBLOoE=;
 b=t7lM5RbJmFGelAIXdEboHHUgxMvdhkUjBz0vxi1t2ZVcBdt1wB4bhVgNq/5cTyBVXt
 4aOyUfWefiTDizJKsWsSTIuMxQDGi96+VIWg94S0AiQkc/3wOmoOxeGhyOWkvz81p3D3
 gX0UoizPPKN3Yd/KogZVmibcxy8ZEOcngoVSxfm7xYyPz0kWq3UaF5A1sTpg5Ck/6YdY
 iY183m2Ei0DtEAK/6GjRnkecU5tkdlmXrVsAflVuMy5P5U75PlrYQ/Kush5t/H4/Eqsh
 jpHlXVhumxiaUXw1h3YAihbLHj4ANSSKMNIwD7cjmc956zzGNgj8k+xDV6nBssJx7x2p
 Xzyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uyYwVfi99L+VoqlqiP+4CzARSg/tg1ZHsiv7iuBLOoE=;
 b=7tWdgdeRVs3lXLnlf6jq/k59NbPJamNuq/WUPm06ghIFjDOLvdQf+Jclz8K0KUr1e0
 JvoYMTWmyz59+udTB+7XanI1XS3gk4dFxRRfYCWkg02rGSOR1jHbpnhsyreR9B98cLSq
 BVByyD4U7gyHo3vKdiwPVkwhp+v5ooSk/ygaRbPQzXdlb811Himd1fjEOmrcNTaRSYaT
 lhYCg+a1/OO3VHxQscG5vhmuaHYqXJzMm5FuwYkMjSuzu0gugBha97d4KVywumPPaPLL
 7DI3LP417b4mX23+w7AJTdvoo1VY5+AiFi4tfY7086RXStbtM+f5CgA6Rcu/Ib78Kc7J
 vx2A==
X-Gm-Message-State: AOAM532hrNcn+tNM7FVQ2c8yod5RFcFUMrLdpHYNY/wRBBfbAKzbMsWl
 6AosA5PsA3waLV50AKl6uw+W/ErWjJOgl+upsvjmfw==
X-Google-Smtp-Source: ABdhPJyDLCeOoFXdQd18DL2b0sIeegnvL0D801S0ftiBLMYH5vgjLjyA2GS60SAo6mXFt35TiDxzU32Rsp+Ef1xLc2I=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr4704518ybq.67.1647603188342; Fri, 18 Mar
 2022 04:33:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220316164645.2303510-1-edgar.iglesias@gmail.com>
 <CAFEAcA9EYK7gS4bDToAXXD23uzhEazVeP--UGOrOX4wF3P-Fug@mail.gmail.com>
 <CAJy5ezopSM=N+rdmPs=PTerJFju5286eBRy7qMNwSOB2ftU9_A@mail.gmail.com>
In-Reply-To: <CAJy5ezopSM=N+rdmPs=PTerJFju5286eBRy7qMNwSOB2ftU9_A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Mar 2022 11:32:56 +0000
Message-ID: <CAFEAcA8TMW7=q1ohZ78Z75Hb8iGmbF_wSwiajKC0mvACGw__Vw@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] hw/arm: zynqmp: Add CRF and APU control to support
 PSCI
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b34
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
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
Cc: luc@lmichel.fr, edgar.iglesias@amd.com,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 francisco iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Francisco Iglesias <francisco.iglesias@xilinx.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Mar 2022 at 19:21, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> On Thu, Mar 17, 2022 at 8:15 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Wed, 16 Mar 2022 at 16:46, Edgar E. Iglesias
>> <edgar.iglesias@gmail.com> wrote:
>> >
>> > From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>> >
>> > This adds the necessary modeling to support some of our firmware
>> > tests at EL3 implementing PSCI (TBM). These are the test-cases
>> > that were previously relying on QEMU's builtin PSCI emulation.
>>
>> I wouldn't usually take patches new devices after softfreeze, but
>> on the other hand this is addressing a regression, and it only
>> affects the xilinx boards. Do you have a view on whether we should put
>> this into 7.0 or defer to 7.1 ?

> I'd lean slightly towards 7.0 (to allow our tests to pass cleanly on 7.0)
> but it's not of huge importance.

Yeah, I agree -- I'll queue this into target-arm.next for 7.0.

thanks
-- PMM

