Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB63262EE1C
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 08:11:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovvW3-0007An-JD; Fri, 18 Nov 2022 02:10:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jk@codeconstruct.com.au>)
 id 1ovvVt-000782-TB; Fri, 18 Nov 2022 02:10:14 -0500
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jk@codeconstruct.com.au>)
 id 1ovvVr-0002rb-JO; Fri, 18 Nov 2022 02:10:13 -0500
Received: from pecola.lan (unknown [159.196.93.152])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 43AE620032;
 Fri, 18 Nov 2022 15:09:57 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1668755400;
 bh=uRFY6XWdHxgTefUiIPiV/D98m8h0XHUW5FhDSDQuCPM=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=PVgj/POeJK+qXd8HyodbbPqYOfrJInufnL0L57zLI+XXuZGin6KnF5DFfcak9Y2a/
 NDEVLtQcLDl7NuBWMrlmP6qC/rmyIQC3JENY/6lxy+F/g1kA5bhtN6+hw+xHHK7N5z
 9U0BsNGBZ+Fc/Crbr8GPTTMxzI2XUJp0qxIZLFgwH7+bEKWVZHY5OK05GOtezQb7Ib
 NFID/I8nF1zntd+sK/soSjoFBiYV9684XOGayMBv8G61XyrTmRMMM2tJryTKrVjlTI
 gWSKPOwdxQatsuEaPv6pHUwDukwFqYf+EWd8sgvo8D8cyKqZP14OS3SH4QHPz3O2ge
 2EfV7Ad83PW5w==
Message-ID: <56ad0423ede938652d7b7be25e07b111a181e2d0.camel@codeconstruct.com.au>
Subject: Re: [PATCH RFC 2/3] hw/i2c: add mctp core
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Klaus Jensen <its@irrelevant.dk>
Cc: qemu-devel@nongnu.org, Andrew Jeffery <andrew@aj.id.au>, Keith Busch
 <kbusch@kernel.org>, Corey Minyard <cminyard@mvista.com>, Peter Delevoryas
 <peter@pjd.dev>, qemu-arm@nongnu.org, Peter Maydell
 <peter.maydell@linaro.org>,  qemu-block@nongnu.org, Joel Stanley
 <joel@jms.id.au>,  =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Klaus Jensen <k.jensen@samsung.com>, Matt Johnston
 <matt@codeconstruct.com.au>
Date: Fri, 18 Nov 2022 15:09:57 +0800
In-Reply-To: <Y3cuPrJQMBHuDYxG@cormorant.local>
References: <20221116084312.35808-1-its@irrelevant.dk>
 <20221116084312.35808-3-its@irrelevant.dk>
 <d8a8549c6fc29650131046ee00b7968ebedf886b.camel@codeconstruct.com.au>
 <be1a8590ee2f06d159987c45f85b4552695f8ed1.camel@codeconstruct.com.au>
 <Y3cuPrJQMBHuDYxG@cormorant.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-1 
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

Hi Klaus,

> I had to reverse the target mode functionality in QEMU from the linux
> driver, so I am really not too sure if having START and STOP set in
> the interrupt register is allowed behavior or not

From my interpretation of things, there's nothing explicitly preventing
both a pending start and stop - more that the interrupt is very likely
to have been serviced between those two events on the kind of speeds we
would see on the i2c bus.

I guess we could try (temporarily) masking the irq on real hardware and
see what happens? :D

Cheers,


Jeremy


