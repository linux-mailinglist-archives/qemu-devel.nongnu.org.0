Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F96231AE68
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 00:09:57 +0100 (CET)
Received: from localhost ([::1]:38964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lB432-0006ew-1Y
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 18:09:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lB41z-0005qg-II; Sat, 13 Feb 2021 18:08:51 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:50187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lB41x-00015J-Hw; Sat, 13 Feb 2021 18:08:51 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MV5rK-1lLTrX0XzS-00S3t4; Sun, 14 Feb 2021 00:08:37 +0100
Subject: Re: [PATCH v2 03/12] vmmouse: put it into the 'input' category
To: Gan Qixin <ganqixin@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20201130083630.2520597-1-ganqixin@huawei.com>
 <20201130083630.2520597-4-ganqixin@huawei.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <dee9f630-98a5-2d48-936e-9e164eea0b7a@vivier.eu>
Date: Sun, 14 Feb 2021 00:08:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20201130083630.2520597-4-ganqixin@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Mo6ikeLCHbf1GtnUizT3CcBN7ask3Bp9iAhqUTXZHYOT3n4PCJg
 QMHX4faSK9nXnAEAcKqd2/LvB+1RHcVLWAgXASRF27Rd8dtHFLCHmrpKv1MGK852ewcVzrV
 L5u2/3DkfqDEz9eaSbEQ8w+wGvppl7baLI27u8Xs3qjR/vvqSGotrmx+KTlYxrsyWORmDNb
 Q3NGYBIDjwDa/R2W3Efog==
X-UI-Out-Filterresults: notjunk:1;V03:K0:cVbtGL7Ing8=:qquRJWDvIokl5kNY76DAqS
 MR/dxu6kzJEu6OCBU9hUM2U6Pjz6XGz7LfIdFitgfg5Qil5/pDPrwEY9yJaPbW3r5k4VfQ9C+
 zLbzcSaySXdSrv+6Kn7ZMv97zu4jQjS+pDC2BO0VFrtcx9Yr9CAz8I42IIaTrT515+5ojG5mS
 akTBODCsaM8hqfj8OGOCB0ecDXRwDXnSN3oIzHRtHfZCu2WHZsBBWJggyvnnkUk8LW+dKqxe9
 +O/sJVP+ENKkTlBvUHYniYVZ6EbYRUNHjd0MIGHm6Xt0XmtZrkyOmkDDz0EJettsyduan5k5d
 xxAJc0m26HUTT6keT2VW5X4Rf50xGEj9SIKwEQ4KQDtvWUbHqWsWLdDr/wACBf+TIG1Z4JKem
 Jm5i2ctQhe+Yh41BsTQxUUCpjyKD4nWFb3kMXZBZydd11O/LDcYgxCB05sC5R463aAet1tUZj
 4INRi5fm8Q==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
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
Cc: kuhn.chenqun@huawei.com, thuth@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 zhang.zhanghailiang@huawei.com, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 30/11/2020 à 09:36, Gan Qixin a écrit :
> The category of the vmmouse device is not set, put it into the 'input'
> category.
> 
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Cc: Michael S. Tsirkin <mst@redhat.com>
> ---
>  hw/i386/vmmouse.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/i386/vmmouse.c b/hw/i386/vmmouse.c
> index a3556438f0..df4798f502 100644
> --- a/hw/i386/vmmouse.c
> +++ b/hw/i386/vmmouse.c
> @@ -308,6 +308,7 @@ static void vmmouse_class_initfn(ObjectClass *klass, void *data)
>      dc->reset = vmmouse_reset;
>      dc->vmsd = &vmstate_vmmouse;
>      device_class_set_props(dc, vmmouse_properties);
> +    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
>  }
>  
>  static const TypeInfo vmmouse_info = {
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


