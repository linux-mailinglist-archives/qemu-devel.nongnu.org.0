Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A80648C741
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 16:34:06 +0100 (CET)
Received: from localhost ([::1]:36186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7fdU-00050M-S7
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 10:34:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1n7er0-0002vj-52; Wed, 12 Jan 2022 09:43:58 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:53745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1n7eqx-0002qT-Ty; Wed, 12 Jan 2022 09:43:57 -0500
Received: from [192.168.100.1] ([82.142.23.158]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mj8a5-1mT7RU0qeL-00fCkG; Wed, 12 Jan 2022 15:43:53 +0100
Message-ID: <30c51d09-0487-d861-4bf3-03a8cd421961@vivier.eu>
Date: Wed, 12 Jan 2022 15:43:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] qdev-core.h: Fix wrongly named reference to TYPE_SPLIT_IRQ
Content-Language: fr
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20220111172655.3546766-1-peter.maydell@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220111172655.3546766-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:uBUHC2wJKj/LTZJmHBK13q+ob62fD16DweyYB/K/7o5UsoHQauN
 +MwPstAbU1SC/zoFX+7pgf7/89n2YAm8sx0ohIMKdhojTV8CSIN5odUWCunpCee9mFjBbE+
 mxG88upEWUIWgNiZ/MyTTfDf8WZKmY09z8afEzJgFsSmAgUCikx2Y7lKlObMeWdY7YJHFPG
 yh0f3nIfGgahBcBYEFy4w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zcXsI0cENQU=:caO/4Vo2HXOZdYKj5r/9Do
 zuFM5M7HWj+/AEWHA7ldPMUsY0JenU9k4Ny3CgubY+PEOnWE+73ERrpbvL0gOIrZT8HQC2tro
 ADGIzxyFwWcr0SwnrSbD95ZDg87DmP5/aEJjRFZw4fox2YbM0CVDuxHiqH1LBXOFjg0IqMZJ+
 Y32k3EDXuLNMzvn97690PncOJIVm7RE069tAcDkrpbR0nKwfIM7fNI0yRCYcpwmQKtU/mxJfo
 qPlw97fqizSKg74DlHkf4rHpIyfUl7RAOvKlg+srz7qQudSn9gj1pUbHz55aUbvtj8XUoWVwt
 UNrIJAVL9ZR+ztV6X3obx5FaKkl6Xl7SxdYRBTzj4VLdLB8oi2iGSnCxsYBSJNd0hXAkqE2MK
 o2LuCFntOlXLqkJwdtoR8R0dhkHN+0u9qYLZ8GTkbXTSHHG40tRhWk2UIX40OUq4/c79Z/xFu
 SdS1w5MOhoG7IYkG4JJb2Eub1ZCvRY2XIt7R9cFYhXU+reyBS9w7Yq5YzISpbF8xDQs6whaAi
 pcKgbYkfBq1ymwxZfEZpjOCN90P288uXuwE3de4WzCHvDe9JPURdNfW3D/nBfkItHSLmkRNhR
 absSLQRXe809iT3r7AA41GXOOqNOrd2qKEDCECH314mghUZJPYgruT4Qx4ebXaTJELIB4zlMN
 5N5SmNaAzfIjZvadvk22CrZlYqGDzH5LGGXZ5d9eaFwtcR1ZfsQs1kbXdzW/tyVvDGac=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 11/01/2022 à 18:26, Peter Maydell a écrit :
> Fix a comment in qdev-core.h where we incorrectly referred
> to TYPE_IRQ_SPLIT when we meant TYPE_SPLIT_IRQ.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/qdev-core.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index d19c9417520..92c3d652086 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -493,7 +493,7 @@ qemu_irq qdev_get_gpio_in_named(DeviceState *dev, const char *name, int n);
>    * qemu_irqs at once, or to connect multiple outbound GPIOs to the
>    * same qemu_irq. (Warning: there is no assertion or other guard to
>    * catch this error: the model will just not do the right thing.)
> - * Instead, for fan-out you can use the TYPE_IRQ_SPLIT device: connect
> + * Instead, for fan-out you can use the TYPE_SPLIT_IRQ device: connect
>    * a device's outbound GPIO to the splitter's input, and connect each
>    * of the splitter's outputs to a different device.  For fan-in you
>    * can use the TYPE_OR_IRQ device, which is a model of a logical OR

Applied to my trivial-patches branch.

Thanks,
Laurent

