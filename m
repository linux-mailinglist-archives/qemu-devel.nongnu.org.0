Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 908EB35F60
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jun 2019 16:36:16 +0200 (CEST)
Received: from localhost ([127.0.0.1]:43664 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYX1T-0006jo-Fh
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 10:36:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54941)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1hYWzs-000637-7f
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 10:34:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1hYWzr-0004qH-Bf
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 10:34:36 -0400
Received: from zuban.uni-paderborn.de ([131.234.189.17]:41828)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1hYWzq-0004mT-Od
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 10:34:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mail.uni-paderborn.de; s=20170601;
	h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
	Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QyUWB1DRuOPI7aY2fqM0NeatQ4FNqc/Jc3OjTi+CAXw=;
	b=QsSJaR5RQWQVI+6V54U1qBXjAK
	zZfwErVxXrcq+h7FqAoTUJXI12Iw9iqaA2/SXJop9UKKUXjcvjItFKvpYgmjkHHBfZJBvHl7TxD3J
	n01it4xMP+JxJFGWvo6vl3eiEvho+8x1rgSRXe8xGF6F+B1no23GViYPBUBS6ogwxSfQ=; 
To: David Brenken <david.brenken@efs-auto.org>, qemu-devel@nongnu.org
References: <20190605061126.10244-1-david.brenken@efs-auto.org>
	<20190605061126.10244-3-david.brenken@efs-auto.org>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-ID: <27601edc-17c9-0689-4d18-59f11069008e@mail.uni-paderborn.de>
Date: Wed, 5 Jun 2019 16:34:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190605061126.10244-3-david.brenken@efs-auto.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US-large
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.4.6.2792898, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2019.6.5.143016, AntiVirus-Engine: 5.63.0,
	AntiVirus-Data: 2019.6.4.5630002
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 131.234.189.17
Subject: Re: [Qemu-devel] [PATCH 2/5] tricore: add UTOF instruction
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
Cc: Andreas Konopik <andreas.konopik@efs-auto.de>,
	David Brenken <david.brenken@efs-auto.de>,
	Robert Rasche <robert.rasche@efs-auto.de>,
	Georg Hofstetter <georg.hofstetter@efs-auto.de>,
	Lars Biermanski <lars.biermanski@efs-auto.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 6/5/19 8:11 AM, David Brenken wrote:
> From: David Brenken <david.brenken@efs-auto.de>
>
> Signed-off-by: Andreas Konopik <andreas.konopik@efs-auto.de>
> Signed-off-by: David Brenken <david.brenken@efs-auto.de>
> Signed-off-by: Georg Hofstetter <georg.hofstetter@efs-auto.de>
> Signed-off-by: Robert Rasche <robert.rasche@efs-auto.de>
> Signed-off-by: Lars Biermanski <lars.biermanski@efs-auto.de>
>
> ---
>   target/tricore/fpu_helper.c | 16 ++++++++++++++++
>   target/tricore/helper.h     |  1 +
>   target/tricore/translate.c  |  3 +++
>   3 files changed, 20 insertions(+)
>
Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Cheers,
Bastian

