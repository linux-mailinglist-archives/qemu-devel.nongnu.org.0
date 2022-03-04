Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 889A94CD868
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 16:59:21 +0100 (CET)
Received: from localhost ([::1]:54274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQAKu-0004jD-Jm
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 10:59:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nQA7y-0005v0-J1; Fri, 04 Mar 2022 10:45:58 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:52439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nQA7w-0000UU-B6; Fri, 04 Mar 2022 10:45:57 -0500
Received: from [192.168.100.1] ([82.142.8.122]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MwQCb-1oIXOh39mP-00sNem; Fri, 04 Mar 2022 16:45:46 +0100
Message-ID: <03d6d27a-bda3-a4c8-058d-10911abbb645@vivier.eu>
Date: Fri, 4 Mar 2022 16:45:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/4] m68k/nios2-semi: fix gettimeofday() result check
Content-Language: fr
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220304152704.3466036-1-marcandre.lureau@redhat.com>
 <20220304152704.3466036-2-marcandre.lureau@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220304152704.3466036-2-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Af1qtoKt69zboJ8BHI1hVNnOq3bIPc2in16fQPni8Dzby+S++pQ
 iA4Z57m/U8p1l5euZGZlskMi3zOb5M5snwdTn0LXAKluZCzJJIrZmiSe+V0BpJbfLx494C7
 ukcJDtjrq6YXcjgZIXTCrM5e8S8quUbMoZbBFsf3UvO3MhOjcyiIIfIrsd1G073WuCEWCJm
 VU0ar/CSsLL3gDWSWuvwQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wr0klVt/ug0=:FeH4DlQQg2fU+Tw+x+0Bg5
 tDaTLlPi5IdOIugfUWiAolf9UKYVtHkY/KZkl75hrrZS7dIDN7IGAoCW0Fpw1lDEc8wUmQPjR
 jL1IXri8psUq44orvKXhUQ74SgNyHD0BlcreGhU+Ep1EgoJ9/1cLnwA/NQb3NIlVmtoBR0gYK
 E6eTkVKMcZyRD6jtMs5Lhsyq2EBpIodJwWq6OmBPCFOxSbre2ft3Efd55SB2zhqs817jMOUrf
 jMNbz6fj31HP3axdp5nIaFFRXkyr6he//3R9F9TgkXNgmHJyQJU7JwMtXsNvlDm7PfVqiKQDw
 Lwj+foBdZU83mUH3NuMC3xvBjyaQYtaCJVUx6tLsrEdWxApluf3CCoj8KbNp+E1Bdil19QRGs
 iBTUG8t1WBaAH/j9Pki6/Nr401U9hrKFMLt7Hf8o+yxI/Ryoz5mZ6b56shmc/fTXgZrxCilE9
 NAk0TqN8cRUWhEUNxPmZAQ+DMbhwBPld/Kn8nT9+hBzgUHw1jZNcAU+eBzCafzDBwWESI61Q7
 u/8rmBy/u+wSd0LiRLiQBE2tT3Ktx6QjwPmCKp15YwLtM4vZSyCvjgX+UqCP5U8+2lNx8xGEq
 t2exGdkMMEPpoEeND0r/D3lsDJ8b3eaAm4gkRbgy4D2XSl+mapRapE4lILX2cfVxrMl/y59dw
 j+annebE9AivA8Cg9B9fBw6Nih0mLVeODtu7x4hgFfl0F7XtXgOmHxG2IjRdf1Vy0twE=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Marek Vasut <marex@denx.de>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Chris Wulff <crwulff@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 04/03/2022 à 16:27, marcandre.lureau@redhat.com a écrit :
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> gettimeofday() returns 0 for success.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   target/m68k/m68k-semi.c   | 2 +-
>   target/nios2/nios2-semi.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/m68k/m68k-semi.c b/target/m68k/m68k-semi.c
> index 44ec7e4612c6..c5c164e096c8 100644
> --- a/target/m68k/m68k-semi.c
> +++ b/target/m68k/m68k-semi.c
> @@ -381,7 +381,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
>               qemu_timeval tv;
>               struct gdb_timeval *p;
>               result = qemu_gettimeofday(&tv);
> -            if (result != 0) {
> +            if (result == 0) {
>                   if (!(p = lock_user(VERIFY_WRITE,
>                                       arg0, sizeof(struct gdb_timeval), 0))) {
>                       /* FIXME - check error code? */
> diff --git a/target/nios2/nios2-semi.c b/target/nios2/nios2-semi.c
> index fe5598bae4d7..5a7ad0c7108d 100644
> --- a/target/nios2/nios2-semi.c
> +++ b/target/nios2/nios2-semi.c
> @@ -403,7 +403,7 @@ void do_nios2_semihosting(CPUNios2State *env)
>               qemu_timeval tv;
>               struct gdb_timeval *p;
>               result = qemu_gettimeofday(&tv);
> -            if (result != 0) {
> +            if (result == 0) {
>                   p = lock_user(VERIFY_WRITE, arg0, sizeof(struct gdb_timeval),
>                                 0);
>                   if (!p) {

It seems to have never worked correctly...

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

