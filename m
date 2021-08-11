Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F083E8F57
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 13:18:37 +0200 (CEST)
Received: from localhost ([::1]:40270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDmFn-0006Mf-C3
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 07:18:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mDmDU-0005Nd-O2
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 07:16:12 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:41882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mDmDT-0008NV-2F
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 07:16:12 -0400
Received: by mail-ej1-x631.google.com with SMTP id d11so3515965eja.8
 for <qemu-devel@nongnu.org>; Wed, 11 Aug 2021 04:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6bomk8d54FXv5YNKC+b76WQydqGfbpQ2bpjK3RpBzg4=;
 b=ckQh/qZQJMBg+vGWoCcfd8AAxvBooH0ThU6AzmDh8IPh+FmxZDTHiSrXIeL9vesXSz
 X6O/7ga8kuB7HoHlGXYo8GHYKsgswAdFHl3jOdKjuzcMvRgvtSOhGeLUt9My8VcTHMB0
 YdtgkVMZnNguZefc02f8q3xxOgAIl2i+JTQPKA0knWAE1/5aOdvv+SJYjRZaZZY1s9Wg
 lyxkkx7QCfeVw8xm2yMOIwJNs4R8YE34kMZVUuZRNi3EKeuKFAJHCHM+vBUMe7S4ww7e
 M3nF0flr4DPDsQ/rntpdshE+UXyZK6ckL9VQ4vUMcX5qmxfMonm06uXZmEllOYuT7G+z
 rvpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6bomk8d54FXv5YNKC+b76WQydqGfbpQ2bpjK3RpBzg4=;
 b=LOEE/DHkff8lJiMle7eNhLXcrL4Vqb74G9wQlOr0eEOJdu2kMrFvgoLx5Qqta9A8P2
 Arkn4A2/79j47jM78w83zCXcFJd8QjtuU2Nd6jGFvv0S5WepsF4+y7VVkToDeLkj+asU
 dDqXnLHC1QehlAEfiKiQFRyWkOoh3+dGT3K5SJljfGc4KE8SuPMIPl8JP0aw+/fxcqqP
 BQ/QzCLIwohAzSLUjhtXR7B+vU9JfHiaGQMOzuQF6wHG/VaxKipKIPc7OgktgyqbfQQp
 MuKb1k4MTNAdqBO48H5zq3e+G/qHb0HU3BoOfhwTM1YJkVkOaZKLSnPVV/A9Ru5XiNaZ
 9TTA==
X-Gm-Message-State: AOAM531b0yYRieYH/UeDfx1dQSRLjJ1IoOwoxDdw7I2OQdvetsFICm69
 HTEOMwytq5/tNo74kzd4RiLtUNJhi6pL3xbeF7Y1dg==
X-Google-Smtp-Source: ABdhPJzLLNwqSgeslQbVrQECWRgAlPHGT2+cD/EirVxUsebO8r7P1P7TPOr/+Tj7UfVSjSivOEJ+ma9CTmy74yD4GVM=
X-Received: by 2002:a17:906:d93a:: with SMTP id
 rn26mr3083504ejb.382.1628680569470; 
 Wed, 11 Aug 2021 04:16:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210811093838.18719-1-damien.hedde@greensocs.com>
In-Reply-To: <20210811093838.18719-1-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Aug 2021 12:15:24 +0100
Message-ID: <CAFEAcA9xYv0942TB7szESLCDct2H4d2MT5kzZMHL6_d=rQh0Cw@mail.gmail.com>
Subject: Re: [PATCH 0/2] Set user creatable for flag ibex uart and plic
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Mark Burton <mark.burton@greensocs.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 11 Aug 2021 at 10:43, Damien Hedde <damien.hedde@greensocs.com> wrote:
> This small series only consist in setting the user_creatable flag
> of ibex_uart and ibex_plic devices. These two devices are already
> using properties to configure themselves so nothing else is required.
>
> Note that this change alone will not allow creation of these devices
> using -device cli option or device_add qmp command as they are sysbus
> devices.
>
> We do that because we are currently working on adding the possibily
> to configure/build a machine from qmp commands (see this rfc:
> https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg03706.html).
> We are using these simple devices in order to test our additions.
>
> We prefer to send these 2 patches on a separate series as they are not
> really related to the main topic. We will send a following series
> for the additions.

No, these patches should go in with your other series that
requires them, please. As standalone patches they are definitely
wrong, because (as you note) you cannot usefully user-create a
sysbus device like these from the command line.

Even there I'm not convinced that just marking the devices
user-creatable is the right thing -- if we support creating
a complete machine from QMP commands we probably want to think
about whether that means we need to have separate categories
of "only creatable from C code", "only creatable as part of
QMP machine creation", "creatable on commandline but only
for cold-plug", and "hotpluggable".

-- PMM

