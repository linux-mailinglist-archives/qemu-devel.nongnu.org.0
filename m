Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B847F534481
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 21:46:57 +0200 (CEST)
Received: from localhost ([::1]:44084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntwy8-0002nj-Gn
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 15:46:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ntwkr-00030L-4k
 for qemu-devel@nongnu.org; Wed, 25 May 2022 15:33:13 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:39365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ntwkp-0004V6-AH
 for qemu-devel@nongnu.org; Wed, 25 May 2022 15:33:12 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N1Ok1-1nieMQ0hgJ-012qN6; Wed, 25 May 2022 21:33:09 +0200
Message-ID: <f4dfb739-18a2-2e3d-5917-6da8c9a5d030@vivier.eu>
Date: Wed, 25 May 2022 21:33:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 16/17] linux-user/strace: Adjust get_thread_area for
 m68k
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220430175342.370628-1-richard.henderson@linaro.org>
 <20220430175342.370628-17-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220430175342.370628-17-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:uYN3CHiIIJ8jrj8VzeCweCjGSBcI4yTOP8KvtU/O2lrSJ0eIxJp
 Pxblx6CLZTcmUXiQ8MeSSfQZ+7YG7DAFNpuREnHDkYnuzOJr4wwz4thod0f7iuZIjxeFGev
 wf0BJs7oNrFEpfdTklBO41K1rxC+DPPO/l4TV8H2IFnIMpS3rjDnR2gzcdpIRzx3hV6vexk
 timATCZ6JwEDJkIXShaIQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+rdWIcN4B5M=:X7LOLStxYvYlUdhCNfiUEI
 phjBNNY/ats7KAQ2jm1qhryZVCqI0fN8op5s1IKE7mOqtlsPkwYP6leO4OhA2d64qYA8hsFMP
 I4ij+0v72BbLsPuqL+zV/hW0VNFLrUt8LjCeDPqYDAg0kCaElbnaPnD+QevT0M+B+whqpI4rD
 Moro63v2GbN8CXxMOHXFDntIma8pCq99qc2nlu2teKZajrvJAPrVprpXtbiPR4c9ubWT6jsnI
 7dPK95XyaKO7Gg3rhdSvxez0IjsGnCip644tt0E0SX9xPoBoy0t2yoTCu0PbSlZItSQu6fpuw
 DF884v32la1CnF09Ld3kHuF90N0ezn9QtVrL0Yf1pCzZfV8rQoAT2plQ5gFV05yy7Mu0fSgnW
 PQQwJ6ZWg1D1RNWEdhlILBBbRH/vuyeYBFfeZNC5fDcuQCBfXJjIKe3nVpJABlqcx6qYcEGcS
 zy5bFQp0FAMgkkY5kiBMjMeiRRAMZRLFeIhXyQ1iO48iubRQKCrDvIyqmGMHPcBEOOhPjQg9j
 mCiGQE8WiSgH0nh81FV2bfkRxUdoniUSQCCOA/P8nVLFh2sXtUtaQcq4WCdBG7qsXTj7Ynrn5
 E/MJ+D+0+zsWQz/5juCEca1uqqCNMw7lPD741/MQyUehiKdgCBszu/jHOh1OYimZfieTsf2HC
 tw6v7fDtQ/F7ec98jpLx3DWYaVc4MjuOvYRLm/h2GipB5jtkrswQk/yzxALfydia6dr/zetQJ
 UbqkGqEFxKD08pmikqUe7MW/8EHHEbpEGD6SBA==
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

Le 30/04/2022 à 19:53, Richard Henderson a écrit :
> Unlike i386, m68k get_thread_area has no arguments.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/strace.list | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/linux-user/strace.list b/linux-user/strace.list
> index 278596acd1..72e17b1acf 100644
> --- a/linux-user/strace.list
> +++ b/linux-user/strace.list
> @@ -384,8 +384,13 @@
>   { TARGET_NR_getsockopt, "getsockopt" , NULL, NULL, NULL },
>   #endif
>   #ifdef TARGET_NR_get_thread_area
> +#if defined(TARGET_I386) && defined(TARGET_ABI32)
>   { TARGET_NR_get_thread_area, "get_thread_area", "%s(0x"TARGET_ABI_FMT_lx")",
>     NULL, NULL },
> +#elif defined(TARGET_M68K)
> +{ TARGET_NR_get_thread_area, "get_thread_area" , "%s()",
> +  NULL, print_syscall_ret_addr },
> +#endif
>   #endif
>   #ifdef TARGET_NR_gettid
>   { TARGET_NR_gettid, "gettid" , "%s()", NULL, NULL },

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

