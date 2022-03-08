Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7DA4D1BAC
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 16:27:27 +0100 (CET)
Received: from localhost ([::1]:45390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRbkE-0003rS-9V
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 10:27:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRbiv-0002RC-Fa
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 10:26:06 -0500
Received: from [2607:f8b0:4864:20::b30] (port=38524
 helo=mail-yb1-xb30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRbis-000663-7B
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 10:26:05 -0500
Received: by mail-yb1-xb30.google.com with SMTP id u3so38477739ybh.5
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 07:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9SYWqBHMXnWpveB3tI/RUtXiJhyHQCdYD2yT2L+ijQ4=;
 b=rjoqWy032X1sx6/f8cBTzehl0ebjqRzLz6LHbbYK0ffjyPpqKKh9Srs1YJeZ1lwwjT
 UgGQgDiP6aGtnNl2phnmat39nkwPS296eITSY2z9Km5gI2rABm4JxLFu0GLQOMuGk/uR
 oZfPEmVgjw+OA1q8DQa0aosFGcXVdaLTSrezSCnP3qSrZf/ZGKbJJccO2KJAsnMb1z5A
 yH4MyBwl1z0o+qcL5fRnObTlEuDjui5rfyMvi47SxAJs/Wx+jB0l/rwa9LzFGu7ef8NP
 qXQKa9+i+iJ5utLW24KkzeV8EOl5pWBBItnmkNeli7nfbbOLfP8vqhlVGTS6P6lIxwd1
 fUow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9SYWqBHMXnWpveB3tI/RUtXiJhyHQCdYD2yT2L+ijQ4=;
 b=DNc97HsRED6ZWFizvgDwMpQoARRyjoE+7ECvriQ5Gdvyi+hJfB3SmR8j4zeLpREuD8
 BIerB4t/IGUDcs7mZ3asi2paK37vxT5S54hApy6aexRfMa89Ol8HPU8n3spiXSSmW9as
 8PYKvM69E8+e+//6jUC+LsHQXbx37ywWHEzQTwKsudX5tRoU+JnijH6gnFO/PLkJQcUk
 Ct2vZjCZ4SpZ7qVaYAWlJeqxc4tLgXBwAUJq7IvWRfoHSlM4T3bXGX0wk9V7hV+lRXsG
 PoA8NDE38PGxW937LfHB4mkLMsbxh4y1+9b3j/405Qfi8QiQa8vY5S+1/kumQJSa8GaC
 Taxw==
X-Gm-Message-State: AOAM531NE0+O60Ubjbt5ScBdwgZh2Gyf8EfzqU22SIh+H8nQe1rMqHQo
 9Iakm6DHJnodfaYVeHCNNS9Zps1yTwxIaVlfB4tHWw==
X-Google-Smtp-Source: ABdhPJw0lkRetbZuTj1eFcYTkyrj7C1dAv2yMx1xHjR3vD/ljiBAVVDbgG6J62rmRuVJQ6a2TsygyxMH3/ToQCzzBbI=
X-Received: by 2002:a25:d181:0:b0:629:1919:d8e5 with SMTP id
 i123-20020a25d181000000b006291919d8e5mr11358094ybg.85.1646753161057; Tue, 08
 Mar 2022 07:26:01 -0800 (PST)
MIME-Version: 1.0
References: <20220307110303.1698186-1-kraxel@redhat.com>
In-Reply-To: <20220307110303.1698186-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Mar 2022 15:25:50 +0000
Message-ID: <CAFEAcA-ELr2cPmY=40Zeqnm2gs6f_QVCA5kubmRc_w1osUZ0oA@mail.gmail.com>
Subject: Re: [PULL 0/2] Seabios 20220307 patches
To: Gerd Hoffmann <kraxel@redhat.com>
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Mar 2022 at 12:33, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 9d662a6b22a0838a85c5432385f35db2488a33a5:
>
>   Merge remote-tracking branch 'remotes/legoater/tags/pull-ppc-20220305' into staging (2022-03-05 18:03:15 +0000)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/seabios-20220307-pull-request
>
> for you to fetch changes up to d877ada1b8c768d10c39b63bb70c9e5ed1c0a4bc:
>
>   update seabios binaries to 1.16.0 (2022-03-07 11:20:21 +0100)
>
> ----------------------------------------------------------------
> update seabios to 1.16.0
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

