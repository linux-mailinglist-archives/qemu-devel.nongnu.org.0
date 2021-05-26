Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB6D392265
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 23:58:13 +0200 (CEST)
Received: from localhost ([::1]:47126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm1XY-0005CP-Ay
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 17:58:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras.c@gmail.com>)
 id 1lm1VM-0003QD-4k
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:55:57 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:33444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leobras.c@gmail.com>)
 id 1lm1VK-0003lS-0Y
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:55:55 -0400
Received: by mail-qk1-x731.google.com with SMTP id k4so2718693qkd.0
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 14:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=3PzCTlqP/3zdwULu3YbsiBeVd0OB4n5zp3Fla6xLHC0=;
 b=mUurIe3KL5k2ENyMmWy7GWXqHHw/8PDEbH5A8HeatlBVeNpJcfioziZ2Ao6kl+2w8e
 ypqp99qNUACCFW/c7U+VlxtJZnlMdz3LZrk0msuZMZibDxbqhcxoYQTJbJjjodCbdTAb
 5zMAOv9he+F5Fm5CWN0U+mmhnp0URoOYowlWikSM/hsAQFzA+qv2q+mUZ4JqfHh/gFzW
 2IbQ/vjxwDrISdH5WTl8M7oxCoPzoGCz3iOSK+zKQEx9MTyY7DFoir3GidS6xRDf1yms
 UbZjODR0vaDQlVNQwUqw7mHVR5Cveo/hm6wS0fh6VjBomKZX6VJLCWZzndzNCLV/9qNA
 vEqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=3PzCTlqP/3zdwULu3YbsiBeVd0OB4n5zp3Fla6xLHC0=;
 b=FfFZXhIjLq5jet1BlhuD8iRK6A6WCDB6dGSedQiJ2GOlCKJGMoLUcv25VIbEpejC4y
 skUoovnTdjE25G+B4yW7HD1R6utBEqpMgsiFb4LeR/L7QoSg+t1H8G7ld2Q/hk1XSRMR
 rnDmTkteYsLxCH7xStoM7plRsZHV6Ew95/GhE+wFViCOZSEApQnWhk1f+GTry/BRek9l
 nrXTrz86K3tsysrW4uzeIya2VSTeV25QldItVcvvbp0rtBRlCcrrXKh21I6TtGJU9dsy
 MVgmmYUX7TFUyH9KTctMXbeFDM6bSqEynUpVOesiBDUAPuvy6scTlYpZ0WV/9cd2TV+Y
 arsA==
X-Gm-Message-State: AOAM531JIygmIPgKhq3u7vSfOadi2ZBzHMOPYrhOlQjAWoGQwKu922YQ
 KaDYNYd7pzWJQrP6gxt+waU=
X-Google-Smtp-Source: ABdhPJxxtUIPg5J+TKJBeIAnWfHdBq9dBfjjFWKyp/bRPQS2GHYJcgEXCpEp48+3Iyr1AGn1JUTTow==
X-Received: by 2002:a37:de04:: with SMTP id h4mr254198qkj.458.1622066150536;
 Wed, 26 May 2021 14:55:50 -0700 (PDT)
Received: from ?IPv6:2804:14c:482:7b04:dff0:eb42:c6da:8218?
 ([2804:14c:482:7b04:dff0:eb42:c6da:8218])
 by smtp.gmail.com with ESMTPSA id g85sm129591qke.123.2021.05.26.14.55.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 14:55:50 -0700 (PDT)
Message-ID: <c0896991d6662e4d2c05c43a983e83d086a8c5c2.camel@gmail.com>
Subject: Re: [PATCH 1/1] yank: Unregister function when using TLS migration
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
To: Lukas Straub <lukasstraub2@web.de>
Date: Wed, 26 May 2021 18:56:05 -0300
In-Reply-To: <20210526232418.2213cdc1@gecko.fritz.box>
References: <20210526200540.1088333-1-leobras.c@gmail.com>
 <20210526232418.2213cdc1@gecko.fritz.box>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=leobras.c@gmail.com; helo=mail-qk1-x731.google.com
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
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 peterx@redhat.com, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Lukas, thanks for this feedback!

On Wed, 2021-05-26 at 23:24 +0200, Lukas Straub wrote:
> > diff --git a/migration/multifd.c b/migration/multifd.c
> > index 0a4803cfcc..be8656f4c0 100644
> > --- a/migration/multifd.c
> > +++ b/migration/multifd.c
> > @@ -987,8 +987,9 @@ int multifd_load_cleanup(Error **errp)
> >      for (i = 0; i < migrate_multifd_channels(); i++) {
> >          MultiFDRecvParams *p = &multifd_recv_state->params[i];
> >  
> > -        if (object_dynamic_cast(OBJECT(p->c),
> > TYPE_QIO_CHANNEL_SOCKET)
> > -            && OBJECT(p->c)->ref == 1) {
> > +        if ((object_dynamic_cast(OBJECT(p->c),
> > TYPE_QIO_CHANNEL_SOCKET) ||
> > +            (object_dynamic_cast(OBJECT(p->c),
> > TYPE_QIO_CHANNEL_TLS)))  &&
> > +            OBJECT(p->c)->ref == 1) {
> >              yank_unregister_function(MIGRATION_YANK_INSTANCE,
> >                                       migration_yank_iochannel,
> >                                       QIO_CHANNEL(p->c));
> 
> The code here should be the same as in channel_close. So for the
> tls-channel you have to unregister with QIO_CHANNEL(tioc->master)
> like
> below.

ok, sure, I will send a v2.

Thanks!


> 
> Regards,
> Lukas Straub





