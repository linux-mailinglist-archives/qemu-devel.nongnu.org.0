Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 437D3458CF7
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 12:07:38 +0100 (CET)
Received: from localhost ([::1]:37644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp7Af-0000Af-Bp
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 06:07:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mp73R-0004b4-Mh
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 06:00:11 -0500
Received: from [2a00:1450:4864:20::331] (port=50986
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mp73P-00017f-Tq
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 06:00:09 -0500
Received: by mail-wm1-x331.google.com with SMTP id 133so14934597wme.0
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 03:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2IExDQvEd2WzGQ71T3AjMsU+y1fO98aLmLROqfsaKhA=;
 b=i4QDkzrOyJ6Bl4ifmkIblt0VMAdDzxRQUWDlKXWnbOg433DtnsAQQT7siRD9oQb9Nt
 uGrI+cUp8s5ryn2HlQtMSyo90OJGuAACd/RnTHP1PV9BKMPn+ekN/6x+vl6ZrvlmiTDa
 m9O/Wxq9jbr9KmWxf456zXU80iu35cvvjG8rByMcEaUr6rhADee4mjrSUjz9r61DvHhD
 f+qzkSeL+JEnGWD5yaF0K+TaHVKwoEZtQNFO3IYRg2UnQu9i+UpsVoI11fOJnHjWOeAo
 fIRkDgKMz53FOO5c+SnryRlBPY7Zvz75OPUppYBmIjCwhMb4bYkMUvKt90doWGbSuFbe
 HTzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2IExDQvEd2WzGQ71T3AjMsU+y1fO98aLmLROqfsaKhA=;
 b=3RpqXvpmGriHwTP4CAUNe8iKG9HdvkrzHHFOR/X/yy/Zd4ODkXjhAKNnTpeYZzGw3Q
 hnZNcQfZ63MYxo9lxC6MmqfiQ9DQtVbG4G35yCW6KgNCxeCo/RQbj/Q1Kn9Rf93HsXb1
 wRmeHtamGDsORqtpH+MG0gbcpPXdjUPOHcI1iIZ92SQgx9jpqcvLDPrV0Ez97ntE66lk
 LZy8LB00WeQ+ITI8939dtxZ0XkN7eNFATF4IiTHZUooODryLGVKqaRMlWR8L895qMlO/
 0H7bXouLU8l7v2n0r8tiQlcJY14FCvw4GZZ5hysQrB0hHNvSr84msKoJhZNq9fyJ9ldl
 ziIA==
X-Gm-Message-State: AOAM5300cOMZ4fpZdvHRR7GDFUV/4FAK7md3qfuN4NrxilLnvlW7EKRF
 UqT99QK24pk6y3f9CYgvBacksO5T2/kod6h9brngpw==
X-Google-Smtp-Source: ABdhPJza13QGPc428vffXPiGYNBV0Z+9Na0lZbzfuypfvg3k7ks29V0dDauoQPl+8C8SAhtRiUeOoyj78S5ABJOpoF0=
X-Received: by 2002:a1c:7f43:: with SMTP id a64mr2739182wmd.133.1637578800996; 
 Mon, 22 Nov 2021 03:00:00 -0800 (PST)
MIME-Version: 1.0
References: <20211115223619.2599282-1-philmd@redhat.com>
In-Reply-To: <20211115223619.2599282-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Nov 2021 10:59:49 +0000
Message-ID: <CAFEAcA8TvHb3XG6Kw83=Bb69YZ+GF0p4r6uG+UdwM3UbLmQ31A@mail.gmail.com>
Subject: Re: [PATCH-for-6.2? 0/2] hw/intc/arm_gicv3: Introduce
 CONFIG_ARM_GIC_TCG Kconfig selector
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Miroslav Rezanina <mrezanin@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Shashi Mallela <shashi.mallela@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Nov 2021 at 22:36, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> The GICv3 ITS support has been introduced uring the 6.2 development
> window (commits 18f6290a6a9..17fb5e36aab). This device is for
> emulation. When building virtualization-only binary, it might be
> desirable to not include this device.
>
> Introduce the CONFIG_ARM_GIC_TCG Kconfig selector to allow downstream
> distributions to deselect this device.
>
> Based-on: pull-target-arm-20211115-1
>
> Philippe Mathieu-Daud=C3=A9 (2):
>   hw/intc/arm_gicv3: Extract gicv3_set_gicv3state from arm_gicv3_cpuif.c
>   hw/intc/arm_gicv3: Introduce CONFIG_ARM_GIC_TCG Kconfig selector

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

This looks OK to me, but I'm inclined to leave it for 7.0 at this
point in the release cycle, unless it would be awkward for
downstreams if we didn't put it in ?

thanks
-- PMM

