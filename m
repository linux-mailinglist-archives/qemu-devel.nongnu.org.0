Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CC65BD7B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jul 2019 16:00:09 +0200 (CEST)
Received: from localhost ([::1]:59088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hhwqm-0006UQ-JM
	for lists+qemu-devel@lfdr.de; Mon, 01 Jul 2019 10:00:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43243)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hhwSy-00026O-HI
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 09:35:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hhwSx-00086u-5j
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 09:35:32 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:35558)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hhwSw-000801-SQ
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 09:35:31 -0400
Received: by mail-ot1-x342.google.com with SMTP id j19so13509002otq.2
 for <qemu-devel@nongnu.org>; Mon, 01 Jul 2019 06:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lsxdKIp0KRdDGBO5xr+B1ObOvZXz2S2vdZY9/WBbxvg=;
 b=Tp+bSCgx+xXG/9Ttw37vG+RC3SxemU+33TLgbiPkwTX56VO1ME45E9fHv1ErXwlUV2
 qGrk7cVjxcthSTKZzlBGtQpIiuhwysRBn1+qESS/wX7ued7Rii7+xJHfUPAHzUXK+LqP
 FMBhTgKZs3sDHOI7SXPEgYyiSXkjePa53AiHY5OQ6JrCnj5t65j8MlRXSfv8mpZ7lXiy
 L24PgYlkgXZszsuXhg8nkLAV4StjVDD4WkNOO8RgLrYI5MasRGbBaQwnjch33hrtqVTc
 LcULKBLfnuFuxlNN+Xc4jwvw0iPhrn9C/KdCyfP9IAxh+aMY+WfE5pVMS9yhu/P8CLok
 /ZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lsxdKIp0KRdDGBO5xr+B1ObOvZXz2S2vdZY9/WBbxvg=;
 b=FXIeyipmPUR6cymXj0dZDlxgksQtu5g3TvnggOyKJzl+iwMetk1uMb+yTpy+F6lE8o
 IBHxL2kiBbLSLaCswTfVbhzhk9z7JmrgAZxDvLUyNzEVb4PcXa2pAjm7Br79CNmonb4K
 Cq7HEbR0lndDDwC+THOCpcWnY7mshfdkn0wbUVv2VxegGXGw+TV/QLrUbb3DbT5Wcb9g
 +p8CFisQ93YYN9e2QhApgsP5ktHOivOClEQhEHI8PcldcrA1Wo4W3eoWu9kuwHhTts+O
 fpuDLSX7V5ljEIFwtujsSBZB4ziOf1fuCuOU2szS2Pptj3ZFQ0VYa2JpJBOJvoBP/jH+
 PTxQ==
X-Gm-Message-State: APjAAAWT1Jv/2qBYgLf3RJtUeCb6V2uDv1lvFDKTuMslon6JLKrUgYei
 h9m2jugQqV4/3cB+3jXDfD5zI+8G0uVRr6ovKjR0lg==
X-Google-Smtp-Source: APXvYqx8vyqTY88qOjSZpBNaqSOQDGVJIybPtXra6kD2ra/Z7vJlyh7NzglseXnmRQifI0nXm0LKURGw2aw2Gbhpvt8=
X-Received: by 2002:a9d:4d81:: with SMTP id u1mr8632671otk.221.1561988125442; 
 Mon, 01 Jul 2019 06:35:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190618165311.27066-1-clg@kaod.org>
In-Reply-To: <20190618165311.27066-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Jul 2019 14:35:14 +0100
Message-ID: <CAFEAcA8+e1ADZqgnaR0T5TCdKa4qTtt_ny4r_KFndhGEcDaCKA@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-devel] [PATCH v2 00/21] aspeed: machine extensions and
 fixes
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 18 Jun 2019 at 17:53, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Hello,
>
> This series improves the current models of the Aspeed machines in QEMU
> and adds new ones. It also prepares ground for the future Aspeed SoC.
> You will find patches for :
>
>  - per SoC mappings of the memory space and the interrupt number space
>  - support for multiple CPUs (improved)
>  - support for multiple NICs
>  - a RTC model from Joel
>  - a basic XDMA model from Eddie
>  - support for multiple CPUs and NICs
>  - fixes for the irq and timer models from Joel, Andrew and Christian
>  - DMA support for the SMC controller, which was reworked to use a RAM
>    container region as suggested by Peter in September 2018
>  - new swift-bmc machine from Adriana (P9' processor)

Hi; I've left review comments on some of the patches.
I'm going to take patches 1-9, 11, 12, 13, 14, 19, 20, 21
into target-arm.next (since we're nearly at softfreeze);
the others I either had comments on or they were dependent
on earlier patches in the series.

thanks
-- PMM

