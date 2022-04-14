Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8A65004DB
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 05:53:33 +0200 (CEST)
Received: from localhost ([::1]:46282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neqY0-0005q9-NQ
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 23:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1neqVh-0003dN-G4
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 23:51:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1neqVg-0005E8-0k
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 23:51:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649908267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WFWyc4m3vAybs5AXGHeTADHMGnJnubh25Y93X1CZfKM=;
 b=Vju9SHMczXuIvbFOkmxufEcaHwP0l3KOl+tdU1XL6rGDQPaH9uW8veDGMWidNTWISd8sDa
 OF4eMv/Ipyr2ULRsgz6dFOVsx6x1aK2lOwT1BbWM3RTfxQWH1oCqp6Ka6ekm/ffgG02o13
 w6KMkDvSQnomwQ+skVhHQv0JpWPnumk=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-265-APg0xOZxPP2a7cFIhb4u3A-1; Wed, 13 Apr 2022 23:51:04 -0400
X-MC-Unique: APg0xOZxPP2a7cFIhb4u3A-1
Received: by mail-pl1-f197.google.com with SMTP id
 q6-20020a170902eb8600b001588e49dcaaso2110800plg.9
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 20:51:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WFWyc4m3vAybs5AXGHeTADHMGnJnubh25Y93X1CZfKM=;
 b=CqxikNox/fHc+4ECGlNys77t6BrXl3EKG9zEbJ0Su0FMv8GUu/RogLUjRsWkNcGjbm
 J20RFfQ2GyWs3X6ZkG6VfnQtLwR1lgEqICd18paZagnsTJ9yz6r9LSlIhESD5pSA+VGQ
 iyfvCX2lmVwoTQgRvi31GlKq9ishJ73f+Vd3sOk96m1x9niIRz5XhXtfrH7W0vfpF9OA
 gfku4E1NhUt6SKttXsXXRMUNl5AaxJ66pkX01I+0CGobZghHphlUOxt4v9tiGy9zbjhk
 OfIx/+gXO4r4XJSCPPMhAQnjghPP81T0ODO6Nb7z4OILFRmnSxSjDxMVFD87RwRno+6A
 ku4w==
X-Gm-Message-State: AOAM5321vyguzbdd6r2B9BxM+dpl/cUMM7s10F32UuNZkxxhqdLeRVSX
 Czpd2cAOBiPaQbz4ZNFfDIP22JZKPIgsjHTxPqeN1fl/iyCxKu1Bn/msUhu6qJw4GZeGfMGWIKk
 X3us+bx22mI0NRK8=
X-Received: by 2002:a63:194b:0:b0:39d:f8e:9bb0 with SMTP id
 11-20020a63194b000000b0039d0f8e9bb0mr734240pgz.56.1649908263339; 
 Wed, 13 Apr 2022 20:51:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4oXfrH7KVIbOHN6InHiSai7Ty/pfrHVcK82U/w1iveNc6cOsdebM0g5CYLAjP4gksWOTB3A==
X-Received: by 2002:a63:194b:0:b0:39d:f8e:9bb0 with SMTP id
 11-20020a63194b000000b0039d0f8e9bb0mr734222pgz.56.1649908263138; 
 Wed, 13 Apr 2022 20:51:03 -0700 (PDT)
Received: from [10.72.13.201] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 k14-20020aa7820e000000b004f7134a70cdsm540395pfi.61.2022.04.13.20.50.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 20:51:02 -0700 (PDT)
Message-ID: <474d75cd-7018-11cd-4add-754ee881d091@redhat.com>
Date: Thu, 14 Apr 2022 11:50:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [RFC PATCH v7 04/25] util: Return void on iova_tree_remove
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20220413163206.1958254-1-eperezma@redhat.com>
 <20220413163206.1958254-5-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220413163206.1958254-5-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Eli Cohen <eli@mellanox.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/4/14 00:31, Eugenio Pérez 写道:
> It always returns IOVA_OK so nobody uses it.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---


Acked-by: Jason Wang <jasowang@redhat.com>


>   include/qemu/iova-tree.h | 4 +---
>   util/iova-tree.c         | 4 +---
>   2 files changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/include/qemu/iova-tree.h b/include/qemu/iova-tree.h
> index c938fb0793..16bbfdf5f8 100644
> --- a/include/qemu/iova-tree.h
> +++ b/include/qemu/iova-tree.h
> @@ -72,10 +72,8 @@ int iova_tree_insert(IOVATree *tree, const DMAMap *map);
>    * provided.  The range does not need to be exactly what has inserted,
>    * all the mappings that are included in the provided range will be
>    * removed from the tree.  Here map->translated_addr is meaningless.
> - *
> - * Return: 0 if succeeded, or <0 if error.
>    */
> -int iova_tree_remove(IOVATree *tree, const DMAMap *map);
> +void iova_tree_remove(IOVATree *tree, const DMAMap *map);
>   
>   /**
>    * iova_tree_find:
> diff --git a/util/iova-tree.c b/util/iova-tree.c
> index 6dff29c1f6..fee530a579 100644
> --- a/util/iova-tree.c
> +++ b/util/iova-tree.c
> @@ -164,15 +164,13 @@ void iova_tree_foreach(IOVATree *tree, iova_tree_iterator iterator)
>       g_tree_foreach(tree->tree, iova_tree_traverse, iterator);
>   }
>   
> -int iova_tree_remove(IOVATree *tree, const DMAMap *map)
> +void iova_tree_remove(IOVATree *tree, const DMAMap *map)
>   {
>       const DMAMap *overlap;
>   
>       while ((overlap = iova_tree_find(tree, map))) {
>           g_tree_remove(tree->tree, overlap);
>       }
> -
> -    return IOVA_OK;
>   }
>   
>   /**


