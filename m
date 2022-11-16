Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D6762C084
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 15:08:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovJ3N-0007CY-GI; Wed, 16 Nov 2022 09:06:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jk@codeconstruct.com.au>)
 id 1ovEZL-0008G9-ES; Wed, 16 Nov 2022 04:18:55 -0500
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jk@codeconstruct.com.au>)
 id 1ovEZI-0003wL-Mr; Wed, 16 Nov 2022 04:18:55 -0500
Received: from pecola.lan (unknown [159.196.93.152])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 18C9320031;
 Wed, 16 Nov 2022 17:18:36 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1668590320;
 bh=1FjLSTPAGobxT1O5ZX56IXyw3raFqKvtitqrRpog/DQ=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=KRUBcILeqd4juqrDCGkGRYTHmjqxCVcevf7l1Huk9wXAKKzlrtOJrLgMTmoF7L0Ag
 iZ0RrzqHemAVlJ45D6Qaf6oIgntB0qR4Tbu3yDvU0TL1des7zimjEw5CU6LY2T9a/+
 y7FfI/OPcwKUG1CqbcqA7pfz9Z6+duYdnYAfyJXfi+DhPZF3miXUwSid2J9g1rYxJc
 fWHoBuzsawMWVWijF6HYeKpgIGLBbqQaRS3xk+KWqrZovotG5Mq9hL77I1OfWmljx+
 GXtjj1juNhwtxrxhX+aDhcWp8aBRZTMtDXLV/gYiDZQwhHy3JH2dZOdk2f3FsNASvQ
 MnXEn6IKDka4w==
Message-ID: <32acd8cb29f23013ec203cb635e7fc161ad2e5a6.camel@codeconstruct.com.au>
Subject: Re: [PATCH 0/3] hw/{i2c,nvme}: mctp endpoint, nvme management
 interface model
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@aj.id.au>, Keith Busch <kbusch@kernel.org>, Corey
 Minyard <cminyard@mvista.com>, Peter Delevoryas <peter@pjd.dev>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Joel Stanley <joel@jms.id.au>, 
 =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Klaus Jensen
 <k.jensen@samsung.com>, Matt Johnston <matt@codeconstruct.com.au>
Date: Wed, 16 Nov 2022 17:18:35 +0800
In-Reply-To: <20221116084312.35808-1-its@irrelevant.dk>
References: <20221116084312.35808-1-its@irrelevant.dk>
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
X-Mailman-Approved-At: Wed, 16 Nov 2022 09:06:11 -0500
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

[+CC Matt]

> This adds a generic MCTP endpoint model that other devices may derive
> from. I'm not 100% happy with the design of the class methods, but
> it's a start.

Thanks for posting these! I'll have a more thorough look through soon,
but wanted to tackle some of the larger design-points first (and we've
already spoken a bit about these, but rehashing a little of that for
others CCed too).

For me, the big decision here is where we want to run the NVMe-MI
device model. Doing it in the qemu process certainly makes things
easier to set up, and we can just configure the machine+nvme-mi device
as the one operation.

The alternative would be to have the NVMe-MI model run as an external
process, and not part of the qemu tree; it looks like Peter D is going
for that approach with [1]. The advantage there is that we would be
able to test against closer-to-reality "MI firmware" (say, a device
vendor running their NVMe-MI firmware directly in another emulator? are
folks interested in doing that?)

The complexity around the latter approach will be where we split the
processes, and arrange for IPC. [1] suggests at the i2c layer, but that
does seem to have complexities with i2c controller model compatibility;
we could certainly extend that to a "generic" i2c-over-something
protocol (which would also be handy for other things), or go higher up
and use MCTP directly as the transport (say, the serial binding over a
chardev). The former would be more useful for direct firmware
emulation.

My interest is mainly in testing the software stack, so either approach
is fine; I assume your interest is from the device implementation side?

Cheers,


Jeremy

[1]: https://github.com/facebook/openbmc/blob/helium/common/recipes-devtool=
s/qemu/qemu/0007-hw-misc-Add-i2c-netdev-device.patch


