Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A72D317F
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Oct 2019 21:41:37 +0200 (CEST)
Received: from localhost ([::1]:43668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIeJc-000257-AM
	for lists+qemu-devel@lfdr.de; Thu, 10 Oct 2019 15:41:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37343)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iIeIK-00016W-B5
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 15:40:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iIeIJ-0002Uj-9n
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 15:40:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52104)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1iIeIH-0002TU-3m; Thu, 10 Oct 2019 15:40:13 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 424613090FDD;
 Thu, 10 Oct 2019 19:40:12 +0000 (UTC)
Received: from [10.3.116.168] (ovpn-116-168.phx2.redhat.com [10.3.116.168])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C12F719D70;
 Thu, 10 Oct 2019 19:40:11 +0000 (UTC)
Subject: Re: [PATCH 16/23] iotests/205: Create socket in $SOCK_DIR
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20191010152457.17713-1-mreitz@redhat.com>
 <20191010152457.17713-17-mreitz@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <c9c6f49d-b3df-56cf-81f5-b700519162b3@redhat.com>
Date: Thu, 10 Oct 2019 14:40:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191010152457.17713-17-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Thu, 10 Oct 2019 19:40:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/10/19 10:24 AM, Max Reitz wrote:
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>   tests/qemu-iotests/205 | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

> diff --git a/tests/qemu-iotests/205 b/tests/qemu-iotests/205
> index 76f6c5fa2b..4bb2c21e8b 100755
> --- a/tests/qemu-iotests/205
> +++ b/tests/qemu-iotests/205
> @@ -24,7 +24,7 @@ import iotests
>   import time
>   from iotests import qemu_img_create, qemu_io, filter_qemu_io, QemuIoInteractive
>   
> -nbd_sock = os.path.join(iotests.test_dir, 'nbd_sock')
> +nbd_sock = os.path.join(iotests.sock_dir, 'nbd_sock')
>   nbd_uri = 'nbd+unix:///exp?socket=' + nbd_sock
>   disk = os.path.join(iotests.test_dir, 'disk')
>   
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

