Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE3E162550
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Feb 2020 12:11:13 +0100 (CET)
Received: from localhost ([::1]:32870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j40mW-0005XC-S2
	for lists+qemu-devel@lfdr.de; Tue, 18 Feb 2020 06:11:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56999)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j40la-0004wy-JX
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 06:10:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j40lZ-0000QN-DJ
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 06:10:14 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:39717)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j40lZ-0000Q0-6x
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 06:10:13 -0500
Received: by mail-ot1-x343.google.com with SMTP id 77so19114465oty.6
 for <qemu-devel@nongnu.org>; Tue, 18 Feb 2020 03:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cvdycf7eeOlOjrck3aMmk+I3QxrgA8fg09x+XPH+bPY=;
 b=RUyZLh0qeI7r6RadeFKtI2OZtkZDgW2RVKhbdb3tY0AnZ2QkB8tuWYnZaKGzSn4kxm
 Xe4bPDiUBfcW/EeX6xD8nRZITALx5lS6NhkuoazG4busVgxw+jJty9OofCFroQpZb8S1
 8h8+UTFyt93FJ707imoSMfTTCK9owTdGsoF3CW/BfmUbJsWy9mod02MDPHiK1ihXIynm
 ARJ1AJQKaeWxitiPUD+eKU9QAZJrC4kadPPPtwHkUnIKS6RPor6e0vSr6ZCCrMUUxdH1
 kiOcl1jLLw9i+JtryEWfgeGy2fiuStd4P/ZFuzlxlRMGP1Ouf19JlMO1zmdJ55JNv7lY
 Ga9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cvdycf7eeOlOjrck3aMmk+I3QxrgA8fg09x+XPH+bPY=;
 b=Fl3pzAls+02xjGl9VFDVtut8L05vSCOMFDPDPx0cZFIi6TYacJZ1g39j2HOkoAx6yi
 794ddTe6hvpmsYmi/D1obU+2T/JJWQMGDOSLljQGJdT5Aao7ATHoAuiFozcaJrJ/t4tt
 jEhG9oAP5guDoavrX1L/7JNWxBcrixyeVoeYERC/NP1ese7uz0CopgxM6UiJIyppYzjO
 6w3pSJ3duakN3TaopBn5gc+JEM/qzVMka0PMfOGNpe6XlYSWJD87Bs5t7AQoRug7F4fs
 exhKjJ/M9+wYgcSa69VQ0O9lcA2G1V/eDl4Cz9VEYS0p0AQm8wlaVfPSIVTWfbsPHLL6
 gkIw==
X-Gm-Message-State: APjAAAXBDWBh8WrFO1oMYIMA2SDBr8ZVeyO27xquSow/G49miDANPyLk
 QHQIr986tF6fxdtJAmL+ux6cj1Qiilwh4jfuwQQaaQ==
X-Google-Smtp-Source: APXvYqyT+YiCS5QfnEkWUdEYlZO9TvESRCsKvCGeWtsHbAJERlzN9bHVhuUvwnKOh03p1rtkBLIg9YCfjZZYtNooHsA=
X-Received: by 2002:a05:6830:4a4:: with SMTP id
 l4mr15546075otd.91.1582024212250; 
 Tue, 18 Feb 2020 03:10:12 -0800 (PST)
MIME-Version: 1.0
References: <20191011134744.2477-1-richard.henderson@linaro.org>
 <20191011134744.2477-16-richard.henderson@linaro.org>
 <CAFEAcA86hhBNLWhAe2UY+0-pS65wpSdPKFPTA9O4m9avjECxaA@mail.gmail.com>
 <3193d3bc-230a-8770-ffd8-d15d26c75ef9@linaro.org>
In-Reply-To: <3193d3bc-230a-8770-ffd8-d15d26c75ef9@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Feb 2020 11:10:01 +0000
Message-ID: <CAFEAcA-GO-rNA-TbVj+vHXGWj33oKZWPrG7m-k=q0+UekRERGw@mail.gmail.com>
Subject: Re: [PATCH v5 15/22] target/arm: Clean address for DC ZVA
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 18 Feb 2020 at 00:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
> It isn't clear to me that DC ZVA does check tags.  There's no pseudocode for
> DC_ZVA, which is less helpful than it might be.
>
> I suppose one could infer it from "behaves as a set of stores to each byte
> within the block", but considering that stores are both checking or
> non-checking depending on addressing mode etc, I'd have preferred an explicit note.
>
> So far I'm treating DC_ZVA as unchecked.

I think the spec is reasonably clear here. In D6.8 it says
"Unless an access is explicitly defined as a Tag Unchecked
access it is a Tag Checked access."
and then in D6.8.1:
"A cache maintenance by virtual address operation other than
DC ZVA generates a Tag Unchecked access."

So DC ZVA is Tag Checked, other DC ops that take a VA
are Tag Unchecked.

thanks
-- PMM

