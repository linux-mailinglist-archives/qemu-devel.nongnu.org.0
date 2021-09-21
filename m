Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D974130F2
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 11:49:42 +0200 (CEST)
Received: from localhost ([::1]:54358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mScPF-0000n5-7B
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 05:49:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mScOH-0008J7-7I
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 05:48:41 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:40808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mScOF-0008TW-Ke
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 05:48:40 -0400
Received: by mail-wr1-x42b.google.com with SMTP id q26so37263171wrc.7
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 02:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oLnxn4fJ+y6vli1WrHkxbWKWE3k52ZwVfXv1nEJw8TQ=;
 b=yBCAtRxM9Z/HKVYQSegrKah1SAs7wUWQ3e9gtwz5iHNra32d1S0OTSbAjufylN6DFq
 tu6kFdMdIxB1voqcgoJOkkt7c+BhkIBa/tsyILQaKpj7TxpUCsSHaj8CWFMlroyJDRIr
 808iVHbLBXHDtcM6zW2honN2SCaqUoEYDJkKGHWj0SbcmFXbbbbiiLyVlyRRbqcwa1V+
 UxaOwtLAhqAihlaBD2NyT6oB6kOYvb08EHL9FVL7JPHkhflZCEMDk2HyNWMsbyFCVMXa
 XjnCLjUvuVAyVkzw2Ih9t12b4tFLMXxPv3Zi4jej4BYYPjgmiWfR8HQ/veuynjsO9Sn4
 IH3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oLnxn4fJ+y6vli1WrHkxbWKWE3k52ZwVfXv1nEJw8TQ=;
 b=npL6cYD0bP5tI5XJ7cyZb4+dh6UvKCQSVQ3DABSOJrQ8DM3Sj9wxAsPh3jnvePpLBy
 1vBh3hYvhihPxU/8gczUAG7FJAra51Szsqhpy6k91nkIPBZkq1iW7Aii1ywAJNyc5zUH
 5ToWjY1fnLLSE9BPitZ0cMMrAMRLF+MxaFAoJhK5I8ZFwhcAV6epZuaGkrziY53W5TFg
 Hpzw8C+TILC0aoTbnjGIVKcwHUXKNzoF79QCoBdldzxQ22xPY0X3KHyJzpoQjHdtuq0w
 6N2X3r2TS6Y3GL2DR2I8lm54iK7iUUdgRYtnriouom9BmLpyvNCZc8hoLmrayfD/xYq8
 svkQ==
X-Gm-Message-State: AOAM533DbUlllN+Zy2lO5RHQctkywZ/Rvp/Owzv+m9BGBK1++grajOYT
 56+nPy/WrkQYIgDdEe3SmVLIsYpY0rThgQ3+tXtGXg==
X-Google-Smtp-Source: ABdhPJwnYLacVgTvEQsjJTcAxYSsnJCj8j85j3lAj9h/YnDyYRUvnyi4xXG8oP/i6NYKwO0sjDNw3tzIqlopqjvSIMw=
X-Received: by 2002:a5d:6b07:: with SMTP id v7mr7144899wrw.376.1632217718293; 
 Tue, 21 Sep 2021 02:48:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210916153025.1944763-1-richard.henderson@linaro.org>
 <CAFEAcA9XxgFYj6jzNGEhgMHhB2UQF_X3ZLigu4sRPrR3Zfj8sg@mail.gmail.com>
 <a0f85ea3-c677-bc7a-995a-ddc8d4856b4f@amsat.org>
 <a85376bc-c986-4f47-2e07-2476a1a63b35@amsat.org>
 <b4d17773-b226-b537-0374-46a668df0af2@amsat.org>
 <CAFEAcA-+pwETXYtSawvCRjLk2qio8PdEhnhW4yFhF85VvijVeQ@mail.gmail.com>
 <c89c508e-bfe7-ad2e-b974-373e1e8e66a6@amsat.org>
In-Reply-To: <c89c508e-bfe7-ad2e-b974-373e1e8e66a6@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Sep 2021 10:47:46 +0100
Message-ID: <CAFEAcA9S-gpVAJO4n-o4pUGV8DnDnEZ0z05d1ffLfadVLjoXaw@mail.gmail.com>
Subject: Re: [PULL 00/35] tcg patch queue
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 21 Sept 2021 at 10:41, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> On 9/21/21 11:28, Peter Maydell wrote:
> > On Mon, 20 Sept 2021 at 22:16, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=
.org> wrote:
> >> Forget this crap. The missing piece was:
> >>
> >> -- >8 --
> >> diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
> >> index 0d5adccf1a7..da348938407 100644
> >> --- a/target/arm/cpu_tcg.c
> >> +++ b/target/arm/cpu_tcg.c
> >> @@ -23,6 +23,11 @@
> >>   #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
> >>
> >>   #if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
> >> +static bool arm_v7m_cpu_has_work(CPUState *cs)
> >> +{
> >> +    return cs->interrupt_request & CPU_INTERRUPT_HARD;
> >> +}
> >
> > Is this really all that's needed ? I would have expected
> > at least a check on the power_state.
>
> I started reading the PSCI spec this morning and you are right,
> it doesn't seem restricted to A/R profiles, M profiles also have
> it.

It's not that we implement PSCI for M profile (which I don't
think does exist), it's just that we use cpu->power_state to
track "core is powered off or not", and we happen to use the
PSCI_ON/PSCI_OFF constant names for that. This is just for
historical reasons; we started with PSCI support and then later
broadened that into generic "power control" (see arm-powerctl.[ch]),
which is a set of functionality that provides the underlying
"power on, power off" that is used by both our PSCI emulation
and by our emulation of real hardware power-controller devices.
The imx and the allwinner SoCs are A-profile devices that provide
a power-controller emulation.

For M-profile some of the dual-core MPS2 boards set the CPU property
start-powered-off to true, which will cause arm_cpu_reset() to
set cpu->power_state to PSCI_OFF. They're then powered on by
the device code in hw/misc/iotkit-sysctl.c calling
arm_set_cpu_on_and_reset() when the guest writes to the "start this
core now" register.

-- PMM

