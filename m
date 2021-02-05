Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B98C73110FF
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 20:21:49 +0100 (CET)
Received: from localhost ([::1]:42758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l86fq-0002fD-Jx
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 14:21:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l86dc-00026j-31
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 14:19:28 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:45157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l86da-0004Wb-DH
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 14:19:27 -0500
Received: by mail-ej1-x634.google.com with SMTP id b9so13568868ejy.12
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 11:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HeWsoYBhhyRLwWx5le8ykpB5q/SXrdRFZywWUTxH3mU=;
 b=qNgAHVM5qJaV0pOTgb4tlY8HVadYPnNLqHQhcJ+3IwfxuVueIXemV1eV9jhSuP+JF4
 hIeNQZ3bg/lmGqe7QwUKx2g89ElOMW3PqICEXIcDGexorwFRpNcaG9KCHEpLGpM/ay/S
 mrNqH/6FyoJHh6zQy6znuz5caLNSnAHNT9Kp8HTQHtqiHu7X0uhxV8fg7+RUa3s5ejYv
 KLffWATs9UXIohD35tlY9bJcpud/4asvwFfgDI6FvUdo8tEwAMM7ElT6+3x32jRXm0sa
 nqWkeeJDyOgjzdx9tcoReZv2RWzTIYp93CvvW1yUQqS1uB7APqWVE4FeQg+YmCWG9C6M
 gbzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HeWsoYBhhyRLwWx5le8ykpB5q/SXrdRFZywWUTxH3mU=;
 b=i8/0ocidqJcUvvmXAJhf95f8OR8UY5lrUF6eXHsO0mU9x6BYQlJwCYfUIEnGZ02+DD
 HFx658Acyt46+i+XIYFIFpUC2VHOs5JM1HqcwZPjV9u6hPVkSWx/G6rUazGCp+O5439G
 vKa4+kARPktHJtpnOI9Z8C4z3AtHY9edVqSXVUD+VggCb+kGq1hTcOFgpBq29CbLXT72
 AoC2MYHjrmlsdYzxjOHrd26unuSlRZbbus1klKdXgaKQAdcs3q5Tr+0tarYjFqkdrg2d
 y3pZC8tttk8gqYUaxyozZKAlN9JCrDrYq1Q4LfxYjM+THImViZ0H0fIvFw2Op4VYIjBZ
 Fn+Q==
X-Gm-Message-State: AOAM531iTHOSDqa+RXWy6yCujXgg/QZeO3PznCp010BEDxZmoOeQe07m
 jx6V5cguRgXJaGCiIXFDowTe9Pc1XjktgwSsZuBNow==
X-Google-Smtp-Source: ABdhPJzLx9m1BfrmhMHz4ymCfAHE9fCvxc0nfGxCuQ6F7lIUhQEjl57xc4wHbspMxFoGvs3FI6hbieiL4YqWnMDKjNk=
X-Received: by 2002:a17:906:494c:: with SMTP id
 f12mr5531021ejt.56.1612552764917; 
 Fri, 05 Feb 2021 11:19:24 -0800 (PST)
MIME-Version: 1.0
References: <20210205171456.19939-1-peter.maydell@linaro.org>
 <0ddf77dc-35c6-6955-9433-abd3898c3ee7@amsat.org>
In-Reply-To: <0ddf77dc-35c6-6955-9433-abd3898c3ee7@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Feb 2021 19:19:13 +0000
Message-ID: <CAFEAcA8kUQR3tK+gNFOkZu0GMkvBnKw3WvPN3_JvEmXembrQTw@mail.gmail.com>
Subject: Re: [PATCH] arm: Update infocenter.arm.com URLs
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 5 Feb 2021 at 18:07, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> On 2/5/21 6:14 PM, Peter Maydell wrote:
> > -/* This is a model of the Arm PrimeCell PL080/PL081 DMA controller:
> > +/*
> > + * This is a model of the Arm PrimeCell PL080/PL081 DMA controller:
> >   * The PL080 TRM is:
> > - * http://infocenter.arm.com/help/topic/com.arm.doc.ddi0196g/DDI0196.p=
df
> > + * https://developer.arm.com/documentation/ddi0196/latest
>
> Oh, /latest :)

Yeah. developer will do link-to-specific-revision-of-document
if you want them, but I figured /latest was probably the more
generally useful URL. Not that the PL080 TRM is likely to
ever get another revision :-)

-- PMM

