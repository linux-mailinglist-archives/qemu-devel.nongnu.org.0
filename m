Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EC46FC601
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 14:12:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwMCf-0007g6-8R; Tue, 09 May 2023 08:12:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwMCc-0007fm-QO
 for qemu-devel@nongnu.org; Tue, 09 May 2023 08:12:22 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwMCa-00007U-Sx
 for qemu-devel@nongnu.org; Tue, 09 May 2023 08:12:22 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-50bc075d6b2so10973627a12.0
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 05:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683634337; x=1686226337;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SoinHz6iMwjXA3ffGSWaQONYfahVOdpHtjkPj73402Y=;
 b=zpZ81hiq3j3RKKgMY/xYC/pM26SqCtgLvwh3d3hadsNFbeNytiVurVGdhelh5vf7Vk
 2jbF/yTntCgnAJssV+JtXF4anwqQYOPzb4QG9KLizL0MJ988xhVZFM0HWDolXoA+06MN
 ZNX0bwAGS4/PZw8tt6uuG086fUHUdy87RtTYbRxYIj0pnnRdgmTBs58Y1NoLhtxm7aeh
 h/OvshLw+kGJA6HwOUWsHOWA/6N0A/pIbaaUjM9dkzydD34gameLM34ijEroToJO+Mxt
 DHrCc2Si7Ozg+Zl7rLEk9tbORhDZ6ShguDqWR+ObAbsZWocc2ePh01xEHvfU4QQAvRni
 +1DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683634337; x=1686226337;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SoinHz6iMwjXA3ffGSWaQONYfahVOdpHtjkPj73402Y=;
 b=TqmMkYmx3paQl/XFHQZ25EwWns1R74FbsqLz99AJFsxqGuDEmSWQY8TkQuVP0lmKSd
 rP2mQIaxh9a0ETI6lhqa5g5k0Gg79eth/Gna8qKjtGpyvULULX/cm8u8thZTLRivrQuj
 CHZj1m5LoZHh/HAVVgf1Crweoz8pqwmGZC91HaHA+bc1P/r94CiOallfYwb524RSuZ/s
 lmkWDrsfBqIM2DkhIVidVxWM0Srrn/kQPg13y4I24AcUZWwcaCWkVv+b3xI6j0nwyLkq
 0fxA3/AszLkzRWA96IiNIpeUFcIMdWdph7SCVgpsHS7gHyR3yQfNAI6BFzbgLQ3h85wg
 PBRQ==
X-Gm-Message-State: AC+VfDx7n6lJ0aYxivorM3WX1cO+GagTIeM/0pknb4qvwETc5oNtd+1G
 knJGIsgYK4Dd3Tqdds7wwZn/qZHH8FO7wH3qsIWnEQ==
X-Google-Smtp-Source: ACHHUZ4DI7eLnQow5PrFCSNW53n7ZaVoxx8JgxjRHc5GNXqu5QcXQVOlxHyhxiTT5Oley0HWMkH+q7mtg7aXTJ1z7Ws=
X-Received: by 2002:aa7:cf92:0:b0:50b:c3a3:be7c with SMTP id
 z18-20020aa7cf92000000b0050bc3a3be7cmr9828039edx.30.1683634337613; Tue, 09
 May 2023 05:12:17 -0700 (PDT)
MIME-Version: 1.0
References: <11bf324.342.187b3418349.Coremail.wangyuquan1236@phytium.com.cn>
 <CAFEAcA9pa+uHGk34uCGX1ZHiCBDeDHXFLDFyVDAVvDxQScEChg@mail.gmail.com>
 <70009a13.15f.187bc308951.Coremail.wangyuquan1236@phytium.com.cn>
In-Reply-To: <70009a13.15f.187bc308951.Coremail.wangyuquan1236@phytium.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 May 2023 13:12:06 +0100
Message-ID: <CAFEAcA-jZBiSL8vNzgcwUT2Lqtgf9JyyaQx7kD4j=Tc9neD_OQ@mail.gmail.com>
Subject: Re: Re: Problem of initialization of platform-ehci-usb in sbsa-ref
To: Yuquan Wang <wangyuquan1236@phytium.com.cn>
Cc: qemu-arm@nongnu.org, rad@semihalf.com, quic_llindhol@quicinc.com, 
 Gerd Hoffmann <kraxel@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 26 Apr 2023 at 07:11, Yuquan Wang <wangyuquan1236@phytium.com.cn> w=
rote:
>
> > On 2023-04-25 16:34:04, Peter Maydell replied:
> >
> > On Mon, 24 Apr 2023 at 13:33, =E7=8E=8B=E5=AE=87=E6=B3=89 <wangyuquan12=
36@phytium.com.cn> wrote:
> > > As a junior OS engineer, I met a problem of initialization of platfor=
m-ehci-usb in sbsa-ref recently.
> > >
> > > The result of sbsa-acs(UEFI Shell application) on sbsa-ref shows that=
 "Peripheral: Num of USB controllers: 0".
> > >
> > > And I found that the platform-ehci-usb in qemu is a 32-bits DMA devic=
e while our sbsa-ref machine does not own
> > >
> > > DRAM memory below 4G. It seems like a contradiction point.
> >
> > This definitely doesn't seem like an intentional thing.
> > What specifically do you mean by "32-bits DMA device" ?
> > Is our implementation of this device accidentally not
> > handling addresses above 4GB? Or is the specification of
> > the device itself limited to 4GB addresses? Or is this a
> > guest driver problem?

> Maybe the specific explanation is that qemu implements that:
> In hw/usb/hcd-ehci.c:
> void usb_ehci_init(EHCIState *s, DeviceState *dev)
> {
> ...
> "s->caps[0x08] =3D 0x80;"
>
> According to EHCI spec version 1.0 Section 2.2.4,
> the set of "0x80" on Host Controller Capability Parameters
> Register means this(qemu) EHCI Host Controller does not have
> 64-bit Addressing Capability.

Ah, I see; thanks for providing the reference to the spec
and the source code.

Gerd, is there a particular reason our EHCI controller only
claims to be able to do 32-bit DMA ? Should we give it a QOM
property so boards that only have RAM above the 4GB mark can
use it ? (Would the x86 PC benefit from allowing >4GB DMA?)

thanks
-- PMM

