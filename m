Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0F550B921
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 15:51:39 +0200 (CEST)
Received: from localhost ([::1]:40436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhthC-0002yC-IL
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 09:51:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhte3-0008J3-LO
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 09:48:23 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:33462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhte1-0004l3-Rq
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 09:48:23 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2eba37104a2so86304117b3.0
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 06:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kX7GJmQ3nEWcJUhSZYxzoVQ8EuLB+TTRe7yKyXaNljY=;
 b=Mf9St/dUczfNXslZbsxJ5CKHVgB2cq5RLsLLnVBDpS11+TYzmYYxNPgiiyU12Y+S7I
 z4V5yGd1c6VcunErdD+pVrVYOpQ4f9NA3Ih+8mNzIzqhLmCUH1JlgOJJXFEfPppKOwUi
 eBAAr3aHS2vJlAyLGyvzlavVzj3Wp5GykUs43sl4KRXM1nWC3ZiCwogyyC+iBIgWfRzr
 odk5TYnuH1R38u30xjlOAyDwVOJC+oyl1kXfl+0WcrwYf2hV84eG5KKfoSXuoyac+osL
 FqLG6hWEGxaUqzELW7tVNaNr634DYgOnrM86N4BFndVGGKaAicWyEOV95Itnl8YZrFc+
 30Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kX7GJmQ3nEWcJUhSZYxzoVQ8EuLB+TTRe7yKyXaNljY=;
 b=IgV7n5VVvjclTBBWzHElCLMpI3a6Q+zaISFiaoImrpU4/jZlfdf8FmNcnC0Z9aM8wt
 jbclZupoVIsOwQqMNKqJflBxB+Yodm3eCO6p2XCDvbozNDv4bXd8Ivrv+ESGUSJPKwvr
 7BPS2V3arYBQ7pWDac6RZ+yKvJw2F18gJ34aV8Rrioa+/9dVKBBu81qUMO31o9iOwhmt
 kahV52DSSPNJT/bPeMn21ilsMUuJ62a/bcDGw7mX+9/b//GG+3pLav+jAPkUjjc+HLFt
 uimGvsX506DS8SOrC0y47ZHTMgTXvTLSnaYWwNhEnsHjzD2TiKaBvEUgZFQym3NJCGvl
 rK/Q==
X-Gm-Message-State: AOAM531X7DVmxwOucv2/dJAdUPSl2d+YPbeDvjbz4BMb8EB0bZHY4ljz
 lIxSg6oti7WES7ZH/HcEO6bJX+K1PShlPHFK58lOuA==
X-Google-Smtp-Source: ABdhPJxpiFFWU5fwZU1rxwW1d1oKwGq86wPbx5evJ4HBG9h1AeyIUZjSSgh1TFkzYLIMJ1I2Q+hdSdd4ELXOZLSm9kY=
X-Received: by 2002:a81:4e11:0:b0:2f1:47a0:5972 with SMTP id
 c17-20020a814e11000000b002f147a05972mr5049812ywb.469.1650635300874; Fri, 22
 Apr 2022 06:48:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
 <0e8c4014-2bbe-61b0-542c-bd03762c5db0@linaro.org>
In-Reply-To: <0e8c4014-2bbe-61b0-542c-bd03762c5db0@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 14:48:09 +0100
Message-ID: <CAFEAcA8--fmvRXZ74Dr=-whLw6X9=AqfqjXBZV2GDWhdn4V58A@mail.gmail.com>
Subject: Re: [PULL 00/61] target-arm queue
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 22 Apr 2022 at 12:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/22/22 03:03, Peter Maydell wrote:
> > This pullreq is (1) my GICv4 patches (2) most of the first third of RTH=
's
> > cleanup patchset (3) one patch fixing an smmuv3 bug...

> Fails cross-arm64-system:
>
> ../hw/intc/arm_gicv3_its_kvm.c: In function =E2=80=98kvm_arm_its_realize=
=E2=80=99:
> ../hw/intc/arm_gicv3_its_kvm.c:109:5: error: implicit declaration of func=
tion
> =E2=80=98gicv3_add_its=E2=80=99 [-Werror=3Dimplicit-function-declaration]
>    109 |     gicv3_add_its(s->gicv3, dev);
>        |     ^~~~~~~~~~~~~
> ../hw/intc/arm_gicv3_its_kvm.c:109:5: error: nested extern declaration of=
 =E2=80=98gicv3_add_its=E2=80=99
> [-Werror=3Dnested-externs]
> cc1: all warnings being treated as errors

Oops. Just sent a v2 that fixes that.

-- PMM

