Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A083A56BA
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Jun 2021 08:02:34 +0200 (CEST)
Received: from localhost ([::1]:54802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsJCa-0002th-Jj
	for lists+qemu-devel@lfdr.de; Sun, 13 Jun 2021 02:02:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lsJB7-00022x-02
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 02:01:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lsJB0-0007pH-PG
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 02:01:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623564052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jJS6at8k7Nq1nFDIUmxO4VL2MXxoWFKN+gC1lGkU1rk=;
 b=MrkbvMyEekhozDqXMvhugVeNuui8esAxtLw6RiDFHQTXCZImyT9HKuO0JHLoDTFeSvkBMM
 S0Um6vKPHpqxI8VtaylF2aE/94KfZ9u5DhFYnqk3lGAtkHlx4cw/V5wLA5tacymxMMenCD
 /89xZgrf1FvqReXKKTKdmIfPrGrtwxg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434--tq0a-JyPLG4XVbjmEwKuA-1; Sun, 13 Jun 2021 02:00:50 -0400
X-MC-Unique: -tq0a-JyPLG4XVbjmEwKuA-1
Received: by mail-wr1-f69.google.com with SMTP id
 d9-20020adffbc90000b029011a3b249b10so1897379wrs.3
 for <qemu-devel@nongnu.org>; Sat, 12 Jun 2021 23:00:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jJS6at8k7Nq1nFDIUmxO4VL2MXxoWFKN+gC1lGkU1rk=;
 b=dD5fj7vZ+Omii4inPEbThfDSLbdyaPqfFnIaUG6fCYmNxzFaK+MpXrFqcLEeeaUnt/
 d3/cLTvafEKbl9GWH7nWWZSGl2xt6Tbk5zQsXi8FE9drmxuHJ47uAr7ljuyihCYSpmQj
 viXeFG8Q/+uA8E04k8VPKpOdJyIvNgM7JFM9Vu/f63FgydvcOMm/b9lFX4BcrtrMRQW/
 YxOqxqn8SEypqMZY4gIamnle4LunDQ1OcGCUYZLzBMv9lclrkFGRQsa9YiVeVbeObkg3
 BJOZCcbM/9AX8BdAK11Sth3wL1EZtz+X7YpDjiSywzmwAanJ9fbpqr9Da18AETPY29t1
 Dqbw==
X-Gm-Message-State: AOAM532gRSa7dupm5GkmOvFn9Mx0PyCC8P2npZVjawBLQrlBQ+m6XmqG
 hMxZuyxjKipLzt2Qq1i0VAZjSv6H/ssEWb+WTOpCmiJ7GB7SJAE2+7cxxO5W1qHLel8++m6Dycz
 KaJ7cOQKDlF2evh8=
X-Received: by 2002:a1c:b087:: with SMTP id z129mr26362033wme.67.1623564049615; 
 Sat, 12 Jun 2021 23:00:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUPTAdPuQyB/wwwSTttIRsXcPImS1E788T8OUcYp1LqVfCp6B0HQHuvji8GOZYE3GtyjymXQ==
X-Received: by 2002:a1c:b087:: with SMTP id z129mr26362022wme.67.1623564049425; 
 Sat, 12 Jun 2021 23:00:49 -0700 (PDT)
Received: from thuth.remote.csb
 (dynamic-046-114-144-190.46.114.pool.telefonica.de. [46.114.144.190])
 by smtp.gmail.com with ESMTPSA id e16sm12677447wrw.49.2021.06.12.23.00.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Jun 2021 23:00:48 -0700 (PDT)
Subject: Re: [PATCH v2] fuzz: Display hexadecimal value with '0x' prefix
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210612195842.1595999-1-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <95c1fc12-8256-0209-02d1-081a21f5a669@redhat.com>
Date: Sun, 13 Jun 2021 08:00:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210612195842.1595999-1-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/06/2021 21.58, Philippe Mathieu-Daudé wrote:
> Use memory_region_size() to get the MemoryRegion size,
> and display it with the '0x' prefix.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> v2:
> - Use PRIx64 (lvivier)
> - Use memory_region_size()
> ---
>   tests/qtest/fuzz/generic_fuzz.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
> index cea7d4058e8..6c675227174 100644
> --- a/tests/qtest/fuzz/generic_fuzz.c
> +++ b/tests/qtest/fuzz/generic_fuzz.c
> @@ -841,9 +841,9 @@ static void generic_pre_fuzz(QTestState *s)
>   
>       g_hash_table_iter_init(&iter, fuzzable_memoryregions);
>       while (g_hash_table_iter_next(&iter, (gpointer)&mr, NULL)) {
> -        printf("  * %s (size %lx)\n",
> +        printf("  * %s (size 0x%" PRIx64 ")\n",
>                  object_get_canonical_path_component(&(mr->parent_obj)),
> -               (uint64_t)mr->size);
> +               memory_region_size(mr));
>       }
>   
>       if (!g_hash_table_size(fuzzable_memoryregions)) {
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


