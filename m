Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7C5632585
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 15:21:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox7fe-0000zm-TT; Mon, 21 Nov 2022 09:21:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matt@codeconstruct.com.au>)
 id 1ox1nZ-0003OJ-7c; Mon, 21 Nov 2022 03:05:02 -0500
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matt@codeconstruct.com.au>)
 id 1ox1nW-0008Hz-Fu; Mon, 21 Nov 2022 03:05:00 -0500
Received: by codeconstruct.com.au (Postfix, from userid 10001)
 id 30F1920031; Mon, 21 Nov 2022 16:04:45 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1669017885;
 bh=JgJk6lNPb1VybQ+KnkB29GKT/z0GPi5XQivENuVAS/Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=ThfVsdVHbealDrQfNuGlYsJmMkiq69orAQMtLbd5R98yCpePPb6i4mdUZ1/lEsniw
 g2s0OeOMg+kGkQDaGBnAyRT6u1z1HyZAYhR7dvdCE+xkLLhkbfYei6Hj+APFjd1q+c
 uMgWYs5G7xPeEm5BpKynif20xF8PwZAdpObetYEM0zwUnB+BLF5c7jjkOoJv693hUk
 Soo+vv6NvSiOxp/7Gr/onugMGYtAb09dsmzgRbHsXHDuFN0Ex0MlcjWUjRD7Wt/Ws2
 f2qHLHXFqFZkvHnV5FZ8dAbUNLg2qRjJk7vIFjkE4jYc5X5b7C+bc9kdhsKsNYVJD+
 1Yjw5gE51m1MA==
Date: Mon, 21 Nov 2022 16:04:45 +0800
From: Matt Johnston <matt@codeconstruct.com.au>
To: Klaus Jensen <its@irrelevant.dk>
Cc: Jeremy Kerr <jk@codeconstruct.com.au>, qemu-devel@nongnu.org,
 Andrew Jeffery <andrew@aj.id.au>, Keith Busch <kbusch@kernel.org>,
 Corey Minyard <cminyard@mvista.com>,
 Peter Delevoryas <peter@pjd.dev>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH RFC 2/3] hw/i2c: add mctp core
Message-ID: <20221121080445.GA29062@codeconstruct.com.au>
References: <20221116084312.35808-1-its@irrelevant.dk>
 <20221116084312.35808-3-its@irrelevant.dk>
 <d8a8549c6fc29650131046ee00b7968ebedf886b.camel@codeconstruct.com.au>
 <Y3ct1OzQfPLGEQ1T@cormorant.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3ct1OzQfPLGEQ1T@cormorant.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=203.29.241.158;
 envelope-from=matt@codeconstruct.com.au; helo=codeconstruct.com.au
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 21 Nov 2022 09:21:12 -0500
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

On Fri, Nov 18, 2022 at 08:01:40AM +0100, Klaus Jensen wrote:
> On Nov 18 13:56, Jeremy Kerr wrote:
> > Hi Klaus,
> > 
> > > Add an abstract MCTP over I2C endpoint model. This implements MCTP
> > > control message handling as well as handling the actual I2C transport
> > > (packetization).
> > > 
> > With those changes, I can get control protocol going, and multi-packet
> > messages work. There's a couple of failures from unsupported commands,
> > but otherwise looks good:
> > 
> >   # mctp addr add 8 dev mctpi2c6
> >   # mctp link set mctpi2c6 up
> >   # mctp link set mctpi2c6 mtu 254
> >   # systemctl restart mctpd
> >   # busctl --no-pager call xyz.openbmc_project.MCTP \
> >     /xyz/openbmc_project/mctp au.com.CodeConstruct.MCTP \
> >     SetupEndpoint say mctpi2c6 1 0x1d

Hi Klaus,

Thanks for the MCTP model, it's useful here.

I needed the following patch to be able to call SetupEndpoint again when a
device has already been assigned an EID. That tries a Set Endpoint ID/
Get Endpoint ID, addressed to EID 0.

Cheers,
Matt

---
From cb7ad91474367f8e47bdaf03aba9a822f2648f41 Mon Sep 17 00:00:00 2001
From: Matt Johnston <matt@codeconstruct.com.au>
Date: Mon, 21 Nov 2022 15:10:13 +0800
Subject: [PATCH] i2c/mctp: Allow receiving messages to dest eid 0

The Null Destination ID, 0, is used for MCTP control messages when
addressing by physical ID. That is used for Get Endpoint ID and
Set Endpoint ID when querying/assigning an EID to an endpoint.

Signed-off-by: Matt Johnston <matt@codeconstruct.com.au>
---
 hw/i2c/mctp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/i2c/mctp.c b/hw/i2c/mctp.c
index 1775deb46f..9d9e519ba9 100644
--- a/hw/i2c/mctp.c
+++ b/hw/i2c/mctp.c
@@ -258,7 +258,8 @@ static int i2c_mctp_event_cb(I2CSlave *i2c, enum i2c_event event)
             goto drop;
         }
 
-        if (pkt->mctp.hdr.eid.dest != mctp->my_eid) {
+        if (!(pkt->mctp.hdr.eid.dest == mctp->my_eid
+            || pkt->mctp.hdr.eid.dest == 0)) {
             trace_i2c_mctp_drop_invalid_eid(pkt->mctp.hdr.eid.dest,
                                             mctp->my_eid);
             goto drop;
-- 
2.37.2


