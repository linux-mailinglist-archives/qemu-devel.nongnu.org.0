Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D4E3B969D
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 21:33:27 +0200 (CEST)
Received: from localhost ([::1]:43792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lz2RC-00010a-Av
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 15:33:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lz2Ox-0008PI-Af
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 15:31:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lz2Ov-00008c-Dw
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 15:31:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625167864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/0irRdtDe9xLuTFXKNxkMAVpiIAHUeVl9ff1i/E4Yn4=;
 b=J//Yj5tCIyvwrXgtvp4JqzuLSLkWOLCUQum7sPE/87V76P1w9mwZVhrSEhhvaDf4FO44QP
 aq9Q5D6xG6fw/0kHTZJzO/fib4O0UFehBOmoFEou2c/1w04xGwOqGktRRebWKZO4/yvppZ
 DmjC+C4205/13Umdb6LUKmCcuSmxoO4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-00hYgLfKO4qKPE_xZn0HFQ-1; Thu, 01 Jul 2021 15:30:27 -0400
X-MC-Unique: 00hYgLfKO4qKPE_xZn0HFQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 j38-20020a05600c1c26b02901dbf7d18ff8so4973283wms.8
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 12:30:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/0irRdtDe9xLuTFXKNxkMAVpiIAHUeVl9ff1i/E4Yn4=;
 b=QMPlgyc19NIHyU8k8ZxKOzfQjtv2m9ZjXBDrRAuVQAOqPRRKChVe+My5oalk2Cpz1P
 D+9prUoEbG4YuABgtcGgUR/yRa0nWxtmirz6IcGU+CF6OvUft0FI18MAMHaITRcFxbdK
 3kyZBArnEfXKrZvfyPWzpfgMD883WZmJc1sw6/jUzbCenyajry7LinAi8kN5G7GXkPhy
 SMBDYXSuK191Pzje30pZAAvn2tO8fViF0NNJqYyq34ItCKGbO/qdW8BylbggbHILWkra
 zjFDkyHEN7sy3CWGbLwOznSJdVCcvlD9QQq8fy6ytdRvYdjry+FBfma15SoK9SWoIng6
 knpw==
X-Gm-Message-State: AOAM531XEGHgfjn1uiZRX3YWhhlmQR2fukeuNvQ7G4+QMn0veeQ/mEck
 an/wkPyJqeTVCsH0hdJoQ9yrhZxxo48N2n8itlQMH0KS3WSDFPd1iQct/ycl5pKxZmYxN6xruL7
 dkkcvNLjzgDu8Gdo=
X-Received: by 2002:adf:b613:: with SMTP id f19mr1457490wre.73.1625167826711; 
 Thu, 01 Jul 2021 12:30:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUNFYj62faOfN+/0z9VbeS3pNWAKcmo3YH/yuDQSKxd51Iye73deONpEgYAkmPK6Me2KrrKw==
X-Received: by 2002:adf:b613:: with SMTP id f19mr1457466wre.73.1625167826488; 
 Thu, 01 Jul 2021 12:30:26 -0700 (PDT)
Received: from thuth.remote.csb (pd9575bc6.dip0.t-ipconnect.de.
 [217.87.91.198])
 by smtp.gmail.com with ESMTPSA id h21sm802268wmq.38.2021.07.01.12.30.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 12:30:25 -0700 (PDT)
Subject: Re: [RFC v6 12/13] target/s390x: move kvm files into kvm/
To: "Cho, Yu-Chen" <acho@suse.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
References: <20210629141931.4489-1-acho@suse.com>
 <20210629141931.4489-13-acho@suse.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <fc895bf1-409c-cb89-e4c3-0c9324c0ebf5@redhat.com>
Date: Thu, 1 Jul 2021 21:30:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210629141931.4489-13-acho@suse.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.402,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: cfontana@suse.com, Claudio Fontana <cfontana@suse.de>,
 jose.ziviani@suse.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/06/2021 16.19, Cho, Yu-Chen wrote:
> move kvm files into kvm/
> After the reshuffling, update MAINTAINERS accordingly.
> Make use of the new directory:
> 
> target/s390x/kvm/
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Cho, Yu-Chen <acho@suse.com>
> ---
[...]
> diff --git a/meson.build b/meson.build
> index a91b39465c..293d509c7e 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1886,6 +1886,7 @@ if have_system or have_user
>       'target/ppc',
>       'target/riscv',
>       'target/s390x',
> +    'target/s390x/kvm',

You've added this to the "have_system or have_user" section ... however, I 
think the KVM code should not be required at all if compiling with 
--disable-system, since the linux-user builds require TCG only.

So it might be cleaner to add this in the "if have_system" section instead?

>       'target/sparc',
>     ]
>   endif
[...]
> diff --git a/target/s390x/kvm.c b/target/s390x/kvm/kvm.c
> similarity index 99%
> rename from target/s390x/kvm.c
> rename to target/s390x/kvm/kvm.c
> index 5b1fdb55c4..07dae06de8 100644
> --- a/target/s390x/kvm.c
> +++ b/target/s390x/kvm/kvm.c
> @@ -27,7 +27,7 @@
>   #include "qemu-common.h"
>   #include "cpu.h"
>   #include "s390x-internal.h"
> -#include "kvm_s390x.h"
> +#include "kvm/kvm_s390x.h"

No need to add the kvm/ prefix here since the file is in the same folder.

  Thomas


