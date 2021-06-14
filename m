Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8D83A6B11
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 17:56:42 +0200 (CEST)
Received: from localhost ([::1]:52338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsox7-0007YX-Ak
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 11:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsodR-0002Y8-AM
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:36:21 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:33538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsodO-0005v2-Cj
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:36:20 -0400
Received: by mail-ed1-x534.google.com with SMTP id f5so42094807eds.0
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 08:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=moWVcNArRP6tVLSHyi7dwt6Flwee5Rg+lZnW6D+iDzQ=;
 b=w7yWfzQmf1ignhTPQcbPIhRPeWh7xlbjujkU86bBH34ULgOSl04CefIk7MqHctC+7D
 sJ87zBPfs6TiJJyzSUqFyN474ulSi4QfVrEYRxWL7BP8i/rECrxAu2d5IMvgXhfdK/pS
 UAq4pR+O6pWy/JsKI/gyOpcHi2aTR8eeUAmAyApJKZehkJ7m9sLDiNq+ZLn2JUOUjwCV
 H33m192qSOoaMyapcKFpshrHfo168yh+cW5KTR30lLJ3oAl/kwTrJoabWyCv7LrjFbD7
 LRuO+pwgPgCTKcerDX/zhv87BNR36mW++imXzQZyu76PMBDm0g5P3kRv4neSqFQMRfki
 164g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=moWVcNArRP6tVLSHyi7dwt6Flwee5Rg+lZnW6D+iDzQ=;
 b=DGVPdyrl/HwhBmGooSluEZZYfAqfdjEIyCjr2NXF34G/czPYBNP+4r3fx2Gn/hd9M9
 pmG8IgvSa4O4Uzb6zhsC9kJJe6BrR/E+0ZAEo5GHAgn2Mkt0C1HgP+Bbp2oju9ZT/8ps
 L3+7HAtlYTKO8gGgqIogLbsO0fomHdp0eCPbRm4SxCrPBCWJH2eLFMdUgn22mhxDme4F
 LM4t2hPAnMMrxC79V3pV9PJLEF1ZdsWBgGwtmKy7pdVoVSxzqbtxPyQZRJ9CCftUO7SI
 ouE30NHslohalq+b6Ab1FzaOGKg3LtMzr6g0PkAcb/nGn5uC6pTIoB5ytPXyouChVJES
 di6A==
X-Gm-Message-State: AOAM532ekGkgbHKbSozanZ9qLimZylc3YsZFpEb6sRaWgp4Sz+cIiVQQ
 4mqaW4nccd42iGEhIqMc9oIMkOkLW1w/Ke1+cfAr7Q==
X-Google-Smtp-Source: ABdhPJxHLVDrF6rxbpHeTgqt9vT9eNxtdUDT6cmEkAXN9FKEB9fbT7QJZ5K10UNmM83sLzoCNgy4LDhljn+X1GBs46A=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr17521253edt.100.1623684976656; 
 Mon, 14 Jun 2021 08:36:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210610183500.54207-1-xypron.glpk@gmx.de>
 <87im2kzwj8.fsf@redhat.com>
In-Reply-To: <87im2kzwj8.fsf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Jun 2021 16:35:42 +0100
Message-ID: <CAFEAcA-MUzrnKe=UzYHuMi16XBiRrkFFLWxKMF+1T3QFy7tEMA@mail.gmail.com>
Subject: Re: [PATCH 1/1] hw: virt: consider hw_compat_6_0
To: Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Cc: Klaus Jensen <its@irrelevant.dk>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 11 Jun 2021 at 08:32, Cornelia Huck <cohuck@redhat.com> wrote:
>
> On Thu, Jun 10 2021, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>
> > virt-6.0 must consider hw_compat_6_0.
> >
> > Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> > ---
> >  hw/arm/virt.c | 2 ++
> >  1 file changed, 2 insertions(+)
>
> Oops, forgot that hunk.
>
> Fixes: da7e13c00b59 ("hw: add compat machines for 6.1")
>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>



Applied to target-arm.next, thanks.

-- PMM

