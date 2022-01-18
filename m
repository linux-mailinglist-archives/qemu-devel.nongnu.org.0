Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D40549251C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 12:43:56 +0100 (CET)
Received: from localhost ([::1]:54258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9mu3-0003h6-GW
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 06:43:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1n9ms3-0002Dz-MB; Tue, 18 Jan 2022 06:41:52 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:42249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1n9mrm-0002gF-UC; Tue, 18 Jan 2022 06:41:38 -0500
Received: from [192.168.100.1] ([82.142.13.186]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Ma1wa-1mmjfe1gJw-00Vtzm; Tue, 18 Jan 2022 12:41:18 +0100
Message-ID: <60115bc0-c2d8-e552-60b7-d1f237b387dc@vivier.eu>
Date: Tue, 18 Jan 2022 12:41:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 2/3] linux-user: Rename user_force_sig tracepoint to match
 function name
Content-Language: fr
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
References: <20220114153732.3767229-1-peter.maydell@linaro.org>
 <20220114153732.3767229-3-peter.maydell@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220114153732.3767229-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:yf41rbSbOvcaSx4E3b8sN4je45VTqB4hwLQoKdayz/FFeFWQRhd
 wQQwLtZNvIewL/j6aRqPhqiSNsNsJpHL5p/6bCHOaTXN2nNbj4YMt37U6wkYY6Fb95WmVNn
 bitOdzBnY67Ql5f2bPlth7HJ2aYhnplvK1fRhcOW8+lM+4vOGpvi53gDjqx73W3bAcM1EmH
 k0Hjnz9qtFyzVusup3HKA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xUmb5eTg+M4=:XaPha+8mkkSG4XjC8DXq01
 /KWkp40L4RAtAkI/B+xToVtBavgqxswNxR8Ry9pdUEc0GtVDGf3W+b5dpZFM/grTFve6S2kqK
 U3rU/Yc9Qp32KtWX1F966zt7NWVMBidBHncrH+aKDCIdUsES78aJgpDy3xCI84rM8gxukWqfg
 zKXgJXhzp6mFP8bMCma6KE32iP1LpvAaKWVAF9Bp1OOQPoaLATOX98U55dUvfEmKrNh3mc2kA
 5BjB/FLDM+gN0/FrNiaC/tdU6FiCZHlDcOjUrMw9jm8hJvrqpVsW/HKuJHYyJcXSadt8Z9mfr
 PA5Mu2Of7J05OfSy3oUMtjpVHwzZSrhwoAN+8AORfag7bf7qJqPtmPrVpdlOkmgV6s+VXOIU8
 yct51D7m84KmWZcpCHM2Ff2TSSMTG/hkOgx3WvK/Btuou4nG1kCojutcBmzUeK67oflZAXVg8
 EtjZY4jNSi29cH/c+PXR9jwkMuusamBWl9wswpFfr1IwQ+XgW5qbsKd0oFcpjDfU07x1dvS7Y
 yzJf3jN2h2PZ6V7T4uGE2LbZIU2ZF09LXlI2cg3dz64Rn+FqfUt+qLa5qVXGHR8GJd6MJRDGV
 P6FaLnk7krmpa7LpBW7LxCoFdoek3gN6LSRXDL1vEBfJLstW+cg7P1MkKIQSmw901knvcYlT5
 lq0zLbDgbZa6gHAv0IJ2zFFovX3IGtIbWhjfrf/5NRXsmfOvArCYwDzG7W+LBJ9q6OCk=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 14/01/2022 à 16:37, Peter Maydell a écrit :
> In commit c599d4d6d6e9bfdb64 in 2016 we renamed the old force_sig()
> function to dump_core_and_abort(), but we forgot to rename the
> associated tracepoint.  Rename the tracepoint to to match the
> function it's called from.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   linux-user/signal.c     | 2 +-
>   linux-user/trace-events | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index f813b4f18e4..bfbbeab9ad2 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -734,7 +734,7 @@ static void QEMU_NORETURN dump_core_and_abort(int target_sig)
>       struct sigaction act;
>   
>       host_sig = target_to_host_signal(target_sig);
> -    trace_user_force_sig(env, target_sig, host_sig);
> +    trace_user_dump_core_and_abort(env, target_sig, host_sig);
>       gdb_signalled(env, target_sig);
>   
>       /* dump core if supported by target binary format */
> diff --git a/linux-user/trace-events b/linux-user/trace-events
> index e7d2f54e940..f33717f248a 100644
> --- a/linux-user/trace-events
> +++ b/linux-user/trace-events
> @@ -9,7 +9,7 @@ user_setup_frame(void *env, uint64_t frame_addr) "env=%p frame_addr=0x%"PRIx64
>   user_setup_rt_frame(void *env, uint64_t frame_addr) "env=%p frame_addr=0x%"PRIx64
>   user_do_rt_sigreturn(void *env, uint64_t frame_addr) "env=%p frame_addr=0x%"PRIx64
>   user_do_sigreturn(void *env, uint64_t frame_addr) "env=%p frame_addr=0x%"PRIx64
> -user_force_sig(void *env, int target_sig, int host_sig) "env=%p signal %d (host %d)"
> +user_dump_core_and_abort(void *env, int target_sig, int host_sig) "env=%p signal %d (host %d)"
>   user_handle_signal(void *env, int target_sig) "env=%p signal %d"
>   user_host_signal(void *env, int host_sig, int target_sig) "env=%p signal %d (target %d)"
>   user_queue_signal(void *env, int target_sig) "env=%p signal %d"

Applied to my trivial-patches branch.

Thanks,
Laurent

