Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A0D4DC570
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 13:03:26 +0100 (CET)
Received: from localhost ([::1]:60712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUoqj-0005UI-RA
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 08:03:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUolm-0002wl-Dk
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 07:58:18 -0400
Received: from [2607:f8b0:4864:20::b33] (port=37531
 helo=mail-yb1-xb33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUolk-0008TH-NI
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 07:58:17 -0400
Received: by mail-yb1-xb33.google.com with SMTP id m67so9772425ybm.4
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 04:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Fa964zRSs1mnGK6zMElR4UNTgO/GG+zQOUQbMaHgRvo=;
 b=A91tZx2AQNdF6oYv5zq2QkMNS5R9q/F5Dg3gjeSerNP9Q+NEsRaFEEA5v/I6Jybrcw
 9lAA7NsvGp4T7yOEE1tK8M0PS1DOtmvD9lAWtpmDtStyQPCz6+ST9koR5TLy2AJknfnK
 o1fkIMTj8gpyhDqpfP2z6t3EKt+Mbm6AUMjyopiSK3tx7Sn6QwD31F411yVpfS5Xwp9u
 xbloZsaCjRvtcGM+mpSJrOdqmm5PQ4RU0TsKymrE9BHY8qoloXCL1sAc4rtbGHkL4kFj
 DFWbQ0JJmIFSvXeoNxLcNDSdFonX1/nZb60Mg3lYQgQ2EvUTVqFcErxgzMyKaSyQnKXH
 NU8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Fa964zRSs1mnGK6zMElR4UNTgO/GG+zQOUQbMaHgRvo=;
 b=vGfOgqmPFsNstDJ7IHTRhXgaRBzPhQ5oPS+cQ3a8fQcMYxONJwUDtuOVy/tviAs8Xd
 mvR576WMaUFRW6GAMe+UloHMA/t/YegO+RXnY/fEa8frN0jS2CU/fIZUU1xo1jnQ0DDK
 jGcTh1h9T3CS2iOZMqNcqsTdP8fWvzl4pCYNVTSHkT60g3luC5F9uqRkPlcDDWpEPw9c
 D1COL1D1ATxPHlUdEPYt7uKiXHXfPGK3MXqJ9cDW4LwGnhShGao/oy3PnzLudWjiGa1D
 2/TU5bHS/0/mOjKCRvYoI/rLeXBWOLtetRlrTK+skjN4CS+PG1zkbvG9LAFYQB6IbZsC
 8aWw==
X-Gm-Message-State: AOAM531KP35+mYKLkaRcN3+WI+zqxEvzOJKXYvbCMqlEkRL7jsTy0vuY
 09DB3idhytswqbaxpRcYGZgAvUi+c4EFKYFM31cPYA==
X-Google-Smtp-Source: ABdhPJyUkUKzec+KUWGF31OcqUUUY1o7ijtn04NTbKqluoMi3xcuTUw5T7WSQqAu1k3XSuLlAbb9AqIbiEgbRZTsuTw=
X-Received: by 2002:a25:bf8b:0:b0:633:8a66:c4cd with SMTP id
 l11-20020a25bf8b000000b006338a66c4cdmr4457040ybk.85.1647518295592; Thu, 17
 Mar 2022 04:58:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220317115644.37276-1-philippe.mathieu.daude@gmail.com>
 <20220317115644.37276-2-philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220317115644.37276-2-philippe.mathieu.daude@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Mar 2022 11:58:03 +0000
Message-ID: <CAFEAcA-dzy_ofH8tJB+Dcyy1+E16vNutcWYUsCQqjwNwFJeeKQ@mail.gmail.com>
Subject: Re: [RFC PATCH-for-7.0 v3 1/2] ui/cocoa: Code movement
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Mar 2022 at 11:57, Philippe Mathieu-Daud=C3=A9
<philippe.mathieu.daude@gmail.com> wrote:
>
> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> Pure code movement in preparation for the next commit.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

