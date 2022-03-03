Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B934CC1CB
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 16:43:18 +0100 (CET)
Received: from localhost ([::1]:42566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPnbp-0007pB-To
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 10:43:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPnNg-0004ko-2P
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:28:40 -0500
Received: from [2607:f8b0:4864:20::b2d] (port=38766
 helo=mail-yb1-xb2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPnNe-0007rm-H9
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:28:39 -0500
Received: by mail-yb1-xb2d.google.com with SMTP id u3so10951067ybh.5
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 07:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u+rh1nN4FikYl3c+wxqn2gYAFu1pt5ISjG61yIkK1M4=;
 b=WtumYz/bMDbRCDixam293nPOfPVBgJYEJ8ytXUJRRd7dymqo61Lvve83tTM/4bPEXj
 DGXn286fnDMttcL1AOOavrgnFsPikgFZq7vA3WAuD4DGLGGXn5WspPcRUE6scoUJS8Ny
 L8Ev+QVtUWqRVIlBWwQLfLROJWbVYMBkFiYqPTLBDSqT54spt3R57SJEs+y7EjpWhzjl
 3KEMd3mvreQoWrS7T3GSqQa+IJrJ2NdkBI0eau3dClNylqxNJ1kXIwIYdgkhAfDnMRY7
 e86oMCwHB4uRT+UDMl6g5oCkXJATDe/OeBq6s2FptGBqRlVnxIF3f5ev3iHvm5BeIQXi
 abXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u+rh1nN4FikYl3c+wxqn2gYAFu1pt5ISjG61yIkK1M4=;
 b=M5LlrP4bTTJSiI2aWs9f4oGZB/N+HPkgtzotdLPEKsEmUMYOaBg1zCQYAsXGYjvzBU
 +FhDHP1EiD/5fuQcGqbPBVWBYTsx8otVozh8g04ajP4lCCbo1dxULPrMNdi8YmH+434i
 2dCSQtT9N3rmvpN1ez88P+vJn3YAX+r9vf6fvpcuvXa++ZTLgRNUdRwuQBdtTfKALb7u
 eWcwl636yc3LLDCufIke7b564CqE//GZ4EoJkJTehndB5XWiBJB9lPmc3XdAfsMVXDdE
 HUbed3Lt2jnyosMkHjxf1dMCZ3h/tlGFFda08jk6ZvgXJqigpw8PJQowUu5M0V2ejkMv
 qUiw==
X-Gm-Message-State: AOAM531lZoYHacKr8xWKkOmZN0vFb6+y74GrVprPZgnk2M/3jJuuw/E0
 nwMQUEBH7OQK4C/ZMbkKPMuM+QkzgkJzxiYcBuqhPw==
X-Google-Smtp-Source: ABdhPJw4J4mhj4s7v4h3cS5aO9A0U7A49nRk7ISJFxKH41gMprRPQ84bFtBLOnDl65ktnmsKZtATg9DzgZhNndU/7Q4=
X-Received: by 2002:a25:9c08:0:b0:628:a472:30f4 with SMTP id
 c8-20020a259c08000000b00628a47230f4mr7333273ybo.67.1646321316976; Thu, 03 Mar
 2022 07:28:36 -0800 (PST)
MIME-Version: 1.0
References: <20220302212752.6922-1-mark.cave-ayland@ilande.co.uk>
 <20220302212752.6922-6-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220302212752.6922-6-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Mar 2022 15:28:26 +0000
Message-ID: <CAFEAcA-gR7rNKw2KJM-Cei6NELKdn8imB=uvOSGH=Em_5imuzw@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] macfb: set initial value of mode control
 registers in macfb_common_realize()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: fam@euphon.net, pbonzini@redhat.com, Laurent@vivier.eu,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Mar 2022 at 21:35, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> If booting Linux directly in the q800 machine using -kernel rather than using a
> MacOS toolbox ROM, the mode control registers are never initialised,
> causing macfb_mode_write() to fail to determine the current resolution after
> migration. Resolve this by always setting the initial values of the mode control
> registers based upon the initial macfb properties during realize.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/display/macfb.c | 8 ++++++++

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

