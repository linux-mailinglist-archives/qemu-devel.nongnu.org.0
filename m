Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 970092147A1
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jul 2020 19:12:33 +0200 (CEST)
Received: from localhost ([::1]:38812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrliK-0005Uv-K2
	for lists+qemu-devel@lfdr.de; Sat, 04 Jul 2020 13:12:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jrlhQ-0004Rn-Ky
 for qemu-devel@nongnu.org; Sat, 04 Jul 2020 13:11:36 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:42015
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jrlhO-0003bj-8N
 for qemu-devel@nongnu.org; Sat, 04 Jul 2020 13:11:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593882692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=kGHTDKYwuocdZQnmGcCWU087nsJEhOJksd2uaZE7itQ=;
 b=SCG5/PAYNhMYslxh2mYU5dauU3bLIq0BagekmzqSz+MM9I+/GMhNLXAQYZlKwlYlwXXSem
 1YeD+fdjrTq+Q6T/WpK01mKBlLYB3r8wCjJYczsHHEC2ZrMAQYlXMG7kqCkgYNJu8TW6cH
 gT1NefybdHEoZ7IqAU2seAXNwgh71KA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-cBwVxyXHMUyn2TPbHoImsQ-1; Sat, 04 Jul 2020 13:11:29 -0400
X-MC-Unique: cBwVxyXHMUyn2TPbHoImsQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB8B0800400;
 Sat,  4 Jul 2020 17:11:27 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-37.ams2.redhat.com [10.36.112.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F036C0DA8;
 Sat,  4 Jul 2020 17:11:26 +0000 (UTC)
Subject: Re: [PATCH] net/tap-solaris.c: Include qemu-common.h for TFR macro
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20200704092317.12943-1-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <c247fc94-f8f7-efe1-017f-fc1c03fee811@redhat.com>
Date: Sat, 4 Jul 2020 19:11:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200704092317.12943-1-peter.maydell@linaro.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/04 08:57:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Michele Denber <denber@mindspring.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/07/2020 11.23, Peter Maydell wrote:
> In commit a8d2532645cf5ce4 we cleaned up usage of the qemu-common.h header
> so that it was always included from .c files and never from other .h files.
> We missed adding it to net/tap-solaris.c (which previously was pulling it
> in via tap-int.h), which broke building on Solaris hosts.
> 
> Fixes: a8d2532645cf5ce4
> Reported-by: Michele Denber <denber@mindspring.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Untested: Michele, could you give this a try?
> ---
>  net/tap-solaris.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/net/tap-solaris.c b/net/tap-solaris.c
> index 4725d2314ee..d03165c57c9 100644
> --- a/net/tap-solaris.c
> +++ b/net/tap-solaris.c
> @@ -27,6 +27,7 @@
>  #include "tap_int.h"
>  #include "qemu/ctype.h"
>  #include "qemu/cutils.h"
> +#include "qemu-common.h"
>  
>  #include <sys/ethernet.h>
>  #include <sys/sockio.h>
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


