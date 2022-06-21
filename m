Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF5F552D92
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 10:55:15 +0200 (CEST)
Received: from localhost ([::1]:38082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3ZfG-0003UM-Fr
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 04:55:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3Zd8-00009s-6t
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 04:53:02 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:40817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3Zd6-0008Hu-GL
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 04:53:01 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-317a66d62dfso63078767b3.7
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 01:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mVVB+bUuBSrUm13lNCwqzmUAMAbqt0ivESn8oDwRmJw=;
 b=GJT/m5FzqyrX1urOAlLY/Eku1auAdpglVR8TVAVlnSeQKL7U5KVXQXfEs1Nx6Mrz6I
 evAPb1/J0MoS92CTAs+L3QzISPrBwXxLytS1/BdOqttM8OchsMkI7olv6xpAhm78MDK9
 KltsjvkHPPOwH+HXnH2dnXSim7YIdR8I2XKMQRMthnI9TfqqDS9ApAp4xrDwbd1Iajex
 bXlz0gx4Ghq0RceLzNk2qh4XmENfRK54cfu6RnrlK8rVkhimvskSaxWmWE0HGgjOqfDY
 Ir2ADPN05aK1vL8TlB4O3VzXS4XUDDOt1+FHU4nNPKvWgB83QiLbc9A3fd54QV7FEOME
 rnzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mVVB+bUuBSrUm13lNCwqzmUAMAbqt0ivESn8oDwRmJw=;
 b=CDVQLFamr7X/1cZ7zhAac2FutlMZ4Rq6BO1SKoFkP8F0Aa7YltA/fUk6ikGPrsjeU4
 9s5F0lZkLR4aaOWXUjuxD0QnsfaV5k2AbISlyDkeoy3sMVr0eldyoXvOEKB5R75Eghci
 OY0uSJ0kHzSIq7UctHIRqHJfwKfE5n8Bz3afY3Yw97vofJoZhobpbn8hzgNs2StGFjz8
 OC1JeVpreIzEFuwUABQoGOhgoG2TBtC0kBPVIwoE/F9M8IKEjwmoqE5uTt5kb5jgC/C5
 BTNU+4yOMQcezMta5EfZ4/okzuW0otCd8GlWKnAGv5IrSsiB/l6XqolYXm6o55jSJNI+
 x0Aw==
X-Gm-Message-State: AJIora/T72ZgVHkFhRxEPswWXL0NV+AHztP+s0f0KrGlYMgSsCsFKgoi
 TmBvdwoomvDPHFesOEGO10afDpKwsqb26S5/1h7LDGJ3oOs=
X-Google-Smtp-Source: AGRyM1ukPIIRxfkZeAq7X+OisYH6gkczZaRGmQ82oULcu+fTYuhmLQbFLHDU5jyyPQ1oioCBYe1cQUQd26XjVdMf5/Q=
X-Received: by 2002:a81:1cc:0:b0:317:a0fa:7a61 with SMTP id
 195-20020a8101cc000000b00317a0fa7a61mr16836732ywb.10.1655801579458; Tue, 21
 Jun 2022 01:52:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220608023816.759426-1-richard.henderson@linaro.org>
 <20220608023816.759426-3-richard.henderson@linaro.org>
 <CAFEAcA9q6fzATOqHZZ7PZDX_jLiYdc_EsvPEzMqnB+Ehz=uQuQ@mail.gmail.com>
 <f098cca7-cea6-40e9-78b2-46dbf8c40a16@linaro.org>
In-Reply-To: <f098cca7-cea6-40e9-78b2-46dbf8c40a16@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Jun 2022 09:52:49 +0100
Message-ID: <CAFEAcA_84_D88p8N+Jx82-iA8yMZgnqSH5UjqOiKUgKszSYDbw@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] target/nios2: Move nios2-semi.c to nios2_softmmu_ss
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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

On Mon, 20 Jun 2022 at 23:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/9/22 03:36, Peter Maydell wrote:
> > On Wed, 8 Jun 2022 at 03:43, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> Semihosting is not enabled for nios2-linux-user.
> >
> > True, but maybe it ought to be (in an ideal world)?
>
> No, I think ideally there'd be no semihosting for user-only.
> If you can write to semihosting, you can write to regular syscalls.

You can, but there are also use cases (notably the gcc test suite)
where people want to run semihosting binaries under usermode.
We can't take away usermode semihosting for those targets where
people are actively using it, so I think it would be more consistent
to support it for usermode for all architectures rather than just
some.

-- PMM

