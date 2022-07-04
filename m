Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 152085657DD
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 15:54:03 +0200 (CEST)
Received: from localhost ([::1]:58094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8MWY-0007Lu-2t
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 09:54:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8Lvd-0000wc-78
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:15:58 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:46798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8LvZ-00022W-G0
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:15:50 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-31c89653790so30862987b3.13
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=frjecySNsH3mju8g+aJysdIQlVQDM1GVUICUqOwAzTw=;
 b=MXZEJM6eh8a7Y5XXXQAwT/+yWd/3MIr/L/+K3OwTvm1aJZQs1VhLSmFZYm0JMWNefU
 WKgmm+XDjQAwdO2lGgeYw+jVC0gkIYc8XsOgFbXxfBNq/t/5VAeOAN661S3GZCiroF9X
 otk9Bx6UnNyNq9hv12tv60DqeCxX1gj9wGJhBAdAcetO69A0v+sBUGz6WNq8wqoBe1nz
 h3gydO1F8oilqImMl1ghTwm9B4qtT4TNIiVgxB+ffQAu6pEVeIFEx7K8HIK7YwgC84kI
 hbLf8Y+B8TT19yfbQHceBaCYFaC31EDaVCPguLrhcCHJzYgHSVCyvSwCTjRvGSgoWsko
 hoOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=frjecySNsH3mju8g+aJysdIQlVQDM1GVUICUqOwAzTw=;
 b=J8Z8ftkGC6U24Ul3bP1KqE3iaoM8I0W7jNXE34FlKCDKf1cxiKeHLsbdlhz10MnkVu
 27kk88N389WtNnBk2WBcsR73yufa9SrnhsAR+Cif2gj/EZslqm3h6rj/OdEGlHrMeFfN
 KWZ1310P9xGXMp9ICE63gdVsxN+Jh0yHWLGBLI2ih0Mqi4Xtq9GXYbK5NaYBKvBIP7wh
 +vrRgUBv3ndUQkojsNUNQnS6KEJysybqTbmdEhU6jB9FfjDdmFvfksc9Vw2/wCAZNOOv
 Fg7EUCJ8b7agHh+wSW5uwA2+NI/t6xP1vOyYbokTzJl5WRRZ6HxDCal8FG3tMe6P+8un
 A19Q==
X-Gm-Message-State: AJIora+LTMav+V1j1KonlYen/yEpR4J+O2tcQU7Mo1TJqkhcvvaXrU7U
 skcS502JROl6T0jhpNnRA7MiSOBBi27F/9mEPZTwqw==
X-Google-Smtp-Source: AGRyM1tJf8H7KjnBcC6NMcZPSD22XOku/0wxKIv3DbnqmqVuv1hRPDc7DeqpnIhCNt8NcquscIoV9ZPj/kuK6jIMzO0=
X-Received: by 2002:a81:8d08:0:b0:317:a4cd:d65d with SMTP id
 d8-20020a818d08000000b00317a4cdd65dmr32378786ywg.329.1656940548380; Mon, 04
 Jul 2022 06:15:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-6-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-6-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:15:37 +0100
Message-ID: <CAFEAcA8jL=Aht4R9vt+1QR_EG1D31SmohhPAwZWbcENMHnO-dg@mail.gmail.com>
Subject: Re: [PATCH 05/40] pl050: introduce new PL050_MOUSE_DEVICE QOM type
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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
> This will be soon be used to hold the underlying PS2_MOUSE_DEVICE object.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

