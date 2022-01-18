Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF7B492EFF
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 21:09:02 +0100 (CET)
Received: from localhost ([::1]:52000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9umq-00016C-KH
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 15:09:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1n9uJs-0004B5-Md
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 14:39:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1n9uJp-0001s4-Hp
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 14:39:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642534740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WUhnrf0+BP7tkkzufNADvo9CwuyCJlAQza+fOxWiYqM=;
 b=HtstZNo2aNiFa7nT827/Y7TEMmUJjsEoSETVoM5Q4Y7pZ3FRFSPbyKeFXtucery7cH9HJg
 2FCZYUqabxt/v606CjAUs8BJploI6gdYhlGpHwh6dFHOo2XtLK7PMvfW/zZjfbnEZN30GZ
 nTG1m7wourNj8zKJxcGW9kEs3iCPGRw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-522-LoSK3OW6OHaU124GZ3_VRw-1; Tue, 18 Jan 2022 14:38:59 -0500
X-MC-Unique: LoSK3OW6OHaU124GZ3_VRw-1
Received: by mail-wm1-f69.google.com with SMTP id
 w5-20020a1cf605000000b0034b8cb1f55eso2580874wmc.0
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 11:38:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WUhnrf0+BP7tkkzufNADvo9CwuyCJlAQza+fOxWiYqM=;
 b=1mSm5sGVMmIBd+YPyWNXlwStLIOPRT3CZ9rm5TsVCFobi2n3Ch2idDsCxSy+gcLnYh
 ner+ub3m2fNuvEp28VZHTGgLUJ/mU2xQ2tHZEzZqxm1ReR11szG4h1wYhiWpBmNtaDlj
 slQiNK25ffhGEw7PnPYqm0yJRL3bk/2g3Vmj5Va8GoU52qZk098vXnbCmctqiFHuiNtN
 qnfKZrwpBYZ2LAiGyCN2q2ouNhyQg4GK4ipv5tjFijH0eItrQdSI6TFZeYglszD+wCBW
 H8WK7weR7Ec0kCkBsvpeIVSm2mA7P3obuvwvDBy+TIDNWrbz2bcZJr01E+3fjhSoVrqY
 fgQA==
X-Gm-Message-State: AOAM530jwUxDmgo7Gtvtb9r7VA9ujHmTBWDkQ5mtMjvqDgZd06gUiaaH
 LRY0aPFFkbiDFkfpdcTuA3+xm8H3ztxYzE34/5HISAuct1gUflZOC00gUwN4HjWLdjQPlyluQA7
 yGpa84PbMApxDgJg=
X-Received: by 2002:adf:e3c5:: with SMTP id k5mr2994134wrm.571.1642534736827; 
 Tue, 18 Jan 2022 11:38:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxhYGbJQKQq4q7YeWE53h0QcnI6UxdA71Az/9I1dWr5v7VPAFMxEv9zLBtFU3wsmFDNOM+p0A==
X-Received: by 2002:adf:e3c5:: with SMTP id k5mr2994117wrm.571.1642534736562; 
 Tue, 18 Jan 2022 11:38:56 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id m5sm3235693wmq.6.2022.01.18.11.38.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 11:38:56 -0800 (PST)
Date: Tue, 18 Jan 2022 19:38:54 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v4 19/23] multifd: Add property to enable/disable zero_page
Message-ID: <YecXTvrLY2K80DpG@work-vm>
References: <20220111130024.5392-1-quintela@redhat.com>
 <20220111130024.5392-20-quintela@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220111130024.5392-20-quintela@redhat.com>
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
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Leonardo Bras <leobras@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/migration.h |  3 +++
>  hw/core/machine.c     |  4 +++-
>  migration/migration.c | 11 +++++++++++
>  3 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/migration/migration.h b/migration/migration.h
> index 8130b703eb..638cd89b6c 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -296,6 +296,8 @@ struct MigrationState {
>       * This save hostname when out-going migration starts
>       */
>      char *hostname;
> +    /* Use multifd channel to send zero pages */
> +    bool multifd_zero_pages;
>  };
>  
>  void migrate_set_state(int *state, int old_state, int new_state);
> @@ -338,6 +340,7 @@ int migrate_multifd_channels(void);
>  MultiFDCompression migrate_multifd_compression(void);
>  int migrate_multifd_zlib_level(void);
>  int migrate_multifd_zstd_level(void);
> +bool migrate_use_multifd_zero_page(void);
>  
>  int migrate_use_xbzrle(void);
>  uint64_t migrate_xbzrle_cache_size(void);
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index debcdc0e70..fc303cb707 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -37,7 +37,9 @@
>  #include "hw/virtio/virtio.h"
>  #include "hw/virtio/virtio-pci.h"
>  
> -GlobalProperty hw_compat_6_2[] = {};
> +GlobalProperty hw_compat_6_2[] = {
> +    { "migration", "multifd-zero-page", "false" },
> +};
>  const size_t hw_compat_6_2_len = G_N_ELEMENTS(hw_compat_6_2);
>  
>  GlobalProperty hw_compat_6_1[] = {
> diff --git a/migration/migration.c b/migration/migration.c
> index 0652165610..ff39f07fc5 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -2502,6 +2502,15 @@ bool migrate_use_multifd(void)
>      return s->enabled_capabilities[MIGRATION_CAPABILITY_MULTIFD];
>  }
>  
> +bool migrate_use_multifd_zero_page(void)
> +{
> +    MigrationState *s;
> +
> +    s = migrate_get_current();
> +
> +    return s->multifd_zero_pages;
> +}
> +
>  bool migrate_pause_before_switchover(void)
>  {
>      MigrationState *s;
> @@ -4158,6 +4167,8 @@ static Property migration_properties[] = {
>                        clear_bitmap_shift, CLEAR_BITMAP_SHIFT_DEFAULT),
>  
>      /* Migration parameters */
> +    DEFINE_PROP_BOOL("multifd-zero-pages", MigrationState,
> +                      multifd_zero_pages, true),
>      DEFINE_PROP_UINT8("x-compress-level", MigrationState,
>                        parameters.compress_level,
>                        DEFAULT_MIGRATE_COMPRESS_LEVEL),
> -- 
> 2.34.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


