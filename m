Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 959FD363211
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 21:49:49 +0200 (CEST)
Received: from localhost ([::1]:53650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXqwu-0007yp-Nk
	for lists+qemu-devel@lfdr.de; Sat, 17 Apr 2021 15:49:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXquT-0006Mh-F0
 for qemu-devel@nongnu.org; Sat, 17 Apr 2021 15:47:17 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:37432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXquR-0002kQ-Gh
 for qemu-devel@nongnu.org; Sat, 17 Apr 2021 15:47:17 -0400
Received: by mail-ej1-x634.google.com with SMTP id w3so47004332ejc.4
 for <qemu-devel@nongnu.org>; Sat, 17 Apr 2021 12:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a/matZ63spxyatcX29luFXmEu2YcgWEHnCxOBCfvZRw=;
 b=Xbtz6aDrItohZB5xBt3ifmJsXFsaqUTx8FXnMkxFrTVvrqEnRLPyUA2Bv5VCYC2WTU
 F9vyVne0JVYKGgVy0D1ftTZC3Kqhuk56i+PYYYLaCkbnhTUr03WubR7UV+Hk+czoXB3Z
 ilqXbBO46kxC6vhCwnWe81WV0mRBt3ScDILCQLeliWScjqAz03OLeSdqIIJmUlmb0MXM
 BE1tmtVwOt9oottZ/YUECLOYUBiPAXdv5BC/jelrZA/xoi7USbZKS6qL+8ucYKFnwjTH
 yovwf4ZnAQCT4rMdhom4/X/2kMPdBakAqdd4jF/B1EFBKD5poUuT6uZOFjEjIFFHbvNR
 cKAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a/matZ63spxyatcX29luFXmEu2YcgWEHnCxOBCfvZRw=;
 b=i72xgpF8DBgla8JoIRqGmeSTEsZyAwDzu6xzDLH5h1mddaSdxoNGm9Z+TEQ7ef8lWh
 2IvBfzKIURmxmYEET+yPOQzB8JXT/CqMI/QM/K5PfG5MJB/6nGZW5zHInHV1ThH5oqAH
 WHgXM2sbDQqVedrvm5Oxdmda9DKxYgIV4zjQUbAZ1TQdH0n/YD46LJE34kf4+Yl8ymSc
 DvkLAv4ogBXOYp8/a18i2wcP4e/wFTNWMaWaT1CgwfJSXbSS0w4p2EOjNm1JjsfVpof0
 x2T2v/IkC4wtTpWQDXF53LLkwODynOFGHPP+3fT5mcqOOLAoc3WJLLyjsesl+FmkgkcY
 NxRw==
X-Gm-Message-State: AOAM530mzZ0dMg1PDfPgBoRKLWEhf8NFnRLkzT8a7+YvyYk6lfRL2vOp
 +tQQyOGRiairCGHH/zv8Wv25pCO2YfvXiGyXxkpWDQ==
X-Google-Smtp-Source: ABdhPJwq4wNaBcCqmNlvNPjg7M04VMcMmZmdo/N5HtIT6jUIFe9oGqwDHDmYdD21bogal8RVXkgyomQ/EJVf1N26tqM=
X-Received: by 2002:a17:906:1dd3:: with SMTP id
 v19mr14252363ejh.4.1618688833938; 
 Sat, 17 Apr 2021 12:47:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA8=qEFgvUqGFdWLJ+1ePPv2Ybisomrs2o77PyiAZA2sXg@mail.gmail.com>
 <fef000db-6562-f41c-24c0-5fb0f8fb4dd3@redhat.com>
 <c63bbf7e-2230-44b2-7671-086c7dacd787@ilande.co.uk>
In-Reply-To: <c63bbf7e-2230-44b2-7671-086c7dacd787@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 17 Apr 2021 20:46:24 +0100
Message-ID: <CAFEAcA9Q7q5eoE+qBOY9LYQnnaccSfMux=fOzb3+BtRWjXm6gw@mail.gmail.com>
Subject: Re: any remaining for-6.0 issues?
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 14 Apr 2021 at 14:58, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> On 14/04/2021 13:48, Thomas Huth wrote:
> > I've seen some intermittend, non-reproducible crashes with usermode QEMU in some of
> > my CI runs, e.g.:
> >
> > https://gitlab.com/thuth/qemu/-/jobs/1178256498#L3876
> >
> > https://gitlab.com/thuth/qemu/-/jobs/1146276208#L3241
> >
> > This was only with ccache enabled, so I thought that it might be related to my
> > work-in-progress ccache patches...
> >
> > ... but now Cornelia reported that she has seen such a crash in one of her branches,
> > too (which is completely unrelated to my ccache patches):
> >
> > https://gitlab.com/cohuck/qemu/-/jobs/1178860927#L3867
> >
> > That makes me wonder whether we currently have a real problem with user-mode in the
> > master branch? Did anybody else see such problems?
>
> I've definitely seen the same issue as Cornelia in my Gitlab CI builds for the ESP
> security fixes (first version of which appeared just before rc0). The user builds
> always fail on "run-tcg-tests-s390x-linux-user" for me.

Do we have any better understanding yet of the cause here?
(I ask because I think we're going to need an rc4 for other reasons,
so if there's a ready-to-go fix then we could consider it.)

thanks
-- PMM

