Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4733C4EDC68
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 17:08:58 +0200 (CEST)
Received: from localhost ([::1]:47184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZwPw-0001OZ-OF
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 11:08:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZwOs-0000Ky-Nd
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 11:07:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZwOo-00019c-0D
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 11:07:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648739264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=45pAakPFmKzlRv52RvqOoRb/QtUal8Xt7Z3LBeioSO0=;
 b=DlQ7dyn1pk91x6RRx1XAaA9/++YWg2HSuAJBb0xWGcChQlTWqXX8+klVxZTP3rjWdODnON
 C7rf2/6/lWJRyeCBp+KJO73HGHpvh1kt0Pn9nKlpbH1kubDbguVOgzOBxWTMNxdwHfoE2o
 foPVbP8Nh9/E7citGyEHsOwtRqe3La4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-MSm5CqsLMpO4ZKnYnkstfA-1; Thu, 31 Mar 2022 11:07:08 -0400
X-MC-Unique: MSm5CqsLMpO4ZKnYnkstfA-1
Received: by mail-qv1-f72.google.com with SMTP id
 fw9-20020a056214238900b0043522aa5b81so18744735qvb.21
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 08:07:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=45pAakPFmKzlRv52RvqOoRb/QtUal8Xt7Z3LBeioSO0=;
 b=IUXGQiq8MGUo8WBhm82zw0e+b9aG9xt8pthqpzurCYmLWDl6ZmZpNuVJRWSeR4Zfn6
 nn+nMoZ3EinNx6eUjGygcWeZSZtoKUSkluS/Sd9cvlL2vXOV6F/JpynYqmGmyMFoP5Lp
 xWZd5Zia8k/0wQQ2Q8y7Ut3ukfAcT2M9chCrtNqzIsQy06Vn56MejJxaRCTzsHrYwum4
 P3Yp0lU6Rlzwb4RQRMPtTr4y4QaG8JujxXbMot0yN4Emj5NkSLoJfF/eNyHQzcyPziMD
 4vEdMLGe6tdg4HtgSi3FXVsP4//GK10TE/8+9D3A9QwDYuuo821K2Mrc7WsfV8t4HuLx
 BGrQ==
X-Gm-Message-State: AOAM531U8gDOMx2tCy4CW6FeQ0lIQuoLjxsJuVeo+2+xK6rQO6Z3YJg9
 hMipduuDJqucylGvWhYqqtuNofpPVSAi1hiph4wQZ4ypPp082jvFskAjbBwGwMKuOmJAFsaWeGH
 1yAvb75CdEzFQ58vMmV40pmPf12Yfxebu+Vpz9PZRarZ58Z0tU5uzOfIC+F1YR6Ni
X-Received: by 2002:a05:622a:13d1:b0:2e1:fee4:8ffd with SMTP id
 p17-20020a05622a13d100b002e1fee48ffdmr4782102qtk.50.1648739224145; 
 Thu, 31 Mar 2022 08:07:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtJsnI6gMt5/SZ7tTdGG6A1HocXn4MEMjony3PrMo3wRsNcUSGgOxyPLdHAHsT6VrrGyailQ==
X-Received: by 2002:a05:622a:13d1:b0:2e1:fee4:8ffd with SMTP id
 p17-20020a05622a13d100b002e1fee48ffdmr4782055qtk.50.1648739223770; 
 Thu, 31 Mar 2022 08:07:03 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 j21-20020ac85f95000000b002e1cde99863sm19931061qta.83.2022.03.31.08.07.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 08:07:03 -0700 (PDT)
Date: Thu, 31 Mar 2022 11:07:02 -0400
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v3 16/19] migration: Export tls-[creds|hostname|authz]
 params to cmdline too
Message-ID: <YkXDlp2kfs0CqeZw@xz-m1.local>
References: <20220330213908.26608-1-peterx@redhat.com>
 <20220330213908.26608-17-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220330213908.26608-17-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 30, 2022 at 05:39:05PM -0400, Peter Xu wrote:
> It's useful for specifying tls credentials all in the cmdline (along with
> the -object tls-creds-*), especially for debugging purpose.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  migration/migration.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 899084f993..d99a0ecb7b 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -4349,6 +4349,9 @@ static Property migration_properties[] = {
>                        DEFAULT_MIGRATE_ANNOUNCE_STEP),
>      DEFINE_PROP_BOOL("x-postcopy-preempt-break-huge", MigrationState,
>                        postcopy_preempt_break_huge, true),
> +    DEFINE_PROP_STRING("tls-creds", MigrationState, parameters.tls_creds),
> +    DEFINE_PROP_STRING("tls-hostname", MigrationState, parameters.tls_hostname),
> +    DEFINE_PROP_STRING("tls-authz", MigrationState, parameters.tls_authz),
>  
>      /* Migration capabilities */
>      DEFINE_PROP_MIG_CAP("x-xbzrle", MIGRATION_CAPABILITY_XBZRLE),
> -- 

This simple patch will cause a double-free issue on tls-creds, etc. because
the properties are released before migration object, and since we also
explicitly free tls_* fields in migration_instance_finalize() then it hits
double free.  The details is in object_finalize() where the order is:

    object_property_del_all(obj);
    object_deinit(obj, ti);

It was overlooked when I was testing the preempt+tls functionality and
it'll trigger when we need a graceful quit of qemu.

Meanwhile there's another patch ordering issue I didn't notice when I post
this version: patch "migration: Add helpers to detect TLS capability" needs
to be before "migration: Enable TLS for preempt channel".  No code change
for this, it just needs some re-ordering to guarantee per-commit builds to
be successful.

I'll respin another version..

-- 
Peter Xu


