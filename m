Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B5941A18
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jun 2019 03:53:47 +0200 (CEST)
Received: from localhost ([::1]:56190 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hasSQ-0000QJ-Bp
	for lists+qemu-devel@lfdr.de; Tue, 11 Jun 2019 21:53:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53985)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <joel.stan@gmail.com>) id 1hasOB-0004M9-Cy
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 21:49:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1hasGx-00034O-Ax
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 21:41:56 -0400
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844]:34330)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1hasGv-00033E-3A; Tue, 11 Jun 2019 21:41:53 -0400
Received: by mail-qt1-x844.google.com with SMTP id m29so16995685qtu.1;
 Tue, 11 Jun 2019 18:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=36XMwg6fOZPknWhJvDPmi+0gtmReq8twkdd5DunLyVo=;
 b=S3i2ps6c9ig2NqlM1WOuCcwO8ijogzL+YWmbaqpF1uVAg6rq4vqID/+iC/9uxEylKg
 vriITHvz0rjGf/grzA/64rC+81PvIsd7h7q9krvDrnZ8IqS3MN+G0Z1dkZSHtdfVlU03
 3xhYMCCxpDVoZuIv/izr4M44z8apS6LKY4BXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=36XMwg6fOZPknWhJvDPmi+0gtmReq8twkdd5DunLyVo=;
 b=WyFpBuIUyVqgwCrabQPf6o/mXSu23/MZiQhYO4I00nJvFBoIiamlm09MkK2ih3UbJ4
 suYO2TFsWpW7LcZOpmxAPZ3Zzhjjvlx3+aRDurrRkscHgl1ekiQF5hERxkZxxDrcynV3
 K2FgYL4R49oQuhE8biggMIJHj/OsxPnGNaK+QGpT+k7J3apiAuUWhkQsRKyAtxUT3Qem
 CSMQI9JJL/KFKEua7pWBu3iEBc7VPe+wFacp+fGltPAmH0mc2YVqMIelq0Ej6uBoXbdE
 7Iieq22YDWwEc8TX6j6NGArhdeqKaNZ5kdoWJxPRFnxNqG+rYEumhMA2oBjydFY4p8L9
 ODLg==
X-Gm-Message-State: APjAAAVp+8Q3vx848WK5+hxLL1OaTlVjpecgqzvakdRxI5rHJKs5yC9y
 JBP1oBvGJxd+7xrWj5uA45GInogbyp1/ZYnXZiY=
X-Google-Smtp-Source: APXvYqxctiK60ltqLo0C8wInD8obaY93ZfNXBhH4cF4qU7dnOgR9cOnLj8C/XQeuOTcclUM+0hGvRqYfXbKfZfrSpqc=
X-Received: by 2002:ac8:2493:: with SMTP id s19mr47173397qts.220.1560303712549; 
 Tue, 11 Jun 2019 18:41:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190525151241.5017-1-clg@kaod.org>
 <20190525151241.5017-19-clg@kaod.org>
In-Reply-To: <20190525151241.5017-19-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 12 Jun 2019 01:41:40 +0000
Message-ID: <CACPK8Xdhx3qEwPu-d3iKntb5tVLA5H=7ZwDTECymbtJNaas6Nw@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::844
Subject: Re: [Qemu-devel] [PATCH 18/19] aspeed/smc: inject errors in DMA
 checksum
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 25 May 2019 at 15:14, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Emulate read errors in the DMA Checksum Register for high frequencies
> and optimistic settings of the Read Timing Compensation Register. This
> will help in tuning the SPI timing calibration algorithm.
>
> The values below are those to expect from the first flash device of
> the FMC controller of a palmetto-bmc machine.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

