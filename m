Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6070155210E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 17:32:39 +0200 (CEST)
Received: from localhost ([::1]:43222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3JOI-00025B-1B
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 11:32:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o3JJj-0003rm-7R
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:27:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o3JJg-0002Vx-CP
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:27:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655738871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X9ZQmCHMImwmcDcY+2kEoIPbHjBgYMr6EAvHSBqAdeo=;
 b=UVyg2Q2QaAWDz+bWuDh7ZqiN9LJ/RHgg3/nB2AW0fZLDHIU07Y7ufQ9r0rRLvl9oNfThqn
 /mnjg3YFoTZ00iYe8AmEgWGZiLH0448g3kGT8X+4hpC5sPYgVhXTCRkhVxG1PAKjpdY2lJ
 /gNdAshYzY/u6KILic7lNWr95sqZc5s=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-Vp8qZPBLNiu_ZxnSkZeoyw-1; Mon, 20 Jun 2022 11:27:50 -0400
X-MC-Unique: Vp8qZPBLNiu_ZxnSkZeoyw-1
Received: by mail-io1-f71.google.com with SMTP id
 w21-20020a5d9cd5000000b00669e6796a8aso6236556iow.7
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 08:27:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=X9ZQmCHMImwmcDcY+2kEoIPbHjBgYMr6EAvHSBqAdeo=;
 b=bddneP43/bt/JufHi+SPMnsvsGUGFgnjbUoNFCc5d1CMan5lDmn2DavJhGwc6saf6S
 MfzLDUypeb9XZlQgNJmIq3IYKkcNLhfkKaqVkX7zhJw3AaZfKkqJ31FuyrbZLvNslL1W
 Pcp2sXul2bqZHdfC9dOzjyUWQxbHdHcoSEAaTnfVCo1OPtRQQN1ya6hz1jbdNQDDy4cP
 UQTpChIyS4As6prpb8hN2bAtDLqOUS6e8/giaF8Z9SyYrE78ATTtdVbY2D5dSAIlQxXC
 gcMnjNBzlzyFstSttT7eFiyMSlg0LoDDWA3m4uZrQqd6RgA9NEDGDS1EwWbJzlWcD5Fq
 wOiw==
X-Gm-Message-State: AJIora9gDYXl3+xZ8ZZ1ZUG6KjwwFcuYi3n88UCZcSNqEx3Rz9122ztQ
 F/5GRMzB+72+GtEh91yv8bPlcEPSYMm404ORyvlFxPphQW9ekaBYdtKdTt/wUWwET6jetoUYyXq
 6e1A3wg7sgnaGIjE=
X-Received: by 2002:a05:6e02:16c9:b0:2d3:eb1d:bc92 with SMTP id
 9-20020a056e0216c900b002d3eb1dbc92mr14202374ilx.114.1655738869524; 
 Mon, 20 Jun 2022 08:27:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s0z3ZZVyJkNVBUL6tZzIcBxFOLDl9CAJGfwlIGHZ6A81E/LtSSIwRE3sfbCXkz8ejhU7fvBQ==
X-Received: by 2002:a05:6e02:16c9:b0:2d3:eb1d:bc92 with SMTP id
 9-20020a056e0216c900b002d3eb1dbc92mr14202367ilx.114.1655738869332; 
 Mon, 20 Jun 2022 08:27:49 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 f20-20020a02a814000000b0032e7bd2287asm6113756jaj.94.2022.06.20.08.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 08:27:48 -0700 (PDT)
Date: Mon, 20 Jun 2022 11:27:47 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?utf-8?B?5b6Q6Zev?= <xuchuangxclwt@bytedance.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 2/4] QIOChannelSocket: Fix zero-copy send so socket
 flush works
Message-ID: <YrCR89nDyzDitcv8@xz-m1.local>
References: <20220620053944.257547-1-leobras@redhat.com>
 <20220620053944.257547-3-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220620053944.257547-3-leobras@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Mon, Jun 20, 2022 at 02:39:43AM -0300, Leonardo Bras wrote:
> Somewhere between v6 and v7 the of the zero-copy-send patchset a crucial
> part of the flushing mechanism got missing: incrementing zero_copy_queued.
> 
> Without that, the flushing interface becomes a no-op, and there is no
> guarantee the buffer is really sent.
> 
> This can go as bad as causing a corruption in RAM during migration.
> 
> Fixes: 2bc58ffc2926 ("QIOChannelSocket: Implement io_writev zero copy flag & io_flush for CONFIG_LINUX")
> Reported-by: 徐闯 <xuchuangxclwt@bytedance.com>
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


