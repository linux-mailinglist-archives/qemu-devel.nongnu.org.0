Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A9656578C
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 15:41:57 +0200 (CEST)
Received: from localhost ([::1]:53358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8MKp-0001Ey-99
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 09:41:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8LwF-0001dR-L1
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:16:35 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:47023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8LwD-0002D1-W7
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:16:31 -0400
Received: by mail-yb1-xb29.google.com with SMTP id l11so16801783ybu.13
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tqcySluQQMY8UrMYaQXGRyFmjv4IYpNVhoF/HpBgJCI=;
 b=flZVnvSWC6m504mFvIJZyqLWpnhvmVOMftF83hRfhqR63LDhqEpXgbP1vmsaiq22FQ
 ytboPPeGTAmKOW/RYD1hHik6QF0HVLmLNmRSD3XBrSMiYhmaAG80J97zGO3+ItT2PYap
 9v9z3EF33g+sTdfqS5UHW2HSiF1BIt/Mw/h8yXc3tbGVBoQ2Nr04frLKxFLzURx/8jJe
 A1FmQUVf6itqfzDvs78orREP3FEpxNbfWizpL1Fg/RNRPBkjz+zJAYXBA7lJwz19cs3v
 Pmn7YTeJSpRMgN6cKO1kUmVJvvosPCj9VE1S143pVjfYIru0RpqeK15JI48Ckzy95sLy
 QWBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tqcySluQQMY8UrMYaQXGRyFmjv4IYpNVhoF/HpBgJCI=;
 b=OeS8/7M5djRgMCiBHLmHP0uZDi0rQcPsiBkYBY813SpH3eGf6+37vXR3O81P3CSNIx
 B3PPnfcgWNydPiJD31bgcO5B1VCH3KtuWI3viQHksHtQngvu25LVudbSzwf6lSQ1zMGY
 cWtye6HcvcauWAkcuFZ/j2Tl8+czOYGZGKXT7OTtmEGJT+dolGi2DkIMSEQYP282y16w
 RM3NHa6Qzkg7xHqjc921YZi18z5IYpep14BXAGgkOg06Af7YE9QDFm4J4WviiWyf6prx
 /BeW0r19MclZux7QQR8VosQwy95QZYc6TXCDiIHMUQs0x9lE45L6qop2DiK33iFZQoXP
 gukQ==
X-Gm-Message-State: AJIora8ImCwjIenwVKbnfwGaCDFw7yPnmwperDUeKyWfGeCmtN/BHQlp
 2nt/f468YUKxW+FVpDs3SIb6xonZybpapf9oNAxx3Q==
X-Google-Smtp-Source: AGRyM1tGbIi6n89HAEkSbK6FWFddiqkMmIMoTDKgCS5s/1HrMHICBq04kb3vAC2BpJpm+vTeZcboxgwBHts98+VJMTw=
X-Received: by 2002:a25:d7d6:0:b0:66e:47b3:35be with SMTP id
 o205-20020a25d7d6000000b0066e47b335bemr5992687ybg.140.1656940589098; Mon, 04
 Jul 2022 06:16:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-7-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-7-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:16:18 +0100
Message-ID: <CAFEAcA96p9Cpjfh80jeqbKXU7vP+BUk+a5T6QeR2TEXkxwWJcQ@mail.gmail.com>
Subject: Re: [PATCH 06/40] pl050: move logic from pl050_realize() to
 pl050_init()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
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
> The logic for initialising the register memory region and the sysbus output IRQ
> does not depend upon any device properties and so can be moved from
> pl050_realize() to pl050_init().
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

One of these days we must figure out and write down some conventions
for init vs realize...

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

