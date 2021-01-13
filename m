Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 777AE2F54F5
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 23:39:34 +0100 (CET)
Received: from localhost ([::1]:59798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzond-0006Xr-I9
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 17:39:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kzomK-0005bl-L3
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 17:38:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kzomJ-0003CY-34
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 17:38:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610577490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xeOFKmkAL4uoZzeiqacoUj8UM2mZ4VYl0CwauPAjLbg=;
 b=erV8dAQSShCpN87vBNNcGV77gEDaI1P6NH3yziYRkoW6hYCHEE1lSFBaL6jSk5yL6qsVB7
 FxZcRx2LusCoRAGjn4P3OIQf7nJvf41GfEe5sPbnt5axVZGq3Xjsc1fol5n66nlUZGGWCa
 aDlkoQQvYdyKW0MLJ+qek78sFWlUbwc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-1GZUK9NZORKkZ97q6lNb5w-1; Wed, 13 Jan 2021 17:38:07 -0500
X-MC-Unique: 1GZUK9NZORKkZ97q6lNb5w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0503107ACF8;
 Wed, 13 Jan 2021 22:38:06 +0000 (UTC)
Received: from [10.3.113.36] (ovpn-113-36.phx2.redhat.com [10.3.113.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AA1CE5D71D;
 Wed, 13 Jan 2021 22:38:03 +0000 (UTC)
Subject: Re: [PATCH v6 02/11] iotests/303: use dot slash for qcow2.py running
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210109122631.167314-1-vsementsov@virtuozzo.com>
 <20210109122631.167314-3-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <ab146bc7-a018-095b-5c57-ece919606e08@redhat.com>
Date: Wed, 13 Jan 2021 16:38:03 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210109122631.167314-3-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: kwolf@redhat.com, den@openvz.org, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/9/21 6:26 AM, Vladimir Sementsov-Ogievskiy wrote:
> If you run './check 303', check includes common.config which adjusts
> $PATH to include '.' first, and therefore finds qcow2.py on PATH.  But
> if you run './303' directly, there is nothing to adjust PATH, and if
> '.' is not already on your PATH by other means, the test fails because
> the executable is not found.  Adjust how we invoke the helper
> executable to avoid needing a PATH search in the first place.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  tests/qemu-iotests/303 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

> 
> diff --git a/tests/qemu-iotests/303 b/tests/qemu-iotests/303
> index 6c21774483..11cd9eeb26 100755
> --- a/tests/qemu-iotests/303
> +++ b/tests/qemu-iotests/303
> @@ -56,7 +56,7 @@ qemu_img_create('-f', iotests.imgfmt, disk, '10M')
>  
>  add_bitmap(1, 0, 6, False)
>  add_bitmap(2, 6, 8, True)
> -dump = ['qcow2.py', disk, 'dump-header']
> +dump = ['./qcow2.py', disk, 'dump-header']
>  subprocess.run(dump)
>  # Dump the metadata in JSON format
>  dump.append('-j')
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


