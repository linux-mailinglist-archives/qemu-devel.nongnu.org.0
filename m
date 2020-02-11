Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F65C158D32
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Feb 2020 12:08:11 +0100 (CET)
Received: from localhost ([::1]:47872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1TOj-0004Ae-T1
	for lists+qemu-devel@lfdr.de; Tue, 11 Feb 2020 06:08:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40125)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1j1TNe-0003WW-Bz
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 06:07:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1j1TNc-0003Yp-Fp
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 06:07:01 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:45619
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1j1TNc-0003Wt-C2
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 06:07:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581419219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=v/AxO3U4DbQkb5lERfD2KADAqkDhwUydyw9DTcxHZB8=;
 b=W/neRcEvYPHTAvZJBVa+UJSYSrbJEyj0jjeh8N08MM5MtO6pq1kedIR4pxyEnxbS0VsdvG
 vnUA5chr1vngshhUQGgs4EJ2ebEl1D505AU4X1PoSotHUpyajhEWsatgxYfRFA+sbCRVxx
 M1GTjIwWrCzD0Zmc0AFdsX46jvSKOfA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-VIh2R19gOOqEUKUqV4xIvA-1; Tue, 11 Feb 2020 06:06:57 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A078A800D5E;
 Tue, 11 Feb 2020 11:06:56 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-131.ams2.redhat.com [10.36.116.131])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F38D95C11E;
 Tue, 11 Feb 2020 11:06:55 +0000 (UTC)
Subject: Re: [qemu-web PATCH] Force background color
To: athurh <athurh@gmail.com>, qemu-devel@nongnu.org
References: <20200208004617.340419-1-athurh@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <b3cef32e-d43f-9414-0230-fb0f2f5c3c96@redhat.com>
Date: Tue, 11 Feb 2020 12:06:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200208004617.340419-1-athurh@gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: VIh2R19gOOqEUKUqV4xIvA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/02/2020 01.46, athurh wrote:
> Browsers can have a different default background color defined.
> Setting the background image overwrites other background definitions.
> ---
>  assets/css/style-desktop.css | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/assets/css/style-desktop.css b/assets/css/style-desktop.css
> index 44ea0c7..b6c5aa1 100644
> --- a/assets/css/style-desktop.css
> +++ b/assets/css/style-desktop.css
> @@ -33,12 +33,14 @@
>  	{
>  		/* 90% transparent */
>  		background: url(../images/qemu_head_200.png) no-repeat fixed 2em 80px;
> +		background-color: #FFF;
>  	}
>  
>  	body.homepage
>  	{
>  		/* 90% transparent */
>  		background: url(../images/qemu_head_400_faint.png) no-repeat fixed center 60%;
> +		background-color: #FFF;
>  	}
>  
>  	body,input,textarea,select
> 

Thanks, applied.

 Thomas


