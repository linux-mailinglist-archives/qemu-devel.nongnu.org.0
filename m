Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF7D15E5BB
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Feb 2020 17:44:21 +0100 (CET)
Received: from localhost ([::1]:41326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2e4i-0005fY-DL
	for lists+qemu-devel@lfdr.de; Fri, 14 Feb 2020 11:44:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34558)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j2e3q-0004mS-Rg
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 11:43:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j2e3p-0007fC-Ey
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 11:43:26 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:39242)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j2e3p-0007er-8Z
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 11:43:25 -0500
Received: by mail-oi1-x242.google.com with SMTP id z2so9991514oih.6
 for <qemu-devel@nongnu.org>; Fri, 14 Feb 2020 08:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=lrH3wZvxDs2JL83CPSNedZ7g3tWD/zDMvLP003y9ZxQ=;
 b=BkWrLZ+VxWdxOowkmgnUnPFXl0BSvnwzqi+jRVtoCg1092FRlszhhviqZexgs8XVL6
 +2xH/vtJuhlI09yTUFanqvPw16lWxYl887dDTwY8S7+tJH54WgRD2FVaRAFzTk37L8D6
 Ygg/5wO31v6MaVlJIQd2SpcKvAGgvUgqywqeoBVfAXh5pqz5z7+Eiwjb4x0UuU/6DfNg
 eS7E++VulaMjMBzYWRnEUHt9q4aQMAaZq+gdghS3+nzhZlGh68ySUeQmz3T2+Q0kFZoU
 JtAObFBGCgzPo3P/Jh5K7zZoFNTIs8mCQwpq5peDI3nanWRv1g4KgCmjRDHi7XzWBKBM
 CHIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=lrH3wZvxDs2JL83CPSNedZ7g3tWD/zDMvLP003y9ZxQ=;
 b=Y6puSoKH/ZnGqXJ+0UmHNDKCyxGOrdbP8OsKnpcBjR9A+66+Gj9k9Q5+xV8h9xAwLW
 aqFEP6os/p1RH7LKtr/SOUjuI80dmzcwf6E1ZWDuECsskCmYtTo5UaPbZyOjc+2MYpo9
 Qr+p2nQQKV7oDwpJjnKazM/eK8DpEoxiNlq5klQJ5T+1amJW80JBuHIeDU1N8InthoZW
 C5kWlguao+xiky7eJV2DpIfjFsIO22BB+/2VljIW6iXJn3hKJIZymU+LdVLmwPBT0naF
 jmSR+2/g/B/ds5qRhunv55NG2RlX0Lncftt6bs9xOvZOCQ18dvkcOmhV+LP7Gn2HyVqN
 VfAg==
X-Gm-Message-State: APjAAAX+87rCaS2HnD9W1+YY+srjV2iWJeltNKMbYerxecXM14ON974L
 0joXlD73jQQR6Cf5v3seENt4WEILhyuWyrMjSWY13T4v
X-Google-Smtp-Source: APXvYqzp9Tp2v8rz/tE7rXAL5sDPtL07KCxS+3i0kLzoaCnHMBy2kUabBJcuXH5/ya0mZAFeFQ6VRGh6dbRUX6fhzak=
X-Received: by 2002:a05:6808:289:: with SMTP id
 z9mr2417169oic.48.1581698604269; 
 Fri, 14 Feb 2020 08:43:24 -0800 (PST)
MIME-Version: 1.0
References: <20200213144145.818-1-peter.maydell@linaro.org>
In-Reply-To: <20200213144145.818-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Feb 2020 16:43:13 +0000
Message-ID: <CAFEAcA_OCDX6=0h6vU7=TxBiu_UHJpi810Yj7CkywzfCtHqO-Q@mail.gmail.com>
Subject: Re: [PULL 00/46] target-arm queue
To: QEMU Developers <qemu-devel@nongnu.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 13 Feb 2020 at 14:41, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Big pullreq this week, since it's got RTH's PAN/UAO/ATS1E1
> implementation in it, and also Philippe's raspi board model
> cleanup patchset, as well as a scattering of smaller stuff.
>
> -- PMM
>
>
> The following changes since commit 7ce9ce89930ce260af839fb3e3e5f9101f5c69a0:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/ui-20200212-pull-request' into staging (2020-02-13 11:06:32 +0000)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20200213
>
> for you to fetch changes up to dc7a88d0810ad272bdcd2e0869359af78fdd9114:
>
>   target/arm: Implement ARMv8.1-VMID16 extension (2020-02-13 14:30:51 +0000)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * i.MX: Fix inverted sense of register bits in watchdog timer
>  * i.MX: Add support for WDT on i.MX6
>  * arm/virt: cleanups to ACPI tables
>  * Implement ARMv8.1-VMID16 extension
>  * Implement ARMv8.1-PAN
>  * Implement ARMv8.2-UAO
>  * Implement ARMv8.2-ATS1E1
>  * ast2400/2500/2600: Wire up EHCI controllers
>  * hw/char/exynos4210_uart: Fix memleaks in exynos4210_uart_init
>  * hw/arm/raspi: Clean up the board code
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM

