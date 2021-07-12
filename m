Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8163C62B3
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 20:35:08 +0200 (CEST)
Received: from localhost ([::1]:39234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m30lm-0008Oq-SO
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 14:35:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m30kZ-0007j2-Gv
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 14:33:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m30kW-0002jM-D4
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 14:33:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626114826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o5+4WcLT5xJ+zVWt1Ks5KjU16Eg9fDOaSiQWRH6X2Cs=;
 b=XEIsEejcO82B6sgF7YROlfimdLyxJufPj3Tm+IoLgDavFfFWQC2OCyCcZSHNMQME7JnXkr
 6QkoKgy0YP0GQUNI+HqXNp64o7LWBqurUyK/dy9XHtKRIeIMF+hmdzC56LIYZx+UKdpYKI
 oxFetHvFT5lXn9cwXKL8WvERRhkr2SA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-IgMq4lJAMZiUI_OJ8uhuxg-1; Mon, 12 Jul 2021 14:33:45 -0400
X-MC-Unique: IgMq4lJAMZiUI_OJ8uhuxg-1
Received: by mail-wm1-f70.google.com with SMTP id
 i3-20020a05600c3543b02902075ed92710so7672567wmq.0
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 11:33:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=o5+4WcLT5xJ+zVWt1Ks5KjU16Eg9fDOaSiQWRH6X2Cs=;
 b=KFtHXjv4bLXmDriOC4afDjxiuHFLAag7kjqWfY2oE3Me5o4r5M1uopU5XL1JaCN55E
 nVQjDhWXZlmKKC+PC4m7eHtu+677Dsd1p1bf0jMSyeoAoPC/LDkLijXTxaI4H/hK2MGZ
 TP3W1HazUXSopvyoPX36z6BqHOJHLH/wTwY1tyzTsEWpvoudGa1rjKVgRgR1pV5T3slg
 K4vVZc3nsBk0y3o0MQvaP15/Fv1QuaRJRFv1nre2+8uRMUtgswydBvfEnHCD8SZR+sUJ
 RTm+caeN8RO2P/xc2ASavS/iJKyxOhz7k4Zu2TKl3nXLm0gg/I2uADVE5HRlzYS/igxr
 +8uA==
X-Gm-Message-State: AOAM531aYLOUqugj9l2t4At5+2rsMfQLO3ZrE3rEOd1KPPHyVRt7soiu
 HdFvQQW5cLN5lSkPYd61LPHejKnowgM62F1x+9nQc3pueQG/zbVHizOR7dfsh49LpF8k8hdvR04
 Zz7Natm7V6p63kHs=
X-Received: by 2002:adf:d086:: with SMTP id y6mr400016wrh.247.1626114824241;
 Mon, 12 Jul 2021 11:33:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBvasbg4t8TGeReO2YhVntK/Q0KXNWP1tNLn3I1G/EcgEtxO+uo4JmiPilsZGlneRmwOfizQ==
X-Received: by 2002:adf:d086:: with SMTP id y6mr399991wrh.247.1626114824019;
 Mon, 12 Jul 2021 11:33:44 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id e11sm13335504wrt.0.2021.07.12.11.33.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 11:33:42 -0700 (PDT)
Date: Mon, 12 Jul 2021 19:33:40 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 2/3] migration: Don't do migrate cleanup if during
 postcopy resume
Message-ID: <YOyLBA89pUWPq9LU@work-vm>
References: <20210708190653.252961-1-peterx@redhat.com>
 <20210708190653.252961-3-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210708190653.252961-3-peterx@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Li Xiaohui <xiaohli@redhat.com>, Lukas Straub <lukasstraub2@web.de>,
 qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> Below process could crash qemu with postcopy recovery:
> 
>   1. (hmp) migrate -d ..
>   2. (hmp) migrate_start_postcopy
>   3. [network down, postcopy paused]
>   4. (hmp) migrate -r $WRONG_PORT
>      when try the recover on an invalid $WRONG_PORT, cleanup_bh will be cleared
>   5. (hmp) migrate -r $RIGHT_PORT
>      [qemu crash on assert(cleanup_bh)]
> 
> The thing is we shouldn't cleanup if it's postcopy resume; the error is set
> mostly because the channel is wrong, so we return directly waiting for the user
> to retry.
> 
> migrate_fd_cleanup() should only be called when migration is cancelled or
> completed.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/migration.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 8786104c9a..bb1edf862a 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -3975,7 +3975,18 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
>      }
>      if (error_in) {
>          migrate_fd_error(s, error_in);
> -        migrate_fd_cleanup(s);
> +        if (resume) {
> +            /*
> +             * Don't do cleanup for resume if channel is invalid, but only dump
> +             * the error.  We wait for another channel connect from the user.
> +             * The error_report still gives HMP user a hint on what failed.
> +             * It's normally done in migrate_fd_cleanup(), but call it here
> +             * explicitly.
> +             */
> +            error_report_err(error_copy(s->error));
> +        } else {
> +            migrate_fd_cleanup(s);
> +        }
>          return;
>      }
>  
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


