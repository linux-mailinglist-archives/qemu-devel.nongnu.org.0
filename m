Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B2439229A
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 00:19:32 +0200 (CEST)
Received: from localhost ([::1]:41952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm1sB-0004f7-H8
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 18:19:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras.c@gmail.com>)
 id 1lm1qL-0003vi-5j
 for qemu-devel@nongnu.org; Wed, 26 May 2021 18:17:37 -0400
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:42645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leobras.c@gmail.com>)
 id 1lm1qJ-0008D0-Ft
 for qemu-devel@nongnu.org; Wed, 26 May 2021 18:17:36 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id u33so1616481qvf.9
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 15:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=uIjJ2tNh4fLKOZFH6yuwDdC4C/l6yRY5SCJatiVNJXA=;
 b=N7TNQGnNqDAQ+92YdKTbOGo8D5Dq9yVyHTzXDw5wLaO9RfvLTM08xxqzfwZO9xh5WX
 jG4281pLHsklEcpkh1BXZUSy5pb9Fmuo5QGhXrWavxFmpwW7voipvzh8lPvIZFg6sg78
 JeX24cQzZ2SE3vOu2IIHEUKIby9h8ganLsJr/vQYojScIp2V6ndj+CiJswEG6iiXM09u
 /ROF8cHqOg8vKTYXVcLkyNc/uKjSjTTp/CHVGl43r7ksmBFSCW/uoVDU4lmEhnq0jLJJ
 yT/FeUMyLbpUOMvqXZcVCmFUiRJoWK5v4NjbPKcSiDXt86DEAooumWZ+VV5P8guVNihi
 /kLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=uIjJ2tNh4fLKOZFH6yuwDdC4C/l6yRY5SCJatiVNJXA=;
 b=sJ2dXbaVjg9ywtPC97l1AaOWnjAZgXiTtPNPErAiswKYXwA/gL1aFmJF9L+Sj90VBU
 Zd4WsgdIENiA1Xl3XRG6vGW49V501iT5vPJ8DjZkWYsFKgJMBTjUeP6PyMYpnlrDVcii
 7Vbj+GsGY99IuGlYQRPLfBXDGoS3rZ/A/6ixu5b4nQwjjm7eOSU/rBB15sMNt5+2/9Dm
 DmPlIi7fdN22Aups/K1SlPBjpQpxA7nDbpIhbjI63zPTqZYvob5JVsS83vyAfuAtYUqY
 1hkbDGceei+2lyAD+8VOr5mKnIiEdq1LJcZNc58HRTVIvA8+0gT7fbcyMPtNuBmppy+8
 jStA==
X-Gm-Message-State: AOAM5323uQbKAU3sf0aeOTAxjQOByPZuda19UipbqWAKP8Lc9JbtugtB
 N/5i1moicaomj3GPYPzOIZI=
X-Google-Smtp-Source: ABdhPJzlFcrXUkRSWLdvURWBESha6O8Flyia0mzpvi3MaGfjn/aPn9GTXqj/1uLa5/wp0iRP6vVsgQ==
X-Received: by 2002:ad4:510e:: with SMTP id g14mr630279qvp.5.1622067454620;
 Wed, 26 May 2021 15:17:34 -0700 (PDT)
Received: from ?IPv6:2804:14c:482:7b04:dff0:eb42:c6da:8218?
 ([2804:14c:482:7b04:dff0:eb42:c6da:8218])
 by smtp.gmail.com with ESMTPSA id 132sm171302qkj.49.2021.05.26.15.17.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 15:17:34 -0700 (PDT)
Message-ID: <cb57e8eb6a2c4ea07dccb8b1180ad10f428bbc73.camel@gmail.com>
Subject: Re: [PATCH v2 1/1] yank: Unregister function when using TLS migration
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
To: Juan Quintela <quintela@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, peterx@redhat.com, lukasstraub2@web.de
Date: Wed, 26 May 2021 19:17:50 -0300
In-Reply-To: <20210526221615.1093506-1-leobras.c@gmail.com>
References: <20210526221615.1093506-1-leobras.c@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=leobras.c@gmail.com; helo=mail-qv1-xf2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CC: Daniel P. Berrange <berrange@redhat.com>

On Wed, 2021-05-26 at 19:16 -0300, Leonardo Bras wrote:
> After yank feature was introduced, whenever migration is started using
> TLS,
> the following error happens in both source and destination hosts:
> 
> (qemu) qemu-kvm: ../util/yank.c:107: yank_unregister_instance:
> Assertion `QLIST_EMPTY(&entry->yankfns)' failed.
> 
> This happens because of a missing yank_unregister_function() when using
> qio-channel-tls.
> 
> Fix this by also allowing TYPE_QIO_CHANNEL_TLS object type to perform
> yank_unregister_function() in channel_close() and
> multifd_load_cleanup().
> 
> Fixes: 50186051f ("Introduce yank feature")
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1964326
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> 
> --
> Changes since v1:
> - Cast p->c to QIOChannelTLS into multifd_load_cleanup()
> ---
>  migration/multifd.c           | 6 ++++++
>  migration/qemu-file-channel.c | 7 +++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 0a4803cfcc..81de11c6fc 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -992,6 +992,12 @@ int multifd_load_cleanup(Error **errp)
>              yank_unregister_function(MIGRATION_YANK_INSTANCE,
>                                       migration_yank_iochannel,
>                                       QIO_CHANNEL(p->c));
> +        } else if (object_dynamic_cast(OBJECT(p->c),
> TYPE_QIO_CHANNEL_TLS)
> +                   && OBJECT(p->c)->ref == 1) {
> +            QIOChannelTLS *tioc = QIO_CHANNEL_TLS(p->c);
> +            yank_unregister_function(MIGRATION_YANK_INSTANCE,
> +                                     migration_yank_iochannel,
> +                                     QIO_CHANNEL(tioc->master));
>          }
>  
>          object_unref(OBJECT(p->c));
> diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-
> channel.c
> index 876d05a540..4f79090f3f 100644
> --- a/migration/qemu-file-channel.c
> +++ b/migration/qemu-file-channel.c
> @@ -26,6 +26,7 @@
>  #include "qemu-file-channel.h"
>  #include "qemu-file.h"
>  #include "io/channel-socket.h"
> +#include "io/channel-tls.h"
>  #include "qemu/iov.h"
>  #include "qemu/yank.h"
>  #include "yank_functions.h"
> @@ -111,6 +112,12 @@ static int channel_close(void *opaque, Error
> **errp)
>          yank_unregister_function(MIGRATION_YANK_INSTANCE,
>                                   migration_yank_iochannel,
>                                   QIO_CHANNEL(ioc));
> +    } else if (object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_TLS)
> +               && OBJECT(ioc)->ref == 1) {
> +        QIOChannelTLS *tioc = opaque;
> +        yank_unregister_function(MIGRATION_YANK_INSTANCE,
> +                                 migration_yank_iochannel,
> +                                 QIO_CHANNEL(tioc->master));
>      }
>      object_unref(OBJECT(ioc));
>      return ret;



