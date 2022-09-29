Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E895EF6B6
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 15:35:18 +0200 (CEST)
Received: from localhost ([::1]:44058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odth6-0000ft-Cx
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 09:35:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ods1t-00084K-4n
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:48:39 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:36590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ods1p-0002Ej-W8
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:48:36 -0400
Received: by mail-ej1-x633.google.com with SMTP id 13so2251202ejn.3
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=fMBWKQnKlque+yg1iP5gYIddEr5TT78g0MXvgWDdVGI=;
 b=DFsOqgn/nywVLj5TyU8m2EjpzkxwD8kvGHoOQscZMj9zFy5KdF563kSFGCOjYce/H4
 J1wTXiJRM+A7/xYHT/ZKpXSR1eVRW/JSShJr6kq4g7iMfFkEAbQBbCRKIIuCBO4yssNr
 tlsvKtamtbhvQVvTF7yT3nDiCNBDUpG8IvGjdfrLBgXN8dGU8ZIzpCBGNjBasEBVpROh
 r+MuJoX6CEyQV4TV/0AEclQ6wZ05PVXSO4lNYQPMpKVJ6fopxLHQ8CznSj3WmKh7Zpfv
 nOy7j0Y1V2mpAvJrq4GfQplg+xUTdQRme68q/pQoclctGdm9rTAc7vviDDlaYijY3/Qi
 dYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=fMBWKQnKlque+yg1iP5gYIddEr5TT78g0MXvgWDdVGI=;
 b=WNjNMq0BdB3W7BB6pCq7a4IzUxI+UIYxarL/lQIi8TYCSDbrcQaQPqgvb7qws5JuPv
 Vif7W1s+rsULPQ798nLEzPSxoTv07RVYIlIHUAiI85VNXCXmxJfjLnYJzqTQwzqQxsv3
 3yRQf3Y/ZaXv6lcE7X7NFbpc+zEdiby0eZQfEQMv6bWt2hqKNVwznrYsuraZhCNs42AH
 g2fzbRxPBMqHOl8fjeGSQf/BXMzVxX/5tDvbEWWw+1gYq395SBuKo23Dy3skWAo1fC5g
 vRo+iK+bb0kSp7cwq7Msl0tya9PmWYPfCy9Nuu2l50R4HPATidFcCFbhwpG4J6TrW+rx
 ORyA==
X-Gm-Message-State: ACrzQf1v684tae7LzERfr0GVympJ4AUkNqcXUBWP2JHA5tY8BWr69k2X
 4sQX8B2jEMut1FdPWpGAF90BolJVzvLUn5G3Ggu79A==
X-Google-Smtp-Source: AMsMyM6kAZir3OBg+WZpMyiWFLsMI2GzfY9hCAJxLrjrrFP2j9uVBi6SkOPuYPSF9Q3jOtx6PZ1WDLi8DTNkMX7W/+Q=
X-Received: by 2002:a17:906:730d:b0:782:a4e0:bb54 with SMTP id
 di13-20020a170906730d00b00782a4e0bb54mr2492516ejc.659.1664452111602; Thu, 29
 Sep 2022 04:48:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220928164719.655586-1-clg@kaod.org>
 <20220928164719.655586-2-clg@kaod.org>
 <CACPK8XeiadO=ACQdpFmvy5cAGe0C_LzC3ZPjPVMs_22bUDTcFg@mail.gmail.com>
 <f3d289d5-16db-7d68-0ae0-b2003190b06d@kaod.org>
In-Reply-To: <f3d289d5-16db-7d68-0ae0-b2003190b06d@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Sep 2022 12:48:20 +0100
Message-ID: <CAFEAcA9RhqzHjUb6OSLxuzyVvUQjsVCVvzN5fEwhi_haOcsgDA@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/arm: Disable VFPv4-D32 when NEON is not
 available
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 29 Sept 2022 at 08:20, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 9/29/22 01:00, Joel Stanley wrote:
> > On Wed, 28 Sept 2022 at 16:47, C=C3=A9dric Le Goater <clg@kaod.org> wro=
te:
> >> @@ -1684,6 +1684,10 @@ static void arm_cpu_realizefn(DeviceState *dev,=
 Error **errp)
> >>           cpu->isar.id_isar6 =3D u;
> >>
> >>           if (!arm_feature(env, ARM_FEATURE_M)) {
> >
> > Can you explain why the test is put behind the !ARM_FEATURE_M check?
>
> Do you mean the setting of MVFR0 ?
>
> because it was close to the code clearing the SIMD bits (NEON)
> of MVFR1 and it seemed more in sync with the specs :
>
>     "When FPU option is selected without NEON, the FPU is VFPv4-D16 and
>      uses 16 double-precision registers. When the FPU is implemented with
>      NEON, the FPU is VFPv4-D32 and uses 32 double-precision registers.
>      This register bank is shared with NEON."
>
> (That said, M processors don't have NEON, so this part of the code
> should never be reached )

They don't have Neon, but that means that cpu->has_neon is
false, so this part of the code *will* be reached. The reason
this sub-part of the "disable Neon" handling is inside
a not-M check is because M-profile has a different assignment
for some of the MVFR1 fields (check the comments in the FIELD
definitions in cpu.h), and zeroing things out based on the
A-profile meanings would be wrong.

thanks
-- PMM

