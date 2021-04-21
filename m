Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87193366949
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 12:34:01 +0200 (CEST)
Received: from localhost ([::1]:42570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZABE-0006Q9-1V
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 06:34:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lZA8w-0005h5-Tz
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 06:31:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lZA8v-0006so-95
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 06:31:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619001094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+4Yz/NMUwQ8cGFsTG4VScvXQ7JyzTCUVjFrV/sHlCtY=;
 b=dz8dvRQCP4cHSIVKJlcG/ypWipw9+sT0x9fWv1t3hpQSPNmmkAazkcnE7kkkW9oDFaEdyg
 L1f2ggN81/OCJFPZwV7D1Ro3HW7mnu8Yp3FPsyF6cmJGZXlCjP3A5WUVQqfMAxEsj7AoZw
 +nOKspkjr5Uv5G49/i8pht23feGefc0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-4SsQBahwOzKQU4ak5KzKRg-1; Wed, 21 Apr 2021 06:30:57 -0400
X-MC-Unique: 4SsQBahwOzKQU4ak5KzKRg-1
Received: by mail-wr1-f69.google.com with SMTP id
 t18-20020adfdc120000b02900ffe4432d8bso12479040wri.6
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 03:30:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+4Yz/NMUwQ8cGFsTG4VScvXQ7JyzTCUVjFrV/sHlCtY=;
 b=gfLq+4qolzjHDolfXMTMd8uf1aLPXx/imBYSabzrR8ybKthB7Hc6yL/B+PMALKMiUa
 3kRhp0YrM+pwWOc9LOiDtwVSCs46RckMqempteN8S/bA2tW/CWUHpe+eo7+9MfDpIJjq
 H67t7EIIvcL3ERd6L9AzO5cwzhx7n8BHTiD9t1OOD9Rp9ZbZMRKP3P4S980Lncd2bX9U
 niX13gvVfRGMIjdbJIC4aNURLh4ATc5wV9aUVMSUj+6iVa6BszIK/Qmw4e7sNcBlOlU7
 r+t7/MLFUDOGlzT3UDWdHd26X1ksGU8TO5QxmW4upgDb5bVa9zIrJzJxqLKY3zIU4WgN
 g5mA==
X-Gm-Message-State: AOAM533HpmjI70CAaSIM12/jdiPP2ssF8Qmi54nIHSYTlHsuji3blQtD
 BQSM/y+7Mm8W28iNGwWgZBw4wWipin4z+wars53vb1SYo+fl6ohI2N8ikWlxv/5Msua89hl3GeC
 DkhTm6fdenJMKE6k=
X-Received: by 2002:adf:e747:: with SMTP id c7mr25992926wrn.220.1619001056050; 
 Wed, 21 Apr 2021 03:30:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwp90YB7vaWN2Yo/JN2Ppd5W7Iiyo34icS0rhrv1d05kg/+g+zDrnXoITzAexYjFT5d5SNFtQ==
X-Received: by 2002:adf:e747:: with SMTP id c7mr25992906wrn.220.1619001055891; 
 Wed, 21 Apr 2021 03:30:55 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id o62sm11161423wmo.3.2021.04.21.03.30.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Apr 2021 03:30:55 -0700 (PDT)
Subject: Re: [PATCH v3] hw/block/nvme: fix lbaf formats initialization
To: Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org
References: <CGME20210416120324epcas5p354e2f196cc68680aba45341f385b59ed@epcas5p3.samsung.com>
 <20210416115907.30625-1-anaidu.gollu@samsung.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <29011d94-df5d-5e76-d82d-f0a1a70cbde2@redhat.com>
Date: Wed, 21 Apr 2021 12:30:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210416115907.30625-1-anaidu.gollu@samsung.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org, mreitz@redhat.com,
 kbusch@kernel.org, stefanha@redhat.com, its@irrelevant.dk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/16/21 1:59 PM, Gollu Appalanaidu wrote:
> Currently LBAF formats are being intialized based on metadata
> size if and only if nvme-ns "ms" parameter is non-zero value.
> Since FormatNVM command being supported device parameter "ms"
> may not be the criteria to initialize the supported LBAFs.
> 
> Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> ---
> -v3: Remove "mset" constraint  check if ms < 8, "mset" can be
>  set even when ms < 8 and non-zero.
> 
> -v2: Addressing review comments (Klaus)
>  Change the current "pi" and "ms" constraint check such that it
>  will throw the error if ms < 8 and if namespace protection info,
>  location and metadata settings are set.
>  Splitting this from compare fix patch series.
> 
>  hw/block/nvme-ns.c | 58 ++++++++++++++++++++--------------------------
>  1 file changed, 25 insertions(+), 33 deletions(-)

> +    NvmeLBAF lbaf[16] = {

Unrelated to your change, but better to use a read-only array:

       static const NvmeLBAF lbaf[16] = {

> +        [0] = { .ds =  9           },
> +        [1] = { .ds =  9, .ms =  8 },
> +        [2] = { .ds =  9, .ms = 16 },
> +        [3] = { .ds =  9, .ms = 64 },
> +        [4] = { .ds = 12           },
> +        [5] = { .ds = 12, .ms =  8 },
> +        [6] = { .ds = 12, .ms = 16 },
> +        [7] = { .ds = 12, .ms = 64 },
> +    };
> +
> +    memcpy(&id_ns->lbaf, &lbaf, sizeof(lbaf));
> +    id_ns->nlbaf = 7;


