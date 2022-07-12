Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 407B95729A9
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 01:07:15 +0200 (CEST)
Received: from localhost ([::1]:34608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBOyI-0003mt-3f
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 19:07:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oBOWf-0004QD-K7
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 18:38:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oBOWP-000554-K9
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 18:38:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657665501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F3SLJWQ6ZTWHTWfYbzqeqwqgxsn1JANpNhROR3s70TU=;
 b=VgqfGg/NhJAQXV5ZZOhULG1fjerqRZfm+Qvx5fnYHwAWu26OEX06C07ZZY0mveVUSfVgnc
 QA+GPU2HotBhokoGNEIlNgiExcY5O77x8rGzQl8NhopDUuY6HawT1qCHjrhuHCOZ7GAWBA
 eDQ6dRkY2s93A2F44ffSE+PgI2rRtdM=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-550-UgBGRnZ1M3SZN9Tc1cgCUQ-1; Tue, 12 Jul 2022 18:38:20 -0400
X-MC-Unique: UgBGRnZ1M3SZN9Tc1cgCUQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 x22-20020a05620a259600b006b552a69231so8795871qko.18
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 15:38:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=F3SLJWQ6ZTWHTWfYbzqeqwqgxsn1JANpNhROR3s70TU=;
 b=w4FJxZHXXvM9xJx7sC9CQ4QyVVIQwLUIp9Qzj4ytZ84+iGJdXZ52iAbc4vlfW9lhfn
 H0+jNG7EwinzeazeXl6ynIoPCWWa92eVSdnMQQBogRwK+cduhRnrOtK4tfMSat3JqpFa
 lbCZIDYTf+O63j348IIry7xyaBuzjj/kPuriwIClSY4MyovIWBRWstHNqMUhx5MUU2qj
 84XJv0RkH1lDGgiV0VKz0salQU/hPX82ycnZk48khrY87zkUPZNMDKrzh1ZZPlprBVLR
 duqtxnAQ5pySkWigXjcqFnTp0CJsNxJPGeUzTQZfxn5D5ps1fE/s1nzvo0OTdkCCNokz
 rnqQ==
X-Gm-Message-State: AJIora9haH8/ECFPOQFlE5dby82eDFiA0z/73ARPSch7VwA1kFUw2kMZ
 Qrzav6TSnKfldmrTjqBAWWYBMdBw/I+t8jo83yOMDfPQQ2inbDR7+DiImSzlu+uzcyG5EpR0Ouq
 oTHLu7kLF420leu8=
X-Received: by 2002:ad4:5de8:0:b0:473:8d62:d2db with SMTP id
 jn8-20020ad45de8000000b004738d62d2dbmr507540qvb.112.1657665499761; 
 Tue, 12 Jul 2022 15:38:19 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vJjVhO33uWCZgagyEHU7n8fgTtrc5EW2hfh6QSC89gviPt9IoFmq/fRE1Vy6LZsJacYoj33A==
X-Received: by 2002:ad4:5de8:0:b0:473:8d62:d2db with SMTP id
 jn8-20020ad45de8000000b004738d62d2dbmr507527qvb.112.1657665499573; 
 Tue, 12 Jul 2022 15:38:19 -0700 (PDT)
Received: from xz-m1.local
 (bras-base-aurron9127w-grc-37-74-12-30-48.dsl.bell.ca. [74.12.30.48])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a05620a244900b006af59e9ddeasm10252634qkn.18.2022.07.12.15.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 15:38:18 -0700 (PDT)
Date: Tue, 12 Jul 2022 18:38:17 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 1/3] QIOChannelSocket: Fix zero-copy flush returning
 code 1 when nothing sent
Message-ID: <Ys332UU1hnEGi9GV@xz-m1.local>
References: <20220711211112.18951-1-leobras@redhat.com>
 <20220711211112.18951-2-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220711211112.18951-2-leobras@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Mon, Jul 11, 2022 at 06:11:11PM -0300, Leonardo Bras wrote:
> If flush is called when no buffer was sent with MSG_ZEROCOPY, it currently
> returns 1. This return code should be used only when Linux fails to use
> MSG_ZEROCOPY on a lot of sendmsg().
> 
> Fix this by returning early from flush if no sendmsg(...,MSG_ZEROCOPY)
> was attempted.
> 
> Fixes: 2bc58ffc2926 ("QIOChannelSocket: Implement io_writev zero copy flag & io_flush for CONFIG_LINUX")
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Acked-by: Daniel P. Berrangé <berrange@redhat.com>
> Reviewed-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


