Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F263C1FED
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 09:17:51 +0200 (CEST)
Received: from localhost ([::1]:46572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1kli-0001Rj-Ad
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 03:17:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m1kjg-0007nW-G8
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 03:15:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m1kje-0007fN-H0
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 03:15:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625814941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zhz4BDX557TQiK8P60JQcehimCFIFIynhOs8Q/och8c=;
 b=UwFbjoacdgxkbyyxVViMWCPKSYyXnMKFOjGxwM5YXVWuX4ROcBZx7kBh6GzIYjYDgnmGb9
 vM/muj4VKh5UrHhXHRT8e47DmdIpTmVEDDClS5KLzOmlxtJzrWvzLTXuSALtv4KvLaGAYB
 bzgZCdNtto8JeH78YNVUtRVlQoW4vEM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-5-cKcwyhODudRS06yHW-MQ-1; Fri, 09 Jul 2021 03:15:40 -0400
X-MC-Unique: 5-cKcwyhODudRS06yHW-MQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 l12-20020a5d410c0000b029012b4f055c9bso2514847wrp.4
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 00:15:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Zhz4BDX557TQiK8P60JQcehimCFIFIynhOs8Q/och8c=;
 b=oVY02KG9aEVFRN/xSKhN+syiIn9ZdGjfICgcTdj3I1x7BAd7/6nC3AW4dvkxYTeTvW
 88zilmfrDupPo063jWDswL3hXWVVrBWKatSokn4gTgK9njE+KlyS80IeJd0MEnMvT/Zk
 avmxBlt46LRb/zW1TLmVrqC8llNMNvMggKrMoF72LFQpkYEuUxpHDa+ZrOPM3oxGhTIh
 X7nuB43BoduPBLEaGl2B/uJgPnHEBSOiedTSrvdzxScbQ+y3TqY+Nmj3IOUSXH5fv7wP
 4TOjuXotYa4fZgfaKKrN59Kqodii2d8dw7I9UejYCGZhC0uLO8EU+nA8937oh+FY7RuA
 lO3w==
X-Gm-Message-State: AOAM531dkiBwja9x6IfmdSj545PMRm624U1U/T/d98mJbpwPF09TKQl2
 REEdsYCMabL/4T6a1Rpb2goufyxV3krumgVf/1oIovsCYvvwbg9blbksbiHP7+//mBH+58P4Ytr
 ywVmbywQyzmNHXV8=
X-Received: by 2002:a05:6000:108a:: with SMTP id
 y10mr39234396wrw.49.1625814939048; 
 Fri, 09 Jul 2021 00:15:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoQ/lstlUUeMRKpQY7/58uGj9Bx/zIUSClOxU3aBcytFeLYS9FJLmAoGA9g0HY/OXOqhQzXA==
X-Received: by 2002:a05:6000:108a:: with SMTP id
 y10mr39234363wrw.49.1625814938872; 
 Fri, 09 Jul 2021 00:15:38 -0700 (PDT)
Received: from thuth.remote.csb (pd9575e53.dip0.t-ipconnect.de. [217.87.94.83])
 by smtp.gmail.com with ESMTPSA id c7sm4433078wrs.23.2021.07.09.00.15.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 00:15:37 -0700 (PDT)
Subject: Re: [PATCH v2 26/39] tests/tcg: make test-mmap a little less
 aggressive
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210708190941.16980-1-alex.bennee@linaro.org>
 <20210708190941.16980-27-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <6fb9e8bd-5b49-21d8-a7f5-fecf7e4e9962@redhat.com>
Date: Fri, 9 Jul 2021 09:15:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708190941.16980-27-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: fam@euphon.net, berrange@redhat.com, pbonzini@redhat.com, f4bug@amsat.org,
 robhenry@microsoft.com, aaron@os.amperecomputing.com,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 stefanha@redhat.com, crosa@redhat.com, kuhn.chenqun@huawei.com,
 ma.mandourr@gmail.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/07/2021 21.09, Alex Bennée wrote:
> The check_aligned_anonymous_unfixed_mmaps and
> check_aligned_anonymous_unfixed_colliding_mmaps do a lot of mmap's and
> copying of data. This is especially unfriendly to targets like hexagon
> which have quite large pages and need to do sanity checks on each
> memory access.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/tcg/multiarch/test-mmap.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/tcg/multiarch/test-mmap.c b/tests/tcg/multiarch/test-mmap.c
> index 11d0e777b1..b77deee37e 100644
> --- a/tests/tcg/multiarch/test-mmap.c
> +++ b/tests/tcg/multiarch/test-mmap.c
> @@ -58,12 +58,12 @@ void check_aligned_anonymous_unfixed_mmaps(void)
>   	int i;
>   
>   	fprintf(stdout, "%s", __func__);
> -	for (i = 0; i < 0x1fff; i++)
> +	for (i = 0; i < 0x1ff; i++)
>   	{

While you're at it, you could also fix the coding style here and put the 
curly bracket on the right hand side of the for-statement.

>   		size_t len;
>   
>   		len = pagesize + (pagesize * i & 7);
> -		p1 = mmap(NULL, len, PROT_READ,
> +		p1 = mmap(NULL, len, PROT_READ,
>   			  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>   		p2 = mmap(NULL, len, PROT_READ,
>   			  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> @@ -142,7 +142,7 @@ void check_aligned_anonymous_unfixed_colliding_mmaps(void)
>   	int i;
>   
>   	fprintf(stdout, "%s", __func__);
> -	for (i = 0; i < 0x2fff; i++)
> +	for (i = 0; i < 0x2ff; i++)

dito

>   	{
>   		int nlen;
>   		p1 = mmap(NULL, pagesize, PROT_READ,
> 

  Thomas


