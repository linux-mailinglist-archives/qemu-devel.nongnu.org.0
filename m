Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0423AE48A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 10:03:30 +0200 (CEST)
Received: from localhost ([::1]:46984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvEu0-0004UB-Iy
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 04:03:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lvEpd-0001CS-5Q; Mon, 21 Jun 2021 03:58:57 -0400
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:41842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lvEpa-0001pX-Nx; Mon, 21 Jun 2021 03:58:56 -0400
Received: by mail-qv1-xf2a.google.com with SMTP id f5so6963445qvu.8;
 Mon, 21 Jun 2021 00:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OgDTLejhf7/FAZ9L1Nj4WtRrXYkumjFWhxEaaQexwSY=;
 b=YV4pGSF1VBgKY6ieW5pYvfCXV12PobrTMFl9y32XEEefinZnFH3pZzK8hPFzJ1Dt3D
 usbrot8vlA6RJnHsjOHrxROW5pq45Cq8I0qn/f6eC+VVRT4TFK+tdGSkZnTz+PwB6wx9
 HNXQ2YPCXxgzDsU+X16n6z5u5VC4BfpROSaYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OgDTLejhf7/FAZ9L1Nj4WtRrXYkumjFWhxEaaQexwSY=;
 b=PNnfeaphiiOcrTZwvfRPiQGdRkYh7pqVOz50CR2mZawa0MlNSpLqjzuYpxl+OU6vE/
 bOzjB88RnuqhMaUyHWoL8lQj0GXAzm7jYMSBro2O9g4N8pOsrgWUOgprrZwRw7LdUix+
 fby2xmnLokDkkNdRoaYj7S+0HtVadxvUaUbmGa9ZBXrBf64x1qnSlJMm+zSxQ87PDam8
 0knN2N6LaFN2Eg5ao5uJNKtJMiFHrLJF+wVn5i85BPetH2XRdhv/AHNqZlAepVaa0nfg
 1zWcV3YQKZ8FsWgwDFxZV1fN6dfIfEv4XGd6BUAdKCzgZ4wsoAmihqMi28nBlTSySjJB
 pHCA==
X-Gm-Message-State: AOAM532cPn1yoAiY6IQ7Pl7Qwqt331JDAB0QwWw3wdON22bWdOMkRvEA
 xkfUAdT3K+5uh31rb8tqIXhBa8Kx8wovbRq1G7E=
X-Google-Smtp-Source: ABdhPJzqbPp16BLMlUYM5xQAjSzi94J0CPExbphQrzUK3JvCBYiApNRFntTBpmwKZwjy/IVqvJl9l2JjpF00tMHHU0c=
X-Received: by 2002:ad4:48d1:: with SMTP id v17mr9689859qvx.16.1624262328232; 
 Mon, 21 Jun 2021 00:58:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210621075625.540471-1-erdnaxe@crans.org>
In-Reply-To: <20210621075625.540471-1-erdnaxe@crans.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Jun 2021 07:58:36 +0000
Message-ID: <CACPK8XeJEkkWBMXVJMeAwKJ5dq9oq-nHoQbpFv89yWOui5Z1Yw@mail.gmail.com>
Subject: Re: [PATCH v2] docs/system: arm: Add nRF boards description
To: Alexandre Iooss <erdnaxe@crans.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=joel.stan@gmail.com; helo=mail-qv1-xf2a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Su Hang <suhang16@mails.ucas.ac.cn>,
 =?UTF-8?Q?Steffen_G=C3=B6rtz?= <contrib@steffen-goertz.de>,
 "open list : All patches CC here" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 "open list : NRF51" <qemu-arm@nongnu.org>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Jun 2021 at 07:57, Alexandre Iooss <erdnaxe@crans.org> wrote:
>
> This adds the target guide for BBC Micro:bit.
>
> Information is taken from https://wiki.qemu.org/Features/MicroBit
> and from hw/arm/nrf51_soc.c.
>
> Signed-off-by: Alexandre Iooss <erdnaxe@crans.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

Thanks!

