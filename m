Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1AF1283EA
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Dec 2019 22:35:52 +0100 (CET)
Received: from localhost ([::1]:33774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iiPw7-00069U-BZ
	for lists+qemu-devel@lfdr.de; Fri, 20 Dec 2019 16:35:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50740)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iiPvF-0005et-9E
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 16:34:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iiPvE-00011x-2J
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 16:34:56 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:49588
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1iiPvD-0000yP-UH
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 16:34:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576877695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1JTpVRvfBK2ZL/MxsgEHQJAOMRYYUAAMQpkHlbBioS4=;
 b=EqtwzaN9H6CkWuUtpPzhnzzLLwXUuMjfp3LzPBD3vYlGqTh70GgkXqmy/jCBE4Wj6jqxPL
 DS7Ckcj24emPDrwOr3usUS5yYNQ4tWn1XZRsRWeUfT/Dhs7Coohqca1zQ0JIBMRzGH/Y1L
 tZ4rQ2rwn6CdE+6Doq8Kk+8k0f6N+8U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-f5DfyAD7P2eff1H3qGeobQ-1; Fri, 20 Dec 2019 16:34:50 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3869800053;
 Fri, 20 Dec 2019 21:34:49 +0000 (UTC)
Received: from [10.3.116.246] (ovpn-116-246.phx2.redhat.com [10.3.116.246])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 66BBE60C18;
 Fri, 20 Dec 2019 21:34:49 +0000 (UTC)
Subject: Re: [PATCH 2/2] iotests: Fix IMGOPTSSYNTAX for nbd
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20191218104855.42566-1-mreitz@redhat.com>
 <20191218104855.42566-3-mreitz@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <ad3c2e62-15f6-2eba-9429-532cf1ba0b31@redhat.com>
Date: Fri, 20 Dec 2019 15:34:48 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191218104855.42566-3-mreitz@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: f5DfyAD7P2eff1H3qGeobQ-1
X-Mimecast-Spam-Score: 0
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

On 12/18/19 4:48 AM, Max Reitz wrote:
> There is no $SOCKDIR, only $SOCK_DIR.
> 
> Fixes: f3923a72f199b2c63747a7032db74730546f55c6
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>   tests/qemu-iotests/common.rc | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Whoops.  Thanks for the fix.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


