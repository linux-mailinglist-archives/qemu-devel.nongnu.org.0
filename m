Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AAE3BF020
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 21:18:27 +0200 (CEST)
Received: from localhost ([::1]:34138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1D3z-0000qM-08
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 15:18:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1D2s-0000Ai-V0
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 15:17:18 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:55077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1D2r-0005OQ-HD
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 15:17:18 -0400
Received: from [192.168.100.1] ([82.142.13.34]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mg6i8-1lXtZ63v7W-00haJ9; Wed, 07 Jul 2021 21:17:15 +0200
Subject: Re: [PATCH] linux-user: fill ppid field in /proc/self/stat
To: Andreas Schwab <schwab@suse.de>
References: <mvmwnqnef5g.fsf@suse.de>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <91f3b13d-3652-fc6b-3bee-e2ab5a6faf33@vivier.eu>
Date: Wed, 7 Jul 2021 21:17:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <mvmwnqnef5g.fsf@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:zM0eCTmDa6q4o6DXqrcpuChYE7YDuQ1YocqPLHh11IG3gRIeEx7
 AfC97kKRyV8IdijPp2lQ1FdITvgmmBqtSzc4wye91a4YC4YTR2JjQtHJilBNpNdp82xRcMY
 ZUiGGgxtdwdcAhmZv/kiWtTcqXHWShg+RHjQTHocQVGJG6Fnclw10KPjb4j9WSqPkYeo2D7
 2Ig/kkqAR5wT8NBZPv5qQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gjwbYDN8s4g=:Pay9NMny7MNumvds8J2nXP
 S5pALnPaKk/hCwB61FE7qwbQuitAm4n54Oy+3o4j194d0i9UGNfw809ZlbKlKqpKyO2frcn1F
 8BGdpixbCdVBZ9t0PatlZ7GYG+aUA6VSyrrD6y3ZBnoogpDzwVJfCaNNtxnEAZKquwpxkLIIc
 I2ZdW3RvANsgVDkdDFsUo8S5UM05/lqrUU1Wh26fNiGqk9iq5h0mYc3lmmtHmzB5o4I5mUuFC
 ZC4jtuzEabJhRDEweUkWdiNDf7IorxwyK4QdFxqGpnUo5m6EfscSmQ8QTslDn2wHQZ26UtUit
 ZuvOIC5JBEyRgyjLuk5fs+BsjPk8prYOJQdDeZVrmF/pNhBbFrMtkI6n3OD9GHkbG6qyvawzf
 9AYAtgvtf0wQ9uP0d+0N1BKJqSDEZuBpP4Hk8EgLCMWdEkVpV3itsfmbxjGKRwaaWonicwsX2
 babLEwPMpt9IfcFgXfJfb4k1vEgD5D/P8IXvtKeN/sW+M+fJo9t1TposcU1RY7G4Kj8q5ba8w
 JKN9RT9nCzbSelS5RugiwzJqMNs46q7oDif2ti8ec7R67uuzKQpGksXRu1ALm6AdLGZdKHTM3
 CasPbKtw3fYC3Gbzx01mE2042oLXSASoBamwo3q/5nY9O7KFsHKHBunV0z+0uITTqxfwoDwe/
 3ldAVqrsF19pv5SOirqzLcyJby40viBwtkyyMp0NA6hZs1WGPabHkMvPQrs08FrcWb3pMJRIh
 ZkrGkubcJLX7fs0Nz2scBznp5ZE2goKVKyRPnxonry3jwSjt5MMJl5mCOUXRP26eRyv1l3tep
 KoXOOXdTtoD0yXKwR5smyMbeFuKvUXZx/C9wTdaEYxT1VYf4Z/nt+jqrjSeok7c92+ekuYx
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 21/06/2021 à 11:32, Andreas Schwab a écrit :
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
>  linux-user/syscall.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 974dd46c9a..dababe463c 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -7940,6 +7940,9 @@ static int open_self_stat(void *cpu_env, int fd)
>              gchar *bin = g_strrstr(ts->bprm->argv[0], "/");
>              bin = bin ? bin + 1 : ts->bprm->argv[0];
>              g_string_printf(buf, "(%.15s) ", bin);
> +        } else if (i == 3) {
> +            /* ppid */
> +            g_string_printf(buf, FMT_pid " ", getppid());
>          } else if (i == 27) {
>              /* stack bottom */
>              g_string_printf(buf, TARGET_ABI_FMT_ld " ", ts->info->start_stack);
> 

Applied to my linux-user-for-6.1 branch.

Thanks,
Laurent

