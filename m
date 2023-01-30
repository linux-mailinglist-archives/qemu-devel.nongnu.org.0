Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9126807A5
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 09:42:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMPk8-0007wV-N3; Mon, 30 Jan 2023 03:42:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pMPk6-0007uQ-Ku
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 03:42:22 -0500
Received: from mout.kundenserver.de ([212.227.126.130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pMPk4-000738-VL
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 03:42:22 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MY5s5-1pAAqN33ld-00YRvC; Mon, 30 Jan 2023 09:42:18 +0100
Message-ID: <51cf681b-4d13-b0fd-35f2-74ac6c1b4e41@vivier.eu>
Date: Mon, 30 Jan 2023 09:42:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] linux-user: Fix SO_ERROR return code of getsockopt()
Content-Language: fr
To: Helge Deller <deller@gmx.de>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221216101033.8352-1-deller@gmx.de>
 <8ec83c02-0e87-90c2-835d-e01a330b1969@vivier.eu>
 <db38ab56-d632-8cb4-9e60-aef83477ca74@gmx.de>
 <059795f6-97f0-b112-1802-fc47668986a5@vivier.eu> <Y9QzNzXg0hrzHQeo@p100>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <Y9QzNzXg0hrzHQeo@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:wlhV59VAURCttAme8uHBrpDzEp1vbE/Ws4gh6j/8djzEfi8TWKO
 Zi4T61CFvQPEQyhkolXrdppPRGGkeUFADeo2/aHMFusdffdPC5Rp/tLllyxxUtonQTunrrX
 Mvs6FWjhOHz41H264E6vfzrHqudb9VZXYZVXUL2TtkrJU8OqCReG3SaIyMmBbD6FRadUCWM
 uaE7QsHUrHSBoPibRS5XA==
UI-OutboundReport: notjunk:1;M01:P0:Wehu0iEBLhA=;Q7hHcyk0j3OlFYGABz5ji3wTeud
 gTpLbzsZg1v1DPpqDLpKP7VZVxJgcsld7A1OEyqeWMTyOYMhCU+IZ3pQrDM3xr9hKpq40aJes
 mlgqP0owPcl/sniONap4IocslO8V8n8KLx+JaTV8rrLdFfJgCem+XLRYyS/RCWy/6ZUg52f4T
 6dCuNuVI8mIIvk8CteNa+Q/wxKfm7BAVlwjXlXTXnzsgytNvhAYQvVOirnDO+Ql9eNryGzc0T
 UiP7nN4HaIlag4mNIoTvd/Xd4d4jkQ8MWUebS61rfPuuaW3yQOLExApaeY+xQFcGq8W2yp72B
 vtWG6Ckqj6GOZLPoh/Z2ItRVouMfMm0i3QD6FV+JRQ4qUh0+mmZxOQSBImkR8Dic3nGPzejA4
 LaWNRxXuNRsy0q89DuMxuTVuIurflG4c7fFUOrryWizMfgPvvtLvZNs+EuB+rgXLQoVt7ZijP
 oh4NXzJQ0mx5qE6xCwbZTmNi8SenKOPwvwRIvrOufPmA8MqPqyfRwuZpGke4N6CXh57k7Acse
 COXE7P/W5gMenCrOtA9jG1Tw7x9SvzyZsFqB3rbXhn0PaldUf/qCUSn5VidAABi2hqBjDjyf/
 B05jtHq16oa8/iE/kJ5XApTdGn6vo7Gj033V8JPGGIVzPAnFEZkBL1aMBhS7xn9dWvcXa7np8
 PjfEEXa7fygpwLVsv2ZuRslUnpadeVYRPt1p+65LtQ==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.092,
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

Le 27/01/2023 à 21:25, Helge Deller a écrit :
> Add translation for the host error return code of:
>      getsockopt(19, SOL_SOCKET, SO_ERROR, [ECONNREFUSED], [4]) = 0
> 
> This fixes the testsuite of the cockpit debian package with a
> hppa-linux guest on a x86-64 host.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
> v2: Fix indenting to make checkscript.sh happy
> 
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index dac0cfe6c4..06e8612675 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -2809,8 +2809,13 @@ get_timeout:
>           ret = get_errno(getsockopt(sockfd, level, optname, &val, &lv));
>           if (ret < 0)
>               return ret;
> -        if (optname == SO_TYPE) {
> +        switch (optname) {
> +        case SO_TYPE:
>               val = host_to_target_sock_type(val);
> +            break;
> +        case SO_ERROR:
> +            val = host_to_target_errno(val);
> +            break;
>           }
>           if (len > lv)
>               len = lv;
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

