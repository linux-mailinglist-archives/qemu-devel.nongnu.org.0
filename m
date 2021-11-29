Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FA9461D4A
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 19:03:46 +0100 (CET)
Received: from localhost ([::1]:56578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrl0D-00032t-1x
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 13:03:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mrkyb-0001B2-St
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 13:02:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mrkyY-0007uJ-M6
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 13:02:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638208921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gVQ4xzxFzydbRonSM9Cn5St2+eXUAm6zzPKa40s0RGM=;
 b=FtWflQogmxT7R/qXiLT32tYzWTua0eF6Z0W5IDaKjezVIoOfTigMlrQ1x7MivZOxsmFejQ
 w6M6E/cX0V/36rnX5Az1kGjyszhbFEVlqKNr5zq+K2J/N1muYXWFiD6hkvcVdK/LbMVqxI
 +GpxZSJiqZ2/GzM5pucKaC/3vsRxxNQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-3-atmbyQ0DNWmNdxj26sBtcg-1; Mon, 29 Nov 2021 13:01:59 -0500
X-MC-Unique: atmbyQ0DNWmNdxj26sBtcg-1
Received: by mail-wr1-f71.google.com with SMTP id
 k15-20020adfe8cf000000b00198d48342f9so3097229wrn.0
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 10:01:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gVQ4xzxFzydbRonSM9Cn5St2+eXUAm6zzPKa40s0RGM=;
 b=a5iW/7zMC9ctNd6mSKfDID/jk7TN9+aTUjyHBI7eZun9Ywfhz9FpBCtvJzbjMzxPvV
 eqaIE/2sY90XPMjv+ydRs1XuVAxjdm6+UXk2103kWmnxUqt0U0p17Yz6Dug9eqop5yNa
 NMcF916LzkVm9qDgXlPzOAm0oTuwlJYDXHTpF9h6jOxpbXr/raAg/FEAHm+jBVBOoJCC
 MkBSjKXMAMwjrN1CBxq/mn8Qid8HopeeHJUZAjJ8Ww26j7xslKbvcCIssRiJ4Zm0gVi/
 LflNhu7K8rnGgf4WOlxBQ42ccsbmaYzr2++zQWUdNyauelId8VWsSBMRaav7dBwcTlV6
 uF2w==
X-Gm-Message-State: AOAM532akdnO2VcxW8lqXVBJ/YC8KuNXszemjO+bTZFVuzC8bD2TbQU6
 DbbTZvx1kBOup2kTOEHMTfukgLREfhwsfAZCMAlOSwSHQafdTb70XG2PqAWJKKWd+ITWnVLyuwe
 a7J1cskOIqcFrKis=
X-Received: by 2002:a05:6000:1787:: with SMTP id
 e7mr35379259wrg.433.1638208918729; 
 Mon, 29 Nov 2021 10:01:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFfbZsdu4Tdpl8wtGyXlpwVJB0a0VYyJZWAcZNRfQoCcLjf4HjjxvPHJjWxU9w9gpuN/3iTg==
X-Received: by 2002:a05:6000:1787:: with SMTP id
 e7mr35379216wrg.433.1638208918403; 
 Mon, 29 Nov 2021 10:01:58 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id y6sm677wma.37.2021.11.29.10.01.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 10:01:57 -0800 (PST)
Date: Mon, 29 Nov 2021 18:01:56 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v3 12/23] multifd: Make zlib use iov's
Message-ID: <YaUVlGxmZzpYpZFT@work-vm>
References: <20211124100617.19786-1-quintela@redhat.com>
 <20211124100617.19786-13-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211124100617.19786-13-quintela@redhat.com>
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
> ---
>  migration/multifd-zlib.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
> index da6201704c..478a4af115 100644
> --- a/migration/multifd-zlib.c
> +++ b/migration/multifd-zlib.c
> @@ -143,6 +143,9 @@ static int zlib_send_prepare(MultiFDSendParams *p, Error **errp)
>          }
>          out_size += available - zs->avail_out;
>      }
> +    p->iov[p->iovs_num].iov_base = z->zbuff;
> +    p->iov[p->iovs_num].iov_len = out_size;
> +    p->iovs_num++;
>      p->next_packet_size = out_size;

Do you still need next_packet_size?

but:


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

>      p->flags |= MULTIFD_FLAG_ZLIB;
>  
> @@ -162,10 +165,7 @@ static int zlib_send_prepare(MultiFDSendParams *p, Error **errp)
>   */
>  static int zlib_send_write(MultiFDSendParams *p, uint32_t used, Error **errp)
>  {
> -    struct zlib_data *z = p->data;
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


