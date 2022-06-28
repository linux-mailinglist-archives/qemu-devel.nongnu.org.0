Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AC155BFB2
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 11:07:39 +0200 (CEST)
Received: from localhost ([::1]:43964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o67C6-0004OT-09
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 05:07:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1o6720-0001vD-Rp; Tue, 28 Jun 2022 04:57:12 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:58037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1o671y-0000gd-Qr; Tue, 28 Jun 2022 04:57:12 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MVuXT-1oGG162HDB-00RtQm; Tue, 28 Jun 2022 10:57:05 +0200
Message-ID: <953ac62e-4b3e-13c0-93a9-03501a8ba923@vivier.eu>
Date: Tue, 28 Jun 2022 10:57:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] util: Return void on iova_tree_remove
Content-Language: fr
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, lvivier@redhat.com,
 Jason Wang <jasowang@redhat.com>, Peter Xu <peterx@redhat.com>
References: <20220427154931.3166388-1-eperezma@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220427154931.3166388-1-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:KVlW1WQLvhpiT/gVoSRXsFseiDX015sHGtisEj/ehqVEfPrAak0
 86EZ80Jry88Gj+hkm4oWF+/+E0bTsblr0SBgQYG4XTQ4/6T3gBSeM43RFk3JcV2CHdphJ2H
 1dJJ65eCfSc7oJAgjdj0UFBcSR6yNddEy0tD2hsI4i5QfLQlBBuuyh2nsR213cpQ7SdAGcP
 zOcPsa8xM8+Fbl4zZr87Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zrDIe3q/QcE=:fCAWDmHoWTnLvqcTu/yrhg
 PHUoWrkZeKjm1ZCXSN1N/W4lyeYCMXDc1nyvc/SipV9KUxHBFF0z2enN7z+xw/n4fNSEnHg1P
 62LKXf/SMEhTI4ZsFy7/DELVtkULC1jkRDBgwkA2ui+ePF3xsYqg6AfZUPdVvBKD/H1xYaPrR
 qLp+7Agam+e7t4Ytzip7Vg2RNpky1kbmEDjF6XC8jk2AHnGd52CJdwCH2x9so8CTJBQAUUnD3
 I8ekeBWSviHGs54aKEOx4XORIDUYi7J0iAuBE2kAn4SfY+9CuAqz3RUnzWBC14JyFfSf1nVN8
 nKap0eJWQMYtp/akwcPXKJAz+ZhF2eLjbmTbtz1iF8VpCjpMqndXHnNDN2lZHe7X8aoaBGcky
 T8hMLQBykHrHBOt/tv3dT19gJ4M9PV9gGYSWnXLrDsIpimmDNOxGhJ9Gh7+qfuITgz9T+aW3C
 pUXlxrCat95oyBaUEzEmMXV+0n2V5WwpfNxJALNmFdOrqahE0nsMjut97z2c4B2Gw8JO+m2FE
 gyw15IGqDONArX+plrdQv2FNPV4IM6dhWdyMGTXyQ/FXUjd+IuFfd7agnOf3hoMwJxseyrvwv
 16SXUJi05lDeYU6qwjYI52R6WiUYoklTC4sx8jAHl0LMWP1KxfASkUne7tJqi6yrxr5qEXYbk
 oqRDDQQBkYSTByT3HuyNPDORMG3/q3ejMBkTpJlrjAonkcZ5SUmod+UV1ef4FQtQ6JVaMExv5
 6H+Iiv6z148DZNBWNJug/b4kV96jiuQaLTpE+Q==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 27/04/2022 à 17:49, Eugenio Pérez a écrit :
> It always returns IOVA_OK so nobody uses it.
> 
> Acked-by: Jason Wang <jasowang@redhat.com>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
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
> --
> 2.27.0
> 
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


