Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59607216DA
	for <lists+qemu-devel@lfdr.de>; Fri, 17 May 2019 12:16:59 +0200 (CEST)
Received: from localhost ([127.0.0.1]:45761 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRZv8-0004Rl-IT
	for lists+qemu-devel@lfdr.de; Fri, 17 May 2019 06:16:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45938)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hRZqY-0001H9-EU
	for qemu-devel@nongnu.org; Fri, 17 May 2019 06:12:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hRZqU-0005eD-Rz
	for qemu-devel@nongnu.org; Fri, 17 May 2019 06:12:13 -0400
Received: from 3.mo179.mail-out.ovh.net ([178.33.251.175]:33693)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1hRZqT-0005Yy-DY
	for qemu-devel@nongnu.org; Fri, 17 May 2019 06:12:09 -0400
Received: from player735.ha.ovh.net (unknown [10.108.35.103])
	by mo179.mail-out.ovh.net (Postfix) with ESMTP id B69D4131B35
	for <qemu-devel@nongnu.org>; Fri, 17 May 2019 12:12:00 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
	(Authenticated sender: clg@kaod.org)
	by player735.ha.ovh.net (Postfix) with ESMTPSA id C24D55E2D28E;
	Fri, 17 May 2019 10:11:54 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <20190506142042.28096-1-clg@kaod.org>
	<20190506142042.28096-4-clg@kaod.org>
	<4f7131a7-9099-f506-035f-abc584bf56b0@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <1f038e7c-8980-006c-fffe-c5204052e03c@kaod.org>
Date: Fri, 17 May 2019 12:11:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <4f7131a7-9099-f506-035f-abc584bf56b0@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 9867386783842929619
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddruddtvddgvdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.33.251.175
Subject: Re: [Qemu-devel] [PATCH v2 3/3] aspeed: use sysbus_init_child_obj()
 to initialize children
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Philippe, 

[ ... ] 

> A similar patch (although better described IMO) was posted here:
> https://lists.gnu.org/archive/html/qemu-devel/2019-02/msg05931.html
> 
> However you improved it by using sysbus_init_child_obj(). If you don't
> mind I'll respin addressing Markus comment and using your improvement.

Sure, np. 

When is this patchset expected to be merged ? AFAICT, It's blocking 
this current patchset, which is blocking Joel's RTC one and others 
are on the way.

Thanks,

C. 

