Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2504BA744
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 18:37:39 +0100 (CET)
Received: from localhost ([::1]:51294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKkio-0002rV-Hj
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 12:37:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nKkb8-0000IY-EW
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 12:29:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nKkb6-0004NG-UY
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 12:29:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645118980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hawIJs+wdTCZhLCZDcG5ssZBbu2KnVfUBPHMJwoVFZ8=;
 b=QlV+lbc5vO1gGQUbYv3Xq0qszJFxkEvHp7E2Y5iRIta+lCRE3D2bkgLsR+Ui0uQuAckXnL
 VuQlGifsk3uMKuW7WDxCW8Ic6kq1rFBi2djN5fW7Ptpf4veLMdjvwg2jOifL3oJEw/hxwv
 swbU4O3wMGQFVtRkIr2KnWurE9vNA8g=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-YEg4tixVPQGpKk6m-_Tyrg-1; Thu, 17 Feb 2022 12:29:38 -0500
X-MC-Unique: YEg4tixVPQGpKk6m-_Tyrg-1
Received: by mail-wm1-f71.google.com with SMTP id
 a8-20020a7bc1c8000000b0037bc4c62e97so1973876wmj.0
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 09:29:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hawIJs+wdTCZhLCZDcG5ssZBbu2KnVfUBPHMJwoVFZ8=;
 b=nPTvlGgNAcYGNi2grYSVthV8nZh+NZPw+fplRjUO1yrbkqAn2Y4iQSXE0Tb6nFIYYD
 /meYn6CySrGVl7sW+O+5LwGMDqOu+6y/6m6K0wOgQct4iowKp2Ukdij6UI757GLCykDG
 w6cdvk3ZLgEdJNmgU9AnTuH5BbxOJsIYQshxQwqJUiftJTJc63QbjEnDRhPjn5R6N3+8
 YYZHxXZAE71ooxSGyjawL5ONbmDgUTkLaUkS24P0aodsGEQJOVaDbMCGrASD1WOw6BMU
 kt9ajjjCjVliee9muXpxikx4AFAQ40dTgKpwZhbjQ8tGpGn/0Em9XVXySbk2+Vt0bKPk
 v5wg==
X-Gm-Message-State: AOAM5314I0ilWhcZiXG38s2VOUNYpc2y50RGmarmakcqFxp36zBt54rc
 ZP64zfQNqivAxf5m66/pySCLoMHSkFP0FgutnnGctISkAsHmQ6/haCFl/2aMqakTHLKmcUzwht0
 84XztXFEdCq7IEyI=
X-Received: by 2002:a1c:7704:0:b0:354:4d2b:9d5 with SMTP id
 t4-20020a1c7704000000b003544d2b09d5mr7039732wmi.155.1645118977142; 
 Thu, 17 Feb 2022 09:29:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzKxZf0Nn1IQl9nu5GTMnju6xG4FiG+ex9WFlwvfag0Hasckw3yjJLwGDU8QkE57/yw6nZNWQ==
X-Received: by 2002:a1c:7704:0:b0:354:4d2b:9d5 with SMTP id
 t4-20020a1c7704000000b003544d2b09d5mr7039724wmi.155.1645118976981; 
 Thu, 17 Feb 2022 09:29:36 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id p27sm1938547wms.39.2022.02.17.09.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 09:29:36 -0800 (PST)
Date: Thu, 17 Feb 2022 17:29:34 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH] migration: NULL transport_data after freeing
Message-ID: <Yg6F/kMaUSzX95Gc@work-vm>
References: <20220217170407.24906-1-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220217170407.24906-1-hreitz@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Hanna Reitz (hreitz@redhat.com) wrote:
> migration_incoming_state_destroy() NULLs all objects it frees after they
> are freed, presumably so that a subsequent call to the same function
> will not free them again, unless new objects have been created in the
> meantime.
> 
> transport_data is the exception, and it shows exactly this problem: When
> an incoming migration uses transport_cleanup() and transport_data, and a
> subsequent incoming migration (e.g. loadvm) occurs that does not, then
> when this second one is done, it will call transport_cleanup() on the
> old transport_data again -- which has already been freed.  This is
> sometimes visible in the iotest 201, though for some reason I can only
> reproduce it with -m32.
> 
> To fix this, call transport_cleanup() only when transport_data is not
> NULL (otherwise there is nothing to clean up), and set transport_data to
> NULL when it has been cleaned up (i.e. freed).
> 
> (transport_cleanup() is used only by migration/socket.c, where
> socket_start_incoming_migration_internal() sets both it and
> transport_data to non-NULL values.)
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>

That probably deserves a fixes: a59136f

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/migration.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index bcc385b94b..cdb2e76d02 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -287,8 +287,9 @@ void migration_incoming_state_destroy(void)
>          g_array_free(mis->postcopy_remote_fds, TRUE);
>          mis->postcopy_remote_fds = NULL;
>      }
> -    if (mis->transport_cleanup) {
> +    if (mis->transport_cleanup && mis->transport_data) {
>          mis->transport_cleanup(mis->transport_data);
> +        mis->transport_data = NULL;
>      }
>  
>      qemu_event_reset(&mis->main_thread_load_event);
> -- 
> 2.34.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


