Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B84B549F7A3
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 11:54:11 +0100 (CET)
Received: from localhost ([::1]:56338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDOtO-0004kK-It
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 05:54:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDOrW-0002H7-CA
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 05:52:14 -0500
Received: from [2a00:1450:4864:20::42e] (port=46658
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDOrT-0003Fe-Kr
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 05:52:14 -0500
Received: by mail-wr1-x42e.google.com with SMTP id l25so10017235wrb.13
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 02:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cLjP2O4H615JGx2i+CeBkLHEIC2riVesbwrQ06Izni0=;
 b=HhaSobLkvtPbNrHmLXXa09uFAHSv8tNwtpOCjEQdortK3+2yBcr+JyK5mBtPy37Nvw
 Zsou/OttqeDm+/ktK8fo7Prf5DVhDYmXb2pepo9mPXj8Q/6AFAKTpktBL2bkW7V7HSVn
 oyEB3ioWNXIr1WIC4TM8Y8rlL2xmFe9UxwRzw8m56FlyFD67uxSLrRAxWgN45Eo1vz7T
 sidAWX1NSmDYWxerl9Jt+XJwhZJQFCIg1D1ADQBX8j/oYEW+VdgYgnUPdHFR5UX6YOEE
 Vxc22j/M+cUL5EsrEKQ1Bkv/XUMd6jOosqdo5D3PDbwGmdA+hGhc/lyBRhH9ss5mrUXn
 mYyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cLjP2O4H615JGx2i+CeBkLHEIC2riVesbwrQ06Izni0=;
 b=wSBSSScoZt29SPPGJv7rGOYQJ61KUbEYYz9T9vlUg9rZkYthQtjuPTE1RagB6mjUR7
 x97fC6XUXjVSmNhKjWMgcr/0SCvHUvqR5Nd+uIpw23aL4gkRohvnPXZe/lpB+ZxjEMT1
 WpzxzzLHSEJAc5NFJOFVWtfFBqk6kZYZjNOX991C5ViiTvWbG/vhA+Xl9k4mI22OFKLj
 JOgZjtBwoLmOdCtlJrswLTBvCJagyooe/hPTLvoPTyfucx35gGDWGDAXfUweOyXw22e3
 iS+zniIsfimKFeWl5fesoyQydhIZS2R6Lp9VhdQdDIs9T0Y42rKdoo7Jd3wvpz7utt1T
 gg7w==
X-Gm-Message-State: AOAM532w6+nekMXeEtt1kfw0kjXlkrgrzi6SNrQaYbpb29+VD0pHAEo+
 V/5x1irFtNV2wEEJhAD9YTkg5HNFvbfsOYvbqUl5xQ==
X-Google-Smtp-Source: ABdhPJznf8XmZ55w4Oah5x7g1V3Kw8pjzlAA6aZ/L25vI7GzI3CO2aUbuUwmio1rlJ6knok6yx8w5cXihoH+FEYrq6c=
X-Received: by 2002:a05:6000:258:: with SMTP id
 m24mr6904812wrz.2.1643367122347; 
 Fri, 28 Jan 2022 02:52:02 -0800 (PST)
MIME-Version: 1.0
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
 <20220111171048.3545974-3-peter.maydell@linaro.org>
 <908f211b-0882-cce4-2fa9-dd43ced4545d@linaro.org>
In-Reply-To: <908f211b-0882-cce4-2fa9-dd43ced4545d@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Jan 2022 10:51:51 +0000
Message-ID: <CAFEAcA8Vy-_xb7fUw8eS5gaotGXxEFMFk=S0ZnPd_HcQ+-_vsg@mail.gmail.com>
Subject: Re: [PATCH v2 02/13] hw/intc/arm_gicv3_its: Convert int ID check to
 num_intids convention
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 28 Jan 2022 at 01:35, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 1/12/22 04:10, Peter Maydell wrote:
> > The bounds check on the number of interrupt IDs is correct, but
> > doesn't match our convention; change the variable name, initialize it
> > to the 2^n value rather than (2^n)-1, and use >=3D instead of > in the
> > comparison.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > ---
> >   hw/intc/arm_gicv3_its.c | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> > index 6d11fa02040..5919b1a3b7f 100644
> > --- a/hw/intc/arm_gicv3_its.c
> > +++ b/hw/intc/arm_gicv3_its.c
> > @@ -338,7 +338,7 @@ static bool process_mapti(GICv3ITSState *s, uint64_=
t value, uint32_t offset,
> >       uint32_t devid, eventid;
> >       uint32_t pIntid =3D 0;
> >       uint64_t num_eventids;
> > -    uint32_t max_Intid;
> > +    uint32_t num_intids;
>
> Does this now need to be uint64_t, like num_eventids?

No, because GICD_TYPER_IDBITS is 0xf, so num_intids is 2^16
and still fits in a 32-bit integer.

thanks
-- PMM

