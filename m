Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF33012570E
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 23:41:24 +0100 (CET)
Received: from localhost ([::1]:33536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihi0R-0000tn-PP
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 17:41:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59896)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1ihhzc-00005p-CA
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 17:40:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1ihhza-0007Gq-A8
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 17:40:31 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:37189)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1ihhza-0007FB-6n
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 17:40:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576708829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jnoG9Zi4DYLXOgmw8175XRqpA5zftBqV4pDo2CBWnMc=;
 b=bcChfioFdmDtu4pNtEajNa9ktgAcn8hVMGf3goUXw8fEtnHp+7gXren67cvyfOcl1twMv+
 /NizSsJOnsbtgjSPVm7GYAe1NmnTOZ2tPGnEm/9aQs9y62ZwujyKI3Z5dx3rvec/9tPNip
 P3Tu63Dh1s+Qd2l/uzJvt/fQ7ohl20s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-gFznrOZ5NvSY-iHGT0w12g-1; Wed, 18 Dec 2019 17:40:20 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13E488024CF;
 Wed, 18 Dec 2019 22:40:19 +0000 (UTC)
Received: from [10.3.116.171] (ovpn-116-171.phx2.redhat.com [10.3.116.171])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D92860BBA;
 Wed, 18 Dec 2019 22:40:18 +0000 (UTC)
Subject: Re: [PATCH] iotests: Add more "_require_drivers" checks to the
 shell-based tests
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>
References: <20191218161541.30769-1-thuth@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <8be4a7e4-4964-064b-91fe-03e24750c3a9@redhat.com>
Date: Wed, 18 Dec 2019 16:40:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191218161541.30769-1-thuth@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: gFznrOZ5NvSY-iHGT0w12g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/18/19 10:15 AM, Thomas Huth wrote:
> Test 051 should be skipped if nbd is not available, and 267 should
> be skipped if copy-on-read is not enabled.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/qemu-iotests/051 | 1 +
>   tests/qemu-iotests/267 | 1 +
>   2 files changed, 2 insertions(+)

Reviewed-by: Eric Blake <eblake@redhat.com>

> 
> diff --git a/tests/qemu-iotests/051 b/tests/qemu-iotests/051
> index 53bcdbc911..a13bce2fd0 100755
> --- a/tests/qemu-iotests/051
> +++ b/tests/qemu-iotests/051
> @@ -41,6 +41,7 @@ _supported_proto file
>   # A compat=0.10 image is created in this test which does not support anything
>   # other than refcount_bits=16
>   _unsupported_imgopts 'refcount_bits=\([^1]\|.\([^6]\|$\)\)'
> +_require_drivers nbd
>   
>   do_run_qemu()
>   {
> diff --git a/tests/qemu-iotests/267 b/tests/qemu-iotests/267
> index 17ac640a83..c1536f45b9 100755
> --- a/tests/qemu-iotests/267
> +++ b/tests/qemu-iotests/267
> @@ -40,6 +40,7 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
>   _supported_fmt qcow2
>   _supported_proto file
>   _supported_os Linux
> +_require_drivers copy-on-read
>   
>   # Internal snapshots are (currently) impossible with refcount_bits=1
>   _unsupported_imgopts 'refcount_bits=1[^0-9]'
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


