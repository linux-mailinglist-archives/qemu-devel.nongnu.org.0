Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EFF4884E0
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 18:12:18 +0100 (CET)
Received: from localhost ([::1]:33016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6FGK-0008Mx-RA
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 12:12:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n6FEk-0006k8-3o
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 12:10:38 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:34381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n6FEi-00034i-Gg
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 12:10:37 -0500
Received: from [192.168.100.1] ([82.142.12.178]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MWSJJ-1mr76h3kWR-00Xvz9; Sat, 08 Jan 2022 18:10:33 +0100
Message-ID: <a1e347c5-e6a5-73b7-12a7-3c7012a349c8@vivier.eu>
Date: Sat, 8 Jan 2022 18:10:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/4] linux-user: Do not special-case NULL for
 PR_GET_PDEATHSIG
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220106225738.103012-1-richard.henderson@linaro.org>
 <20220106225738.103012-2-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220106225738.103012-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:kXfo4WiNVU4BDHwdF5G2RFsXrSGyFa1xoaMQR5NXJUlw8hfjafR
 pCqFzrHIaYUt2l8aCk174V0CB2QGuvfaRoIq60fXuzdhxVqcVyVD+4NxzaqIKrtv+jSvkjf
 h66UNQCqD98aKpFAbRSwo4BpK+UkxTuumwzOV708dFUnxdMp0bRcYsw1fMiI4Fq1TVTYfTQ
 7hBC0vh/9KDyOM83GPBIQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:iVSawLMwguM=:qQ9ovSDA7cKNAJRy4jcmB8
 ZBBvtk9CYgMt0c1PuHTzU1vrit32gCU4cDAOveycDfU/jQm9X1ysmlVUU4SFTRcZXGHZKekgq
 kclkTtFfmUC+jPHfuRuCHEe3hYi0kAe3VLEh3b7m5oSpIe2HgvwDufjzgoLMU7FqerbCXfeWd
 t9lw1uWD8BBz6MoPwAkZzZTwdNY+cDVeAi6iX8xAtaTMYUT7kn5icGxwYCptuJLZNt7o1zvQ7
 zaE2/wD4SRsyTCgIOfGB1YMcx9TZ1UqPwPIi8TwhMQ6uLjH0VLigLUOM8tT9lhp7ILMB7OxAi
 eGrN6o13PAB0dAY4qWMjl8Mc/CmDe01yT+nvK3xgoqUMIevzWmwrfsVCpReekArZFp5MD1N2Z
 xyyrWeT9EnLGK/JCNewVJA56q2xc06yI76ptXzEfNZrzuzWicpiubd4XqbZFXIPF34eGLdwwx
 HzDVgfA7BGDheH3sXP78Bxv0oj0Wmu52FgmXT6gK3taPoS/h0sFPn+B7PcVE4ihLxmH3r/+t/
 4cUChdQffQ6DNgWs35V7aPIjs2S6WdHwHS2SCtUK8z93htkZotofyMBvE3+jraGoYclixQCcw
 x2lbExokBgXvrpVqb7WFjPfDUOMKk079p9C/oTIHWaQBDbZWxklB16tli6MDO7g32xnNKs4Db
 RaXvRvkEo3m3irtsKcrDKUjrv7McRomvmCziiifpfeWUxEjNQN8imWuRrt2NlwOLbagU=
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.199,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Le 06/01/2022 à 23:57, Richard Henderson a écrit :
> The kernel does not special-case arg2 != NULL, so
> neither should we.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/syscall.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index ce9d64896c..e8f9e0643e 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -6444,7 +6444,7 @@ static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
>               int deathsig;
>               ret = get_errno(prctl(PR_GET_PDEATHSIG, &deathsig,
>                                     arg3, arg4, arg5));
> -            if (!is_error(ret) && arg2 && put_user_s32(deathsig, arg2)) {
> +            if (!is_error(ret) && put_user_s32(deathsig, arg2)) {
>                   return -TARGET_EFAULT;
>               }
>               return ret;

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

