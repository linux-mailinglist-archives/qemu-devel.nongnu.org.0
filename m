Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDFC3C6F0A
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 12:57:57 +0200 (CEST)
Received: from localhost ([::1]:56644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3G6u-0005Fe-8T
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 06:57:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m3G5x-0004aI-NP
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 06:56:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m3G5v-0003fs-Ri
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 06:56:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626173814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=srrOsB14J0bpQs/jxZCbTwPe3OZhINa5Is9WAM+yN/0=;
 b=AeGT2hahYE7dG1aBV2vmSPjk+c01ZkVzJeFVHkKW8hlU2lGipq6XRHPtVADFbSzVVqKRrf
 5eeQ0PXfeqMPdKlF6f14B+sfB4SErkv4S6kBEHyetJqR+CXcCNTVuPF4+msccU7YFU69e8
 Njq+m0HjGiViJd7m0rK6JBbt/XHpHAI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-q3F4QmXNM9-5ZsycUwmWpA-1; Tue, 13 Jul 2021 06:56:53 -0400
X-MC-Unique: q3F4QmXNM9-5ZsycUwmWpA-1
Received: by mail-wm1-f72.google.com with SMTP id
 m31-20020a05600c3b1fb02902082e9b2132so369594wms.5
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 03:56:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=srrOsB14J0bpQs/jxZCbTwPe3OZhINa5Is9WAM+yN/0=;
 b=OcOReY8usBGzXZY/8v+6uk8MBAvsRXFAYgObt+Z2RtXTvC07DDYQ3u+i2VebYtKXaY
 xKPB3sqgatvEFnMY5dFQqCliT9Y+RL7E2xgzzlkuhrH+G878R1oYt4mwKfGeXiS3nonP
 QR29iGzknG51T9sfmF0at1lUkdXBe8cjhrRU2LOa6kB5lIv7PynugGrDQwzMEPqho56d
 E/vQYqBZBVoSeWorVrZ44G6StejX8Pse2kGKBH809p4MHmiQH4HOR+CuPNFVJI8X5zoS
 PpRTpc1pY4Ky7YhkfolJ3iQiQ9wtXCCTVoUHoXHAkZQWzS8xTJqjxHqggQKBBiLF3X+H
 NuVQ==
X-Gm-Message-State: AOAM532nfEfTagGVPe8sBtMzQQr3EjzkoGB4MjeiWbw9ZdAqs0dsT5OZ
 I2EG5oyBc6K23IOg37pEc0gpGJUGx2cimYhUC2veEFUHHTEy8ymVvsecwkqwj0xWGnb5Nf84Gws
 50UEr4cNMZkyWqyE=
X-Received: by 2002:a05:600c:1c0d:: with SMTP id
 j13mr4458638wms.34.1626173812348; 
 Tue, 13 Jul 2021 03:56:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxG81XpiqYHGeRy/akS8+FwwzZoiqyqSTauq7kIjtEVQCsXazQmr9HnALkBNSgAzykLT2zBYQ==
X-Received: by 2002:a05:600c:1c0d:: with SMTP id
 j13mr4458616wms.34.1626173812151; 
 Tue, 13 Jul 2021 03:56:52 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id k13sm13125911wrp.34.2021.07.13.03.56.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 03:56:50 -0700 (PDT)
Date: Tue, 13 Jul 2021 11:56:48 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: Re: [PATCH] migration/rdma: prevent from double free the same mr
Message-ID: <YO1xcLQfgK9vBK20@work-vm>
References: <20210708144521.1959614-1-lizhijian@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20210708144521.1959614-1-lizhijian@cn.fujitsu.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Li Zhijian (lizhijian@cn.fujitsu.com) wrote:
> backtrace:
> '0x00007ffff5f44ec2 in __ibv_dereg_mr_1_1 (mr=0x7fff1007d390) at /home/lizhijian/rdma-core/libibverbs/verbs.c:478
> 478             void *addr              = mr->addr;
> (gdb) bt
>  #0  0x00007ffff5f44ec2 in __ibv_dereg_mr_1_1 (mr=0x7fff1007d390) at /home/lizhijian/rdma-core/libibverbs/verbs.c:478
>  #1  0x0000555555891fcc in rdma_delete_block (block=<optimized out>, rdma=0x7fff38176010) at ../migration/rdma.c:691
>  #2  qemu_rdma_cleanup (rdma=0x7fff38176010) at ../migration/rdma.c:2365
>  #3  0x00005555558925b0 in qio_channel_rdma_close_rcu (rcu=0x555556b8b6c0) at ../migration/rdma.c:3073
>  #4  0x0000555555d652a3 in call_rcu_thread (opaque=opaque@entry=0x0) at ../util/rcu.c:281
>  #5  0x0000555555d5edf9 in qemu_thread_start (args=0x7fffe88bb4d0) at ../util/qemu-thread-posix.c:541
>  #6  0x00007ffff54c73f9 in start_thread () at /lib64/libpthread.so.0
>  #7  0x00007ffff53f3b03 in clone () at /lib64/libc.so.6 '
> 
> Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>

Queued

> ---
>  migration/rdma.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/migration/rdma.c b/migration/rdma.c
> index b6cc4bef4a8..0f22b8227c0 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -1143,6 +1143,7 @@ static int qemu_rdma_reg_whole_ram_blocks(RDMAContext *rdma)
>  
>      for (i--; i >= 0; i--) {
>          ibv_dereg_mr(local->block[i].mr);
> +        local->block[i].mr = NULL;
>          rdma->total_registrations--;
>      }
>  
> -- 
> 2.30.2
> 
> 
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


