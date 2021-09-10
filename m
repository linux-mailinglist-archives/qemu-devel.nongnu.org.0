Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8FB40683C
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 10:19:01 +0200 (CEST)
Received: from localhost ([::1]:60056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mObkR-0008Q5-Q5
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 04:18:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mObic-0006IY-WF
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 04:17:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mObia-0006ia-JZ
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 04:17:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631261822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RdDI9AlEhfxcHRz6GN8W0hhrroxvN2k4O9RC/r0Ttiw=;
 b=Y9yJ/PKaG+cpm8QxZzdDayw02QJoAyuEAqLMkAumeiB8qGPAqhF/kBdA+SMxvGLY0hAdI/
 uVfRwXP0MR49U3CoAAU7DoC31xByBbN64IPsx8yCeHTiOehGQHCJG/cWNYM0rJGqiSRKjO
 3ftl+wciG4HWrhCV4xOkh8o5vlp0Jrk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-nE28Ya-eMF2k04spJ6Fmow-1; Fri, 10 Sep 2021 04:17:01 -0400
X-MC-Unique: nE28Ya-eMF2k04spJ6Fmow-1
Received: by mail-wm1-f69.google.com with SMTP id
 m12-20020a05600c3b0c00b002ff62df2774so602929wms.9
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 01:17:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RdDI9AlEhfxcHRz6GN8W0hhrroxvN2k4O9RC/r0Ttiw=;
 b=OWoEpLqPWxVjlmUB0O7O8W2+p6daDLNWkrxtyTngUyQb2Yvq5VnrI9nuh0dKgiZnXV
 9AWTIqWKWWMj67BUOHz4ZgJkFmrBN+2rNGl8ppaKJSi5W3pC3kvVo/AOF9xDs7jHJUxC
 NPH1lpSdhFH3itKArXCPC9sIo0C/OUeJiVPGciUUTimXiZw6GIJJG+XHZaMxjbJmdOub
 4tyI7E+MmSXZG61bggYd/HuOfB/qWu2pJekALMKGdQfscWGdla/kOAvgFpbPwiZJxGnM
 hGAKXX1RQiIhj4AvHkBTMDfUO80dWvqFVp3MpnQiCFDfb9fYc/Z35dzZM6cIogQfygOk
 Abng==
X-Gm-Message-State: AOAM53155/DQx8ZNblf9Cv/f/AzZs38+40QOg4vWvWtJsqmGe3czdOjf
 SXYcCeT4XyKDooNhPCGulje+Q1jNZ1equTlH27RvNiTU13QWBDpSqIKL9qlqbQFHTRzTqcswkew
 cL/0jmC2w8++S6SI=
X-Received: by 2002:a5d:6902:: with SMTP id t2mr6079357wru.23.1631261820446;
 Fri, 10 Sep 2021 01:17:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVLEhk9/dXXlfklgM8axJ+/fUvnyrxQLkvpQNVUb6UZdGX9XLo7xs7MJsUluXmnVxgCe186A==
X-Received: by 2002:a5d:6902:: with SMTP id t2mr6079325wru.23.1631261820273;
 Fri, 10 Sep 2021 01:17:00 -0700 (PDT)
Received: from gator (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id c9sm4079551wrf.77.2021.09.10.01.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 01:16:59 -0700 (PDT)
Date: Fri, 10 Sep 2021 10:16:57 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v9 06/16] qtest/numa-test: Use detailed -smp CLIs in
 pc_dynamic_cpu_cfg
Message-ID: <20210910081657.3622zphyadnso4nj@gator>
References: <20210910073025.16480-1-wangyanan55@huawei.com>
 <20210910073025.16480-7-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210910073025.16480-7-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, wanghaibin.wang@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 10, 2021 at 03:30:15PM +0800, Yanan Wang wrote:
> Since commit 80d7835749 (qemu-options: rewrite help for -smp options),
> the preference of sockets/cores in -smp parsing is considered liable
> to change, and actually we are going to change it in a coming commit.
> So it'll be more stable to use detailed -smp CLIs in testing if we
> have strong dependency on the parsing results.
> 
> pc_dynamic_cpu_cfg currently assumes/needs that there will be 2 CPU
> sockets with "-smp 2". To avoid breaking the test because of parsing
> logic change, now explicitly use "-smp 2,sockets=2".
> 
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Laurent Vivier <lvivier@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  tests/qtest/numa-test.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/numa-test.c b/tests/qtest/numa-test.c
> index c677cd63c4..fd7a2e80a0 100644
> --- a/tests/qtest/numa-test.c
> +++ b/tests/qtest/numa-test.c
> @@ -265,7 +265,8 @@ static void pc_dynamic_cpu_cfg(const void *data)
>      QTestState *qs;
>      g_autofree char *cli = NULL;
>  
> -    cli = make_cli(data, "-nodefaults --preconfig -machine smp.cpus=2");
> +    cli = make_cli(data, "-nodefaults --preconfig "
> +                         "-machine smp.cpus=2,smp.sockets=2");
>      qs = qtest_init(cli);
>  
>      /* create 2 numa nodes */
> -- 
> 2.23.0
>

 
Reviewed-by: Andrew Jones <drjones@redhat.com>


