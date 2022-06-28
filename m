Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC0555BFB7
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 11:13:43 +0200 (CEST)
Received: from localhost ([::1]:55532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o67Hy-0004IU-M5
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 05:13:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1o66zS-0007K3-IZ; Tue, 28 Jun 2022 04:54:35 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:49587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1o66zQ-0000DA-Ct; Tue, 28 Jun 2022 04:54:33 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N17gy-1ncnmv3poQ-012WiV; Tue, 28 Jun 2022 10:54:16 +0200
Message-ID: <d0387f3d-8975-9587-c6cc-31ce63a2a960@vivier.eu>
Date: Tue, 28 Jun 2022 10:54:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] qom/object: Remove circular include dependency
Content-Language: fr
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-trivial@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220509084659.52076-1-philippe.mathieu.daude@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220509084659.52076-1-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:z2A4jxwaZE1xQovcNjNmAq4N8tK4EvnA/PtzJdzTteXVA0XJB5C
 a8IObNqa7F0c2SJlKzhHc57Xl8heVXVICpGps1zDvkFZawEZ02apxb0w6tlhYPdPU/kV7Ne
 NmVd6kRvGBLEqJUh3DGKHp/1NkU18+mIlm52BuqnAWDtqX3DTpzO2qRYvJgnZi5UndqLzZr
 lZaUoB6QzcfDRGOG4WqMg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/NamCgmVv48=:KSBxL49Qp4O7P4ev9g8rqi
 VUUWFtMpX79iwGFS6iSIgaQmTgQ5afwOogmtPARrnPxLZPAdpkrzkqofoTYumBzr68VYb6pWB
 +rGnkYwDfqHB1s9z4dMoxfYkp/5sBVaxYR4YxG4kkCgY5bFBHoWoz6KMmVIysNfQFOamArKQ2
 QTp5RdI3Sijmn5u2Lcs7xRwW5gltM20wcXnTAGbIzkTnjlzN48g/ivWXIJVJZqgE8EozshAeo
 QLNDaO3/nV5yBUg/lNf1bVQgevZEz8QlwVkoFbCUd9poYuF78+zBonnnUQJ5asGlprVbR9SJv
 Sn+f2KsBpiQQLY7y9MvTuMScfyxH1YrbzX9l4bGar3ia9R8v6uZaipwruiKk0o7VcWf5jwL4G
 +2tOuGAdwFjt1dUcvr/t76GimyI5ItZiCBs3sJkl+eXDl1wh/AEwzgP7n+sm1EiLFEMob/1we
 IC+o/3KDDT2xd3b2fYGdjZQagBVOmf2UN1XapgXmxGMIgmUdgm91qqP4fj/bmaPg7zIHrP/b7
 qt27YmBjlc5TRD1dfowaw+IjESOtZSuXPT6soFc9N55RhS+0jlfdrU2JlkGZhMEezHXaFApCs
 X1R7raSyTDIlJBcpcD0wm+3KR44xthxM2RfB84t99yiHzh2aSAtT5Kh+DhIXNiaETyUV0Iwgp
 S/LbtKP546kXRKpLqn5hdji5QlR2Yt+Haj9UTLLMiHowLPQ6TQDS9J1AFU4M85nrY9gKLEF9S
 FH6/CFwcP2pKz1r6MA7OWu0o/vIx9k9xpavJ2Q==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

Le 09/05/2022 à 10:46, Philippe Mathieu-Daudé a écrit :
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> "qom/object.h" doesn't need to include itself.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   include/qom/object.h | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/include/qom/object.h b/include/qom/object.h
> index 5f3d5b5bf5..ef7258a5e1 100644
> --- a/include/qom/object.h
> +++ b/include/qom/object.h
> @@ -16,7 +16,6 @@
>   
>   #include "qapi/qapi-builtin-types.h"
>   #include "qemu/module.h"
> -#include "qom/object.h"
>   
>   struct TypeImpl;
>   typedef struct TypeImpl *Type;

Applied to my trivial-patches branch.

Thanks,
Laurent


