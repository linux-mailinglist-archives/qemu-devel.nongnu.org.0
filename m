Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED84C1D7CB9
	for <lists+qemu-devel@lfdr.de>; Mon, 18 May 2020 17:21:43 +0200 (CEST)
Received: from localhost ([::1]:55312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jahaI-0000X7-W5
	for lists+qemu-devel@lfdr.de; Mon, 18 May 2020 11:21:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jahU1-0003Mp-2C
 for qemu-devel@nongnu.org; Mon, 18 May 2020 11:15:13 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:39755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jahTz-0006Hq-Vz
 for qemu-devel@nongnu.org; Mon, 18 May 2020 11:15:12 -0400
Received: by mail-oi1-x244.google.com with SMTP id s198so9274178oie.6
 for <qemu-devel@nongnu.org>; Mon, 18 May 2020 08:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/xUDQv/z4aE6T5HOdC3fAlsHTWZ6JnhKSzBFYDo6bRw=;
 b=VixZ6YfQoTapSP2t1UTqlCTAr6xqi8ag0+bdLUyFaFZd52twftBnGGEakRqtCCrg/M
 HmSXkp6IYLRURnahEWZPfKbuaUNUy8BurzopMtdb7jxbcXVoNBYgRp+4S8ax9LJxH8Dp
 H20sxyQRHyLNH0tpbkYfD8a31nUjP8pZD2vkgYkXNg3vRbj17lqP7gd6l4tpmiJFqaz3
 THr5/wHdbrbe9iwaUVp1dUQ7jVb8Es1htn/Eqq1+A5IReZtUjZrpD96gHyOeCMrLGWmf
 ca3oPNAqYxNRrCGaMcH9s8KJt24T2grSSvoCdDEykD1HUL81bUzx0gGSv9mvVpsCvTvG
 uM1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/xUDQv/z4aE6T5HOdC3fAlsHTWZ6JnhKSzBFYDo6bRw=;
 b=G75Vz6HczzPQnipQMBg+o3Wp//TJG+nxXoAmoGQJ2QUUcLvp+EksIolLbfSuq+BrCd
 hkZnLHJ+bgrcsjkovCP7PzP0X2OywClu89inHErO7bZAnfqAPXRaepenf5rIYvd2jk1U
 lK5SIN5jlyEPf5pwTn2Z6CBH++G4Ae38g7a3xVIgXNj5rN/8xo0LCfrl+4D6PSmgQUzb
 iVk9q2I4zVbubbI8EpyvD26Xeg8jns9REZEw4cYVKeSDyMzDAWsG78VGObI/YfdHtXj2
 HBtOYn3QqrlnqkjBosiUwOakQxrSaVJH0BZBq73RqIV4+SoCSlp2oBF1PKymAM30d67i
 JTaA==
X-Gm-Message-State: AOAM531AWFXwxMMb0PEN5aiZGVvIqpVtzm8/CrMWILXLcy9W/R0+OvX+
 aLIiJQaFtLoEzuOdpXPBSqqR4/lvBhbVzIMgPc5nZQ==
X-Google-Smtp-Source: ABdhPJz1IyT9WmqHk2eepO/diKkW7p19/wsLJOJT7LCRhbTZL0MhsmWyE02jGeIpzfB8bRlQhMlftbaPtLmxK1Elytg=
X-Received: by 2002:aca:eb96:: with SMTP id j144mr10385634oih.48.1589814910654; 
 Mon, 18 May 2020 08:15:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200512064900.28554-1-pauldzim@gmail.com>
 <20200512064900.28554-2-pauldzim@gmail.com>
In-Reply-To: <20200512064900.28554-2-pauldzim@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 May 2020 16:14:59 +0100
Message-ID: <CAFEAcA94YB4VOeuaNTzeggz9+mGo7HvcvmAsWS-x4pMJDukeRw@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] raspi: add BCM2835 SOC MPHI emulation
To: Paul Zimmerman <pauldzim@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x244.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@gmail.com>, John Snow <jsnow@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 12 May 2020 at 07:49, Paul Zimmerman <pauldzim@gmail.com> wrote:
>
> Add BCM2835 SOC MPHI (Message-based Parallel Host Interface)
> emulation. It is very basic, only providing the FIQ interrupt
> needed to allow the dwc-otg USB host controller driver in the
> Raspbian kernel to function.
>
> Signed-off-by: Paul Zimmerman <pauldzim@gmail.com>


> +static void mphi_reset(DeviceState *dev)
> +{
> +}

Surely we need to actually reset the device state fields here?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM

