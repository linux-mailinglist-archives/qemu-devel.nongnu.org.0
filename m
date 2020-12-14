Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F412D96F0
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 12:06:12 +0100 (CET)
Received: from localhost ([::1]:42226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kolgB-0007Od-K0
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 06:06:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1koldt-00060t-R7
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 06:03:49 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:41005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1koldo-0006LX-Oy
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 06:03:49 -0500
Received: by mail-ej1-x643.google.com with SMTP id ce23so21963158ejb.8
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 03:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xTE4v9+sW9z7Pwiszm94eCRD0UiDpaZGMcGiwLeS9kI=;
 b=yFAwrIunlEOr2HSfhR1foSUaa0FQWpMw2JrLg9g7ufiCNfg5IM2Dq2oJG/+YQaJBgn
 IW5BcnAvbM8qLYyXzRTv0A1w2gcRgdIgxXa8mXlGofUEBzVtj4tGfazF+C7jcSuq9MPh
 rhRdQujfqquM1vFs2xDhItLzvZiUkcrG1XHmxbhSOJ7QBVVRwj5jC8mjzeDKpQCwTyZ0
 07DDp31lOEPiVKmoNz6tKTXkY8ZGQz9g+MY+ay3KUoUNIRYxlZ6wrpyq8vHUHJYS9NWQ
 lNH+o11bhnE3dAs4yorVoic8PZRFBA+QRMsjIFy6zy61A8ya5TyX8ti8jZwbhAzPgPoM
 Kqlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xTE4v9+sW9z7Pwiszm94eCRD0UiDpaZGMcGiwLeS9kI=;
 b=K0NuebVyn7gR/eW6ZdQ+mLDbuW4RXTYkEk1EffCmnLVTanH+HNW+7UgU39eBrqhkjl
 Q5hf6Q+VdDn5bNhsYuaJJ1wHoO5efn9X0MIUEhzozAhiYzBrgTZuvVpx7nT5RdnB0Bje
 HYgybEdlciW7/LhI8SWlThYtOAfAfEmQ3uiSUvvc2rdvuzYMY1SGEKX39OI33BHMzSLt
 gIfbJ8SXlO6YIj9FTmFkIQOApIxfAMDJ4zZVThVzWa3/BfjhUq9ZXYFnLeOgIWvEgd90
 Wt0s9fxsoUyrxTC/cz712zNxBLqDs9hNfZVbw5FSqTQdE0MxJ4tABUVjPKl+4srhmOsa
 pt+A==
X-Gm-Message-State: AOAM5305jYr5tT44VRGOBTA00MFq2/WeDIe5a2TMzWwtJdTUeZJVEcbK
 bvesWMe9T4/gDy/AOEm0QVWRVsiup6o1jFQ8O6ux8Q==
X-Google-Smtp-Source: ABdhPJysxnPBZKXuCyRlGWyYakdzmj4MzqSQKbuBLt0pgQi4FhAT76KW+BPIkNPDnaTgk+aHLlcFmBgNLQx12BKVe0s=
X-Received: by 2002:a17:906:e94c:: with SMTP id
 jw12mr22232836ejb.56.1607943822787; 
 Mon, 14 Dec 2020 03:03:42 -0800 (PST)
MIME-Version: 1.0
References: <1603891979-11961-1-git-send-email-mihai.carabas@oracle.com>
In-Reply-To: <1603891979-11961-1-git-send-email-mihai.carabas@oracle.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Dec 2020 11:03:31 +0000
Message-ID: <CAFEAcA8dNrYt8vw5y6V08kqOmGj4=XvgGexU3VPh01sUHZLDrQ@mail.gmail.com>
Subject: Re: [PATCH] Add support for pvpanic pci device
To: Mihai Carabas <mihai.carabas@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x643.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 28 Oct 2020 at 14:17, Mihai Carabas <mihai.carabas@oracle.com> wrote:
>
> This patchset adds support for pvpanic pci device. The patchset was assembled
> from chuncks from some old patches [1] from 2018 which were left unmerged and
> some additions from me.
>
> How to test this:
> /usr/bin/qemu-system-aarch64 \
>         -machine virt,gic-version=3 -device pvpanic-pci
>
> After that you need to run a Linux kernel as guest, but you have to also apply
> the patches I will send for adding pci support for the pvpanic driver.

Hi; I've reviewed most of the patches. I'm in principle in favour
of this, but the structuring of how the ISA and PCI versions of
the device are configured and built needs a little work. You
also need to sort out allocation of a PCI ID for it.

thanks
-- PMM

