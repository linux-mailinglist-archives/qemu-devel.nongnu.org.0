Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E70478801
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 10:44:25 +0100 (CET)
Received: from localhost ([::1]:48564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1my9mq-0003vk-SS
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 04:44:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1my9jz-0000qX-EN; Fri, 17 Dec 2021 04:41:27 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:54955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1my9jx-0007Xb-RG; Fri, 17 Dec 2021 04:41:27 -0500
Received: from [192.168.100.1] ([82.142.30.186]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mv2pC-1mgcv93SMK-00r0Fu; Fri, 17 Dec 2021 10:41:19 +0100
Message-ID: <d7ec6d55-1260-cf98-0920-18ac422906ed@vivier.eu>
Date: Fri, 17 Dec 2021 10:41:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH-for-7.0] target/i386/kvm: Replace use of __u32 type
Content-Language: fr
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211116193955.2793171-1-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211116193955.2793171-1-philmd@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:vBDF5a2UX+SM84erX35iC7LViCsu2LwVNTDbx1PonKv7rKdTOb4
 SYHKoNugrTEbmDP5uSdCgNh9Cbi16dQbTKcamCnF65gam+zcDxDxFb2N7Ess0oQAxTwsjOC
 /LCP68IUWPybARi0tVgED1psi7Cf1f9innZvDJpTNF1eJR4LjUtqRvTmCeOwVP3kUzr2+SW
 B6JXZFj81CszLuuBHdilw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:v3mtfSElf64=:XCVfw16ZPaa2Tgk0dqtYGN
 QLCpuU4YjP96qsYWKVzSxbHFAkpVuvGyJyeoQqfK60n2g8ERB0T6SOfB5MHISoRfybPJdFbWI
 db7fugPS5ubaqPrhQio/zZnb+IoZvUN8RyRBUCArIQHBeGL3CoTcKbTakGS1HTH/Lq/2bNGTP
 cj7LT4x6WOvhLdKRWWM9x46H5g1kIqSHLhxScT52RtLNmH/kwqOghdBJm/kFS53fUSfRwSi5w
 IYaASAkTKrfNWacGYC7vEQoztl7Vw7oUzn82gEEpTlQjq8J94iy5mNfLz5+lhW6Iyd6fc9BmO
 JbJKZoiaHCidGhjgup296o6NiYKho1a5NcoKaPoAQLDtj4vsyvIxW1ztcPYyjVycSS6Bmi/EV
 V4x1Bit9tgdgOiQlsC/1OHE3tpebNJqDK9IT5lPb8lFIT+Yl46GVRjsidOsETt1hby/vTXD3I
 sRIEpDaB0VszBfV0X4YMJJuHaOXoBSg=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.716,
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 16/11/2021 à 20:39, Philippe Mathieu-Daudé a écrit :
> QEMU coding style mandates to not use Linux kernel internal
> types for scalars types. Replace __u32 by uint32_t.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   target/i386/kvm/kvm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index 5a698bde19a..13f8e30c2a5 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -1406,7 +1406,7 @@ static int hyperv_fill_cpuids(CPUState *cs,
>       c->edx = cpu->hyperv_limits[2];
>   
>       if (hyperv_feat_enabled(cpu, HYPERV_FEAT_EVMCS)) {
> -        __u32 function;
> +        uint32_t function;
>   
>           /* Create zeroed 0x40000006..0x40000009 leaves */
>           for (function = HV_CPUID_IMPLEMENT_LIMITS + 1;
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

