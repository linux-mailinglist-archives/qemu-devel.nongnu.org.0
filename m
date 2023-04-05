Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F38A6D7244
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 04:07:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjsYQ-0001zc-KF; Tue, 04 Apr 2023 22:07:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jk@codeconstruct.com.au>)
 id 1pjsYO-0001zO-4u; Tue, 04 Apr 2023 22:07:16 -0400
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jk@codeconstruct.com.au>)
 id 1pjsYK-0000kw-VT; Tue, 04 Apr 2023 22:07:15 -0400
Received: from pecola.lan (unknown [159.196.93.152])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 503B32009F;
 Wed,  5 Apr 2023 10:06:59 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1680660422;
 bh=oPOiLsTGI6kKQoD6XYQJ6dXb8rUnPSB2OAPuaWxl/QA=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=QByIUS2FVB1JG5xFa7iaaZhD7sV2HrGdMCOU7EwlzJpCr4kSDIIlPnQDQYvs0pEpT
 99wO2viy4X4eXIYF7UJmacNIEB/lXt1yBRl7qq2CVs8eL4h9gA4rCy7GeEmalk5Tvx
 fJp4KqihBOrZ7d3TOJH1s66zN1FPfJdVy6YpEjgDUgourQZY5sEY/BBacVxlKTmCMN
 cLmxqQvBH0q9ti0Oo4sTWfrdm0rZAsLzCzB+Fthyrslz9ryLYmtq9QU6Bs6UxRjnRQ
 NPAeKReEKWC7wgkD6ZwxmtH8HfOhL3FXYyko1F318eCN4RzESM2DEJq2RPkJraIBfu
 2cEUZchu+hcaA==
Message-ID: <0f44daa680719e06071e3a56c61fff18f3918139.camel@codeconstruct.com.au>
Subject: Re: [PATCH 00/16] i3c: aspeed: Add I3C support
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Joe Komlodi <komlodi@google.com>
Cc: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Ben Dooks
 <qemu@fluff.org>, qemu-devel@nongnu.org, venture@google.com, 
 peter.maydell@linaro.org, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>, Troy Lee
 <troy_lee@aspeedtech.com>, Graeme Gregory <quic_ggregory@quicinc.com>
Date: Wed, 05 Apr 2023 10:06:58 +0800
In-Reply-To: <CAGDLtxv3z69dmDMpA=7dk8ADHwTaMPT-a3BceTvyidXk66+8oA@mail.gmail.com>
References: <20230331010131.1412571-1-komlodi@google.com>
 <20230401172825.tvmfms6qbh3tmi5s@hetzy.fluff.org>
 <74148c47-8232-02d3-2c37-d12c1fe156e2@kaod.org>
 <50b19eb8929da77f150c34585f805345e460daed.camel@codeconstruct.com.au>
 <CAGDLtxv3z69dmDMpA=7dk8ADHwTaMPT-a3BceTvyidXk66+8oA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
Received-SPF: pass client-ip=203.29.241.158;
 envelope-from=jk@codeconstruct.com.au; helo=codeconstruct.com.au
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Joe,

> > > Jeremy, how different is it ? Could we introduce properties or sub
> > > classes, to support both.
> >=20
> > The differences (at least from the view of the current Linux driver
> > implementation) are very minor; unless we want to be errata-compatible,
> > you could use the dw driver directly, plus the ast2600-specific global
> > register space.
> >=20
>=20
> This is my understanding as well from an outside look.
> From a QEMU standpoint I could split off the dwc portion into a
> dwc_i3c model, which the aspeed_i3c portion inherits from. I can do
> that in a v2 if that sounds good with everyone.

I'm not a qemu maintainer, but for the record: I'm fine with the current
approach. I don't have access to any of the non-aspeed dw documentation,
so verifying what should go into the dw model vs. what is
ast2600-specific has been a bit tricky.

If someone needs a non-aspeed dw model, and has a bit of documentation
about the underlying dw hardware, it should be easy enough to split back
out. Maybe just make sure any "known" divergences - like the IBI PEC
behaviour - are well commented.

That said, if you're keen to do the split dw+aspeed models, that's also
good :)

Cheers,


Jeremy

