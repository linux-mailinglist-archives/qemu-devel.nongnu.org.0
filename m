Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B88AA5EC024
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 12:52:28 +0200 (CEST)
Received: from localhost ([::1]:41604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od8CR-00036r-RZ
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 06:52:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od81c-000511-9S
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:41:16 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:46577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od81a-00080k-NB
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:41:15 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N7iOw-1pFz910M6c-014gyC; Tue, 27 Sep 2022 12:41:13 +0200
Message-ID: <0b71dffb-73e9-9bde-64ec-0eb027763ca6@vivier.eu>
Date: Tue, 27 Sep 2022 12:41:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 2/2] linux-user: Add parameters of getrandom() syscall for
 strace
Content-Language: fr
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org
References: <20220927093538.8954-1-deller@gmx.de>
 <20220927093538.8954-2-deller@gmx.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220927093538.8954-2-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:jTvNxIzqZ4J0aQAYFpedZym/OP74iAowBg5KGBH7/buDkpjklYc
 Un2qYvrR+xCfm72FGs4qWYW1VXM40SxBbQTAH2aViS9ZygDyRgDnAGNqPDo8SrMrN5yiP0W
 kjaxTBpGbq9jDEJJTPDt/Jb0MA692U5cL5wNDXoVCkni1DuNmI5zEJjAPrA/hf3GgSQHk2o
 zlT5KnNdiNJieHKoiuogg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8g20wtSJf0k=:UtpvpteTF+XbKsnPX7js5k
 Fyy1+zAISHXow5y/0wb2J1Caub2xuGtLaA0kTax5vbOpOca0oRtrlkDVfLxlRGyySLyDdmjbs
 aLd50Bhs0S5CsPiiZ4nFXM7wy57jz1mVOP+sc/G7jcQ5Po2JW9yVSByScuECn1c4d1KAtsm8D
 PvNxLvcpv5j2rFb1r0Ymu5wDDf7u7HH7l46iafgQogBYjDDIuqeJLp1iY01LhqFbrUqfVkjGc
 AIFryzmkJI3fnEUI4adHZDZZbscW+PLrPVRlfZnKWkThVKzsUa2FBgM71i4jSiXJ7zUjEVsKN
 KGrrGws1BRMlBgApA2P02wYYEJoLrGyFqFsA2a/Ca72tY08vJtk0Jw/JRxTf5utO8FY9rgcFb
 eKfXv+dLKIy8proJT863Uzy5j4+RGIrwUsr/4upGWQdHhFfEfVdhqtvo/zuLkAydVnbva0tiT
 2+e0ERs7IGMbmpQ9BbHweN4JT75EK7wKqQMndP4CVu5tnorWfiFnTKQ7x7uzITW10J80tv8Ro
 8dlbsYrZhy56qoPtehXqqMqvIBOrCspG9QzLFeNAbf/0eRsncFfw2AZoZlXIgCpDzH9JZEQsP
 avyhtdlGtwI4Z/JPpisM7yGQvFOlO2chkMS8OjgfKsgoV7w/C9SLFzvjwV4FjUXRcHgI+T6on
 GcUgRaaYw7tjogM0hywbYWnA5km7cCYUuMVnWx8tKBgesCtxlx8/BrmvRHKf4AlAMbCPtyR8M
 q5OibfvQtODWC8MowgrPmgyH8tt931bffzO5BiRFSH/dyEpG95xk9KOF6quxWiIlEhpKWDdxR
 KAnqQMe
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.319,
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

Le 27/09/2022 à 11:35, Helge Deller a écrit :
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>   linux-user/strace.list | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/strace.list b/linux-user/strace.list
> index 31a2ccd76d..9bb234a584 100644
> --- a/linux-user/strace.list
> +++ b/linux-user/strace.list
> @@ -358,7 +358,7 @@
>   { TARGET_NR_getpriority, "getpriority", "%s(%#x,%#x)", NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_getrandom
> -{ TARGET_NR_getrandom, "getrandom", NULL, NULL, NULL },
> +{ TARGET_NR_getrandom, "getrandom", "%s(%p,%u,%u)", NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_getresgid
>   { TARGET_NR_getresgid, "getresgid" , NULL, NULL, NULL },
> --
> 2.37.3
> 
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


