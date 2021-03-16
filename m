Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4944033E0CF
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 22:50:50 +0100 (CET)
Received: from localhost ([::1]:40540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMHaT-000165-AW
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 17:50:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lMHPK-0007ec-8w
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:39:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lMHPG-0005iw-Do
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:39:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615930751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o6gb890Q3u5MxqWem3C/hn+0ptMeYj5UO+0NIWR/qoU=;
 b=E5qMB5/4bzjeOiYCrZVcjzNSQfnQF3hz9jP4tbIoIt22w9+8/78GI6uHRTZ6Pi+389pyKm
 SnJwrOcrd+iG8yLo4DaKipuQr715VoleiiuKqWsFFV4ouMXFaBbcpwxeFtaJFSbnWsJ915
 NU6CsvqSfXgJmonb6vx8Hk06mGRMY/0=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-rJXwAfIdNACHCsZkHuc4fg-1; Tue, 16 Mar 2021 17:39:09 -0400
X-MC-Unique: rJXwAfIdNACHCsZkHuc4fg-1
Received: by mail-qt1-f197.google.com with SMTP id r32so16757545qtd.16
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 14:39:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=o6gb890Q3u5MxqWem3C/hn+0ptMeYj5UO+0NIWR/qoU=;
 b=lh34NFztnWHXzFC62VJE34GvT2xZoB6OM1JWr2HMRz64mJVmSw+CxcadakiOJovjU2
 9AduWvgJ2HE1uXbBnHU66jUxIhDu1WVMdPRD32pMVRkmnUeyf8AlRqQN3h/LwQRt4Gm5
 /HZO+KnYAlU50YSOng/XMT6Kp3G3UpnI0i4OslewMjw8Wu8tOueHmMs9cHjHTMqwiSwh
 +ezH9GWxnGhXLO+UyhRzBJsbDD+HUaY73/R1S5CZTnWMWxJpzu69PB8rMblVoTLuY6yI
 ejul7b/hPhBJSqqHDVale9O85j9Ubt9dqGWjx6ewYutFIyOMzzm8Z9pPS7YFuXmhapp3
 uw2Q==
X-Gm-Message-State: AOAM5314T0SaNKTNCWiTuGHoCYPiI2oJX7WUsa6ZqwzqDaN+oAASrixJ
 +2jdlaxhIYniMwLP5txGrjSHaWEmyE10r3EjAzBVH5Nk+YVNP31+uCfRWYJYCd0fEmZnjD+xZyI
 QiwjMUIpF981FTHc=
X-Received: by 2002:aed:20a3:: with SMTP id 32mr895122qtb.238.1615930749297;
 Tue, 16 Mar 2021 14:39:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkZWHiBnFlo03ios8Iwhx7uNIzH5ZBUyR7e203RtHPYFT6YsyLQyRkuKCt30nac48reF1Prg==
X-Received: by 2002:aed:20a3:: with SMTP id 32mr895098qtb.238.1615930749050;
 Tue, 16 Mar 2021 14:39:09 -0700 (PDT)
Received: from xz-x1 ([142.126.89.138])
 by smtp.gmail.com with ESMTPSA id 77sm16421342qko.48.2021.03.16.14.39.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 14:39:08 -0700 (PDT)
Date: Tue, 16 Mar 2021 17:39:06 -0400
From: Peter Xu <peterx@redhat.com>
To: Kunkun Jiang <jiangkunkun@huawei.com>
Subject: Re: [PATCH v4 1/2] migration/ram: Reduce unnecessary rate limiting
Message-ID: <20210316213906.GF395976@xz-x1>
References: <20210316125716.1243-1-jiangkunkun@huawei.com>
 <20210316125716.1243-2-jiangkunkun@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210316125716.1243-2-jiangkunkun@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Juan Quintela <quintela@redhat.com>, David Edmondson <dme@dme.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Alexey Romko <nevilad@yahoo.com>, Zenghui Yu <yuzenghui@huawei.com>,
 wanghaibin.wang@huawei.com, Keqian Zhu <zhukeqian1@huawei.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 16, 2021 at 08:57:15PM +0800, Kunkun Jiang wrote:
> When the host page is a huge page and something is sent in the
> current iteration, migration_rate_limit() should be executed.
> If not, it can be omitted.
> 
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
> Reviewed-by: David Edmondson <david.edmondson@oracle.com>
> ---
>  migration/ram.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 72143da0ac..3eb5b0d7a7 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -2015,8 +2015,13 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
>  
>          pages += tmppages;
>          pss->page++;
> -        /* Allow rate limiting to happen in the middle of huge pages */
> -        migration_rate_limit();
> +        /*
> +         * Allow rate limiting to happen in the middle of huge pages if
> +         * something is sent in the current iteration.
> +         */
> +        if (pagesize_bits > 1 && tmppages > 0) {
> +            migration_rate_limit();
> +        }

Sorry I'm still not a fan of this - I'd even prefer calling that once more just
to make sure it won't be forgotten to be called..  Not to say it's merely a noop.

I'll leave this to Dave..  Maybe I'm too harsh! :)

-- 
Peter Xu


