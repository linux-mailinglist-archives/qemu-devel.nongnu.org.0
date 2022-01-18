Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F78D492C3B
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 18:24:02 +0100 (CET)
Received: from localhost ([::1]:53718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9sDA-0002oA-Gx
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 12:24:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n9s8V-0005Sd-Cf
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 12:19:11 -0500
Received: from [2a00:1450:4864:20::32b] (port=52810
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n9s8T-0004VL-JH
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 12:19:10 -0500
Received: by mail-wm1-x32b.google.com with SMTP id v123so29272906wme.2
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 09:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R6dk4guVTWEPPObRRkbsOIlxjm8MPJT/ZVpm3J9/HCs=;
 b=rmgGUvAOH0mtA79+IACmwzZlknus8vD6VWzjaMRi52YpkCPWDg6lCDoGv5EI7qDy2D
 P5fWctTsdS3DDBZASuRmQ5MRDHJW2i+0sBFyt35ENDY9Lym2ob+EU1MfqThN3atzfsaN
 7efL/st1CyK11E9iF8rkkfJXcTwAJXyR9W1Xu4dioxsbP5ysWyS924n2+QIAF4XpEK63
 VXd9TLoCpLpewHF4EMRZabl4GpG5L6rWWWb0r7rpRkeFfUrmZYo8hAQKOrI110WZLMue
 SUqNSB96wTxb+SQoInxR++N352KWYHo+pvXPSqh+MjPWwd8y2YVUpZXSHAUtoHUAfjIX
 io0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R6dk4guVTWEPPObRRkbsOIlxjm8MPJT/ZVpm3J9/HCs=;
 b=zQpo+3riwodKNzXsS8sVKZA3weGqQxcRD8XcNzjBTcE+iSvQne3BKbz95p2W17jScl
 i1/1+9KZRvYFnAvIvF85nYOUTRr+YCofKCEx7LaZXvP++WffIkaXp3FmPqV5XJ0RxnUu
 AmMgRy/Nen5czB8GZHODv5AL4MK3iC9koUB2UfeOXZ0mzBHu4yJcu9wrI2G0XwSrcvWm
 k6t580Uvk6wfHDeOSrT2IB0U+88vyJm62PX+jm9o/CLOHI0UupB7gwjYKrk3x1R2A5Sg
 PCmupoXfVhzW3nyUqoUSyXaBZN2b6w48DzMQWaZdkfDkEWmA8hbdxie+zZrByzBEomf5
 8wLg==
X-Gm-Message-State: AOAM530pF344Xz9B9h7Zj0EDa7QTIldfeDegZSPmx4xpkJNL0Sevni6j
 qysM+3bjbsmDp20Gj53oBKGaC5hrG9P7Hxyz0V2p7g==
X-Google-Smtp-Source: ABdhPJwSjpOXPyjihFDacx1FfbK1pKrCveUFG5icso41oHxsCaalInfvTl/wP/Xql2NX8iJ9hJwCQcBiQcG3KWk1tCU=
X-Received: by 2002:a5d:64aa:: with SMTP id m10mr13904356wrp.295.1642526348116; 
 Tue, 18 Jan 2022 09:19:08 -0800 (PST)
MIME-Version: 1.0
References: <20220111172338.1525587-1-venture@google.com>
In-Reply-To: <20220111172338.1525587-1-venture@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Jan 2022 17:18:57 +0000
Message-ID: <CAFEAcA-U11hGUAJRPYQ_=fONyR_oKw+8igxGha7SuHQo+jrAOQ@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: kudo add lm75s behind bus 1 switch at 75
To: Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: Hao Wu <wuhaotsh@google.com>, kfting@nuvoton.com, qemu-arm@nongnu.org,
 hskinnemoen@google.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 11 Jan 2022 at 17:23, Patrick Venture <venture@google.com> wrote:
>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Signed-off-by: Patrick Venture <venture@google.com>
> ---
>  hw/arm/npcm7xx_boards.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)



Applied to target-arm.next, thanks.

-- PMM

