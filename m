Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 246913B7014
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 11:26:07 +0200 (CEST)
Received: from localhost ([::1]:44666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyA0M-0005V3-4z
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 05:26:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ly9zX-0004m8-Gz
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 05:25:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ly9zT-0001Eh-9r
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 05:25:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624958709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=atPza+SmjAHheCbWUO9Dm15BsmVnWCqg93r1yfQzyRA=;
 b=DoFOGHVoE4LwKh/lrJum6GVmIkzhTBgTaB0WFdOkRwIQCkI0BL5KV/ITVCscJAlqISOtmW
 CgH+s63ZrctWew15AQ4r9N5RspCU2NEkFZ3YAzRmn6S8RDVspAzhORLXKk5U3WiUPPeCQD
 qfVf98NJrGhQ1X68zIIOgiOv/NYr7FY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-CCYd_MDwM1G0jzpbldgxHA-1; Tue, 29 Jun 2021 05:25:07 -0400
X-MC-Unique: CCYd_MDwM1G0jzpbldgxHA-1
Received: by mail-wr1-f70.google.com with SMTP id
 b3-20020a05600018a3b029011a84f85e1cso5745429wri.10
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 02:25:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=atPza+SmjAHheCbWUO9Dm15BsmVnWCqg93r1yfQzyRA=;
 b=Y84JFK1APmv7MIPF5hrxRQl/tOtV9u8KZU5vR8CR4V6qwoT69EENc5Fzgn4MB7zos5
 RWWx+dWqTpOujKmpcpKANtbkfjwB0YC9KM1q6pFKKlFUyYYqRPpp8wI3qnqK0MLUek6W
 DkDERM+0Ma7M54ZR2fbJiXSE3lcZHlwPLZRPcXREHpmAvRpe9p7AMNIod9oaWFDCgquW
 91jXf8v8cNdJnEqFZ0F19Kv9B7r0w2A4azUjwoTdbp7lIlAR1yP5FNR6uo+ddP3x8Px9
 J3k0HAtw6mWkRz/CaKS+3Aw4RwWtX9iXWpgwM9dVrO8RK5037mEO4HVI2bVRrwRU4W5l
 7t+g==
X-Gm-Message-State: AOAM5330wt7WoK6OncOPeyVb6VajXlUB5IAZt39Af/Rgz4JcYJwNrGCf
 XDSQyvfhFRJQwc/HkrcFIH/y3qnSDUm6vEAYH2eIUezpGYG6XNAEvYT+74TlKVXR9yd2NyqPRAh
 Qb98JQcURvY8o8Kw=
X-Received: by 2002:a05:600c:3399:: with SMTP id
 o25mr31783860wmp.115.1624958706301; 
 Tue, 29 Jun 2021 02:25:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzE6A33voL8C0y0GGxj7lN3qm531CoTUd2L/Z126+jJUBxxs7eeaZ3v29mfXgTrtY8Ouqy85g==
X-Received: by 2002:a05:600c:3399:: with SMTP id
 o25mr31783832wmp.115.1624958706065; 
 Tue, 29 Jun 2021 02:25:06 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id m6sm20897151wrw.9.2021.06.29.02.25.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 02:25:05 -0700 (PDT)
Date: Tue, 29 Jun 2021 10:25:03 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v2 1/1] migration: Unregister yank if migration setup fails
Message-ID: <YNrm7+QyoIXDd7C4@work-vm>
References: <20210629050522.147057-1-leobras@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210629050522.147057-1-leobras@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
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
Cc: armbru@redhat.com, qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Leonardo Bras (leobras@redhat.com) wrote:
> Currently, if a qemu instance is started with "-incoming defer" and
> an incorect parameter is passed to "migrate_incoming", it will print the
> expected error and reply with "duplicate yank instance" for any upcoming
> "migrate_incoming" command.
> 
> This renders current qemu process unusable, and requires a new qemu
> process to be started before accepting a migration.
> 
> This is caused by a yank_register_instance() that happens in
> qemu_start_incoming_migration() but is never reverted if any error
> happens.
> 
> Solves this by unregistering the instance if anything goes wrong
> in the function, allowing a new "migrate_incoming" command to be
> accepted.
> 
> Fixes: b5eea99ec2f ("migration: Add yank feature", 2021-01-13)
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1974366
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> 
> ---
> Changes since v1:
>  - Add ERRP_GUARD() at the beginning of the function, so it deals with
>    errp passed as NULL, and does correct error propagation.

Thanks;


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/migration.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 4228635d18..af0c72609f 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -454,6 +454,7 @@ void migrate_add_address(SocketAddress *address)
>  
>  static void qemu_start_incoming_migration(const char *uri, Error **errp)
>  {
> +    ERRP_GUARD();
>      const char *p = NULL;
>  
>      if (!yank_register_instance(MIGRATION_YANK_INSTANCE, errp)) {
> @@ -474,9 +475,13 @@ static void qemu_start_incoming_migration(const char *uri, Error **errp)
>      } else if (strstart(uri, "fd:", &p)) {
>          fd_start_incoming_migration(p, errp);
>      } else {
> -        yank_unregister_instance(MIGRATION_YANK_INSTANCE);
>          error_setg(errp, "unknown migration protocol: %s", uri);
>      }
> +
> +    if (*errp) {
> +        yank_unregister_instance(MIGRATION_YANK_INSTANCE);
> +    }
> +
>  }
>  
>  static void process_incoming_migration_bh(void *opaque)
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


