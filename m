Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B60A66B879
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jul 2019 10:43:36 +0200 (CEST)
Received: from localhost ([::1]:55144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnfXD-0003IK-W2
	for lists+qemu-devel@lfdr.de; Wed, 17 Jul 2019 04:43:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50032)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <drjones@redhat.com>) id 1hnfWv-0002H5-TW
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 04:43:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1hnfWv-0005kC-2m
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 04:43:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57266)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1hnfWu-0005jc-Ta
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 04:43:17 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 314EE81F01;
 Wed, 17 Jul 2019 08:43:16 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C865019C68;
 Wed, 17 Jul 2019 08:43:14 +0000 (UTC)
Date: Wed, 17 Jul 2019 10:43:12 +0200
From: Andrew Jones <drjones@redhat.com>
To: "Zhang, Lei" <zhang.lei@jp.fujitsu.com>
Message-ID: <20190717084312.6n57fjqxw3552vjk@kamzik.brq.redhat.com>
References: <8898674D84E3B24BA3A2D289B872026A78BAAEAF@G01JPEXMBKW03>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8898674D84E3B24BA3A2D289B872026A78BAAEAF@G01JPEXMBKW03>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Wed, 17 Jul 2019 08:43:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 00/14] target/arm/kvm: enable SVE in
 guests
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
Cc: "Mizuma, Masayoshi" <masayoshi.mizuma@fujitsu.com>, "Okamoto,
 Takayuki" <tokamoto@jp.fujitsu.com>,
 "'qemu-devel@nongnu.org'" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 04, 2019 at 10:20:16AM +0000, Zhang, Lei wrote:
> Hi Andrew,
> 
> This patch series works fine for my use cases.
> Please feel free to add.
> 
>    Tested-by: Zhang, Lei <zhang.lei@jp.fujitsu.com>

Thank you, Lei.

> 
> I suppose v3 patches will be released. I'm looking forward to the v3 patches.

I'm starting to pull v3 together now.

Thanks,
drew

