Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E26B755BFC5
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 11:27:25 +0200 (CEST)
Received: from localhost ([::1]:53068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o67VF-0005my-0s
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 05:27:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1o67DH-0007yN-Kx; Tue, 28 Jun 2022 05:08:52 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:33171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1o67DD-0002fd-8o; Tue, 28 Jun 2022 05:08:49 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MJW18-1oLSEd0RWS-00Jo46; Tue, 28 Jun 2022 11:08:43 +0200
Message-ID: <37072b13-df1a-bb9f-34d0-caae1786f074@vivier.eu>
Date: Tue, 28 Jun 2022 11:08:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] MAINTAINERS: Add softmmu/runstate.c to "Main loop"
Content-Language: fr
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, qemu-trivial@nongnu.org
References: <20220615122338.340426-1-armbru@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220615122338.340426-1-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:LpUCfzUwOk1PwRmFkJgEn4AZccZGCuo7uI+YomjZpilSt+H3+iU
 lGLScitd4yI21ZtzFlaBScr6EyiqjsQEI2WoPvHRdjmvwGTgf+1W/yZVrExlT0cpW/0unMn
 fIDaIoLffFxXs2xZ2UuQgnqITKWFKNfq036HE8lRxR7DV+MFgruwbV76JoyR1j28KTjNlpS
 wP2UNRim8jyOWNZIg1zfA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DI7Vx1T45j8=:T5287pEsvr5oJyg6ceiVRS
 1CUqKNC7kkgISY+WXkRzv3CWPZHhuHpZsttbjVyMI842lytWYhf1fTRM7o0v66NysT0KfNpPp
 VawmOtZuRhzG2QXUHtKjyckKVFdDnXNmjihvHF4urg1S6H9wMAwjQYG65IevHQFxpBzE/mN08
 v6FfgYtNShvwja9AtJp0R3X1Ph6Zf/A/zwbWtltVD2IdatHlnxG68vGJNL1UlZmZbVXMHYrdN
 M+Yj7cx1shu8WHg1wJom3d1XSV6YPPzaswZdcLdpsO/FSnfWrED+YKXx/b4OG9ds8xI42t8Sw
 iEK1Z1VgJotezUa4L1Ih5/wHbaKJb8dsPRjYE9xUa1Tawj6QK1CBB0vZPhqP80V8JdBzTkett
 0ANw2g4drtXzX6Y8QiiIR0rMEPniUCY25Z1iujaqQb0tTqU4ragYblDBIHR5eBER1M3+4OI0S
 VBNDIFnjKDOGvTLFHpyzyXB55A8YsG/lIBCtYoeKrQDPcbYTfgtlOKO8Sf8fa68efWrOpioNi
 V+UlmA65KGD+0/rEh6/C83VsJv1IJu46prKCHXJdNTnlfHLyc8dMw94CMa1XKIqI0dUhQ3ISG
 s4dwTxPDF8auswfFn/RnLzioZLZYRsIOMkU4XkTaXlx/LfpYIDLLEdT602XlpctjQ/qypvAE4
 wfJ+oubCjGAXDDuvYxYfK6gW0wlvkUazWpjHHFKTH409q6fmb0hHE86LKUH1xW08EVbpN5vNA
 uajQJOm1Y9zb5xyUVqUhXcqBVhl2aOQJpmXXeA==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

Le 15/06/2022 à 14:23, Markus Armbruster a écrit :
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4cf6174f9f..4c921c07db 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2745,6 +2745,7 @@ F: softmmu/cpu-throttle.c
>   F: softmmu/cpu-timers.c
>   F: softmmu/icount.c
>   F: softmmu/runstate-action.c
> +F: softmmu/runstate.c
>   F: qapi/run-state.json
>   
>   Read, Copy, Update (RCU)

Applied to my trivial-patches branch.

Thanks,
Laurent

