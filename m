Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C935F67CA
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 15:24:14 +0200 (CEST)
Received: from localhost ([::1]:55926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogQrF-00066z-Rt
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 09:24:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogQbu-0007Cd-Nz
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 09:08:37 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:55045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogQbq-0000GY-If
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 09:08:21 -0400
Received: by mail-pj1-x102d.google.com with SMTP id 70so1693644pjo.4
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 06:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2I99ksWFeoPKPyLJ3JmpEldStn68qCYKtSieEF5FCyU=;
 b=NPcrlabuO/HadxG8ISpu/B99RlWt6vE3WPilombiyJHnB6h+wQEJX35E+gdLkNalC8
 CqolnaOQ2Xn7xIXYGhgeNcdrwHO1c3N358atl0iiTQBb5IWbqK35HJh4wqQpSV9RVB9/
 XDEOQX7MuiU5JtGjpydo4X3KhugiLEwETdYinvN1IyQSCszC1Ypj5usGsoCPwf274tRu
 SdKeYtQCaetd/HFTQx6eT2OQsMjTy2mQK7dvTpHLoOfdJCMiVvX2vJmTB4m1loOAmpq1
 eT7Ej7ZaX9JHrI/bnjWIOkHddkxvuH1AFgXBiw6Bp8LHDHPTJZsp5ETiRFPwoOsQM6+4
 wk7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2I99ksWFeoPKPyLJ3JmpEldStn68qCYKtSieEF5FCyU=;
 b=ncuBGtJjYIc9UQ8gOQBt0XTXe/k7lG09lHXj3HDuLjBD/PcOlsSZB3nEpvZj3rqBxq
 u6wQqHgpUo+qxnz8U5axmGljVM4Z+iqVcb1vsH8PLopYzfl+Wn/z5Nzt4Mbo0+0Q7bHl
 dAPjiEWZjUTmkCfUo4596dXHveUMi2e7rryRUK58D0WB1vh9HX0CWCFC85vLgaQSOJhl
 QolXGRgwC6IWPSU38riOb8gGGCXTSiElp9XS0gKuw5bESAZM10ghBDYhzjs+d7c6fOX7
 seht+4xvoqJZGczXYUxUoMgqfSdVgvZS5z25a5fB50J9TkpgzoAfBvew+9rk6aUq8GSu
 oOwA==
X-Gm-Message-State: ACrzQf1q2zvRPN3ZQY8IYczDfe/yrdMGgV7LFs6yW9+3+AsxzBXrzVwo
 OCI+RUR2k+dbjU+9X/FRjYY93v5/4xL+lUWpTHupuw==
X-Google-Smtp-Source: AMsMyM6kEGwsuEZ74knWNJoB6KUGzm+whRpsilCA3fkrnYoy4zp69b61Sf9h9gD7jsUvJTh2larvJGn3EOhW6edqmqk=
X-Received: by 2002:a17:902:7c97:b0:17f:5abf:9450 with SMTP id
 y23-20020a1709027c9700b0017f5abf9450mr4667809pll.19.1665061697030; Thu, 06
 Oct 2022 06:08:17 -0700 (PDT)
MIME-Version: 1.0
References: <20221004050042.22681-1-joel@jms.id.au>
 <f98d71c2-994d-28d5-b5e0-52913cc656df@amsat.org>
In-Reply-To: <f98d71c2-994d-28d5-b5e0-52913cc656df@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Oct 2022 14:08:05 +0100
Message-ID: <CAFEAcA9d6TyPMWownfBmawo+Ox6d3y2FbBn0=OPFZvu5ghxdgg@mail.gmail.com>
Subject: Re: [PATCH] docs/nuvoton: Update URL for images
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Joel Stanley <joel@jms.id.au>, Havard Skinnemoen <hskinnemoen@google.com>, 
 Tyrone Ting <kfting@nuvoton.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_PDS_OTHER_BAD_TLD=0.01 autolearn=unavailable autolearn_force=no
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

On Thu, 6 Oct 2022 at 12:29, Philippe Mathieu-Daud=C3=A9 via
<qemu-arm@nongnu.org> wrote:
>
> On 4/10/22 07:00, Joel Stanley wrote:
> > openpower.xyz was retired some time ago. The OpenBMC Jenkins is where
> > images can be found these days.
> >
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > ---
> >   docs/system/arm/nuvoton.rst | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>



Applied to target-arm.next, thanks.

-- PMM

