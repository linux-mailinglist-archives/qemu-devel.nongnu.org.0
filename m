Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7A4409E14
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 22:22:17 +0200 (CEST)
Received: from localhost ([::1]:39916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPsT2-0006MZ-7m
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 16:22:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPsQu-0004YY-Ho
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 16:20:04 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:41882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPsQn-0007Ut-CF
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 16:20:02 -0400
Received: by mail-wr1-x431.google.com with SMTP id w29so15793234wra.8
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 13:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m/0VgtjwM21yk2mifHlXRLcNHnMKxI1xatZkmhrATyg=;
 b=n1Mtqt0chjK3y6iWUFaL3LQSxwBJAuyftk+M4knZ5QblgrIqkGOTIMmlZMUYLvGJJS
 z0mzu/J7fOb3u7BXprQIVSuEW29TDDlil3gBXW5YB6P6nEzurvCTCFD2EFdXpLXA6z6j
 4iKV6A1z+Mfm5pi6cbD+DU0mmgSVpD+adfWLp6R1WF8K9A0XSGPoAa2D4grGNgwbg9e7
 SpCcxoziA+6Jw8R0RwYLy1CtkquTJu0rF8TZj5ym8d2f90YxyD2+nFKm6rDzzuP5w8tU
 1PzQtLyglNXeJNsN2PXCLjjnUxO82pFBcLcnDahXsZ58dJae+5BP7/47IWvddSP6fZn1
 4H6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m/0VgtjwM21yk2mifHlXRLcNHnMKxI1xatZkmhrATyg=;
 b=ELt+dvNDZWVvXkLdnDyXKyn5NwEIKF5TaJSglC6zCyayEWwa9ggGwCs0zXoQkA47XY
 8mwJPNrR11iJ4lcFWHoGwHGeaS5/sgTIC85ZcdBh8ogVwtDgVPrdUbuLMlvx/8FXqQ8Y
 ryI6ih+KTBd6X7TDMvbBwNMnfZafwMWQzSTBmQQCmGusnkL3B9YJx1LeB6XMY5yqQhZR
 Jqg3WHssMFJwVa4XCUcYwveywSOKUFoVVAWV8It6rF+L034y/8CcJlBQx455LdTaxYI5
 1TMDWzGRTdShqTLhLSdHSpwoyyCswOCEMbalI2LvLXJxwTG1KRsefBAyz57PdFNnymW4
 0Pww==
X-Gm-Message-State: AOAM5309ZSwf6dQxs21fPPZAw6eoubMxMgIg9BoCQk2B3KZ2k8LrEEll
 c2M/FBhB3DdrA+bObQHzLDQOZ7mEaVtwZqudCjc9Tg==
X-Google-Smtp-Source: ABdhPJxWb42Singig421aeWzHSl2ef3iLWFVMOUlrld2YaUObK9E4HckRomb0V24IfWoa7yiqaJfeous9TumUB55/3A=
X-Received: by 2002:adf:fd12:: with SMTP id e18mr10697888wrr.275.1631564395613; 
 Mon, 13 Sep 2021 13:19:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210913162758.3806730-1-clg@kaod.org>
 <1a8d9768-7763-91b6-5faa-8e984370adef@amsat.org>
 <CP2PR80MB3668E1FEBAC42ECE29175B94DAD99@CP2PR80MB3668.lamprd80.prod.outlook.com>
 <CP2PR80MB3668565CE360D6FB1E098461DAD99@CP2PR80MB3668.lamprd80.prod.outlook.com>
 <CP2PR80MB3668B15986C856C4BF48DFC9DAD99@CP2PR80MB3668.lamprd80.prod.outlook.com>
In-Reply-To: <CP2PR80MB3668B15986C856C4BF48DFC9DAD99@CP2PR80MB3668.lamprd80.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Sep 2021 21:19:04 +0100
Message-ID: <CAFEAcA-y2ruQTsDv-BqVunFzSiN-S=z54g0fqy4N1gFkBtWFAQ@mail.gmail.com>
Subject: Re: [PATCH] target/ppc: Fix 64-bit decrementer
To: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 13 Sept 2021 at 19:09, Luis Fernando Fujita Pires
<luis.pires@eldorado.org.br> wrote:
>
> > >     value = extract64(value, 0, nr_bits);
> > >     value = ((target_long)value << (64 - nr_bits)) >> (64 - nr_bits);
> >
> > Oops, sorry. 64 might not be correct here. It would depend on the target being
> > either 32 or 64.
>
> In fact, sextract already does the sign extension, so this should be all that's needed, right?
>     value = sextract<32,64>(value, 0, nr_bits);

Indeed, sextract64() is the preferred way to do a sign extension.

(The one thing to watch out for is that you mustn't try to
extract a zero-width field; it will assert if you do.
It also asserts if you specify a field whose start,length
would put either end to the left of bit 63 or the right of
bit 0, but that's less likely than the zero-width case.)

-- PMM

