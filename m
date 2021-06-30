Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3F03B80BA
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 12:16:27 +0200 (CEST)
Received: from localhost ([::1]:36388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyXGc-0000OR-C6
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 06:16:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lyXEw-00082L-6W
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 06:14:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lyXEu-0006dz-EX
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 06:14:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625048079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6RP/nz7jyfi4zBG2hCLVANDm9CiVVlbGM2PI84B2m4U=;
 b=UkZA7BiOtqS4LSzY/hX13okgB+g4ZSSzH71WdSt5ulv6DQpM+0gHY5WrcuCbabAyZOA+Yd
 ZpAK2VMzkllfGYzW8tz61iBH9rByVoEF7/UHKdUysnTWaULJZkXkNurIro3PIKCKM10DfH
 GJZ01621DTDy2Hvb4klPOamlwnmeHr8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-l8yDZRR6PhWYIgDf4qM_Ig-1; Wed, 30 Jun 2021 06:14:38 -0400
X-MC-Unique: l8yDZRR6PhWYIgDf4qM_Ig-1
Received: by mail-wm1-f71.google.com with SMTP id
 u64-20020a1cdd430000b02901ed0109da5fso2536397wmg.4
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 03:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6RP/nz7jyfi4zBG2hCLVANDm9CiVVlbGM2PI84B2m4U=;
 b=gdEtENc/JqlA1K/j9LFu5lFGX9npX0dW+FXbULM2uMC/VKuLF66Q/QM27cqXFneKor
 vt5zyazhevLUSnkgg90BprhZPiHLmWqgpaqEYQsDs4xUUc7GGCrBKgowO8M/uY9oTjd5
 3W+8kQtsQzSrOJbX3Ut6BlnCshZqH6eIXTGx5tn9m1RtB+rZPaiVLQsDK6qNRqfs3AH5
 FfZDSDdAQtvqwzxUjFQpOr8igQsDEyuSO4Ors4XpUkDaaktpslCscWi1xgqtwWQgdaoZ
 OFSgq9wNByL9ac73XadbiG1nBSYhtcCdfaANV+rKIGZly/+F1hHBUlOb/xpn826DE3oZ
 cG3Q==
X-Gm-Message-State: AOAM530QDKPr3FHOxgLmgNw32HXZtQ6OcJJirF7B6HcSv7S3MR9PNKxc
 rsmhbI6qfjafB2T1tpAprKvp3bMkXEYnH0Z6ADcpHfBqqwEduaY/ok+FIbbdsEr/xo27kNyS2mP
 FoNcDtA3uGbOnaeM=
X-Received: by 2002:a05:600c:3652:: with SMTP id
 y18mr3687091wmq.63.1625048076164; 
 Wed, 30 Jun 2021 03:14:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyc+ojOnRcHA4HqwvzCOPKWXRkmFShjoCh3P7EXbQBnFGalSc8Qmb/yxhtH2Q0fo0KrhlLkKw==
X-Received: by 2002:a05:600c:3652:: with SMTP id
 y18mr3687069wmq.63.1625048075972; 
 Wed, 30 Jun 2021 03:14:35 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id b11sm5754815wmj.25.2021.06.30.03.14.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 03:14:35 -0700 (PDT)
Date: Wed, 30 Jun 2021 11:14:33 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Lin Feng <linfeng23@huawei.com>
Subject: Re: [v4] migration: fix the memory overwriting risk in add_to_iovec
Message-ID: <YNxECWICB+9r1wKQ@work-vm>
References: <20210623015104.218-1-linfeng23@huawei.com>
 <20210625062138.1899-1-linfeng23@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210625062138.1899-1-linfeng23@huawei.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: wangxinxin.wang@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Lin Feng (linfeng23@huawei.com) wrote:
> From: Feng Lin <linfeng23@huawei.com>
> 
> When testing migration, a Segmentation fault qemu core is generated.
> 0  error_free (err=0x1)
> 1  0x00007f8b862df647 in qemu_fclose (f=f@entry=0x55e06c247640)
> 2  0x00007f8b8516d59a in migrate_fd_cleanup (s=s@entry=0x55e06c0e1ef0)
> 3  0x00007f8b8516d66c in migrate_fd_cleanup_bh (opaque=0x55e06c0e1ef0)
> 4  0x00007f8b8626a47f in aio_bh_poll (ctx=ctx@entry=0x55e06b5a16d0)
> 5  0x00007f8b8626e71f in aio_dispatch (ctx=0x55e06b5a16d0)
> 6  0x00007f8b8626a33d in aio_ctx_dispatch (source=<optimized out>, callback=<optimized out>, user_data=<optimized out>)
> 7  0x00007f8b866bdba4 in g_main_context_dispatch ()
> 8  0x00007f8b8626cde9 in glib_pollfds_poll ()
> 9  0x00007f8b8626ce62 in os_host_main_loop_wait (timeout=<optimized out>)
> 10 0x00007f8b8626cffd in main_loop_wait (nonblocking=nonblocking@entry=0)
> 11 0x00007f8b862ef01f in main_loop ()
> Using gdb print the struct QEMUFile f = {
>   ...,
>   iovcnt = 65, last_error = 21984,
>   last_error_obj = 0x1, shutdown = true
> }
> Well iovcnt is overflow, because the max size of MAX_IOV_SIZE is 64.
> struct QEMUFile {
>     ...;
>     struct iovec iov[MAX_IOV_SIZE];
>     unsigned int iovcnt;
>     int last_error;
>     Error *last_error_obj;
>     bool shutdown;
> };
> iovcnt and last_error is overwrited by add_to_iovec().
> Right now, add_to_iovec() increase iovcnt before check the limit.
> And it seems that add_to_iovec() assumes that iovcnt will set to zero
> in qemu_fflush(). But qemu_fflush() will directly return when f->shutdown
> is true.
> 
> The situation may occur when libvirtd restart during migration, after
> f->shutdown is set, before calling qemu_file_set_error() in
> qemu_file_shutdown().
> 
> So the safiest way is checking the iovcnt before increasing it.
> 
> Signed-off-by: Feng Lin <linfeng23@huawei.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/qemu-file.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> index d6e03dbc0e..6879615197 100644
> --- a/migration/qemu-file.c
> +++ b/migration/qemu-file.c
> @@ -416,6 +416,11 @@ static int add_to_iovec(QEMUFile *f, const uint8_t *buf, size_t size,
>      {
>          f->iov[f->iovcnt - 1].iov_len += size;
>      } else {
> +        if (f->iovcnt >= MAX_IOV_SIZE) {
> +            /* Should only happen if a previous fflush failed */
> +            assert(f->shutdown || !qemu_file_is_writeable(f));
> +            return 1;
> +        }
>          if (may_free) {
>              set_bit(f->iovcnt, f->may_free);
>          }
> -- 
> 2.23.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


