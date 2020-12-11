Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB26F2D7A1E
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 16:59:14 +0100 (CET)
Received: from localhost ([::1]:43222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knkp7-0007dx-Kg
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 10:59:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knkfC-0004Z5-Dd
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:48:58 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:35657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knkf9-0005sY-FO
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:48:58 -0500
Received: by mail-ej1-x644.google.com with SMTP id f23so12987997ejk.2
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 07:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=o8HS7+IP4fCB/697KrqbToVlY2QnDh2aRoTVegTOLog=;
 b=QUQsmgL+aM1wJcvfqUNVi78K3d7Ize+HqhM66f7EyCvdpm7bzNyNYk/aEihuwyc2BB
 F0FboP7o9rZ7TbE4H6vjUSD45Wf1iNL3CMwo8h5gZRboMEIHZN+Fsf3WRW6bCMBZujdm
 e4xVyGjoHF3Ph8xIT6rVbVYXDb8yhJ6pwOxSZGaHcepIRtbcszHfMo7ZaIX1BUAAtvlC
 THHH7px41KXU/zo7KEuzaxZ2raW1xFZDfthi8NMbmgPlCgizwBUAO536laA7Cz/L5CWu
 00YUJpQsfF8qCfvoNoWNQrZEPbXy4gyV6HdYPR4NPbeGfKDYHQ6jbnwd9/GxmpgZS3uF
 OK0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=o8HS7+IP4fCB/697KrqbToVlY2QnDh2aRoTVegTOLog=;
 b=MtWhUpwzzVS4QBuhaOYUg0XL06P7aTacZEOncy/MyZWmgzcvw8T69eM4xaimf7P6ZV
 jLm5pw4ytKF+y8XSaD6C991bFhzdhvLOR7CKxxp5iZB8kBAqpwKZpEmsz+Q+cCnH/w+d
 GfeP3UPsXQwieSCkPDXeAQA+I6ZxONiaSDAYrgo1dYW7BjougP+dXQSyxmJxqYKn1EeS
 MfmnJDScnL+Jt+F7tJxzVH0vIzQBfO2IvUH79yqHeTFH1OfBFawcxxHUY9br0+RdFM0E
 PTcIyDjY/MWks/ioK4drcMNUShJ+g3W69i8OUrOf73i6uNO1QklOq3lfKfUXVsM8Kdy4
 ovgA==
X-Gm-Message-State: AOAM531FLUbniuVTbAidRkPxk4ahu3f+BCku0pioTqJTQa19j0+CEP70
 afNuAhO/FvLgog2BdZwm4u2I9oT9HLsTA8g3U8rqzQ==
X-Google-Smtp-Source: ABdhPJxTYAbIpQdoZByVxXJF2HKKruXAbGNQbPKFhvvj3f2H01Oncg+741dYm0iNF4n0/900sPBwl/r1JSWsSKgKEhs=
X-Received: by 2002:a17:906:1151:: with SMTP id
 i17mr11784274eja.250.1607701732526; 
 Fri, 11 Dec 2020 07:48:52 -0800 (PST)
MIME-Version: 1.0
References: <20201211154605.511714-1-f4bug@amsat.org>
In-Reply-To: <20201211154605.511714-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Dec 2020 15:48:41 +0000
Message-ID: <CAFEAcA-uv+5yoPNRDY0n69Amhqi_LiamVoBAP-Ui7yD1gGXYWQ@mail.gmail.com>
Subject: Re: [PATCH] hw/rtc/twl92230: Add missing 'break'
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 11 Dec 2020 at 15:46, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Add missing 'break' to fix:
>
>   hw/rtc/twl92230.c: In function =E2=80=98menelaus_write=E2=80=99:
>   hw/rtc/twl92230.c:713:5: error: label at end of compound statement
>     713 |     default:
>         |     ^~~~~~~
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> I noticed Thomas "Compile QEMU with -Wimplicit-fallthrough" series
> and remembered this old patch.
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/rtc/twl92230.c | 1 +
>  1 file changed, 1 insertion(+)

I guess the compiler doesn't care about missing 'break' in
the last case in a switch statement. But I think putting in
the 'break' is better style anyway.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

