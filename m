Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B0F67CB0A
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 13:45:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL1bY-00069x-LE; Thu, 26 Jan 2023 07:43:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pL1bO-00067Y-Kb
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 07:43:38 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pL1bL-0005X4-TY
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 07:43:37 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 n20-20020a17090aab9400b00229ca6a4636so5170988pjq.0
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 04:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D2hlvI8lyCcJMPlrPJST1vcEL6w9MkuLh14hpGUqyys=;
 b=ASWppiC5fQXEsg/mmROIFcS2qBpdkrjTX1VJKnfQ2/k03QZaFOxoKXXQhQRx8hSUrW
 TEHJ0C0DiKorAnM1FNlYuQEiEb2ApQtDfXMLxeVZqcv0UkqfgQeV4EKHVVaDgpn6a4my
 wgXiyD/lbqCXX6K+n8wOk45uIeC2WdUgKNEGmFVvayemjKMkszC2ilZCVORsJqX6T5ib
 mgTuZkYX68hij2JyHaTwb3LrdZwcDWjiobhq60hvRB7YI06Odb1TN+6Q6fsY6noLDwCI
 VRQtnIDejk3Q2C6NP2G0tZpi7tentRxJ2GhRxNb3jMhtDJ2jfUZAH9Eliq8FGYjO8BZA
 2SBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D2hlvI8lyCcJMPlrPJST1vcEL6w9MkuLh14hpGUqyys=;
 b=fp6LhNdQz1F1/gFRXQb/q1nCfmOjwTRLX+/NHTzcPrMYpHgocpI7DjuWQQQmPbcERz
 0KU4Xtsp926Q8z3kllsMnPMYN88H/hpV8A0X0/nxxRujNQKi/u0XINR/6TBAxMKr2dI0
 4JQe/HwdoPSNf7cASjwmKkCvOPA+Mwq3LdQ0x6mkhTK86ASyqCyZlLPeJq9X78Bxgrgw
 wpdxxaAhWg5Wy+Du26M/MR35z/Z9+00GQkWAiwQgtwWf6YF+WTxZhK7nkqKLSbm0+44L
 bvdxJSeR97PMUFUHee84CKNuFXM1ir9MSPewNgQ7HmHxvXAwnGNnB+ha8ZtG8m684u86
 +7gw==
X-Gm-Message-State: AFqh2kqGnsI8JfO5Q2WyXcIL5lK56ueDzqnkHZYlLb1ZlWHLobesnkUY
 Z1FlxKz78sDmIbqc/sLQblKHPndQictYTp/L0Ah5Ag==
X-Google-Smtp-Source: AMrXdXs400WuawVLDuFJZyW+uz2qtMMPSdzkALNh4CWMBjNnVT1DTl2fekfvxxh7Z1TtcOdXSXeiungt30WkzYAY/gc=
X-Received: by 2002:a17:90a:d801:b0:22b:bc67:1dec with SMTP id
 a1-20020a17090ad80100b0022bbc671decmr3023795pjv.67.1674737014315; Thu, 26 Jan
 2023 04:43:34 -0800 (PST)
MIME-Version: 1.0
References: <20230110164406.94366-1-philmd@linaro.org>
 <20230110164406.94366-13-philmd@linaro.org>
 <CAFEAcA-yEN3F3p6W16vfML4dAHzdwSnOS=759MkqQ0qDpArnaw@mail.gmail.com>
 <87sffyreuv.fsf@linaro.org>
In-Reply-To: <87sffyreuv.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Jan 2023 12:43:22 +0000
Message-ID: <CAFEAcA_KRTzJy6ywjBVPx34ccWNTdcnNsC=5JYVkTNDSRSRsRA@mail.gmail.com>
Subject: Re: [PATCH 12/18] hw/arm/digic: Replace object_initialize(ARMCPU) by
 object_new(ARMCPU)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, ale@rev.ng, Andrey Smirnov <andrew.smirnov@gmail.com>, 
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, 
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, 
 Antonio Caggiano <antonio.caggiano@collabora.com>,
 Rob Herring <robh@kernel.org>, 
 Antony Pavlov <antonynpavlov@gmail.com>, Jan Kiszka <jan.kiszka@web.de>, 
 Beniamino Galvani <b.galvani@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 25 Jan 2023 at 12:14, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> Peter Maydell <peter.maydell@linaro.org> writes:
> > I'm not really a fan of this, because it moves away
> > from a standard coding pattern we've been using for
> > new QOM 'container' devices, where all the sub-components
> > of the device are structs embedded in the device's own
> > struct. This is as opposed to the old style which tended
> > to use "allocate memory for the sub-component and have
> > pointers to it". It means the CPU object is now being
> > treated differently from all the timers, UARTs, etc.
>
> I think you can certainly make the argument that CPU's have always been
> treated separately because we pass it around as an anonymous pointer all
> the time. We currently can't support two concrete CPU types in the same
> structure. For example zyncmp has:
>
>   struct XlnxZynqMPState {
>       /*< private >*/
>       DeviceState parent_obj;
>
>       /*< public >*/
>       CPUClusterState apu_cluster;
>       CPUClusterState rpu_cluster;
>       ARMCPU apu_cpu[XLNX_ZYNQMP_NUM_APU_CPUS];
>       ARMCPU rpu_cpu[XLNX_ZYNQMP_NUM_RPU_CPUS];
>
> which only works because A/R cpus are the same underlying type. However
> when we want to add Microblaze how would we do it?

You'd add fields
    MicroBlazeCPU other_cpu;

As you note, at the moment that doesn't work because cpu.h
is magic and embeds an assumption that it's only included
in compile-per-target objects and therefore any given source
file only includes one of them at once. I think we should be
aiming to remove those assumptions, not work around them.

thanks
-- PMM

