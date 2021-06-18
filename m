Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C55783ACF6C
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 17:49:02 +0200 (CEST)
Received: from localhost ([::1]:45342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luGjt-00007Y-TB
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 11:49:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1luGht-0007Pb-EL
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:46:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1luGho-0003Pr-Lj
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:46:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624031210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QNyaphmuuX+PT8PtZibTA3jfqPv05SLmZyCLpOCBzOc=;
 b=DFOB4QXPSZJPcj4Vebf9x+3zRpg+tgbl9qoRSo9odZ9lNwnrdv5DTQ42+iqce/mZbC3ogI
 oAcH/U6YtETnUOVNQJO23A0F3NGa1Ihy1NwP4lEEWl5aMBKKBZE8qzWAhKeVYj5sOycwJ/
 DqW1+Ou16qIglRgxwXKS39ZRmm2bQf8=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-eJQ3Vd-oMs-ucfYSUu1ByA-1; Fri, 18 Jun 2021 11:46:49 -0400
X-MC-Unique: eJQ3Vd-oMs-ucfYSUu1ByA-1
Received: by mail-qv1-f70.google.com with SMTP id
 p5-20020a0ccb850000b029025849db65e9so6026953qvk.23
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 08:46:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QNyaphmuuX+PT8PtZibTA3jfqPv05SLmZyCLpOCBzOc=;
 b=iDDPoCUIl2/xWAiejzgt1smvuYIB+YwY+GWhFRvCW/OlGV9vOAx72xyDmCwsdKobP1
 Ykqm0oHY4wbpRhmKd23JxwJQKvKJnirl3Oz12+MyHi9RnylzYFG5ZTB4RQlnBpIHhIxK
 1Bmtosm9GCmcgYmVPNdPZmm3ywmhYpPD2QyBDorPXL34uBelL055Kj3wDUVUPuvIFdVI
 IixMiEBczObrRHyvp+wlUK9ATJXnHAaQxsxbecPvCI1GFmEP40R1+AHKRU2asD2wWScd
 uTHb594FI6OYDP7ePKTPPo//jmYGT5qE/8G1j5jWXUFDcDi4r6SmMzgaQOvel/OpTfwM
 6MDw==
X-Gm-Message-State: AOAM530o59pfK8N69prZMfhuiOeHT0M5x566Jr3zb3Qovi5gTgK2PPqJ
 gAa3jjsB4nvMz2anZ1+Bux4Vb1yplcj7D3QCvqjZsLRojoxlzTfiMnjw9AzICkY/M986z/gMIUd
 7nT4mm9NVZX1cv38=
X-Received: by 2002:a05:622a:653:: with SMTP id
 a19mr10853797qtb.123.1624031209023; 
 Fri, 18 Jun 2021 08:46:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpgXfW9LYiiDQsQuD9KthwyjpX7J4JIhyVB8ggYYPY2SrYtsHfa7TkCTg4amdGMnFyoUL1rw==
X-Received: by 2002:a05:622a:653:: with SMTP id
 a19mr10853777qtb.123.1624031208818; 
 Fri, 18 Jun 2021 08:46:48 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id b7sm5314288qti.21.2021.06.18.08.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 08:46:48 -0700 (PDT)
Date: Fri, 18 Jun 2021 11:46:46 -0400
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v8 2/6] memory: make global_dirty_tracking a bitmask
Message-ID: <YMy/5togwdtCK3z8@t490s>
References: <cover.1624028590.git.huangy81@chinatelecom.cn>
 <0065e888fde8114be8a66406389cd75f014a0dd8.1624028590.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <0065e888fde8114be8a66406389cd75f014a0dd8.1624028590.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Chuan Zheng <zhengchuan@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 18, 2021 at 11:32:03PM +0800, huangy81@chinatelecom.cn wrote:
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index b114f54..dd2404f 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -55,7 +55,17 @@ static inline void fuzz_dma_read_cb(size_t addr,
>  }
>  #endif
>  
> -extern bool global_dirty_log;
> +/* Possible bits for global_dirty_log */

s/log/tracking/

[...]

> -static void memory_global_dirty_log_do_stop(void)
> +static void memory_global_dirty_log_do_stop(unsigned int flags)
>  {
> -    global_dirty_log = false;
> +    assert(flags && !(flags & (~GLOBAL_DIRTY_MASK)));
> +    assert((global_dirty_tracking & flags) == flags);
> +    global_dirty_tracking &= ~flags;
> +
> +    trace_global_dirty_changed(global_dirty_tracking);
>  
>      /* Refresh DIRTY_MEMORY_MIGRATION bit.  */
>      memory_region_transaction_begin();
> @@ -2691,8 +2699,9 @@ static void memory_global_dirty_log_do_stop(void)
>  static void memory_vm_change_state_handler(void *opaque, bool running,
>                                             RunState state)
>  {
> +    unsigned int *flags = (unsigned int *)opaque;

[1]

>      if (running) {
> -        memory_global_dirty_log_do_stop();
> +        memory_global_dirty_log_do_stop(*flags);
>  
>          if (vmstate_change) {
>              qemu_del_vm_change_state_handler(vmstate_change);
> @@ -2701,18 +2710,19 @@ static void memory_vm_change_state_handler(void *opaque, bool running,
>      }
>  }
>  
> -void memory_global_dirty_log_stop(void)
> +void memory_global_dirty_log_stop(unsigned int flags)
>  {
>      if (!runstate_is_running()) {
>          if (vmstate_change) {
>              return;
>          }
>          vmstate_change = qemu_add_vm_change_state_handler(
> -                                memory_vm_change_state_handler, NULL);
> +                                memory_vm_change_state_handler,
> +                                (void *)&flags);

If to drop malloc/free, we need to cast it with (void *)flags.  &flags is the
address of the local var, which will lost its meaning after the function
returns..

Then at [1] it should be "unsigned int flags = (unsigned int)opaque;".

-- 
Peter Xu


