Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C732431563C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 19:46:02 +0100 (CET)
Received: from localhost ([::1]:39002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Y1R-0003YC-PJ
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 13:46:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l9Xu7-0007Qo-5J
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 13:38:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l9Xu3-0002NF-T8
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 13:38:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612895902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wv/Qb3ttmWQi7PQdGL1wD0wxk+Tgzdf6MTB+J+GYEUM=;
 b=dZ7ia7M2+QQ314g0YdRDp2kQoj3AfFb9nCfbkD5Lw+MuPZ2YzOCHgaR9oMJ4zj1R+JISYf
 GmQAJpXt3aKVD7Gb7P9Y/vYyCiDKCGfsD/6NDVVqcLj+wnMQ614NYqXEfLOjT9NaKHWcFF
 9/q7q2yoOcG7q7/IBdB5XMZIFgWQlc8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-hclpKfHiMXGLWfgqMfCBWg-1; Tue, 09 Feb 2021 13:38:19 -0500
X-MC-Unique: hclpKfHiMXGLWfgqMfCBWg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F6CB107ACC7;
 Tue,  9 Feb 2021 18:38:18 +0000 (UTC)
Received: from [10.3.114.150] (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F163B60CCD;
 Tue,  9 Feb 2021 18:38:17 +0000 (UTC)
Subject: Re: [PATCH] iotests/210: Fix reference output
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210209181923.497688-1-mreitz@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <75509aac-42e2-c42f-84c8-3fd424dc455a@redhat.com>
Date: Tue, 9 Feb 2021 12:38:16 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209181923.497688-1-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/21 12:19 PM, Max Reitz wrote:
> Commit 69b55e03f has changed an error message, adjust the reference
> output to account for it.
> 
> Fixes: 69b55e03f7e65a36eb954d0b7d4698b258df2708
>        ("block: refactor bdrv_check_request: add errp")
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---

Reviewed-by: Eric Blake <eblake@redhat.com>

I'm happy to queue this through my tree (since that's where the original
came through) if you don't beat me to it.


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


