Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D03487956
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 15:55:57 +0100 (CET)
Received: from localhost ([::1]:33750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5qep-00089H-VI
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 09:55:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5qXA-0001Gz-2N; Fri, 07 Jan 2022 09:48:00 -0500
Received: from [2a00:1450:4864:20::42b] (port=42513
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5qX8-0002ZP-J3; Fri, 07 Jan 2022 09:47:59 -0500
Received: by mail-wr1-x42b.google.com with SMTP id w20so11472760wra.9;
 Fri, 07 Jan 2022 06:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2ervEO8ZIHqf+L4Yfh5ajSBCvEXICbY0zqrMkvsVgwY=;
 b=mucB0sZt++x82inuvK+G9dmBga6vokoMsYeg2vVuGHNHaLDBVTpF9F1jPGRAnYHWsM
 vfpV6pl8QkQaPOGxmSmsRwjq04ynNJBK3waX7pr/sQK8Gfs7QpVpvGYYIJ0ZDA8bbO6+
 DSZKO44f3Ls9Vp2mui8fx3HpWF9lAEjj2KVD4qFtnBXbwaRjr4AlAHglf1v9SbJENOSL
 M18Ua1EoF9+JkJPdkCPQvBBs+X2eZi1kWCTEyr/xsnYHtwf6jBAn6GRoFLo3ZbSSP1YB
 vXE4KQl0KGm5W3kcH8Z8NgYC+uE9LqfIg25/i9hGh3R2buDqAEdQgWwVCVbImPJ3kjlS
 3JUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2ervEO8ZIHqf+L4Yfh5ajSBCvEXICbY0zqrMkvsVgwY=;
 b=4Z2HzBOjtpULnXHaRpvd88oobf3KADo6PX6jeJE86m120c75ZPaxMFMp64xJVI4j5Y
 /Vym8OSFQJ6bmfZt53Mh5j9X5zlYBlAbej2IoN9x5Prvd1hQNFy9DV63WH4JYLv6wUJM
 TChFCi9bIERTzOB8SofnVuJlsETjnkI1qiwGucaltkO7DNb6dCP3qL8JoFWtU1yR+foB
 4/l8+ACjvnndtXz4f4c+KURKyoIORDZMHfMSqaWW9He60UIwP8eYlUBSHP6RR8gg4tiS
 +rv+WC0YlIMJvYyAnNwuWzy4z9MLFRZY5V5Oa1lVxjBKgHPJQVboIcTMdUswVvK+diPE
 6fLg==
X-Gm-Message-State: AOAM532TRMuptvR4iMnz9VUN8w9y1Buaw0buZpGIsVYpN49MOITVgwik
 b80g2e5QrlADZ+Hj5oT3EkY=
X-Google-Smtp-Source: ABdhPJxSBRFyq7rfT2x1mSrOpspyKETv5pe6jHlNyOsDvuKZgMC2bo99wcWv+/5MXlo/1ISWwp24zg==
X-Received: by 2002:adf:f0c2:: with SMTP id x2mr31136209wro.367.1641566876871; 
 Fri, 07 Jan 2022 06:47:56 -0800 (PST)
Received: from [192.168.1.33] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id o38sm4685261wms.11.2022.01.07.06.47.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 06:47:56 -0800 (PST)
Message-ID: <69832841-76d6-8a40-abd3-56df88a8351d@amsat.org>
Date: Fri, 7 Jan 2022 15:47:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH] softmmu/device_tree: Silence compiler warning with
 --enable-sanitizers
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>
References: <20220107133844.145039-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220107133844.145039-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Yanan Wang <wangyanan55@huawei.com>, qemu-trivial@nongnu.org,
 Andrew Jones <drjones@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/1/22 14:38, Thomas Huth wrote:
> If I configure my build with --enable-sanitizers, my GCC (v8.5.0)
> complains:
> 
> .../softmmu/device_tree.c: In function ‘qemu_fdt_add_path’:
> .../softmmu/device_tree.c:560:18: error: ‘retval’ may be used uninitialized
>   in this function [-Werror=maybe-uninitialized]
>       int namelen, retval;
>                    ^~~~~~
> 
> It's a false warning since the while loop is always executed at least
> once (p has to be non-NULL, otherwise the derefence in the if-statement
> earlier will crash). Thus let's switch to a do-while loop here instead
> to make the compiler happy in all cases.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   softmmu/device_tree.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

