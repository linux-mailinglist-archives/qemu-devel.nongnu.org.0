Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCB4BED64
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Sep 2019 10:30:02 +0200 (CEST)
Received: from localhost ([::1]:60780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDPA1-0006D1-6j
	for lists+qemu-devel@lfdr.de; Thu, 26 Sep 2019 04:30:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42177)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1iDP6q-00047u-Uf
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 04:26:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1iDP6q-0008T5-2U
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 04:26:44 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:37322)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1iDP6o-0008QY-Af; Thu, 26 Sep 2019 04:26:42 -0400
Received: by mail-qt1-f196.google.com with SMTP id l3so1824838qtr.4;
 Thu, 26 Sep 2019 01:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZtG5Pr0RHWHMT8XFJiT4USvH2vGOaKnwuPQ2WdbG8FU=;
 b=LJ63yuanw1QvldSAPg1gYyKpo7cnyxfLKm++34fwfIBZ9rKclsJEH/R9BFQaOZzVMW
 qvGrHjhMFCvsjRkKnzObt3DoqvpyyI2bd0L+jndnppSAEJy8WODaWPwf9jmnHWxMXK9u
 oJo3KkDtGVSNukQ0xCsnkpQce57JA8pb5ki18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZtG5Pr0RHWHMT8XFJiT4USvH2vGOaKnwuPQ2WdbG8FU=;
 b=cK6VA+0gSSf/ZMrXzt5kORiP06feGYLcF9i4gcjAkJ0mbhkltR7RFpZ6c3YFTOARKv
 X034q7dZ+7JV9ULDrvl7FEjBvByLipHNfjot9iVRlv4lm+FxyiP6tR/R9FMPRGc37xyE
 K8zdIsjEYR571OFXyFVVn3gUVACKXugHFClkd1j9pPMY+rJWXVweG40YZzZmn3ND2YfY
 be1IilrL4p/ot5uc0VU8h5HjTaRwg1TN7fPFlnz53HlhcrKboYLkdE5rsZlCLzmw/pFP
 insfUV4poDVzlUNKTatAbXGnklP3Yw/vHXAdAEKJFmuqNTKP4QfK2Axv+ctbyHpkbBCY
 P0SA==
X-Gm-Message-State: APjAAAW3eVMAzcyHwOIRQM7DYOmnPs8kiEI+gJDrtC16M4vDNZmVMcvN
 rtU9TAByqtQObTBH6NAhBpP8IXdzfNVAlmcZbRM=
X-Google-Smtp-Source: APXvYqxTXwPHEhiIpwt4FHgoMDhLuO2IQfF840c9AOIUcxfN2c6hqpsyQP4i2+tji2bi90/bL4b38xo/6wSdsCYV5TU=
X-Received: by 2002:ac8:2f81:: with SMTP id l1mr2658804qta.269.1569486341522; 
 Thu, 26 Sep 2019 01:25:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190925143248.10000-1-clg@kaod.org>
 <20190925143248.10000-20-clg@kaod.org>
In-Reply-To: <20190925143248.10000-20-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 26 Sep 2019 08:25:30 +0000
Message-ID: <CACPK8XcBRvicL-pqkj1bKRNR9xVDMXKzDA-uMjvB9JmJqKCYSg@mail.gmail.com>
Subject: Re: [PATCH v2 19/23] m25p80: Add support for w25q512jv
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.160.196
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

On Wed, 25 Sep 2019 at 14:35, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

