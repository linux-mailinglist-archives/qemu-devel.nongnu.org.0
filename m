Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B18544CD26E
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 11:31:16 +0100 (CET)
Received: from localhost ([::1]:49116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ5DP-0000CT-PF
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 05:31:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nQ5AK-0005qS-4D
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:28:04 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:47401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nQ5AI-00084i-Ad
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:28:03 -0500
Received: from [192.168.100.1] ([82.142.8.122]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MFbiK-1nPVrO2USE-00H6ec; Fri, 04 Mar 2022 11:27:56 +0100
Message-ID: <350d2049-67fc-e972-96ca-fe731f8ccf13@vivier.eu>
Date: Fri, 4 Mar 2022 11:27:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 05/10] macfb: set initial value of mode control
 registers in macfb_common_realize()
Content-Language: fr
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, pbonzini@redhat.com,
 fam@euphon.net, qemu-devel@nongnu.org
References: <20220302212752.6922-1-mark.cave-ayland@ilande.co.uk>
 <20220302212752.6922-6-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220302212752.6922-6-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+UzCteC+eERHlcSVU3rPBVgYOh6Ggh8ltAd/RBmWYu3nuDGBDrg
 HPdSZENqO750IwaBytocVgKouV0hv3cRGpqMP76WMlQ1HmUXlbMmjZaKXtkp9JCBv9f6++A
 cVLOzdUgqxiG9930hRKgSdB2Ao4NN3sESIY43CoN5Jts+hHsRyTYPCBMW+yyufor11OH1cO
 8mn2Ogof0h6LfWZBq8NwA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tf5KqmT3Nuw=:m5jECLz49xR3D+oQL27CC4
 AX3XMrDrpYNHfjddnWTYJaZUj4D5RoaA1HaZLYGf84h6JjQrNEP03RrWEfueTLM1WRxUvEQdS
 VUvCDb13gQ9Er8Q7LhTWzXl/33ER3qCkU3ApQLbt8NAKom/+Q4SfG5Fgv8RkUsB61lFoy7SKk
 D5WDCc0Yuu31dQMmxXKPU/Ub9bI2H3MqngiJgeDcc+jzB0a7ye9VhuW1mOLffgQ2R5ICHLwj3
 MNuGCcJiuLolvM8g/xwIp00O26Apl9cPKxw/TfT+YwFG+WhkNQu1RA6KaWrQl/ZKuS6E561AG
 vEkN+kz7DGyYUYcz6ZS0gIUsV1xIaDuoIXxqlbiayN0As60s6eaAtWnIvKn0lMdx9P2l12HL1
 yH2PgsUALK7PtyT57LZL5f0P1pK3zobWBoxKSKvUMyVXdLPwxTE3Mvk/YuM9Dd/TdD8kAers/
 4dTdwLlw/Wfow2YEvVpUppIrdYaFLNRaNM6UbLxeC9h7IwNQSYvMCipTD6vuRsloGqnOzNw5H
 23o07roqyxTESDqZAyK2kkPRgjETZnp0tXt0vPUuU50ZYnjshwuovMa9VS8AnPR7JkqI7slK5
 z+5rkXtdjvThMVRa98NxNcbBpTw6EXlHN9maYtztdypQZnd40PlPGJ3TxuHsrV+X8rqVaE2qt
 ZtiS7A62Ar8+aDhkseXHFhsJ2qMG+uVT6avrTkl5/rvkSG6ceJ/dMtgeBwtsGRgAv8rY=
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

Le 02/03/2022 à 22:27, Mark Cave-Ayland a écrit :
> If booting Linux directly in the q800 machine using -kernel rather than using a
> MacOS toolbox ROM, the mode control registers are never initialised,
> causing macfb_mode_write() to fail to determine the current resolution after
> migration. Resolve this by always setting the initial values of the mode control
> registers based upon the initial macfb properties during realize.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   hw/display/macfb.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
Reviewed-by: Laurent Vivier <laurent@vivier.eu>

