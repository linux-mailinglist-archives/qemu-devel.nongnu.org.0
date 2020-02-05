Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1173E15356B
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Feb 2020 17:41:37 +0100 (CET)
Received: from localhost ([::1]:52554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izNk7-0000gK-RS
	for lists+qemu-devel@lfdr.de; Wed, 05 Feb 2020 11:41:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43511)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1izNio-00082H-Ty
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 11:40:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1izNin-0001iw-D0
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 11:40:14 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:34284
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1izNin-0001Uw-6b
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 11:40:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580920812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d93s/pAEUsDg224bgENuVjn0OuVgdryCao8xuTYZ+cE=;
 b=ZsS78veUKcEfQSz7GTBWy5vUMa6qvHfecW1CWL7XEnAGmPpDTQFk9+5UlbWcPcu97HIf9w
 uHaclUdqaS0YcYQXLNe2helfcFyhQMxunk4kA/wsyYN4y1+Kd9T946o9F3BWRdNGAQe01C
 SKxuMbj6tC4p2mDsIy65Hs2Yfn0ndto=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-oYWy0BmkMVOesaJdOidRTg-1; Wed, 05 Feb 2020 11:40:09 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89EE88018A3;
 Wed,  5 Feb 2020 16:40:08 +0000 (UTC)
Received: from [10.3.116.181] (ovpn-116-181.phx2.redhat.com [10.3.116.181])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D4C329D52;
 Wed,  5 Feb 2020 16:40:01 +0000 (UTC)
Subject: Re: [PATCH] qemu-img: Place the '-i aio' option in alphabetical order
To: Julia Suvorova <jusual@redhat.com>, qemu-devel@nongnu.org
References: <20200205163008.204493-1-jusual@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <ed719cc3-22fa-59fb-1fbc-26c08381cc84@redhat.com>
Date: Wed, 5 Feb 2020 10:40:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200205163008.204493-1-jusual@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: oYWy0BmkMVOesaJdOidRTg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/5/20 10:30 AM, Julia Suvorova wrote:
> The '-i AIO' option was accidentally placed after '-n' and '-t'. Move it
> after '--flush-interval'.
> 
> Signed-off-by: Julia Suvorova <jusual@redhat.com>
> ---
>   docs/interop/qemu-img.rst | 8 ++++----
>   qemu-img-cmds.hx          | 4 ++--
>   2 files changed, 6 insertions(+), 6 deletions(-)
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


