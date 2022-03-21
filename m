Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B284E2722
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 14:02:34 +0100 (CET)
Received: from localhost ([::1]:59170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWHg9-00068k-7V
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 09:02:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nWHd0-00051z-Td
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 08:59:19 -0400
Received: from [2607:f8b0:4864:20::b2c] (port=40523
 helo=mail-yb1-xb2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nWHcy-0002ub-I4
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 08:59:17 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id z8so27857148ybh.7
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 05:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=miXiYPIuwreFoiKVc9/XXp9C0oW2MN2uqlESLul8SmA=;
 b=eW34QBBDbDTQJreSpCUbpoBGY9xaDryHR4RS/66q7vvb1OeT0ySdjHd2Zz1tOtX4BQ
 T/zw39zu5S+ffFe+dXaaCasprYAxmqavMas3QXI2BkVaVceg7KJ4hIuDzm9Etg5nM95b
 VPpTPKjvM2SpKuae/6xWnqdfI73NX0fOyGbjTjBDvZZ/G85Ii636gVxTru8hiXe0gL65
 uO030A5NbyI6ZCB7tqZ4r3W7g22n9FyVAQ/A1BnKwq6owaKFReh0CrZ6wy8SEhtPJu4i
 07uypzeYKO5ZC8kcvZPX68yEw+3MbhiUvDgKGO9fCEcMnosyocb5xcdGROr444BeUiln
 lmiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=miXiYPIuwreFoiKVc9/XXp9C0oW2MN2uqlESLul8SmA=;
 b=HRJItFAwoI+IeVfKU6lJLB35O/RQNm4vV55SQqbmGLOMvHpPszWagw9iHO5BW6QHdG
 B183qPQhHD/+0ufuBzRGRJsBLJAntsujoFYFXEi4QFDAgimy4DsYdTtC1Vj67mjm6MPQ
 kB+Y54FoLcGgX8X8WoLRiEAiYqWQo673ImXa5hMSOPjmJ33tpuUa9ykvcHwNCyfVcsj6
 cpagY13CaaUwhCv6TPXCGLkyVqIBGwcvln/41jGDlzGgNzRQPeZ13Fn4e0ljbNMx3m4C
 9/zb8tnkqHAs9e764Ruy7l01Wd8bPt9I81Dg9G1Va57mAO/Y84o3jaYBUAFqiL1V3lJX
 XS8A==
X-Gm-Message-State: AOAM532+74ZeVM+FdhNOmknPNHPi6w0lpnluuPDpG9lh8bMsGzZbaMci
 /ILm8bxkZBMfa7NgdSFAhxyasAj3bBdhDxnXkPXTTw==
X-Google-Smtp-Source: ABdhPJzszYztlF62chNu8bMx1LqLLC1h5urF4nj62jd3WgPApIn8nPGNOHm9GbZNLV7TdYU0ioF4ZYvpNQVAAdn/83c=
X-Received: by 2002:a25:d8c3:0:b0:633:c81f:737d with SMTP id
 p186-20020a25d8c3000000b00633c81f737dmr12249681ybg.193.1647867555485; Mon, 21
 Mar 2022 05:59:15 -0700 (PDT)
MIME-Version: 1.0
References: <d60cb762-40a5-f918-02aa-463758205af5@redhat.com>
 <CAFEAcA-jEqnpUdtfgqMFUn_ghwoYM+8UyceLUz+Uo07FuH+S-Q@mail.gmail.com>
 <ab9c9599-2021-42df-7bfe-4f2f3842cb84@eik.bme.hu>
In-Reply-To: <ab9c9599-2021-42df-7bfe-4f2f3842cb84@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Mar 2022 12:59:02 +0000
Message-ID: <CAFEAcA_CMXyq2t4XL58mTfH255LZp4BHuV9_jDvzgkAT56D1BQ@mail.gmail.com>
Subject: Re: Memory leak in via_isa_realize()
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Mar 2022 at 12:11, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
> On Mon, 21 Mar 2022, Peter Maydell wrote:
> > On Mon, 21 Mar 2022 at 10:31, Thomas Huth <thuth@redhat.com> wrote:
> >> FYI, I'm seeing a memory leak in via_isa_realize() when building
> >> QEMU with sanitizers enabled or when running QEMU through valgrind:
> >> Same problem happens with qemu-system-ppc64 and the pegasos2 machine.
> >>
> >> No clue how to properly fix this... is it safe to free the pointer
> >> at the end of the function?
> >
> > This is because the code is still using the old function
> > qemu_allocate_irqs(), which is almost always going to involve
> > it leaking memory. The fix is usually to rewrite the code to not use
> > that function at all, i.e. to manage its irq/gpio lines differently.
> > Probably the i8259 code should have a named GPIO output line
> > rather than wanting to be passed a qemu_irq in an init function,
> > and the via code should have an input GPIO line which it connects
> > up to the i8259. It looks from a quick glance like the i8259 and
> > its callers have perhaps not been completely QOMified.
>
> Everything involving ISA emulation in QEMU is not completely QOMified and
> this has caused some problems before but I did not want to try to fix it
> both becuase it's too much unrelated work and because it's used by too
> many things that could break that I can't even test. So I'd rather
> somebody more comfortable with this would look at ISA QOMification.

Yeah, there's usually a reason that these things haven't been more
thoroughly QOMified, and that reason is often because it's a pile of
work for not very clear benefit.

In this particular case, although there is a "leak", it happens exactly
once at QEMU startup and in practice we need that memory to hang around
until QEMU exits anyway. The only real reason to fix this kind of leak in
my opinion is because it clutters up the output of valgrind or clang/gcc
address sanitizer runs and prevents us from having our CI do a
leak-sanitizer test run that would guard against new leaks being added
to the codebase. We still have a fair number of this sort of one-off
startup leak in various arm boards/devices, for instance -- I occasionally
have a look through and fix some of the more tractable ones.

thanks
-- PMM

