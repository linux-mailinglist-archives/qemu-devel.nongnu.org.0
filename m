Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF7B5752A1
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 18:18:00 +0200 (CEST)
Received: from localhost ([::1]:38742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC1XL-0000wu-4f
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 12:17:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oC1Aa-0004hy-1c
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 11:54:28 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:43806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oC1AY-0001l2-Ez
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 11:54:27 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-3137316bb69so21350287b3.10
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 08:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KIisrw0Q2DijfpgQJsqGHa+BUkO+E1GkxFp9N//JJIo=;
 b=BSXYsx5Mw/LWb0lNv1vYQ33s7fnSpvAg/zJ2YlvjGnu6HHP/QnHOjSUSXYhO6Jf7ZS
 CMW78og4jsTIeVfn4i7RTi1AmJy4vts8Bwv9Qy4Nw/1melyEyG0E9giztBAcVb7euGkY
 /fDm7QGTYCt2i+wIKnPv2vndO39I9Q8N9XTnHFWXAyiHJoGrj8LacSZztXxoLk66TOFD
 LDiaDjsAoFb6wpyTUDJ2HAxqNRxsWXM7pDyFVJ5hCutM4Ncr/obSJUDdv2oRQ6zZ/Snv
 x6ZyWhpyY5PCfNiVBlDjk9cdxhE/RzY58JTRFelkerNd80fhUYnQtDZGrtOduV9/bRBB
 NmHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KIisrw0Q2DijfpgQJsqGHa+BUkO+E1GkxFp9N//JJIo=;
 b=65R5tas/GXJ7FgHk9lo2ZT+Q/ugENu+B0C3kqPg/+XnCehvZaUveKxjdH8mUJDlQOo
 BePne3VTVhow8Zzgqr1tdJZKYPIIdzTQiIOVOn03VOEb/Odf+MMCDuEpUC1naChrgic9
 H/8nFdms/TUm7y2B13nAB1gXY6mY9CskQ6PA35Puw3hpEEj6eX65nMoMU1kqS5wFOoOD
 QqXswIk3hYesYJx2iDQB9nlPvSqDoDWyh/amlBFa6hgaqIgs8ekxrAMx6VRkk7Tx65jb
 rNCg37P1pG8E0Zuh89RPG3jpynP0mg8pq4mojsgEfEAEWx6N40dZiaAEyoQlldGRRIyy
 HXTw==
X-Gm-Message-State: AJIora8rAPX0n20zeOjwT8nbPxdcDVbfiysHjAPvu1fenIn5LAzhud1P
 fPS+IeePa8MYPN03nceM0wW1ZFhEmetEMPVkOZZ/cGuit9M=
X-Google-Smtp-Source: AGRyM1u80+HKlid3WrC205iZPFmQp2kptTywfjJ3VuVodXhUWPxZaVYRKBGsulRnBhce76Ltt5FQCZ4M6WVQFTo8h6k=
X-Received: by 2002:a81:8d08:0:b0:317:a4cd:d65d with SMTP id
 d8-20020a818d08000000b00317a4cdd65dmr10320248ywg.329.1657814065282; Thu, 14
 Jul 2022 08:54:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220714145355.7225-1-quic_trohmel@quicinc.com>
 <20220714145355.7225-12-quic_trohmel@quicinc.com>
In-Reply-To: <20220714145355.7225-12-quic_trohmel@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Jul 2022 16:53:46 +0100
Message-ID: <CAFEAcA-VBzBusEyM51atHf4kV3pmiNWV6rdUDGbmmyq=w+hA+Q@mail.gmail.com>
Subject: Re: [PATCH 11/11] hw/arm: Add R52 machine
To: Tobias Roehmel <quic_trohmel@quicinc.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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

On Thu, 14 Jul 2022 at 15:54, Tobias Roehmel <quic_trohmel@quicinc.com> wro=
te:
>
> From: Tobias R=C3=B6hmel <quic_trohmel@quicinc.com>
>
> Signed-off-by: Tobias R=C3=B6hmel <quic_trohmel@quicinc.com>
> ---
>  configs/devices/arm-softmmu/default.mak |   1 +
>  hw/arm/Kconfig                          |   5 +
>  hw/arm/meson.build                      |   1 +
>  hw/arm/r52_machine.c                    | 133 +++++++++++++++
>  hw/arm/r52_virt.c                       | 217 ++++++++++++++++++++++++
>  include/hw/arm/r52_virt.h               |  61 +++++++

This needs justification about whether it's the right thing to do.
What's the purpose of the new machine? Would it be better as
part of the existing "virt" board? Is there a real physical
Cortex-R52 based machine that it would make more sense to model?
If we do need a new virtual R-profile board, should it really
be R52-specific?

I am generally not a fan of creating new entirely-QEMU-specific
machines if we can avoid it.

thanks
-- PMM

