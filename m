Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0587461CCE
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 18:35:08 +0100 (CET)
Received: from localhost ([::1]:53518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrkYV-0000hS-IV
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 12:35:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mrkTp-0004rj-0T
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 12:30:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mrkTf-0003Vq-8D
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 12:30:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638207006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i4oF+O6Fi0sY4RbnqqhaXV27cQRz04zxLCT0bBUKHew=;
 b=Xcx1EFyfV/RxZB9+jnoaVIG4eBdhKyH5N6sx96lW0B2HWKSnIVBZwkkqtQCCDzWcl5HIAq
 16jXMf76dwUi9NUzoMecULKARR3lUuHB3WiMfiwe3k6hMAyj5utkXv93FNc+w0Y4PmCBzA
 eclU+uQ/xy1gvu0/eX36BIVwk6QMlSw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-598-hutXIIk9O6GBZa2j2Y82gA-1; Mon, 29 Nov 2021 12:30:04 -0500
X-MC-Unique: hutXIIk9O6GBZa2j2Y82gA-1
Received: by mail-wr1-f72.google.com with SMTP id
 p17-20020adff211000000b0017b902a7701so3056008wro.19
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 09:30:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=i4oF+O6Fi0sY4RbnqqhaXV27cQRz04zxLCT0bBUKHew=;
 b=7otdgJeH6PD6yjHPPSY/G7L5JIrEtNUbLUBaXiRnlUCKZwCgerUYKdVttyJNmTFUL2
 xvqwNOMXrNtNOWFyxw8oR+sJ5a6WSrAfrVSWlsRvEurvKbdCMEjEJd8KWa8K1tjJEjL9
 QJwgGBi8EkSq9yuiYUSWHniK2t9YFZYa/0aPbstZfBDRUWzb7zZwwHvfGiq0OYrjuMZU
 n3Kh4VJ/TBZlytPFjxy3Ns/R+Pp6AJHeDitZAO9+UTeLLbGLj2JOecNBQU/BHfuDKwmZ
 oq2fuFfGMr+c5iWor3W3wjM9nuIxcotSvZembrcK80C/x3kcYBxjFNhfpuHfgAn/5FUP
 eEOw==
X-Gm-Message-State: AOAM530m8Myh20yI4WOVm97H6iMfhwOwSPAc+AutiEH1HuXwyi9ynQ6+
 q2NT5WsqX54W3jYbZskkJ+/oi9++S8JAEY+nxNG1v6ziV7Bj6ebCnzmLtT/yhlD/qUvgC662Lte
 15il5ub8upcoVjJ4=
X-Received: by 2002:adf:e9c5:: with SMTP id l5mr34730484wrn.218.1638207003620; 
 Mon, 29 Nov 2021 09:30:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwqMG0G5LHqUZeRJkFTK/HqWEKdx4ncvxIdOWauMhHG6xP5+3wnbNe1EwU9ySS08fDvwxvZXw==
X-Received: by 2002:adf:e9c5:: with SMTP id l5mr34730462wrn.218.1638207003398; 
 Mon, 29 Nov 2021 09:30:03 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id l4sm14077636wrv.94.2021.11.29.09.30.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 09:30:02 -0800 (PST)
Date: Mon, 29 Nov 2021 17:30:00 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v3 10/23] multifd: Make zlib compression method not use
 iovs
Message-ID: <YaUOGC2BuBwoA7h+@work-vm>
References: <20211124100617.19786-1-quintela@redhat.com>
 <20211124100617.19786-11-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211124100617.19786-11-quintela@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
>  migration/multifd-zlib.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
> index e85ef8824d..da6201704c 100644
> --- a/migration/multifd-zlib.c
> +++ b/migration/multifd-zlib.c
> @@ -13,6 +13,7 @@
>  #include "qemu/osdep.h"
>  #include <zlib.h>
>  #include "qemu/rcu.h"
> +#include "exec/ramblock.h"
>  #include "exec/target_page.h"
>  #include "qapi/error.h"
>  #include "migration.h"
> @@ -98,8 +99,8 @@ static void zlib_send_cleanup(MultiFDSendParams *p, Error **errp)
>   */
>  static int zlib_send_prepare(MultiFDSendParams *p, Error **errp)
>  {
> -    struct iovec *iov = p->pages->iov;
>      struct zlib_data *z = p->data;
> +    size_t page_size = qemu_target_page_size();
>      z_stream *zs = &z->zs;
>      uint32_t out_size = 0;
>      int ret;
> @@ -113,8 +114,8 @@ static int zlib_send_prepare(MultiFDSendParams *p, Error **errp)
>              flush = Z_SYNC_FLUSH;
>          }
>  
> -        zs->avail_in = iov[i].iov_len;
> -        zs->next_in = iov[i].iov_base;
> +        zs->avail_in = page_size;
> +        zs->next_in = p->pages->block->host + p->pages->offset[i];
>  
>          zs->avail_out = available;
>          zs->next_out = z->zbuff + out_size;
> @@ -235,6 +236,7 @@ static void zlib_recv_cleanup(MultiFDRecvParams *p)
>  static int zlib_recv_pages(MultiFDRecvParams *p, Error **errp)
>  {
>      struct zlib_data *z = p->data;
> +    size_t page_size = qemu_target_page_size();
>      z_stream *zs = &z->zs;
>      uint32_t in_size = p->next_packet_size;
>      /* we measure the change of total_out */
> @@ -259,7 +261,6 @@ static int zlib_recv_pages(MultiFDRecvParams *p, Error **errp)
>      zs->next_in = z->zbuff;
>  
>      for (i = 0; i < p->pages->num; i++) {
> -        struct iovec *iov = &p->pages->iov[i];
>          int flush = Z_NO_FLUSH;
>          unsigned long start = zs->total_out;
>  
> @@ -267,8 +268,8 @@ static int zlib_recv_pages(MultiFDRecvParams *p, Error **errp)
>              flush = Z_SYNC_FLUSH;
>          }
>  
> -        zs->avail_out = iov->iov_len;
> -        zs->next_out = iov->iov_base;
> +        zs->avail_out = page_size;
> +        zs->next_out = p->pages->block->host + p->pages->offset[i];
>  
>          /*
>           * Welcome to inflate semantics
> @@ -281,8 +282,8 @@ static int zlib_recv_pages(MultiFDRecvParams *p, Error **errp)
>          do {
>              ret = inflate(zs, flush);
>          } while (ret == Z_OK && zs->avail_in
> -                             && (zs->total_out - start) < iov->iov_len);
> -        if (ret == Z_OK && (zs->total_out - start) < iov->iov_len) {
> +                             && (zs->total_out - start) < page_size);
> +        if (ret == Z_OK && (zs->total_out - start) < page_size) {
>              error_setg(errp, "multifd %d: inflate generated too few output",
>                         p->id);
>              return -1;
> -- 
> 2.33.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


