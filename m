Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE28217AD8E
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Mar 2020 18:51:49 +0100 (CET)
Received: from localhost ([::1]:54250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9uey-0004Ow-H3
	for lists+qemu-devel@lfdr.de; Thu, 05 Mar 2020 12:51:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45957)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j9ue4-0003id-A5
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 12:50:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j9ue2-0003Dx-PJ
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 12:50:51 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:41557)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j9ue2-0003CR-Is
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 12:50:50 -0500
Received: by mail-ot1-x342.google.com with SMTP id v19so6571837ote.8
 for <qemu-devel@nongnu.org>; Thu, 05 Mar 2020 09:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=z8t4BhMCBxgcnMll80FT1fnNti2is6qK+HTLFJSab+E=;
 b=oGyTGG2KEiAxjA1x9SYprMdxKBkcKyYtB7TTrYcLTRV5Xm5gSGmq5MTKrKXj0BOXzt
 Pk880j74tx0wxav8aR7lMvRcG9c17YQxaHsy6bJOdgJ0pwGtICsbMxhDV1lpIxTqif33
 s1q8dutFlgeQPW8AUDazNuiF/mD+5X00Q6bBz8pM/gTYVZCIHe3GI2hu7zql3PkhTvpp
 hdNrb5cqTrS0TDR7xjBzhXK+scJUfVXa2kGeV+GIDKz5oXEjrN3e2zhi9SvJNz6dKqZ0
 AQOxrh6Qxh36gymzB+Bagx1yL49VaT/gJiiKlKvh8q+pwYS4AHtbgIJSlaDq+aJrknGH
 QcLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=z8t4BhMCBxgcnMll80FT1fnNti2is6qK+HTLFJSab+E=;
 b=Z/ja2mAWNSo3f01K79eUk5kd+sD9XHUf/9neky4g7qbj1jl8hTO+yMAak/IB8Pgb3J
 nlvHj07tBRZew2rq/do7Q/Sv/4ez057IxuXi19vtyWDEpcNGjhrqwYBWpvSZWtkCJorc
 syfxquyaZuC9Vb1lNIgLvuR8e+AUbprNB0rs+dvt8V0RykOEP9kn1gHeSmgIsDSfewzW
 0pMk6Qx+765y4+i8yf4bzfuzdL6TLw1Z+pxozAdcAhaKKNsz5noMp+xfTgdNGYAWwQIx
 IX3QXGVrqBtg4G5UdhG/H45jDHi5j7n/RF/A1m6ou9h/X54A/oTtBBaNPn0D7L0/SbXF
 1D6g==
X-Gm-Message-State: ANhLgQ09je9EimsMiWgxm+Ebn8dE8NbAyLV9Vx4qmrkG4u/idM4UZIc7
 ze6KYSEiMRKsr/5dsNUY0u+YeS/ZMlJcGH16xNkeGl5xsRo=
X-Google-Smtp-Source: ADFU+vtPLGy1ndYWlB/AitEOp89d2XZOG/nlVMtyDeKVissXYLNNyfhxr09c/8xJL9vaR3tld/hOntFa9ZVZlfm1V3k=
X-Received: by 2002:a9d:6f88:: with SMTP id h8mr7688114otq.91.1583430649078;
 Thu, 05 Mar 2020 09:50:49 -0800 (PST)
MIME-Version: 1.0
References: <20200305163100.22912-1-peter.maydell@linaro.org>
In-Reply-To: <20200305163100.22912-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Mar 2020 17:50:37 +0000
Message-ID: <CAFEAcA_kvR_Lq3GcvCgNnoEDwf9SfiK8+GbJs9oYjfgo8Y9fQg@mail.gmail.com>
Subject: Re: [PULL 00/37] target-arm queue
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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

On Thu, 5 Mar 2020 at 16:31, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Nothing much exciting here, but it's 37 patches worth...
>
> thanks
> -- PMM
>
> The following changes since commit e64a62df378a746c0b257105959613c9f8122e59:
>
>   Merge remote-tracking branch 'remotes/stsquad/tags/pull-testing-040320-1' into staging (2020-03-05 12:13:51 +0000)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20200305
>
> for you to fetch changes up to 597d61a3b1f94c53a3aaa77671697c0c5f797dbf:
>
>   target/arm: Clean address for DC ZVA (2020-03-05 16:09:21 +0000)
>
> ----------------------------------------------------------------
>  * versal: Implement ADMA
>  * Implement (trivially) ARMv8.2-TTCNP
>  * hw/arm/smmu-common: a fix to smmu_find_smmu_pcibus
>  * Remove unnecessary endianness-handling on some boards
>  * Avoid minor memory leaks from timer_new in some devices
>  * Honour more of the HCR_EL2 trap bits
>  * Complain rather than ignoring bad command line options for cubieboard
>  * Honour TBI for DC ZVA and exception return
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM

