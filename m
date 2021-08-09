Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD25D3E4DA6
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 22:10:30 +0200 (CEST)
Received: from localhost ([::1]:34684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDBbR-0000Yc-WC
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 16:10:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mDBYn-0004sq-7u
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 16:07:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mDBYk-0008Vz-Ce
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 16:07:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628539661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lCrPTyGgpYsYynJtA9v+4U6VzWZ6CBe0+pxFAtfvSCg=;
 b=EAzA/HtxBuwuWH3xQY9eO0Bu0x8owqcI+vSKG1Qi4iL49ocnx5a+yI8izXaEXTv/1ySSXk
 xF/BGqaDRa7GEQA9F19GoqFU3jNrkKk9/KvotmggyRmaQewQBKFWfQZV3bvV3nkNtsuC3f
 v9Z2zbNkkMX+G7ANxhWZKZVj3sHioe4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-6PQszkRBMG2pijD55AZiXg-1; Mon, 09 Aug 2021 16:07:40 -0400
X-MC-Unique: 6PQszkRBMG2pijD55AZiXg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 327F81020C20;
 Mon,  9 Aug 2021 20:07:39 +0000 (UTC)
Received: from localhost (unknown [10.22.32.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 03A7860854;
 Mon,  9 Aug 2021 20:07:38 +0000 (UTC)
Date: Mon, 9 Aug 2021 14:14:10 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Alexandre Iooss <erdnaxe@crans.org>
Subject: Re: [PATCH] docs/devel: fix missing antislash
Message-ID: <20210809181410.3rzvwtsawwadl6u4@habkost.net>
References: <20210809173141.1714998-1-erdnaxe@crans.org>
MIME-Version: 1.0
In-Reply-To: <20210809173141.1714998-1-erdnaxe@crans.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 09, 2021 at 07:31:41PM +0200, Alexandre Iooss wrote:
> Signed-off-by: Alexandre Iooss <erdnaxe@crans.org>
> ---
>  docs/devel/qom.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/devel/qom.rst b/docs/devel/qom.rst
> index e5fe3597cd..b9568c0fb8 100644
> --- a/docs/devel/qom.rst
> +++ b/docs/devel/qom.rst
> @@ -309,7 +309,7 @@ This is equivalent to the following:
>             OBJECT_GET_CLASS(MyDeviceClass, obj, TYPE_MY_DEVICE)
>     #define MY_DEVICE_CLASS(void *klass) \
>             OBJECT_CLASS_CHECK(MyDeviceClass, klass, TYPE_MY_DEVICE)
> -   #define MY_DEVICE(void *obj)
> +   #define MY_DEVICE(void *obj) \
>             OBJECT_CHECK(MyDevice, obj, TYPE_MY_DEVICE)

Oops, nice catch!

However, the code above is already going to be deleted by:
https://lore.kernel.org/qemu-devel/20210729175554.686474-9-ehabkost@redhat.com

-- 
Eduardo


