Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA7F33BEA5
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 15:52:41 +0100 (CET)
Received: from localhost ([::1]:44374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLoaG-0005SF-RW
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 10:52:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lLoYp-0004b1-DW
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 10:51:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lLoYm-0003DW-JJ
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 10:51:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615819867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GJemy7oUIVsOsbNq26yr/2upJRAapzYpYvI4Jy2ex7U=;
 b=NtMle+3834ezZHNjjTasrLejjjU/1JagJuniCdiNwA0o1EYqNFrk+pDch5kqbLxOSq3hb5
 2Dn2vHmWA0O3M5egSRM+9WKMmRzktmnFEHWuXcgDNTfOiQO3aSEsDM9iSJ38Z3hI9wELF1
 16XprXN6yGgOU38QQd5BiR3vokFLdvA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-WJpfr1z2P9-PzDgnMq1uPQ-1; Mon, 15 Mar 2021 10:51:04 -0400
X-MC-Unique: WJpfr1z2P9-PzDgnMq1uPQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39D17108BD09;
 Mon, 15 Mar 2021 14:51:03 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-72.ams2.redhat.com [10.36.112.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A219614F5;
 Mon, 15 Mar 2021 14:51:02 +0000 (UTC)
Subject: Re: [PATCH 1/2] util/compatfd.c: Fixed style issues
To: Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-devel@nongnu.org
References: <20210315105814.5188-1-ma.mandourr@gmail.com>
 <20210315105814.5188-2-ma.mandourr@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <ce1f990d-8b7b-218a-293e-ed1ed1e85409@redhat.com>
Date: Mon, 15 Mar 2021 15:51:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210315105814.5188-2-ma.mandourr@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/03/2021 11.58, Mahmoud Mandour wrote:
> Fixed two styling issues that caused checkpatch.pl errors.
> 
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> ---
>   util/compatfd.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/util/compatfd.c b/util/compatfd.c
> index ee47dd8089..174f394533 100644
> --- a/util/compatfd.c
> +++ b/util/compatfd.c
> @@ -20,8 +20,7 @@
>   #include <sys/syscall.h>
>   #endif
>   
> -struct sigfd_compat_info
> -{
> +struct sigfd_compat_info {
>       sigset_t mask;
>       int fd;
>   };
> @@ -53,8 +52,9 @@ static void *sigwait_compat(void *opaque)
>   
>                   len = write(info->fd, (char *)&buffer + offset,
>                               sizeof(buffer) - offset);
> -                if (len == -1 && errno == EINTR)
> +                if (len == -1 && errno == EINTR) {
>                       continue;
> +                }
>   
>                   if (len <= 0) {
>                       return NULL;
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


