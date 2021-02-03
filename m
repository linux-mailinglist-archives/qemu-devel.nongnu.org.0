Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B7730E362
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 20:39:39 +0100 (CET)
Received: from localhost ([::1]:44092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7O02-0005LF-MS
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 14:39:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7NSJ-0001u5-QN
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:04:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7NS9-0002yl-12
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:04:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612379075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W2yUObHqdTvXgPpYU0xv7G0bfsiTV52my9ghb9WluSk=;
 b=VmWPyUbxAqP19OrVlvNv2MIwp0YVQxnIGOgQ+eKUlPIfNUbXfSUtFUFR9WsFeLodeIljEl
 YGujtm7w/tyCmMkLcdP5eFkYKHmxUkgcgoAE33XDYdSGfoEWuhGnM+WnK3ao1iOcMZFV57
 7gpUnyUDNPPOPNOV3ZWD8rsHE6oAa+k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-7aAeZxfOMHSVTnpqSauH4w-1; Wed, 03 Feb 2021 14:04:33 -0500
X-MC-Unique: 7aAeZxfOMHSVTnpqSauH4w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0130E107ACE3;
 Wed,  3 Feb 2021 19:04:32 +0000 (UTC)
Received: from work-vm (ovpn-115-70.ams2.redhat.com [10.36.115.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EB99860C5F;
 Wed,  3 Feb 2021 19:04:29 +0000 (UTC)
Date: Wed, 3 Feb 2021 19:04:27 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Chuan Zheng <zhengchuan@huawei.com>
Subject: Re: [PATCH v4 11/18] migration/rdma: record host_port for multifd RDMA
Message-ID: <20210203190427.GU2950@work-vm>
References: <1612339311-114805-1-git-send-email-zhengchuan@huawei.com>
 <1612339311-114805-12-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1612339311-114805-12-git-send-email-zhengchuan@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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
Cc: yubihong@huawei.com, berrange@redhat.com, zhang.zhanghailiang@huawei.com,
 quintela@redhat.com, qemu-devel@nongnu.org, xiexiangyou@huawei.com,
 alex.chen@huawei.com, wanghao232@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Chuan Zheng (zhengchuan@huawei.com) wrote:
> Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
> ---
>  migration/migration.c | 1 +
>  migration/migration.h | 3 +++
>  migration/rdma.c      | 3 +++
>  3 files changed, 7 insertions(+)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 129c81a..b8f4844 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1925,6 +1925,7 @@ void migrate_init(MigrationState *s)
>      s->postcopy_after_devices = false;
>      s->migration_thread_running = false;
>      s->enabled_rdma_migration = false;
> +    s->host_port = NULL;
>      error_free(s->error);
>      s->error = NULL;
>      s->hostname = NULL;
> diff --git a/migration/migration.h b/migration/migration.h
> index da5681b..537ee09 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -285,6 +285,9 @@ struct MigrationState {
>       * Enable RDMA migration
>       */
>      bool enabled_rdma_migration;
> +
> +    /* Need by Multi-RDMA */
> +    char *host_port;

Please keep that next to the char *hostname, since they go together.
Also, 'Needed'

Dave

>  };
>  
>  void migrate_set_state(int *state, int old_state, int new_state);
> diff --git a/migration/rdma.c b/migration/rdma.c
> index ed8a015..9654b87 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -4206,6 +4206,8 @@ void rdma_start_outgoing_migration(void *opaque,
>          goto err;
>      }
>  
> +    s->host_port = g_strdup(host_port);
> +
>      ret = qemu_rdma_source_init(rdma,
>          s->enabled_capabilities[MIGRATION_CAPABILITY_RDMA_PIN_ALL], errp);
>  
> @@ -4250,6 +4252,7 @@ void rdma_start_outgoing_migration(void *opaque,
>  
>      s->to_dst_file = qemu_fopen_rdma(rdma, "wb");
>      migrate_fd_connect(s, NULL);
> +    g_free(s->host_port);
>      return;
>  return_path_err:
>      qemu_rdma_cleanup(rdma);
> -- 
> 1.8.3.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


