Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D61486318
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 11:44:28 +0100 (CET)
Received: from localhost ([::1]:46460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5QFw-0001xD-2G
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 05:44:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5QCS-0005bC-PQ
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:40:52 -0500
Received: from [2a00:1450:4864:20::336] (port=43889
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5QCQ-0004aS-UA
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:40:52 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 k66-20020a1ca145000000b00345fa984108so944187wme.2
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 02:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LIlJS/YxRhbJ/QRCEVgeZ84BEuLwttI+2hSvOD6DTgk=;
 b=z1vsnkWmGMv+CIl3G0lqwvNyh1jV58YgHrMBDe03TSTJfUYpH3woL+1FUWt4CzyILT
 tdtZYgj/t3tDOU9sZY+8IGbA5BMrXvXzQRm3mEFvILg6m+HasohDimAkCfBIr9xINUbc
 M8Okq9FteTziHmB7UAVxCFAgeLK1P2cF6+UhDmP+b+2agi/G9MRDSpmjQmqgP+XMGfGS
 k9VMAyvdFYHQhNzEdFtHBIzn9eT32X6v30lcTGcCHLuhRLbxlEddo18djpiM4cUpnLM7
 ZR1RnL6J+vjXhz4qHMZqR+zLOZPJflRkmLICXFLJSevP5rVn3p/S/Rs20BZn9NkO87Fo
 Od8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LIlJS/YxRhbJ/QRCEVgeZ84BEuLwttI+2hSvOD6DTgk=;
 b=7aNCl2CzG0XvCGJVDAiEkzfHQyaB1FY75OOtFr44uaH+N1oWUVMhGF6oUkR8TlSr1G
 CXh4BohlRLsMq5Bx4HcP6mh/PMBTbAHGpaa4G7g1dZ5YNon/H4JkxpyMzbaHXYh2fZG5
 o2U40Hs+OSjl4LRmy1pacmq6YVuNgPZm2Ch/tY/AQP81Kw2K96JgrLXz8itsBX+oMC8d
 AQg3h0OqcdprI2K5J1tw851h2NXf7zQbWgCSE2NLyUivxx3xNUhhVLBRt7G22Cfoo+oT
 GooF+b6Wz+zQsMqxib8yx7yivOZBFeVoH6MHWJYUK/GxRs1p6DIfVEpEDM7CjHdoH/5O
 wYLw==
X-Gm-Message-State: AOAM530g6iGPXD3cBhyjAFhCmCXZEXJeboRLVawr4xtUyz8HeDrz8I+h
 64idL6r371EvlXUm3U7LlmEuGmdjjx8FH291Usy0Ar4gd9A=
X-Google-Smtp-Source: ABdhPJxJjvdsvayzXJu/bscy6jv/vlsoe7x6eo+pr2wR/TxF8pGe88vZfUkFe35K6LAGuu7XW0WGWwGK0vc4irgmBiE=
X-Received: by 2002:a05:600c:1991:: with SMTP id
 t17mr6532594wmq.21.1641465649383; 
 Thu, 06 Jan 2022 02:40:49 -0800 (PST)
MIME-Version: 1.0
References: <PA4PR09MB4880FF47C3A6E249E55B80E2EB769@PA4PR09MB4880.eurprd09.prod.outlook.com>
 <CAFEAcA8m0M2+=ZuBAXcRmyGMzjHdjCYWM+_KzFK_eoPdwX-vpA@mail.gmail.com>
 <c2efa7d0-906b-21bc-bcee-d9f79a2e2064@amsat.org>
In-Reply-To: <c2efa7d0-906b-21bc-bcee-d9f79a2e2064@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Jan 2022 10:40:38 +0000
Message-ID: <CAFEAcA__Vn11Wy42RyG6uk7aO-Y6O10-jrcJkAkg7_-KV1BgAA@mail.gmail.com>
Subject: Re: Building QEMU as a shared library
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Amir Gonnen <amir.gonnen@neuroblade.ai>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "stefanha@redhat.com" <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 23 Dec 2021 at 09:49, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Hi Peter,
>
> On 12/15/21 11:10, Peter Maydell wrote:
> > On Wed, 15 Dec 2021 at 08:18, Amir Gonnen <amir.gonnen@neuroblade.ai> w=
rote:
> >> My goal is to simulate a mixed architecture system.
> >>
> >> Today QEMU strongly assumes that the simulated system is a *single arc=
hitecture*.
> >> Changing this assumption and supporting mixed architecture in QEMU pro=
ved to be
> >> non-trivial and may require significant development effort. Common cod=
e such as
> >> TCG and others explicitly include architecture specific header files, =
for example.
> >
> > Yeah. This is definitely something we'd like to fix some day. It's
> > the approach I would prefer for getting multi-architecture machines.
>
> Am I understanding correctly your preference would be *not* using shared
> libraries, but having a monolithic process able to use any configuration
> of heterogeneous architectures?

That would be my preference, yes. On the other hand I know there's
a lot of work in trying to get there, so I don't want to rule out the
idea that maybe pragmatically we do something else instead.

> What are your thoughts on Daniel idea to where (IIUC) cores can are
> external processes wired via vhost-user.

It sounds a bit awkward to me -- you end up with a system where
QEMU's scheduler between vCPUs is no longer the only thing deciding
what gets to run. (eg, how do you emulate atomic accesses? currently
we do those by "stop all other CPUs, do the thing, restart" for the
cases where we can't rely on the host's atomic insns.)
The multiple-host-processes model can certainly be made to work,
though -- AIUI this is how Xilinx's out-of-tree stuff works.

-- PMM

