Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8644090A8
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 15:54:49 +0200 (CEST)
Received: from localhost ([::1]:44886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPmQ5-00055a-1H
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 09:54:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPldp-0003EY-48
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:04:57 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:34666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPldm-0000l8-AQ
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:04:56 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 v20-20020a1cf714000000b002e71f4d2026so5195852wmh.1
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 06:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oVzKYmjFkEwD0Pn2M57abfkgTyrth1nlGdEP77UkmcA=;
 b=gT8muPNh/roitQYVWsxpnCCys9aXRD6ovupXYXIBsgTBwC5KjK5myEPnRDjYYa1B+X
 nIlCVE8WE9vSe9e9E4EIt4HIQLe5/QwKHUw52Eu40OEG0HoHHsH6KFFUO2IqPm/QRqDQ
 n+kp13JXqhWmrcprbtt+sK3iqaBjFo9UTTkWJVU6uO/eFeygef0jd02VKqjkTb8CMEqM
 EKChvyDHseY1VvDry09UPenfA0qJLdxNepuYDzw+4OyBkeec73umW0AEstH9Adhkzw0h
 zTKEUQwJboPYVTVoWPTAgwM9I1juRAZi/9vmBWm3IcRg3zdm+0YElOk74+kLZNqD54wq
 bG2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oVzKYmjFkEwD0Pn2M57abfkgTyrth1nlGdEP77UkmcA=;
 b=T65Pw/5lNastiKbac7I/4LcYfiJox15LLG/7gbfeuh62Bj1GkRV4mFcc05+iisgljE
 ceLn8ZT4aT1u7CcohGk9kwhCNoqU5iBx0auOp/QaaO0z8ZZ9wg/L89WF4uhn46CcK54y
 LN8DxraW9nhew787umTC1/AQoDOoYSDc1aXZQV3YysWkYw3AGJJq0axDXfPRPnoajTTS
 0UgIfm0zPcvleTglUjT9HIRb9pVNhKa1E7DYY76QEKHbx1mVljWBDgTp3DGwsVOxo4qg
 0ps/KaYOmeDRIWige2sOS4ChobiapTdNoIlIQRgBzGGZPcmsvJBi3J2U4NYI0jIjNPli
 OWRw==
X-Gm-Message-State: AOAM5328JosafQgv2+gs0HY2ZXItl7crcnLfLBHe1ee0kO6KjFC1Xaxw
 Y6YTH1MFMuQzhYqoZb4IxlvUnqX0tRcCUc1nSPRfFg==
X-Google-Smtp-Source: ABdhPJxriZPq0NmKgCFLNYsXlcuHtphgD/I86z8t8mJqMkR+TdST5456077j9p5AZ5EZvf4Q0HytcxYkSfhhIFsLWZA=
X-Received: by 2002:a05:600c:2259:: with SMTP id
 a25mr4469055wmm.133.1631538292735; 
 Mon, 13 Sep 2021 06:04:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210910143951.92242-1-shashi.mallela@linaro.org>
In-Reply-To: <20210910143951.92242-1-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Sep 2021 14:04:02 +0100
Message-ID: <CAFEAcA-75-_72d__iDFCyqNG5eVV4tO4y60r4G_gJ6zko+SaHg@mail.gmail.com>
Subject: Re: [PATCH v9 0/9] GICv3 LPI and ITS feature implementation
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 narmstrong@baylibre.com, Eric Auger <eric.auger@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 10 Sept 2021 at 15:39, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> This patchset implements qemu device model for enabling physical
> LPI support and ITS functionality in GIC as per GICv3 specification.
> Both flat table and 2 level tables are implemented.The ITS commands
> for adding/deleting ITS table entries,trigerring LPI interrupts are
> implemented.Translated LPI interrupt ids are processed by redistributor
> to determine priority and set pending state appropriately before
> forwarding the same to cpu interface.
> The ITS feature support has been added to virt platform,wherein the
> emulated functionality co-exists with kvm kernel functionality.
>
> Changes in v9:
>  - removed sbsa-ref patch due to inconclusive ongoing discussion
>    regarding ITS placement and version in sbsa-ref platform.This will be
>    taken up as a separate functionality later
>  - updated its enable code as per latest virt 6.2
>  - updated its code to replace usage of MEMTX_ with bool
>  - All kvm_unit_tests PASS
>  - Verified Linux Boot functionality
>
> Shashi Mallela (9):
>   hw/intc: GICv3 ITS initial framework
>   hw/intc: GICv3 ITS register definitions added
>   hw/intc: GICv3 ITS command queue framework
>   hw/intc: GICv3 ITS Command processing
>   hw/intc: GICv3 ITS Feature enablement
>   hw/intc: GICv3 redistributor ITS processing
>   tests/data/acpi/virt: Add IORT files for ITS
>   hw/arm/virt: add ITS support in virt GIC
>   tests/data/acpi/virt: Update IORT files for ITS



Applied to target-arm.next, thanks.

-- PMM

