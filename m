Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3908D2B1C05
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 14:43:47 +0100 (CET)
Received: from localhost ([::1]:60088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdZMg-0007dT-8V
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 08:43:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdZJQ-0005DD-AQ
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 08:40:24 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:41073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdZJO-0001jO-Fi
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 08:40:23 -0500
Received: by mail-ej1-x62b.google.com with SMTP id cw8so13436352ejb.8
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 05:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1+ODGzweAcPuVO4kNwz9b6893bR5/trKy5hJj0TSKYA=;
 b=uxe2P4DeVIHhI5gkIilcbcWslEq0QibOVav9TBWgp6NUKnbBCbyhnWsttN6kYIY4Og
 q8SVCc0oep0qH3ON5AdE33SpSYlaH/aj2LNakUPXIPyRVIO/wQTGTnexyFwkcWjQHu/V
 2ba6W2YTVDPPkQEzTZ9F0ImRaX7iXbWUkg+FtvNcQXvwb2UocC1jfPZzeSmC0tXKBRKv
 WwokHRv4tHcaTpLGxUwihTo9w5rgKkzqWgfzXG7t7DhKBfuKWl1ttlFRRi18h3BKhkaK
 3NlOyu70JUaigA9jiR1xCfiWQ22YANXZv2YFos8966NzO6XGy67Q90K5C8LLK+yHvKoX
 eIgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1+ODGzweAcPuVO4kNwz9b6893bR5/trKy5hJj0TSKYA=;
 b=EyJ8pq+gVpitfHCI0qDSZakLMQ7lDljZY/zoGjim90gHilbj2NA5i/BAvqV31rK6gO
 e/R0WK64CcPdLNsqw4tVUkOfbvkCauXWTDybyT6kDsnw96Rw8TmnKxVmMa8deobDfNti
 +0JBxABdSePNsDS6CZTvgoaGtS2VA6cNhw1ACPC3wHA95+bsnT9+0GYjjHfq1/ncWSto
 bQu4tzK9CHS5W/K41Nswkzj+rr0XXjHBkP5U1/Cp92/sE3AMZ5ans0MR9Mrc5d3CSWuK
 /6euoCniVdGWJAwmEF85vz5rizg4ygBXSFiuNkrYm46Z7AKtD1Dzoe6BCNE0jG/xa5k/
 jGYQ==
X-Gm-Message-State: AOAM532hXOdwrSSU3oZNaPyj4FGPcgsKCYBrYlWZrbqsGzcKqa6MRMTw
 VU8SdAz/1PcfBoingYGe0OGt8vPnUChnUrvGlkbEaQ==
X-Google-Smtp-Source: ABdhPJxzBjK9TIZzdH4ekR1XMTQ7c/EAzanB/6LP119bfsDNXk6XVni5jBZRp3WCpJVzu3xiZ6qAYpkoaGGIl4Zd48I=
X-Received: by 2002:a17:907:9e3:: with SMTP id ce3mr2043733ejc.4.1605274820901; 
 Fri, 13 Nov 2020 05:40:20 -0800 (PST)
MIME-Version: 1.0
References: <20201113122955.759-1-kraxel@redhat.com>
In-Reply-To: <20201113122955.759-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Nov 2020 13:40:09 +0000
Message-ID: <CAFEAcA_1x=bCyhErhsMcmj3Vik+M4QcNtxgNKVZL2i-0qicMeA@mail.gmail.com>
Subject: Re: [PULL 0/6] Fixes 20201113 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

On Fri, 13 Nov 2020 at 12:31, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit cb5d19e8294486551c422759260883ed290226d9:
>
>   Merge remote-tracking branch 'remotes/mcayland/tags/qemu-macppc-20201112' i=
> nto staging (2020-11-12 11:33:26 +0000)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/fixes-20201113-pull-request
>
> for you to fetch changes up to 172bc8520db1cb98d09b367360068a675fbc9413:
>
>   xhci: fix nec-usb-xhci properties (2020-11-13 07:36:33 +0100)
>
> ----------------------------------------------------------------
> fixes for console, audio, usb, vga.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

