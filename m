Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B429241B6D
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Aug 2020 15:11:38 +0200 (CEST)
Received: from localhost ([::1]:33252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5U41-00039o-F5
	for lists+qemu-devel@lfdr.de; Tue, 11 Aug 2020 09:11:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1k5U2X-0001vq-KA
 for qemu-devel@nongnu.org; Tue, 11 Aug 2020 09:10:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1k5U2V-0001iK-Ch
 for qemu-devel@nongnu.org; Tue, 11 Aug 2020 09:10:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597151401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CGFyH7xIbBxnMosSKnKfRh/1qHgZocU9V1EPbgd2oAk=;
 b=d36gA3ho2U3SUK1RzRp1uafPSvvxpO2XTuZQWMxhAx3tBMFmrhMSDXt6fkXj4HtnYDLedA
 ikUNLtLgu+jKjCGXFlhFWHeNWQVINcr9shZzf4KRMU/wTCPp33FOgGSuQd8aQCXpMnpKkd
 d+WIIh+62TB8uTM13EaAKuGNwa8dnEQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-1hfP_V6iNLKMbTurU7kF-w-1; Tue, 11 Aug 2020 09:09:57 -0400
X-MC-Unique: 1hfP_V6iNLKMbTurU7kF-w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D23357;
 Tue, 11 Aug 2020 13:09:55 +0000 (UTC)
Received: from [10.3.112.157] (ovpn-112-157.phx2.redhat.com [10.3.112.157])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DA87E6931C;
 Tue, 11 Aug 2020 13:09:54 +0000 (UTC)
Subject: Re: [PATCH] iotests/259: Fix reference output
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20200811080830.289136-1-mreitz@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <659e7732-f97f-da3a-c4c5-1832921ff2a8@redhat.com>
Date: Tue, 11 Aug 2020 08:09:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200811080830.289136-1-mreitz@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/11 05:47:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/11/20 3:08 AM, Max Reitz wrote:
> The error message has changed recently, breaking the test.  Fix it.
> 
> Fixes: a2b333c01880f56056d50c238834d62e32001e54
>         ("block: nbd: Fix convert qcow2 compressed to nbd")
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>   tests/qemu-iotests/259.out | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

I'm happy to let this go through your iotests tree, or I can queue it 
through my NBD tree, whichever gets a 5.2 pull request first.  (Fixing 
it for -rc4 does not seem justified, even though it is annoying to have 
a release with the test broken)

> 
> diff --git a/tests/qemu-iotests/259.out b/tests/qemu-iotests/259.out
> index e27b9ff38d..1aaadfda4e 100644
> --- a/tests/qemu-iotests/259.out
> +++ b/tests/qemu-iotests/259.out
> @@ -10,5 +10,5 @@ disk size: unavailable
>   
>   --- Testing creation for which the node would need to grow ---
>   Formatting 'TEST_DIR/t.IMGFMT', fmt=qcow2 size=67108864 preallocation=metadata
> -qemu-img: TEST_DIR/t.IMGFMT: Could not resize image: Image format driver does not support resize
> +qemu-img: TEST_DIR/t.IMGFMT: Could not resize image: Cannot grow NBD nodes
>   *** done
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


