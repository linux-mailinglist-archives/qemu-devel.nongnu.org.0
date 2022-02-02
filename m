Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C90A84A6E93
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 11:22:24 +0100 (CET)
Received: from localhost ([::1]:52268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFCmN-0000AR-DM
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 05:22:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nFCgS-0006zD-2f
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 05:16:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nFCgJ-0006IV-4n
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 05:16:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643796957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KiLjbZ5zETyx9trxUy9Xx+S4eDlHfUXmWdo7G5/x2TU=;
 b=LjYJI0rQ69zWd1nF7Vp6Pwr8MDi70KA/V8ggdKYAdTO9bAFWhZ3bRoNkKTyr5E4efj6T8o
 +UhuaDmo1sbfu0JP8YPfzUkO1VVNEjmp7Dg6bQP+zMqYR4COh2wvGs2lfpRambKcSg1a6p
 2ik/QYWvBHhesFB13y+PAI7aub3I0ys=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-qDZh1NbGMqCpsmT7rzQdIg-1; Wed, 02 Feb 2022 05:15:54 -0500
X-MC-Unique: qDZh1NbGMqCpsmT7rzQdIg-1
Received: by mail-wr1-f70.google.com with SMTP id
 c9-20020adfa709000000b001dde29c3202so6695653wrd.22
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 02:15:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KiLjbZ5zETyx9trxUy9Xx+S4eDlHfUXmWdo7G5/x2TU=;
 b=e+eB/g+kS/hf2ao3SSoolRDcNH3TKLhZCuIpfvUruwj3Z2ijT7abFvuAP68Lh1gPZJ
 na//Kc6JSuUk1rt5UykWBpUcwzm+jkt3r+iUZZlW/6hho6KfiBgbbyGPAPIfVmlS6Dkv
 YFrmQojfU8EQbiY5zBXLQEdJQOVi1Sif3Fi4CByoSxWC2MZoI0tOcLTZx/h0DaLyv+cE
 FxYLwhKPMaFfUiwmyuenZ6dOXFH0+y+pwbh3kU1ofBL3inoVsqvFnBUpkxQzze1YbHFu
 4VZC0Vngy23cxE4sk6XYihZULLe1WRC6Ltr0O2WMANh4w/Zt6DrkSDK7IddVqDH/Qn6A
 OC/A==
X-Gm-Message-State: AOAM530jguN4LGq1i6nLsqum+tOZ1KBbwYPp0oTATUD3C2p47UNGZ2ve
 tf3/yXPKSzlM3xjx0SET6qHOWk+anhoKGbU0skfke6U/LTA5LgjPYzXeWkUoDoqXtFlFkZBzod0
 /O6GZ8KRkvaNofks=
X-Received: by 2002:a1c:a9d7:: with SMTP id s206mr5394184wme.38.1643796953327; 
 Wed, 02 Feb 2022 02:15:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxJ9n9YHQ4LwJy8JCApV4f6JcjGDo2NKyidvYOqd4iEFJwryLjwgXOVZp7hiGWK72zXaYRmLQ==
X-Received: by 2002:a1c:a9d7:: with SMTP id s206mr5394172wme.38.1643796953107; 
 Wed, 02 Feb 2022 02:15:53 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id q13sm17232337wrd.78.2022.02.02.02.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 02:15:52 -0800 (PST)
Date: Wed, 2 Feb 2022 10:15:49 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Jack Wang <jinpu.wang@ionos.com>
Subject: Re: [PATCH 2/2] migration/rdma: set the REUSEADDR option for
 destination
Message-ID: <YfpZ1Wp5DsQLejOj@work-vm>
References: <20220201151136.52157-1-jinpu.wang@ionos.com>
 <20220201151136.52157-2-jinpu.wang@ionos.com>
MIME-Version: 1.0
In-Reply-To: <20220201151136.52157-2-jinpu.wang@ionos.com>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
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
Cc: qemu-devel@nongnu.org, pankaj.gupta@ionos.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Jack Wang (jinpu.wang@ionos.com) wrote:
> This allow address could be reused to avoid rdma_bind_addr error
> out.

In what case do you get the error - after a failed migrate and then a
retry?

Dave

> Signed-off-by: Jack Wang <jinpu.wang@ionos.com>
> ---
>  migration/rdma.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/migration/rdma.c b/migration/rdma.c
> index 2e223170d06d..b498ef013c77 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -2705,6 +2705,7 @@ static int qemu_rdma_dest_init(RDMAContext *rdma, Error **errp)
>      char ip[40] = "unknown";
>      struct rdma_addrinfo *res, *e;
>      char port_str[16];
> +    int reuse = 1;
>  
>      for (idx = 0; idx < RDMA_WRID_MAX; idx++) {
>          rdma->wr_data[idx].control_len = 0;
> @@ -2740,6 +2741,12 @@ static int qemu_rdma_dest_init(RDMAContext *rdma, Error **errp)
>          goto err_dest_init_bind_addr;
>      }
>  
> +    ret = rdma_set_option(listen_id, RDMA_OPTION_ID, RDMA_OPTION_ID_REUSEADDR,
> +			  &reuse, sizeof reuse);
> +    if (ret) {
> +        ERROR(errp, "Error: could not set REUSEADDR option");
> +        goto err_dest_init_bind_addr;
> +    }
>      for (e = res; e != NULL; e = e->ai_next) {
>          inet_ntop(e->ai_family,
>              &((struct sockaddr_in *) e->ai_dst_addr)->sin_addr, ip, sizeof ip);
> -- 
> 2.25.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


