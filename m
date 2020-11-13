Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E29F2B161C
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 07:59:58 +0100 (CET)
Received: from localhost ([::1]:42374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdT3t-0002o3-NK
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 01:59:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kdT0Z-0008Lb-95
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 01:56:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kdT0T-0007d8-UD
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 01:56:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605250585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7PZwfNpjBRmINi/Xl6iedrvZvcUUBqTeghzOW/hui0c=;
 b=Fg6Iq7nqvjm4PXxl1ix6bY+W8XnbVfUbg97VS0wPHMUq2tGey+mPBb6qeYqPs+VzOqgxev
 +Ip1Q/PmHqGghGBdmtS6yeomUBohjI1GYdP9mD5Sj9yPm+F7vhbYIAzI4pzOETm5ewviLr
 +UkIDPaqDWdPvrvRvbVXqZYm8VNFtS8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-cQ4bidU7PQSFQ8L6CKU2iA-1; Fri, 13 Nov 2020 01:56:22 -0500
X-MC-Unique: cQ4bidU7PQSFQ8L6CKU2iA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B34BC427C2;
 Fri, 13 Nov 2020 06:56:21 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-177.ams2.redhat.com [10.36.112.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 446B35D9E8;
 Fri, 13 Nov 2020 06:56:20 +0000 (UTC)
Subject: Re: [PATCH 28/30] e1000e: Fix Lesser GPL version number
To: Chetan Pant <chetan4windows@gmail.com>, qemu-trivial@nongnu.org
References: <20201014134248.14146-1-chetan4windows@gmail.com>
 <20201023124134.20083-1-chetan4windows@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <21f4907e-cfc3-1b65-f1c9-a731aa0d7473@redhat.com>
Date: Fri, 13 Nov 2020 07:56:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201023124134.20083-1-chetan4windows@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 16:09:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, dmitry.fleytman@gmail.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/10/2020 14.41, Chetan Pant wrote:
> There is no "version 2" of the "Lesser" General Public License.
> It is either "GPL version 2.0" or "Lesser GPL version 2.1".
> This patch replaces all occurrences of "Lesser GPL version 2" with
> "Lesser GPL version 2.1" in comment section.
> 
> Signed-off-by: Chetan Pant <chetan4windows@gmail.com>
> ---
>  hw/net/e1000e.c        | 2 +-
>  hw/net/e1000e_core.c   | 2 +-
>  hw/net/e1000e_core.h   | 2 +-
>  hw/net/e1000x_common.c | 2 +-
>  hw/net/e1000x_common.h | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
> index b6f1ae3..a8a77ec 100644
> --- a/hw/net/e1000e.c
> +++ b/hw/net/e1000e.c
> @@ -22,7 +22,7 @@
>  * This library is free software; you can redistribute it and/or
>  * modify it under the terms of the GNU Lesser General Public
>  * License as published by the Free Software Foundation; either
> -* version 2 of the License, or (at your option) any later version.
> +* version 2.1 of the License, or (at your option) any later version.
>  *
>  * This library is distributed in the hope that it will be useful,
>  * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
> index bcfd466..d8b9e4b 100644
> --- a/hw/net/e1000e_core.c
> +++ b/hw/net/e1000e_core.c
> @@ -22,7 +22,7 @@
>  * This library is free software; you can redistribute it and/or
>  * modify it under the terms of the GNU Lesser General Public
>  * License as published by the Free Software Foundation; either
> -* version 2 of the License, or (at your option) any later version.
> +* version 2.1 of the License, or (at your option) any later version.
>  *
>  * This library is distributed in the hope that it will be useful,
>  * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/hw/net/e1000e_core.h b/hw/net/e1000e_core.h
> index aee32f7..4ddb4d2 100644
> --- a/hw/net/e1000e_core.h
> +++ b/hw/net/e1000e_core.h
> @@ -22,7 +22,7 @@
>  * This library is free software; you can redistribute it and/or
>  * modify it under the terms of the GNU Lesser General Public
>  * License as published by the Free Software Foundation; either
> -* version 2 of the License, or (at your option) any later version.
> +* version 2.1 of the License, or (at your option) any later version.
>  *
>  * This library is distributed in the hope that it will be useful,
>  * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/hw/net/e1000x_common.c b/hw/net/e1000x_common.c
> index 717f9df..a8d9387 100644
> --- a/hw/net/e1000x_common.c
> +++ b/hw/net/e1000x_common.c
> @@ -11,7 +11,7 @@
>  * This library is free software; you can redistribute it and/or
>  * modify it under the terms of the GNU Lesser General Public
>  * License as published by the Free Software Foundation; either
> -* version 2 of the License, or (at your option) any later version.
> +* version 2.1 of the License, or (at your option) any later version.
>  *
>  * This library is distributed in the hope that it will be useful,
>  * but WITHOUT ANY WARRANTY; without even the implied warranty of
> diff --git a/hw/net/e1000x_common.h b/hw/net/e1000x_common.h
> index 19c56f4..b774277 100644
> --- a/hw/net/e1000x_common.h
> +++ b/hw/net/e1000x_common.h
> @@ -11,7 +11,7 @@
>  * This library is free software; you can redistribute it and/or
>  * modify it under the terms of the GNU Lesser General Public
>  * License as published by the Free Software Foundation; either
> -* version 2 of the License, or (at your option) any later version.
> +* version 2.1 of the License, or (at your option) any later version.
>  *
>  * This library is distributed in the hope that it will be useful,
>  * but WITHOUT ANY WARRANTY; without even the implied warranty of
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


