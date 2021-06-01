Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E474397574
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 16:31:32 +0200 (CEST)
Received: from localhost ([::1]:56044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo5QX-0000i8-Ph
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 10:31:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lo5MQ-0006ks-5N
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 10:27:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lo5MM-0005NU-Sd
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 10:27:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622557629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZaAALR0wjWVsqeBS1ax65feR/aplvchtE8t/zU+Jb7Y=;
 b=MHQ3yDKArRBczdpzkjAtV9HM0qiT2myuknx0khD+opaFPOAEG67M4J2OpQqQOLAlfBIS7v
 vH9qeEGlVUlpY6z/d7gDEYtyUcEUD58Sb/SS9IRJQ5r3v2FimF0FhRWqJkA5syR3oMSP9q
 3/yax1C+E2NL7cxe8aElvsJGexVon7M=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-E9KxqRvjPHebARAo7y9ffw-1; Tue, 01 Jun 2021 10:27:05 -0400
X-MC-Unique: E9KxqRvjPHebARAo7y9ffw-1
Received: by mail-ej1-f70.google.com with SMTP id
 z6-20020a17090665c6b02903700252d1ccso3393298ejn.10
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 07:27:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZaAALR0wjWVsqeBS1ax65feR/aplvchtE8t/zU+Jb7Y=;
 b=M459KV5Nx/DdDkKjgGtUK/22CMiWO8kF3cpbcM+MtQ2DERRSipEX24A9LMxf1OCNgo
 BGHjexx+cqBfXmGZccbxpDX5w/VZqkhrCgJYrGbGoMD68VnZaW+lkTU9rvlGdIq9AFy2
 nZFzXBS1wfXw6pYE2y9Azy2yU4R2rIMWbxfzzz7KMWXbWEVmlOSCwnOddpnec+D5Z91U
 hQJP3dTgwczekdRSIVK/rfgisJtrBu9WlBBKS3Yzvio0Io5IG9+oCAQQ1KrSAC5sFtOa
 PEPhNhjI5J1Ep/LWkdRjDSyJJCe8zMUfj4lOJbyT8tBtGkrsYiqczMUi6p1VKnujJPY/
 dSew==
X-Gm-Message-State: AOAM531DB7MhFWqBMVwHB658NrKC2oAVFbjwA+IMl6zNF2Pj0Nuv7ASf
 779+S4qgxfkTpgZltUNz1Qh4Z5Sr6jrIux+oVm37O/hvtHBlVZW0WkG8uir/7Q5rN7wP6ysxU6I
 47FXmNMww4crf3aw=
X-Received: by 2002:a17:906:2d51:: with SMTP id
 e17mr7458011eji.500.1622557624575; 
 Tue, 01 Jun 2021 07:27:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxR4IvHyKtBiTNxHaBw1zGiDGi49GbfNfOvQaUrcZTwzcOssQfScOegVhcOTCmHwq5PBg4RDA==
X-Received: by 2002:a17:906:2d51:: with SMTP id
 e17mr7457985eji.500.1622557624379; 
 Tue, 01 Jun 2021 07:27:04 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id h23sm3340841eds.73.2021.06.01.07.27.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 07:27:04 -0700 (PDT)
Subject: Re: [PATCH 1/1] amd_iommu: fix device entry invalidation
To: Roman Kapl <rka@sysgo.com>
References: <20210601141039.16104-1-rka@sysgo.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d67b11e7-0e3a-f358-f0ea-99367ef26dbc@redhat.com>
Date: Tue, 1 Jun 2021 16:27:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210601141039.16104-1-rka@sysgo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/1/21 4:10 PM, Roman Kapl wrote:
> Since QEMU maintains TLB entries keyed by the device ID, there is no separate
> device entry cache. This means we need to invalidate all translations keyed by
> the device ID.
> 

Fixes: d29a09ca684 ("hw/i386: Introduce AMD IOMMU") ?

> Signed-off-by: Roman Kapl <rka@sysgo.com>
> ---
>  hw/i386/amd_iommu.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
> index 2801dff97c..62d22b220b 100644
> --- a/hw/i386/amd_iommu.c
> +++ b/hw/i386/amd_iommu.c
> @@ -356,6 +356,7 @@ static void amdvi_update_iotlb(AMDVIState *s, uint16_t devid,
>          }
>  
>          entry->domid = domid;
> +        entry->devid = devid;
>          entry->perms = to_cache.perm;
>          entry->translated_addr = to_cache.translated_addr;
>          entry->page_mask = to_cache.addr_mask;
> @@ -399,6 +400,8 @@ static void amdvi_inval_devtab_entry(AMDVIState *s, uint64_t *cmd)
>          amdvi_log_illegalcom_error(s, extract64(cmd[0], 60, 4),
>                                     s->cmdbuf + s->cmdbuf_head);
>      }
> +    g_hash_table_foreach_remove(s->iotlb, amdvi_iotlb_remove_by_devid,
> +                                &devid);
>      trace_amdvi_devtab_inval(PCI_BUS_NUM(devid), PCI_SLOT(devid),
>                               PCI_FUNC(devid));
>  }
> 


