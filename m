Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAC430BE33
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 13:31:32 +0100 (CET)
Received: from localhost ([::1]:37746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6uqB-0004qI-VB
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 07:31:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6und-00034u-Tm
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 07:28:53 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:39892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6unc-0000bp-7U
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 07:28:53 -0500
Received: by mail-ed1-x532.google.com with SMTP id y8so7538695ede.6
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 04:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hYvDtVlpAIxKd2kqmX8DMzyrmJwQTbWMEa+7BWN3hVE=;
 b=Mz66wzwmLCaET4hP161id2q9WIDNgCT5c8r1KmZ1GSfNrIkd7Z11gwfYXxfMMIteO6
 uPlubjmJJ5BrIwSwpxVO6zi5Or8TpmByGNIjmT5ox05N3eLWN9bT6XbA+Rj3d7utJvog
 OGDq9JABeeGs7TZqOS+4DaWhDilbavi/cG7imXLwTUguT8UEBouvbR8RBpVxgUXssA3P
 15Bh+Vdn7lmUQsGGOrhB8x06DmVeT7YKnk7sPDawS2AzQf8QhfiwB5DtwoAekjvAPOjP
 Q57N6XfmSauIppJmcT4z+DSmBKyCbX5rLPsqw2h3xkZcToJBL3tsEtkUXpuaclWX6gyJ
 4vOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hYvDtVlpAIxKd2kqmX8DMzyrmJwQTbWMEa+7BWN3hVE=;
 b=oGwSrAbyAxKgm55Ovc2T8O7nPbtM+hmYxGYj0rOxcV/Y6U3G+gyvs9JbdCQ8+KyDTP
 0a7vcA4JIfKFD4CHhQBttlu2hQ9L5heywU/Hw0N4yMOba2SqOp6s55nhek86sCZvOT+7
 npFjagOYvqg2h7iDwRmqdkTknY/QMkhevwUZuRfcjew/2OtBT3uFde6VfWJog6gE6OHr
 QAyKGDIIaFE68ZceadA9OGC/tdTL8NGAW0RbnBsOLLNCAOJgorTE6iQLwNkgaOmPmrAX
 4BZHsvZK+GECqc+OKOoMqY9BDra3GlQiNiUVV4fi0r7ubuLEc/oq1DmgIsYVPNq2g50w
 mXMg==
X-Gm-Message-State: AOAM531IC6gJ+BUrXlu4PxkJt+hN1V2f/lRv8juchUF9MhbgcP1wO/NF
 7O0XH4MYfa+FZzxU9WpFuQffcfaKULXIl6e+gBYaOA==
X-Google-Smtp-Source: ABdhPJwFSjA+EVAY6n9WDd5UX42kJeqHWbNGHST77Rr8jnodsq64NVR7v4ay2BCBfO1IZt8wjJ7BKBSTqbxAAISpC0o=
X-Received: by 2002:a05:6402:31ac:: with SMTP id
 dj12mr23029427edb.44.1612268930443; 
 Tue, 02 Feb 2021 04:28:50 -0800 (PST)
MIME-Version: 1.0
References: <20210131151410.318649-1-f4bug@amsat.org>
 <20210131151410.318649-3-f4bug@amsat.org>
 <20210201081826.yx34xjzbgsiwzcpd@sekoia-pc.home.lmichel.fr>
In-Reply-To: <20210201081826.yx34xjzbgsiwzcpd@sekoia-pc.home.lmichel.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 12:28:39 +0000
Message-ID: <CAFEAcA8eDgsGY_Vq5SRuv9HxHY8Qz2j86A0PmKuHfj=H2wm7kQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] hw/arm/raspi: Restrict BCM2835 / BCM2836 SoC to
 TCG
To: Luc Michel <luc@lmichel.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 1 Feb 2021 at 08:18, Luc Michel <luc@lmichel.fr> wrote:
> On 16:14 Sun 31 Jan     , Philippe Mathieu-Daud=C3=A9 wrote:
> > KVM requires the target cpu to be at least ARMv8 architecture
> > (support on ARMv7 has been dropped in commit 82bf7ae84ce:
> > "target/arm: Remove KVM support for 32-bit Arm hosts").
> Wow, is there absolutely no way to do that then? What about using an
> ARMv8 and starting in AArch32 mode? Is that possible with KVM? I guess
> it might not be strictly identical as spawning the "real" CPU...

"Support hardware-accelerated emulation of older v7 CPUs" is
not a design goal of the virtualization extensions; you can't
do it. KVM does support having a guest CPU which is AArch32 for EL1,
but that will never be a v7 CPU, because it will be the same as
the host CPU, which will always be v8.

In general I would prefer that we don't try to do stuff to
make KVM kinda-sorta-work on random 32-bit boards by stuffing
in a not-the-right-type CPU, because this increases our
security boundary massively. At the moment we can reasonably
say "only the 'virt' board and one of the Xilinx boards are
security-critical".

thanks
-- PMM

