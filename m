Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F00493BC1
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 15:11:00 +0100 (CET)
Received: from localhost ([::1]:58328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nABfq-0001GK-TI
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 09:10:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nABEt-0002W0-Jk
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 08:43:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nABEk-0003Pb-R0
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 08:42:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642599772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BRG7jON15ZeJ+rbB40PIEuhk5rUxiJCuNGOQxbwGDn8=;
 b=V6bZDTM7A7cmKxT88A8IoIUfTRCkeZkNF83czwoAMlTbD+92OtLPfZ1w0k0O/4X7vA8rGJ
 p6DBr7ivk6Ga8rF1Ru5LppPUphbYCYX3MeDYgOYUl3wwvAAbYLn4QtmN1UwcvAPSK5KgM+
 /iHewAez73bA+ELTYgEXwgwQ/T6jpbA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-36-RKoGwy_nNgiNNK7XKYDyYQ-1; Wed, 19 Jan 2022 08:42:50 -0500
X-MC-Unique: RKoGwy_nNgiNNK7XKYDyYQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 c8-20020a05640227c800b003fdc1684cdeso2398400ede.12
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 05:42:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BRG7jON15ZeJ+rbB40PIEuhk5rUxiJCuNGOQxbwGDn8=;
 b=Mgy5Q2BuzynK4qDsMztGy9WcCASp6y2BkxKcdqLoqnt2BxvhpPX+Tubhu0He8BHwmF
 6kAqsU7YDG+s0X7EngYGFu5PbJQX/4aAb2ABEUh5nUk4kuzprT5zpWDGA+IdEi/+hMz9
 QpOst3F3VUuDdvyOp/r/vZOjs5Dut83SZmFBzbFzV5OgGdIz08fZFJLwfRMcvKG8ervR
 N7oE1N1+4j4QzXACHyrsgwN03vhcFVCKx0RSZCs3gOsLUYGunqOAK/6nArkVlndS+f+O
 Y2FeL9fcI0Y3tGCHy7r+fS6NVsT418YzYaPHszCTIl0phPa7V3m4hGY8R67DGLElnCVk
 2s9g==
X-Gm-Message-State: AOAM530pGftCZfodBpXmC1HBBPOheOtgGRDvI9BxOkinUX45QU2mlxOu
 HfBEW4HcvEJYtmDnNri1qhrDelV8Pps+lZKJo92bCRPlG9i2AgXijl9tjm75F3DOvB3P1e/vt18
 WJzNH04J2ak78P1o=
X-Received: by 2002:a05:600c:19d3:: with SMTP id
 u19mr3541935wmq.103.1642599769741; 
 Wed, 19 Jan 2022 05:42:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwuC6iME17ht+J8Ab+oA08U1TXVZhAT12LDz7bNXbkirSc+cXWIoPLPtD9zQrCISTsE4f72+Q==
X-Received: by 2002:a05:600c:19d3:: with SMTP id
 u19mr3541917wmq.103.1642599769551; 
 Wed, 19 Jan 2022 05:42:49 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id m6sm688020wms.34.2022.01.19.05.42.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 05:42:48 -0800 (PST)
Date: Wed, 19 Jan 2022 13:42:47 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH RFC 02/15] migration: Allow pss->page jump over clean pages
Message-ID: <YegVV6lmkkmKBv9p@work-vm>
References: <20220119080929.39485-1-peterx@redhat.com>
 <20220119080929.39485-3-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220119080929.39485-3-peterx@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Kunkun Jiang <jiangkunkun@huawei.com>, Juan Quintela <quintela@redhat.com>,
 Keqian Zhu <zhukeqian1@huawei.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> Commit ba1b7c812c ("migration/ram: Optimize ram_save_host_page()") managed to
> optimize host huge page use case by scanning the dirty bitmap when looking for
> the next dirty small page to migrate.
> 
> However when updating the pss->page before returning from that function, we
> used MIN() of these two values: (1) next dirty bit, or (2) end of current sent
> huge page, to fix up pss->page.
> 
> That sounds unnecessary, because I see nowhere that requires pss->page to be
> not going over current huge page boundary.
> 
> What we need here is probably MAX() instead of MIN() so that we'll start
> scanning from the next dirty bit next time. Since pss->page can't be smaller
> than hostpage_boundary (the loop guarantees it), it probably means we don't
> need to fix it up at all.
> 
> Cc: Keqian Zhu <zhukeqian1@huawei.com>
> Cc: Kunkun Jiang <jiangkunkun@huawei.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>


Hmm, I think that's potentially necessary.  note that the start of
ram_save_host_page stores the 'start_page' at entry.
That' start_page' goes to the ram_save_release_protection and so
I think it needs to be pagesize aligned for the mmap/uffd that happens.

Dave

> ---
>  migration/ram.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 381ad56d26..94b0ad4234 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -2229,8 +2229,6 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
>      } while ((pss->page < hostpage_boundary) &&
>               offset_in_ramblock(pss->block,
>                                  ((ram_addr_t)pss->page) << TARGET_PAGE_BITS));
> -    /* The offset we leave with is the min boundary of host page and block */
> -    pss->page = MIN(pss->page, hostpage_boundary);
>  
>      res = ram_save_release_protection(rs, pss, start_page);
>      return (res < 0 ? res : pages);
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


