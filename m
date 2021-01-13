Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 076422F5315
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 20:09:25 +0100 (CET)
Received: from localhost ([::1]:55458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzlWG-0003RR-0X
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 14:09:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kzlRb-0000rD-El
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 14:04:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kzlRZ-0006r0-L0
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 14:04:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610564672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EmcMexBsy6jtf/+1Gbz+uCl0cs0As0xqApF+F/C81e4=;
 b=R/9llGYcjQ+qTvrSYhQJWajY4j+8fp9DDBqceVDdbiD4rRyxdRhuqf/T1FUSL9SzAUpdvr
 XWEts8EsWUUQaSlE5ZriX/tHu4xkq69KJLTja43vFT6NWJu+Omh6xZa/ox4CqxBKZBymW8
 Xismr4QhrfSUCrQ9+A7KLaMlZNkR+vo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-XUzIsb6jP3WUJRtWti-ERQ-1; Wed, 13 Jan 2021 14:04:30 -0500
X-MC-Unique: XUzIsb6jP3WUJRtWti-ERQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9A2381461F;
 Wed, 13 Jan 2021 19:04:21 +0000 (UTC)
Received: from [10.3.113.36] (ovpn-113-36.phx2.redhat.com [10.3.113.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6861A5D9DD;
 Wed, 13 Jan 2021 19:04:21 +0000 (UTC)
Subject: Re: [PATCH v2 8/8] iotests/129: Clean up pylint and mypy complaints
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210113175752.403022-1-mreitz@redhat.com>
 <20210113175752.403022-9-mreitz@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <62ff3eb3-e063-8100-aa1d-b0a93e660a7d@redhat.com>
Date: Wed, 13 Jan 2021 13:04:20 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210113175752.403022-9-mreitz@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/13/21 11:57 AM, Max Reitz wrote:
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  tests/qemu-iotests/129     | 6 ++++--
>  tests/qemu-iotests/297     | 2 +-
>  tests/qemu-iotests/297.out | 1 +
>  3 files changed, 6 insertions(+), 3 deletions(-)
> 

Reviewed-by: Eric Blake <eblake@redhat.com>


> +++ b/tests/qemu-iotests/297
> @@ -32,7 +32,7 @@ fi
>  
>  # TODO: Empty this list!
>  skip_files=(
> -    030 040 041 044 045 055 056 057 065 093 096 118 124 129 132 136 139 147 148
> +    030 040 041 044 045 055 056 057 065 093 096 118 124 132 136 139 147 148
>      149 151 152 155 163 165 169 194 196 199 202 203 205 206 207 208 210 211 212
>      213 216 218 219 222 224 228 234 235 236 237 238 240 242 245 246 248 255 256

Ragged right end prior to justified lines looks odd, but it's cosmetic
and not fatal to the patch.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


