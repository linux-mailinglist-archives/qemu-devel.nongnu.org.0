Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D280D31AE67
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 00:09:22 +0100 (CET)
Received: from localhost ([::1]:37038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lB42T-0005tL-Jg
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 18:09:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lB41W-0005Kg-3l; Sat, 13 Feb 2021 18:08:22 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:50117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lB41U-00013R-Fy; Sat, 13 Feb 2021 18:08:21 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M58vU-1lCATu0Jym-0017x9; Sun, 14 Feb 2021 00:08:02 +0100
Subject: Re: [PATCH v2 02/12] virtio-pmem: put it into the 'storage' category
To: Gan Qixin <ganqixin@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20201130083630.2520597-1-ganqixin@huawei.com>
 <20201130083630.2520597-3-ganqixin@huawei.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <d1d1abc9-0caf-66f8-4f28-aeed0d3a237c@vivier.eu>
Date: Sun, 14 Feb 2021 00:08:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20201130083630.2520597-3-ganqixin@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:RAe+me9XYH9zWOzS5NneW31FnIz15lC7L3y6LfbUwx+ML8pYXhe
 6dpYYM+X3BgDw9jIAviIKbKtWXxfOmB5lUw86lulhrTPTqnuaKyCHp2DvqasG1E+8JQJWgu
 ym4xk51N0Izl0kkPocrkMhqjd0ZLtbqzTGDGYeTlzZbjbXY+RZkW5Q0Ah7eBM4jspo6LV8d
 Pgsa3tvZr8cbE1ycW970Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:CKY3E2IyiDc=:sROvehIDBqCnIKgimuuHm9
 Q+Lu7rcLWHkZfvR5uF5tDf9kfjJscL4jZmdZqvpjD2SwHpfzI7CsBF8ditlcLO5tuNlWMwnr5
 Wd2euSVQakWb2pT7uv9cztINdIG2m5It37nPZ2qhNm4g8q/3P+Cd5ALhE8LCIDlihbbgreujr
 zdoBOj5CDz+uLgQnjWjqpE5K1d8NvybgfiD3Nc+JUpdVX/TIu3cxYa4/TnY8Sm15rmj1LXlsK
 8PSMKFV9/xLZJB2oWEB0LzSe1AvrrvOWXPoW2mqk2dAeGormi/VKPpRPV5rjTmSfjIfyKZfm9
 ndiTPXnBDc+EunGS2H87jSAbAKLkebV22kN5c2SxOQaQHG86iV1Lm8ZlX6uLmJEbZBgCdtDAj
 AP3tANc1TA7+1XJTtkmANJPf0C0IkeLkvOlR1L62a0EjZHgd3GMs6l//8WQ/oPfJqrl9CZmoI
 Td1eqNKBkA==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
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
Cc: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>, kuhn.chenqun@huawei.com,
 thuth@redhat.com, zhang.zhanghailiang@huawei.com,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 30/11/2020 à 09:36, Gan Qixin a écrit :
> The category of the virtio-pmem device is not set, put it into the 'storage'
> category.
> 
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> Reviewed-by: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>
> ---
> Cc: Michael S. Tsirkin <mst@redhat.com>
> ---
>  hw/virtio/virtio-pmem.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/virtio/virtio-pmem.c b/hw/virtio/virtio-pmem.c
> index ddb0125901..98b3139cd0 100644
> --- a/hw/virtio/virtio-pmem.c
> +++ b/hw/virtio/virtio-pmem.c
> @@ -175,6 +175,7 @@ static void virtio_pmem_class_init(ObjectClass *klass, void *data)
>  
>      vpc->fill_device_info = virtio_pmem_fill_device_info;
>      vpc->get_memory_region = virtio_pmem_get_memory_region;
> +    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>  }
>  
>  static TypeInfo virtio_pmem_info = {
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


