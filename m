Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA733BBD27
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 14:54:19 +0200 (CEST)
Received: from localhost ([::1]:40082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0O78-00058L-IS
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 08:54:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0O5W-0004FD-Nr
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 08:52:38 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:34324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0O5T-0003nP-K0
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 08:52:38 -0400
Received: by mail-ej1-x62e.google.com with SMTP id hr1so25526087ejc.1
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 05:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=c3tuPW0iroCcvdEpnLxUhIK4ZjdpYeLoUydL17RsFRU=;
 b=ZDzak6+o5WsMknIe2MIRBoSFiI60qKObIlqdfvY+vD/PtNWywcpd+I43YqJifbHMvi
 zmagslU+inw2jreVjZmQ2ViaiQcpagJInwM8BP+HLcU7ryUhjm/erFAgXlAceYtoRgpA
 6Qa3tpSuajOL6Ylk5W0B8DHJ8nyoAk6VlAhirkOlVSkXt89Y6t8PvNaa+VJPeleewitA
 twXlhYapn6lbIK30NwqZDZ9FMqNClt7BOcdJcnivNcKABIvdrGgsgdbYMkLW0B2ozPHX
 repZ+scCu+nzqRNsjOYrIuh4qRN/lGB5BjJpD54zZURJosmplNwE5QHxQmCdtWuaTbkX
 Accg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=c3tuPW0iroCcvdEpnLxUhIK4ZjdpYeLoUydL17RsFRU=;
 b=PHnkYoYQDZSEDz36ldT4RLgzXb17P2LobrcEB1I87IFzWPNssX2QIXF0gIRZEz92r7
 DUmAd0Dnb4WHKZsPziCyw0KCDigK2EuOlZrFo21eAi0VZagswzzmoNAdCB4nqZgAfNTS
 lArydioDiqdxz3QcmVuAe1w1MpOKQRTKuzaLZXk57fH9Pn1k4xHkZ2jxEPJn+o+Zw69Q
 tv9LHJddnsmeOTQI58FGdUE6WFbBE99jVd3P950yRNfW+axaEisvQ+NH6/goCpZN18yV
 fInipGpJcC8QhedCw05XdBpC1UKbpFhpe/B/8Mp1+TMdDhNEY2MHMNgJ1AtnT2CkgRVo
 XxxQ==
X-Gm-Message-State: AOAM532ccpYhNSLd2DfChHGERYySzQSeSAzFlhRPzSrnE0ogzZTGcLy+
 qXjKi1QsogE4TMKn/pIb95hT3Q9zx7mCZdzkkzfKBQ==
X-Google-Smtp-Source: ABdhPJygNZxdlTGjc9wqhiEWA1A4yM4dsBwEj5vC1zFnlNTqidijOtlPjj/vXiIBc/elLZm+3+VpvmETFI2v30YmZGw=
X-Received: by 2002:a17:907:3e02:: with SMTP id
 hp2mr13116169ejc.4.1625489553650; 
 Mon, 05 Jul 2021 05:52:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210629082713.31396-1-hnick@vmware.com>
 <CAFEAcA-vSoriA2iCwyvBWofj1UvtMuRbEnqNuCsoG_hz1Yth_g@mail.gmail.com>
 <35FFA736-504A-482B-B78C-17F7381C7D70@vmware.com>
 <CAFEAcA-AvYq5ujspY1bxqjzX=1EYP4zY0ortFdNhJwPU+pDJGA@mail.gmail.com>
 <79AC0C26-90CF-4F13-9480-ADD9D55E7408@vmware.com>
In-Reply-To: <79AC0C26-90CF-4F13-9480-ADD9D55E7408@vmware.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Jul 2021 13:51:55 +0100
Message-ID: <CAFEAcA-TA_5aLe009SXiqoqGUYthrF1UC1nj05jz63HkJ3Cufg@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Correct the encoding of MDCCSR_EL0
To: Nick Hudson <hnick@vmware.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Mohannad Ismail <imohannad@vmware.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2 Jul 2021 at 16:01, Nick Hudson <hnick@vmware.com> wrote:
> Maybe I=E2=80=99m misreading the ARM ARM and the qemu use of mdscr_el1, b=
ut I think
> this is good enough / more correct.  I=E2=80=99m somewhat confused by AA6=
4 MDSCR_EL1
> vs DBGSCRint vs DBGSCRext, however.

Yeah, it is confusing and we generally haven't modeled this very
well, because we've kind of only cared when guests don't work and
some of the purpose of these registers is for external debug
which we don't model at all.

Looking more closely at the Arm ARM:
 * MDSCR_EL1 is the AArch64 register
 * DBGDSCRext is the AArch32 version of that
We model these basically correctly, I think
 * MDCCSR_EL0 is supposed to be an AArch64 read-only register which
has bits [30:29] of EDSCR (ie the JTAG-debugger-view of the TX/RX
connection)
 * DBGDSCRint is similar for AArch32, but it also has various
bits that are read-only views of bits in DBGDSCRext/MDSCR_EL1

Bits [30:29] of MDSCR_EL1 are sort-of-but-not-quite the same
bits as EDSCR [30:29], but they're close enough for our purposes.

>     /* MDCCSR_EL0[30:29] map to DBGDSCRint[30:29]. Simply RAZ.

(QEMU coding style requires "/*" on a line of its own.)

>      * We don't implement the configurable EL0 access.
>      */
>     { .name =3D "MDCCSR_EL0", .state =3D ARM_CP_STATE_AA64,
>       .cp =3D 14, .opc0 =3D 2, .opc1 =3D 3, .crn =3D 0, .crm =3D 1, .opc2=
 =3D 0,
>       .type =3D ARM_CP_CONST, .resetvalue =3D 0 },

This seems reasonable; we don't implement the external debug
Debug Communication Channel so we might as well model
RXfull/TXfull as 0. It might be nice to mention in the comment
that the reason we RAZ is because we don't implement the DCC.

>     /* DBGDSCRint[15,12,5:2] map to MDSCR_EL1[15,12,5:2] */
>     { .name =3D "DBGDSCRint", .state =3D ARM_CP_STATE_AA32,
>       .cp =3D 14, .opc0 =3D 2, .opc1 =3D 0, .crn =3D 0, .crm =3D 1, .opc2=
 =3D 0,
>       .type =3D ARM_CP_ALIAS,
>       .access =3D PL1_R, .accessfn =3D access_tda,
>       .fieldoffset =3D offsetof(CPUARMState, cp15.mdscr_el1), },

Here we're taking advantage of the fact tha MDSCR_EL1[30:29] are
close enough that we can get away with using those. It's not
consistent with how we modelled MDCCSR_EL0's version of those
flags but it's unlikely any guest code will care.

> Please let me know if you want me to submit a new patch.

Yes, please do.

thanks
-- PMM

