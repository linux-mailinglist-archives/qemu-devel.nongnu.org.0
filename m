Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A424E5EFDE0
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 21:24:28 +0200 (CEST)
Received: from localhost ([::1]:54570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odz91-00081t-ND
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 15:24:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1odz4D-00048X-MK; Thu, 29 Sep 2022 15:19:30 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:44461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1odz4B-0006p5-Cl; Thu, 29 Sep 2022 15:19:28 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M2xjg-1of4SG1TVU-003Ixk; Thu, 29 Sep 2022 21:19:08 +0200
Message-ID: <6afe749f-470c-8f67-0ff3-fcc78a30c50f@vivier.eu>
Date: Thu, 29 Sep 2022 21:19:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] mem/cxl_type3: fix GPF DVSEC
Content-Language: fr
To: Tong Zhang <t.zhang2@samsung.com>, Ben Widawsky <ben.widawsky@intel.com>, 
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "ztong0001@gmail.com" <ztong0001@gmail.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
References: <CGME20220915175905uscas1p122c0408beff433071df5df348553be22@uscas1p1.samsung.com>
 <20220915175853.2902-1-t.zhang2@samsung.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220915175853.2902-1-t.zhang2@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ClR0fLT45fq/7e8MrTYs8q4epskvDWoAxwjKnkXM82uyAjfvz5M
 Iqk02cRLPnygRbnVwjedbUoi7lhvte2NbBztucylBjI0/9HER3ink+Pan2o8tH4V+8rF9h4
 qo+G9jqJCDOxyaNcfk4m3axMcXAF5meXhflak5zlzDkT4biumlHDyFvyvJ7rh3l/sTf1U/k
 AhwFmrS21H4uAYBMA9OfA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wJEUu7PF+uE=:f8Az3mjsNZiPg2ZAp7ifvX
 pOHBnNcMep+S+8ET+CJk0ShdHX2+t58iZk9ZqJLON6x6X5awyJ4qSIBs3VecqSsAc5tuMWOVA
 M0VKwAbUHF5kLMmkv0I2+Wa11egu22VhGREGFM/+7Tc0ouS9SvcxbFjkMRAUIEJpkEdMJtmv0
 w5kW1Qn4PxLe0RH9ZikiZIhM2lM0qgcZCMpSZGg7Ck32JC0b1CD/TjOkBLkMFTqr3EzaWHSW9
 Nmy1fA1nDvVtZbeH1Z0CoVrP8SLt3rqsKUnER+O4ImEhokzpvVelXlOf+UDeRwY3ALtZMwGpP
 0MyxyzhMisMuVWhDBKuirdaAy8zxB7hSaLv/yK8M84fBt/RvOIkFT0lPqCukJeX6u5YEcu3G0
 cxvmlvIb3PiBPwMFZxt0He7eLP0H+B7mVTplXJN64H+qet60R6v/iz+XZYa1EpGJEBd25dvPT
 Lu1mPjA1sfYu7IRa2mu8uvgpDWwVOL0C8CKp1uS8H55/tykgg8odjtrJs6yeaqiwf1/90GDf6
 qMDVKdxyK4D1HaNm4hfHBA27czDRv0qJTWrlyqsrTv3Fltv8s5kHoFsRECkHB7bdTkp5EJj++
 XaWMUcWokbq55ckUy3/lNmGdbZ5R7oVQMcufEJ5ucb0A6fMg2SzLqDczcsBj6tOYegvS3FtBw
 /f6Cmo1qJEGsM4qjWfnbzfHCQc+/j+F0il7j828dYiLIzicTJ+A+bZhqaoi7e94ScQkSTTV6J
 7+jLNR2V+wR30Y/6Zd3rt17o3CJlVz0u/yz1UMmJWEHvyQU5j0N+iIrvrNsiM05M65f66LDx2
 NQ6mC0S
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.099,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 15/09/2022 à 19:59, Tong Zhang a écrit :
> The structure is for device dvsec not port dvsec. Change type to fix
> this issue.
> 
> Signed-off-by: Tong Zhang <t.zhang2@samsung.com>
> ---
>   hw/mem/cxl_type3.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
> index 3bf2869573..ada2108fac 100644
> --- a/hw/mem/cxl_type3.c
> +++ b/hw/mem/cxl_type3.c
> @@ -49,7 +49,7 @@ static void build_dvsecs(CXLType3Dev *ct3d)
>           .phase2_power = 0x33, /* 0x33 miliwatts */
>       };
>       cxl_component_create_dvsec(cxl_cstate, CXL2_TYPE3_DEVICE,
> -                               GPF_DEVICE_DVSEC_LENGTH, GPF_PORT_DVSEC,
> +                               GPF_DEVICE_DVSEC_LENGTH, GPF_DEVICE_DVSEC,
>                                  GPF_DEVICE_DVSEC_REVID, dvsec);
>   }
>   

Applied to my trivial-patches branch.

Thanks,
Laurent


