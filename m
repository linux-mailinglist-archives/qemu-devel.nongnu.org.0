Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5F8493F6D
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 18:56:10 +0100 (CET)
Received: from localhost ([::1]:47610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAFBp-0004ho-I6
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 12:56:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nAF81-0002PF-RB
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 12:52:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nAF7z-0002rJ-VP
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 12:52:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642614731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zQthGhNjJjK4YayX3G8tb3hGbF8eK/EqhmjCJMKALBk=;
 b=ekWttziCkOCAS8UEV/pjeNH2rFy7gpORgZRQw1NA4BHyMSbk5nXuzjHBJasvWfuQfxru9N
 gPm2lkocLJksbFKM0byZz9JHqzMS2XjIDrMb6llvaJR+7nRAdtXCHf5p0f6ZJGWsXV6BQI
 9gZNfz9hRwQmjUtLw+SQljxf2EP5ETA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-382-oYx-jV6VMW29zo2rl8j8Kg-1; Wed, 19 Jan 2022 12:52:09 -0500
X-MC-Unique: oYx-jV6VMW29zo2rl8j8Kg-1
Received: by mail-wm1-f71.google.com with SMTP id
 bg23-20020a05600c3c9700b0034bb19dfdc0so1557466wmb.1
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 09:52:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zQthGhNjJjK4YayX3G8tb3hGbF8eK/EqhmjCJMKALBk=;
 b=n/ETczGxY4VpJTXEBMS7i8D3J9oQhShxRVAYQZj01xG/K/8cN2ameTqlao10xYl7SK
 H6AQ6FP19BhkNP2i//0Gf7y1TZ9IWtScGfb8RHj3XeRSz5v2Pz+t6YMy/mK4nHqVV1Nw
 2hzECUp41r+RUWoY6x+juxyrRer1ikAc3kRydqiA85wCrhMftqcOlqpnB5bJOT/6P0DL
 Zyq5BVFLbufYCmXZBIjWYA8AShqeQYb9//pQKocVGAvJiIDm8n7X1cim0ryrBFq2wYtd
 GEH+HN0Odgl3UCHFsMYKPZ9dP9USjsp0B5szNgNqjqDWOhkcgwRcwVORuRlO2dRt8QBb
 Ce5g==
X-Gm-Message-State: AOAM533IA9nrSbCHq8Km2HTCXX1ejQ5YM2CSZDf4jsUsYDjiabAJpB/h
 mrGZFrF/TOlRyNtuSppqe64qgUBituY4YLt1y8QmcAOqkl+WivDXag+zVy2z45qpE5qyLNvaial
 XOB4wimQAnR4153g=
X-Received: by 2002:a05:600c:1d28:: with SMTP id
 l40mr4617409wms.182.1642614728093; 
 Wed, 19 Jan 2022 09:52:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyFsIkptosaC9mOLr+qn1TneeR0mgcr9f6q0IjJ+G+RYvH4MbyhduOXjhxffxNUVJqZ1jLpuQ==
X-Received: by 2002:a05:600c:1d28:: with SMTP id
 l40mr4617391wms.182.1642614727856; 
 Wed, 19 Jan 2022 09:52:07 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id bh26sm197570wmb.40.2022.01.19.09.52.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 09:52:07 -0800 (PST)
Date: Wed, 19 Jan 2022 17:52:05 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Zhang Chen <chen.zhang@intel.com>
Subject: Re: [PATCH 1/3] migration/migration.c: Add missed default error
 handler for migration state
Message-ID: <YehPxVQn8AuC0gut@work-vm>
References: <20211231055935.1878503-1-chen.zhang@intel.com>
 <20211231055935.1878503-2-chen.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <20211231055935.1878503-2-chen.zhang@intel.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-dev <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Zhang Chen (chen.zhang@intel.com) wrote:
> In the migration_completion() no other status is expected, for
> example MIGRATION_STATUS_CANCELLING, MIGRATION_STATUS_CANCELLED, etc.
> 
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>

I think you're right;

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

 however, did you actually see this trigger in a different state?

Dave
> ---
>  migration/migration.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 0652165610..2afa77da03 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -3205,7 +3205,7 @@ static void migration_completion(MigrationState *s)
>          qemu_mutex_unlock_iothread();
>  
>          trace_migration_completion_postcopy_end_after_complete();
> -    } else if (s->state == MIGRATION_STATUS_CANCELLING) {
> +    } else {
>          goto fail;
>      }
>  
> -- 
> 2.25.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


