Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB44E313EDB
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 20:24:57 +0100 (CET)
Received: from localhost ([::1]:41470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9C9Y-0002Ld-RN
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 14:24:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l96Kn-0007tp-9M
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:12:13 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:39659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l96KS-0007Nh-12
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:12:08 -0500
Received: by mail-ej1-x632.google.com with SMTP id p20so24554369ejb.6
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 05:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=plKY2wpE4hZGbUZ6XfHjbd5l8S9jLjeBrlgWEdcjm7o=;
 b=eXi51UumDtbYUK42yAlRt5C+BIZz+IV1xfGl558Qq71WCl7KhI5oMoVWudpEDctivI
 vgsdv2W0NrPR62GkdKkZno8OmAgEXV0IuGOqPswrbtCSJNW+/Dv4XvvmpObkZd89PJ+N
 rq5PHvNRBwrP6G+1F2n4Dk0m4DOTDL7RRNq4b8djrvm8R9nmDw7k/cVhGEfHVr2ejWZt
 AHGEKOiK15Sb+a3uNBsG9LP9zJnZBiXORCY/HmEAHgo5h5BkF1+OKnvycWznB3aC/8Dw
 VHgyoCuvXlkBk9wBtcN+n9imEPX9rnaE2WZTA+EFXHdDquO1MxWnsxc54XxrxnN2/QJ+
 q2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=plKY2wpE4hZGbUZ6XfHjbd5l8S9jLjeBrlgWEdcjm7o=;
 b=uB7rNaZ8gtof+2LjMzHHC06YKTNxFkUHaP1kT6R3F8s3n2WIp4BfGSpPBycSgpZp6w
 8XWO7m9Qj/mgv5WPZ94wzmTYFV1R1q5Z55uYO2+YmWX8g0CsBXXYEGq/1FKuES4GfMja
 k0IPonsco3OEH7Tx0Kl/2pW18zdmKAIpovq4ovW/389ybkRQxwgGbYLIrxCxy+A1nH3S
 fxfHYivU6UOjibQflIIPlEPvnJjozJ6/hu7L55o8Sm3zx6eWMvNK3E5EveSETy7tR62c
 u+i+7+yiQhTh+ctNgKbo4v4hHkEmJZSu2Cu0dKAADphEnRNPtRBIHIoV/UH9DPSLbgz2
 siCA==
X-Gm-Message-State: AOAM531b7TGYRz+QIZpuJNAaoZoqvYTLwsGGoVVOj5dUOjOKzXqpnRV2
 AieGu+aoB/3xZA/ULPcrtDbCW9iNLXkkJH73MhYGFA==
X-Google-Smtp-Source: ABdhPJyN3RsnkQnfZykm7EfaTm5aK9pw5ugLDZsxesUu5V9WrcmtxVeyJD5NSvDpHVYEAiTCxBct8XdzneuSRaw8vYY=
X-Received: by 2002:a17:906:b4a:: with SMTP id
 v10mr12555145ejg.382.1612789904248; 
 Mon, 08 Feb 2021 05:11:44 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA-qq-Eue+ktR1tNO7FZdtCe428=5vdA5472W-16p=d75A@mail.gmail.com>
 <20210203161340.55210-1-aaron@os.amperecomputing.com>
In-Reply-To: <20210203161340.55210-1-aaron@os.amperecomputing.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 13:11:33 +0000
Message-ID: <CAFEAcA-0KmTR4R6tWNcNwv7shAZbqNkZSkDtg7P5mSFG9vR+Xg@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Don't migrate CPUARMState.features
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: Andrew Jones <drjones@redhat.com>, Juan Quintela <quintela@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 3 Feb 2021 at 16:14, Aaron Lindsay <aaron@os.amperecomputing.com> wrote:
>
> As feature flags are added or removed, the meanings of bits in the
> `features` field can change between QEMU versions, causing migration
> failures. Additionally, migrating the field is not useful because it is
> a constant function of the CPU being used.
>
> Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/machine.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)



Applied to target-arm.next, thanks.

-- PMM

