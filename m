Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BC2140BCE
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jan 2020 14:57:10 +0100 (CET)
Received: from localhost ([::1]:57800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isS7Z-0003Db-GK
	for lists+qemu-devel@lfdr.de; Fri, 17 Jan 2020 08:57:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52114)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1isS5K-00012B-Vj
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 08:54:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1isS5J-00013J-8B
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 08:54:50 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:43737
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1isS5J-00012z-3m
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 08:54:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579269288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ixvJxMKxkXEKnEUvCk+4m2mZ1rVuJqqgoYqOgJ41Ylo=;
 b=fQKOEUUsXOj15jeX8CWOwYG13UcXBTzTmWo+DL0wGpP9cqrXCKEYGPP16baW9dgGyKfFP4
 ahe8aO+a+sWLSjRzCtu4i/Ig82dCHAoqxoXYr4F4jRJGLdccjcmWrmcl4XPGZtJ+jyuein
 MMpq9CMfq4fet22f8lSeMYV50yG3rNw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-dETlyerBOLq9uhSeIe-_cg-1; Fri, 17 Jan 2020 08:54:47 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 680C7185432D;
 Fri, 17 Jan 2020 13:54:46 +0000 (UTC)
Received: from [10.3.117.16] (ovpn-117-16.phx2.redhat.com [10.3.117.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F2F15DA76;
 Fri, 17 Jan 2020 13:54:45 +0000 (UTC)
Subject: Re: [PATCH 2/2] iotests: Test snapshot -l field separation
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20200117105859.241818-1-mreitz@redhat.com>
 <20200117105859.241818-3-mreitz@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <3d082b5a-fc94-1370-a6f1-3acd27a73f5c@redhat.com>
Date: Fri, 17 Jan 2020 07:54:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200117105859.241818-3-mreitz@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: dETlyerBOLq9uhSeIe-_cg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/17/20 4:58 AM, Max Reitz wrote:
> Add a test that all fields in "qemu-img snapshot -l"s output are
> separated by spaces.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>   tests/qemu-iotests/284     | 76 ++++++++++++++++++++++++++++++++++++++
>   tests/qemu-iotests/284.out |  8 ++++
>   tests/qemu-iotests/group   |  1 +
>   3 files changed, 85 insertions(+)
>   create mode 100755 tests/qemu-iotests/284
>   create mode 100644 tests/qemu-iotests/284.out
> 

> +# Check that all fields are separated by spaces.
> +# We first collapse all space sequences into one space each;
> +# then we turn every space-separated field into a '.';
> +# and finally, we name the '.'s so the output is not just a confusing
> +# sequence of dots.
> +
> +echo 'Output structure:'
> +$QEMU_IMG snapshot -l "$TEST_IMG" | tail -n 1 | tr -s ' ' \
> +    | sed -e 's/\S\+/./g' \
> +    | sed -e 's/\./(snapshot ID)/' \
> +          -e 's/\./(snapshot name)/' \
> +          -e 's/\./(VM state size value)/' \
> +          -e 's/\./(VM state size unit)/' \
> +          -e 's/\./(snapshot date)/' \
> +          -e 's/\./(snapshot time)/' \
> +          -e 's/\./(VM clock)/'

Cute conversion.  If you had picked some other character (like 
s/\S\+/=/g), you wouldn't have to use \. everywhere in the second sed, 
for less typing, but that's aesthetic, so no need to change if you don't 
want.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


