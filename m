Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D59931A04D
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 15:07:57 +0100 (CET)
Received: from localhost ([::1]:53556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAZ6y-0001C4-Ew
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 09:07:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAZ3G-0007sI-F7
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 09:04:06 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:33981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAZ3D-0002ZR-EF
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 09:04:06 -0500
Received: by mail-ed1-x52d.google.com with SMTP id df22so11002800edb.1
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 06:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fF2W9d5LCIknpBvbcOHR3rE5jcx8+dqxytYCzruss0c=;
 b=dDhsn7zwR07rShUkifY0jCaVqUEgnUwNXN2puZJzDfXWNRPpiQDBVU4DQNvX3KfoPe
 YuYySITX3bI1HUp3O8JasOBzxErDQsUixK73Bn9ecVsJoI8gMr2pZwts4ElmJpgZukI2
 B79VvJZnd5lPAuewzhbHHookBncoXbVD33FhUpNmWDhSjWFgt+ySrRUZ6SD/vlNLzlEe
 ulsglcxEaYIGLOxK2qF8XTkszpa0LNgVZyGxCLp1odkRQUOeXcu1L5xbG5Kr4ia2FrkR
 ciJF3xxUhvEFYp9wje5jyyoBZQSJJQUiNUNpjMkj81ohc4/k8gOOx6sPGwE5bDXaQTkg
 6NRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fF2W9d5LCIknpBvbcOHR3rE5jcx8+dqxytYCzruss0c=;
 b=puqKGF1coPaqKU9j3e6DzNiJSJT4EfoSnVwAHAPXDoh2lhwL7XVNGCQen2TWpy0zYm
 o2+LWNGoYcqZn5hBDbWILw4Y3F8rBzRYngZqIadnno3Zl5aVPi/E84DFigViQW8Z6Ary
 fQ8vB9d35ROq1M+0uHhBGRAYTX0yCmZxQj+J8ZI5sXm46dBx9d3bcyQhH5AlHuv3SN/u
 fzLEDe2mPlI42Vl9NET/CbUBXf7IXNVV0GmrO3frSrkch55FvSeD7qYRZeyG7do2jZWQ
 x1uSsiP1ypv8Ho/dH2e7RwCjOtCVHGcaZB4lcLwZ6svcs1t9vl9JnTELJX1k0T/3rFyR
 TGBQ==
X-Gm-Message-State: AOAM532IyLTwpH2CKfrb7yv56PX6Ehdfw34/h/W36ZmFEzWZa+xGU/TR
 GKz+GsYwRsKEFnuVdF/HkJRgL9A0C6yAyNkK0+XXOw==
X-Google-Smtp-Source: ABdhPJyTc6EtYOh5UKCuSiOKoOnmapRo7pKhEu8RsUF/aJ0A/U99u9Z84BleBYxrn4sWhynWGDkaavB2G7JG68hPctY=
X-Received: by 2002:a50:e80d:: with SMTP id e13mr3451195edn.251.1613138641806; 
 Fri, 12 Feb 2021 06:04:01 -0800 (PST)
MIME-Version: 1.0
References: <20210205170019.25319-1-peter.maydell@linaro.org>
 <20210205170019.25319-7-peter.maydell@linaro.org>
 <CAFEAcA-YqMQATkQXFZHQNy0-JeO2cFvmuHdnhF1+TWAHgf+tcQ@mail.gmail.com>
 <c4d9df9a-21f5-524e-abfa-dea2ea1ec16f@amsat.org>
In-Reply-To: <c4d9df9a-21f5-524e-abfa-dea2ea1ec16f@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Feb 2021 14:03:49 +0000
Message-ID: <CAFEAcA8YFX+F6LwLAzQh1r=hAzn62h2xxv4FjfNdyn6hgwiH=w@mail.gmail.com>
Subject: Re: [PATCH 06/24] hw/misc/mps2-fpgaio: Support SWITCH register
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 12 Feb 2021 at 13:51, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> On 2/12/21 2:45 PM, Peter Maydell wrote:
> > On Fri, 5 Feb 2021 at 17:00, Peter Maydell <peter.maydell@linaro.org> w=
rote:
> >>
> >> MPS3 boards have an extra SWITCH register in the FPGAIO block which
> >> reports the value of some switches.  Implement this, governed by a
> >> property the board code can use to specify whether whether it exists.
> >>
> >> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> >> ---
> >>  include/hw/misc/mps2-fpgaio.h |  1 +
> >>  hw/misc/mps2-fpgaio.c         | 10 ++++++++++
> >>  2 files changed, 11 insertions(+)
> >
> > I changed my mind about the property/struct field name here, I think
> > "has" is what we tend to use rather than "have". Trivial change
> > to squash into this patch:
>
> What about "use-switches"?
>
> use-x: 12 occurences
> has-x: 9.
>
> Is there a difference in the meaning? Maybe have refers to
> something internal, while use to something external?

Generally 'has' (or 'have') means "configure the object to
possess this thing", whereas "use" means "the object has
this thing; configure it to actually make use of it".

thanks
-- PMM

