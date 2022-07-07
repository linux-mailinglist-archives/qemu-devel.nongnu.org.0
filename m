Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CF256A9FE
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 19:49:26 +0200 (CEST)
Received: from localhost ([::1]:37986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Vcz-0005Pa-1y
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 13:49:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o9Vag-0004U9-Dc
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 13:47:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o9Vad-0006Ij-0W
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 13:47:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657216017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=74mMGwkrottfs+dW0cfyN9WICqbEkwHQ49oEu1FQV+Y=;
 b=P3f/lBac8imJCA10CcLND9dyYF+k1TvRm2dHJpNFYXbUm4dVypzGpHIQupwXk94TwJ3udW
 7B7ygJaPASNsJ2Ho+343HdSr3YpVRkEMqaMEd+/kWm7dv4e2oPMD8NWqEdYIF1GCu3GscT
 uXXWxQf/9pEjoKcIHf/hU+2u0mGfqHk=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-SoeWu4dKO0OQeQaCo7rpvw-1; Thu, 07 Jul 2022 13:46:56 -0400
X-MC-Unique: SoeWu4dKO0OQeQaCo7rpvw-1
Received: by mail-qt1-f199.google.com with SMTP id
 o17-20020ac84291000000b003170097ad3bso16067510qtl.12
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 10:46:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=74mMGwkrottfs+dW0cfyN9WICqbEkwHQ49oEu1FQV+Y=;
 b=PXYqqTlfzweEjOMxVJyqqrfRezG/+4HKlw7GfhsFU5X5fmevYoTFyHs3UQ+vbRDTHY
 tYIOxCM62x8z5uhMqtHiTuKutyTem4rFFguNab3wg6LC32JgHjXI0yI2hk1dXXFrpv2s
 ioW2xw7hjpVFVZUNzS7iZtmpxrzr3Xa69D0VjY0d08eYwSClcOUb7Q3B+tjD23ilxqQJ
 CygLToJ9bVGavh636utGD6ZnSUmOv0kVdEg5YKhJe2JfLvOAr58byA6HmFAlNvT3mpbo
 mezOowEo7XwfIBJ3bdOYsiM982/s4UfnFmusQM5TvYD/sOyJpdIkJcf16zq+NiSZZBtQ
 pelw==
X-Gm-Message-State: AJIora+h5ZnWLhVhB4hRcO593Ewlf5cWUFioGFNnViX8jZHbDGk+Ou3W
 QGQ4qNGHIHrEGX4OJ3lIbrCc+4hEMypv0Qd4fIvAgtRWfRI5uLdr5eG+WdMONS7qgeuD7tX2qwT
 uF7wTgPV+KfIpBdk=
X-Received: by 2002:ad4:5be9:0:b0:470:a252:34fa with SMTP id
 k9-20020ad45be9000000b00470a25234famr40768382qvc.12.1657216015768; 
 Thu, 07 Jul 2022 10:46:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v6fgbHcl22aJs5CsOz1cwCp3rNimmC3ZGpPEiz1poIZ6opxpcf7zXtUyanrEABk9Gt+u+vtg==
X-Received: by 2002:ad4:5be9:0:b0:470:a252:34fa with SMTP id
 k9-20020ad45be9000000b00470a25234famr40768357qvc.12.1657216015496; 
 Thu, 07 Jul 2022 10:46:55 -0700 (PDT)
Received: from xz-m1.local
 (bras-base-aurron9127w-grc-37-74-12-30-85.dsl.bell.ca. [74.12.30.85])
 by smtp.gmail.com with ESMTPSA id
 dz8-20020a05620a2b8800b006b141dd9746sm20761433qkb.110.2022.07.07.10.46.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 10:46:54 -0700 (PDT)
Date: Thu, 7 Jul 2022 13:46:53 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 1/3] QIOChannelSocket: Fix zero-copy flush returning
 code 1 when nothing sent
Message-ID: <YsccDel9oiTPqvHW@xz-m1.local>
References: <20220704202315.507145-1-leobras@redhat.com>
 <20220704202315.507145-2-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220704202315.507145-2-leobras@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Hi, Leo,

On Mon, Jul 04, 2022 at 05:23:13PM -0300, Leonardo Bras wrote:
> If flush is called when no buffer was sent with MSG_ZEROCOPY, it currently
> returns 1. This return code should be used only when Linux fails to use
> MSG_ZEROCOPY on a lot of sendmsg().
> 
> Fix this by returning early from flush if no sendmsg(...,MSG_ZEROCOPY)
> was attempted.
> 
> Fixes: 2bc58ffc2926 ("QIOChannelSocket: Implement io_writev zero copy flag & io_flush for CONFIG_LINUX")
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> ---
>  io/channel-socket.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/io/channel-socket.c b/io/channel-socket.c
> index 4466bb1cd4..698c086b70 100644
> --- a/io/channel-socket.c
> +++ b/io/channel-socket.c
> @@ -716,12 +716,18 @@ static int qio_channel_socket_flush(QIOChannel *ioc,
>      struct cmsghdr *cm;
>      char control[CMSG_SPACE(sizeof(*serr))];
>      int received;
> -    int ret = 1;
> +    int ret;
> +
> +    if (!sioc->zero_copy_queued) {

I think I asked this in the downstream review but didn't get a
response.. shouldn't this check be "queued == sent"?

> +        return 0;
> +    }
>  
>      msg.msg_control = control;
>      msg.msg_controllen = sizeof(control);
>      memset(control, 0, sizeof(control));
>  
> +    ret = 1;
> +
>      while (sioc->zero_copy_sent < sioc->zero_copy_queued) {
>          received = recvmsg(sioc->fd, &msg, MSG_ERRQUEUE);
>          if (received < 0) {
> -- 
> 2.36.1
> 

-- 
Peter Xu


