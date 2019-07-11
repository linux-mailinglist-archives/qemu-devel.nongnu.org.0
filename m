Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E716586D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jul 2019 16:05:31 +0200 (CEST)
Received: from localhost ([::1]:42048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlZhR-0006Sv-Gg
	for lists+qemu-devel@lfdr.de; Thu, 11 Jul 2019 10:05:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54549)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mlevitsk@redhat.com>) id 1hlZgc-0005sZ-CZ
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 10:04:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1hlZgb-0006qH-FI
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 10:04:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36538)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>)
 id 1hlZgZ-0006k1-5k; Thu, 11 Jul 2019 10:04:35 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B40D9C057F2B;
 Thu, 11 Jul 2019 14:04:32 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C450219C69;
 Thu, 11 Jul 2019 14:04:30 +0000 (UTC)
Message-ID: <38e9c521f0b05b247df86c008dbcfa999a9b479e.camel@redhat.com>
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Date: Thu, 11 Jul 2019 17:04:29 +0300
In-Reply-To: <20190711132935.13070-1-mreitz@redhat.com>
References: <20190711132935.13070-1-mreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Thu, 11 Jul 2019 14:04:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] doc: Preallocation does not require
 writing zeroes
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "Daniel P . =?ISO-8859-1?Q?Berrang=E9?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2019-07-11 at 15:29 +0200, Max Reitz wrote:
> When preallocating an encrypted qcow2 image, it just lets the protocol
> driver write data and then does not mark the clusters as zero.
> Therefore, reading this image will yield effectively random data.
> 
> As such, we have not fulfilled the promise of always writing zeroes when
> preallocating an image in a while.  It seems that nobody has really
> cared, so change the documentation to conform to qemu's actual behavior.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>

I did a little grep on qemu source tree with mentions of preallocation, 
and it looks like these are the only mentions that need to be fixed.
So, thank you very much, and

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky


