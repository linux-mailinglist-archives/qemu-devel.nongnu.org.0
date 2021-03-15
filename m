Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2252733AFE0
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 11:22:45 +0100 (CET)
Received: from localhost ([::1]:56822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLkN2-00005h-6m
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 06:22:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLkLu-00084i-At
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 06:21:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLkLo-0005SI-UY
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 06:21:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615803687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mvSE2rEWm/rYxWVEamKTziPp45bkTpRcRJJpbWgDBRU=;
 b=YZ562rl7M9cFfEt7rOMBPr19+RBiFVNl5xhZGzDqYxCn+tRtgLzFTaJDtvWJaDf+z8yvKw
 Bnr1TdGQkQ4X+b3/H4DnzQfBQbcGYnI37/tOh4Og9vxhd4DbFCbPjAU9ChnO/QOGmRpe04
 /oK1ks0ranfIPlxQzDWW/JumQjehOmQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-fnGK_RwGOS282dEchKWZUw-1; Mon, 15 Mar 2021 06:21:25 -0400
X-MC-Unique: fnGK_RwGOS282dEchKWZUw-1
Received: by mail-wm1-f71.google.com with SMTP id b20so2280355wmj.3
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 03:21:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mvSE2rEWm/rYxWVEamKTziPp45bkTpRcRJJpbWgDBRU=;
 b=gmx9scvXf2+/tQbBjHYTK9p24few3f28+vGgVAHsoxj7XWkd/92e0xvrzlVC/3x1Nb
 SfVMvPPp1e/Oe8QnIxGqZ8OyNS+xeQYUlOdaW9dHV4MIzzdls6rjkNbjTPKN19peluzd
 ZJugdyNNPWGh0AK1KMlD2C7fHD1hs/cBLssYp9r4QgCt8n72SxC8cedEv2PDE/0B7tt4
 s3gEUW2tBa/wq2DcvvVKV2qtcqPUMEtwx4U/4djtOp9BoIUhhbETeXM+4+Uh6BR16P2D
 H/chRkUqwk1rq8BIa7a20GL5BAiyD4nyTPC0MBsgPpyhrnQdnUoMlPmSKNR5NLL7c9u4
 J3Xw==
X-Gm-Message-State: AOAM532kEEWpQy3KqDwN7SjxhtvYWaHudU5m9VwMTgjgcQ9HIl57QdPj
 iR0oQnRv8gTU78w42YQKEWNjDB8aRoFKGZxzU0w5MU3av/8ptXcAc3hLPi4yB1YFYTBS5m3hn34
 +vYYtLLQudYYTbwk=
X-Received: by 2002:adf:eec9:: with SMTP id a9mr26657576wrp.252.1615803684739; 
 Mon, 15 Mar 2021 03:21:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnOdhOmzRwFc9q8GLqHChSogsCtf03YNmZIxxHa/Ab5RboD6Vg24BWhwGiKjB1wM4AWTThrQ==
X-Received: by 2002:adf:eec9:: with SMTP id a9mr26657563wrp.252.1615803684577; 
 Mon, 15 Mar 2021 03:21:24 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id p6sm17784967wru.2.2021.03.15.03.21.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 03:21:24 -0700 (PDT)
Subject: Re: [PATCH v3] Add missing initialization for g_autofree variables
To: mrezanin@redhat.com, qemu-devel@nongnu.org,
 qemu-s390x <qemu-s390x@nongnu.org>
References: <20210315101352.152888-1-mrezanin@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b10b7f11-2954-f1bb-8824-8c7125c80bfc@redhat.com>
Date: Mon, 15 Mar 2021 11:21:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210315101352.152888-1-mrezanin@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/21 11:13 AM, mrezanin@redhat.com wrote:
> From: Miroslav Rezanina <mrezanin@redhat.com>
> 
> When declaring g_autofree variable without inicialization, compiler

Typo "initialization"

> will raise "may be used uninitialized in this function" warning due
> to automatic free handling.
> 
> This is mentioned in docs/devel/style.rst (quote from section
> "Automatic memory deallocation"):
> 
>   * Variables declared with g_auto* MUST always be initialized,
>     otherwise the cleanup function will use uninitialized stack memory
> 
> Add inicialization for these declarations to prevent the warning and

"initialization"

> comply with coding style.
> 
> Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
> 
> ---
> * v3:
>   -- allocate in s390_pci_update_dma_avail instead of NULL init
> 
> * v2:
>   -- Removed fixes in hw/remote/memory.c and hw/remote/proxy.c
>      fixed by patch sent by Zenghui Yu (multi-process: Initialize
>      variables declared with g_auto*)
> ---
>  hw/s390x/s390-pci-vfio.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)

Maybe "hw/s390x/s390-pci-vfio" prefix in subject?

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


