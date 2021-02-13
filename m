Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 977F531AE69
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 00:10:39 +0100 (CET)
Received: from localhost ([::1]:41610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lB43i-0007kE-LQ
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 18:10:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lB42f-0006rc-Uw; Sat, 13 Feb 2021 18:09:33 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:33463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lB42e-00016X-CA; Sat, 13 Feb 2021 18:09:33 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MFbFW-1l67Ye3qV4-00H8ZO; Sun, 14 Feb 2021 00:09:19 +0100
Subject: Re: [PATCH v2 04/12] nvdimm: put it into the 'storage' category
To: Gan Qixin <ganqixin@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20201130083630.2520597-1-ganqixin@huawei.com>
 <20201130083630.2520597-5-ganqixin@huawei.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <61b6da4c-a34d-1441-f070-0e58ab95eb02@vivier.eu>
Date: Sun, 14 Feb 2021 00:09:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20201130083630.2520597-5-ganqixin@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:m2ZiEix4o3ZUDOISDsmLV406x03YyZnrdSQXoXuprrKsTPZPN3J
 eCRN1qRz/M+r7pkegoIJt70gska6iJ0YKMN3F/gI9kgCRXdxEqPzXLm0nkwl6t0zOj3luNu
 fjvcnC2jwAL7gcjsT334+S6DV0II7fHNo6j3VG7sjfSioZwhqBd25pxcAab4j4P9Qh86wyD
 RJs5xBz8gvqRsEku5OsqQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/lC0rDz/Mm8=:YD3AtF4j6a6q67w/DgQquv
 001S5G07r/SfXF/acCDSoBny/Y82xEyo0qdPzxLhVbHYufdXDyWOm5O2jzi98izKqVdWwizTx
 hGnC6z2UvUDLu5N3ntyG/NG4lILnt9NmrJswdYADTS5aY86nLwrKlxgLTHQEKpML1tTF5OMh3
 rdmAgG1NgFPs0mfg+F9hB718GwLmF+vYA5iDW1iCxe6NGkVElsdigOclhbKbdVTh7u4Ny5f7v
 Duun3GAubj892n+TN2sSFFXasrcwQF0usDLZv5UZ1n/3JAaQ2vSotMjFWFaBMsLpyheouwPBL
 AXMT+HXH30O33ASJQvy2p0zIrdiMLo3l3n2m+coU3NK0hXMt3IZAB4wh4FII0+2df1wm0hFgY
 ZAlklJWZD/Adk26wSYP2yTLLAwu5lQwwnPbyTgdmoq5BWJYl8olsrSu+C9HRfELTfLrTp5kA3
 RIzxInySUA==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kuhn.chenqun@huawei.com, thuth@redhat.com, zhang.zhanghailiang@huawei.com,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 30/11/2020 à 09:36, Gan Qixin a écrit :
> The category of the nvdimm device is not set, put it into the 'storage'
> category.
> 
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> ---
> Cc: Xiao Guangrong <xiaoguangrong.eric@gmail.com>
> ---
>  hw/mem/nvdimm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/mem/nvdimm.c b/hw/mem/nvdimm.c
> index e1574bc07c..e30695b2ce 100644
> --- a/hw/mem/nvdimm.c
> +++ b/hw/mem/nvdimm.c
> @@ -236,6 +236,7 @@ static void nvdimm_class_init(ObjectClass *oc, void *data)
>  
>      nvc->read_label_data = nvdimm_read_label_data;
>      nvc->write_label_data = nvdimm_write_label_data;
> +    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>  }
>  
>  static TypeInfo nvdimm_info = {
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


