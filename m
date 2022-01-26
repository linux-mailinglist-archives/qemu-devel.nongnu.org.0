Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B6949C916
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 12:52:04 +0100 (CET)
Received: from localhost ([::1]:34718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCgqI-0008GP-Ea
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 06:52:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nCgo7-00077E-Lh
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 06:49:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nCgo4-0005MA-1y
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 06:49:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643197783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3mDZWbBieYfJdimKKnAe3YJBk0DbFtLTaUY2pg5Rugk=;
 b=YxBnFe5Lma9KVGcXIOshI0hNlbi7mN4yOA16eSZO6UkrAkp/pGn8AqKSBzrTYAHgTltHTy
 dRkEEfB7bLHPeNKgTp/UixbIT84n0qLKLeo6xbvtmjSeiZfDS35ju5AOIwA5YbbHX67/jM
 t+WsG69sVsW/ppx+KWUi/L3yp7dDg5g=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-AbMdSlzYP--cNCM7kHAhQQ-1; Wed, 26 Jan 2022 06:49:42 -0500
X-MC-Unique: AbMdSlzYP--cNCM7kHAhQQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 v28-20020adfa1dc000000b001dd1cb24081so1764745wrv.10
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 03:49:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3mDZWbBieYfJdimKKnAe3YJBk0DbFtLTaUY2pg5Rugk=;
 b=AEEPctBgX39sV5ivFx15qtz0gKw4ti3GaMjkYhE4R8t6EIG2Zj5KnKOvM1UXKHYZnv
 FoioT4gNp8/1qNg9pBjRl+alJGhPleuwHSLxVTviYSK/jQ74dg0Dm7L1yugkFDjn7fSr
 vtbfu2LtobyrC0Qo4lEUW5srbX6YKSvxesYCxjV/oLxEyqujTncAV1qw/s5vcjPJeKoO
 DKnOY5/UKw/CBN41HpmDej7iBr5l6Xl4JAyY45STmqYMcCtsu4IbcRS5V3saYux/9H8q
 pFr39AEAFyxTWQ9EeF5i6OpvJtKfc94r/RtAFZINnYb1zSEA5ryWQAt+TU0R0bkKuTWV
 nZdQ==
X-Gm-Message-State: AOAM5300rY8IMxGhdTfH/u604uAP5UatHgsTYvvF4BWZSYQ+GK9TJXh5
 3VOJkohm9amDfERNBgcmYrUPsYTfOP4X5BgWd/f/8XyEHiVdCXgo9XT8/U/dlXlZ9joVbZ1XvN2
 EeCUGrUKHizFphxM=
X-Received: by 2002:a05:600c:4e4f:: with SMTP id
 e15mr7178318wmq.53.1643197781034; 
 Wed, 26 Jan 2022 03:49:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzZQb3MkFkwjSwCTFhMGO2yv224wMUIVcaaFrE40EICvoQQCk8TFZtKOillQlqltCLMKH7lnw==
X-Received: by 2002:a05:600c:4e4f:: with SMTP id
 e15mr7178277wmq.53.1643197780732; 
 Wed, 26 Jan 2022 03:49:40 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id o6sm5812698wrc.65.2022.01.26.03.49.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 03:49:40 -0800 (PST)
Message-ID: <10edfb5c-44b8-299f-00cc-3a42bab3fcaa@redhat.com>
Date: Wed, 26 Jan 2022 12:49:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v6 19/33] block: introduce bdrv_activate
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20220121170544.2049944-1-eesposit@redhat.com>
 <20220121170544.2049944-20-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220121170544.2049944-20-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.01.22 18:05, Emanuele Giuseppe Esposito wrote:
> This function is currently just a wrapper for bdrv_invalidate_cache(),
> but in future will contain the code of bdrv_co_invalidate_cache() that
> has to always be protected by BQL, and leave the rest in the I/O
> coroutine.
>
> Replace all bdrv_invalidate_cache() invokations with bdrv_activate().
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block.c                            | 7 ++++++-
>   block/block-backend.c              | 2 +-
>   block/export/export.c              | 2 +-
>   block/parallels.c                  | 2 +-
>   include/block/block-global-state.h | 2 +-
>   tests/unit/test-block-iothread.c   | 2 +-
>   6 files changed, 11 insertions(+), 6 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


