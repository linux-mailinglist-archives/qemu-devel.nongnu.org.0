Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C42641545A7
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 15:01:50 +0100 (CET)
Received: from localhost ([::1]:39584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izhj3-0004BM-PU
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 09:01:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41785)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1izhhk-0000ha-9r
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 09:00:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1izhhh-0005Ki-9D
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 09:00:28 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:47338
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1izhhg-0005Hv-Bm
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 09:00:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580997623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=93DB0TtzOdLgJ6zrs3eEihgwuURX8VI6+i2CexRtYKQ=;
 b=foB8Pq+6B27Y91sHJ8b8mwLrd5bzqlf+JZO0AUK63JhLpZdsAz7RY/hZvgMkxIjJjTcJbv
 EFZ+8KweOT1zrOG10vmXy1e0MVmbfNUAHc3x3ctlXjRdi0MkPO7E+cIlTagPEjjXwDhjww
 xOhe1uKl7WmZ0mtVMj+SvddML4lILFc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-NgKKDvZYPymhUrRffyO3GA-1; Thu, 06 Feb 2020 09:00:13 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9EFCE18FE888;
 Thu,  6 Feb 2020 14:00:12 +0000 (UTC)
Received: from [10.3.116.166] (ovpn-116-166.phx2.redhat.com [10.3.116.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A77F31BC6D;
 Thu,  6 Feb 2020 14:00:08 +0000 (UTC)
Subject: Re: [PATCH] iotests/147: Fix drive parameters
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20200206130812.612960-1-mreitz@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <a9d9e3e2-5edc-6873-2e1c-6a8dbac35eb1@redhat.com>
Date: Thu, 6 Feb 2020 08:00:08 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200206130812.612960-1-mreitz@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: NgKKDvZYPymhUrRffyO3GA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/6/20 7:08 AM, Max Reitz wrote:
> 8dff69b94 added an aio parameter to the drive parameter but forgot to
> add a comma before, thus breaking the test.  Fix it again.
> 
> Fixes: 8dff69b9415b4287e900358744b732195e1ab2e2
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>   tests/qemu-iotests/147 | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Aha - that's what my bisect just landed on.  And what's worse, the 
breakage leaves behind orphaned qemu processes (four per failed test).

Reviewed-by: Eric Blake <eblake@redhat.com>
Tested-by: Eric Blake <eblake@redhat.com>

(I would have included it in my NBD pull request, except I sent that 
just minutes before this email arrived, and I'm not sure when my next 
pull request will be...)

> 
> diff --git a/tests/qemu-iotests/147 b/tests/qemu-iotests/147
> index 2b6f859a09..30782b8924 100755
> --- a/tests/qemu-iotests/147
> +++ b/tests/qemu-iotests/147
> @@ -134,7 +134,7 @@ class BuiltinNBD(NBDBlockdevAddBase):
>           self.server.add_drive_raw('if=none,id=nbd-export,' +
>                                     'file=%s,' % test_img +
>                                     'format=%s,' % imgfmt +
> -                                  'cache=%s' % cachemode +
> +                                  'cache=%s,' % cachemode +
>                                     'aio=%s' % aiomode)
>           self.server.launch()
>   
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


