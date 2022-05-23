Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7186C5315FF
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 22:44:45 +0200 (CEST)
Received: from localhost ([::1]:53094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntEux-0005xa-VS
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 16:44:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ntEt7-0005GD-Rp
 for qemu-devel@nongnu.org; Mon, 23 May 2022 16:42:49 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:60969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ntEt5-0004BF-M3
 for qemu-devel@nongnu.org; Mon, 23 May 2022 16:42:49 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N5G1V-1nl1hx2Opx-011AW0; Mon, 23 May 2022 22:42:44 +0200
Message-ID: <6034ff1e-0f52-e571-8a4a-ed76843f7b39@vivier.eu>
Date: Mon, 23 May 2022 22:42:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2] linux-user/syscall.c: fix build without RLIMIT_RTTIME
Content-Language: fr
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: qemu-devel@nongnu.org
References: <20220523105239.1499162-1-fontaine.fabrice@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220523105239.1499162-1-fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:tnUvmi3MEk7iXqbPCG6616hCUaHPEe93cKhlvStSSL71qZlcYoY
 vEDnGk1PVEgGuZvPm+8dTDNrLL+OTP+/xM7jYfoM8Z3VB1LXHQonjVOayWOYWjic4JuEj7R
 /jZBd4+HyXQdS2RQpUOaD0oYm0PAlEGMTLBjDjSGe7ebQhLH7tbSYq8wIpqvwVRLxVHU1yi
 D37f/Jkk1asvy9Tdu6/Gw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OpqkjjkjnV8=:0N4PIap5f1YEngVWMtW9BX
 J4clNoUS/e/r8JifEDX+wZHJNbbQ8goYDBZ4NI+O3DpSIwWY9+ZrHV8oExFobiouZQf2W0ZQO
 RF2WD85OEjn+EsbEzlgAZKfuWyE4OkQpUHP1f5gbK0SH2qJMLRWmEA65JoR/Dwr8qGZGbpFR7
 Sc1jcMTex2uCSmGjuCSDldBDdUQdKGz6l5lZGRkzykqEo9UmLutRknvMSO3sPP3Mx/kSDnPmg
 VsfU06pLXGE4VVRMkR2pSuOFL9lvjL7i7erAxC0+mSbTxzPQKQzd/kJKUgBpbvExdLeXHtBiX
 jqsIEvPPNrpjp/+tgZuNt0+uM4elqJikeOnxasQdCtLYZj3j2PJtZFQQY2CrqxdVr7jsPxtoR
 fniWnRoIZtK1Hu3k+vbla9cPpaGoW5HdvIOyShMy9GyiId8BSU2fskyUi/KBa5JR3I9RVqKWO
 cQ9GOjsWaBbJLD2SgHwbycJGsjhRVdQJIlfPr6TzHbUPPKnFJF2XoueLFGIh8WWD1bemts6V0
 8Hunf5aPtta8IcDzFTqg6FSjMfUSaH6ub5M6uJuNOx90PzVnYjiD+H4154u908Rq02onibTaW
 ivKxsYD2HTUwbV1dCkGiSm3L8Hsc9XuK+BNaLexkJ7Xu2tFYspCwbVixtL/j72Zot3VFbqTvH
 +MSPDVNCUi8/vsPPLY1NHGPyXLTktjNjDvbQfpAQCRE3H7XWGjvqkCRqHrhVvSbJGEgsSj7DH
 FWkEIBP8Sf9S7GlZZEA8lEDxsoRA3kbdnU7ojg==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Le 23/05/2022 à 12:52, Fabrice Fontaine a écrit :
> RLIMIT_RTTIME is not provided by uclibc-ng or by musl prior to version
> 1.2.0 and
> https://github.com/bminor/musl/commit/2507e7f5312e79620f6337935d0a6c9045ccba09
> resulting in the following build failure since
> https://git.qemu.org/?p=qemu.git;a=commit;h=244fd08323088db73590ff2317dfe86f810b51d7:
> 
> ../linux-user/syscall.c: In function 'target_to_host_resource':
> ../linux-user/syscall.c:1057:16: error: 'RLIMIT_RTTIME' undeclared (first use in this function); did you mean 'RLIMIT_NOFILE'?
>   1057 |         return RLIMIT_RTTIME;
>        |                ^~~~~~~~~~~~~
>        |                RLIMIT_NOFILE
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/22d3b584b704613d030e1ea9e6b709b713e4cc26
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Laurent Vivier):
>   - Use an ifdef block instead of defining RLIMIT_RTTIME
> 
>   linux-user/syscall.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index dd0d92ba4e..488facb356 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -1053,8 +1053,10 @@ static inline int target_to_host_resource(int code)
>           return RLIMIT_RSS;
>       case TARGET_RLIMIT_RTPRIO:
>           return RLIMIT_RTPRIO;
> +#ifdef RLIMIT_RTTIME
>       case TARGET_RLIMIT_RTTIME:
>           return RLIMIT_RTTIME;
> +#endif
>       case TARGET_RLIMIT_SIGPENDING:
>           return RLIMIT_SIGPENDING;
>       case TARGET_RLIMIT_STACK:


Applied to my linux-user-for-7.1 branch.

Thanks,
Laurent

