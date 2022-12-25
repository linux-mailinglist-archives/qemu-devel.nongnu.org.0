Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47479655D2D
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Dec 2022 13:21:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9Pyb-0007Kh-Kf; Sun, 25 Dec 2022 07:19:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@fluff.org>)
 id 1p9PyK-0007IA-SE; Sun, 25 Dec 2022 07:19:21 -0500
Received: from test-v6.fluff.org ([2a01:4f8:222:2004::3] helo=hetzy.fluff.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@fluff.org>)
 id 1p9PyJ-0006V8-1T; Sun, 25 Dec 2022 07:19:20 -0500
Received: from ben by hetzy.fluff.org with local (Exim 4.89)
 (envelope-from <ben@fluff.org>)
 id 1p9Pxr-0001y9-4T; Sun, 25 Dec 2022 12:18:51 +0000
Date: Sun, 25 Dec 2022 12:18:51 +0000
From: Ben Dooks <ben@fluff.org>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
 Alistair Francis <alistair@alistair23.me>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Michael Walle <michael@walle.cc>, Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: Re: [PATCH] m25p80: Add the is25wp256 SFPD table
Message-ID: <20221225121850.4bjnskmlhsot54cf@hetzy.fluff.org>
References: <20221221122213.1458540-1-linux@roeck-us.net>
 <2236d0ee-4fc6-5e2c-95b4-f97639e0955b@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2236d0ee-4fc6-5e2c-95b4-f97639e0955b@kaod.org>
X-Disclaimer: These are my views alone.
X-URL: http://www.fluff.org/
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: ben@fluff.org
X-SA-Exim-Scanned: No (on hetzy.fluff.org); SAEximRunCond expanded to false
Received-SPF: pass client-ip=2a01:4f8:222:2004::3; envelope-from=ben@fluff.org;
 helo=hetzy.fluff.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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

On Wed, Dec 21, 2022 at 06:36:02PM +0100, Cédric Le Goater wrote:
> On 12/21/22 13:22, Guenter Roeck wrote:
> > Generated from hardware using the following command and then padding
> > with 0xff to fill out a power-of-2:
> > 	xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> > 
> > Cc: Michael Walle <michael@walle.cc>
> > Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> 
> Reviewed-by: Cédric Le Goater <clg@kaod.org>

If SFDP is a standard, couldn't we have an function to generate it from
the flash parameters?

-- 
Ben Dooks, ben@fluff.org, http://www.fluff.org/ben/

Large Hadron Colada: A large Pina Colada that makes the universe disappear.


