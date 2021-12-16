Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BEE476D73
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 10:30:45 +0100 (CET)
Received: from localhost ([::1]:40148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxn63-0000Cb-Sv
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 04:30:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxn3L-0006Y4-2O
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 04:27:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxn3J-0004mb-N1
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 04:27:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639646873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AMpTAIG8as679M1sI8NgNItl4KsaUMofpv3iBiOvAPs=;
 b=RZ8IxqNUE9CFoVVhRvfs0n77+dDd4YtdnJKcamXILDEOMnTPzAZTHJFPcgEUggCPbZ5zFh
 RhZmpEUkbRoDlxV6yXrK3oQOh8fKLm/nWyAiCF6SJoH+fZW5CjPDsXqr8+dbQIOI4RHiqi
 aSD0/Iwb3WGGOFzXkdU8Z+QCKsWhKxo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-LVQzLtTDOdufz73xGr4veg-1; Thu, 16 Dec 2021 04:27:52 -0500
X-MC-Unique: LVQzLtTDOdufz73xGr4veg-1
Received: by mail-wm1-f69.google.com with SMTP id
 v190-20020a1cacc7000000b003456d598510so998256wme.6
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 01:27:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AMpTAIG8as679M1sI8NgNItl4KsaUMofpv3iBiOvAPs=;
 b=EW8vGxZhumRSJxx1jN01uiu20jwfkRoBvgzFI476XyZleG80UMdoIoli4Pyd0GH7M3
 WsRm3ChCuOVFNuBGyNvkA+41vTeqUy4RHnKVGv7Lby/7f7ncfOL8eeORDVRfZOlhYY2n
 9v7GaXYlOdbD01lmM4k8c3v2ikdRIx6xtawiZ2lcs1/ILDxdnRGm5eOs3eLUK8zZkzjz
 FEjMcmljvnpS/g0pZe6vWwNiqqmXWwI8EfOPTwhFm0NS8QhrWiOHkbaJG0Id1Xl4urP9
 kHN1JHebeiIelcan/uSUiZ6QdstnnxodiwZr++sJOtMpVJCOE+5XvmbdQd/33M/23zak
 beAA==
X-Gm-Message-State: AOAM530EC54pGw127DmoVx7cSj6CBET2T2r5f1bJKkv9R8uFIeeMBN09
 T5oejnSULPvn9crDJ86zQtToVoJLte5SHrjABtbUuRjcRhHjffBFVg8AiMDll+MGtYke7JIjnsM
 ECKfQjknDgbRGaoo=
X-Received: by 2002:a05:600c:1d9b:: with SMTP id
 p27mr3978279wms.123.1639646870759; 
 Thu, 16 Dec 2021 01:27:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzX6lE98lQSm7Prt5O8x9MJr0WfwDtt6XnmhnXsGaHXkajhjRRiHHI1fpvsDY/JTwZNC374/A==
X-Received: by 2002:a05:600c:1d9b:: with SMTP id
 p27mr3978270wms.123.1639646870627; 
 Thu, 16 Dec 2021 01:27:50 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id g18sm8724788wmq.4.2021.12.16.01.27.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 01:27:50 -0800 (PST)
Message-ID: <cd82bba4-89c6-8c92-7eb3-467893b43ff7@redhat.com>
Date: Thu, 16 Dec 2021 10:27:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 3/5] migration: ram_release_pages() always receive 1 page
 as argument
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
References: <20211216091332.25681-1-quintela@redhat.com>
 <20211216091332.25681-4-quintela@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211216091332.25681-4-quintela@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.034, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Leonardo Bras <leobras@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/21 10:13, Juan Quintela wrote:
> Remove the pages argument. And s/pages/page/
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  migration/ram.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

> -static void ram_release_pages(const char *rbname, uint64_t offset, int pages)
> +static void ram_release_page(const char *rbname, uint64_t offset)
>  {
>      if (!migrate_release_ram() || !migration_in_postcopy()) {
>          return;
>      }
>  
> -    ram_discard_range(rbname, offset, ((ram_addr_t)pages) << TARGET_PAGE_BITS);
> +    ram_discard_range(rbname, offset, ((ram_addr_t)1) << TARGET_PAGE_BITS);

1ULL?

Otherwise,

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


