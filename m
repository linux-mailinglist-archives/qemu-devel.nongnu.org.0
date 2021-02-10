Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A843169B5
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 16:04:56 +0100 (CET)
Received: from localhost ([::1]:54864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9r30-0001YY-JQ
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 10:04:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l9r24-00012O-En
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 10:03:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l9r20-0006b2-6z
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 10:03:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612969431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MPifrD6LFgn/I5/b81bWtOhY82ZQBjYD1W7xRsFJlcE=;
 b=b3lVtvJwN0LGlOo5NDJFTwu/MWlIdPf9rt4tth86kEDPQApoBwwHkz6iUj/G07u51zUTbm
 8VfuocGgPlViWLR17ZvgkPAnLxyQp5ofgucmGVXJAruSkDAUr0+HmDlsHpxdGKrrsz39E1
 VkSMo+JPwWyfl2+k/l9/7jlMqBhkq+o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-IsFFhTb_M7ekuXUlb4sHEQ-1; Wed, 10 Feb 2021 10:03:43 -0500
X-MC-Unique: IsFFhTb_M7ekuXUlb4sHEQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 796A0593B1;
 Wed, 10 Feb 2021 15:03:42 +0000 (UTC)
Received: from [10.3.114.150] (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D14605D9D0;
 Wed, 10 Feb 2021 15:03:41 +0000 (UTC)
Subject: Re: [PATCH] iotests: Consistent $IMGOPTS boundary matching
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210210095128.22732-1-mreitz@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <38cd02af-e462-4411-e201-1c9aa11ec848@redhat.com>
Date: Wed, 10 Feb 2021 09:03:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210210095128.22732-1-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.211, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

On 2/10/21 3:51 AM, Max Reitz wrote:
> To disallow certain refcount_bits values, some _unsupported_imgopts
> invocations look like "refcount_bits=1[^0-9]", i.e. they match an
> integer boundary with [^0-9].  This expression does not match the end of
> the string, though, so it breaks down when refcount_bits is the last
> option (which it tends to be after the rewrite of the check script in
> Python).
> 
> Those invocations could use \b or \> instead, but those are not
> portable.  They could use something like \([^0-9]\|$\), but that would
> be cumbersome.  To make it simple and keep the existing invocations
> working, just let _unsupported_imgopts match the regex against $IMGOPTS
> plus a trailing space.
> 
> Suggested-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
> Supersedes "iotests: Fix unsupported_imgopts for refcount_bits", and can
> be reproduced in the same way:
> 
> $ ./check -qcow2 -o refcount_bits=1 7 15 29 58 62 66 68 80
> 
> (those tests should be skipped)
> ---
>  tests/qemu-iotests/common.rc | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Much smaller fix ;)

Reviewed-by: Eric Blake <eblake@redhat.com>

> 
> diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
> index 77c37e8312..65cdba5723 100644
> --- a/tests/qemu-iotests/common.rc
> +++ b/tests/qemu-iotests/common.rc
> @@ -885,7 +885,9 @@ _unsupported_imgopts()
>  {
>      for bad_opt
>      do
> -        if echo "$IMGOPTS" | grep -q 2>/dev/null "$bad_opt"
> +        # Add a space so tests can match for whitespace that marks the
> +        # end of an option (\b or \> are not portable)
> +        if echo "$IMGOPTS " | grep -q 2>/dev/null "$bad_opt"
>          then
>              _notrun "not suitable for image option: $bad_opt"
>          fi
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


