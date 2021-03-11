Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AD9337D79
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 20:14:46 +0100 (CET)
Received: from localhost ([::1]:58832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKQlg-0004B7-TX
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 14:14:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKQbQ-0000Sz-Ei
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 14:04:08 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:34353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKQbM-0006oj-Rt
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 14:04:06 -0500
Received: by mail-ej1-x634.google.com with SMTP id hs11so48491659ejc.1
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 11:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wPrPjCtHr/VVuVBVxvmWBB0IFWWKURKt2u5lBkFC14c=;
 b=pItZojk+ozYF8Kq35MCsEWQ0E9NDuje4jhFIM9nkASEX8kLfoJJ8oEhzAIzIRLgvWe
 KIX7nxq7FErCdl4BgiXBwkAvplpaatI6uAu/o8DyYYdLr50+2Af87eLcsFQrWDrdPI3t
 w6/8gxNA6ORb/PIwiUydcIczZhjWH/h7Dvc1D4Hxv9cIo9J0NX1IODDyVipKxHpKq9Z/
 D9fVLvoJr/BwDINog9rkFC5/Gn2cajX7XmHdmldh5YFwb8lvGgbvc8QW2WAkJ8+KS4y3
 8HNIW7O/dl2jmWNSj7ktEcI9qEGGX3Ln0G1Hg6je3mmjaeNWGZ+4gB3Y/kqGhhn5PSR3
 0irQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wPrPjCtHr/VVuVBVxvmWBB0IFWWKURKt2u5lBkFC14c=;
 b=d5Xeox9PVbyOuev4Ajdnbis/5e1s01XY+fN/zZOeJGUpM270u7Xmk6rzS/dvBemTry
 +YQqGttsU6bDWVogsGzm60lw9Asu8WL1oK0AwfUbkaujAmlj59lisK9t+4UF4d91YPUx
 32FAUFlEzNiL+8xPlEDbKY49MMrdBaVGP/gTBspW9GQJJwX5BD2TxanWwxCMaIi67OlX
 ab9IZVGgfQmwrsBSHl7zPEGMN8/bAxDS+0PfBdRgmXQS2+LoOqk6jijdtiIlJK/GXt+V
 QuFaVb6SriF6v9uciumHbcCjCwQQPtXxe6tAWS1H2dKtsiGjSq+cL3e3anD2SgtbyxLm
 zhrw==
X-Gm-Message-State: AOAM532kD6aRKrEA1i4vEYp79eJtCI7d1XF8eAtWMCqgo78+uxOrSKXn
 55P3YJbaMWhDefQzm5B3FtuixNtQfJwgSJhCQPF3xw==
X-Google-Smtp-Source: ABdhPJzCj/z+QX5tXSwEj1nz8e4NZ7UPdDsbzrH6S6gM4QJv4POwwQSimVcfLd8L22w71u+sSkT6SfMRWhu8aLtzCiE=
X-Received: by 2002:a17:906:16ca:: with SMTP id
 t10mr4575790ejd.85.1615489443305; 
 Thu, 11 Mar 2021 11:04:03 -0800 (PST)
MIME-Version: 1.0
References: <20210310214504.1183162-1-laurent@vivier.eu>
 <0a9adc53-f0ec-f3fe-ad1f-197ec89fd491@vivier.eu>
In-Reply-To: <0a9adc53-f0ec-f3fe-ad1f-197ec89fd491@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Mar 2021 19:03:44 +0000
Message-ID: <CAFEAcA-OcKZEFvpZk4hPXF8FWLq6qzWRq9e2hF31KfQ_gv_nhg@mail.gmail.com>
Subject: Re: [PULL 00/22] Trivial branch for 6.0 patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 10 Mar 2021 at 21:53, Laurent Vivier <laurent@vivier.eu> wrote:
>
> Peter,
>
> my "git publish" has failed at patch 20 with:
>
> Requested action aborted
> Mails per session limit exceeded.
>
> I think my email provider has added new limits :(
>
> can you merge this PR without I have to resend it?

Yeah, the cover letter is the only bit that's critical to the
process; the rest is just archive/information for other list
subscribers about what went in.

-- PMM

