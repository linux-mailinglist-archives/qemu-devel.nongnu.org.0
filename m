Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEB42EF87C
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 21:02:10 +0100 (CET)
Received: from localhost ([::1]:53070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxxxZ-0007du-Il
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 15:02:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxxwC-00070o-AP
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 15:00:44 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:38208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxxw8-0007u6-Dt
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 15:00:44 -0500
Received: by mail-ed1-x531.google.com with SMTP id cw27so12400035edb.5
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 12:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=k9+SfScxnKREDw0NIvI8sMGT6YW+7NhGId/7YGEURH4=;
 b=JlL5dTg7sFPL8DLFxWkCXN7gOFiZGDcI+ogCP0QVXHVEtoA32qqHclSGE+kLM/AB03
 ds6TjaGDdeWnVwA9B7LWbybHRBgCRcVTkKhY9PuJ/z754QZtZzsA6MmbsI3pocGUS9aR
 0Wskr1MDlUnfE5CcF3t8AoCxy2NH5eYMYTt3NL5MOX9uhoHI+xMVNXmMWTm5zs/K9xnN
 CotYoNHDLrTrf7O37pPi5uLCgHyhcuLDom6q0Fk7QBBEGCi3qqWuj4VQI7JGOT2sG9Co
 6W58oUHgBuOTWa+vZ11VPzdDiGaofFE9l+LoxTwdx1JAz1sWP27UeDayknY/GW9zZu9T
 1o1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=k9+SfScxnKREDw0NIvI8sMGT6YW+7NhGId/7YGEURH4=;
 b=W2fk9n7GxfF2K7/KrbLc6SUTRD0c9KbT3DUEepKsnD/It8wGc77YMqoYbCdCWijnQi
 3/HJ2ybkBhHyyKz+MoGquB9YU8ALUX5e7VK4bs2KwhKdgZ8U3+oXjV9ZZglpgYGW2Tqo
 bshvMG4RcM0GTlGSDeAWgEGfTCNwctYiM0MsdCEPgNegb08zl4MNStCei3fCScMMJxqb
 alrbh7hqrbtBVZSzdsp3cprL4scjNbiJnoJVM6XQjiMUB6yUNtw5xDuok/3YlX2yYiTC
 XU18kPWYtV4RGt0ZIj/q1tpoqe7qcq8/YHk9x+muGOooS9tXre2vlXxvzgHgMlFzQHc3
 l3vA==
X-Gm-Message-State: AOAM532qk8vgeqeWncKEDb3NhNNDDgNZLIkHXv1P5KTrjE/9uBco3PPh
 AzouVflagWf1sS9qRYHJ7dahKxmQIfKwKzpSZQFF7w==
X-Google-Smtp-Source: ABdhPJwm3OW79XUpztrFd30y+rnKLrR1lAyUxUXSQFXVPMXgLMGH5ORoSA0kqkhktyD1OngZ25y5w3KDXJRGxau/IRA=
X-Received: by 2002:a50:fd18:: with SMTP id i24mr6573413eds.146.1610136038778; 
 Fri, 08 Jan 2021 12:00:38 -0800 (PST)
MIME-Version: 1.0
References: <aa0a0bcc-bd00-37dd-1012-cd71d32f1f9b@roeck-us.net>
 <2f710d2a-ab7b-de6c-4ada-8fb7300556da@amsat.org>
In-Reply-To: <2f710d2a-ab7b-de6c-4ada-8fb7300556da@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Jan 2021 20:00:27 +0000
Message-ID: <CAFEAcA90K0U5_oxjev8XH8fJh-e+Zqh88ZpfgEMPopeYkmUhiA@mail.gmail.com>
Subject: Re: pxa crashes with qemu v5.2 when executing xscale operations
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
 QEMU Developers <qemu-devel@nongnu.org>, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Dec 2020 at 15:24, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
> On 12/21/20 6:28 AM, Guenter Roeck wrote:
> >   84: ec432000        mar     acc0, r2, r3
> >         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >
> > This is supposed to be a DSP or iWMMXt coprocessor instruction.
> > I did notice that the code to support xscale instructions has changed s=
ignificantly
> > in qemu v5.2.
>
> Indeed a lot changed...
>
> I had a quick look. The instruction is decoded in aa32 as LDR_ri.

It isn't, incidentally. LDR_ri has 010 in bits [27:25], and this
insn has 110.

thanks
-- PMM

