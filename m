Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 510A013E1B3
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jan 2020 17:51:38 +0100 (CET)
Received: from localhost ([::1]:45006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1is8Mr-0006f3-1L
	for lists+qemu-devel@lfdr.de; Thu, 16 Jan 2020 11:51:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48800)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1is8I5-0000dj-QW
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 11:46:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1is8I4-00031l-Hu
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 11:46:41 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:38541)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1is8I4-00030r-CR
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 11:46:40 -0500
Received: by mail-oi1-x242.google.com with SMTP id l9so19422590oii.5
 for <qemu-devel@nongnu.org>; Thu, 16 Jan 2020 08:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wxJhezyPbBA8aRyd5KsJxa8feriOk3RYl1VYt4xENS8=;
 b=sPboryS+Y1MX0Z77vZGatNjzHp3t0nXB9UjJ04h3Q7e37bVjWw8WeIDTigI78YP6Rw
 JR0W8JiMRf1BJov7xZH9ZRdZXHJcQMofX6DX7Nm0oHmtAXwI8BJG0qV6zveLrERCUMTd
 P/5eOAdosZYZ/K4u2yshpSueAaX3h1QtwCnWf/A7SrZOkYHn4sTcQlnrc7NF/jEICOhZ
 TOAagZ0tuKM4i1xIPyRH51xx3xUsHofWpTxQQrJtddgoJsS1Rb1HHGyQeZxLtTKrBlQU
 YO0fLCOfgIXm05581uWKd/s83c4Bbi8MTvsPinv5e9dWhVq8YOGBIp4x/Av/4NZ8wOGy
 tEQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wxJhezyPbBA8aRyd5KsJxa8feriOk3RYl1VYt4xENS8=;
 b=b5EpaI1W7xqpyFl5/NwrAR8xmCjH3PK6BoeRn2dE4aYguDiZu0LHc2gvn98wfSQqwj
 ceJreUO9dsmI84gh6zCf3yMVyg6DFpNVs3d4tJlxzQIK+Jwp5AIzrftgVbRNyVu4t+db
 KvSC6WKUYwaxVnO4soBp69Xub8Y7QtH8FcgOb30YxFIunWu5tD/piUmzCvLgIYun4nr9
 8UXiiFtTOlRWmRSTfm+5m4awlorNh3JD57LwYCXiNbEhvoFBiXxj8G+j1TXTn90wEaop
 jn95Gasb9djsAOF4xovYw4RkM5KEh3J20jZMBPRV/gamq1nz/G3VebbfC4TIl9DwUPnR
 A/bg==
X-Gm-Message-State: APjAAAVoE1Bv+8onK07cj21x0yBX03+NTD1Is5QAWA3d+99yYv2o84/E
 hoDSNNufIsjFXmKBxxacG46tWcFYAnU8nQL4n1n5gA==
X-Google-Smtp-Source: APXvYqzuSJa2ft4QBFw8JQgFAeiMrfvJSe3POoFV1RWg4NU1w13QbrmXUN23jsB4YutJckZJ+XkLKg+TjG9q253LEjM=
X-Received: by 2002:aca:d78b:: with SMTP id o133mr4869620oig.163.1579193199671; 
 Thu, 16 Jan 2020 08:46:39 -0800 (PST)
MIME-Version: 1.0
References: <1578483143-14905-1-git-send-email-gengdongjiu@huawei.com>
 <1578483143-14905-10-git-send-email-gengdongjiu@huawei.com>
In-Reply-To: <1578483143-14905-10-git-send-email-gengdongjiu@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Jan 2020 16:46:28 +0000
Message-ID: <CAFEAcA-mLgD8rQ211ep44nd8oxTKSnxc7YmY+nPtADpKZk5asA@mail.gmail.com>
Subject: Re: [PATCH v22 9/9] MAINTAINERS: Add ACPI/HEST/GHES entries
To: Dongjiu Geng <gengdongjiu@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
Cc: Fam Zheng <fam@euphon.net>, Eduardo Habkost <ehabkost@redhat.com>,
 kvm-devel <kvm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Linuxarm <linuxarm@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Zheng Xiang <zhengxiang9@huawei.com>, qemu-arm <qemu-arm@nongnu.org>,
 James Morse <james.morse@arm.com>, "xuwei \(O\)" <xuwei5@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 8 Jan 2020 at 11:32, Dongjiu Geng <gengdongjiu@huawei.com> wrote:
>
> I and Xiang are willing to review the APEI-related patches and
> volunteer as the reviewers for the HEST/GHES part.
>
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 387879a..5af70a5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1423,6 +1423,15 @@ F: tests/bios-tables-test.c
>  F: tests/acpi-utils.[hc]
>  F: tests/data/acpi/
>
> +ACPI/HEST/GHES
> +R: Dongjiu Geng <gengdongjiu@huawei.com>
> +R: Xiang Zheng <zhengxiang9@huawei.com>
> +L: qemu-arm@nongnu.org
> +S: Maintained
> +F: hw/acpi/ghes.c
> +F: include/hw/acpi/ghes.h
> +F: docs/specs/acpi_hest_ghes.rst
> +
>  ppc4xx
>  M: David Gibson <david@gibson.dropbear.id.au>
>  L: qemu-ppc@nongnu.org
> --

Michael, Igor: since this new MAINTAINERS section is
moving files out of the 'ACPI/SMBIOS' section that you're
currently responsible for, do you want to provide an
acked-by: that you think this division of files makes sense?

thanks
-- PMM

