Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D2314BDAD
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jan 2020 17:27:48 +0100 (CET)
Received: from localhost ([::1]:32912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwTiN-0005yN-4F
	for lists+qemu-devel@lfdr.de; Tue, 28 Jan 2020 11:27:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53454)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iwTh9-00053k-6S
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 11:26:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iwTh7-0000TW-Ha
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 11:26:30 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:55213
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1iwTh7-0000SE-Bl
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 11:26:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580228788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EadSVipwQyUKzAO8SdueQSxClet7y11i6mVil73ghvA=;
 b=AggQ8HA8VnFwiaBshHciCp85fwzF31tRxwlXbREREImCIfmC/EYwlMFYhWLJh/XQFaHoHZ
 kGNTX7omSf0OM48dwHBxC4nolpk5uCvLvgrRAc1eJAi2H8JyL6ngLVkXBVf6DhlezjrT7B
 5dyVF0GEFFz2uFMfW3Ku0qnu5GLCQUk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-72XIH4ucM5eBew787V-rMg-1; Tue, 28 Jan 2020 11:26:10 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 487718C05D3;
 Tue, 28 Jan 2020 16:26:09 +0000 (UTC)
Received: from [10.3.117.16] (ovpn-117-16.phx2.redhat.com [10.3.117.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B1A2984BC4;
 Tue, 28 Jan 2020 16:26:05 +0000 (UTC)
Subject: Re: [PATCH 1/2] mirror: Store MirrorOp.co for debuggability
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20200128151755.25162-1-kwolf@redhat.com>
 <20200128151755.25162-2-kwolf@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <075e467e-33cf-1065-5d7e-e22047c7d102@redhat.com>
Date: Tue, 28 Jan 2020 10:26:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200128151755.25162-2-kwolf@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 72XIH4ucM5eBew787V-rMg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.81
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/28/20 9:17 AM, Kevin Wolf wrote:
> If a coroutine is launched, but the coroutine pointer isn't stored
> anywhere, debugging any problems inside the coroutine is quite hard.
> Let's store the coroutine pointer of a mirror operation in MirrorOp to
> have it available in the debugger.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   block/mirror.c | 2 ++
>   1 file changed, 2 insertions(+)

Doesn't change semantics other than an unobservable performance delay; 
but the rewards in improved debugability warrant it.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


