Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E63D8F73
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Oct 2019 13:31:14 +0200 (CEST)
Received: from localhost ([::1]:41220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKhWL-0001Rb-6h
	for lists+qemu-devel@lfdr.de; Wed, 16 Oct 2019 07:31:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42298)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1iKhQM-0006Bb-3z
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 07:25:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1iKhQL-0003pG-Af
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 07:25:02 -0400
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842]:44054)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1iKhQI-0003oQ-JE; Wed, 16 Oct 2019 07:24:58 -0400
Received: by mail-qt1-x842.google.com with SMTP id u40so35454834qth.11;
 Wed, 16 Oct 2019 04:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eH+1OsIsWYsvPFE4doGalrk7GlwE8kT2Ztu1aB99Yoo=;
 b=DoJ1Y9pQldeRYkhrgN/gM0B+noh/KN+pWnmVqFJ6bAnhrkiEwWUmg6Q3/igh3DXkAX
 cbdjoBno+iAx7mdiQiHpbNFAhNqgeRDsE5sF83DalUviqXsb5fXvwpU7NPslyIr63K+L
 V79jOpLm8MLX06EG4gGZln3cF/FPNigezkGt8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eH+1OsIsWYsvPFE4doGalrk7GlwE8kT2Ztu1aB99Yoo=;
 b=r3rxmZ1Tv8hwarJmnTk6BvOzvMuAm6XpcQ6a3SShJcBn5u8+hcvTuJSMSG3SDwGmn5
 5nIxqxvINiuAdkKr+/6wRHfH5dc07spWV1caWQjzsZIYVYTVMLDr5veknpq/bEuiU1uZ
 2JFN7WYff4f2RwigjYfiguq54PF9y7C3Rg6W3IQB+DHhHbkzqTiEXL8mDzCeL1CPCw/v
 96CJ86Tcf5kBrm/D9+UcIsgPpnLlS0HTeQF0h6tOj5LGP2D/uU+wXxPghz+rfVvCSKrm
 ujXY0DUzlJXOea1V6iBXS67pSKHCAU/ln+jz2+Hco7bdSUHFpTW8/3eOlYeW5ga4Qdgd
 coaA==
X-Gm-Message-State: APjAAAU56NkPG+iLaWbkMBxpfoPKIi1GxNGx3hNQKkH0QUmywKI/XWIN
 2d2Ly6cIbA9QAGV9U+ENoh7pPnsCOmWhMrA2He8=
X-Google-Smtp-Source: APXvYqwYH4Pn9W2ctoBKt8UED5fwlcasOC+ITY0bpESrbOnjKid4xeHXQHFfKuHyDOCeayIYje3yZsjmYkydErMtpGk=
X-Received: by 2002:ac8:5347:: with SMTP id d7mr44263224qto.269.1571225097946; 
 Wed, 16 Oct 2019 04:24:57 -0700 (PDT)
MIME-Version: 1.0
References: <20191016085035.12136-1-clg@kaod.org>
 <20191016085035.12136-6-clg@kaod.org>
In-Reply-To: <20191016085035.12136-6-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 16 Oct 2019 11:24:45 +0000
Message-ID: <CACPK8XdoxaZjH=vCB5Vm-vv=bxLdJ1A9DknAUkiCzzsmBj+GNQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] aspeed/i2c: Add trace events
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::842
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Eddie James <eajames@linux.vnet.ibm.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 16 Oct 2019 at 08:50, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

