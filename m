Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C74D492534
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 12:50:22 +0100 (CET)
Received: from localhost ([::1]:38912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9n0C-00042e-J5
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 06:50:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1n9mpD-0000T4-GO; Tue, 18 Jan 2022 06:38:56 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:43115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1n9mp1-00022D-Nw; Tue, 18 Jan 2022 06:38:55 -0500
Received: from [192.168.100.1] ([82.142.13.186]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MOQu6-1mxE1W279a-00PrpH; Tue, 18 Jan 2022 12:38:40 +0100
Message-ID: <e61f50fd-357d-f1af-e80f-40935c759ad2@vivier.eu>
Date: Tue, 18 Jan 2022 12:38:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] linux-user: Fix comment typo in arm cpu_loop code
Content-Language: fr
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220114182535.3804783-1-peter.maydell@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220114182535.3804783-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:k0QbToob8s50EE2jCXEi9JxqtwFrZoEVd8RiDzVK+PWMe5wSpfd
 Il5TbRHxr3IDMbCrOSDagJ85V2kPgcjsKyXGDWZ1SNtzICoOr5NEKL4duRYMloOSRqdqbgS
 4MifeMTyiQamuLKfWKfb3bvLh2W2P8UeCRr2gRIEwVPw4LG4uqfx1odOGh3233OcKAcH3pP
 pJ4hCEUUP26Rmw9oc+DlQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2+0a/QWuVgs=:Wk3k9S1E4yY1rLuCDoXJNu
 UvO/hOp9iymz/dPvvI6Qk0j6Wvd90lcjLUOFFi5yA9fg8sf7mF2NDNN3qXPQVHi660OoWdzof
 ZH3HiNSZ4WKfEd5rJx1hbczmd/+5NybyiuQyjyrFBwqnKq+3jx6Cyn3k47GxKrM8dqawtJoPh
 bqHjrfkWODTcovZrL9cwq5nn2lTZcxr0U/MMRhhgsJfJTZlX3VC0D0ooW0NGg1681RlPuDhuI
 ZLgZNamSTmiVh/CMTv+whAyLI7AXf5v6pk3GgPNglXo0xpmTODD6m9LNeDwoDYE1s0AbvCB6R
 ILGTqnQCCJfJnBEeW8pJiKTSz2LckSU5w/udQHaX0+bRK3GNFjZF/BZlaheTCl+zzFDtYKjJj
 PJ/rcs5XDkcANSGOlMn3TSkjy7g5XBxiLwPFgzzNIwBc7gzs+ApVpV+0Z8gNOUjh8CO8Knuiy
 h5Oajxsr88XvR0t/jVg3fH4iN/48B9IQvQT3IZML6iMBHKK9+F4DJ4uVqAAGzgvQgaHQVIl3I
 OMilNEt4levVb5Vs1Aw71JuiJQJQwsXnynW/Nhm86aOjzgfT2TA43QtEh+f0i7rELY7xdMFK0
 xOFQDM7NeuEngysDGlZO6mxBWoiMob9H5JNsFQdOJqSP4KAVM0SYA4sZ9juL87qrWEtw1i1jo
 oNtxhWqjOLEf4UO5gIVZthsw3lvu7I/sFsmDcNjpWrhBki2iZPJFv5r09v4RNSnnpHRM=
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
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 14/01/2022 à 19:25, Peter Maydell a écrit :
> Fix a typo in a comment in the arm cpu_loop code.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   linux-user/arm/cpu_loop.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
> index f153ab503a8..032e1ffddfb 100644
> --- a/linux-user/arm/cpu_loop.c
> +++ b/linux-user/arm/cpu_loop.c
> @@ -434,8 +434,8 @@ void cpu_loop(CPUARMState *env)
>               case 0x6: /* Access flag fault, level 2 */
>               case 0x9: /* Domain fault, level 1 */
>               case 0xb: /* Domain fault, level 2 */
> -            case 0xd: /* Permision fault, level 1 */
> -            case 0xf: /* Permision fault, level 2 */
> +            case 0xd: /* Permission fault, level 1 */
> +            case 0xf: /* Permission fault, level 2 */
>                   si_signo = TARGET_SIGSEGV;
>                   si_code = TARGET_SEGV_ACCERR;
>                   break;

Applied to my trivial-patches branch.

Thanks,
Laurent

