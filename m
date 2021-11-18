Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA94456258
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 19:28:37 +0100 (CET)
Received: from localhost ([::1]:40138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnm9E-0005gg-Ux
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 13:28:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mnm4h-0007WS-RQ
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 13:23:55 -0500
Received: from [2a00:1450:4864:20::330] (port=42612
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mnm4g-00073d-7Y
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 13:23:55 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so5539312wmd.1
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 10:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H4usAUFIzIS4gVpkypQVLnjTOqWRumxopV0oJmUTAyI=;
 b=ZQmS87b8kkWYMm0y5CFst6eWzrLO1ruygwrlWKGnhHifwVcxF8vhbeof4OyCp7ABpp
 /Jja91V/v5QrIJ+hGu+hYsn2bhp2fRfKm0WNNtqxYOaAgo5XG1xKif6zUe7liFspYavz
 DIJc9uk8xEslQBH7DTqad5Zg/vK+ziUKudZpREFgCV7I2vLtMhF7r0//g92JBDGIsPre
 iet6+zkRRjwGxeEm5MHF9ygfdw2xUUvOLMhdCo/1XmG24GOIiWP80ng1MWjhGlOejn2+
 yDXlNLVWZKk9YhafYay/g94WwmNrWKwfw9eTLWmuhcXSo2u97f8ehxMYRXHWokTeL/O/
 1Lvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H4usAUFIzIS4gVpkypQVLnjTOqWRumxopV0oJmUTAyI=;
 b=x2q/lATEEUDnOFAlDKad7Y8ozXaXnikiRO24+yNkRHB3N3bjgv7qMCdn7O6nB8C2W7
 +ICy1Q9HBJ1mXHnPJmzy51l0i/DpwCL/lbcFkptggOLAsPy91hzdzL91bLwQYx1mw2Va
 JjQk0laOSXNOK9bqO70yqqWv/F+hNQrCnPPu3UtSCHIGq+DwO6SuhACmQr/BVFVaGy9j
 ndgQHicaxi4Fz/vThf9R10+HV0E73YRf1LHOOmhOylcBBy+zK48/KliYC4e9ocXF6mT3
 gXaa10fAOzIu9T6EktK4RRSU9kV7VnUwggYVJW4jFhSB0HLTMTAF8igYmCOMP2GXz5cb
 QdCw==
X-Gm-Message-State: AOAM531LGGQkIp7wjvFSbiLXwZegwU57pifFVy+eTsEZWSqKSXIFr2uQ
 R0qKaZEonC6mqV1SEz144+K9KeJQFJtA09YiYClh8w==
X-Google-Smtp-Source: ABdhPJyYnzD2WJ3AWdP3KvIJzY/dxsvXH1GjFIlMy+esYRUAAm0MKx1516M/meg8fxaODjHrGID5TrauHnLn5se1nd4=
X-Received: by 2002:a05:600c:22d0:: with SMTP id
 16mr12513562wmg.37.1637259830100; 
 Thu, 18 Nov 2021 10:23:50 -0800 (PST)
MIME-Version: 1.0
References: <20211118181835.18497-1-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20211118181835.18497-1-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Nov 2021 18:23:38 +0000
Message-ID: <CAFEAcA9iCtdyprx7C_m0++TrUjTEEYPYGsA96cVQ4jZVR0hjzw@mail.gmail.com>
Subject: Re: [PATCH for-6.2 0/2] escc: fixes for STATUS_TXEMPTY and
 SPEC_ALLSENT
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 18 Nov 2021 at 18:18, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This is another attempt to fix booting 32-bit QEMU SPARC machines in
> qemu-system-sparc using a real Sun PROM based upon further experiments and
> re-reading of the ESCC datasheet from a previous patch posted at
> https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg00324.html.
>
> It appears that both the Sun PROM and OpenBSD with OpenBIOS fail to send an
> explicit reset command as recommended in the ESCC datasheet, which causes
> hangs during serial port enumeration since the introduction of the recent
> ESCC reset changes.
>
> The first patch always sets STATUS_TXEMPTY in R_STATUS on hardware reset
> which wasn't documented in the "Reset" section(s) but is documented in the
> "Transmit Interrupts and Transmit Buffer Empty Bit" section, whilst the
> second patch updates SPEC_ALLSENT when writing to W_TXCTRL1.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Series
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

