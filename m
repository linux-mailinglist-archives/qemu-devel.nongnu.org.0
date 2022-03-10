Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2A74D4CD2
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 16:38:35 +0100 (CET)
Received: from localhost ([::1]:50454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSKs6-0001gT-FJ
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 10:38:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nSKoq-0003WU-5k
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 10:35:12 -0500
Received: from [2607:f8b0:4864:20::b30] (port=33701
 helo=mail-yb1-xb30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nSKoo-0004G8-C1
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 10:35:11 -0500
Received: by mail-yb1-xb30.google.com with SMTP id j2so11735340ybu.0
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 07:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FlU27afvNxpzvNRzy9c5f9eEB/XFAB3a/wzTeUdWAsQ=;
 b=bl3TOAutgA0HMflV1dLOzJTtGx30s97gwSuHu5CyAuui61Sy7OMSvwJIG9mMYbAt9C
 ZEqqWzFpRGtEXuZZUt3ICR5u7aKUf8ohElHSbaKzRiZ/ri5r50QISlhdkkjJZUTdd6xt
 6fSOyM6jEHb5bWQpRy7yRi0CSyxNcitQcyYosRNrzpK4aqgE/tYrWlzkfV+4oxMgoL3p
 DgNzN+9ebcKZNOlleekGHDWZ25ai9ZG6Tk5X7bQ/4AA2OoTjfSdfOp9h6PI93wKun8l2
 /1/l7YXuvcKqTKtQqR0MfO6WrNnpUaP8DWOafXX1zopr93BPABvtYo0rCL19QA26hpSo
 1PPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FlU27afvNxpzvNRzy9c5f9eEB/XFAB3a/wzTeUdWAsQ=;
 b=z8BV1BhNExHxF3JurjtelSKL9Iy+s5Yd7PjLt731FWTp/D9tmVbgsHN/6WG2de4EF7
 gODDtVaVLW2zgO68nmOXAly78dObas0QZ/oZBfQ10u+5I7qJ6Rw2xThJkvmehOs4wHKQ
 CBv3zXI50Mhvn4eachetUlFd0xie6DtrMfQoQHXyKUZ1/X0y+/JwiTSjYBnwTTd8NFJl
 vlmHoY8sLnl0pT5RkoF6AZ28IB4FXJJAfv0wV8dPoFTgbs9+S1viTiwlzTUQS7E6jQhv
 fTqITJg/sKOhN9Ln1I+c87fBHqB/6klopavf8IiGPUHBYTNOCOfO5R7bHNmHWVTXFbGz
 Sd2Q==
X-Gm-Message-State: AOAM530Ydx4uIlh0Rf2q7gUdgzVkkdb2RJw8DaXZiGZirUuryYXikMdx
 baJXnc2mIX18Jszogj5dkTjz4WTog06F3SB2i6XKOg==
X-Google-Smtp-Source: ABdhPJxQ0hYKkS8QXZmov5l/PfQBlrxwCHb5FjHNWt4FUM20j2NBx7xFalgrDVm0uTftCe1aykO3c3sc3YZU+EW10t8=
X-Received: by 2002:a5b:745:0:b0:622:1c46:3c19 with SMTP id
 s5-20020a5b0745000000b006221c463c19mr4324730ybq.479.1646926508952; Thu, 10
 Mar 2022 07:35:08 -0800 (PST)
MIME-Version: 1.0
References: <20220309110831.18443-1-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220309110831.18443-1-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Mar 2022 15:34:57 +0000
Message-ID: <CAFEAcA9Coor=pXJLhn=KCYy+fiy4MJ7WcEjU0U9GYOM+Ac1qMw@mail.gmail.com>
Subject: Re: [PULL 00/22] q800-updates-for-7.0 queue 20220309
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
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
Cc: Laurent@vivier.eu, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 9 Mar 2022 at 11:08, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> The following changes since commit 9f0369efb0f2a200f18b1aacd2ef493e22da5351:
>
>   Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2022-03-08 22:27:34 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/mcayland/qemu.git tags/q800-updates-for-7.0-20220309
>
> for you to fetch changes up to a7a2208862bee2bc4fe55adfd947dc4a15ad0216:
>
>   esp: recreate ESPState current_req after migration (2022-03-09 09:29:10 +0000)
>
> ----------------------------------------------------------------
> q800-updates-for-7.0 queue
>
> [MCA: this is the current q800 patch queue for 7.0 which I'm picking up on
> behalf of Laurent]
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

