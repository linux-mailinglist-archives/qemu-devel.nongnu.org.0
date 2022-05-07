Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D263051E969
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 21:21:28 +0200 (CEST)
Received: from localhost ([::1]:38780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnPzb-0006Re-OL
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 15:21:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nnPrX-0007yc-1O
 for qemu-devel@nongnu.org; Sat, 07 May 2022 15:13:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nnPrV-0002Fe-HW
 for qemu-devel@nongnu.org; Sat, 07 May 2022 15:13:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651950784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MpqHD6lR5aCDuxDGkq1C+JpCO6JuQFO6WeTYARB9CNk=;
 b=b/O2WtTNKgAW2dV20uvHYJbfTSS8LyGYXAVRfmHnnaLUqs3EsJqb7mJ7nf2Oon+eA1Pa/Z
 KIiV65F4s9s/2VKiYhdrpupSD4GX1+3TcvuZL5sQhfj+OB/z03uW/F9r3QZDvtGOShBRPa
 42OX7RfWUc3XP/Hc7enJlqXPVOmG1Lc=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-16-Yb2rR8f7M72IXu3NpPS3kQ-1; Sat, 07 May 2022 15:13:00 -0400
X-MC-Unique: Yb2rR8f7M72IXu3NpPS3kQ-1
Received: by mail-io1-f72.google.com with SMTP id
 k14-20020a0566022a4e00b0065ae0c238aeso426258iov.1
 for <qemu-devel@nongnu.org>; Sat, 07 May 2022 12:13:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MpqHD6lR5aCDuxDGkq1C+JpCO6JuQFO6WeTYARB9CNk=;
 b=2bV0X+Mop3pnQ9+r+RN6rNVKq9ajWnK8LBy711EKAsUdDzKhpozzdMM/3IX9ANTnUv
 LU8d7WcPy6J+hz8a8wFCu0Pp28zeNCK/dBGzPcxxCtTW02HftagwMM6RGOCXgafUAWfT
 4/HWKnwHXtjeT+VQLrrxvRGjULLpuniTC6svLLW7Zb6ZI7H8i607Of5lFljwp16WecnY
 bt7J8pgNixfhgqoZzHiKFwLO7ch7S435M8FO6fjCp2fk1KlhQp0opoIJ1lbEkI9QX87g
 tm0N5/XocvO5kK/tjlJB2yRB4icG/bi3myhG5gAKYXTlRvx9oIti9kXCSVsMt2zlaA8w
 uQ9Q==
X-Gm-Message-State: AOAM533Hx/+Vqh5pRooiUHnJWhHQOnjuEzsHdpLt2jW31Gaa3p39zQxp
 Y1EVfjfYPWtDvXRJnxGHKNM9YHImvhRbGAmnh8Mh6Km5EzS7x+txpZoF4iCOrdsXQKYIMeRk0PS
 LaUGqCUg3kDmKLhQ=
X-Received: by 2002:a05:6638:12d3:b0:32b:7235:6a08 with SMTP id
 v19-20020a05663812d300b0032b72356a08mr4084008jas.27.1651950779701; 
 Sat, 07 May 2022 12:12:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPCI/EeHQwzYx0pHDdVsRbvlRjMoy7jnpvfj3nH7kPqKcO9iGxwFwnV/4J5h50y90oqxIfmA==
X-Received: by 2002:a05:6638:12d3:b0:32b:7235:6a08 with SMTP id
 v19-20020a05663812d300b0032b72356a08mr4083993jas.27.1651950779391; 
 Sat, 07 May 2022 12:12:59 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 a16-20020a92ce50000000b002cde6e352bcsm2059882ilr.6.2022.05.07.12.12.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 May 2022 12:12:58 -0700 (PDT)
Date: Sat, 7 May 2022 15:12:56 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Subject: Re: [PATCH v12 2/7] QIOChannelSocket: Implement io_writev zero copy
 flag & io_flush for CONFIG_LINUX
Message-ID: <YnbEuH3nmSUCQ4ao@xz-m1.local>
References: <20220507015759.840466-1-leobras@redhat.com>
 <20220507015759.840466-3-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220507015759.840466-3-leobras@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Fri, May 06, 2022 at 10:57:54PM -0300, Leonardo Bras wrote:
> diff --git a/io/channel-socket.c b/io/channel-socket.c
> index 05c425abb8..f03a068f25 100644
> --- a/io/channel-socket.c
> +++ b/io/channel-socket.c
> @@ -25,9 +25,18 @@
>  #include "io/channel-watch.h"
>  #include "trace.h"
>  #include "qapi/clone-visitor.h"
> +#ifdef CONFIG_LINUX
> +#include <linux/errqueue.h>
> +#include <sys/socket.h>
> +
> +#if (defined(MSG_ZEROCOPY) && defined(SO_ZEROCOPY))
> +#define QEMU_MSG_ZEROCOPY
> +#endif
> +#endif
>  
>  #define SOCKET_MAX_FDS 16
>  
> +

This line can be dropped when merge.

>  SocketAddress *
>  qio_channel_socket_get_local_address(QIOChannelSocket *ioc,
>                                       Error **errp)

This does look nicer, imho. :)

Thanks!

-- 
Peter Xu


