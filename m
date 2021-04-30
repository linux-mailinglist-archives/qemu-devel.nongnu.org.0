Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF7336FB5D
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 15:19:30 +0200 (CEST)
Received: from localhost ([::1]:37768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcT3J-00039H-FG
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 09:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcSyO-0006HC-08; Fri, 30 Apr 2021 09:14:24 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:39899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcSyK-0004hr-Jr; Fri, 30 Apr 2021 09:14:23 -0400
Received: from [192.168.100.1] ([82.142.15.170]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MEFnR-1lkTrH1sM1-00AD4r; Fri, 30 Apr 2021 15:14:06 +0200
Subject: Re: [PATCH 1/3] hw/arm/pxa2xx: Declare PCMCIA bus with Kconfig
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210424222057.3434459-1-f4bug@amsat.org>
 <20210424222057.3434459-2-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <c633ed22-28c4-a5f7-34e0-522995cc5adb@vivier.eu>
Date: Fri, 30 Apr 2021 15:14:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210424222057.3434459-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:cb75OXii5nnz9kzimH28LH3UYVVE6IQIoaC8HvWXMVE9VIzWgAT
 EUmtj7YV41o24neIlzmyT+1pVL6QdwzYTRiC8rA0kp6lddP/ylvp8EkwICqgYX2+sPt3H+l
 z5fGsGnal17FvKDbtQpbE3tW1FzLm+iRPHmRKu1ASXDxLRQONMjn0bujAqj7R+WLDld6NEo
 8MEOxCMcMyMQP3q87EhRA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GN41FDAxJUY=:+oFR9fFzv1xklwRvlKWciL
 R24ABM2oMPF9yuLUZt5NstXJO+JGFXZ58HFJeLY+MrrlmtZQR3O8vP8+4j/VGnBk7LdpRT7Bf
 L7UrKcgqfTiwEdkXg22ZUjnATuGwPJRy6VQWAA6SVLzIbigR/I7EuQBhkz4JIPQo+TnaML1my
 eaVm3z6I1dTqK+lQFsTAEjPWOoSndUO2adgwfQfPAXYdc/dgB0OnhJ/W/9WXElUepvQVRlTcv
 itJhREccca5S9d6HXzGi88V6/EL189Pk961IfXwpNfqV1GEygXxE7NLxInmxu8SaCwEqc8qQL
 TMYO+NNT6WnR51iXM2K8DtnK6UOEpJN1IqN7mbvOS9JRGZD6+9x6h8/NjqljEtnpCwnDv1SQ3
 iTBbw/CxqrFapa/wyEl6dl8uU0EhNKUPzYz6C51tznvG6md6GN8qRG2niQ0qXBYTChROp4P/C
 e+fnsIMwNAbYpDYz7Zr4i/dKgdSgcU2o1ie8axmC6UbtRsDVR7kalqdpjDL1A4AG13nt9TY+C
 qAVWjTNHRgt2Pp8Bycw/2k=
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 Miroslav Rezanina <mrezanin@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 25/04/2021 à 00:20, Philippe Mathieu-Daudé a écrit :
> The Intel XScale PXA chipsets provide a PCMCIA controller,
> which expose a PCMCIA (IDE) bus. Express this dependency using
> the Kconfig 'select' expression.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/arm/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 8c37cf00da7..b887f6a5b17 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -142,6 +142,7 @@ config PXA2XX
>      select SD
>      select SSI
>      select USB_OHCI
> +    select PCMCIA
>  
>  config GUMSTIX
>      bool
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


