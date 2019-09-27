Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2FFC0A16
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Sep 2019 19:16:12 +0200 (CEST)
Received: from localhost ([::1]:54154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDtqk-0005xg-CZ
	for lists+qemu-devel@lfdr.de; Fri, 27 Sep 2019 13:16:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48431)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iDtOj-0003uU-AV
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 12:47:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iDtOh-0000Ij-3G
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 12:47:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48080)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1iDtOb-0007rO-Ly; Fri, 27 Sep 2019 12:47:05 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2DF11898110;
 Fri, 27 Sep 2019 16:47:03 +0000 (UTC)
Received: from [10.3.116.249] (ovpn-116-249.phx2.redhat.com [10.3.116.249])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FFFE600CD;
 Fri, 27 Sep 2019 16:47:02 +0000 (UTC)
Subject: Re: [PATCH 2/4] qemu-iotests: remove forceful execution success from
 library files
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20190927141728.7137-1-crosa@redhat.com>
 <20190927141728.7137-3-crosa@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <0f7ccc53-9740-a689-ea5a-c86fe05d3d0f@redhat.com>
Date: Fri, 27 Sep 2019 11:47:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190927141728.7137-3-crosa@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Fri, 27 Sep 2019 16:47:03 +0000 (UTC)
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/27/19 9:17 AM, Cleber Rosa wrote:
> Should not be necessary on files that are not executed standalone.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   tests/qemu-iotests/common.config | 3 ---
>   tests/qemu-iotests/common.filter | 3 ---
>   tests/qemu-iotests/common.rc     | 3 ---
>   3 files changed, 9 deletions(-)
> 
> diff --git a/tests/qemu-iotests/common.config b/tests/qemu-iotests/common.config
> index 6956d38d4c..0a24d960ff 100644
> --- a/tests/qemu-iotests/common.config
> +++ b/tests/qemu-iotests/common.config
> @@ -34,6 +34,3 @@ _optstr_add()
>           echo "$2"
>       fi
>   }
> -
> -# make sure this script returns success
> -true

The exit status of the source command in the caller depends on the last 
command executed here.

However, you also have the point that if you delete this line, the last 
command executed is a function definition which is successful (for all 3 
files touched).  So there is no behavior change in dropping this line.

Reviewed-by: Eric Blake <eblake@redhat.com>


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

