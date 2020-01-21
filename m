Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EAB143789
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 08:25:13 +0100 (CET)
Received: from localhost ([::1]:49418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itnuS-0002PH-EH
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 02:25:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47001)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1itnt0-00019S-4I
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 02:23:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1itnsy-0000cn-Sy
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 02:23:42 -0500
Received: from 6.mo69.mail-out.ovh.net ([46.105.50.107]:46011)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1itnsy-0000cG-NL
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 02:23:40 -0500
Received: from player763.ha.ovh.net (unknown [10.109.143.79])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id B6A4B728E4
 for <qemu-devel@nongnu.org>; Tue, 21 Jan 2020 08:23:38 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player763.ha.ovh.net (Postfix) with ESMTPSA id 0DEDEE6DC3C8;
 Tue, 21 Jan 2020 07:23:32 +0000 (UTC)
Subject: Re: [PATCH 0/2] aspeed/scu: Implement chip id register
To: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <20200121013302.43839-1-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <d5c9af12-9970-1a6e-e88c-b8dc1901527b@kaod.org>
Date: Tue, 21 Jan 2020 08:23:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200121013302.43839-1-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 12031929357400574784
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrudejgddutdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucffohhmrghinhepohiilhgrsghsrdhorhhgnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeeifedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.50.107
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/21/20 2:33 AM, Joel Stanley wrote:
> This implements the chip id register in the SCU for the ast2500 and
> ast2600. The first patch is a cleanup to separate out ast2400 and
> ast2500 functionality.

These patches apply cleanly on top of :

	[v3,0/5] aspeed: extensions and fixes 
	http://patchwork.ozlabs.org/cover/1222667/

Thanks,

C.

> 
> Joel Stanley (2):
>   aspeed/scu: Create separate write callbacks
>   aspeed/scu: Implement chip ID register
> 
>  hw/misc/aspeed_scu.c | 93 +++++++++++++++++++++++++++++++++-----------
>  1 file changed, 70 insertions(+), 23 deletions(-)
> 


