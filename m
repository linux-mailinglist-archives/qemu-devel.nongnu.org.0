Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91194D3162
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Oct 2019 21:30:01 +0200 (CEST)
Received: from localhost ([::1]:43532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIe8O-0003k8-Hf
	for lists+qemu-devel@lfdr.de; Thu, 10 Oct 2019 15:30:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35651)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iIe6s-0002AO-LE
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 15:28:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iIe6r-000461-OB
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 15:28:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36524)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1iIe6n-00044y-Gt; Thu, 10 Oct 2019 15:28:21 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BCE8B800DF2;
 Thu, 10 Oct 2019 19:28:20 +0000 (UTC)
Received: from [10.3.116.168] (ovpn-116-168.phx2.redhat.com [10.3.116.168])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 032DC60466;
 Thu, 10 Oct 2019 19:28:19 +0000 (UTC)
Subject: Re: [PATCH 12/23] iotests/183: Create socket in $SOCK_DIR
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20191010152457.17713-1-mreitz@redhat.com>
 <20191010152457.17713-13-mreitz@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <4c30702b-c6f9-390d-f713-8f1dd0db4b45@redhat.com>
Date: Thu, 10 Oct 2019 14:28:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191010152457.17713-13-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Thu, 10 Oct 2019 19:28:20 +0000 (UTC)
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
>   tests/qemu-iotests/183 | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

> diff --git a/tests/qemu-iotests/183 b/tests/qemu-iotests/183
> index 04fb344d08..bced83fae0 100755
> --- a/tests/qemu-iotests/183
> +++ b/tests/qemu-iotests/183
> @@ -26,7 +26,7 @@ echo "QA output created by $seq"
>   
>   status=1 # failure is the default!
>   
> -MIG_SOCKET="${TEST_DIR}/migrate"
> +MIG_SOCKET="${SOCK_DIR}/migrate"
>   
>   _cleanup()
>   {
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

