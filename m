Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1603B4AC9F0
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 20:54:29 +0100 (CET)
Received: from localhost ([::1]:43838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHA5k-0006OZ-6j
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 14:54:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nH9l7-0007kW-Oc
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 14:33:09 -0500
Received: from [2a00:1450:4864:20::434] (port=39885
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nH9l5-0002MR-Hy
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 14:33:08 -0500
Received: by mail-wr1-x434.google.com with SMTP id u23so2905586wru.6
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 11:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SbErUaiSyDSri/FdEONCmNFUKK34GMv/QFgePq1a5Pk=;
 b=i4USf8tGO0MhtNaMo0i7z5vALlJje+NxzonGz/r6CxN8M/rDh7/Uw1Wf+w5E67Q/GI
 W8jOsI4tjgjsDWW2vJXW3F031nRNxDAJ15UlLe3iuMn0trctQsJXgRKKZjyZW4W8v2Qx
 mW5g33bKoZMXtEmUY8GgpqhcKCYBRo3F6MFQBbHumb9j0PTrfMcRsk8hTRdJ99Z+V6f1
 UM3oym7er2CBkbF3WA4xEoJBvuiJc7pxfLkcW0hyDdSDgoYBGnZ81aOECEfXMa2kiTYO
 b/3yruDtEGVKvcw6YTP5MLaPROkBmhEHnod6yqtxdbI00JJ3oN8rFumzxsycAryuS3dl
 knKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SbErUaiSyDSri/FdEONCmNFUKK34GMv/QFgePq1a5Pk=;
 b=6KehUtJ84QlP5F8BEu1UJaSRfCbKezf9yep1sdiqstTZvhOiRxxQdTKHTyaX0MhsxQ
 qmQpXlJm+owH/XBOrdogkFvS6aiAHMI5lOx8kw/Or4FPWuKpR7f+6xCuRPD8smH8Vrs3
 +ZKEZ453htEh7Wa7E2SfxlM/apNezKFGSPvujzFcy+tsrP2AC+PjAofxz1oyBPXCSmwf
 L6SlTBB6YKxAg0t3jjHSpMxib9vSbtnZR+2SHGJiGXgjnbvrmuKrXt/46cK4SEvo/Lv6
 q7di7iQY+OylpSveSfGU0O+Rl8agniYvkVJ1xOlhH8wCXlhwZfkOaWb9i9UE4gfHsrkY
 40eA==
X-Gm-Message-State: AOAM532eD94pUWdPJWDIb5lafBxhh6qmt5FZwxvpFc0t7v0f/1Hxe9Gq
 aJsf2TVnxnsMk7i3QxYTh/wnCC+LPnV/g5zt0akD427ZoYY=
X-Google-Smtp-Source: ABdhPJycQeMc7aHCA8VLTm1e2/4QR8wI/+vRqop6j2TdjhDSAMMydUwW2zUk311+iHaiX7pPdNhWh6IhVhFeJa72+wY=
X-Received: by 2002:adf:e18d:: with SMTP id az13mr772947wrb.521.1644262386116; 
 Mon, 07 Feb 2022 11:33:06 -0800 (PST)
MIME-Version: 1.0
References: <20220127205405.23499-1-mark.cave-ayland@ilande.co.uk>
 <20220127205405.23499-8-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220127205405.23499-8-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Feb 2022 19:32:55 +0000
Message-ID: <CAFEAcA-VY8aANJgeCmAoY6Or0vzMg28hjYY794DHB0=dXv76Ng@mail.gmail.com>
Subject: Re: [PATCH 07/11] mos6522: add register names to register read/write
 trace events
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Laurent@vivier.eu, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 27 Jan 2022 at 21:11, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This helps to follow how the guest is programming the mos6522 when debugging.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/misc/mos6522.c    | 10 ++++++++--
>  hw/misc/trace-events |  4 ++--
>  2 files changed, 10 insertions(+), 4 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

