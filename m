Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECB6565723
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 15:29:45 +0200 (CEST)
Received: from localhost ([::1]:56352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8M90-0007vs-H0
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 09:29:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8LsN-0005jO-VB
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:12:32 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:33284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8LsK-0001Wr-HS
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:12:31 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-31c89111f23so31486167b3.0
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ibjswnq8XP0EE+tGLFlLsTrOHqgrseeFum3RHVo8ld0=;
 b=a0sEThIjAN5EKUEC/sFTmUVX/6jnsx6VnC8XAd2nMXp1E/TYxoPQlLxbSwtcG2M+Jq
 XQwjyU7SOybxAnMVhd4qz7N2EyVmLoheuhAk17pn/fHVrf/Rr3GhP4WUUFRb4A6QBjNt
 AjHoqdMs7nS4aAllDd6jHm/kAjmppc5hwbYyVNm/OFLr3/18uep+GpYRAnMu1q1H1uEn
 NAFFRbXOUJV8+81fnJ8fPwyyH1yeLhuiV5AFtXk6tdB9CYSMyC6gy33d0Gekr6+d9kOY
 IiDPrmNIJHAd7as7L+xvaVw6RMR4pqtd7vaxryMpTVugNYXe19T2CbTqFDF0JIhscn/O
 HY/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ibjswnq8XP0EE+tGLFlLsTrOHqgrseeFum3RHVo8ld0=;
 b=w5fTUhlPlDSfCvOFKhW2dQzuSFj9tO2QOSuiGg14RMnIBD3HHO4U/op9tNKtbPRf0n
 xOE0wyRY5rCE3PAgyypdy3HXBO86Rnr7QaRUMCLaQTaymrKRqUxbGme3hVhtc0FOVZ+h
 sn4/fTjCPA1DcdnBMXBPuKqLyDWGukRqZNLaOZuEvGNj9iAV0zvufEnXA7eqgf8oss5c
 uHXUGEII5bkv1UOSGEjBkH1P60EDbGxChMuroMh4UQYaZBz9ms1jglUpbR7Tbk7bJ1Vg
 XrqNYadWwFW7o5Hwj4A+0+t0djhHg7ihF2hcnBzS/KsLumg7Href6ZGL+fX6TC+TOiyR
 S2ig==
X-Gm-Message-State: AJIora9WF7poXU1mxf24zMUvIX5jTqZfZygJAaHYaR+4zatCxuA4LF9Y
 9DvswBKVOJlLlvTgqhwZB8eLLjDxvTTGLMjE8BdDHw==
X-Google-Smtp-Source: AGRyM1v5PSe677T1fgFvW4yrQlvLDV8cEta9JA473i0dUBLZLtcXkkkbNGprcuUiennnHW53f7SwABuhX84+OV1yaOU=
X-Received: by 2002:a81:1cc:0:b0:317:a0fa:7a61 with SMTP id
 195-20020a8101cc000000b00317a0fa7a61mr32621349ywb.10.1656940347450; Mon, 04
 Jul 2022 06:12:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-2-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-2-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:12:16 +0100
Message-ID: <CAFEAcA-Wf+Zu0becaG6N3xyn9UzOzHFrb5ZiNjPPKXSzSrWqsQ@mail.gmail.com>
Subject: Re: [PATCH 01/40] pl050: move PL050State from pl050.c to new pl050.h
 header file
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, 29 Jun 2022 at 13:40, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This allows the QOM types in pl050.c to be used elsewhere by simply including
> pl050.h.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

