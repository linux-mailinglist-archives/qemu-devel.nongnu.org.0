Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DE7461D57
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 19:08:34 +0100 (CET)
Received: from localhost ([::1]:35986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrl4r-0008Hv-GI
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 13:08:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mrkzq-0003N6-P2
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 13:03:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mrkzo-00081Q-SQ
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 13:03:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638209000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rcm/QeYE6c8pqeT75kpm2KWwVFfbHC41Z0BODEg3FpU=;
 b=WDXDiXVN/9+v7KBg7/XIwQrWZc2MJ5GG6AmwjZLaVKsQqfdmTnDS4ZutuYIWMutvmHS4ZM
 O1ACzPP9oS8OITxDncHbAK5ShOiejcpLNecVU2cPSlzbK+nrVyKTeeYKcq1ObS98Qvd4t5
 exp4xgbe1tmcKJvGuFeFOBni90qReKk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-499-su3p78VAMWKbTl53OuFwbg-1; Mon, 29 Nov 2021 13:03:18 -0500
X-MC-Unique: su3p78VAMWKbTl53OuFwbg-1
Received: by mail-wm1-f71.google.com with SMTP id
 v62-20020a1cac41000000b0033719a1a714so8992373wme.6
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 10:03:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rcm/QeYE6c8pqeT75kpm2KWwVFfbHC41Z0BODEg3FpU=;
 b=VQe78dO952mW4+Jj6htBu06TMkluQE07tidx/MfO2440615J1CojTb5LSBHnLeeeR5
 FvAEfoMSgn7FMB/ujvxIjwcaxzpQgUYBFHwTeKApea0pubt4hTUokfifjnT/EkRo+QKc
 92FrLLQDAJRKqe7tzSMQHwFwdLhuzNXnqJ4aYQVXiZ7t0tY4KrRo3oF/ZUQfibYJoJwH
 78UwF/56b910doNxKqd82vKbJ0uo1047HatyfqY7DeBa4+xQF4mQJSUtrowhWODtiQoF
 E+Khk8W9g8OsksgNIxejrspOWrE6JZNKZqtOtA3284P765K5PQ4PTMLUkJ/DovtntoKh
 H0lA==
X-Gm-Message-State: AOAM53377uuDoMKdaqmyDmR3rObgJpn/psMPqCXdm+If3nW3P+oUFwWg
 e76nqMh1yUdCY3+jF9roNmSuqxk9bkSNxVNT7xGCfoNSiMgpudwFUS311pv0w8smraxLEksJHab
 9/IBYXUvDj0BLnD4=
X-Received: by 2002:a05:6000:1a88:: with SMTP id
 f8mr36126524wry.54.1638208997597; 
 Mon, 29 Nov 2021 10:03:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx+uz+uQ9mWwtGde+IO2wnKLRkcXMcajPdC2YMNVZ/H40uIDFCXhZZOY6sixrLU1m6l+Fzx3A==
X-Received: by 2002:a05:6000:1a88:: with SMTP id
 f8mr36126498wry.54.1638208997412; 
 Mon, 29 Nov 2021 10:03:17 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id d6sm14691069wrn.53.2021.11.29.10.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 10:03:16 -0800 (PST)
Date: Mon, 29 Nov 2021 18:03:14 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v3 13/23] multifd: Make zstd use iov's
Message-ID: <YaUV4qsLQKVd2Niv@work-vm>
References: <20211124100617.19786-1-quintela@redhat.com>
 <20211124100617.19786-14-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211124100617.19786-14-quintela@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/multifd-zstd.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/migration/multifd-zstd.c b/migration/multifd-zstd.c
> index 2d5b61106c..259277dc42 100644
> --- a/migration/multifd-zstd.c
> +++ b/migration/multifd-zstd.c
> @@ -154,6 +154,9 @@ static int zstd_send_prepare(MultiFDSendParams *p, Error **errp)
>              return -1;
>          }
>      }
> +    p->iov[p->iovs_num].iov_base = z->zbuff;
> +    p->iov[p->iovs_num].iov_len = z->out.pos;
> +    p->iovs_num++;
>      p->next_packet_size = z->out.pos;
>      p->flags |= MULTIFD_FLAG_ZSTD;
>  
> @@ -173,10 +176,7 @@ static int zstd_send_prepare(MultiFDSendParams *p, Error **errp)
>   */
>  static int zstd_send_write(MultiFDSendParams *p, uint32_t used, Error **errp)
>  {
> -    struct zstd_data *z = p->data;
> -
> -    return qio_channel_write_all(p->c, (void *)z->zbuff, p->next_packet_size,
> -                                 errp);
> +    return qio_channel_writev_all(p->c, p->iov, p->iovs_num, errp);
>  }
>  
>  /**
> -- 
> 2.33.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


