Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E324E4ADD05
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 16:41:04 +0100 (CET)
Received: from localhost ([::1]:55930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHSbz-0001eG-Px
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 10:41:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nHQeQ-0007Nh-SR
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 08:35:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nHQeO-0004rn-7F
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 08:35:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644327318;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wTvBHCnaFUhwokw0quM3alKZZGWmp4d4JuFjzuwYmKU=;
 b=i9jkUmknv7AloS8DVyq7Xs6Qbj39iWUTdpL3FQ8hQMG0v3PicaOk8KjQQPKzupYhQOSQNV
 IbQCtx8gth0bcKQnSfodu5zqQtTldp57h9hLZIEeyULqqUqMieAvyMvFkxBeR1Xd3MO2IQ
 HIWDUIPbi3tHSXRHqA1hFk84FGZoWsw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-LUvIAzTbMdylyOMmNJXpxg-1; Tue, 08 Feb 2022 08:35:17 -0500
X-MC-Unique: LUvIAzTbMdylyOMmNJXpxg-1
Received: by mail-wr1-f72.google.com with SMTP id
 r2-20020adfa142000000b001e176ac1ec3so6096636wrr.3
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 05:35:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=wTvBHCnaFUhwokw0quM3alKZZGWmp4d4JuFjzuwYmKU=;
 b=NZ8yN8nwUgVRrudlP1VXm1fxuFNn2WIoysPXCe+ZwH/WiQ2gZukZQTgNpi5q6MykHq
 vl0a92+dC0eiT1yAv9dvnNh1Mn5ulWaIxC1J31jxy3q+VuBgjFLivDVCa8rJUkDeGNA9
 LRGO7fGJ0MC1yJSF4DcAaSEZCYHszbh6lzRIILdisXg9hfovKKdHad92c3dyey3N8TOn
 m5t7FbGrcRttA7CvpJnvU0IizDx4wKo6lYLg22nU/TWC82hRdByvnwg7wqG5JQxAFiNF
 /Sv4rDUaqSucTrzEochXVNiqZZHmVwVFH9BlAcCU0c64qa1zbzENzELquN73bnmcNXyL
 KhDA==
X-Gm-Message-State: AOAM532xQHngs4u6WlktBXewEsL8VZUUBxCStSPM5FClGY7n/8a4N8Ym
 lgU3qyWkW78QoCZG1XvPkyLo1MmAAPyzsgileZmFh/4O0Ti1o016Lvx08IfHLuDI1r9NCUw20Hn
 bq2/I9zf6866O3Y0=
X-Received: by 2002:a5d:6dae:: with SMTP id u14mr3489000wrs.117.1644327316592; 
 Tue, 08 Feb 2022 05:35:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyj1Tja0w2CJDaua326rhIE1cRfKB8ZYmkVwQUti93c8IXeygwo2J18ikK0k4QtLRpVecbaGQ==
X-Received: by 2002:a5d:6dae:: with SMTP id u14mr3488988wrs.117.1644327316406; 
 Tue, 08 Feb 2022 05:35:16 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id 11sm14509862wry.68.2022.02.08.05.35.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 05:35:15 -0800 (PST)
Subject: Re: [PATCH v3 0/2] TPM-CRB: Remove spurious error report when used
 with VFIO
To: eric.auger.pro@gmail.com, stefanb@linux.vnet.ibm.com,
 qemu-devel@nongnu.org, alex.williamson@redhat.com
References: <20220208133117.111833-1-eric.auger@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <cfa498b4-9b8a-caca-0fd4-2afdf647ee69@redhat.com>
Date: Tue, 8 Feb 2022 14:35:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220208133117.111833-1-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: quintela@redhat.com, cohuck@redhat.com, f4bug@amsat.org,
 dgilbert@redhat.com, imammedo@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 2/8/22 2:31 PM, Eric Auger wrote:
> This series aims at removing a spurious error message we get when
> launching a guest with a TPM-CRB device and VFIO-PCI devices.
>
> The CRB command buffer currently is a RAM MemoryRegion and given
> its base address alignment, it causes an error report on
> vfio_listener_region_add(). This series proposes to use a ram-device
> region instead which helps in better assessing the dma map error
> failure on VFIO side.
>
> Best Regards
>
> Eric
>
> This series can be found at:
> https://github.com/eauger/qemu/tree/tpm-crb-ram-device-v3
oups sorry. As philippe sent the v3, I forgot to double increment :-/ I
will resend a v4. Sorry for the noise

Thanks

Eric
>
> History:
> v2 -> v3:
> - Use PRIxPTR
> - call vmstate_unregister_ram
>
> v1 -> v2:
> - added tpm_crb_unrealize (dared to keep Stefan's T-b though)
>
> Eric Auger (2):
>   tpm: CRB: Use ram_device for "tpm-crb-cmd" region
>   hw/vfio/common: Silence ram device offset alignment error traces
>
>  hw/tpm/tpm_crb.c     | 23 +++++++++++++++++++++--
>  hw/vfio/common.c     | 15 ++++++++++++++-
>  hw/vfio/trace-events |  1 +
>  3 files changed, 36 insertions(+), 3 deletions(-)
>


