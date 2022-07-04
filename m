Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9709F565A5B
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 17:50:18 +0200 (CEST)
Received: from localhost ([::1]:55420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8OL3-0007G6-E5
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 11:50:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8OIL-00054Y-RC
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 11:47:34 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:45980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8OIK-0006Tc-Gf
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 11:47:29 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id 64so8240127ybt.12
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 08:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KhTuKKpQ0jpkFvgxGU/wD6uNN9YocZbYPN6N8Eub9Ks=;
 b=DqaJHoxir+eCS1IY+e7He9ziaO9b/xIZsYSE0II+Fu628QbqoVyiW5iL6SrGhF21ub
 oZjRr69SILXZLcDww4c8nPmoNqfSb3OM+m7k1MYSzWmkxesgLzIjHs3if3t5LPkj3Xop
 WJg+quN9u3Nac163G5C13qHwf4ZExlF+sj6PquTRmcIbTrggRf7EPHgPJY1DI2k1cybI
 lAR0z5cYul/Vg7ShL073CfigxCLSR/jQpQMez6IF7GxUeYQn7iQgQfxxAg/+PILh9Pts
 N/T2vVDKBFgH2/AJj0+xMN7q/qR7Bc0cHGTUym6AQnbzpf3jjGyVVoRVz020yBZ81S9Y
 FYnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KhTuKKpQ0jpkFvgxGU/wD6uNN9YocZbYPN6N8Eub9Ks=;
 b=eB2EZtdzoZurPPD9C0/UofvnifiMuyMAJYKkELhpcW+WKsjoLKAqcssE8ntQT4zscw
 Z09wj55N2gmscDVfP5IFeo+RK0Es++CfFbZ3KPow2IFCsPajBkAUa1BOHXkqruiQsQJP
 JDoOe84SVdRUdZZi1pi3R7RYTniq0+46W2uEUHUVSQNaZL33qsLNJnl8hzi2q27uZhfX
 Fns86n2oTfvwpUQywy/cDi5+A4iPs48KAe1ImX1dd0jPMMhxBgu7ApWhUC16246Dwgml
 UjC0YNC1VBctezxFwDX8+EDyO6iXKF52w6QtqM6HxS2Tkb6DkwPvPbe9IatRFzsbX4Hc
 4Iag==
X-Gm-Message-State: AJIora9jXflSqjF9m/pyB3bECqxB/CCi+y+MG37Eetofjh++nmYiEp7S
 OGqKnhy6cw0eRQMYY3PcUqzzeaRRZoC1ZsH02W6ykw==
X-Google-Smtp-Source: AGRyM1u9ft9FUTHMdGhCAfZQZqpuRmvpuvbmMWZ8ax2fq1q8VRp4+Nbj0x1cnFIhMrO4sacVt+/InLfEeH8NZYJN1Ug=
X-Received: by 2002:a25:d7d6:0:b0:66e:47b3:35be with SMTP id
 o205-20020a25d7d6000000b0066e47b335bemr6786523ybg.140.1656949646912; Mon, 04
 Jul 2022 08:47:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220704152303.760983-1-berrange@redhat.com>
 <20220704152303.760983-8-berrange@redhat.com>
In-Reply-To: <20220704152303.760983-8-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 16:47:16 +0100
Message-ID: <CAFEAcA-DeKXAq8o_pYt5oyWRnLPvhWMfTbM+vCFpx8MYyC3ZoQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] tests/style: check qemu/osdep.h is included in all
 .c files
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
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

On Mon, 4 Jul 2022 at 16:23, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

> +
> +sc_c_file_osdep_h:
> +       @require=3D'#include "qemu/osdep.h"' \
> +       in_vc_files=3D'\.c$$' \
> +       halt=3D'all C files must include qemu/osdep.h' \
> +       $(_sc_search_regexp)

The rule is not just "included in all C files", but "included
as the *first* include in all C files".

thanks
-- PMM

