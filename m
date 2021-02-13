Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A9631AE7A
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 00:13:26 +0100 (CET)
Received: from localhost ([::1]:46698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lB46Q-0001Xw-22
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 18:13:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lB45Y-0000p3-Ra; Sat, 13 Feb 2021 18:12:32 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:52685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lB45W-0001Mo-OH; Sat, 13 Feb 2021 18:12:32 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M9nhF-1lGoqj15bJ-005uTp; Sun, 14 Feb 2021 00:12:08 +0100
Subject: Re: [PATCH v2 09/12] u2f-passthru: put it into the 'misc' category
To: Gan Qixin <ganqixin@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20201130083630.2520597-1-ganqixin@huawei.com>
 <20201130083630.2520597-10-ganqixin@huawei.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <64eba323-ffab-e4f8-67b6-35ffef447b2b@vivier.eu>
Date: Sun, 14 Feb 2021 00:12:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20201130083630.2520597-10-ganqixin@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:AKsqLXR+mp4BfrwX8VyYDWbHfpeadzMkzgTj5/h/b16VePBVxMZ
 L/2DXYh10595R/UvQdYJzsTTIwwg3WCaExB7oerDFqrAeqVK86hwuuhFCX7nx00Ix4mukqp
 J01qEYNfB6WFCnKsxuI6rI/NssVJib4CMtZ+/rRz8NaP5D5lYFGdyTZll/2Cc/j84zELIEM
 /9mOJn+Z6R1dNw96Ep9Yw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:c7N1OrqyMxs=:/XAE/o962DLZnIJ8fr3B/a
 givjxQsXedULyMd6f79R1uEEMK+PL4fufYTpgcPM4peHbFtF2A+MfXwLoys+m9FxPnxMpCEPj
 2M5uM0cflqtPl83Ovy5jWjNVcjlfnfzoROc1u6anTkOzSfVqoar2Wk78DZAFpF8lJOHcmy2zy
 QyZWZ5RcZKojE9RV+r9LIsAfzfBso5oNDPGfWDblevCoss+cOz5xctJPS/+vCglDFHWMZgv0b
 1sWpVtGlDZODW++QCLGTuvOURn4c3ReWVcG9M3JN57jkGSUM5QZp+22AZOcsqjg7aaA7TCr+H
 Fo4JuZOYcNHt5OOr01WEYXoDDEbPS7ouDxVEuzCLQCapzpw7B25/u7+4OrdLH26DedDI7pQmg
 1Z8SJk3T5zWHmOq6RmZ3yrrh3CJobQvfL9fOb3GZ8aiyVzjO+Cbv1hL/pakfrY1XMqHVyDQ9B
 N2S59j9wxA==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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
 Gerd Hoffmann <kraxel@redhat.com>, zhang.zhanghailiang@huawei.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 30/11/2020 à 09:36, Gan Qixin a écrit :
> The category of the u2f-passthru device is not set, put it into the 'misc'
> category.
> 
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> ---
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/usb/u2f-passthru.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/usb/u2f-passthru.c b/hw/usb/u2f-passthru.c
> index ae00e93f35..fc93429c9c 100644
> --- a/hw/usb/u2f-passthru.c
> +++ b/hw/usb/u2f-passthru.c
> @@ -534,6 +534,7 @@ static void u2f_passthru_class_init(ObjectClass *klass, void *data)
>      dc->desc = "QEMU U2F passthrough key";
>      dc->vmsd = &u2f_passthru_vmstate;
>      device_class_set_props(dc, u2f_passthru_properties);
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>  }
>  
>  static const TypeInfo u2f_key_passthru_info = {
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


