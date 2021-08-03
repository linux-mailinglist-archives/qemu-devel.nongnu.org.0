Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F4F3DE722
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 09:19:47 +0200 (CEST)
Received: from localhost ([::1]:33680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAoiI-0004bO-4m
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 03:19:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mAohS-0003j4-5n
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 03:18:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mAohQ-0006GV-4b
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 03:18:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627975131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JmlrDEWS9p767TxJIJHPX5D64C4ag49/lW15mqXUTZI=;
 b=WvQQ8r+QRjsWJeK58bsC8eAY/x/XInMbSqcVpkHVtEtEgtgqyshoVi0mPgjRVoPpioliVm
 gkL1KDeAf3hvJ24b/Bl2s2qwEY1xua1gd27LcSg4tpWnaPUBvXJLpmE3rg7slkH0Or4Nlz
 jdPoSxxhyvVSagzeZrS2isATj5HHjhc=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-9PNXZNk2O-KJAn66RKKDWA-1; Tue, 03 Aug 2021 03:18:50 -0400
X-MC-Unique: 9PNXZNk2O-KJAn66RKKDWA-1
Received: by mail-lj1-f197.google.com with SMTP id
 d7-20020a2e33070000b0290190289db7f9so3828978ljc.7
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 00:18:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JmlrDEWS9p767TxJIJHPX5D64C4ag49/lW15mqXUTZI=;
 b=L1bwTS/5IevUkCneIvpdS57uE9T0qzOB0e1SNC2cbqgSm0QvcRKDdUf19EiZF6o6Xd
 bSEf+BHzmgJ963GGDH0YKF9Whk3BIlcaj5MtTwJvaDOzHevuRAD8T87rUXNpC/X2JIbA
 bHrjb0OZkn4PAwIlf3xmw1moe/h2vDA4AGVXXpQCjHDgIeNbiPqEAIxFT6Mku+js+ryF
 PWmPspSpDNOxADjCfqx9fABF2TvJWYQ3JxoGTyYk5zM+T1Ca0tb8qK17en/S6UqCdd4D
 19WP/MGX8a+Y99fIHiyWYFOPPiiHObHX0BGVJgpPG2Ud1qEKJKkyqLA9O+H21AIamX9S
 EA0g==
X-Gm-Message-State: AOAM53200Z/34pMKX6URg13gYQvqjvrN00IPkSa8dF30D3lX5/D3jw8x
 iABC80FN5lqTYasrDW/XqwL29GgJN/Myx+pdWNLipTMZER/w8oIvWGkVdrrvxfYrZkjkneEwu6w
 MJLf1h2J8Ol+E71L39W0glWzLJOSDaLM=
X-Received: by 2002:a2e:9e1a:: with SMTP id e26mr13715131ljk.265.1627975128618; 
 Tue, 03 Aug 2021 00:18:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEfm5z1pSNsec22ooapJCzLMnteDj1tuffWHkYxSuoOgfOLRbXfBLYsT4FcdUg2wlN5pik5vizszw20u04q4c=
X-Received: by 2002:a2e:9e1a:: with SMTP id e26mr13715112ljk.265.1627975128340; 
 Tue, 03 Aug 2021 00:18:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210730074043.54260-1-leobras@redhat.com>
 <20210803061721.0fdc1614@gecko.fritz.box>
In-Reply-To: <20210803061721.0fdc1614@gecko.fritz.box>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Tue, 3 Aug 2021 04:18:42 -0300
Message-ID: <CAJ6HWG5f8NOmvD_VsQNuw-viw_XERCnxX_bL50_1+SWY0zy5pg@mail.gmail.com>
Subject: Re: [PATCH 1/1] migration: Terminate multifd threads on yank
To: Lukas Straub <lukasstraub2@web.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Li Xiaohui <xiaohli@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Lukas,

On Tue, Aug 3, 2021 at 3:42 AM Lukas Straub <lukasstraub2@web.de> wrote:
> Hi,
> There is an easier explanation: I forgot the send side of multifd
> altogether (I thought it was covered by migration_channel_connect()).
> So yank won't actually shutdown() the multifd sockets on the send side.

If I could get that correctly, it seems to abort migration (and
therefore close all fds) if the ft that ends up qio_channel_shutdown()
get to sendmsg(), which can take a while.
But it really does not close thew fds before that.

>
> In the bugreport you wrote
> > (As a test, I called qio_channel_shutdown() in every multifd iochannel and yank worked just fine, but I could not retry migration, because it was still 'ongoing')
> That sounds like a bug in the error handling for multifd. But quickly
> looking at the code, it should properly fail the migration.

In the end, just asking each thread to just exit ended up getting me a
smoother migration abort.
>
> BTW: You can shutdown outgoing sockets from outside of qemu with the
> 'ss' utility, like this: 'sudo ss -K dst <destination ip> dport = <destination port>'

Very nice tool, thanks for sharing!

>
> Regards,
> Lukas Straub

Best regards,
Leonardo Bras


