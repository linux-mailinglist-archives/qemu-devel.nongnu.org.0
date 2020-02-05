Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D2A153AEA
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Feb 2020 23:24:55 +0100 (CET)
Received: from localhost ([::1]:57694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izT6M-0006uY-CM
	for lists+qemu-devel@lfdr.de; Wed, 05 Feb 2020 17:24:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47680)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1izT5W-0006QO-MS
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 17:24:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1izT5V-0005gU-On
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 17:24:02 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:46799
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1izT5V-0005ey-L1
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 17:24:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580941441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vV/+Is+xjv+g8bJqK/HavixW/X96PGTBiTMLG9Z0rf8=;
 b=Dg8wdQlHG4rGPTtL9o8Geyd3za+987n7cflygLuL2IBmOaEHE+oOgsQhE6zwb5pIuRj6vY
 zkJScpszQPcM/7RxV79klkk5lkJZuQzU4DUckWqdbLp1Xy4AWHL0hnP4X34smsH0/lyN+r
 wAhwR057q/Bwr91p/p9RYY4ds0BpEGw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-7ne8X5hHPymT-xRPax0WGA-1; Wed, 05 Feb 2020 17:23:57 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71AE18010E6;
 Wed,  5 Feb 2020 22:23:56 +0000 (UTC)
Received: from [10.3.116.181] (ovpn-116-181.phx2.redhat.com [10.3.116.181])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5202860BF7;
 Wed,  5 Feb 2020 22:23:50 +0000 (UTC)
Subject: Re: [PATCH 1/5] ui: add show-cursor option
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20200205110356.3491-1-kraxel@redhat.com>
 <20200205110356.3491-2-kraxel@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <cc184d03-1dff-6b41-19e9-f009d02ab1e9@redhat.com>
Date: Wed, 5 Feb 2020 16:23:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200205110356.3491-2-kraxel@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 7ne8X5hHPymT-xRPax0WGA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: libvir-list@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, jpewhacker@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/5/20 5:03 AM, Gerd Hoffmann wrote:
> When enabled forces showing a the mouse cursor, i.e. do

When enabled, this forces showing the mouse...

> nowallow the guest to hide it.  Defaults to off.

s/nowallow/not allow/

> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   qapi/ui.json | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/qapi/ui.json b/qapi/ui.json
> index e04525d8b44b..7c516a455631 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -1144,6 +1144,7 @@
>   # @type:          Which DisplayType qemu should use.
>   # @full-screen:   Start user interface in fullscreen mode (default: off).
>   # @window-close:  Allow to quit qemu with window close button (default: on).
> +# @show-cursor:   Force showing the mouse cursor (default: off).
>   # @gl:            Enable OpenGL support (default: off).
>   #
>   # Since: 2.12

Missing a '(since 5.0)' tag.

> @@ -1153,6 +1154,7 @@
>     'base'    : { 'type'           : 'DisplayType',
>                   '*full-screen'   : 'bool',
>                   '*window-close'  : 'bool',
> +                '*show-cursor'   : 'bool',
>                   '*gl'            : 'DisplayGLMode' },
>     'discriminator' : 'type',
>     'data'    : { 'gtk'            : 'DisplayGTK',
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


