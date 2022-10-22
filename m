Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD349609771
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 02:17:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omjgj-0006Yf-L2
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 18:43:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1omLmG-0007nK-1c; Sat, 22 Oct 2022 17:11:32 -0400
Received: from mout.kundenserver.de ([212.227.17.10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1omLmE-0007G2-Gf; Sat, 22 Oct 2022 17:11:31 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M58OQ-1olFJK3xLQ-0017jz; Sat, 22 Oct 2022 23:11:19 +0200
Message-ID: <f7119867-2674-d074-5fc5-9b0fa58b6bef@vivier.eu>
Date: Sat, 22 Oct 2022 23:11:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH RESEND] elf2dmp: free memory in failure
Content-Language: fr
To: luzhipeng <luzhipeng@cestc.cn>, qemu-devel <qemu-devel@nongnu.org>
Cc: Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20221007020128.760-1-luzhipeng@cestc.cn>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20221007020128.760-1-luzhipeng@cestc.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:9nUX6QiKlOE2ALsphTTYY6arNzY/rZyYq2NFMtcGqvZ9IDQIyma
 DeoIvXfVull7T5avQLZ327bfcQT6Cipt+7IVb2sC157dL3RCyxyvPL8jvV+ZBBLvoj5kxiv
 Z/SzMwBs1hTqIkQOuf2bGSCyDkEVYmUXxFDYATkL+zZ73aIL8X3Nj5aO7q5HH3eyiU0pfOG
 3shm7kBKm/C5Z/PeODBNw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VKGElcgkXN0=:nBXv+LU6fUyXDUI82Hk0B/
 p4kt63TCIPTqk/ZSTDlArLHOcPzLeWHwK0IJW8VX2Xevco3V1kA8OcBzGSCeDvug0YkgUw+jw
 0n4QbYsdnQ+ulPbV1ll3/NWsAO3XI05IppykeUCk+dBN23laMujsznoi06oWtn03nUmsCWOau
 sDjbWj/7dTgAb21NgShN8aydfMybgznL039gfgIc2uZh7NFXywTfUH/7eOe0gtyGpaZiYyLbn
 x/F4wZ6pXnUETMJStunm0/0iWIaN3NFxIQqIUdqhHO2atrBEsNMmpd4uo0leJBnBvSQPDUJH6
 pQ8JOEEJjxp1vJXYVcsDK33YgGN2qK/TSph2Gcrjo9toY6VFQXcTtUP5JN14S5LIJQe7qRcwH
 69Sr+lEVAronEYnO7m81iNLuA+yN0g3ZqUq/rXoWaqhdN3NRF5sMdwadl2W0MF4CLJcyX70DG
 sgWxN7ILzQCHoe9P/W88rZNAmILdMLBX+mdoQRY0PxIVQmtTCT+5ugH1XMANUnq+HEPcHan5S
 umvSfyo1QZCr8/OtOVCQnenci64UeO7HOpMA+mB0veliObdgC5SVsu0wU4xod8bkMOElpe+ZZ
 hF+FNCm9xRbexYdKn3S9BgoVjG5Zh5+JGORyseJQgI1WAxBz0C2ck5TUDC4FNN57YJ6ADEVkR
 nmqdKvh52GYO57AM37KK18Fh1qvFOoZHh1HdN6o2RDDj0B/mKa69KslZo9gu3r3rk1qFhb2Ts
 Vc699kkS9OL9w1qMI4F3J9GhCvOc15p4J1dH/AC18gi/12WIM4KrmUwWFsEyp4En7NA6PGi6P
 3aimgp0
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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

Le 07/10/2022 à 04:01, luzhipeng a écrit :
> From: lu zhipeng <luzhipeng@cestc.cn>
> 
> The 'kdgb' is allocating memory in get_kdbg(), but it is not freed in
> error path. So fix that.
> 
> Signed-off-by: lu zhipeng <luzhipeng@cestc.cn>
> ---
>   contrib/elf2dmp/main.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/contrib/elf2dmp/main.c b/contrib/elf2dmp/main.c
> index b9fc6d230c..d77b8f98f7 100644
> --- a/contrib/elf2dmp/main.c
> +++ b/contrib/elf2dmp/main.c
> @@ -125,6 +125,7 @@ static KDDEBUGGER_DATA64 *get_kdbg(uint64_t KernBase, struct pdb_reader *pdb,
>   
>       if (va_space_rw(vs, KdDebuggerDataBlock, kdbg, kdbg_hdr.Size, 0)) {
>           eprintf("Failed to extract entire KDBG\n");
> +        free(kdbg);
>           return NULL;
>       }
>   

Applied to my trivial-patches branch.

Thanks,
Laurent


