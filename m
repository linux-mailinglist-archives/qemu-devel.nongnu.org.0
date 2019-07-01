Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3354D5BCCF
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jul 2019 15:23:25 +0200 (CEST)
Received: from localhost ([::1]:58700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hhwHE-00066v-CJ
	for lists+qemu-devel@lfdr.de; Mon, 01 Jul 2019 09:23:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39552)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hhwDn-00046f-CM
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 09:19:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hhwDm-0004F2-9h
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 09:19:51 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:47000)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hhwDm-0004E9-2a
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 09:19:50 -0400
Received: by mail-ot1-x343.google.com with SMTP id z23so13405963ote.13
 for <qemu-devel@nongnu.org>; Mon, 01 Jul 2019 06:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pUQv6DkKtWq0J5A/w2iXR4PnuAkD1maDWSI1k7bmNiQ=;
 b=F6Wj/39GmkLR2g9YeQEkyTn7TSEqBI43kOKZ3yc8kiDRcjlv9cEf/VaDTNhuLrHOhi
 BAIMHLoBY9zRkEwFAehHcmh7fRuUXN+PtG6hWS+kVxEDvsi4o06PCVy72ndU9W69wgJ0
 ZKDXHdKoGtztksNd8EjwMq/cL77gBkvHwI89D4yFTN765aBHv40Jya5fEfZB/4SFiggh
 wAUxQt4bHJpQSywUPXIf+s5auHl/lOy0L5CeCgYq+rbMQlIeiGb1KuqI5CPaLHSm7u7R
 WBkjlC7qWmvsobdc2qTKbBYZ6iib2dXPUO/LD+pq7Dm8QRTS/bbyWIsoaQ3osEWaVo0K
 77RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pUQv6DkKtWq0J5A/w2iXR4PnuAkD1maDWSI1k7bmNiQ=;
 b=V2emRUhLARs06rONnciYewvJVXqZhIdJtfffWFWa85lazTTriQ7ABWflOX4oNYDD3b
 h6Bwzsa2GgPK8bXR2lzmIqgn3l317Z2saNHv2IXFwZogoGzY8T1lWIFj2N6whdNStKBj
 I1rnRSlQ+ZQRWtxDV5vkr4oLMOt+m7uQVJUCH0dKbWz/dri7GuZNa36mltWVLX9wnSmc
 VVa5H2wOhz/TCqBKpYPFZaJ46hoXiuyjx8BYbnrBSl3YRHk50f/DKIiqNsuxQxAeZZq0
 E0Z8+NNpn26MdjWb9YivbyDSvavA2ZC3ReOo+Her9J7N7vGFCySwCfsISZg7lUOh+ig+
 pfsw==
X-Gm-Message-State: APjAAAX+dneBI1zNGA1M6qX+d/MDS7VCV9ilUmIw94VN0m82VPAGDFMc
 +5Yjgr0nXhhIwFKKEwUcHHyQzetYO0ifogyqVXkXMw==
X-Google-Smtp-Source: APXvYqyMnBKX2lltjXDXX1a3GGRx2b1EiqTmGWpoIb2klL3gA/hC7Qt7vhlZ7ahAlE2pw3/7VPow7xwhKnNOMMxTN54=
X-Received: by 2002:a9d:7245:: with SMTP id a5mr20522827otk.232.1561987189075; 
 Mon, 01 Jul 2019 06:19:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190618165311.27066-1-clg@kaod.org>
 <20190618165311.27066-17-clg@kaod.org>
In-Reply-To: <20190618165311.27066-17-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Jul 2019 14:19:38 +0100
Message-ID: <CAFEAcA97g-eHyq0cWL5+3JH2xHLVrSaP36pm0G5djkLcVoK0HQ@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-devel] [PATCH v2 16/21] aspeed/smc: add DMA calibration
 settings
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

On Tue, 18 Jun 2019 at 17:55, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> When doing calibration, the SPI clock rate in the CE0 Control Register
> and the read delay cycles in the Read Timing Compensation Register are
> set using bit[11:4] of the DMA Control Register.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Acked-by: Joel Stanley <joel@jms.id.au>
> ---
>  hw/ssi/aspeed_smc.c | 64 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 63 insertions(+), 1 deletion(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

