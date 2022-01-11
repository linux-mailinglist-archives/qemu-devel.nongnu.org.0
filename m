Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC8248AF27
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 15:09:42 +0100 (CET)
Received: from localhost ([::1]:38936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7HqH-0007Oo-7d
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 09:09:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1n7HSZ-0000Zj-DE
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 08:45:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1n7HSX-0004qS-4h
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 08:45:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641908708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jqRNthw8l6YR5bO17KHhoemyJ2Feu2hpgkObHDYWdBU=;
 b=Movzi+DYbR3BOgg8dvnlVaCs8v8XmGk2+0p+a0GVmLcR1KmJc6aag367j+n9sBmkFJLw6f
 pD9LPcT/ATZ5tY+7FudaQp1hbtYqJG3marpHmlv6GQkU7lliJC65A73FylQh0bMGcmyZ6s
 s6ofNS+KxcMkwza4jkavjoFbFd1ZHiw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-oJaDyUnVPdG1ScjRebWXXw-1; Tue, 11 Jan 2022 08:45:07 -0500
X-MC-Unique: oJaDyUnVPdG1ScjRebWXXw-1
Received: by mail-wm1-f70.google.com with SMTP id
 v190-20020a1cacc7000000b0034657bb6a66so3199339wme.6
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 05:45:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jqRNthw8l6YR5bO17KHhoemyJ2Feu2hpgkObHDYWdBU=;
 b=Nki2RIkoDAcj/RihT9LRHJdzjtTXpHklLQoWbKERCBGORehtF6ZWi727701UawIbmh
 xInKML8AzjEVneFpOltPxLWAPZEc8LzGkHwNi3gJ5RkcAy3Motq4RasKHK008ywnz2Cc
 JB4E1W7f0tC+1jlmJoWdxQOSd4HoBuPI+zTsrQ/ysl6MBbcZuc1MwfnMZ7WUczyrwkWK
 3auIv2iC4YB27dpsfmqky82AsO6lVE4Y9oSL9rNqVXHDhmgAg8lBr3uHQjmrM2KUemox
 UgByWjVXeooF8aO7fb6uVuZCnDwCPfaVAlNg7qgR3Ko+81FSlNL76BMGOjE9jPQ1s7H5
 FlaA==
X-Gm-Message-State: AOAM533jfFXRC/I9D1SWdIwa17eV/88m6b94BjhdWWUZRO9jUde+qStE
 L3jmHxie5/XJseH+P2vRX40SDEpFvvvCYY0OnmSN6Rd7ShXAocicWAWoIJvx1kOfR9/l6w4R9lg
 YJSyaT3aIywkKt3Y=
X-Received: by 2002:a5d:6da3:: with SMTP id u3mr3705496wrs.712.1641908705751; 
 Tue, 11 Jan 2022 05:45:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwzvwZIxeUh+IiE0EeXbNDNnwQR/v6rAroKByzF64r5DYq8NRqUuHqzYHYd/ihQVEpN6AfXeA==
X-Received: by 2002:a5d:6da3:: with SMTP id u3mr3705483wrs.712.1641908705606; 
 Tue, 11 Jan 2022 05:45:05 -0800 (PST)
Received: from work-vm (82-132-238-227.dab.02.net. [82.132.238.227])
 by smtp.gmail.com with ESMTPSA id l18sm1766964wms.24.2022.01.11.05.45.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 05:45:05 -0800 (PST)
Date: Tue, 11 Jan 2022 13:45:02 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v3 5/6] migration: simplify do_compress_ram_page
Message-ID: <Yd2J3meU2jP012SJ@work-vm>
References: <20220111124556.4892-1-quintela@redhat.com>
 <20220111124556.4892-6-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220111124556.4892-6-quintela@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
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
> The goto is not needed at all.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/ram.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index fa49d22e69..422c6bce28 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -1341,12 +1341,11 @@ static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
>  {
>      RAMState *rs = ram_state;
>      uint8_t *p = block->host + offset;
> -    bool zero_page = false;
>      int ret;
>  
>      if (save_zero_page_to_file(rs, f, block, offset)) {
> -        zero_page = true;
> -        goto exit;
> +        ram_release_page(block->idstr, offset);
> +        return true;
>      }
>  
>      save_page_header(rs, f, block, offset | RAM_SAVE_FLAG_COMPRESS_PAGE);
> @@ -1361,12 +1360,8 @@ static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
>      if (ret < 0) {
>          qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
>          error_report("compressed data failed!");
> -        return false;
>      }
> -
> -exit:
> -    ram_release_page(block->idstr, offset);
> -    return zero_page;
> +    return false;
>  }
>  
>  static void
> -- 
> 2.34.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


