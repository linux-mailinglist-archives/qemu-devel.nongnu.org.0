Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F085156587B
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 16:20:05 +0200 (CEST)
Received: from localhost ([::1]:57576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Mvl-0004AP-2l
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 10:20:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M4O-0002Gl-8n
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:24:56 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:38802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M4I-0003HO-1M
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:24:55 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-31c8a1e9e33so29837637b3.5
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mXQQ9PdxONj6kwWjuhW51OlCjIyvfrTMqGuv5SJSpsI=;
 b=hrQHYKyzzs5qms+U+k9TCEnYFZ5FMxNQgJ7ukZI8GJjry7y/SFpGoG/fN01prqZyuc
 5XQymEA7XtXVGGt03qzYHLjY1TFWW/wzLHk+F2YRGSLaFluk5U2gBAp4isjZwg5gp1hd
 3BoOiu8wx6LPy+0XnQIlmG0FJKfRath4OVdOMlvphInxaHRjQBKHG+M/Jl4WDoK8huvs
 qUVmj7nYzbQUmQGxidIrNfhRMF39eBF9CBxCnSImHOHb6YB+U3WwfO2DQqpyBNsBIng+
 IWaimlzTfO8TswxK6swcPA4hTxIqKmE6jXUmoOyCySX45Vzr3NFQd031hBtgYWhSyp4W
 NZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mXQQ9PdxONj6kwWjuhW51OlCjIyvfrTMqGuv5SJSpsI=;
 b=OiSw6v61EjC+/y56xjRJ/YA62D7/Hpk4VtZoccEQ/JGDtXvvLKnguwBRQnn9k6rfcN
 S0kpetXo1VRHTNMgiUNcNHflwqvsEaqxKxgDA+OhOyxJB7zuLH4R0NZiH0m1o/9pX3yM
 rwvAi5U+7GV2DHQ2RLFqgbKMePoDVnlJAk0LO6Dhd3fODyMd+/EDodS2GzeVxg7M/66M
 ayO6l9zvwgfy8u5l1Fom2hrr9TIkY2WRgSrE8zFnEOO4p3rU4uiuUSBehSrOf+Go7iFg
 ttfvX2FI4Sse43bmJAgKb9Hs14e9y9fCOuG7uqALXej/5dzzIWmSxmNB3Jha8cbNvVaP
 NlTQ==
X-Gm-Message-State: AJIora+x3x97P625xz2x2RRZtsOCUWRkNV87VCWy6TyRlM3Eub52uLMo
 /0v9BGx1+73z4AIA8MpOzkirUJjdJR/zE0mV1ZOJlg==
X-Google-Smtp-Source: AGRyM1sLCd/KnerrX1r3KGwY6oLRdPo5QExgq+z9YauDdmdvDuzQPgtNG8b/Z9fKhxoodN8xsW2jOvjBHQcwRVzb/5s=
X-Received: by 2002:a81:1cc:0:b0:317:a0fa:7a61 with SMTP id
 195-20020a8101cc000000b00317a0fa7a61mr32688362ywb.10.1656941087643; Mon, 04
 Jul 2022 06:24:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-20-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-20-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:24:36 +0100
Message-ID: <CAFEAcA_U-WoT93LgpyMXzFAjzPEygqOvcaNV3Uoo9apoHBC2Dw@mail.gmail.com>
Subject: Re: [PATCH 19/40] lasips2: move keyboard port initialisation to new
 lasips2_kbd_port_init() function
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Wed, 29 Jun 2022 at 13:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Move the initialisation of the keyboard port from lasips2_init() to
> a new lasips2_kbd_port_init() function which will be invoked using
> object_initialize_child() during the LASIPS2 device init.
>
> Update LASIPS2State so that it now holds the new LASIPS2KbdPort child object and
> ensure that it is realised in lasips2_realize().
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

