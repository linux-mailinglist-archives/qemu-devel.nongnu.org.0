Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 711816BC9E9
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 09:51:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcjKL-0001t9-Ut; Thu, 16 Mar 2023 04:51:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pcjKK-0001sj-BW; Thu, 16 Mar 2023 04:51:12 -0400
Received: from mout.kundenserver.de ([212.227.126.135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pcjKI-0004lj-JY; Thu, 16 Mar 2023 04:51:12 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MCbZL-1plIA40LeV-009e11; Thu, 16 Mar 2023 09:50:59 +0100
Message-ID: <1dc809b6-a51d-eb7c-5828-e9cfae0905f5@vivier.eu>
Date: Thu, 16 Mar 2023 09:50:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] target/sh4: Honor QEMU_LOG_FILENAME with QEMU_LOG=cpu
Content-Language: fr
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20230316003411.129462-1-iii@linux.ibm.com>
 <c854655d-642c-21dc-61a5-4d93b98fc7b1@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <c854655d-642c-21dc-61a5-4d93b98fc7b1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:hzUAmul7IfeqKy88MGC1oWlFwRcev7ls4vOusM6v34m1yBdo/Ep
 LV/iRHQQX/Joo9dbvGzSoYy6FY6yPcxK0h2xWjqSVAKA8fH2MsKy7nVH6vtHBjGoK0cyhbW
 uBIgo1AMBfihdqxf42seOE/l5EQzCowYgy0htXhxLYSv6+vPkeQqUpy+/VY899J3zAXNI06
 NbYYuTl8VXOngBm8sUmIQ==
UI-OutboundReport: notjunk:1;M01:P0:KR0qDQc/kHo=;xpkCZPpOG5AaXgt2Wr/mh2cDpmv
 EslbR2zA73Hx0N5+R7G7Rg+mSXqAZHYkIi++9hpTTexTN5O1CcCRyVRIvYovzn0Uw8ghV6j8m
 j9lhufeo6afrsNtbBMvC5lPsr+YQ1dnUSVBCNBuG2apT+mF8C/h60zqxKTn68H27TnGZyEwM9
 cEafIcWazUeQzGd1/hlVSHDUOwlJzrRNAjIdMt76+v/6ZHt7UH/qj5QvHvEMuDISAoEWFawHT
 g/0KT/Z8CS0/KF34tabWkYwr9RDbFXL8JaIoO3IJ5uiWLuhdYBg4sibUpO5YPXBTB5r3+NzgZ
 iY6a6HRP5XVZda4abv/A13JjFLpd5oiMh2gbn1KW/Lj+Z21sV2fBYoeljgsmSKwB4God6S7IW
 pt6tuDhEC52E4WQAwiMqf75wXfg5z+uX0JI+WA+fC/nbWDrgrF4y5x7a9gQr8R/urzFIH70pu
 h2nlhagvpYVEPAv+TaM7ZO8cCvT0nY1mKeNryZDfyuN+frci4e5REiJzp0YRjhzzCNG4AzMH7
 1rI4sgm118vfYv3EGOOLuzDmHU+iEyEr1r2NwHX8wgTqEm38JXFzptqRrUMyHgzcfEzsxHzhl
 8sWk+8FgUdAv2Iui6J4phV1GNQDmdrFcYMkDyTdXURjwYtHbZwzy53FsCEq7GhLo11Vw621ue
 geNeWaaEAhOfqTR8NTRCJ4rdT2MJp2G0XmzWNv+udQ==
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 16/03/2023 à 08:52, Philippe Mathieu-Daudé a écrit :
> On 16/3/23 01:34, Ilya Leoshkevich wrote:
>> When using QEMU_LOG=cpu on sh4, QEMU_LOG_FILENAME is partially ignored.
>> Fix by using qemu_fprintf() instead of qemu_printf() in the respective
>> places.
>>
>> Fixes: 90c84c560067 ("qom/cpu: Simplify how CPUClass:cpu_dump_state() prints")
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>> Reviewed-by: Yoshinori Sato <ysato@users.sourceforge.jp>
>> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
>> ---
>>
>> Resend of https://patchew.org/QEMU/20220725142854.177451-1-iii@linux.ibm.com/
>> with a trivial rebase.
>>
>>   target/sh4/translate.c | 14 +++++++-------
>>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


