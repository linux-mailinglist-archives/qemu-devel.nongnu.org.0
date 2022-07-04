Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C3856588C
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 16:23:54 +0200 (CEST)
Received: from localhost ([::1]:37694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8MzR-0001ir-Le
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 10:23:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8MHQ-0007dn-Gs
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:38:27 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:44770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8MHN-0005yY-In
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:38:24 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id i7so16923316ybe.11
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NqAjTsi2tsm7KgyzKA4DctBjLTMBvvU4yow9eoKkC9Y=;
 b=vhGG0bOIl17sgzYX8EgGN5zmb2cA4tP7ge7/qCHNQSE13GyNsLHyy1pGGW8WekpEf0
 6f+zGKgE/W2AxSmxjDdus+d9hq9DzD9MK14x+ZyUJHQvfCEpZMVYNraxQvtY1UFx3RzL
 NgA1OXSuU3Ut3IMaE7Q46xv6EDDLYnPYKyFnikpgcRtQgplKwJZgjPoDOjvBff214FHU
 VdNix7KRT+iVPw5gOoZR5GZTiC/+acstHCPDtvFM/RwJS0PURV5p+3fG+xmVkhRZjyvt
 LaITBd7CiJoA0nuT7ir3o8HYmPhTgTNHXQ2QK40eK+XZ3Nv9ooGvyDhiyC6/KKgtUpjT
 dXJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NqAjTsi2tsm7KgyzKA4DctBjLTMBvvU4yow9eoKkC9Y=;
 b=gWOZ0rKud2VXvIPUYXKZHFUBHmodQ5govz+F6WI9eblt2dIf6OVpzju3DZLveeWwWS
 DW+i3BIPRl27Pqi3Uio2AF6L28PsGCycOFxTUCu3XZFJ8TGirhZjZYz4ekaMYlwdgcC5
 3UUXUroh/mvFDKV3ljRCaVsxuVtR+npigSuWsSXFcXsRx4yl7FdnZRb5L8fphwqK/jZz
 SSdYEwzSSXkv33f+KAXtcmxwp5daiAdTwDBo0SBGn1LzgeifnZgy0v+CmbAey7pUidW3
 N4gONPwVQMULZx1Po+ojsUk7gk9iJnlEzFN3+86vTp3J3/CZzG1obsZrW3t0PNszrfMN
 34pg==
X-Gm-Message-State: AJIora92bWUY0bGTbQP8J9Y9Os4V3xYYtQYJ/x/qMpA8U7+aXhNFS6OW
 iyjOOOih1TKos2P7osFCpZ5cUBVkv4nefiR4GLiUtQ==
X-Google-Smtp-Source: AGRyM1vu2vawPVtxjq62lIiXTSJEdgTDph0sAIjMVeI3umYKzfsvGyuRwJJlPphcgREaNQiyaL8BWdkFrsEe25NybX4=
X-Received: by 2002:a5b:e87:0:b0:66d:4669:9871 with SMTP id
 z7-20020a5b0e87000000b0066d46699871mr31339404ybr.288.1656941899839; Mon, 04
 Jul 2022 06:38:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-41-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-41-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:38:09 +0100
Message-ID: <CAFEAcA9FEqooZmP=yXPvidVDoXHR5i7oEgNs_LbCjxwqTMM0xA@mail.gmail.com>
Subject: Re: [PATCH 40/40] pckbd: remove legacy i8042_mm_init() function
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 29 Jun 2022 at 13:42, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This legacy function is only used during the initialisation of the MIPS magnum
> machine, so inline its functionality directly into mips_jazz_init() and then
> remove it.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

